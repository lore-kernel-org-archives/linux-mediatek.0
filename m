Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385EEC77B73
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Jun 2023 06:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwgDaYrBzMoDJq6oWWGWHxHQ2gM4CZcpM55gukLW0Hg=; b=P6fM0eu1fE0jSkdv/aQubPcQhm
	Op6qAbcWq/KWVUBy0W1jr1tCeXMFQ/zougCsPcRxnj6bCitwFMJ0A1MuzFjY6DyaYUDojVbdZz0mH
	j+4x2qEtUkERFCj+J6npoT6EXI768feRU78/BbNAMvYbqK1YSTRZuY8jcBjaPjKqfAwEOJtX37QMg
	HFk0dFV8TLuBHo2ZNagfPsaHIJZx2nJDhfBgRsOrMXwfMFrfs4A3mCBBRi163kbSLMGa8RwRJ2d+f
	00N+q61Eazt/sXZuaCUx0bshPjeLQbvp8EC25L8BNX1D6UWDUW9DRx9ospUPyV/7O2KcQMWP8V4i+
	C7rWdoiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5KrS-008vJb-2H;
	Sat, 03 Jun 2023 06:35:38 +0000
Received: from muru.com ([72.249.23.125])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5KrP-008vJC-2e
	for linux-mediatek@lists.infradead.org;
	Sat, 03 Jun 2023 06:35:37 +0000
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 668D4804D;
	Sat,  3 Jun 2023 06:35:34 +0000 (UTC)
Date: Sat, 3 Jun 2023 09:35:33 +0300
From: Tony Lindgren <tony@atomide.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
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
Message-ID: <20230603063533.GS14287@atomide.com>
References: <20230525113034.46880-1-tony@atomide.com>
 <20230602083335.GA181647@google.com>
 <87a5xii33r.fsf@jogness.linutronix.de>
 <20230603054139.GR14287@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230603054139.GR14287@atomide.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_233535_921016_E69462FA 
X-CRM114-Status: GOOD (  13.48  )
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

* Tony Lindgren <tony@atomide.com> [230603 05:41]:
> I don't think 8250_mtk needs to do register access before and after the
> serial port registration, but if it does, then adding custom read/write
> functions can be done that do not rely on initialized port like
> serial_out().

Oh but mtk8250_runtime_suspend() calls serial_in(up, MTK_UART_DEBUG0), so
yeah if that gets called before registration is complete it causes a NULL
pointer exception. If the serial_ctrl and serial_port devices do runtime
suspend before port registration completes, things will fail.

Sounds like doing pm_runtime_resume_and_get() in mtk8250_probe() might
fix the issue. Still seems that adding a custom read function for
mtk8250_runtime_suspend() to use instead of calling serial_in() should
not be needed.

An experimental untested patch below, maye it helps?

Regards,

Tony

8< ------
diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -588,20 +588,24 @@ static int mtk8250_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, data);
 
 	pm_runtime_enable(&pdev->dev);
-	err = mtk8250_runtime_resume(&pdev->dev);
+	err = pm_runtime_resume_and_get(&pdev->dev);
 	if (err)
 		goto err_pm_disable;
 
 	data->line = serial8250_register_8250_port(&uart);
 	if (data->line < 0) {
 		err = data->line;
-		goto err_pm_disable;
+		goto err_pm_put;
 	}
 
 	data->rx_wakeup_irq = platform_get_irq_optional(pdev, 1);
 
+	pm_runtime_put_sync(&pdev->dev);
+
 	return 0;
 
+err_pm_put:
+	pm_runtime_put_sync(&pdev->dev);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.41.0

