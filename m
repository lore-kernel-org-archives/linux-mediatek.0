Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127CBC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 12:37:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89AC42168B
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 12:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89AC42168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n+GEu3AKSgymK2M7ZuhfTNH07miTkSLCb0ePq7w56c0=; b=fUvcmKauGXzhYcAucIagVm1U9e
	EdqnhvP5PLUqQYCbnWikY+ywSR6On+/lglD8gDgahN8TzEThUBWpwUbd6qdfee1gP44hsb8ZVmHkz
	Wap28IPxgU+Bmrz3R86riHf3mGMUBxoh42se2sAzMaOasKePSmx8egJ3X+h6G6w31dmr+tXzFgEin
	kvNyC25gu9r3eG0H+uejMq2wo2jlQyFYIzGJJY8Fzuw37bkA8JAZ5+D8To2H6x8mQP1XDn0KXKfl4
	JcawyysfBtwgNylUB9Xwh2mJbo7MhlAPpvkPf7X0dhF11G/NhnF6Ifxwze35cBUtRu9qI8PlHfUM6
	ZXRmmw2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksPs6-00069Z-Al; Thu, 24 Dec 2020 12:37:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksPrz-00067y-Lc; Thu, 24 Dec 2020 12:37:28 +0000
X-UUID: 67731c19ca574a9f9ada0d39b3d4cbf5-20201224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=TeY34OAisQETUy5dRYgBUJiB8+HZVgsg9/sjI6JIPJE=; 
 b=ljgSKLijtHLRJ37Ix5hC2XBMEBDyLYcgxz8XEIN6x7/5E2vUqF5WsuMZxwPezAfI4cQ+xx2OjEyZX1QC87PFm7Zbs+c0X5yJ6WEFXQGDE9a8ZDE0sPhUDxJZ52/phZllFYjLKgmKtDsgn1Up9V/nMLpa0+DiIYGRt8B7YDxMV6Y=;
X-UUID: 67731c19ca574a9f9ada0d39b3d4cbf5-20201224
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 510093111; Thu, 24 Dec 2020 04:36:19 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 04:26:16 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 20:26:13 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Dec 2020 20:26:13 +0800
From: <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
Subject: i2c: mediatek: Fix apdma and i2c hand-shake timeout
Date: Thu, 24 Dec 2020 20:26:07 +0800
Message-ID: <1608812767-3254-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_073727_903602_72CEAC05 
X-CRM114-Status: GOOD (  11.62  )
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
Cc: qii.wang@mediatek.com, srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Qii Wang <qii.wang@mediatek.com>

With the apdma remove hand-shake signal, it requirs special
operation timing to reset i2c manually, otherwise the interrupt
will not be triggered, i2c transmission will be timeout.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

base Message ID: 1605701861-30800-1-git-send-email-qii.wang@mediatek.com

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 6f61595..2ffd2f3 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -38,6 +38,7 @@
 #define I2C_IO_CONFIG_OPEN_DRAIN	0x0003
 #define I2C_IO_CONFIG_PUSH_PULL		0x0000
 #define I2C_SOFT_RST			0x0001
+#define I2C_HANDSHAKE_RST		0x0020
 #define I2C_FIFO_ADDR_CLR		0x0001
 #define I2C_DELAY_LEN			0x0002
 #define I2C_TIME_CLR_VALUE		0x0000
@@ -45,6 +46,7 @@
 #define I2C_WRRD_TRANAC_VALUE		0x0002
 #define I2C_RD_TRANAC_VALUE		0x0001
 #define I2C_SCL_MIS_COMP_VALUE		0x0000
+#define I2C_CHN_CLR_FLAG		0x0000
 
 #define I2C_DMA_CON_TX			0x0000
 #define I2C_DMA_CON_RX			0x0001
@@ -54,7 +56,9 @@
 #define I2C_DMA_START_EN		0x0001
 #define I2C_DMA_INT_FLAG_NONE		0x0000
 #define I2C_DMA_CLR_FLAG		0x0000
+#define I2C_DMA_WARM_RST		0x0001
 #define I2C_DMA_HARD_RST		0x0002
+#define I2C_DMA_HANDSHAKE_RST		0x0004
 
 #define MAX_SAMPLE_CNT_DIV		8
 #define MAX_STEP_CNT_DIV		64
@@ -475,11 +479,24 @@ static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 {
 	u16 control_reg;
 
-	writel(I2C_DMA_HARD_RST, i2c->pdmabase + OFFSET_RST);
-	udelay(50);
-	writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_RST);
-
-	mtk_i2c_writew(i2c, I2C_SOFT_RST, OFFSET_SOFTRESET);
+	if (i2c->dev_comp->dma_sync) {
+		writel(I2C_DMA_WARM_RST, i2c->pdmabase + OFFSET_RST);
+		udelay(10);
+		writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_RST);
+		udelay(10);
+		writel(I2C_DMA_HANDSHAKE_RST | I2C_DMA_HARD_RST,
+		       i2c->pdmabase + OFFSET_RST);
+		mtk_i2c_writew(i2c, I2C_HANDSHAKE_RST | I2C_SOFT_RST,
+			       OFFSET_SOFTRESET);
+		udelay(10);
+		writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_RST);
+		mtk_i2c_writew(i2c, I2C_CHN_CLR_FLAG, OFFSET_SOFTRESET);
+	} else {
+		writel(I2C_DMA_HARD_RST, i2c->pdmabase + OFFSET_RST);
+		udelay(50);
+		writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_RST);
+		mtk_i2c_writew(i2c, I2C_SOFT_RST, OFFSET_SOFTRESET);
+	}
 
 	/* Set ioconfig */
 	if (i2c->use_push_pull)
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
