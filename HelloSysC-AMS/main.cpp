#include <systemc>
#include <systemc-ams>

using namespace sc_core;

int sc_main(int argc, char* argv[])
{
  sca_tdf::sca_signal<bool> sig1;
  sc_start(10, SC_SEC);
  std::cout<<"Instalacion de SystemC y SystemC-AMS correcta"<<std::endl;
  return 0;
}
