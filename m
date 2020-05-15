Return-Path: <SRS0=cOAS=65=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2076AC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 13:48:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5A1820657
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 13:48:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sw8nr+dL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5A1820657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ha5pAHSCirkFwee+6dx1FLZOIii73sGr9ZB3HnMdbUQ=; b=Sw8nr+dLR43VNC
	LPnwr8v9IjY3E5RvCfr92Xbg2Yp2D6GzHNcFcA2717SkY+UeqL3HBE+wWX0g6KuPYsyUDVJ7UW51M
	0yq7f9To3X7y53eJ5CLpasdbp1+eI0ylVyrkuDAl04ggn7W/YWL44XmIopmTV9hVUDJBojsYdwH1E
	U3lDKl7VJsJgmHAFqTQueli8GjZWCng6gnLlgxOQ31jI5/eRPId1xH1sScl6kUC86oPsYvGUt3DWe
	abUvvFi8RYYQ1zl+iM3/E9qF7mao4sKnRaluYhhrU7gjrGgRx60z3grKBI/nOgqpfTAREg3ys/kcR
	VCnJK2wMU5seu3X4AW/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZahb-0001X2-Tp; Fri, 15 May 2020 13:48:39 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZahT-0001Pl-HR; Fri, 15 May 2020 13:48:33 +0000
IronPort-SDR: dsyoqyRsxlED6G5VvsGLCxUxSYj85lv2/xxvA9N1vN1n6bf/0GciF70R2zVuwjGHMyBbBm23/y
 BHLxscOvtwyg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 06:48:30 -0700
IronPort-SDR: AgA+QGUcfWXG7JMCt4bkZKGpeJwCLYEmjhD53o86ruEuiXS4tZjJRrdQS4l/MUiU1m+CasJjuD
 MdhoiHBzHs+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,395,1583222400"; d="scan'208";a="298444952"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga002.fm.intel.com with ESMTP; 15 May 2020 06:48:25 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jZahP-006scn-I7; Fri, 15 May 2020 16:48:27 +0300
Date: Fri, 15 May 2020 16:48:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v3 1/4] serial: 8250: Fix max baud limit in generic 8250
 port
Message-ID: <20200515134827.GB1634618@smile.fi.intel.com>
References: <20200323024611.16039-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506233136.11842-2-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_064831_594660_03BB2170 
X-CRM114-Status: GOOD (  20.19  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Stefan Roese <sr@denx.de>,
 Will Deacon <will@kernel.org>, Paul Burton <paulburton@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Long Cheng <long.cheng@mediatek.com>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linux-mediatek@lists.infradead.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 07, 2020 at 02:31:32AM +0300, Serge Semin wrote:
> Standard 8250 UART ports are designed in a way so they can communicate
> with baud rates up to 1/16 of a reference frequency. It's expected from
> most of the currently supported UART controllers. That's why the former
> version of serial8250_get_baud_rate() method called uart_get_baud_rate()
> with min and max baud rates passed as (port->uartclk / 16 / UART_DIV_MAX)
> and ((port->uartclk + tolerance) / 16) respectively. Doing otherwise, like
> it was suggested in commit ("serial: 8250_mtk: support big baud rate."),
> caused acceptance of bauds, which was higher than the normal UART
> controllers actually supported. As a result if some user-space program
> requested to set a baud greater than (uartclk / 16) it would have been
> permitted without truncation, but then serial8250_get_divisor(baud)
> (which calls uart_get_divisor() to get the reference clock divisor) would
> have returned a zero divisor. Setting zero divisor will cause an
> unpredictable effect varying from chip to chip. In case of DW APB UART the
> communications just stop.
> 
> Lets fix this problem by getting back the limitation of (uartclk +
> tolerance) / 16 maximum baud supported by the generic 8250 port. Mediatek
> 8250 UART ports driver developer shouldn't have touched it in the first
> place  notably seeing he already provided a custom version of set_termios()
> callback in that glue-driver which took into account the extended baud
> rate values and accordingly updated the standard and vendor-specific
> divisor latch registers anyway.

Some of the hardware support PS != 16 (8250_mid), but for now it lies to UART
core for real UART clock because of its (core) hard cored assumption PS == 16
here and there.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> 
> Fixes: 81bb549fdf14 ("serial: 8250_mtk: support big baud rate.")
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
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
> ---
>  drivers/tty/serial/8250/8250_port.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> index f77bf820b7a3..4d83c85a7389 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -2615,6 +2615,8 @@ static unsigned int serial8250_get_baud_rate(struct uart_port *port,
>  					     struct ktermios *termios,
>  					     struct ktermios *old)
>  {
> +	unsigned int tolerance = port->uartclk / 100;
> +
>  	/*
>  	 * Ask the core to calculate the divisor for us.
>  	 * Allow 1% tolerance at the upper limit so uart clks marginally
> @@ -2623,7 +2625,7 @@ static unsigned int serial8250_get_baud_rate(struct uart_port *port,
>  	 */
>  	return uart_get_baud_rate(port, termios, old,
>  				  port->uartclk / 16 / UART_DIV_MAX,
> -				  port->uartclk);
> +				  (port->uartclk + tolerance) / 16);
>  }
>  
>  void
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
