﻿///////////////////////////////////////////////////////////////
// This is generated code. 
//////////////////////////////////////////////////////////////
// Code is generated using LLBLGen Pro version: 3.5
// Code is generated on: Friday, December 14, 2012 9:24:18 AM
// Code is generated using templates: SD.TemplateBindings.SharedTemplates.NET20
// Templates vendor: Solutions Design.
// Templates version: 
//////////////////////////////////////////////////////////////
using System;
using LLBL.DAL;
using LLBL.DAL.HelperClasses;
using System.Collections.Generic;
using SD.LLBLGen.Pro.ORMSupportClasses;

namespace LLBL.DAL.FactoryClasses
{
	/// <summary>Generates IEntityFields2 instances for different kind of Entities.</summary>
	public static partial class EntityFieldsFactory
	{
		private static readonly Dictionary<LLBL.DAL.EntityType, string> _entityTypeNamesCache = new Dictionary<LLBL.DAL.EntityType, string>();

		/// <summary>static ctor which initializes the static entity type cache.</summary>
		static EntityFieldsFactory()
		{
			foreach(LLBL.DAL.EntityType value in Enum.GetValues(typeof(LLBL.DAL.EntityType)))
			{
				_entityTypeNamesCache.Add(value, Enum.GetName(typeof(LLBL.DAL.EntityType), value));
			}
		}	

		/// <summary>General factory entrance method which will return an EntityFields2 object with the format generated by the factory specified</summary>
		/// <param name="relatedEntityType">The type of entity the fields are for</param>
		/// <returns>The IEntityFields instance requested</returns>
		public static IEntityFields2 CreateEntityFieldsObject(LLBL.DAL.EntityType relatedEntityType)
		{
			return FieldInfoProviderSingleton.GetInstance().GetEntityFields(InheritanceInfoProviderSingleton.GetInstance(), _entityTypeNamesCache[relatedEntityType]);
		}
		
		/// <summary>General method which will return an array of IEntityFieldCore objects, used by the InheritanceInfoProvider. Only the fields defined in the entity are returned, no inherited fields.</summary>
		/// <param name="entityName">the name of the entity to get the fields for. Example: "CustomerEntity"</param>
		/// <returns>array of IEntityFieldCore fields, defined in the entity with the name specified</returns>
		internal static IEntityFieldCore[] CreateFields(string entityName)
		{
			return FieldInfoProviderSingleton.GetInstance().GetEntityFieldsArray(entityName);
		}

		/// <summary>General factory entrance method which will return a TypedView EntityFields object with the format generated by the factory specified</summary>
		/// <param name="relatedTypedViewType">The type of typed view the fields are for</param>
		/// <returns>The IEntityFields2 instance requested</returns>
		public static IEntityFields2 CreateTypedViewEntityFieldsObject(TypedViewType relatedTypedViewType)
		{
			IEntityFields2 fieldsToReturn=null;
			switch(relatedTypedViewType)
			{
				case TypedViewType.TestPeopleByIdResponseTypedView:
					fieldsToReturn = CreateTestPeopleByIdResponseTypedViewEntityFields();
					break;
				case TypedViewType.TestPeopleResponseTypedView:
					fieldsToReturn = CreateTestPeopleResponseTypedViewEntityFields();
					break;
			}
			return fieldsToReturn;
		}

		/// <summary>Creates a complete EntityFields instance for the TestPeopleByIdResponseEntity.</summary>
		private static IEntityFields2 CreateTestPeopleByIdResponseTypedViewEntityFields()
		{
			IEntityFields2 fieldsToReturn = new EntityFields2((int)TestPeopleByIdResponseFieldIndex.AmountOfFields, null, FieldInfoProviderSingleton.GetInstance().GetFieldIndexes("TestPeopleByIdResponseTypedView"));
			for(int i=0;i<(int)TestPeopleByIdResponseFieldIndex.AmountOfFields;i++)
			{
				fieldsToReturn[i] = EntityFieldFactory.Create((TestPeopleByIdResponseFieldIndex)i);
			}
			return fieldsToReturn;
		}

		/// <summary>Creates a complete EntityFields instance for the TestPeopleResponseEntity.</summary>
		private static IEntityFields2 CreateTestPeopleResponseTypedViewEntityFields()
		{
			IEntityFields2 fieldsToReturn = new EntityFields2((int)TestPeopleResponseFieldIndex.AmountOfFields, null, FieldInfoProviderSingleton.GetInstance().GetFieldIndexes("TestPeopleResponseTypedView"));
			for(int i=0;i<(int)TestPeopleResponseFieldIndex.AmountOfFields;i++)
			{
				fieldsToReturn[i] = EntityFieldFactory.Create((TestPeopleResponseFieldIndex)i);
			}
			return fieldsToReturn;
		}

		#region Included Code

		#endregion
	}
}