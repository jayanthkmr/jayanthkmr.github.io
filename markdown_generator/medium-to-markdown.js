const mediumToMarkdown = require('medium-to-markdown');
 
// Enter url here
mediumToMarkdown.convertFromUrl('https://blog.jaykmr.com/principles-for-systems-optimization-61226f140fca')
.then(function (markdown) {
  console.log(markdown); //=> Markdown content of medium post
});
