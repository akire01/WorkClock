
using AutoMapper;
using Evidencija_Radnih_Sati.Models.vm;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Evidencija_Radnih_Sati.App_Start
{
    public static class AutoMapperConfig
    {
        public static IMapper Mapper { get; set; }

        public static void Init()
        {
            var config = new MapperConfiguration(c =>
            {
                
                c.CreateMap<GetDjelatnik_Result, DjelatnikVM>();
                c.CreateMap<DjelatnikVM, GetDjelatnik_Result>();

                c.CreateMap<SatiProjekt, SatiProjektVM>();
                c.CreateMap<SatiProjektVM, SatiProjekt>();
            });

            Mapper = config.CreateMapper();
        }
    }
}