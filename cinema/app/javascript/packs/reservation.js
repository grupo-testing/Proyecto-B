const n = +document.querySelector("form").dataset.seats;

const checkboxes = document.querySelectorAll("input[type=checkbox]");
checkboxes.forEach((cb) => {
  if (cb.disabled === true) {
    document.getElementById(cb.value).classList.toggle("taken");
  }
});

const seats = document.querySelector(".cinema-seats");

seats.addEventListener("click", (e) => {
  console.log(checkboxes[e.target.id - 1].disabled);
  if (checkboxes[e.target.id - 1].disabled) {
    return;
  }
  for (let i = 0; i < n; i++) {
    if (
      !checkboxes[e.target.id - 1] ||
      checkboxes[e.target.id - 1 + i].disabled ||
      ((e.target.id - 1 + i) % 12 === 0 && (e.target.id - 1) % 12 !== 0)
    ) {
      return;
    }
  }
  clearSeats();
  let box = e.target;
  for (let i = 0; i < n; i++) {
    checkboxes[e.target.id - 1 + i].checked =
      !checkboxes[e.target.id - 1 + i].checked;
    box.classList.toggle("selected");
    box = box.nextElementSibling;
  }
});

function clearSeats() {
  checkboxes.forEach((cb) => (cb.checked = false));
  Array.from(document.querySelectorAll("div.box.selected")).forEach((el) => {
    el.classList.toggle("selected");
  });
}
