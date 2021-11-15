

window.addEventListener('load', function () {
        
console.log('Find me in main.js file')

textarea = document.querySelector(".auto_resize_js");
textarea.addEventListener('input', autoResize, false);

function autoResize() {
    this.style.height = 'auto';
    this.style.height = this.scrollHeight + 'px';
}

});
      
