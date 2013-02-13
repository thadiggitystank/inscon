﻿using Enterprise.DAL.Core.Model;
using System.Collections.Generic;

namespace Enterprise.ApiServices.DALServices.Repository
{
    public interface ILookupGroupRepository
    {
        List<LookupGroup> GetAllLookupGroups();
        LookupGroup GetLookupGroupById(int id);
        void DeleteRecord(LookupGroup lookupGroup);
        int SaveRecord(LookupGroup lookupGroup);
    }
}
