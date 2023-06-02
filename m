Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6418EC7EE29
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jun 2023 09:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UICkD/bbfDOoa838wQ6g0g4Ra5Peq/4umKcIAg4dE/0=; b=OfrB5eW7AYH6tPao4XCOuJFqSo
	LnAnRw+ruLgaEx2h7Bd1FYw54zV57mZBFVKctrnV2FWgzob0UsEOvkw2rqTc2n/py7USdSNZ8UO5L
	lbVZaZDMbk9T/KSVJjdXW6c79bPhUQtJWaec94uNqClccXy0V/99M6FSjsAY4Z7dWj936Qlrq7z65
	7qBo66DZXzQ3pntJzG3btI49pKHuT4ZFGv1IbY9co23nuURMUIY+39DiMU29xLS9N26LThFLFUIC5
	rWmJT/has6eGpMEJByR5bmz5AUgJoKgsglg1imU8GtBzy4LurmsbtHaBrpctL4py6dOrRQHzt5t7I
	U6wYoKKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q513t-006NmG-2Z;
	Fri, 02 Jun 2023 09:27:09 +0000
Received: from muru.com ([72.249.23.125])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q513q-006NlT-1J
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jun 2023 09:27:08 +0000
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 8E8B78111;
	Fri,  2 Jun 2023 09:27:02 +0000 (UTC)
Date: Fri, 2 Jun 2023 12:27:01 +0300
From: Tony Lindgren <tony@atomide.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Dhruva Gole <d-gole@ti.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	John Ogness <john.ogness@linutronix.de>,
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
Message-ID: <20230602092701.GP14287@atomide.com>
References: <20230525113034.46880-1-tony@atomide.com>
 <20230602083335.GA181647@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230602083335.GA181647@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_022706_481414_59931C2B 
X-CRM114-Status: GOOD (  17.04  )
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

Hi,

* Chen-Yu Tsai <wenst@chromium.org> [230602 08:33]:
> This patch, in linux-next since 20230601, unfortunately breaks MediaTek
> based Chromebooks. The kernel hangs during the probe of the serial ports,
> which use the 8250_mtk driver. This happens even with the subsequent
> fixes in next-20230602 and on the mailing list:
> 
>     serial: core: Fix probing serial_base_bus devices
>     serial: core: Don't drop port_mutex in serial_core_remove_one_port
>     serial: core: Fix error handling for serial_core_ctrl_device_add()

OK thanks for reporting it.

> Without the fixes, the kernel gives "WARNING: bad unlock balance detected!"
> With the fixes, it just silently hangs. The last messages seen on the
> (serial) console are:
> 
>     Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
>     printk: console [ttyS0] disabled
>     mt6577-uart 11002000.serial: using DT '/soc/serial@11002000' for 'rs485-term' GPIO lookup
>     of_get_named_gpiod_flags: can't parse 'rs485-term-gpios' property of node '/soc/serial@11002000[0]'
>     of_get_named_gpiod_flags: can't parse 'rs485-term-gpio' property of node '/soc/serial@11002000[0]'
>     mt6577-uart 11002000.serial: using lookup tables for GPIO lookup
>     mt6577-uart 11002000.serial: No GPIO consumer rs485-term found
>     mt6577-uart 11002000.serial: using DT '/soc/serial@11002000' for 'rs485-rx-during-tx' GPIO lookup
>     of_get_named_gpiod_flags: can't parse 'rs485-rx-during-tx-gpios' property of node '/soc/serial@11002000[0]'
>     of_get_named_gpiod_flags: can't parse 'rs485-rx-during-tx-gpio' property of node '/soc/serial@11002000[0]'
>     mt6577-uart 11002000.serial: using lookup tables for GPIO lookup
>     mt6577-uart 11002000.serial: No GPIO consumer rs485-rx-during-tx found
> 
> What can we do to help resolve this?

There may be something blocking serial_ctrl and serial_port from
probing. That was the issue with the arch_initcall() using drivers.

Not sure yet what the issue here might be, but the 8250_mtk should be
fairly similar use case to the 8250_omap driver that I've tested with.
But unfortunately I don't think I have any 8250_mtk using devices to
test with.

The following hack should allow you to maybe see more info on what goes
wrong and allows adding some debug printk to serial_base_match() for
example to see if that gets called for mt6577-uart.

Hmm maybe early_mtk8250_setup() somehow triggers the issue? Not sure why
early_serial8250_setup() would cause issues here though.

Regards,

Tony

8< -----------------
diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -144,7 +144,7 @@ static void __uart_start(struct tty_struct *tty)
 		return;
 
 	port_dev = port->port_dev;
-
+#if 0
 	/* Increment the runtime PM usage count for the active check below */
 	err = pm_runtime_get(&port_dev->dev);
 	if (err < 0) {
@@ -161,6 +161,9 @@ static void __uart_start(struct tty_struct *tty)
 		port->ops->start_tx(port);
 	pm_runtime_mark_last_busy(&port_dev->dev);
 	pm_runtime_put_autosuspend(&port_dev->dev);
+#else
+	port->ops->start_tx(port);
+#endif
 }
 
 static void uart_start(struct tty_struct *tty)
-- 
2.41.0

