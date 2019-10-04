#include <systemc>

using namespace sc_core;

int sc_main(int argc, char* argv[])
{
  sc_start(10, SC_SEC);
  std::cout<<"Instalacion de SystemC correcta"<<std::endl;
  return 0;
}
