package ru.vlad.springcourse.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ru.vlad.springcourse.dao.BookDAO;
import ru.vlad.springcourse.dao.PersonDAO;
import ru.vlad.springcourse.models.Book;
import ru.vlad.springcourse.models.Person;
import ru.vlad.springcourse.util.BookValidator;
import ru.vlad.springcourse.util.PersonValidator;

@Controller
@RequestMapping("/books")
public class BooksController {
	private final BookDAO bookDAO;
	private final PersonDAO personDAO;
	BookValidator bookValidator;
	
	@Autowired
	public BooksController(BookDAO bookDAO, PersonDAO personDAO, BookValidator bookValidator) {
		super();
		this.bookDAO = bookDAO;
		this.personDAO = personDAO;
		this.bookValidator=bookValidator;
	}
	
	@GetMapping()
	public String index(Model model)
	{
		model.addAttribute("books", bookDAO.index());
		return "books/index";
	}
	
	
	@GetMapping("/{id}")
	public String show(@PathVariable("id")int id, Model model, @ModelAttribute("person")Person person)
	{
		if( bookDAO.show(id)==null) return "redirect:/books"; //making sure that an inexistent book won't be accesed
		model.addAttribute("book", bookDAO.show(id));
		Optional<Person> bookOwner = bookDAO.getBookOwner(id);
		if(bookOwner.isPresent() && bookOwner.get().getId()!=1) // ID 1 in the people table is an instrument to help determinate books with no owners.
		{
			model.addAttribute("owner", bookOwner.get());
		} else
			model.addAttribute("people", personDAO.index());
		return "books/show";
	}
	
	@GetMapping("/new")
	public String newBook(@ModelAttribute("book")Book book, Model model)
	{
		model.addAttribute("people",personDAO.index());
		return "/books/new";
	}
	@PostMapping("/new")
	public String create(@ModelAttribute("book")Book book, BindingResult bindingResult) 
	{
		bookValidator.validate(book, bindingResult);
		if(bindingResult.hasErrors()) return "books/new";
	bookDAO.save(book);
	return "redirect:/books";
	}
	
	@GetMapping("/{id}/edit")
	public String edit(Model model, @ModelAttribute("book")Book book,
			BindingResult bindingResult, @PathVariable("id")int id)
	{
		if( bookDAO.show(id)==null) return "redirect:/books"; //making sure that an inexistent book won't be accesed
		model.addAttribute("book", bookDAO.show(id));
		return "/books/edit";
	}
	
	@PatchMapping("/{id}")
	public String editBook(@PathVariable("id")int id, 
			@ModelAttribute("book")Book book, BindingResult bindingResult)
	{
		if(bindingResult.hasErrors()) return "books/edit";
	bookDAO.update(id,book);
	return "redirect:/books";
	}
	
	@DeleteMapping("/{id}")
	public String deleteBook(@PathVariable("id")int id)
	{
		bookDAO.delete(id);
		return "redirect:/books";
	}
	@PatchMapping("/{id}/release")
	public String release(@PathVariable("id")int id)
	{
		bookDAO.release(id);
		return "redirect:/books";
	}
	
	@PatchMapping("/{id}/assign")
	public String assign(@PathVariable("id")int id, @ModelAttribute("person")Person selectedPerson, @ModelAttribute("book")Book book)
	{
	bookDAO.assign(id,selectedPerson);	
	return "redirect:/people/"+selectedPerson.getId();
	}
	
	
	

}
