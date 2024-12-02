if (multipass info super-cool-vm)
 then
  echo "The VM already exists"
 else
  echo "🤘 Creating a super cool vm  for you. One moment... 😎"
  multipass launch --name super-cool-vm
  multipass info super-cool-vm
fi
