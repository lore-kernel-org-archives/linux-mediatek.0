Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D043C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 13:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPx9lS1WKjOJD1yw18MoIMw+r3M7WrocKSh58VJLeLA=; b=wCYWIJ39pw3201
	fq4JoSXn0mFCOL9PKQiiG4CUxmtz2jkGgb9y18Jynp5onHrGtMn1XUWWuNYIlIDqiliXYLmeiKek9
	E2Ko0b8BJ3yz4SO5Lo2T5dQ1o7QbWO5NZKUN8ixdwH+j2iF0V+SESEEtG5FilRBn/XhnlslDE6R76
	9Eeo1dfAo1iao4cDVWj6Z5rf8ap4zkLk+k1hZhR3iAHhMqsrNJqudYpJVS2SDJemR3nYnACGyCbCS
	VL1SZOcZ5EKhD0w4VmUBtqNhV2dLHWdwQheZM25qnVsftJvjH2OhK2T6c9wKykXbKdOOWnJSmWJJb
	zf6lIQJYHs0ZUIfoNBqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njhek-001WnL-H6; Wed, 27 Apr 2022 13:24:34 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njhe6-001WWJ-JJ; Wed, 27 Apr 2022 13:23:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id CD93E1F44716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651065816;
 bh=DmoK0UuR6v0KpHbytvgVmKG60bVewljbgv1egm4cK/s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IvT6aF6BxtYKQDJmcGXm54ZVfHKQuAwNDg1kNCCy3eEcAhO1olbkSIAadBtFoY2qL
 tbgrM/unQKwMq5ZcHl7NsBqivWgIw0ThY+9E29fUyQiMoP9zqIOYVwUrg9tdNftBkf
 E66pCVA65kafC7IWLGpoYojTL8oNVjhVqptymXiJV0Q7Xh5Vpl3MyFShwtZRyE/3p5
 9O6JGABSPB4OSeEvXfXbkh3gnkKDx9rScLFgOJCGIl/bK4vah5EiuMF9HE3c3VEvsg
 BD3WVR+7GSY1X/ZBf/sTiTVtTvDDo3CCgg/Rdeqd+HtJKEfu5jx5MrIHhMXkvfbqHl
 Fx96R6HVv0RBA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: gregkh@linuxfoundation.org
Cc: jirislaby@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, zhiyong.tao@mediatek.com,
 colin.king@intel.com, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] serial: 8250_mtk: Make sure to select the right
 FEATURE_SEL
Date: Wed, 27 Apr 2022 15:23:27 +0200
Message-Id: <20220427132328.228297-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427132328.228297-1-angelogioacchino.delregno@collabora.com>
References: <20220427132328.228297-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_062354_801652_F63D1CF3 
X-CRM114-Status: GOOD (  11.26  )
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

Set the FEATURE_SEL at probe time to make sure that BIT(0) is enabled:
this guarantees that when the port is configured as AP UART, the
right register layout is interpreted by the UART IP.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/tty/serial/8250/8250_mtk.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index cd62a5f34014..28e36459642c 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -54,6 +54,9 @@
 #define MTK_UART_TX_TRIGGER	1
 #define MTK_UART_RX_TRIGGER	MTK_UART_RX_SIZE
 
+#define MTK_UART_FEATURE_SEL	39	/* Feature Selection register */
+#define MTK_UART_FEAT_NEWRMAP	BIT(0)	/* Use new register map */
+
 #ifdef CONFIG_SERIAL_8250_DMA
 enum dma_rx_status {
 	DMA_RX_START = 0,
@@ -569,6 +572,10 @@ static int mtk8250_probe(struct platform_device *pdev)
 		uart.dma = data->dma;
 #endif
 
+	/* Set AP UART new register map */
+	writel(MTK_UART_FEAT_NEWRMAP, uart.port.membase +
+	       (MTK_UART_FEATURE_SEL << uart.port.regshift));
+
 	/* Disable Rate Fix function */
 	writel(0x0, uart.port.membase +
 			(MTK_UART_RATE_FIX << uart.port.regshift));
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
