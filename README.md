A Github Pages template for academic websites. This was forked (then detached) by [Stuart Geiger](https://github.com/staeiou) from the [Minimal Mistakes Jekyll Theme](https://mmistakes.github.io/minimal-mistakes/), which is © 2016 Michael Rose and released under the MIT License. See LICENSE.md.

I think I've got things running smoothly and fixed some major bugs, but feel free to file issues or make pull requests if you want to improve the generic template / theme.

### Note: if you are using this repo and now get a notification about a security vulnerability, delete the Gemfile.lock file. 

# Personal Academic Website

This is my personal academic website, built using the [Academic Pages](https://github.com/academicpages/academicpages.github.io) template.

## Features

- 📝 Blog posts and academic writing
- 📚 Publications listing
- 🎓 Teaching experience
- 💼 Portfolio projects
- 🎓 Talks with interactive map
- 📜 Patents showcase
- 📖 Personal manifesto
- 📊 Medium posts integration

## Local Development

You can run this site locally in two ways:

### Using Docker (Recommended)

1. Install Docker and Docker Compose
2. Run `docker compose up`
3. Visit http://localhost:4000

### Manual Setup

1. Run the bootstrap script:
   ```bash
   chmod +x scripts/bootstrap.sh
   ./scripts/bootstrap.sh
   ```
2. Start the local server:
   ```bash
   bundle exec jekyll serve -l -H localhost
   ```
3. Visit http://localhost:4000

## Adding Content

- **Blog Posts**: Add markdown files to `_posts/`
- **Publications**: Add markdown files to `_publications/`
- **Talks**: Add markdown files to `_talks/` (include latitude/longitude for map)
- **Teaching**: Add markdown files to `_teaching/`
- **Portfolio**: Add markdown files to `_portfolio/`
- **Patents**: Add markdown files to `_patents/`
- **Manifesto**: Add markdown files to `_manifesto/`
- **Medium Posts**: Add markdown files to `_medium_posts/`

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

# Instructions

1. Register a GitHub account if you don't have one and confirm your e-mail (required!)
1. Fork [this repository](https://github.com/academicpages/academicpages.github.io) by clicking the "fork" button in the top right. 
1. Go to the repository's settings (rightmost item in the tabs that start with "Code", should be below "Unwatch"). Rename the repository "[your GitHub username].github.io", which will also be your website's URL.
1. Set site-wide configuration and create content & metadata (see below -- also see [this set of diffs](http://archive.is/3TPas) showing what files were changed to set up [an example site](https://getorg-testacct.github.io) for a user with the username "getorg-testacct")
1. Upload any files (like PDFs, .zip files, etc.) to the files/ directory. They will appear at https://[your GitHub username].github.io/files/example.pdf.  
1. Check status by going to the repository settings, in the "GitHub pages" section
1. (Optional) Use the Jupyter notebooks or python scripts in the `markdown_generator` folder to generate markdown files for publications and talks from a TSV file.

See more info at https://academicpages.github.io/

# Changelog -- bugfixes and enhancements

There is one logistical issue with a ready-to-fork template theme like academic pages that makes it a little tricky to get bug fixes and updates to the core theme. If you fork this repository, customize it, then pull again, you'll probably get merge conflicts. If you want to save your various .yml configuration files and markdown files, you can delete the repository and fork it again. Or you can manually patch. 

To support this, all changes to the underlying code appear as a closed issue with the tag 'code change' -- get the list [here](https://github.com/academicpages/academicpages.github.io/issues?q=is%3Aclosed%20is%3Aissue%20label%3A%22code%20change%22%20). Each issue thread includes a comment linking to the single commit or a diff across multiple commits, so those with forked repositories can easily identify what they need to patch.
