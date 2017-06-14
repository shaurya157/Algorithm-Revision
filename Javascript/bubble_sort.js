const bubble_sort = function(arr) {
  for(let i = 0; i < arr.length; i++){
    for(let j = 0; j < arr.length; j++){
        let temp = arr[i];

        if(arr[i] < arr[j]){
          arr[i] = arr[j];
          arr[j] = temp;
        }
    }
  }

  return arr
}

array = [5,4,4,3,1,24,5,67,9,0]
bubble_sort(array);
