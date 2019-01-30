From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] staging: mt7621-eth/ethtool.c: Correction of SPDX
 license identifier
Date: Wed, 30 Jan 2019 19:10:05 +0100
Message-ID: <20190130181005.GA15653@kroah.com>
References: <SC1P15201MB2014C3E0CAB4DA9ADF330797A8900@SC1P15201MB2014.LAMP152.PROD.OUTLOOK.COM>
 <20190130163817.GF21904@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190130163817.GF21904@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Carlos Henrique Lima Melara <charlesmelara@outlook.com>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "neil@brown.name" <neil@brown.name>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Wed, Jan 30, 2019 at 05:38:17PM +0100, Andrew Lunn wrote:
> On Wed, Jan 30, 2019 at 02:48:27PM +0000, Carlos Henrique Lima Melara wrote:
> > 	This patch fix the checkpatch.p1 warning:
> > 
> > 	WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
> > 	+/*
> > 
> > 	It includes the SPDX expression for GPL-2.0 and corrects the comment format to suit the kernel's coding style.
> > 
> > Signed-off-by: Carlos (Charles) Henrique Lima Melara <charlesmelara@outlook.com>
> > ---
> >  drivers/staging/mt7621-eth/ethtool.c | 22 ++++++++++++----------
> >  1 file changed, 12 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/staging/mt7621-eth/ethtool.c b/drivers/staging/mt7621-eth/ethtool.c
> > index 40a7d47be913..49d417de64c8 100644
> > --- a/drivers/staging/mt7621-eth/ethtool.c
> > +++ b/drivers/staging/mt7621-eth/ethtool.c
> > @@ -1,15 +1,17 @@
> > -/*   This program is free software; you can redistribute it and/or modify
> > - *   it under the terms of the GNU General Public License as published by
> > - *   the Free Software Foundation; version 2 of the License
> > +// SPDX-License-Identifier: GPL-2.0
> 
> Hi Carlos
> 
> drivers/staging/mt7621-eth$ grep LICENSE *
> gsw_mt7621.c:MODULE_LICENSE("GPL");
> mtk_eth_soc.c:MODULE_LICENSE("GPL");
> 
> And include/linux/module.h 
> says:
> 
> /*
>  * The following license idents are currently accepted as indicating free
>  * software modules
>  *
>  *      "GPL"                           [GNU Public License v2 or later]
>  *      "GPL v2"                        [GNU Public License v2]
> 
> So the SPDX string probably does not match the MODULE_LICENSE.

No, ignore the MODULE_LICENSE marking for this, go by what the text at
the top of the file says. See the patch about all of this from Thomas on
lkml yesterday for why this is the case.

So the patch is fine.  If the changelog stuff ever gets fixed...

thanks,

greg k-h
