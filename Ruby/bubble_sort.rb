def bubble_sort(arr)
  i = 0
  while i < arr.length
    j = i + 1
    while j < arr.length
      arr[i], arr[j] = arr[j], arr[i] if arr[i] > arr[j]

      j += 1
    end

    i += 1
  end

 arr
end
