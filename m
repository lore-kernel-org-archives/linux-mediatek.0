Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16195C77B73
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 12:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wn7yobGIB2xPqyYn6rYO7VrD19g9B4rrMjHusD1goP4=; b=RA1ecwp1VhBlwwJYri7nw2W78w
	aR2sWANqVetY+71LvAZ5egCy/Dz9p1NdS7tC92GmBD0UAKd6GToxsTtVmH33XZ03y/mhv16M6I1W3
	3zMVvaDrlsZkjs2F4ZU/QjfcYuEyGrvaR6KlUwozXufYpEXKWVBVMODiQslTZO4M8rEpd9wCMvg7y
	ao1upOKmxmce7/GXtcmuqhZrrEIlkD1LfCFXLRE00LOcaDTByMiIKmQFknqISumQ2CBgSTgglga5l
	vr4QVzcBehN7mLmFMRxG/DTjvy1mGNHoCveZ6J1tp4ieSVCzB+T6pZny0qlG8UIHLqHjC/vIE7why
	5CXulAgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q69Gc-00FQCu-2b;
	Mon, 05 Jun 2023 12:24:58 +0000
Received: from muru.com ([72.249.23.125])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q69GZ-00FQBr-1D
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jun 2023 12:24:56 +0000
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 31DB880FE;
	Mon,  5 Jun 2023 12:24:49 +0000 (UTC)
Date: Mon, 5 Jun 2023 15:24:47 +0300
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
Message-ID: <20230605122447.GY14287@atomide.com>
References: <20230525113034.46880-1-tony@atomide.com>
 <20230602083335.GA181647@google.com>
 <87a5xii33r.fsf@jogness.linutronix.de>
 <20230603054139.GR14287@atomide.com>
 <20230603063533.GS14287@atomide.com>
 <20230605061511.GW14287@atomide.com>
 <CAGXv+5Fbx7eTxP0ep6DV+jyronAWxYvu2M-g=MjHGRhjSXUc=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5Fbx7eTxP0ep6DV+jyronAWxYvu2M-g=MjHGRhjSXUc=w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_052455_456308_C9CA4E9A 
X-CRM114-Status: GOOD (  21.45  )
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

* Chen-Yu Tsai <wenst@chromium.org> [230605 11:34]:
> On Mon, Jun 5, 2023 at 2:15 PM Tony Lindgren <tony@atomide.com> wrote:
> > diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
> > --- a/drivers/tty/serial/8250/8250_mtk.c
> > +++ b/drivers/tty/serial/8250/8250_mtk.c
> > @@ -425,11 +439,10 @@ mtk8250_set_termios(struct uart_port *port, struct ktermios *termios,
> >  static int __maybe_unused mtk8250_runtime_suspend(struct device *dev)
> >  {
> >         struct mtk8250_data *data = dev_get_drvdata(dev);
> > -       struct uart_8250_port *up = serial8250_get_port(data->line);
> >
> >         /* wait until UART in idle status */
> >         while
> > -               (serial_in(up, MTK_UART_DEBUG0));
> > +               (mtk8250_read(data, MTK_UART_DEBUG0));
> 
> I believe it still gets stuck here sometimes.

Hmm so maybe you need to mtk8250_write(data, 0, MTK_UART_RATE_FIX) in
probe before pm_runtime_resume_and_get() that enables the baud clock?
That's something I changed, so maybe it messes up things.

Looking at the 8250_mtk git log, it's runtime PM functions seem to only
currently manage the baud clock so register access should be doable
without runtime PM resume?

> With your earlier patch, it could get through registering the port, and
> the console would show
> 
>     11002000.serial: ttyS0 at MMIO 0x11002000 (irq = 240, base_baud =
> 1625000) is a ST16650V2
> 
> for the console UART.

OK

> Angelo mentioned that we should be using SLEEP_REQ/SLEEP_ACK registers
> in the MTK UART hardware.
> 
> I tried reworking it into your patch here, but it causes issues with the
> UART-based Bluetooth on one of my devices. After the UART runtime suspends
> and resumes, something is off and causes the transfers during Bluetooth
> init to become corrupt.
> 
> I'll try some more stuff, but the existing code seems timing dependent.
> If I add too many printk statements to the runtime suspend/resume
> callbacks, things seem to work. One time I even ended up with broken
> UARTs but otherwise booted up the system.

Well another thing that now changes is that we now runtime suspend the
port at the end of the probe. What the 8250_mtk probe was doing earlier
it was leaving the port baud clock enabled, but runtime PM disabled
until mtk8250_do_pm() I guess.

Regards,

Tony

