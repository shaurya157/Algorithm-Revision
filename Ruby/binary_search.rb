def binary_search(arr, target)
  p arr
  return nil if arr.empty?

  mid = arr.length / 2
  return mid if arr[mid] == target

  if arr[mid] < target
    mid + binary_search(arr[mid + 1, arr.length], target) + 1
  else
    binary_search(arr[0, mid - 1], target)
  end
end
