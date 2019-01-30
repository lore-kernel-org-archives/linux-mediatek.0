From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] staging: mt7621-eth/ethtool.c: Correction of SPDX
 license identifier
Date: Wed, 30 Jan 2019 22:12:31 +0100
Message-ID: <20190130211231.GA25919@kroah.com>
References: <SC1P15201MB2014C3E0CAB4DA9ADF330797A8900@SC1P15201MB2014.LAMP152.PROD.OUTLOOK.COM>
 <20190130152956.GA4195@kroah.com>
 <RO1P15201MB201234F951531D13328C4FF2A8900@RO1P15201MB2012.LAMP152.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <RO1P15201MB201234F951531D13328C4FF2A8900@RO1P15201MB2012.LAMP152.PROD.OUTLOOK.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Carlos Henrique Lima Melara <charlesmelara@outlook.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "neil@brown.name" <neil@brown.name>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Wed, Jan 30, 2019 at 08:01:13PM +0000, Carlos Henrique Lima Melara wrote:
> On 30/01/2019 13:29, gregkh@linuxfoundation.org wrote:
> > On Wed, Jan 30, 2019 at 02:48:27PM +0000, Carlos Henrique Lima Melara wrote:
> >> 	This patch fix the checkpatch.p1 warning:
> >>
> >> 	WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
> >> 	+/*
> >
> > Why did you not fix up the indentation that was already mentioned?
> 
> The Warning was about the missing SPDX License Identifier, so I added the 
> identifier according to the "license-rules.rst" for C source that is:

I mean the indentation of the text in your changelog, nothing to do with
the actual change in your patch below, sorry for the confusion.

> >   The SPDX license identifier is added in form of a comment.  The comment
> >   style depends on the file type::
> >
> >      C source:	// SPDX-License-Identifier: <SPDX License Expression>
> >      C header:	/* SPDX-License-Identifier: <SPDX License Expression> */
> >      ASM:	/* SPDX-License-Identifier: <SPDX License Expression> */
> >      scripts:	# SPDX-License-Identifier: <SPDX License Expression>
> >      .rst:	.. SPDX-License-Identifier: <SPDX License Expression>
> >      .dts{i}:	// SPDX-License-Identifier: <SPDX License Expression>
> 
> I think that was the correction needed, right?

Yes.

> Still have a question about the license comment in the "ethtooll.c". 
> 
> > /*   This program is free software; you can redistribute it and/or modify
> >  *   it under the terms of the GNU General Public License as published by
> >  *   the Free Software Foundation; version 2 of the License
> >  *
> >  *   This program is distributed in the hope that it will be useful,
> >  *   but WITHOUT ANY WARRANTY; without even the implied warranty of
> >  *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >  *   GNU General Public License for more details.
> >  *
> >  *   Copyright (C) 2009-2016 John Crispin <blogic@openwrt.org>
> >  *   Copyright (C) 2009-2016 Felix Fietkau <nbd@openwrt.org>
> >  *   Copyright (C) 2013-2016 Michael Lee <igvtee@gmail.com>
> >  */
> 
> It puts 3 spaces between the * and the text, should it be corrected to 
> only one space?

If you really want to, but it's not needed.

All of the "boilerplate" license text can also be removed after the SPDX
line is added, if you want to do that.  But leave the copyright lines,
that needs to stay.

thanks,

greg k-h
