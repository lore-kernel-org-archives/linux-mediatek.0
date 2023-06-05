Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0B5C7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 13:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KhPAl5xRdDjhvHLhx4jX5pXoXFnxVRNqx5piaWbjIDw=; b=MUU1uDqiX21JA0ngq+Jyt5+y4Q
	lUPXFyrKJ2kOVfPdu0eeo/kopqoKAEIQI6o0mJufAqa3uKXziewnddvdN/c4gNrL9TKWQI4Hnx0uU
	EyPf3KCrvxXCZmWK7pu7Sd0iZWJLbU2mg2v1KgBL2zpPpoEU0U4K/UGc6y9ycWB8agQQ82hcTdX4x
	9aI2q83T9uJmiF4xK4zOPf5uESSfO39CRp2h+DX10SH7YXsT5SNy/PXgpw9Nb1wI2RZBbn24tUkVU
	/RNfFpO+5kd9u9J1tPObaBeDTVHqrYawyMcM9mtnFPlUag1GsT34SE/ua+vUwndUaKL7VLxmAAzfe
	kNlPGzAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6A64-00FaLQ-1K;
	Mon, 05 Jun 2023 13:18:08 +0000
Received: from muru.com ([72.249.23.125])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6A61-00FaKl-1U
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jun 2023 13:18:06 +0000
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 9C03080FE;
	Mon,  5 Jun 2023 13:18:04 +0000 (UTC)
Date: Mon, 5 Jun 2023 16:18:03 +0300
From: Tony Lindgren <tony@atomide.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: John Ogness <john.ogness@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Dhruva Gole <d-gole@ti.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Johan Hovold <johan@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-omap@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v12 1/1] serial: core: Start managing serial controllers
 to enable runtime PM
Message-ID: <20230605131803.GA14287@atomide.com>
References: <20230525113034.46880-1-tony@atomide.com>
 <20230602083335.GA181647@google.com>
 <87a5xii33r.fsf@jogness.linutronix.de>
 <20230603054139.GR14287@atomide.com>
 <20230603063533.GS14287@atomide.com>
 <20230605061511.GW14287@atomide.com>
 <CAGXv+5Fbx7eTxP0ep6DV+jyronAWxYvu2M-g=MjHGRhjSXUc=w@mail.gmail.com>
 <20230605122447.GY14287@atomide.com>
 <CAGXv+5HwL+R5QpO3pHGQd9qAxu2pCMDjYvdni1HjiC8eEE38mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HwL+R5QpO3pHGQd9qAxu2pCMDjYvdni1HjiC8eEE38mg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_061805_540145_750173CC 
X-CRM114-Status: GOOD (  37.23  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

* Chen-Yu Tsai <wenst@chromium.org> [230605 13:01]:
> On Mon, Jun 5, 2023 at 8:24 PM Tony Lindgren <tony@atomide.com> wrote:
> >
> > * Chen-Yu Tsai <wenst@chromium.org> [230605 11:34]:
> > > On Mon, Jun 5, 2023 at 2:15 PM Tony Lindgren <tony@atomide.com> wrote:
> > > > diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
> > > > --- a/drivers/tty/serial/8250/8250_mtk.c
> > > > +++ b/drivers/tty/serial/8250/8250_mtk.c
> > > > @@ -425,11 +439,10 @@ mtk8250_set_termios(struct uart_port *port, struct ktermios *termios,
> > > >  static int __maybe_unused mtk8250_runtime_suspend(struct device *dev)
> > > >  {
> > > >         struct mtk8250_data *data = dev_get_drvdata(dev);
> > > > -       struct uart_8250_port *up = serial8250_get_port(data->line);
> > > >
> > > >         /* wait until UART in idle status */
> > > >         while
> > > > -               (serial_in(up, MTK_UART_DEBUG0));
> > > > +               (mtk8250_read(data, MTK_UART_DEBUG0));
> > >
> > > I believe it still gets stuck here sometimes.
> >
> > Hmm so maybe you need to mtk8250_write(data, 0, MTK_UART_RATE_FIX) in
> > probe before pm_runtime_resume_and_get() that enables the baud clock?
> > That's something I changed, so maybe it messes up things.
> 
> I think it has something to do with the do_pm() function calling
> the callbacks directly, then also calling runtime PM.

Yeah I'm not following really what's going on there.. So then I guess the
call for mtk8250_write(data, 0, MTK_UART_RATE_FIX) should be after the
pm_runtime_resume_and_get() call.

> > Looking at the 8250_mtk git log, it's runtime PM functions seem to only
> > currently manage the baud clock so register access should be doable
> > without runtime PM resume?
> 
> Actually it only manages the bus clock. The baud clock is simply the system
> XTAL which is not gateble.

OK

> > > With your earlier patch, it could get through registering the port, and
> > > the console would show
> > >
> > >     11002000.serial: ttyS0 at MMIO 0x11002000 (irq = 240, base_baud =
> > > 1625000) is a ST16650V2
> > >
> > > for the console UART.
> >
> > OK
> >
> > > Angelo mentioned that we should be using SLEEP_REQ/SLEEP_ACK registers
> > > in the MTK UART hardware.
> > >
> > > I tried reworking it into your patch here, but it causes issues with the
> > > UART-based Bluetooth on one of my devices. After the UART runtime suspends
> > > and resumes, something is off and causes the transfers during Bluetooth
> > > init to become corrupt.
> > >
> > > I'll try some more stuff, but the existing code seems timing dependent.
> > > If I add too many printk statements to the runtime suspend/resume
> > > callbacks, things seem to work. One time I even ended up with broken
> > > UARTs but otherwise booted up the system.
> >
> > Well another thing that now changes is that we now runtime suspend the
> > port at the end of the probe. What the 8250_mtk probe was doing earlier
> > it was leaving the port baud clock enabled, but runtime PM disabled
> > until mtk8250_do_pm() I guess.
> 
> I guess that's the biggest difference? Since the *bus* clock gets disabled,
> any access will hang. Is it enough to just support runtime PM? Or do I have
> to also have UART_CAP_RPM?

Maybe try changing pm_runtime_put_sync() at the end of the probe to just
pm_runtime_put_noidle()? Then the driver should be back to where it was
with clocks enabled but runtime PM suspended.

I don't think you need UART_CAP_RPM right now unless 8250_mtk adds support
for autosuspend. That stuff will get replaced by the serial_core generic
PM patch from Andy. I think in it's current form 8250_mtk just gets enabled
when the port is opened, and disabled when the port is closed. And gets
disabled for system suspend.

Regards,

Tony

