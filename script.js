/* Varo — script.js. No dependencies.
   1. Footer year.
   2. Placeholder guard: any "[[BEN:" marker left in the page is a build
      failure. Render it unmissably and shout in the console. */

(function () {
  var year = document.getElementById('year');
  if (year) year.textContent = String(new Date().getFullYear());

  var walker = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT);
  var hits = [];
  var node;
  while ((node = walker.nextNode())) {
    if (node.nodeValue.indexOf('[[BEN:') !== -1) hits.push(node);
  }
  hits.forEach(function (n) {
    var span = document.createElement('span');
    span.className = 'marker';
    span.textContent = n.nodeValue;
    n.parentNode.replaceChild(span, n);
  });
  if (hits.length) {
    console.error('BUILD CHECK FAILED: ' + hits.length + ' [[BEN: ...]] placeholder(s) on the page.');
  }
})();
