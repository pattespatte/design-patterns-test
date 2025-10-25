// Custom fixes for Just the Docs theme
// This file handles the missing menu button gracefully and fixes null element issues

(function () {
	// Fix the jtd.addEvent function to handle null elements
	if (window.jtd && window.jtd.addEvent) {
		const originalAddEvent = window.jtd.addEvent;
		window.jtd.addEvent = function (el, type, handler) {
			if (!el) {
				console.warn('jtd.addEvent: Element is null, skipping event attachment for', type);
				return;
			}
			if (el.attachEvent) el.attachEvent('on' + type, handler); else el.addEventListener(type, handler);
		};
	}

	// Fix the jtd.removeEvent function to handle null elements
	if (window.jtd && window.jtd.removeEvent) {
		const originalRemoveEvent = window.jtd.removeEvent;
		window.jtd.removeEvent = function (el, type, handler) {
			if (!el) {
				console.warn('jtd.removeEvent: Element is null, skipping event removal for', type);
				return;
			}
			if (el.detachEvent) el.detachEvent('on' + type, handler); else el.removeEventListener(type, handler);
		};
	}

	// Override the initNav function to handle missing menu button
	function initNavFixed() {
		const siteNav = document.getElementById('site-nav');
		const mainHeader = document.getElementById('main-header');
		const menuButton = document.getElementById('menu-button');

		// Only add event listener if menu button exists
		if (menuButton) {
			// Remove any existing event listeners to prevent duplicates
			const newMenuButton = menuButton.cloneNode(true);
			menuButton.parentNode.replaceChild(newMenuButton, menuButton);

			// Add the event listener to the new button
			newMenuButton.addEventListener('click', function (e) {
				e.preventDefault();

				if (newMenuButton.classList.toggle('nav-open')) {
					if (siteNav) siteNav.classList.add('nav-open');
					if (mainHeader) mainHeader.classList.add('nav-open');
					newMenuButton.ariaPressed = true;
					// Add class to body for overlay and prevent scroll
					document.body.classList.add('nav-open');
					document.body.style.overflow = 'hidden';
				} else {
					if (siteNav) siteNav.classList.remove('nav-open');
					if (mainHeader) mainHeader.classList.remove('nav-open');
					newMenuButton.ariaPressed = false;
					// Remove class from body and restore scroll
					document.body.classList.remove('nav-open');
					document.body.style.overflow = '';
				}
			});

			// Close menu when clicking outside on mobile
			document.addEventListener('click', function (e) {
				if (window.innerWidth <= 800 &&
					newMenuButton.classList.contains('nav-open') &&
					!siteNav.contains(e.target) &&
					!newMenuButton.contains(e.target)) {
					newMenuButton.click();
				}
			});

			// Close menu on escape key
			document.addEventListener('keydown', function (e) {
				if (e.key === 'Escape' && newMenuButton.classList.contains('nav-open')) {
					newMenuButton.click();
				}
			});

			// Close menu when clicking outside navigation
			document.addEventListener('click', function (e) {
				if (document.body.classList.contains('nav-open') &&
					!siteNav.contains(e.target) &&
					!newMenuButton.contains(e.target)) {
					newMenuButton.click();
				}
			});
		}
	}

	// Wait for DOM to be ready and then apply our fix
	if (document.readyState === 'loading') {
		document.addEventListener('DOMContentLoaded', initNavFixed);
	} else {
		initNavFixed();
	}
})();
