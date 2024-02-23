class Slider {

    imageTypes = ["png", "gif", "webp", "jpg"];
    videoTypes = ["mp4", "webm"];

    data;
    element;
    progressBar;
    template;
    slides = [];
    activeSlide = 0;
    slideDuration;
    slideTimeout;

    constructor(element, template, data, slideDuration = 10000) {
        this.element = document.querySelector(element);
        this.template = document.querySelector(template);
        this.data = data;
        this.slideDuration = slideDuration;
        this.ip = location.host;

        // append slides
        for (let i = 0; i < this.data.length; i++) {
            let slide = this.template.content.cloneNode(true);
            let type = this.getType(i);

            switch (type) {
                // image
                case "image":
                    let img = document.createElement("img");
                    img.src = "./slides/" + this.data[i].image;
                    slide.querySelector(".image").appendChild(img);
                    break;

                case "video":
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
                // let title = slide.querySelector(".description h1");
                // title.textContent = this.data[i].title;
                let description = slide.querySelector(".description");
                description.innerHTML = marked.parse(this.data[i].description);

                let title = document.createElement("h1");
                title.textContent = this.data[i].title;
                description.prepend(title);
            }

            // slide
            this.element.appendChild(slide);

            let slideNode = document.querySelector(element + " .slide:last-child");
            slideNode.id = "slide-" + i;
            slideNode.classList.toggle("no-text", !hasText);
            this.slides.push(slideNode);
        }

        // append progress bar
        let progressBar = document.createElement("div");
        progressBar.classList.add("progressBar");
        this.progressBar = this.element.appendChild(progressBar);
        document.querySelector(":root").style.setProperty("--slide-duration", this.slideDuration / 1000 + "s");


        // observe scroll position
        this.element.onscroll = e => this.onScroll(e);

        // keyboard shortcuts
        document.addEventListener("keydown", (e) => {
            if (e.code === "ArrowLeft" || e.code === "ArrowRight")
                e.preventDefault();
        });
        document.addEventListener("keyup", (e) => {
            if (e.code === "ArrowLeft") this.previous();
            if (e.code === "ArrowRight") this.next();
        });

        // start auto play
        this.startTimeout();
    }

    onScroll(e) {
        let newSlide = Math.round(e.target.scrollLeft / 800);
        if (this.activeSlide != newSlide) {
            this.handleVideoPlayback(this.activeSlide, newSlide);
            this.activeSlide = newSlide;
            this.startTimeout();
        }
    }

    next() {
        // scroll to next slide
        let targetSlide = this.activeSlide >= (this.data.length - 1) ? 0 : this.activeSlide + 1;
        this.element.scrollTo(targetSlide * 800, 0);

        this.handleVideoPlayback(this.activeSlide, targetSlide);

    }

    handleVideoPlayback(oldSlideIndex, newSlideIndex) {

        // stop old video
        if (this.getType(oldSlideIndex) == "video") {
            this.slides[oldSlideIndex].querySelector("video").pause();
        }

        // start new video and timeout
        if (this.getType(newSlideIndex) == "video") {
            let video = this.slides[newSlideIndex].querySelector("video");
            video.currentTime = 0
            video.play();
        }

    }

    previous() {
        let targetSlide = this.activeSlide <= 0 ? (this.data.length - 1) : this.activeSlide - 1
        this.element.scrollTo(targetSlide * 800, 0);

        this.handleVideoPlayback(this.activeSlide, targetSlide);
    }

    startTimeout(timeout = this.slideDuration) {
        clearTimeout(this.slideTimeout);
        this.slideTimeout = setTimeout(() => { this.next(); }, timeout);

        // restart progress animation
        // https://css-tricks.com/restart-css-animation/
        this.progressBar.classList.remove("playing");
        void this.progressBar.offsetWidth;
        this.progressBar.classList.add("playing");
    }

    getType(slideIndex) {
        let type = this.data[slideIndex].image.split('.').pop().toLowerCase();

        if (this.imageTypes.includes(type)) return "image";
        if (this.videoTypes.includes(type)) return "video";

        return false;
    }

}