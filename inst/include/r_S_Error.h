/*
 * The S Like Error Handling macros extracted from include/R_ext/RS.h
 * in R-4.1.3
 */
/*
 *  R : A Computer Language for Statistical Data Analysis
 *  Copyright (C) 1999-2022 The R Core Team.
 *
 *  This header file is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU Lesser General Public License as published by
 *  the Free Software Foundation; either version 2.1 of the License, or
 *  (at your option) any later version.
 * 
 *  This file is part of R. R is distributed under the terms of the
 *  GNU General Public License, either Version 2, June 1991 or Version 3,
 *  June 2007. See doc/COPYRIGHTS for details of the copyright status of R.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public License
 *  along with this program; if not, a copy is available at
 *  https://www.R-project.org/Licenses/
 */
/* S Like Error Handling */

#include <R_ext/Error.h>	/* for error and warning */

#ifdef STRICT_R_HEADERS
#undef STRICT_R_HEADERS
#endif

// #ifndef STRICT_R_HEADERS
#ifndef PROBLEM

#define R_PROBLEM_BUFSIZE	4096
/* Parentheses added for FC4 with gcc4 and -D_FORTIFY_SOURCE=2 */
#define PROBLEM			{char R_problem_buf[R_PROBLEM_BUFSIZE];(snprintf)(R_problem_buf, R_PROBLEM_BUFSIZE,
#define MESSAGE                 {char R_problem_buf[R_PROBLEM_BUFSIZE];(snprintf)(R_problem_buf, R_PROBLEM_BUFSIZE,
#define ERROR			),Rf_error(R_problem_buf);}
#define RECOVER(x)		),Rf_error(R_problem_buf);}
#define WARNING(x)		),Rf_warning(R_problem_buf);}
#define LOCAL_EVALUATOR		/**/
#define NULL_ENTRY		/**/
#define WARN			WARNING(NULL)

#endif
