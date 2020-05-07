Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDCBC38A2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 18:29:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BA6D208DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 18:29:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ke69+MH9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BA6D208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=83lHGqiW3gIk5kmca3pLeHczRI5C4wlCm/j72GsAQFE=; b=Ke69+MH9kkMc3E
	dQAiNnZiCdxJd9917Qut2n7Du0Fu10hZOyFNvEk2I3vZ3/IlNo4E4GRkCjWmhw8xeqeIhdYC5qUDF
	rnz9Dd6v6qFNkOeebiwt855C8lbvcLGAZ6EAF/sYYdOsK/p1zuGnhnALDG60E897BIbTRM5vSx7q1
	1B2jP0in1/47PxiV3/MkbBDhl1PQeM24AigZOSumbvwf3Kt35O0IOQ+Awk932gFEyaIsDqYlaB5Xx
	1BjyELsoOvzOWxI6hKRD6dP5a0bHc1nJ1GbBjVO85BCSukicCpNjOB25dAQZVzQCYbpZEyLr4QqEx
	HdhtTijTZEz8NVN6JxMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWlGq-0005ru-Sg; Thu, 07 May 2020 18:29:20 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWlGh-0005kx-HA; Thu, 07 May 2020 18:29:12 +0000
IronPort-SDR: HA41BbmPZ7enBf4966TNb2meT4E/Jg3zVwABcnQSJrALlSW+FZAM2QZ4u9DLqNND0Kzf4s75xY
 2VEd+mgcCS4w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 11:29:10 -0700
IronPort-SDR: wMCF1cDvnibopdXFyBYMTMWQUgrGoVywPKBnfFBshtu66Lml/9Uhcx1CeU2Dk+bYh/7TpE83ne
 9LAth0IHca1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,364,1583222400"; d="scan'208";a="296619233"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 07 May 2020 11:29:03 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jWlGc-005H6v-15; Thu, 07 May 2020 21:29:06 +0300
Date: Thu, 7 May 2020 21:29:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v3 0/4] serial: 8250_dw: Fix ref clock usage
Message-ID: <20200507182906.GC185537@smile.fi.intel.com>
References: <20200323024611.16039-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506233136.11842-1-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_112911_592620_60B1BA73 
X-CRM114-Status: GOOD (  19.59  )
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Will Deacon <will@kernel.org>,
 Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
 Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
 Russell King <linux@armlinux.org.uk>, Long Cheng <long.cheng@mediatek.com>,
 Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
 Jiri Slaby <jslaby@suse.com>, linux-serial@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
 Paul Burton <paulburton@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>,
 Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 07, 2020 at 02:31:31AM +0300, Serge Semin wrote:
> It might be dangerous if an UART port reference clock rate is suddenly
> changed. In particular the 8250 port drivers (and AFAICS most of the tty
> drivers using common clock framework clocks) rely either on the
> exclusive reference clock utilization or on the ref clock rate being
> always constant. Needless to say that it turns out not true and if some
> other service suddenly changes the clock rate behind an UART port driver
> back it's no good. So the port might not only end up with an invalid
> uartclk value saved, but may also experience a distorted output/input
> data since such action will effectively update the programmed baud-clock.
> We discovered such problem on Baikal-T1 SoC where two DW 8250 ports have
> got a shared reference clock. Allwinner SoC is equipped with an UART,
> which clock is derived from the CPU PLL clock source, so the CPU frequency
> change might be propagated down up to the serial port reference clock.
> This patchset provides a way to fix the problem to the 8250 serial port
> controllers and mostly fixes it for the DW 8250-compatible UART. I say
> mostly because due to not having a facility to pause/stop and resume/
> restart on-going transfers we implemented the UART clock rate update
> procedure executed post factum of the actual reference clock rate change.
> 
> In addition the patchset includes a few fixes we discovered when were
> working the issue. First one concerns the maximum baud rate setting used
> to determine a serial port baud based on the current UART port clock rate.
> Another one simplifies the ref clock rate setting procedure a bit.
> 
> This patchset is rebased and tested on the mainline Linux kernel 5.7-rc4:
> 0e698dfa2822 ("Linux 5.7-rc4")
> tag: v5.7-rc4

Thanks!

I will look at them later, but first impression that the first approach narrowed
to the certain SoC (by matching compatible string) looks better solution for
time being.

> Changelog v3:
> - Refactor the original patch to adjust the UART port divisor instead of
>   requesting an exclusive ref clock utilization.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
> Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
> Cc: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
> Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
> Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
> Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
> Cc: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Long Cheng <long.cheng@mediatek.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-mips@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-serial@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> Serge Semin (4):
>   serial: 8250: Fix max baud limit in generic 8250 port
>   serial: 8250: Add 8250 port clock update method
>   serial: 8250_dw: Simplify the ref clock rate setting procedure
>   serial: 8250_dw: Fix common clocks usage race condition
> 
>  drivers/tty/serial/8250/8250_dw.c   | 125 +++++++++++++++++++++++++---
>  drivers/tty/serial/8250/8250_port.c |  42 +++++++++-
>  include/linux/serial_8250.h         |   2 +
>  3 files changed, 156 insertions(+), 13 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
