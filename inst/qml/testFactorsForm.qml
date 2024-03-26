//
// Copyright (C) 2013-2019 University of Amsterdam
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public
// License along with this program.  If not, see
// <http://www.gnu.org/licenses/>.
//
import QtQuick
import JASP.Controls
import "./common"

Form
{
	Section
	{
		title: "Nested Factors Form"

		ExplanationText
		{
			text:
			"This tests the Factors Form with nested features: the n+1th model should get all the variables in the nth model.<br>" +
			"The variables that are already in the nth model should be disabled and unmovable in the n+1th model.<br>" +
			"It is also possible to move variables via drag and drop directly between the models.<br>" +
			"If a variable is moved from a nth to an n+ith model, the variable should be removed to all variable list below n+ith model, and the variable should become enabled in the n+ith model.<br>" +
			"If a variable is moded from a n+ith model to a nth model, the variable should be added enabled to the nth model, and it should become disabled to all models above.<br>" +
			"In this example, the interaction between variables are allowed. Also all selected variables should be added automatically to the Model 1.<br>" +
			"The minmum numbers of models is set to 2, so the 'Remove model button should be disabled when only 2 models are present.<br>" +
			"The nested feature can be dynamically disactivated by unchecking the 'Nested' checkbox: in this case all varaibles become automatically enabled and movable. Also the nested constraints are removed." +
			"If the Nested checkbox is set again, the constraints are applied again, and the models get the necessary variables."
		}

		VariablesForm
		{
			AvailableVariablesList
			{
				title: "Available variables"
				name: "availableVariables"
			}
			AssignedVariablesList
			{
				title: "Selected variables"
				name: "variables"
			}
		}

		FactorsForm
		{
			id:					factors
			name:				"nestedFactors"
			allowAll:			true
			nested:				nested.checked
			allowInteraction:	true
			initNumberFactors:	2
			baseName:			"model"
			baseTitle:			"Model"
			availableVariablesList.source:		"variables"
			startIndex:			0
			availableVariablesListName: "availableFactors"
		}

		CheckBox
		{
			id:			nested
			label:		"Nested"
			name:		"nested"
			checked:	true
		}
	}

	Section
	{
		title: "Simple Factors Form"

		ExplanationText
		{
			text:
			"This tests the simple Factors Form without nested features as in the CFA analysis.<br>" +
			"Here the minimum number of Variables List is 1. The title names start by 'Factor 1'.<br>" +
			"There is no interaction possibility between the variables."
		}

		FactorsForm
		{
			name: "factors"
			initNumberFactors: 1
			allowAll: true
		}
	}

}
