let emailRegex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/

function handleSubmit(e) {
    e.preventDefault()
    if (validateForm(e)) {
        window.location.href = "./success.html"
    }
}

function validateForm() {
    let name = document.forms["feedbackForm"]["name"].value
    let address = document.forms["feedbackForm"]["address"].value
    let email = document.forms["feedbackForm"]["email"].value
    let liked = document.getElementsByName("liked")
    let interested = document.getElementsByName("interested")

    // Validate name
    if (name == "") {
        alert("Please enter your name")
        return false
    }

    // Validate address
    if (address == "") {
        alert("Please enter your address")
        return false
    }

    // Validate email
    if (email == "") {
        alert("Please enter your email")
        return false
    } else if (!emailRegex.test(email)) {
        alert("Please enter a valid email address")
        return false
    }

    // Validate liked checkboxes
    let likedChecked = false
    for (let i = 0; i < liked.length; i++) {
        if (liked[i].checked) {
            likedChecked = true
            break
        }
    }
    if (!likedChecked) {
        alert("Please select at least one checkbox for what you liked most")
        return false
    }

    // Validate interested radio buttons
    let interestedChecked = false
    for (let i = 0; i < interested.length; i++) {
        if (interested[i].checked) {
            interestedChecked = true
            break
        }
    }
    if (!interestedChecked) {
        alert("Please select one radio button for how you became interested")
        return false
    }

    // Validation successful
    return true
}
