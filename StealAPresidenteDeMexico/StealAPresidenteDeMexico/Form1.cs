using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Windows.Forms;

namespace StealAPresidenteDeMexico
{
    public partial class Form1 : Form
    {
        string connectionString = "Server=localhost;Port=3306;Database=stealapresidente;Uid=root;Pwd=1234;";

        public Form1()
        {
            InitializeComponent();
        }

        private void btnCargar_Click(object sender, EventArgs e)
        {
            try
            {
                using (var connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT id, nombre, puntaje FROM usuarios";

                    using (var adapter = new MySqlDataAdapter(query, connection))
                    {
                        DataTable tabla = new DataTable();
                        adapter.Fill(tabla);
                        dataGridView1.DataSource = tabla;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al conectar: " + ex.Message);
            }
        }

        
    }
}
