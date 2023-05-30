local present, gitsigns = pcall(require, "gitsigns")
if not present then
	print("gitsigns is not installed!")
	return
end

gitsigns.setup()
