const n = +document.querySelector("form").dataset.seats;

const checkboxes = document.querySelectorAll("input[type=checkbox]");
checkboxes.forEach((cb) => {
  console.log(cb.checked);
  if (cb.checked === true) {
    document.getElementById(cb.value).classList.toggle("selected");
  }
});

const seats = document.querySelector(".cinema-seats");

seats.addEventListener("click", (e) => {
  checkboxes[e.target.id - 1].checked = !checkboxes[e.target.id - 1].checked;
  e.target.classList.toggle("selected");
});
