local present, surround = pcall(require, "nvim-surround")
if not present then
	print("nvim-surround is not installed!")
	return
end

surround.setup()
