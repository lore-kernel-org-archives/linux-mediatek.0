Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1D3C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 08:47:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B98C20884
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 08:47:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oMBS4EPA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B98C20884
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zeL3EvkLMZxvPV5Xi+FL89PTCwPB6aDHsAmc/8XDfpU=; b=oMBS4EPAe9opZ3E3YInDCcY1Q
	O03JY+EViGVCAbNZ+vMZT9Ek82aqyLyB9bVhIExNUNB07XAFaLcdLtr9/SIcC+WANJBg8RZl2g5Mo
	gpwgxluOH5uuSmSf1xKfJnnpb3YyvRs4v7Eh2rjKqSg/7a2MzhcZfXjzztsFNOlaiziMBoi0wkdhZ
	vFVQmBrZ+oxpEiZDZfJ9e6NoABzVTAUwqSTM7el9nYQy0EFYEEkzuz7oBH9zGUJ/5YVdm8jcNzEAL
	IF6NzT20uPJGdtmmFHnhIVOv9xyDUa01HtJKFa0V7/dRDhN3BmKuKMhHYcq5UFlM1VEVB6M7IB2cV
	VsH5SNm4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqus4-0003wX-3t; Thu, 02 Jul 2020 08:47:04 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqus1-0003ul-BA
 for linux-mediatek@lists.infradead.org; Thu, 02 Jul 2020 08:47:02 +0000
IronPort-SDR: PCREOy79OJrZy25peY5elYYEwtVvcDCsTXAtkT+mWXtV9jUBIc8FkvrnTM9U5cPE0qXT6fpF/r
 W+wyaidbEEwg==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="208350651"
X-IronPort-AV: E=Sophos;i="5.75,303,1589266800"; d="scan'208";a="208350651"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 01:46:57 -0700
IronPort-SDR: 8v773znlm029UZL/qcOa676PS5qX3eVR1JOuEsIfC/o5+P9qUYXJro3MDuwBkXM9lWFBy+Zfy4
 emMN3tj3kZLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,303,1589266800"; d="scan'208";a="455443914"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga005.jf.intel.com with ESMTP; 02 Jul 2020 01:46:53 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jqurt-00HAon-VD; Thu, 02 Jul 2020 11:46:53 +0300
Date: Thu, 2 Jul 2020 11:46:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v2 0/1] Revert "serial: 8250: Fix max baud limit in
 generic 8250 port"
Message-ID: <20200702084653.GG3703480@smile.fi.intel.com>
References: <20200701211337.3027448-1-danielwinkler@google.com>
 <20200701223713.gavale4aramu3xnb@mobilestation>
 <20200702041152.e5csvbodojzwnagx@wunner.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702041152.e5csvbodojzwnagx@wunner.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_044701_679997_74EB2684 
X-CRM114-Status: GOOD (  16.88  )
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
Cc: chromeos-bluetooth-upstreaming
 <chromeos-bluetooth-upstreaming@chromium.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 BlueZ <linux-bluetooth@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org, linux-serial@vger.kernel.org,
 Daniel Winkler <danielwinkler@google.com>, abhishekpandit@chromium.org,
 Aaron Sierra <asierra@xes-inc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 02, 2020 at 06:11:52AM +0200, Lukas Wunner wrote:
> On Thu, Jul 02, 2020 at 01:37:13AM +0300, Serge Semin wrote:
> > 1) Add a new capability like UART_CAP_NO16DIV and take it into account
> >    in the serial8250_get_baud_rate() method.
> >  
> > I don't have a documentation for the Mediatek UART port, but it seems to me
> > that that controller calculates the baud rate differently from the standard
> > 8250 port. A standard 8250 port does that by the next formulae:
> >   baud = uartclk / (16 * divisor).
> > While it seems to me that the Mediatek port uses the formulae like:
> >   baud = uartclk / divisor. (Please, correct me if I'm wrong)
> 
> 8250_bcm2835aux.c seems to suffer from a similar issue and
> solves it like this in the ->probe hook:
> 
> 	/* the HW-clock divider for bcm2835aux is 8,
> 	 * but 8250 expects a divider of 16,
> 	 * so we have to multiply the actual clock by 2
> 	 * to get identical baudrates.
> 	 */
> 	up.port.uartclk = clk_get_rate(data->clk) * 2;

8250_mid for example lies about UART clock due to this. It has a comment in the
code in its ->set_termios().

Yes, we have a lot of possibilities here to fix, I guess. We have custom
termios callback, also get and set divisor and so on.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
