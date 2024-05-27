/*let pageList = new Array();
let currentPage = 1;
const numberPerPage = 5;
const rows = Array.prototype.slice.call(document.querySelectorAll('tbody tr'));
const firstBtn = document.getElementById('first');
const lastBtn = document.getElementById('last');
const prevBtn = document.getElementById('prev');
const nextBtn = document.getElementById('next');
const numberOfPages = getNumberOfPages();
const pageNumbers = document.getElementById('pageNumbers');

firstBtn.addEventListener('click', firstPage, false);
lastBtn.addEventListener('click', lastPage, false);
prevBtn.addEventListener('click', prevPage, false);
nextBtn.addEventListener('click', nextPage, false);

window.onload = load(numberOfPages);

function getNumberOfPages() {
  return Math.ceil(rows.length / numberPerPage);
}

function generatePageNumbers(pageCount) {
  for (let j = 1; j <= pageCount; j++) {
    const pageNumber = document.createElement('span');
    pageNumber.innerHTML = j;
    pageNumber.classList.add('page-number');
    pageNumbers.appendChild(pageNumber);
    if (j === currentPage) {
      pageNumber.classList.add('active');
    }
    pageNumber.addEventListener('click', jumpToPage, false);
  }
}

function jumpToPage(event) {
  currentPage = event.target.innerHTML;
  loadRows();
  activePageNum(currentPage);
}

function activePageNum(activePage) {
  const pageNumbers = Array.prototype.slice.call(document.querySelectorAll('.page-number'));
  pageNumbers.forEach(function (pageNumber) {
    if (parseInt(pageNumber.innerHTML) === activePage) {
      pageNumber.classList.add('active');
    } else {
      pageNumber.classList.remove('active');
    }
  });
}

function nextPage() {
  currentPage += 1;
  loadRows();
  activePageNum(currentPage);
}

function prevPage() {
  currentPage -= 1;
  loadRows();
  activePageNum(currentPage);
}

function firstPage() {
  currentPage = 1;
  loadRows();
  activePageNum(currentPage);
}

function lastPage() {
  currentPage = numberOfPages;
  loadRows();
  activePageNum(currentPage);
}

function loadRows() {
  const start = (currentPage) * numberPerPage;
  const end = start + numberPerPage;
  for (let i = 0; i < pageList.length; i++) {
    pageList[i].classList.add('hidden');
  }
  pageList = rows.slice(start, end);
  drawRows();
  buttonStates();
}

function drawRows() {
  for (let i = 0; i < pageList.length; i++) {
    pageList[i].classList.remove('hidden');
  }
}

function buttonStates() {
  document.getElementById('next').disabled = currentPage == numberOfPages ? true : false;
  document.getElementById('prev').disabled = currentPage == 1 ? true : false;
  document.getElementById('first').disabled = currentPage == 1 ? true : false;
  document.getElementById('last').disabled = currentPage == numberOfPages ? true : false;
}

function load(pageCount) {
  generatePageNumbers(numberOfPages);
  loadRows();
}*/