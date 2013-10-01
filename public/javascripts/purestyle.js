function postsIn() {
	
	$("#posts").animate({ 
		
		opacity: 0,
		marginTop: "-100px"
	},  0 );
	
	$("#posts").animate({ 
		
		opacity: 1,
		marginTop: "0px"
		
	},  350, 'swing', rightSideIn() );
};

function rightSideIn() {
	
	$("#rightSide").animate({ 
		
		opacity: 0
	},  0 );
	
	$("#rightSide").animate({ 
		
		opacity: 1
		
	},  250 );
}