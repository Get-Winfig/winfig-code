document.addEventListener('DOMContentLoaded', function () {
    const checkElement = setInterval(() => {
        const commandDialog = document.querySelector('.quick-input-widget');
        if (commandDialog) {
            // Check if the command palette element is visible for the first time.
            if (commandDialog.style.display !== 'none') {
                applyBlur();
            }
            observeCommandDialog(commandDialog);
            clearInterval(checkElement);
        }
    }, 500); // Check every 0.5s

    function observeCommandDialog(commandDialog) {
        const observer = new MutationObserver(() => {
            if (commandDialog.style.display !== 'none') {
                applyBlur();
            } else {
                removeBlur();
            }
        });

        observer.observe(commandDialog, { attributes: true });
    }

    function applyBlur() {
        const targetDiv = document.querySelector('.monaco-workbench .part.editor>.content');
        let blurElement = document.getElementById('bg-blur');

        if (!blurElement) {
            blurElement = document.createElement('div');
            blurElement.setAttribute('id', 'bg-blur');
            blurElement.addEventListener('click', removeBlur);
            targetDiv.appendChild(blurElement);
        }
    }

    function removeBlur() {
        const blurElement = document.getElementById('bg-blur');
        if (blurElement) {
            blurElement.remove();
        }
    }
});

document.addEventListener('DOMContentLoaded', () => {
    const statusBar = document.querySelector('.part.statusbar .statusbar-items');
    if (statusBar) {
        const clockItem = document.createElement('div');
        clockItem.classList.add('statusbar-item', 'right');
        clockItem.style.marginRight = '12px';
        statusBar.appendChild(clockItem);

        setInterval(() => {
            const now = new Date();
            clockItem.textContent = now.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
        }, 1000);
    }
});
