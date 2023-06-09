Class {
	#name : #TBBlogTest,
	#superclass : #TestCase,
	#instVars : [
		'blog',
		'post',
		'first'
	],
	#category : #'TinyBlog-Test'
}

{ #category : #running }
TBBlogTest >> setUp [ 
blog:= TBBlog current.
blog removeAllPosts.

first := TBPost title: 'A title' text: 'A text' category: 'First Category'.
blog writeBlogPost: first.

post:= (TBPost title: 'Another title' text: 'Another text' category: 'Second Category') beVisible 
]

{ #category : #running }
TBBlogTest >> tearDown [ 
TBBlog reset
]

{ #category : #running }
TBBlogTest >> testAddBlogPost [
blog writeBlogPost: post.
self assert: blog size equals: 2.
]

{ #category : #running }
TBBlogTest >> testAllBlogPosts [
blog writeBlogPost: post.
self assert: blog allBlogPosts size equals: 2
]

{ #category : #running }
TBBlogTest >> testAllBlogPostsFromCategory [
self assert: (blog allBlogPostsFromCategory: 'First Category') size equals: 1
]

{ #category : #running }
TBBlogTest >> testAllCategories [
blog writeBlogPost: post.
self assert: blog allCategories size equals: 2
]

{ #category : #running }
TBBlogTest >> testAllVisibleBlogPosts [
blog writeBlogPost: post.
self assert: blog allVisiblePosts size equals: 1
]

{ #category : #running }
TBBlogTest >> testAllVisibleBlogPostsFromCategory [
blog writeBlogPost: post.
self assert: (blog allVisiblePostsFromCategory: 'First Category') size equals: 0.
self assert: (blog allVisiblePostsFromCategory: 'Second Category') size equals: 1
]

{ #category : #running }
TBBlogTest >> testRemoveAllBlogPosts [
blog removeAllPosts.
self assert: blog size equals: 0
]

{ #category : #running }
TBBlogTest >> testSize [ 
self assert: blog size equals: 1
]

{ #category : #running }
TBBlogTest >> testUnclassifiedBlogPosts [
self assert: (blog allBlogPosts select: [ :p | p isUnclassified ]) size equals: 0
]
