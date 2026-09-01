.PHONY: render copy ship

render:
	rendercv render Jesse_Rhoads_CV.yaml && open rendercv_output/Jesse_Rhoads_CV.pdf
copy:
	cp rendercv_output/Jesse_Rhoads_CV.pdf ~/Documents/Jesse_Rhoads_Resume_$$(date +%Y%m%d).pdf
ship:
	scp rendercv_output/Jesse_Rhoads_CV.html dh:jesse/resume.html && scp rendercv_output/Jesse_Rhoads_CV.pdf dh:jesse/resume.pdf
