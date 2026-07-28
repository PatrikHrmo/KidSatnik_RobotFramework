*** Settings ***
Variables    ../Core/Private/user_credentials.py


*** Variables ***
#Main
${Clothes_MainContainer}=    xpath=//*[@data-testid="dashboard-main-content"]
${ClothesPanel}=    ${Clothes_MainContainer}//*[@data-testid="clothes-panel"]
${ClothesPanel_Header}=    ${ClothesPanel}//h2
${ClothesPanel_AddItem}=    ${ClothesPanel}//button[contains(normalize-space(), "Add item")]

@{Clothes_Main_Elements}=    ${ClothesPanel}
...    ${ClothesPanel_Header}
...    ${ClothesPanel_AddItem}

#Table
${ClothesTable}=    ${Clothes_MainContainer}//*[@class="table"]
${ClothesTable_Headers}=    ${ClothesTable}//thead
${ClothesTable_Rows}=    ${ClothesTable}//tbody
${ClothesTable_Headers_Name}=    ${ClothesTable_Headers}//*[contains(text(), "Name")]
${ClothesTable_Headers_Description}=    ${ClothesTable_Headers}//*[contains(text(), "Description")]
${ClothesTable_Headers_Photo}=    ${ClothesTable_Headers}//*[contains(text(), "Photo")]
${ClothesTable_Headers_Owner}=    ${ClothesTable_Headers}//*[contains(text(), "Owner")]
${ClothesTable_Headers_Location}=    ${ClothesTable_Headers}//*[contains(text(), "Location")]

@{Clothes_TableView_Elements}=    ${ClothesTable_Headers_Name}
...    ${ClothesTable_Headers_Description}
...    ${ClothesTable_Headers_Photo}
...    ${ClothesTable_Headers_Owner}
...    ${ClothesTable_Headers_Location}

#Add Item Popup
${AddItem_ModalBox}=    xpath=//*[@id="add-clothing-modal"]//*[contains(@class, "modal-box")]
${AddItem_Header}=    ${AddItem_ModalBox}//*[contains(text(), "Add item")]
${AddItem_NameLabel}=    ${AddItem_ModalBox}//label[text()="Name"]
${AddItem_NameInput}=    ${AddItem_NameLabel}/ancestor::div[1]//input
${AddItem_DescriptionLabel}=    ${AddItem_ModalBox}//label[text()="Description"]
${AddItem_DescriptionInput}=    ${AddItem_DescriptionLabel}/ancestor::div[1]//textarea
${AddItem_PhotoLabel}=    ${AddItem_ModalBox}//label[text()="Photo"]
${AddItem_PhotoInput}=    ${AddItem_PhotoLabel}/ancestor::div[1]//input
${AddItem_WhichKidLabel}=    ${AddItem_ModalBox}//label[text()="Which kid?"]
${AddItem_WhichKidInput}=    ${AddItem_WhichKidLabel}/ancestor::div[1]//select
${AddItem_WhereLabel}=    ${AddItem_ModalBox}//label[text()="Where?"]
${AddItem_WhereInput}=    ${AddItem_WhereLabel}/ancestor::div[1]//select
${AddItem_SaveBtn}=    ${AddItem_ModalBox}//button[contains(text(), "Save")]

@{Clothes_AddItemView_Elements}=    ${AddItem_Header}
...    ${AddItem_NameLabel}
...    ${AddItem_NameInput}
...    ${AddItem_DescriptionLabel}
...    ${AddItem_DescriptionInput}
...    ${AddItem_PhotoLabel}
...    ${AddItem_PhotoInput}
...    ${AddItem_WhichKidLabel}
...    ${AddItem_WhichKidInput}
...    ${AddItem_WhereLabel}
...    ${AddItem_WhereInput}
...    ${AddItem_SaveBtn}

&{some_item_data}=    name=JOFOFJ
...    description=somedescripton
...    photo=${EXECDIR}/Resources/TestData/test.jpg
...    owner=Daisy
...    location=${UserStaff}[username]
