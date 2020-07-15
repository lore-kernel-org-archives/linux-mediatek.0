Return-Path: <SRS0=kQBs=A2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLACK
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803A8C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 16:29:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51A212065E
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 16:29:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2HWcF3cQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51A212065E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mZ8pm01ynzs7bsVTX2TzTzZ3ncFiKooVoitYIYKq9/0=; b=2HWcF3cQwkmSTrob6jr5lDnyi
	XINUrFGDWLvX5WPfaL7pfwZnbw51Npxcv6yvi7vVv0wI33Hipb5M7yd+ofH7aj+OQmUKWmwbI6jo0
	iC+ZhJJ3ARcr2HSAZIFMjdtruX4nWfjiQtsTbKwgE7zr/koY4dARhvXsnTXUffYZHdm2m9zjmHX3g
	XXGyFH6lO/5nhoStjJ7IEb43ffHlc8O4oe3g4j1xDkz61bpQ1nd7OJJqSRP11E+yXmKzATOiGO48M
	MuE4ryfr0bIn6mYZlBqK63xupLYv1qz9UjZk0A3uG0YBWYH7d1I0J25zdPeeMF2bUfTR4tchYws12
	nkNuxso7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvkHk-0003S4-2c; Wed, 15 Jul 2020 16:29:32 +0000
Received: from [94.125.187.42] (helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvkHe-0003KL-0R; Wed, 15 Jul 2020 16:29:27 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 1C2E980307C2;
 Wed, 15 Jul 2020 16:28:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R4yGKnKOMh8D; Wed, 15 Jul 2020 19:28:54 +0300 (MSK)
Date: Wed, 15 Jul 2020 19:28:52 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Claire Chang <tientzu@chromium.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH] serial: 8250_mtk: Fix high-speed baud rates clamping
Message-ID: <20200715162852.5ykgubvoc7tvbfhc@mobilestation>
References: <20200714124113.20918-1-Sergey.Semin@baikalelectronics.ru>
 <CAP2xMbvwxYaGPPCDWY2LWUc2te8kS9t-+A0zieYp3RiGMJR6ng@mail.gmail.com>
 <CALiNf2-mmC1ueeiQ6xh5BPzCH_ratYPpeW1Rq=EHsA7+e6yK0A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALiNf2-mmC1ueeiQ6xh5BPzCH_ratYPpeW1Rq=EHsA7+e6yK0A@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_122926_433232_FCF9C2BE 
X-CRM114-Status: GOOD (  36.82  )
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
Cc: Nicolas Boichat <drinkcat@google.com>, chromeos-bluetooth-upstreaming
 <chromeos-bluetooth-upstreaming@chromium.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, lkml <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 BlueZ <linux-bluetooth@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>,
 "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-serial@vger.kernel.org, Daniel Winkler <danielwinkler@google.com>,
 abhishekpandit@chromium.org, Aaron Sierra <asierra@xes-inc.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jul 15, 2020 at 01:36:04PM +0800, Claire Chang wrote:
> On Wed, Jul 15, 2020 at 4:45 AM Daniel Winkler <danielwinkler@google.com> wrote:
> >
> > Thank you Sergey for looking into this. Adding folks working on this
> > platform to perform validation of the proposed patch.
> >
> > Best,
> > Daniel
> >
> > On Tue, Jul 14, 2020 at 5:41 AM Serge Semin
> > <Sergey.Semin@baikalelectronics.ru> wrote:
> > >
> > > Commit 7b668c064ec3 ("serial: 8250: Fix max baud limit in generic 8250
> > > port") fixed limits of a baud rate setting for a generic 8250 port.
> > > In other words since that commit the baud rate has been permitted to be
> > > within [uartclk / 16 / UART_DIV_MAX; uartclk / 16], which is absolutely
> > > normal for a standard 8250 UART port. But there are custom 8250 ports,
> > > which provide extended baud rate limits. In particular the Mediatek 8250
> > > port can work with baud rates up to "uartclk" speed.
> > >
> > > Normally that and any other peculiarity is supposed to be handled in a
> > > custom set_termios() callback implemented in the vendor-specific
> > > 8250-port glue-driver. Currently that is how it's done for the most of
> > > the vendor-specific 8250 ports, but for some reason for Mediatek a
> > > solution has been spread out to both the glue-driver and to the generic
> > > 8250-port code. Due to that a bug has been introduced, which permitted the
> > > extended baud rate limit for all even for standard 8250-ports. The bug
> > > has been fixed by the commit 7b668c064ec3 ("serial: 8250: Fix max baud
> > > limit in generic 8250 port") by narrowing the baud rates limit back down to
> > > the normal bounds. Unfortunately by doing so we also broke the
> > > Mediatek-specific extended bauds feature.
> > >
> > > A fix of the problem described above is twofold. First since we can't get
> > > back the extended baud rate limits feature to the generic set_termios()
> > > function and that method supports only a standard baud rates range, the
> > > requested baud rate must be locally stored before calling it and then
> > > restored back to the new termios structure after the generic set_termios()
> > > finished its magic business. By doing so we still use the
> > > serial8250_do_set_termios() method to set the LCR/MCR/FCR/etc. registers,
> > > while the extended baud rate setting procedure will be performed later in
> > > the custom Mediatek-specific set_termios() callback. Second since a true
> > > baud rate is now fully calculated in the custom set_termios() method we
> > > need to locally update the port timeout by calling the
> > > uart_update_timeout() function. After the fixes described above are
> > > implemented in the 8250_mtk.c driver, the Mediatek 8250-port should
> > > get back to normally working with extended baud rates.
> > >
> > > Link: https://lore.kernel.org/linux-serial/20200701211337.3027448-1-danielwinkler@google.com
> > >
> > > Fixes: 7b668c064ec3 ("serial: 8250: Fix max baud limit in generic 8250 port")
> > > Reported-by: Daniel Winkler <danielwinkler@google.com>
> > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

> Tested-by: Claire Chang <tientzu@chromium.org>
> > >
> > > ---
> > >
> > > Folks, sorry for a delay with the problem fix. A solution is turned out to
> > > be a bit more complicated than I originally thought in my comment to the
> > > Daniel revert-patch.
> > >
> > > Please also note, that I don't have a Mediatek hardware to test the
> > > solution suggested in the patch. The code is written as on so called
> > > the tip of the pen after digging into the 8250_mtk.c and 8250_port.c
> > > drivers code. So please Daniel or someone with Mediatek 8250-port
> > > available on a board test this patch first and report about the results in
> > > reply to this emailing thread. After that, if your conclusion is positive
> > > and there is no objection against the solution design the patch can be
> > > merged in.
> I tested it with mt8183 + QCA6174.
> The UART Bluetooth works fine with this fix.
> Thanks!

Great! Thanks.

Greg, Jiri, Matthias since a test's showed the patch correctness you may now
merge it in if you are ok with its design. It shall fix the problem Daniel
reported.

-Sergey

> > >
> > > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > > Cc: Daniel Winkler <danielwinkler@google.com>
> > > Cc: Aaron Sierra <asierra@xes-inc.com>
> > > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Cc: Lukas Wunner <lukas@wunner.de>
> > > Cc: Vignesh Raghavendra <vigneshr@ti.com>
> > > Cc: linux-serial@vger.kernel.org
> > > Cc: linux-mediatek@lists.infradead.org
> > > Cc: BlueZ <linux-bluetooth@vger.kernel.org>
> > > Cc: chromeos-bluetooth-upstreaming <chromeos-bluetooth-upstreaming@chromium.org>
> > > Cc: abhishekpandit@chromium.org
> > > Cc: stable@vger.kernel.org
> > > ---
> > >  drivers/tty/serial/8250/8250_mtk.c | 18 ++++++++++++++++++
> > >  1 file changed, 18 insertions(+)
> > >
> > > diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
> > > index f839380c2f4c..98b8a3e30733 100644
> > > --- a/drivers/tty/serial/8250/8250_mtk.c
> > > +++ b/drivers/tty/serial/8250/8250_mtk.c
> > > @@ -306,8 +306,21 @@ mtk8250_set_termios(struct uart_port *port, struct ktermios *termios,
> > >         }
> > >  #endif
> > >
> > > +       /*
> > > +        * Store the requested baud rate before calling the generic 8250
> > > +        * set_termios method. Standard 8250 port expects bauds to be
> > > +        * no higher than (uartclk / 16) so the baud will be clamped if it
> > > +        * gets out of that bound. Mediatek 8250 port supports speed
> > > +        * higher than that, therefore we'll get original baud rate back
> > > +        * after calling the generic set_termios method and recalculate
> > > +        * the speed later in this method.
> > > +        */
> > > +       baud = tty_termios_baud_rate(termios);
> > > +
> > >         serial8250_do_set_termios(port, termios, old);
> > >
> > > +       tty_termios_encode_baud_rate(termios, baud, baud);
> > > +
> > >         /*
> > >          * Mediatek UARTs use an extra highspeed register (MTK_UART_HIGHS)
> > >          *
> > > @@ -339,6 +352,11 @@ mtk8250_set_termios(struct uart_port *port, struct ktermios *termios,
> > >          */
> > >         spin_lock_irqsave(&port->lock, flags);
> > >
> > > +       /*
> > > +        * Update the per-port timeout.
> > > +        */
> > > +       uart_update_timeout(port, termios->c_cflag, baud);
> > > +
> > >         /* set DLAB we have cval saved in up->lcr from the call to the core */
> > >         serial_port_out(port, UART_LCR, up->lcr | UART_LCR_DLAB);
> > >         serial_dl_write(up, quot);
> > > --
> > > 2.26.2
> > >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
