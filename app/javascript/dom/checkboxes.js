const initSearchCheckboxes = () => {
  document.querySelectorAll(".check-box label").forEach((label) => {
      label.addEventListener('click', (e)=> {
        e.currentTarget.classList.toggle('active')
    })
  })
}

export { initSearchCheckboxes };
