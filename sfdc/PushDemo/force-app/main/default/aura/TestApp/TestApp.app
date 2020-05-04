<aura:application extends="force:slds">
 <aura:attribute name="From" type="sObject" default="{}" />
 <c:MultiSelectLookup objectName="Account" fieldName="Name" label="From_Account" iconName="standard:account" placeholder="From Account"/>
 <aura:attribute name="To" type="sObject" default="{}" />
 <c:MultiSelectLookup objectName="Account" fieldName="Name" label="To_Account" iconName="standard:account" placeholder="To Account"/> 
 <!-- here c: is org. namespace prefix-->
    
 <!--<lightning:select aura:id="propStatus" name="propStatus" label="Distance Metrics">
      <option value="Distance Metrics">KM</option>
      <option value="Distance Metrics">MILES</option>
 </lightning:select>
    <lightning:button value="Save" label="Get Distance" onClick="{!c.doClick}"/>-->
</aura:application>