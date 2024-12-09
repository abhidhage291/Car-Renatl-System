
package com.infosys.carRentalSystem.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.infosys.carRentalSystem.bean.Car;
import com.infosys.carRentalSystem.bean.CarBooking;
import com.infosys.carRentalSystem.bean.CarVariant;
import com.infosys.carRentalSystem.bean.Customer;
import com.infosys.carRentalSystem.bean.Transaction;
import com.infosys.carRentalSystem.dao.CarBookingDao;
import com.infosys.carRentalSystem.dao.CarDao;
import com.infosys.carRentalSystem.dao.CarUserRepository;
import com.infosys.carRentalSystem.dao.CarVariantDao;
import com.infosys.carRentalSystem.dao.CustomerDao;
import com.infosys.carRentalSystem.dao.TransactionDao;
import com.infosys.carRentalSystem.exception.CustomerLicenceException;
import com.infosys.carRentalSystem.exception.CustomerStatusException;
import com.infosys.carRentalSystem.service.CarUserService;
import com.infosys.carRentalSystem.service.CustomerService;

@Controller
@ControllerAdvice
public class CarRentController {
	@Autowired
	private CarVariantDao carVariantDao;
	
	@Autowired
	private CarDao carDao;
	
	@Autowired
	private CustomerDao customerDao;
	
	@Autowired
	private CarUserService service;
	
	@Autowired
	private CarUserRepository repository;
	
	@Autowired
	private CustomerService custService;
	
	@Autowired
    private CarBookingDao carBookingDao;
	
    @Autowired
    private TransactionDao transactionDao;
	
  @GetMapping("/variantAdd")
  public ModelAndView showVariantEntryPage() {
	  String newId=carVariantDao.generateVariantId();
	  CarVariant variant=new CarVariant(newId);
	  ModelAndView mv=new ModelAndView("variantEntryPage");
	 mv.addObject("variantRecord",variant);
	 return mv;
  }
  @PostMapping("/variantAdd")
  public ModelAndView saveVariant(@ModelAttribute("variantRecord")CarVariant variant) {
	  carVariantDao.save(variant);
	  return new ModelAndView("redirect:/index");
  }
  @GetMapping("/variantReport")
  public ModelAndView showVariantReportPage() {
	  List<CarVariant> variantList=carVariantDao.findAll();
	  ModelAndView mv=new ModelAndView("variantReportPage");
	  mv.addObject("variantList",variantList);
		 return mv;
  }
  @GetMapping("/carAdd")
  public ModelAndView showCarEntryPage() {
	  Car car=new Car();
	  List<String> variantIdList=carVariantDao.getAllVariantIds();
	  ModelAndView mv=new ModelAndView("carEntryPage");
	  mv.addObject("carRecord",car);
	  mv.addObject("variantIdList",variantIdList);
	  return mv;
  }
  @PostMapping("/carAdd")
  public ModelAndView saveCar(@ModelAttribute("carRecord")Car car) {
	  carDao.save(car);
	  return new ModelAndView("redirect:/index");
  }
  @GetMapping("/customerAdd")
  public ModelAndView showCustomerEntryPage() {
	 String username=service.getUserName();
	 String email=service.getEmail();
	 Customer customer=new Customer(username,email);
	  ModelAndView mv=new ModelAndView("customerEntryPage");
	  mv.addObject("customerRecord",customer);
	 
	  return mv;
  }
  @PostMapping("/customerAdd")
  public ModelAndView save(@ModelAttribute("customerRecord")Customer customer) {
	  customerDao.save(customer);
	  return new ModelAndView("redirect:/index");
  }
  @GetMapping("/customerReport")
  public ModelAndView showCustomerReportPage() {
	 List<Customer> customerList=customerDao.findAll();
	  ModelAndView mv=new ModelAndView("customerReportPage");
	  mv.addObject("customerList",customerList);
	 
	  return mv;
  }
  @GetMapping("/singleCustomerReport")
  public ModelAndView showSingleCustomerReportPage() {
	 String username=service.getUserName();
	 Customer customer=customerDao.findById(username);
	  ModelAndView mv=new ModelAndView("singleCustomerReportPage");
	  mv.addObject("customer",customer);
	  return mv;
  }
  @GetMapping("/variantDeletion/{id}")
  public ModelAndView deleteVariant(@PathVariable String id) {
	  carVariantDao.deleteVariantById(id);
	  return new ModelAndView("redirect:/variantReport");
  }
  
  @GetMapping("/carReport")
  public ModelAndView showCarReportPage () {
  String role=service.getRole();
  String page="";
  if(role.equalsIgnoreCase("Admin"))
  page="carReportPageAdmin";
  else if (role.equalsIgnoreCase("Customer"))
  page="carReportPageCustomer";
  
  List<Car> carList=carDao.findAll();
  List<CarVariant> variantList=carVariantDao.findAll();
  Map<String, CarVariant> variantMap=new HashMap<>();
  for (CarVariant cv:variantList) { 
	  variantMap.put(cv.getVariantId(), cv);
   }
   ModelAndView mv= new ModelAndView(page); 
   mv.addObject("carList", carList);
   mv.addObject("variantMap", variantMap);
   return mv;
  }
  @GetMapping("/carDeletion/{id}")
  public ModelAndView deleteCar (@PathVariable String id) { 
	  carDao.deleteCarById(id); 
	  return new ModelAndView("redirect:/carReport");
  }
  @GetMapping("/carUpdate/{id}")
  public ModelAndView showCarUpdatePage (@PathVariable String id) { 
	  Car car=carDao.findById(id);
	  ModelAndView mv=new ModelAndView("carUpdatePage");
	  mv.addObject("carRecord",car);
	  return mv;
  }
  @PostMapping("/carUpdate")
  public ModelAndView saveCarUpdatePage (@ModelAttribute("carRecord")Car car) { 
	  carDao.save(car);
	  return new ModelAndView("redirect:/carReport");
  }
  @GetMapping("/customerUpdate/{id}")
  public ModelAndView showCustomerUpdatePage (@PathVariable String id) {
  String role=service.getRole();
  String page="";
  if(role.equalsIgnoreCase("Admin"))
  page="customerUpdatePage1";
  else if (role.equalsIgnoreCase("Customer"))
  page="customerUpdatePage2";
  Customer customer=customerDao.findById(id);
  ModelAndView mv= new ModelAndView(page); 
  mv.addObject("customerRecord", customer);
   return mv;
  }
  @PostMapping("/customerUpdate")
  public ModelAndView updateCustomer (@ModelAttribute("customerRecord")Customer customer) { 
	  String role=service.getRole();
	  String page="";
	  if(role.equalsIgnoreCase("Admin"))
		  page="redirect:/customerReport";
	  else if (role.equalsIgnoreCase("Customer"))
		  page="redirect:/singleCustomerReport";
	  customerDao.save(customer);
	  return new ModelAndView(page);
  }
  @GetMapping("/customerDelete/{id}")
  public ModelAndView deleteCustomer (@PathVariable String id) { 
	  customerDao.deleteCustomerById(id); 
	  repository.deleteById(id);
	  return new ModelAndView("redirect:/customerReport");
  }
  
  @GetMapping("/customerCarReport")
  public ModelAndView showCustomerCarReportPage() {
	  String username=service.getUserName();
	  boolean status=customerDao.getCustomerStatusByUsername(username);
	  if(!status)
		  throw new CustomerStatusException();
	  String licenceExpiryDate=customerDao.getLicenceExpiryDate(username);
	  if(!custService.validateCustomerLicenceDate(licenceExpiryDate))
		  throw new CustomerLicenceException();
	  List<Car> carList=carDao.getAvailableCars();
	  List <CarVariant> variantList=carVariantDao.findAll();
	  Map<String,CarVariant> variantMap=new HashMap<>();
	  for(CarVariant cv: variantList) {
		  variantMap.put(cv.getVariantId(),cv);
	  }
	  ModelAndView mv=new ModelAndView("carReportPageCustomer");
	  mv.addObject("carList",carList);
	  mv.addObject("variantMap", variantMap);
	  return mv;
  }
  
  @ExceptionHandler(CustomerStatusException.class)
  public ModelAndView handleCustomerStatusException(CustomerStatusException exception)
  {
	  String message="Sorry Dear Customer, Need to complete last booking & payment procedures";
	  ModelAndView mv=new ModelAndView("carBookingErrorPage");
	  mv.addObject("errorMessage",message);
	  return mv;
  }
  @ExceptionHandler(CustomerLicenceException.class)
  public ModelAndView handleCustoomerLicenceException(CustomerLicenceException exception)
  {
	  String message="Sorry Dear Customer, Need to renew your Licence";
	  ModelAndView mv=new ModelAndView("carBookingErrorPage");
	  mv.addObject("errorMessage",message);
	  return mv;
  }
	 
  @GetMapping("/newBooking/{carNumber}")
  public ModelAndView showNewBookingPage(@PathVariable String carNumber) {
      // Validate status of the customer before proceeding for booking
      String username = service.getUserName();

      boolean status = customerDao.getCustomerStatusByUsername(username);
      if(!status) throw new CustomerStatusException();

      String licenceExpiryDate = customerDao.getLicenceExpiryDate(username);
      if(!custService.validateCustomerLicenceDate(licenceExpiryDate))
          throw new CustomerLicenceException();

      // Booking
      CarBooking carBooking = new CarBooking();
      carBooking.setBookingId(carBookingDao.generateBookingId());
      carBooking.setCarNumber(carNumber);
      Double rentRate = carDao.findById(carNumber).getRentRate();
      carBooking.setUsername(service.getUserName());

      ModelAndView mv = new ModelAndView("bookingPage");
      mv.addObject("carBooking", carBooking);
      mv.addObject("rentRate", rentRate);
      return mv;
  }
  @PostMapping("/createBooking")
  public ModelAndView createBookingAndRedirectToPaymentPage(@ModelAttribute("carBooking") CarBooking carBooking) {
      System.out.println(carBooking.getBookingId());
      System.out.println(carBooking.getCarNumber());
     

      Double rentRate = carDao.findById(carBooking.getCarNumber()).getRentRate();
     

      long days = calculateDaysBetween(carBooking.getFromDate(), carBooking.getToDate());
      

      carBooking.setTotalPayment(rentRate * days);
      

      carBooking.setStatus("P");
      carBooking.setAdvancePayment(0.0);
      carBooking.setPendingPayment(carBooking.getTotalPayment());

      Customer customer = customerDao.findById(service.getUserName());
      carBooking.setLicense(customer.getLicense());
      carBooking.setVariantId(carDao.findById(carBooking.getCarNumber()).getVariantId());

      carBookingDao.save(carBooking);
      return new ModelAndView("redirect:/makePayment/" + carBooking.getBookingId());
  }
  
  @GetMapping("/bookingReport")
  public ModelAndView showBookingReport() {
      String username = service.getUserName();
      String role = service.getRole();
      String page = role.equalsIgnoreCase("ADMIN")
              ? "bookingReportAdmin" : "bookingReportCustomer";
      ModelAndView mv = new ModelAndView(page);

      if (role.equalsIgnoreCase("ADMIN")) {
          List<CarBooking> allBookings = carBookingDao.findAll();
          mv.addObject("bookings", allBookings);
      } else {
          List<CarBooking> userBookings = carBookingDao.findAllByUsername(username);
          mv.addObject("bookings", userBookings);
      }
      return mv;
  }
  
  @GetMapping("/bookingReport/{bookingId}")
  public ModelAndView showBookingDetails(@PathVariable String bookingId) {
      
      String role = service.getRole();
     

      CarBooking carBooking = carBookingDao.findById(bookingId);
     


      String page = role.equalsIgnoreCase("ADMIN")
              ? "bookingDetailAdmin" : "bookingDetailCustomer";
      ModelAndView mv = new ModelAndView(page);
     


      CarVariant variant = carVariantDao.findById(carBooking.getVariantId());
      

      Car car = carDao.findById(carBooking.getCarNumber());
      

      List<Transaction> transactions = transactionDao.findAllByBookingId(bookingId);
      mv.addObject("booking", carBooking);
      mv.addObject("variant", variant);
      mv.addObject("car", car);
      mv.addObject("transactions", transactions);
      

      return mv;
  }
  
  
  private long calculateDaysBetween(String fromDate, String toDate) {
      DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
      LocalDate start = LocalDate.parse(fromDate, formatter);
      LocalDate end = LocalDate.parse(toDate, formatter);
      return ChronoUnit.DAYS.between(start, end);
  }
}