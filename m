Return-Path: <SRS0=PAw8=BP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2542FC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 11:04:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5A7022D00
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 11:03:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kGNZYv9o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mLoon+iK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5A7022D00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QvDdj9yLmXEN2HvDQ7JlXV94e043znsLbGM+r5CrW7w=; b=kGNZYv9oqMi6k1/TYLtL4/Ejx
	C/XIC5tChYBwFJLshKdPHr7eJH1Ims28KUAtgrWBP1XvChdEerE4/8MaW9eKDuf54hkVOh8n0E3Dh
	ZzkBzwrHVIwHuUc/Czw/U/u6I7X0YJYou8mCsonYz5lwo8aWLDBoSKrDAfGKh7eq/O8ozHniPZxAv
	bpEsfH9/pwlDmXnafvaJRvJzDzmzC7YXsqzzHfmzVE8WdnVvRZeKFJ4Nnq25VFDkOoB3/4PE+6YF8
	FKr1zn4gRwTePErgv/pTTEbw1xR52iU5pjnF8XHGeqT1f4tsXwCzLDUd4KHHYetXyPxNVYVi9T/Po
	l1cfW79Xw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3HD1-0005Nj-Kh; Wed, 05 Aug 2020 11:03:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3HCg-0005AG-Tn; Wed, 05 Aug 2020 11:03:29 +0000
X-UUID: 2e55d4f6dac242a5a0acf8e778bb669a-20200805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=tWETgV80oKa12y7OJg8hJVWC3udr9qgCf1OmDSZNG+A=; 
 b=mLoon+iKJYOusow8i9mVk1uE6o8v6dFKOMBJGQjvP+D4Uw6UwG0pY0nKHax0pOdRdRoR0u0qPjYzxYrOq8b9WWaOUlyPQsdEs+a34g1GIXvvepB6/kvhAiCUTW6X9jEPeqnZmWlwjfTu0ho7uAJGfspt1jtu4xFunyvikQaPmL8=;
X-UUID: 2e55d4f6dac242a5a0acf8e778bb669a-20200805
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 646924095; Wed, 05 Aug 2020 03:03:42 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 Aug 2020 03:53:19 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 Aug 2020 18:53:17 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 5 Aug 2020 18:53:18 +0800
From: Qii Wang <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
Subject: [PATCH v3 2/4] i2c: mediatek: Add access to more than 8GB dram in i2c
 driver
Date: Wed, 5 Aug 2020 18:52:20 +0800
Message-ID: <1596624742-14727-3-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1596624742-14727-1-git-send-email-qii.wang@mediatek.com>
References: <1596624742-14727-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_070327_257634_8239B6C7 
X-CRM114-Status: GOOD (  15.77  )
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
Cc: devicetree@vger.kernel.org, qii.wang@mediatek.com,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Newer MTK chip support more than 8GB of dram. Replace support_33bits
with more general dma_max_support and remove mtk_i2c_set_4g_mode.

Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index e6b984a..463860e 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -55,7 +55,6 @@
 #define I2C_DMA_INT_FLAG_NONE		0x0000
 #define I2C_DMA_CLR_FLAG		0x0000
 #define I2C_DMA_HARD_RST		0x0002
-#define I2C_DMA_4G_MODE			0x0001
 
 #define MAX_SAMPLE_CNT_DIV		8
 #define MAX_STEP_CNT_DIV		64
@@ -204,11 +203,11 @@ struct mtk_i2c_compatible {
 	unsigned char dcm: 1;
 	unsigned char auto_restart: 1;
 	unsigned char aux_len_reg: 1;
-	unsigned char support_33bits: 1;
 	unsigned char timing_adjust: 1;
 	unsigned char dma_sync: 1;
 	unsigned char ltiming_adjust: 1;
 	unsigned char apdma_sync: 1;
+	unsigned char max_dma_support;
 };
 
 struct mtk_i2c_ac_timing {
@@ -311,11 +310,11 @@ struct i2c_spec_values {
 	.dcm = 1,
 	.auto_restart = 1,
 	.aux_len_reg = 1,
-	.support_33bits = 1,
 	.timing_adjust = 1,
 	.dma_sync = 0,
 	.ltiming_adjust = 0,
 	.apdma_sync = 0,
+	.max_dma_support = 33,
 };
 
 static const struct mtk_i2c_compatible mt6577_compat = {
@@ -325,11 +324,11 @@ struct i2c_spec_values {
 	.dcm = 1,
 	.auto_restart = 0,
 	.aux_len_reg = 0,
-	.support_33bits = 0,
 	.timing_adjust = 0,
 	.dma_sync = 0,
 	.ltiming_adjust = 0,
 	.apdma_sync = 0,
+	.max_dma_support = 32,
 };
 
 static const struct mtk_i2c_compatible mt6589_compat = {
@@ -339,11 +338,11 @@ struct i2c_spec_values {
 	.dcm = 0,
 	.auto_restart = 0,
 	.aux_len_reg = 0,
-	.support_33bits = 0,
 	.timing_adjust = 0,
 	.dma_sync = 0,
 	.ltiming_adjust = 0,
 	.apdma_sync = 0,
+	.max_dma_support = 32,
 };
 
 static const struct mtk_i2c_compatible mt7622_compat = {
@@ -353,11 +352,11 @@ struct i2c_spec_values {
 	.dcm = 1,
 	.auto_restart = 1,
 	.aux_len_reg = 1,
-	.support_33bits = 0,
 	.timing_adjust = 0,
 	.dma_sync = 0,
 	.ltiming_adjust = 0,
 	.apdma_sync = 0,
+	.max_dma_support = 32,
 };
 
 static const struct mtk_i2c_compatible mt8173_compat = {
@@ -366,11 +365,11 @@ struct i2c_spec_values {
 	.dcm = 1,
 	.auto_restart = 1,
 	.aux_len_reg = 1,
-	.support_33bits = 1,
 	.timing_adjust = 0,
 	.dma_sync = 0,
 	.ltiming_adjust = 0,
 	.apdma_sync = 0,
+	.max_dma_support = 33,
 };
 
 static const struct mtk_i2c_compatible mt8183_compat = {
@@ -380,11 +379,11 @@ struct i2c_spec_values {
 	.dcm = 0,
 	.auto_restart = 1,
 	.aux_len_reg = 1,
-	.support_33bits = 1,
 	.timing_adjust = 1,
 	.dma_sync = 1,
 	.ltiming_adjust = 1,
 	.apdma_sync = 0,
+	.max_dma_support = 33,
 };
 
 static const struct of_device_id mtk_i2c_of_match[] = {
@@ -796,11 +795,6 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
 	return 0;
 }
 
-static inline u32 mtk_i2c_set_4g_mode(dma_addr_t addr)
-{
-	return (addr & BIT_ULL(32)) ? I2C_DMA_4G_MODE : I2C_DMA_CLR_FLAG;
-}
-
 static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 			       int num, int left_num)
 {
@@ -885,8 +879,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 			return -ENOMEM;
 		}
 
-		if (i2c->dev_comp->support_33bits) {
-			reg_4g_mode = mtk_i2c_set_4g_mode(rpaddr);
+		if (i2c->dev_comp->max_dma_support > 32) {
+			reg_4g_mode = upper_32_bits(rpaddr);
 			writel(reg_4g_mode, i2c->pdmabase + OFFSET_RX_4G_MODE);
 		}
 
@@ -908,8 +902,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 			return -ENOMEM;
 		}
 
-		if (i2c->dev_comp->support_33bits) {
-			reg_4g_mode = mtk_i2c_set_4g_mode(wpaddr);
+		if (i2c->dev_comp->max_dma_support > 32) {
+			reg_4g_mode = upper_32_bits(wpaddr);
 			writel(reg_4g_mode, i2c->pdmabase + OFFSET_TX_4G_MODE);
 		}
 
@@ -954,11 +948,11 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 			return -ENOMEM;
 		}
 
-		if (i2c->dev_comp->support_33bits) {
-			reg_4g_mode = mtk_i2c_set_4g_mode(wpaddr);
+		if (i2c->dev_comp->max_dma_support > 32) {
+			reg_4g_mode = upper_32_bits(wpaddr);
 			writel(reg_4g_mode, i2c->pdmabase + OFFSET_TX_4G_MODE);
 
-			reg_4g_mode = mtk_i2c_set_4g_mode(rpaddr);
+			reg_4g_mode = upper_32_bits(rpaddr);
 			writel(reg_4g_mode, i2c->pdmabase + OFFSET_RX_4G_MODE);
 		}
 
@@ -1232,8 +1226,9 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	if (i2c->dev_comp->support_33bits) {
-		ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(33));
+	if (i2c->dev_comp->max_dma_support > 32) {
+		ret = dma_set_mask(&pdev->dev,
+				DMA_BIT_MASK(i2c->dev_comp->max_dma_support));
 		if (ret) {
 			dev_err(&pdev->dev, "dma_set_mask return error.\n");
 			return ret;
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
