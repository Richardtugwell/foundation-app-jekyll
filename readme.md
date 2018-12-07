# Foundation For Apps / Jekyll Image Portfolio project

*** PLEASE NOTE THIS CODE IS DEPRECATED. NPM reporting lots of vulnerabilities with gulp dependencies and I haven't had time to fix them so for now I've just removed the package.json dependencies, so the following instructions won't work!!

THIS IS A WORK IN PROGRESS. It's intended as an exploration of integrating Jekyll and Foundation for Apps. It's very much a POC kind of thing.

If you want to play with it.....

## Prerequisites

You'll need:

- [NodeJS](https://nodejs.org/en/) (0.12 or greater)
- [Jekyll](http://jekyllrb.com/)

## Installation

Clone the repo:

```bash
git clone https://github.com/Richardtugwell/foundation-app-jekyll.git projectname
```

Open the folder in your command line, and install the required dependencies:

```bash
cd projectname
npm install
```

Run `gulp` to run Gulp. Your finished site will be created in a folder called `build`, viewable at this URL:

```
http://localhost:8079
```

(PORT can be customised in gulp/config.js )
