ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: publish
publish:
	rm -rf build dist yolo_pyutils.egg-info && python setup.py sdist bdist_wheel && twine upload dist/* && rm -rf build dist yolo_pyutils.egg-info

.PHONY: test
test:
	@${ROOT_DIR}/venv/bin/python ${ROOT_DIR}/pyutils/gen_test_report.py
