Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7D4C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 08:29:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66A7523359
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 08:29:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tlrzr6cU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66A7523359
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Tufqkn1RSfZqAZahzyAJG47bR5CTYllO0CmH5qV3RB8=; b=Tlrzr6cUxB7NI2lO07zDj8DkG
	omJoddecJ6a82nPUzWIszbT23wh0RPh4l1ttPv1ZX1UH/XKVVlKggs2JH9kB1BazenmNgB+elcdHw
	SCmJCBbASfc63FR8aLa2NhjxAB65Zsq+BMhTui1g6PENhKZNW8uxV8tapHbjlM/hR9AWYX3BL5fFP
	FOWv5599VVqqH7I4eaRTcVxhAIJ1bqonUxlYog60mXx8d42wyV4koKA6fPBq0f+V1LIyN+LoP8dPd
	EM3ZoKDhFbiiSCKdRl39HAd8kingqlT8qy+WK+19Qe/Buo3RfR/mEdXH5Km+O4V/niwrFHjCp/Bre
	WXlVfevyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jppAa-0005T6-3i; Mon, 29 Jun 2020 08:29:40 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jppAW-0005Rv-AN; Mon, 29 Jun 2020 08:29:37 +0000
IronPort-SDR: +lbNKcZzobmjUfBpM+AKveMKO2TAdiwpUcrXcCsrSoqlDgEV7T9sFLTZkkd3dMaDSMqOmuPBu+
 lR2iJ3Hyswyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="144120983"
X-IronPort-AV: E=Sophos;i="5.75,294,1589266800"; d="scan'208";a="144120983"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2020 01:29:33 -0700
IronPort-SDR: Yje5pJtHisKCnMm9oaXwD3WOMepqsjCYESgdEHBWDtl9I+QL0Q7N0Oz6cvmmd8a5TR8Zpr/IjD
 nBi8NdHXLoTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,294,1589266800"; d="scan'208";a="480704639"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga005.fm.intel.com with ESMTP; 29 Jun 2020 01:29:26 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jppAN-00Gcni-K1; Mon, 29 Jun 2020 11:29:27 +0300
Date: Mon, 29 Jun 2020 11:29:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4] tty: serial: don't do termios for BTIF
Message-ID: <20200629082927.GA3703480@smile.fi.intel.com>
References: <78efa2b1e2599deff4d838b05b4054ec5ac2976a.1592595601.git.sean.wang@mediatek.com>
 <20200627141222.GC1901451@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200627141222.GC1901451@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, heikki.krogerus@linux.intel.com,
 david@lechnology.com, arnd@arndb.de, linux-serial@vger.kernel.org,
 Steven Liu <steven.liu@mediatek.com>, jan.kiszka@siemens.com,
 sean.wang@mediatek.com, hpeter@gmail.com, linux-kernel@vger.kernel.org,
 tthayer@opensource.altera.com, Ryder Lee <ryder.lee@mediatek.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, joel@jms.id.au,
 p.zabel@pengutronix.de, jslaby@suse.com, matthias.bgg@gmail.com,
 robert.jarzmik@free.fr, linux-arm-kernel@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Jun 27, 2020 at 04:12:22PM +0200, Greg KH wrote:
> On Sat, Jun 20, 2020 at 03:59:14AM +0800, sean.wang@mediatek.com wrote:
> > From: Sean Wang <sean.wang@mediatek.com>
> > 
> > Bluetooth Interface (BTIF) is designed dedicatedly for MediaTek SOC with
> > BT in order to be instead of the UART interface between BT module and Host
> > CPU, and not exported to user space to access.
> > 
> > As the UART design, BTIF will be an APB slave and can transmit or receive
> > data by MCU access, but doesn't provide termios function like baudrate and
> > flow control setup.
> > 
> > Even LCR on offset 0xC that is just a FAKELCR
> > a. If FAKELCR[7] is equaled to 1, RBR(0x00), THR(0x00), IER(0x04)
> >    will not be readable/writable.
> > 
> > b. If FAKELCR is equaled to 0xBF, RBR(0x00), THR(0x00), IER(0x04),
> >    IIR(0x08), and LSR(0x14) will not be readable/writable.
> > 
> > So adding a new capability 'UART_CAP_NTIO' for the unusual unsupported
> > case.
> > 
> > The bluetooth driver would use BTIF device as a serdev. So the termios
> > still function would be called in kernelspace from ttyport_open in
> > drivers/tty/serdev/serdev-ttyprt.c.

> > +#define UART_CAP_NTIO	(1 << 18)	/* UART doesn't do termios */
> 
> Naming is hard.  I will never remember what "NTIO" is, how about we make
> it explicit:
> 	define UART_CAP_IGNORE_TERMIOS
> 
> And the _CAP_ name is getting out of hand, this isn't a "capability",
> it's a "quirk for this port" but that's a battle to worry about later...

For quirks we have a separate field in struct uart_port. Perhaps that can be used?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
