using System;
using System.Linq;
using Devart.Data.Linq;
namespace PRUEBA_HAME_API.Services
{
    public class ClientService
    {
       public void getClients()
        {
            using (var context = new MyDataContext())
            {
                // Consulta para obtener todos los clientes
                var customers = from customer in context.Customers
                                select customer;

                // Mostrar los resultados de la consulta
                foreach (var customer in customers)
                {
                    Console.WriteLine($"ID: {customer.CustomerID}, Name: {customer.CustomerName}");
                }
            }
        }
    }
}
