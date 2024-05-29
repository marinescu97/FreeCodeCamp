const text = document.getElementById('text-input');
const checkBtn = document.getElementById('check-btn');
const output = document.getElementById('result');

checkBtn.addEventListener('click', function() {
    btnEvent(text.value);
});

const btnEvent = (str) => {
    if(str===''){
        alert('Please input a value');
    } else{
        const newStr = removeNonAlphanumeric(str).toLowerCase();

        input.setAttribute('style', 'height: 10em');
        output.classList.remove('hide');
        
        if(checkPalindrome(newStr)){
            output.innerHTML = `<p><strong>${str}</strong> is a palindrome</p>`
        } else{
            output.innerHTML = `<p>${str} is not a palindrome</p>`;
        }
    }
    clearInput();
}

function removeNonAlphanumeric(str){
    const regex = /[^a-zA-Z0-9]/g;
    return str.replace(regex, '');
}

function checkPalindrome(str){
    const reverseStr = str.split('').reverse().join('');

    return reverseStr === str;
}

function clearInput(){
    text.value = '';
}