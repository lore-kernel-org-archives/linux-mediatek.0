Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E92C433E3
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 12:34:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 423C220792
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 12:34:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SNcBI3Ua";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FQD+HP7V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 423C220792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4N7Vf7LI7QBIjl82Ux4/GdG8EKidJcAQSdCi8XsLqPY=; b=SNcBI3UayVTfp2VmazP/lHViP
	Kx5F/egZLaZSOrDQCrG5iVxFNFi7ZCXFU0z5C3qWSaPLJ3lfSK4rKeRx44suDZBxjupAvjwk+SxsV
	UP+yfRAbubYp1bKW+6NIon44rHazOKkC5g4Ghl8Yf/ABMbIPoYc8udYbVenX2/3CBcNKagmFK/rJc
	gtS7ANBUTZjPRoLV54e+Hi0y2+xBcLCh9cZ+3hZpqF1sWy+J/KSiO5r33NOwIN5yIhImI0JQR3JPb
	pmv4imeuDpHRDCB9uMtoIKtokFI+/Q1jxDak/Agla3MEYu1s1qza49AR2r4fGpeSTSEoxa6ah349M
	tyBZwbwLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyDwn-0007gJ-H6; Wed, 22 Jul 2020 12:34:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyDwd-0007cC-0W; Wed, 22 Jul 2020 12:34:00 +0000
X-UUID: 35e7e27fb35f477d894269c0a4fc8160-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=aLmjvIyF1BWzJBOgWkh6tBLLu/lhJMxA+h9rtJu6iXU=; 
 b=FQD+HP7V+EniNyuj6nqp4/75FuRgjGFkDq5A21goXLmOCb+whRBbPgunGVc6uNtzDEkhORw8c0qGhVVrkr/zyX/Divlf1aF0+uFYlVjOTEo1v5VgTcdnFcDhFvC5eEp9BFx86+ei/z7Vh1+G7P+5B/afX0mnUydoHkpYo8t5EIk=;
X-UUID: 35e7e27fb35f477d894269c0a4fc8160-20200722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 808449206; Wed, 22 Jul 2020 04:33:36 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 05:32:55 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 20:32:54 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 20:32:54 +0800
From: Qii Wang <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
Subject: [PATCH 1/4] i2c: mediatek: Add apdma sync in i2c driver
Date: Wed, 22 Jul 2020 20:31:43 +0800
Message-ID: <1595421106-10017-2-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1595421106-10017-1-git-send-email-qii.wang@mediatek.com>
References: <1595421106-10017-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_083359_241901_2B61BD27 
X-CRM114-Status: GOOD (  13.93  )
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
Cc: qiangming.xia@mediatek.com, devicetree@vger.kernel.org,
 qii.wang@mediatek.com, srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

With the apdma remove hand-shake signal, it need to keep i2c and
apdma in sync manually.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index deef69e..e6b984a 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -48,6 +48,9 @@
 
 #define I2C_DMA_CON_TX			0x0000
 #define I2C_DMA_CON_RX			0x0001
+#define I2C_DMA_ASYNC_MODE		0x0004
+#define I2C_DMA_SKIP_CONFIG		0x0010
+#define I2C_DMA_DIR_CHANGE		0x0200
 #define I2C_DMA_START_EN		0x0001
 #define I2C_DMA_INT_FLAG_NONE		0x0000
 #define I2C_DMA_CLR_FLAG		0x0000
@@ -205,6 +208,7 @@ struct mtk_i2c_compatible {
 	unsigned char timing_adjust: 1;
 	unsigned char dma_sync: 1;
 	unsigned char ltiming_adjust: 1;
+	unsigned char apdma_sync: 1;
 };
 
 struct mtk_i2c_ac_timing {
@@ -311,6 +315,7 @@ struct i2c_spec_values {
 	.timing_adjust = 1,
 	.dma_sync = 0,
 	.ltiming_adjust = 0,
+	.apdma_sync = 0,
 };
 
 static const struct mtk_i2c_compatible mt6577_compat = {
@@ -324,6 +329,7 @@ struct i2c_spec_values {
 	.timing_adjust = 0,
 	.dma_sync = 0,
 	.ltiming_adjust = 0,
+	.apdma_sync = 0,
 };
 
 static const struct mtk_i2c_compatible mt6589_compat = {
@@ -337,6 +343,7 @@ struct i2c_spec_values {
 	.timing_adjust = 0,
 	.dma_sync = 0,
 	.ltiming_adjust = 0,
+	.apdma_sync = 0,
 };
 
 static const struct mtk_i2c_compatible mt7622_compat = {
@@ -350,6 +357,7 @@ struct i2c_spec_values {
 	.timing_adjust = 0,
 	.dma_sync = 0,
 	.ltiming_adjust = 0,
+	.apdma_sync = 0,
 };
 
 static const struct mtk_i2c_compatible mt8173_compat = {
@@ -362,6 +370,7 @@ struct i2c_spec_values {
 	.timing_adjust = 0,
 	.dma_sync = 0,
 	.ltiming_adjust = 0,
+	.apdma_sync = 0,
 };
 
 static const struct mtk_i2c_compatible mt8183_compat = {
@@ -375,6 +384,7 @@ struct i2c_spec_values {
 	.timing_adjust = 1,
 	.dma_sync = 1,
 	.ltiming_adjust = 1,
+	.apdma_sync = 0,
 };
 
 static const struct of_device_id mtk_i2c_of_match[] = {
@@ -798,6 +808,7 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 	u16 start_reg;
 	u16 control_reg;
 	u16 restart_flag = 0;
+	u16 dma_sync = 0;
 	u32 reg_4g_mode;
 	u8 *dma_rd_buf = NULL;
 	u8 *dma_wr_buf = NULL;
@@ -851,10 +862,16 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 		mtk_i2c_writew(i2c, num, OFFSET_TRANSAC_LEN);
 	}
 
+	if (i2c->dev_comp->apdma_sync) {
+		dma_sync = I2C_DMA_SKIP_CONFIG | I2C_DMA_ASYNC_MODE;
+		if (i2c->op == I2C_MASTER_WRRD)
+			dma_sync |= I2C_DMA_DIR_CHANGE;
+	}
+
 	/* Prepare buffer data to start transfer */
 	if (i2c->op == I2C_MASTER_RD) {
 		writel(I2C_DMA_INT_FLAG_NONE, i2c->pdmabase + OFFSET_INT_FLAG);
-		writel(I2C_DMA_CON_RX, i2c->pdmabase + OFFSET_CON);
+		writel(I2C_DMA_CON_RX | dma_sync, i2c->pdmabase + OFFSET_CON);
 
 		dma_rd_buf = i2c_get_dma_safe_msg_buf(msgs, 1);
 		if (!dma_rd_buf)
@@ -877,7 +894,7 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 		writel(msgs->len, i2c->pdmabase + OFFSET_RX_LEN);
 	} else if (i2c->op == I2C_MASTER_WR) {
 		writel(I2C_DMA_INT_FLAG_NONE, i2c->pdmabase + OFFSET_INT_FLAG);
-		writel(I2C_DMA_CON_TX, i2c->pdmabase + OFFSET_CON);
+		writel(I2C_DMA_CON_TX | dma_sync, i2c->pdmabase + OFFSET_CON);
 
 		dma_wr_buf = i2c_get_dma_safe_msg_buf(msgs, 1);
 		if (!dma_wr_buf)
@@ -900,7 +917,7 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 		writel(msgs->len, i2c->pdmabase + OFFSET_TX_LEN);
 	} else {
 		writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_INT_FLAG);
-		writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_CON);
+		writel(I2C_DMA_CLR_FLAG | dma_sync, i2c->pdmabase + OFFSET_CON);
 
 		dma_wr_buf = i2c_get_dma_safe_msg_buf(msgs, 1);
 		if (!dma_wr_buf)
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
