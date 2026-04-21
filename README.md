# FAIR Lab Website

This repository contains the source code for the FAIR Lab website, which is built using the Hugo static site generator 
and the PaperMod theme. The website serves as a platform to showcase the research, publications, and members of the 
FAIR Lab. As a static site, it can be easily updated by anyone that knows how to edit Markdown files.

## Running Locally with Hugo (recommended for making edits)

### Prerequisites
- [Hugo](https://gohugo.io/getting-started/installing/)
- [Git](https://git-scm.com/downloads)

### Steps
1. Clone the repository:
    ```bash
    $ git clone https://github.com/lukesell25/FAIR-Lab-Website.git
    $ cd FAIR-Lab-Website
    ```
2. Start the Hugo development server:
    ```bash
    $ hugo server -D
    ...
    Web Server is available at http://localhost:1313/
    ...
    ```
3. Open your web browser and navigate to the url provided in the terminal output (usually `http://localhost:1313/`) to view the website.
4. Make changes to the content or layout as needed. The website will automatically reload to reflect your changes when you save the files.

### Troubleshooting
- If you make a change and it doesn't show up on the website, try clearing your browser cache and refreshing the page.
You can also try running `hugo server --disableFastRender` to disable Hugo's fast render mode, which can sometimes 
cause changes to not show up immediately.
- If you encounter an error when running the Hugo server, check the terminal output for error messages that can help you 
identify the issue. Common issues include syntax errors in markdown files or missing images.
- Note that pages marked as "draft: true" in the front matter of their markdown files will not display when running 
locally unless you include the `-D` flag when starting the Hugo server (e.g., `hugo server -D`). This is useful for 
pages that are still being worked on and aren't ready to be published yet.

## Running Locally with Docker

### Prerequisites
- [Docker](https://www.docker.com/get-started)

### Steps
1. Clone the repository:
    ```bash
    $ git clone https://github.com/lukesell25/FAIR-Lab-Website.git
    $ cd FAIR-Lab-Website
    ```
2. Build the Docker image:
    ```bash
    $ docker build -t fair-lab-website .
    ```
3. Run the Docker container:
    ```bash
    $ docker run -p 80:80 fair-lab-website
    ```
4. Open your web browser and navigate to `http://localhost` to view the website.
5. Make changes to the content or layout as needed. Note that the website will **not automatically reload** with your updates. You will need to stop 
the container and rebuild the image to see them.

## Making Edits
- Please read the [Hugo Getting Started Guide](https://gohugo.io/getting-started/) before making edits to familiarize 
yourself with how Hugo works.
    - Template files are provided so you can get a feel for how to structure markdown files and front matter, but you 
    can deviate from these templates as needed.
- Pages are just [markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#links) files located in the 
`content` directory.
    - Some pages just point to a single markdown file (e.g., the "About" page points to `content/about.md`).
    - Other pages are sections that point to a directory of markdown files (e.g., the "Faculty" page points to 
    `content/faculty/`, which contains a markdown file for each faculty member).
    - Not all markdown features are supported by Hugo. For example, images must be added using the `figure` shortcode 
    rather than standard markdown image syntax. See the 
    [Hugo documentation on shortcodes](https://gohugo.io/content-management/shortcodes/) for more details. Hugo also 
    provides [custom Markdown features](https://gohugo.io/content-management/formats/).
    - Each page has a ["front matter"](https://gohugo.io/content-management/front-matter/) section at the top of the 
    markdown file that controls various settings for that page, such as the title, date, and whether the page is a draft.
- Images should be added to the `static/images/` directory and can be referenced in markdown files using the `/images/` 
path.
- Default layouts and styling are provided by the PaperMod theme, but these can be overridden by adding files with the 
same name to the `layouts` and `assets/css` directories. For example, the `layouts/section/faculty.html` file overrides 
the default layout for the faculty section to display faculty members in a grid rather than a list, and the 
`assets/css/extended/custom.css` file adds custom CSS to style the faculty grid and make other tweaks to the appearance 
of the site (like changing the color scheme).
- The `hugo.yaml` file controls site-wide settings, including the menu bar at the top of the page. It also controls what 
displays on the homepage.
- For more information on how to customize the site, see the [Hugo documentation](https://gohugo.io/documentation/).
- For more information on how to customize the PaperMod theme, see the 
[PaperMod documentation](https://github.com/adityatelange/hugo-PaperMod/wiki)
- If you want to make a change but aren't sure how, feel free to reach out to Luke (luke.s@ardentinc.com) for help.

## Deploying with Docker
1. Edit the `Dockerfile` to change the `BASE_URL` argument to the URL where the site will be hosted (e.g., `https://fairlab.com/`), and then run:
    ```bash
    $ docker build -t fair-lab-website .
    ```
   Alternatively, you can leave `Dockerfile` alone and set the `BASE_URL` in the build command:
    ```bash
    $ docker build --build-arg BASE_URL=https://fairlab.com/ -t fair-lab-website .
    ```
2.
    ```bash
    $ docker run -p 80:80 fair-lab-website
    ```


