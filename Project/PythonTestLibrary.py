from robot.libraries.BuiltIn import BuiltIn
from robot.api.deco import keyword

class PythonTestLibrary:

    @keyword(name='Set Throughput')
    def set_throughput(self, _latency, _download_throughput, _upload_throughput):
        selenium = BuiltIn().get_library_instance('SeleniumLibrary')
        selenium.driver.set_network_conditions(latency=int(_latency), download_throughput=int(_download_throughput), upload_throughput=int(_upload_throughput))