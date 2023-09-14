Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1D5EEAA65
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 18:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zxTlKID9c7YEvuORrPXl2fVFncXh/KVCV6b0hRF+M0=; b=TeKHoXlWs/e5vWAT8E9aEylc+T
	6RPQ83cgra4xVW5Lr5nEJhzqMYsF4CfvFbA7Lz1TmUxPnugLNdaLShgVvjg5FixXazgYPQZnBKfHT
	5eYHqRNkIa96V9d8bK1iulYqqJQHdJ6KwrF7Kf2k9aSls4NLYtjHhH9/b+kO+DtCLoPnjzIrJDk13
	Qm32VNtjeXbEFDJMHBw5PRlNKDeXewsBoMyPSDIf7L7Aj4HzWyq1NltTHM1jorDQ83SoHjS1PEDGm
	jxwuqRwxJRXms0SvJcM0tdVb3xytcCkav1Dtc5skAwTZJxhKHHbvMw4XtvAErhnD7dp7GssHRMdpK
	HZKc1TAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgrEy-0094rQ-1l;
	Thu, 14 Sep 2023 18:39:00 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgrEt-0094k5-0c;
	Thu, 14 Sep 2023 18:38:56 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1694716723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0zxTlKID9c7YEvuORrPXl2fVFncXh/KVCV6b0hRF+M0=;
	b=wpI9YdYscyP7QCk0acGuia//P2qYFkbm3gJQZYYqS49wM9ejXs+pjzQLph+Uzx69MOiUXl
	Dzd44jCbMLmFITkggEvIkAm9kK8h3TJ3NQYg+psnX8uBb8BKhZfFkfyBh2Wdw2kgXvorv9
	eN+z9CFui2CBPIgGQZOQQF36x8utOP0y0fQJb3RGGFp+NBRyRz1c5xTbr38vbYxcOwYfRv
	QvucfHJ04RIkd0cer+j9B5cOhisDGPDz1KoBqFmjWrEcCcdOuAoLnYILixUcoY6Ny0O5C1
	STlb6yGp3sbH9XbXZlR/i1R5QsvZxuS4ujVvU8GkDtrto5lcoxGddR9baDlKIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1694716723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0zxTlKID9c7YEvuORrPXl2fVFncXh/KVCV6b0hRF+M0=;
	b=3/nKE7xyHHA/3Sq2eQiSXccT5Z8HqEfiZ5GXPISOZOKMiLIeYRqscjaIjC5bCGvNvAVBW5
	tSThvy+KQFyPJZCA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH tty v1 11/74] serial: 8250_mtk: Use port lock wrappers
Date: Thu, 14 Sep 2023 20:43:28 +0206
Message-Id: <20230914183831.587273-12-john.ogness@linutronix.de>
In-Reply-To: <20230914183831.587273-1-john.ogness@linutronix.de>
References: <20230914183831.587273-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_113855_400742_CDD5EDD0 
X-CRM114-Status: GOOD (  14.74  )
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

From: Thomas Gleixner <tglx@linutronix.de>

When a serial port is used for kernel console output, then all
modifications to the UART registers which are done from other contexts,
e.g. getty, termios, are interference points for the kernel console.

So far this has been ignored and the printk output is based on the
principle of hope. The rework of the console infrastructure which aims to
support threaded and atomic consoles, requires to mark sections which
modify the UART registers as unsafe. This allows the atomic write function
to make informed decisions and eventually to restore operational state. It
also allows to prevent the regular UART code from modifying UART registers
while printk output is in progress.

All modifications of UART registers are guarded by the UART port lock,
which provides an obvious synchronization point with the console
infrastructure.

To avoid adding this functionality to all UART drivers, wrap the
spin_[un]lock*() invocations for uart_port::lock into helper functions
which just contain the spin_[un]lock*() invocations for now. In a
subsequent step these helpers will gain the console synchronization
mechanisms.

Converted with coccinelle. No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/tty/serial/8250/8250_mtk.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index 74da5676ce67..23457daae8a1 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -102,7 +102,7 @@ static void mtk8250_dma_rx_complete(void *param)
 	if (data->rx_status == DMA_RX_SHUTDOWN)
 		return;
 
-	spin_lock_irqsave(&up->port.lock, flags);
+	uart_port_lock_irqsave(&up->port, &flags);
 
 	dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state);
 	total = dma->rx_size - state.residue;
@@ -128,7 +128,7 @@ static void mtk8250_dma_rx_complete(void *param)
 
 	mtk8250_rx_dma(up);
 
-	spin_unlock_irqrestore(&up->port.lock, flags);
+	uart_port_unlock_irqrestore(&up->port, flags);
 }
 
 static void mtk8250_rx_dma(struct uart_8250_port *up)
@@ -368,7 +368,7 @@ mtk8250_set_termios(struct uart_port *port, struct ktermios *termios,
 	 * Ok, we're now changing the port state.  Do it with
 	 * interrupts disabled.
 	 */
-	spin_lock_irqsave(&port->lock, flags);
+	uart_port_lock_irqsave(port, &flags);
 
 	/*
 	 * Update the per-port timeout.
@@ -416,7 +416,7 @@ mtk8250_set_termios(struct uart_port *port, struct ktermios *termios,
 	if (uart_console(port))
 		up->port.cons->cflag = termios->c_cflag;
 
-	spin_unlock_irqrestore(&port->lock, flags);
+	uart_port_unlock_irqrestore(port, flags);
 	/* Don't rewrite B0 */
 	if (tty_termios_baud_rate(termios))
 		tty_termios_encode_baud_rate(termios, baud, baud);
-- 
2.39.2


