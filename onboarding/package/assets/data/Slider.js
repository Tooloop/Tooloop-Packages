class Slider {

    element;
    slides;
    template;
    data;
    activeSlide = 0;
    slideDuration;
    autoplayInterval;
    ip;

    constructor(element, template, data, slideDuration = 10000) {
        this.element = document.querySelector(element);
        this.template = document.querySelector(template);
        this.data = data;
        this.slideDuration = slideDuration;
        this.ip = location.host;

        // append slides
        for (let i = 0; i < this.data.length; i++) {
            let slide = this.template.content.cloneNode(true);
            let type = this.data[i].image.split('.').pop().toLowerCase();

            switch (type) {
                // image
                case "png":
                case "jpg":
                case "webp":
                case "gif":
                    let img = document.createElement("img");
                    img.src = this.data[i].image;
                    slide.querySelector(".image").appendChild(img);
                    break;

                case "mp4":
                case "webm":
                    let video = document.createElement("video");
                    video.autoplay = true;
                    video.loop = true;
                    video.muted = true;
                    video.src = "./slides/" + this.data[i].image;
                    slide.querySelector(".image").appendChild(video);
                    break;

                default:
                    break;
            }

            // texts
            let hasText = this.data[i].title || this.data[i].description;
            if (hasText) {
                let title = slide.querySelector(".description h1");
                let description = slide.querySelector(".description p");
                title.textContent = this.data[i].title;
                description.textContent = this.data[i].description;
            }

            // slide
            let newslide = this.element.appendChild(slide);
            let slideNode = document.querySelector(element + " .slide:last-child");
            slideNode.id = "slide-" + i;
            slideNode.classList.toggle("no-text", !hasText);
        }

        // observe scroll position
        this.element.onscroll = e => this.onScroll(e);

        // start auto play
        this.autoplayInterval = setInterval(() => { this.next(); }, this.slideDuration);
    }

    onScroll(e) {
        this.activeSlide = Math.round(e.target.scrollLeft / 640);
    }

    next() {
        let targetSlide = this.activeSlide >= (this.data.length - 1) ? 0 : this.activeSlide + 1;
        this.element.scrollTo(targetSlide * 640, 0);
    }

    previous() {
        let targetSlide = this.activeSlide <= 0 ? (this.data.length - 1) : this.activeSlide - 1
        this.element.scrollTo(targetSlide * 640, 0);
    }

    stop() {
        clearInterval(this.autoplayInterval);
    }

}