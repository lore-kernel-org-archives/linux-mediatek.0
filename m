Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F5CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 13:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bFOQmlnjg/F8dh3t/tcivwEXkx/vhj07NiVuRWFUlCc=; b=35vOP5iELc0zrO
	+i40GDgcp4RylzH6NdfYvCNvK0AyVxds5EK9RnVWGYSTNCs2rXFJhxZKOhvL+4ZbIGvwMpK01zQQ/
	PyE88vg+Dqev6cxHmpW4Sm+2G8L/lWMLdDLQ7CwzmMmt00mPQxEWLtviYggum6Y6Hkdsce4cyl46K
	7WMHMX04UZdGcLrLsL6T3OAtGcmrxUQg86lzFauHazR92pFkFesIV+nn2znDxa1/H57whyEd4vdMU
	yow2INHX4IuyrdmE9HUosxReh1x3EtQqoAGAYGe29+BVW32Hjo1KmN3hu4vBKMtTlSU66CmwjKK8R
	HnWygeSlxws8+lfBOj+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njhem-001WoV-KD; Wed, 27 Apr 2022 13:24:36 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njhe6-001WWH-27; Wed, 27 Apr 2022 13:23:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 295841F44713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651065815;
 bh=RYxkRKR/3cb3vO8LFUsbVomDNF2N7fZfsSHl253gbJo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GvauR+UFrvlr16NuXikZ4xqvxHUuYosy7/elmDi1uLZJ/0qtujA+fxTIF4GgIrfML
 51OuOWqZdmphgHexTugZIhUq66T7pTs60Tp+yuCaIL3+gwdRIRzNxLe5GfwgHxiz/j
 QhOwC0e/9swV2+fk8Hp/hom9QA4Y/kmK95qwoPLeziviiXjK6bBTvMZO1EWiI3qC5Y
 UQ3hUwjF2LOhIkmORZnegIhXYEK5m63eUuWcyV6KieJKeFa1QuMexmmM15pfaYWvIn
 P+7w1KsiZNZg0jl2PavK9mu/ztDgcKUge51kgFjT+KQEJQmuqp391Ela1nrV6L3yfj
 3jmXh7Pjo18pQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: gregkh@linuxfoundation.org
Cc: jirislaby@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, zhiyong.tao@mediatek.com,
 colin.king@intel.com, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] serial: 8250_mtk: Fix UART_EFR register address
Date: Wed, 27 Apr 2022 15:23:26 +0200
Message-Id: <20220427132328.228297-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427132328.228297-1-angelogioacchino.delregno@collabora.com>
References: <20220427132328.228297-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_062354_263130_984364D8 
X-CRM114-Status: GOOD (  13.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On MediaTek SoCs, the UART IP is 16550A compatible, but there are some
specific quirks: we are declaring a register shift of 2, but this is
only valid for the majority of the registers, as there are some that
are out of the standard layout.

Specifically, this driver is using definitions from serial_reg.h, where
we have a UART_EFR register defined as 2: this results in a 0x8 offset,
but there we have the FCR register instead.

The right offset for the EFR register on MediaTek UART is at 0x98,
so, following the decimal definition convention in serial_reg.h and
accounting for the register left shift of two, add and use the correct
register address for this IP, defined as decimal 38, so that the final
calculation results in (0x26 << 2) = 0x98.

Fixes: bdbd0a7f8f03 ("serial: 8250-mtk: modify baudrate setting")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/tty/serial/8250/8250_mtk.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index f4a0caa56f84..cd62a5f34014 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -37,6 +37,7 @@
 #define MTK_UART_IER_RTSI	0x40	/* Enable RTS Modem status interrupt */
 #define MTK_UART_IER_CTSI	0x80	/* Enable CTS Modem status interrupt */
 
+#define MTK_UART_EFR		38	/* I/O: Extended Features Register */
 #define MTK_UART_EFR_EN		0x10	/* Enable enhancement feature */
 #define MTK_UART_EFR_RTS	0x40	/* Enable hardware rx flow control */
 #define MTK_UART_EFR_CTS	0x80	/* Enable hardware tx flow control */
@@ -169,7 +170,7 @@ static void mtk8250_dma_enable(struct uart_8250_port *up)
 		   MTK_UART_DMA_EN_RX | MTK_UART_DMA_EN_TX);
 
 	serial_out(up, UART_LCR, UART_LCR_CONF_MODE_B);
-	serial_out(up, UART_EFR, UART_EFR_ECB);
+	serial_out(up, MTK_UART_EFR, UART_EFR_ECB);
 	serial_out(up, UART_LCR, lcr);
 
 	if (dmaengine_slave_config(dma->rxchan, &dma->rxconf) != 0)
@@ -232,7 +233,7 @@ static void mtk8250_set_flow_ctrl(struct uart_8250_port *up, int mode)
 	int lcr = serial_in(up, UART_LCR);
 
 	serial_out(up, UART_LCR, UART_LCR_CONF_MODE_B);
-	serial_out(up, UART_EFR, UART_EFR_ECB);
+	serial_out(up, MTK_UART_EFR, UART_EFR_ECB);
 	serial_out(up, UART_LCR, lcr);
 	lcr = serial_in(up, UART_LCR);
 
@@ -241,7 +242,7 @@ static void mtk8250_set_flow_ctrl(struct uart_8250_port *up, int mode)
 		serial_out(up, MTK_UART_ESCAPE_DAT, MTK_UART_ESCAPE_CHAR);
 		serial_out(up, MTK_UART_ESCAPE_EN, 0x00);
 		serial_out(up, UART_LCR, UART_LCR_CONF_MODE_B);
-		serial_out(up, UART_EFR, serial_in(up, UART_EFR) &
+		serial_out(up, MTK_UART_EFR, serial_in(up, MTK_UART_EFR) &
 			(~(MTK_UART_EFR_HW_FC | MTK_UART_EFR_SW_FC_MASK)));
 		serial_out(up, UART_LCR, lcr);
 		mtk8250_disable_intrs(up, MTK_UART_IER_XOFFI |
@@ -255,8 +256,8 @@ static void mtk8250_set_flow_ctrl(struct uart_8250_port *up, int mode)
 		serial_out(up, UART_LCR, UART_LCR_CONF_MODE_B);
 
 		/*enable hw flow control*/
-		serial_out(up, UART_EFR, MTK_UART_EFR_HW_FC |
-			(serial_in(up, UART_EFR) &
+		serial_out(up, MTK_UART_EFR, MTK_UART_EFR_HW_FC |
+			(serial_in(up, MTK_UART_EFR) &
 			(~(MTK_UART_EFR_HW_FC | MTK_UART_EFR_SW_FC_MASK))));
 
 		serial_out(up, UART_LCR, lcr);
@@ -270,8 +271,8 @@ static void mtk8250_set_flow_ctrl(struct uart_8250_port *up, int mode)
 		serial_out(up, UART_LCR, UART_LCR_CONF_MODE_B);
 
 		/*enable sw flow control */
-		serial_out(up, UART_EFR, MTK_UART_EFR_XON1_XOFF1 |
-			(serial_in(up, UART_EFR) &
+		serial_out(up, MTK_UART_EFR, MTK_UART_EFR_XON1_XOFF1 |
+			(serial_in(up, MTK_UART_EFR) &
 			(~(MTK_UART_EFR_HW_FC | MTK_UART_EFR_SW_FC_MASK))));
 
 		serial_out(up, UART_XON1, START_CHAR(port->state->port.tty));
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
