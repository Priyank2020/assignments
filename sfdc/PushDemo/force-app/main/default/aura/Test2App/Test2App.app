<aura:application extends="force:slds">
 	<div class="slds-text-heading_large">Distance Calculator</div>
  	<aura:attribute name="From" type="sObject" default="{}"/>
  	<c:customLookup objectAPIName="account" IconName="standard:account" selectedRecord="{!v.From}" label="From Account"/>
  	<aura:attribute name="To" type="sObject" default="{}"/>
  	<c:customLookup objectAPIName="account" IconName="standard:account" selectedRecord="{!v.To}" label="To Account"/>  
	<lightning:button label="Get Distance" onclick="{!c.myAction}"/>
</aura:application>