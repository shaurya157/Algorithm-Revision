const binary_search = (arr, target) => {
  mid = Math.round(arr.length / 2);

  if(arr.length == 0){
    return null;
  } else if (arr[mid] == target) {
    return mid;
  } else if (arr[mid] > target) {
    return binary_search(arr.slice(0, mid), target);
  } else {
    return mid + 1 + binary_search(arr.slice(mid + 1), target)
  }
};

console.log(binary_search([1,2,3,4,5,6,7], 5))
console.log(binary_search([1,2,3,4,5,6,7], 1))
console.log(binary_search([1,2,3,4,5,6,7], 7))
console.log(binary_search([1,2,3,4,5,6,7], 8))
