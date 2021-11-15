using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WordGamePuzzle
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnNext_Click(object sender, EventArgs e)
        {
            //gender_id gender_name
            //        1   Male
            //        2   Female
            //        3   Other
            //        4   NotDisclosed
            if (Page.IsValid)
            {
                if (rdbMale.Checked)
                {

                    Session["gender_id"] = "1";
                }
                else if (rdbFemale.Checked)
                {
                    Session["gender_id"] = "2";

                }
                else if (rdbOther.Checked)
                {
                    Session["gender_id"] = "3";
                }
                else if (rdbNotDisclosed.Checked)
                {
                    Session["gender_id"] = "4";
                }
                else
                {
                    Response.Write("You must select at least one of the gender options");
                }

                //eth_id eth_name
                //1   African - American
                //2   White
                //3   Asian
                //4   American Indian or Alaska Native
                //5   Native Hawain or Pacific Islander
                //6   Other
                //7   NotDisclosed

                if (rdbAfricanAmerican.Checked)
                {
                    Session["eth_id"] = "1";
                }
                else if (rdbWhite.Checked)
                {
                    Session["eth_id"] = "2";
                }
                else if (rdbAsian.Checked)
                {
                    Session["eth_id"] = "3";
                }
                else if (rdbAmericanIndian.Checked)
                {
                    Session["eth_id"] = "4";
                }
                else if (rdbNativeHawaiian.Checked)
                {
                    Session["eth_id"] = "5";
                }
                else if (rdbOtherRace.Checked)
                {
                    Session["eth_id"] = "6";
                }
                else if (rdbRaceNotDisclosed.Checked)
                {
                    Session["eth_id"] = "7";
                }
                else
                {

                    Response.Write("You must select at least one of the race option");
                }
                Response.Redirect("Question1.aspx");
            }
        }

        protected void cvgenderValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (rdbMale.Checked || rdbFemale.Checked || rdbOther.Checked || rdbNotDisclosed.Checked)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void cvRaceValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if(rdbAfricanAmerican.Checked || rdbWhite.Checked || rdbAsian.Checked || rdbAmericanIndian.Checked ||
                rdbNativeHawaiian.Checked || rdbOtherRace.Checked || rdbRaceNotDisclosed.Checked)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
    
}