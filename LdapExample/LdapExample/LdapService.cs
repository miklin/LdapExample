using System.Collections.Generic;
using System.DirectoryServices;
using System.IO;
using System.Text;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace LdapExample
{
    public class LdapService
    {
        public static List<User> GetUsers(string path, string userName, string password, string filter, string namePath, string surnamePath, string descriptionPath, string guidPath, string photoPath)
        {
            DirectoryEntry entry;
            if (!string.IsNullOrEmpty(userName))
                entry = new DirectoryEntry(path, userName, password);
            else
                entry=new DirectoryEntry(path);
            using (entry)
            {
                using (var search = new DirectorySearcher(entry))
                {
                    try
                    {
                        search.Filter = filter;
                        SearchResultCollection searchResults = search.FindAll();

                        var result = new List<User>();

                        foreach (var r in searchResults)
                        {
                            var sr = r as SearchResult;
                            if (sr == null)
                                continue;

                            var nameResult = sr.Properties[namePath];
                            var name = nameResult.Count > 0
                                ? nameResult[0].ToString()
                                : string.Empty;

                            var surnamenameResult = sr.Properties[surnamePath];
                            var surname = surnamenameResult.Count > 0
                                ? surnamenameResult[0].ToString()
                                : string.Empty;

                            var descriptionResult = sr.Properties[descriptionPath];
                            var description = descriptionResult.Count > 0
                                ? descriptionResult[0].ToString()
                                : string.Empty;

                            var guidResult = sr.Properties[guidPath];
                            var guid = guidResult.Count > 0
                                ? ByteArrayToString((byte[])guidResult[0])
                                : string.Empty;

                            var photo = new BitmapImage();
                            var photoResult = sr.Properties[photoPath];
                            if (photoResult.Count > 0 && photoResult[0] is byte[])
                            {
                                photo = ToImage((byte[]) photoResult[0]);
                            }

                            result.Add(new User
                                       {
                                           Name = name,
                                           Surname = surname,
                                           Description = description,
                                           Guid = guid,
                                           Photo = photo
                                       });
                        }
                        return result;
                    }
                    catch
                    {
                        return new List<User>();
                    }
                }
            }
        }

        public static string ByteArrayToString(byte[] ba)
        {
            try
            {
                StringBuilder hex = new StringBuilder(ba.Length * 2);
                foreach (byte b in ba)
                    hex.AppendFormat("{0:x2}", b);
                return hex.ToString();
            }
            catch
            {
                return string.Empty;
            }
        }

        public static BitmapImage ToImage(byte[] array)
        {
            using (var ms = new MemoryStream(array))
            {
                var image = new BitmapImage();
                image.BeginInit();
                image.CacheOption = BitmapCacheOption.OnLoad;
                image.StreamSource = ms;
                image.EndInit();
                return image;
            }
        }
    }

    public class User
    {
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Description { get; set; }
        public string Guid { get; set; }
        public ImageSource Photo { get; set; }
    }
}
