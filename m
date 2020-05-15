Return-Path: <SRS0=cOAS=65=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30164C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 14:33:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00EEF2076A
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 14:33:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sTmQDkED"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00EEF2076A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0qqORSX91pVXn6gKJ7ax2liWfijFsqZzukC9jIHwPbk=; b=sTmQDkEDtV4wfW
	8EOJh0W6zSqLrgBwYMsMSdWA6EHn/h00Szx4swyGn4TLiapNRusGRXfJZKtbCm3vtLkhN2L2i58SD
	AI2sR9U34ZhiAul/B1XIL6UnYbUhoZ0zy1c1dOXMWTFS3sVfofu8GE23DskKOJ0wVxz37ApMuGNcM
	llhrHhIgpO4fhy+f3XL3YjjzbIrZXGAClqyEXaEWifxv98H7a0M3cX0GvwhWx3XgWJWdanzz1OD0P
	qWyBjZaUWSv4bXid2NOKPLGOkkMGzynhWDOUMfG3xtZ4AAjaQyhlvEyzoN/iH8gqmJNCmeTrCg1H3
	aPc5XKNLJkr8S3qHcmDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZbOs-0000vv-Hc; Fri, 15 May 2020 14:33:22 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbOi-0000oC-Lh; Fri, 15 May 2020 14:33:15 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id DB4C080004AB;
 Fri, 15 May 2020 14:33:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DGjAxQRrTWZS; Fri, 15 May 2020 17:32:57 +0300 (MSK)
Date: Fri, 15 May 2020 17:32:54 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 2/4] serial: 8250: Add 8250 port clock update method
Message-ID: <20200515143254.oicqdkvvh6zkuqyl@mobilestation>
References: <20200323024611.16039-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-1-Sergey.Semin@baikalelectronics.ru>
 <20200506233136.11842-3-Sergey.Semin@baikalelectronics.ru>
 <20200515124525.GA1888557@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515124525.GA1888557@kroah.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_073313_068698_E0F3E071 
X-CRM114-Status: GOOD (  20.81  )
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
 Catalin Marinas <catalin.marinas@arm.com>,
 Dmitry Safonov <0x7f454c46@gmail.com>,
 Yegor Yefremov <yegorslists@googlemail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Stefan Roese <sr@denx.de>,
 Will Deacon <will@kernel.org>, Paul Burton <paulburton@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Long Cheng <long.cheng@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Maxime Ripard <mripard@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linux-mediatek@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Allison Randal <allison@lohutok.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, May 15, 2020 at 02:45:25PM +0200, Greg Kroah-Hartman wrote:
> On Thu, May 07, 2020 at 02:31:33AM +0300, Serge Semin wrote:
> > Some platforms can be designed in a way so the UART port reference clock
> > might be asynchronously changed at some point. In Baikal-T1 SoC this may
> > happen due to the reference clock being shared between two UART ports, on
> > the Allwinner SoC the reference clock is derived from the CPU clock, so
> > any CPU frequency change should get to be known/reflected by/in the UART
> > controller as well. But it's not enough to just update the
> > uart_port->uartclk field of the corresponding UART port, the 8250
> > controller reference clock divisor should be altered so to preserve
> > current baud rate setting. All of these things is done in a coherent
> > way by calling the serial8250_update_uartclk() method provided in this
> > patch. Though note that it isn't supposed to be called from within the
> > UART port callbacks because the locks using to the protect the UART port
> > data are already taken in there.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Paul Burton <paulburton@kernel.org>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Long Cheng <long.cheng@mediatek.com>
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Russell King <linux@armlinux.org.uk>
> > Cc: linux-mips@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-mediatek@lists.infradead.org
> > ---
> >  drivers/tty/serial/8250/8250_port.c | 38 +++++++++++++++++++++++++++++
> >  include/linux/serial_8250.h         |  2 ++
> >  2 files changed, 40 insertions(+)
> > 
> > diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> > index 4d83c85a7389..484ff9df1432 100644
> > --- a/drivers/tty/serial/8250/8250_port.c
> > +++ b/drivers/tty/serial/8250/8250_port.c
> > @@ -2628,6 +2628,44 @@ static unsigned int serial8250_get_baud_rate(struct uart_port *port,
> >  				  (port->uartclk + tolerance) / 16);
> >  }
> >  
> > +/*
> > + * Note in order to avoid the tty port mutex deadlock don't use the next method
> > + * within the uart port callbacks. Primarily it's supposed to be utilized to
> > + * handle a sudden reference clock rate change.
> > + */
> > +void serial8250_update_uartclk(struct uart_port *port, unsigned int uartclk)
> > +{
> > +	struct uart_8250_port *up = up_to_u8250p(port);
> > +	unsigned int baud, quot, frac = 0;
> > +	struct ktermios *termios;
> > +	unsigned long flags;
> > +
> > +	mutex_lock(&port->state->port.mutex);
> > +
> > +	if (port->uartclk == uartclk)
> > +		goto out_lock;
> > +
> > +	port->uartclk = uartclk;
> > +	termios = &port->state->port.tty->termios;
> > +
> > +	baud = serial8250_get_baud_rate(port, termios, NULL);
> > +	quot = serial8250_get_divisor(port, baud, &frac);
> > +
> > +	spin_lock_irqsave(&port->lock, flags);
> > +
> > +	uart_update_timeout(port, termios->c_cflag, baud);
> > +
> > +	serial8250_set_divisor(port, baud, quot, frac);
> > +	serial_port_out(port, UART_LCR, up->lcr);
> > +	serial8250_out_MCR(up, UART_MCR_DTR | UART_MCR_RTS);
> > +
> > +	spin_unlock_irqrestore(&port->lock, flags);
> > +
> > +out_lock:
> > +	mutex_unlock(&port->state->port.mutex);
> > +}
> > +EXPORT_SYMBOL(serial8250_update_uartclk);
> 
> EXPORT_SYMBOL_GPL() please.

Ok. I guess I've just copied the line from some of the export symbol
statements below. My mistake. Sorry.

-Sergey

> 
> thanks,
> 
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
