Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E781C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 11:39:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAD752077D
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 11:39:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bS70oKoF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAD752077D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ve9MdJEXlnJw6NtYz8oHITjDhQUzONUmmpeJoi/e4Ew=; b=bS70oKoFELGhRiBtI5QqvUy0b
	SBfA56Lzd/G6GfIHKBgQncjuGLy4avUGHNf32ikrt4gtF9dRY470VVIqkzoVLMMFwsjt7kyg+A8ta
	SX7HGZf8UZadHC0kyO1T0GtY8MhqcXQugDdkCbXkazxw7EyEW433P9f5VndXe7Xxn5wBHeSaThepA
	26V987R8PQt/ieZaknBDYbTR4nIDJIkoiyd8D+dqCPUuQY/uXb5U0IFw05I4bJB81BZGGFEmvGn7C
	LYAh2oVS7yhuu0tTgxipz+vrB5Tcy0aFyCJe/pW2668+3RanbWrsTvMHc16gRALwj0/HDHHdyuyXl
	c1A4wA/tA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqb5L-0005pP-2u; Wed, 01 Jul 2020 11:39:27 +0000
Received: from ns2.chip.baikal.ru ([94.125.187.42]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqb5H-0005o9-SM
 for linux-mediatek@lists.infradead.org; Wed, 01 Jul 2020 11:39:25 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id A9B848030868;
 Wed,  1 Jul 2020 11:39:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qs3WUKcY0GC5; Wed,  1 Jul 2020 14:39:08 +0300 (MSK)
Date: Wed, 1 Jul 2020 14:39:04 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH] Revert "serial: 8250: Fix max baud limit in generic 8250
 port"
Message-ID: <20200701113904.7zh534vmlvjvojia@mobilestation>
References: <20200630164204.1.I2cc415fa5793b3e55acfd521ba8f0a71e79aa5f1@changeid>
 <20200701043001.73qhxyyjx6bayn2m@wunner.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701043001.73qhxyyjx6bayn2m@wunner.de>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_073924_295970_D70AFF59 
X-CRM114-Status: GOOD (  22.35  )
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
 linux-kernel@vger.kernel.org,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 Daniel Winkler <danielwinkler@google.com>, Aaron Sierra <asierra@xes-inc.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Lukas,

On Wed, Jul 01, 2020 at 06:30:01AM +0200, Lukas Wunner wrote:
> On Tue, Jun 30, 2020 at 04:42:11PM -0700, Daniel Winkler wrote:
> > This reverts commit 0eeaf62981ecc79e8395ca8caa1570eaf3a12257.
> 
> That is not an upstream commit.  You probably mean:
> 
>     commit 7b668c064ec33f3d687c3a413d05e355172e6c92
>     Author: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>     Date:   Thu May 7 02:31:32 2020 +0300
> 
>     serial: 8250: Fix max baud limit in generic 8250 port
> 
> And you didn't cc the commit author (hereby fixed).
> 
> Thanks,
> 
> Lukas

Thanks for Cc'ing me.

> 
> > 
> > The change regresses the QCA6174A-3 bluetooth chip, preventing
> > firmware from being properly loaded. We have verified that without
> > this patch, the chip works as intended.

That text doesn't say what is really wrong and why the firmware couldn't be loaded.
The original commit gets back the 8250 port baud rate limitation so if the baud
gets out of the range [uartclk / 16 / UART_DIV_MAX; (port->uartclk + tolerance) /
16], then it will be clamped to be within it. That range is what the standard
8250 port supports. Acceptance of out of that range values will cause a
problem further in calling serial8250_get_divisor() and uart_get_divisor()
methods (see the original patch log message) for standard 8250 ports. Any different
behavior must be taken into account by a custom set_termios() callbacks or at
least must be workarounded so the standard 8250 ports wouldn't be affected. So in
order to investigate the root cause of the problem it would be good to at least
know what your platform was and what UART port has been used in the attempt to
load the QCA6174A-3 chip firmware.

-Sergey

> > 
> > Signed-off-by: Daniel Winkler <danielwinkler@google.com>
> > ---
> > 
> >  drivers/tty/serial/8250/8250_port.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> > index 1632f7d25acca..e057c65ac1580 100644
> > --- a/drivers/tty/serial/8250/8250_port.c
> > +++ b/drivers/tty/serial/8250/8250_port.c
> > @@ -2618,8 +2618,6 @@ static unsigned int serial8250_get_baud_rate(struct uart_port *port,
> >  					     struct ktermios *termios,
> >  					     struct ktermios *old)
> >  {
> > -	unsigned int tolerance = port->uartclk / 100;
> > -
> >  	/*
> >  	 * Ask the core to calculate the divisor for us.
> >  	 * Allow 1% tolerance at the upper limit so uart clks marginally
> > @@ -2628,7 +2626,7 @@ static unsigned int serial8250_get_baud_rate(struct uart_port *port,
> >  	 */
> >  	return uart_get_baud_rate(port, termios, old,
> >  				  port->uartclk / 16 / UART_DIV_MAX,
> > -				  (port->uartclk + tolerance) / 16);
> > +				  port->uartclk);
> >  }
> >  
> >  void
> > -- 
> > 2.27.0.212.ge8ba1cc988-goog

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
