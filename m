Return-Path: <SRS0=kQBs=A2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27BECC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 05:44:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6BDF2067D
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 05:44:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LfjnMmAp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d2SmiiK9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6BDF2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q601U+oZo274bobl/mwnuxUEkMfGh6T65MmgAAhXKP8=; b=LfjnMmApewO0e1WYFnZPnyMwn
	0jh0Js06EYdWQoxjn78apPPPXmeyEUxEIAPjSPsj8yt7LeQcKf+XwWMN7w/RtDYj4nDFvxep90agT
	1+Dde4B9PXYyWXM8D+jPp4bf1QKmOrFVxrXB5dAQd7bjFTCkSZEY7WIdmp6PtVftziDMqh2kRkZVM
	YmrawfjNBMRQbVAAoubFZs6Xc4FMjbFbrGzzKl9oLxZLQdZ/30hap44KA4h8gF38i8geiOLfOih29
	OjoECwu9uga7lpxs1zzqCFGvmLT24BGRpkDkSlpphtxU9i+HsMoaWvpbtjECEGccVqVNNRz3hkP62
	6N1Cdw88w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvaDT-000681-Ur; Wed, 15 Jul 2020 05:44:28 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvaDR-00067V-Nz
 for linux-mediatek@lists.infradead.org; Wed, 15 Jul 2020 05:44:26 +0000
Received: by mail-pf1-x442.google.com with SMTP id u185so1599134pfu.1
 for <linux-mediatek@lists.infradead.org>; Tue, 14 Jul 2020 22:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FzipDiDAYZY58rqh2kzcXYBD7EF+tctB+0O3KKzLNz4=;
 b=d2SmiiK9RFir0tNVLiwsWneH8WEOVeZ1SBJW+gMYBzXE+LjnQ6p9R6IyK72TJZc/nr
 RQe0LtOvyt7j1XCc6EWFxN1UXLs4CCtGO6FbX+Nj9MTAzMJoid2s0rBvqfagAx5UbhfZ
 rGs7lWy/xi/JHmW8/b5gE9ZqzLzKFeM/1MIDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FzipDiDAYZY58rqh2kzcXYBD7EF+tctB+0O3KKzLNz4=;
 b=YK+qayK7eWzSVOz7FNB1oFTh4+KsDAaRb/Ta/qWs0YQwCVxGrgn6OuFoqmfuv2twYo
 f6Nfwfjw4AUD12uzTgWx36sNquqx8fdUay6K7q78F7XOZ0BPVwQ/QIq9gmIM2yqYfbzk
 mIC1rrsT7p0Ww8O1yLpjHp6NQmrNd+dzcdkvNFraErEXaXQTns10uLT/iuFvQ6yJ9vWW
 qnP1TH84uneiahj0XkAxxduDND1n+UMXbAa3UEetHni2pPsld+269Q1OdtxfJ0CkxtgN
 UCygRnVrLj4434keKD5/htuGDWZlAAbGPBMtVnyQ1B3x2coZsJvCCbSJENzEhgv7SoOr
 hRmg==
X-Gm-Message-State: AOAM533wRJ5akI8hHj1SkYD2jf8gIj63uvjqALF6q003sJ6HDiYf16Sv
 RdrcgaOUCFy/wNka9aHIgH124IIQc5XFQg==
X-Google-Smtp-Source: ABdhPJz6rpwzt0KVflbk3loFIE9XRi68kkS4OnLVg96mJe0IrPmI41gt6lz/51hiNj4dqSVkxuWO5g==
X-Received: by 2002:a65:6884:: with SMTP id e4mr6297032pgt.283.1594791862022; 
 Tue, 14 Jul 2020 22:44:22 -0700 (PDT)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com.
 [209.85.210.181])
 by smtp.gmail.com with ESMTPSA id d4sm938251pgf.9.2020.07.14.22.44.21
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 22:44:21 -0700 (PDT)
Received: by mail-pf1-f181.google.com with SMTP id a14so1590180pfi.2
 for <linux-mediatek@lists.infradead.org>; Tue, 14 Jul 2020 22:44:21 -0700 (PDT)
X-Received: by 2002:a05:6602:2008:: with SMTP id
 y8mr8441205iod.69.1594791376034; 
 Tue, 14 Jul 2020 22:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200714124113.20918-1-Sergey.Semin@baikalelectronics.ru>
 <CAP2xMbvwxYaGPPCDWY2LWUc2te8kS9t-+A0zieYp3RiGMJR6ng@mail.gmail.com>
In-Reply-To: <CAP2xMbvwxYaGPPCDWY2LWUc2te8kS9t-+A0zieYp3RiGMJR6ng@mail.gmail.com>
From: Claire Chang <tientzu@chromium.org>
Date: Wed, 15 Jul 2020 13:36:04 +0800
X-Gmail-Original-Message-ID: <CALiNf2-mmC1ueeiQ6xh5BPzCH_ratYPpeW1Rq=EHsA7+e6yK0A@mail.gmail.com>
Message-ID: <CALiNf2-mmC1ueeiQ6xh5BPzCH_ratYPpeW1Rq=EHsA7+e6yK0A@mail.gmail.com>
Subject: Re: [PATCH] serial: 8250_mtk: Fix high-speed baud rates clamping
To: Daniel Winkler <danielwinkler@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_014425_812781_CBEFF913 
X-CRM114-Status: GOOD (  38.46  )
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
 Vignesh Raghavendra <vigneshr@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 lkml <linux-kernel@vger.kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 BlueZ <linux-bluetooth@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 abhishekpandit@chromium.org, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 stable@vger.kernel.org, Aaron Sierra <asierra@xes-inc.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jul 15, 2020 at 4:45 AM Daniel Winkler <danielwinkler@google.com> wrote:
>
> Thank you Sergey for looking into this. Adding folks working on this
> platform to perform validation of the proposed patch.
>
> Best,
> Daniel
>
> On Tue, Jul 14, 2020 at 5:41 AM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> >
> > Commit 7b668c064ec3 ("serial: 8250: Fix max baud limit in generic 8250
> > port") fixed limits of a baud rate setting for a generic 8250 port.
> > In other words since that commit the baud rate has been permitted to be
> > within [uartclk / 16 / UART_DIV_MAX; uartclk / 16], which is absolutely
> > normal for a standard 8250 UART port. But there are custom 8250 ports,
> > which provide extended baud rate limits. In particular the Mediatek 8250
> > port can work with baud rates up to "uartclk" speed.
> >
> > Normally that and any other peculiarity is supposed to be handled in a
> > custom set_termios() callback implemented in the vendor-specific
> > 8250-port glue-driver. Currently that is how it's done for the most of
> > the vendor-specific 8250 ports, but for some reason for Mediatek a
> > solution has been spread out to both the glue-driver and to the generic
> > 8250-port code. Due to that a bug has been introduced, which permitted the
> > extended baud rate limit for all even for standard 8250-ports. The bug
> > has been fixed by the commit 7b668c064ec3 ("serial: 8250: Fix max baud
> > limit in generic 8250 port") by narrowing the baud rates limit back down to
> > the normal bounds. Unfortunately by doing so we also broke the
> > Mediatek-specific extended bauds feature.
> >
> > A fix of the problem described above is twofold. First since we can't get
> > back the extended baud rate limits feature to the generic set_termios()
> > function and that method supports only a standard baud rates range, the
> > requested baud rate must be locally stored before calling it and then
> > restored back to the new termios structure after the generic set_termios()
> > finished its magic business. By doing so we still use the
> > serial8250_do_set_termios() method to set the LCR/MCR/FCR/etc. registers,
> > while the extended baud rate setting procedure will be performed later in
> > the custom Mediatek-specific set_termios() callback. Second since a true
> > baud rate is now fully calculated in the custom set_termios() method we
> > need to locally update the port timeout by calling the
> > uart_update_timeout() function. After the fixes described above are
> > implemented in the 8250_mtk.c driver, the Mediatek 8250-port should
> > get back to normally working with extended baud rates.
> >
> > Link: https://lore.kernel.org/linux-serial/20200701211337.3027448-1-danielwinkler@google.com
> >
> > Fixes: 7b668c064ec3 ("serial: 8250: Fix max baud limit in generic 8250 port")
> > Reported-by: Daniel Winkler <danielwinkler@google.com>
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Tested-by: Claire Chang <tientzu@chromium.org>
> >
> > ---
> >
> > Folks, sorry for a delay with the problem fix. A solution is turned out to
> > be a bit more complicated than I originally thought in my comment to the
> > Daniel revert-patch.
> >
> > Please also note, that I don't have a Mediatek hardware to test the
> > solution suggested in the patch. The code is written as on so called
> > the tip of the pen after digging into the 8250_mtk.c and 8250_port.c
> > drivers code. So please Daniel or someone with Mediatek 8250-port
> > available on a board test this patch first and report about the results in
> > reply to this emailing thread. After that, if your conclusion is positive
> > and there is no objection against the solution design the patch can be
> > merged in.
I tested it with mt8183 + QCA6174.
The UART Bluetooth works fine with this fix.
Thanks!
> >
> > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Daniel Winkler <danielwinkler@google.com>
> > Cc: Aaron Sierra <asierra@xes-inc.com>
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: Lukas Wunner <lukas@wunner.de>
> > Cc: Vignesh Raghavendra <vigneshr@ti.com>
> > Cc: linux-serial@vger.kernel.org
> > Cc: linux-mediatek@lists.infradead.org
> > Cc: BlueZ <linux-bluetooth@vger.kernel.org>
> > Cc: chromeos-bluetooth-upstreaming <chromeos-bluetooth-upstreaming@chromium.org>
> > Cc: abhishekpandit@chromium.org
> > Cc: stable@vger.kernel.org
> > ---
> >  drivers/tty/serial/8250/8250_mtk.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
> > index f839380c2f4c..98b8a3e30733 100644
> > --- a/drivers/tty/serial/8250/8250_mtk.c
> > +++ b/drivers/tty/serial/8250/8250_mtk.c
> > @@ -306,8 +306,21 @@ mtk8250_set_termios(struct uart_port *port, struct ktermios *termios,
> >         }
> >  #endif
> >
> > +       /*
> > +        * Store the requested baud rate before calling the generic 8250
> > +        * set_termios method. Standard 8250 port expects bauds to be
> > +        * no higher than (uartclk / 16) so the baud will be clamped if it
> > +        * gets out of that bound. Mediatek 8250 port supports speed
> > +        * higher than that, therefore we'll get original baud rate back
> > +        * after calling the generic set_termios method and recalculate
> > +        * the speed later in this method.
> > +        */
> > +       baud = tty_termios_baud_rate(termios);
> > +
> >         serial8250_do_set_termios(port, termios, old);
> >
> > +       tty_termios_encode_baud_rate(termios, baud, baud);
> > +
> >         /*
> >          * Mediatek UARTs use an extra highspeed register (MTK_UART_HIGHS)
> >          *
> > @@ -339,6 +352,11 @@ mtk8250_set_termios(struct uart_port *port, struct ktermios *termios,
> >          */
> >         spin_lock_irqsave(&port->lock, flags);
> >
> > +       /*
> > +        * Update the per-port timeout.
> > +        */
> > +       uart_update_timeout(port, termios->c_cflag, baud);
> > +
> >         /* set DLAB we have cval saved in up->lcr from the call to the core */
> >         serial_port_out(port, UART_LCR, up->lcr | UART_LCR_DLAB);
> >         serial_dl_write(up, quot);
> > --
> > 2.26.2
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
