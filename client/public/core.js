let listener = () => {
    const header = document.createElement('header');
    header.innerHTML = '<h1>My Site Header</h1>';
    document.body.prepend(header);

    const footer = document.createElement('footer');
    footer.innerHTML = '<p>© 2025 My Site Footer</p>';
    document.body.appendChild(footer);
};
document.addEventListener('DOMContentLoaded', listener);
