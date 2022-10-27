from unittest import TestCase

from xonsh.xontribs import xontribs_load, xontribs_loaded


class TestLoading(TestCase):
    def test_it_loads(self):
        xontribs_load(["shadowenv"])
        assert "shadowenv" in xontribs_loaded()
