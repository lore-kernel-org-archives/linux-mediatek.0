Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04579C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 12:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=isZDSCCJWFYlxOn89xSXZDtIIup3Lwi3uzg+vWv1fvE=; b=af9FR80CKlLw1w
	+h8mvDe7vutV5gwCqym54NCfTYE+rQSzc1ADGQKy2wU7EPqzNzKEum8RcDA3GG2SfagE3NvnU3Z2c
	0PoUGVb9qfqelSMrXLa4phcD5YtVMDELE0FuNcQ8m2lm/+79TGT/0fhCc/RWDadffYszAHxd3oLLB
	HXFpq2Ca0AhnxTTYkT0f2a5ZV5FPunpEoMk+VyOmkNMoJdsmj4aLDmAWoTJAU8CH/yzWwKnxychlq
	TWxA4TdJwBZWwBmIci3O7woD3NYW2FMFRRXuWwFegRLd9vyiBWXif3j57q6vmEw9W79IsNZ4fXKdN
	6JkHG+whidSU5/RSJlaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noOx3-001rju-4v; Tue, 10 May 2022 12:26:53 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noOws-001rbt-BV; Tue, 10 May 2022 12:26:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2DE551F414F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652185587;
 bh=BQiR+KethrLXSU5KRNxuCKrRdMtiP4LV9NgZmry1IWE=;
 h=From:To:Cc:Subject:Date:From;
 b=UK52OjymyXQ50bxoRn93D0H1e5AAiwKBVZ3CH5REP+WHLsQfiDY1Cr1yf+HvPeHme
 xZs2t6DYTdc3jgYH+FKahT6uhO30jn8605JcDiT78hETmnKriBbjXpWna273HPekNa
 3NxX6Mea2XVUY8lJuTYAwpUQ2Y7veS4HTV+o8C3VpP2BC0h0xA87aA4mvIuGyBDcpx
 0r5fF2hUoWTUn3mg/y/8/qefUvhl4Y4CF+jvWRmMk6BCO2HEq0LriJjOGz/KOextMH
 521oSnKXv/Vh1rF0+pDIoUoIaNZTke5cikYs+Fz752WOlD/EP6gTDj5EXPMFiTJMBZ
 eY171MRqval0Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: gregkh@linuxfoundation.org
Cc: jirislaby@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, zhiyong.tao@mediatek.com,
 colin.king@intel.com, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, wenst@chromium.org, broonie@kernel.org
Subject: [PATCH] Revert "serial: 8250_mtk: Make sure to select the right
 FEATURE_SEL"
Date: Tue, 10 May 2022 14:26:20 +0200
Message-Id: <20220510122620.150342-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_052642_640052_8B1730E4 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

It was found that some MediaTek SoCs are incompatible with this
change. Also, this register was mistakenly understood as it was
related to the 16550A register layout selection but, at least
on some IPs, if not all, it's related to something else unknown.

This reverts commit 6f81fdded0d024c7d4084d434764f30bca1cd6b1.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/tty/serial/8250/8250_mtk.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index 21053db93ff1..54051ec7b499 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -54,9 +54,6 @@
 #define MTK_UART_TX_TRIGGER	1
 #define MTK_UART_RX_TRIGGER	MTK_UART_RX_SIZE
 
-#define MTK_UART_FEATURE_SEL	39	/* Feature Selection register */
-#define MTK_UART_FEAT_NEWRMAP	BIT(0)	/* Use new register map */
-
 #define MTK_UART_XON1		40	/* I/O: Xon character 1 */
 #define MTK_UART_XOFF1		42	/* I/O: Xoff character 1 */
 
@@ -575,10 +572,6 @@ static int mtk8250_probe(struct platform_device *pdev)
 		uart.dma = data->dma;
 #endif
 
-	/* Set AP UART new register map */
-	writel(MTK_UART_FEAT_NEWRMAP, uart.port.membase +
-	       (MTK_UART_FEATURE_SEL << uart.port.regshift));
-
 	/* Disable Rate Fix function */
 	writel(0x0, uart.port.membase +
 			(MTK_UART_RATE_FIX << uart.port.regshift));
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
