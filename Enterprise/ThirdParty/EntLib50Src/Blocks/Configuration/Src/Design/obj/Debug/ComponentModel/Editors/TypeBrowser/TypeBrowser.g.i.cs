﻿#pragma checksum "..\..\..\..\..\ComponentModel\Editors\TypeBrowser\TypeBrowser.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "15EB7689F642596E9B3D3711C7F4D7D8"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.17929
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using Microsoft.Practices.EnterpriseLibrary.Configuration.Design.ComponentModel.Editors;
using Microsoft.Practices.EnterpriseLibrary.Configuration.Design.Converters;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Forms.Integration;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace Microsoft.Practices.EnterpriseLibrary.Configuration.Design.ComponentModel.Editors {
    
    
    /// <summary>
    /// TypeBrowser
    /// </summary>
    public partial class TypeBrowser : System.Windows.Window, System.Windows.Markup.IComponentConnector, System.Windows.Markup.IStyleConnector {
        
        
        #line 10 "..\..\..\..\..\ComponentModel\Editors\TypeBrowser\TypeBrowser.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal Microsoft.Practices.EnterpriseLibrary.Configuration.Design.ComponentModel.Editors.TypeBrowser Browser;
        
        #line default
        #line hidden
        
        
        #line 19 "..\..\..\..\..\ComponentModel\Editors\TypeBrowser\TypeBrowser.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button AddFromGac;
        
        #line default
        #line hidden
        
        
        #line 29 "..\..\..\..\..\ComponentModel\Editors\TypeBrowser\TypeBrowser.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button AddFromFile;
        
        #line default
        #line hidden
        
        
        #line 40 "..\..\..\..\..\ComponentModel\Editors\TypeBrowser\TypeBrowser.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button Cancel;
        
        #line default
        #line hidden
        
        
        #line 48 "..\..\..\..\..\ComponentModel\Editors\TypeBrowser\TypeBrowser.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button Ok;
        
        #line default
        #line hidden
        
        
        #line 63 "..\..\..\..\..\ComponentModel\Editors\TypeBrowser\TypeBrowser.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TypeName;
        
        #line default
        #line hidden
        
        
        #line 77 "..\..\..\..\..\ComponentModel\Editors\TypeBrowser\TypeBrowser.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TreeView TypesTree;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/Microsoft.Practices.EnterpriseLibrary.Configuration.DesignTime;component/compone" +
                    "ntmodel/editors/typebrowser/typebrowser.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\..\..\ComponentModel\Editors\TypeBrowser\TypeBrowser.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.Browser = ((Microsoft.Practices.EnterpriseLibrary.Configuration.Design.ComponentModel.Editors.TypeBrowser)(target));
            return;
            case 2:
            this.AddFromGac = ((System.Windows.Controls.Button)(target));
            
            #line 22 "..\..\..\..\..\ComponentModel\Editors\TypeBrowser\TypeBrowser.xaml"
            this.AddFromGac.Click += new System.Windows.RoutedEventHandler(this.AddFromGac_Click);
            
            #line default
            #line hidden
            return;
            case 3:
            this.AddFromFile = ((System.Windows.Controls.Button)(target));
            
            #line 33 "..\..\..\..\..\ComponentModel\Editors\TypeBrowser\TypeBrowser.xaml"
            this.AddFromFile.Click += new System.Windows.RoutedEventHandler(this.AddFromFile_Click);
            
            #line default
            #line hidden
            return;
            case 4:
            this.Cancel = ((System.Windows.Controls.Button)(target));
            return;
            case 5:
            this.Ok = ((System.Windows.Controls.Button)(target));
            
            #line 54 "..\..\..\..\..\ComponentModel\Editors\TypeBrowser\TypeBrowser.xaml"
            this.Ok.Click += new System.Windows.RoutedEventHandler(this.Ok_Click);
            
            #line default
            #line hidden
            return;
            case 6:
            this.TypeName = ((System.Windows.Controls.TextBox)(target));
            return;
            case 7:
            this.TypesTree = ((System.Windows.Controls.TreeView)(target));
            return;
            }
            this._contentLoaded = true;
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        void System.Windows.Markup.IStyleConnector.Connect(int connectionId, object target) {
            System.Windows.EventSetter eventSetter;
            switch (connectionId)
            {
            case 8:
            eventSetter = new System.Windows.EventSetter();
            eventSetter.Event = System.Windows.Controls.Control.MouseDoubleClickEvent;
            
            #line 92 "..\..\..\..\..\ComponentModel\Editors\TypeBrowser\TypeBrowser.xaml"
            eventSetter.Handler = new System.Windows.Input.MouseButtonEventHandler(this.TypesTree_MouseDoubleClick);
            
            #line default
            #line hidden
            ((System.Windows.Style)(target)).Setters.Add(eventSetter);
            break;
            }
        }
    }
}
