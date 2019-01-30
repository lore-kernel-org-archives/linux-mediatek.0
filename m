From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] staging: mt7621-eth/ethtool.c: Correction of SPDX
 license identifier
Date: Wed, 30 Jan 2019 16:29:56 +0100
Message-ID: <20190130152956.GA4195@kroah.com>
References: <SC1P15201MB2014C3E0CAB4DA9ADF330797A8900@SC1P15201MB2014.LAMP152.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <SC1P15201MB2014C3E0CAB4DA9ADF330797A8900@SC1P15201MB2014.LAMP152.PROD.OUTLOOK.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Carlos Henrique Lima Melara <charlesmelara@outlook.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "neil@brown.name" <neil@brown.name>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Wed, Jan 30, 2019 at 02:48:27PM +0000, Carlos Henrique Lima Melara wrote:
> 	This patch fix the checkpatch.p1 warning:
> 
> 	WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
> 	+/*

Why did you not fix up the indentation that was already mentioned?

> 	It includes the SPDX expression for GPL-2.0 and corrects the comment format to suit the kernel's coding style.

Always properly line-wrap your comments.

> 
> Signed-off-by: Carlos (Charles) Henrique Lima Melara <charlesmelara@outlook.com>

This needs to match your "From:" line.

thanks,

greg k-h
