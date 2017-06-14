const mergeSort = function(array) {
  if (array.length < 2) {
      return array;
    } else {
      const middle = Math.floor(array.length / 2);
      const left = mergeSort(array.slice(0, middle));
      const right = mergeSort(array.slice(middle));

      return merge(left, right);
    }
}

const merge = function(left, right){
  const merged = []
  while(left.length > 0 && right.length > 0){
    let nextItem = (left[0] < right[0]) ? left.shift() : right.shift();
    merged.push(nextItem)
  }

  return merged.concat(left, right)
}

let array = [5,4,3,2,1]
console.log(mergeSort(array))
