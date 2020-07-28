Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A2BC43445
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 12:32:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94C772075D
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 12:32:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F5AwdFpb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fg4+0vcA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94C772075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Oo4AoFHdnNJT3itonHtOlY/qF+0HFujMjAFtAEOoS18=; b=F5AwdFpb4tP/x1H/u612gvpl9
	7M3CjSXb8FmxwVVX3dEoPZsZlaEVfo9OMM1RuyNWTYinbhRDwHunX7mALPN1JBM04X8afQj+JmVob
	ZV3Nmnx/NNOihOFEHJR7jgCK9ayi95u6bh/LTNrqdUPbZP4jqPcZDxAOnJHpzMf+9JTQkd20Pr95s
	capDGLE1GWq9+VKTIsiF658ktK1SmFJSAY5I/qIS4clsQQBBF/lomJGszqKH5dLHyIiqKHLh083xX
	Z5F2OyWjr8oSG/vV5JRa8p7ddGCrSpk33Ye0g9u1JCnehVqdOpFXzNFz3eL4QmCBWt5n2d2PcehZf
	UhVdAw0sA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0Olt-0002Ae-8O; Tue, 28 Jul 2020 12:31:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0Olj-00023V-3R; Tue, 28 Jul 2020 12:31:44 +0000
X-UUID: a5f8c9db43554b1b8a46da7d54739256-20200728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5uP+aIDy6VjZk5zmzE0452gd7yHiCSfjQ3mMWdIPP5M=; 
 b=fg4+0vcAwpzrqgxR8nh5RH64spNHJ54OLwzNcRJ5HIoUP4VnJ3ba1jCJ6hWiCQ969xBvKNt7P9IEQ+ESFMizxHR9+1kemXgmDDMqY9NGt4Cqb9C56Na2Is19H+j+5z5PMVtUHQWJNcwRxmp6E9ogEix4ByliwuDFTkqZIMjeLAo=;
X-UUID: a5f8c9db43554b1b8a46da7d54739256-20200728
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1060830530; Tue, 28 Jul 2020 04:31:29 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 05:31:33 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 20:31:30 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Jul 2020 20:31:30 +0800
From: Qii Wang <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
Subject: [PATCH v2 2/4] i2c: mediatek: Add access to more than 8GB dram in i2c
 driver
Date: Tue, 28 Jul 2020 20:30:44 +0800
Message-ID: <1595939446-5484-3-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1595939446-5484-1-git-send-email-qii.wang@mediatek.com>
References: <1595939446-5484-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_083143_316560_FF25BF1A 
X-CRM114-Status: GOOD (  15.51  )
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

Newer MTK chip support more than 8GB of dram. Replace support_33bits
with more general dma_max_support and remove mtk_i2c_set_4g_mode.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index e6b984a..49777a6 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -204,11 +204,11 @@ struct mtk_i2c_compatible {
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
@@ -311,11 +311,11 @@ struct i2c_spec_values {
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
@@ -325,11 +325,11 @@ struct i2c_spec_values {
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
@@ -339,11 +339,11 @@ struct i2c_spec_values {
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
@@ -353,11 +353,11 @@ struct i2c_spec_values {
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
@@ -366,11 +366,11 @@ struct i2c_spec_values {
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
@@ -380,11 +380,11 @@ struct i2c_spec_values {
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
@@ -796,11 +796,6 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
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
@@ -885,8 +880,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 			return -ENOMEM;
 		}
 
-		if (i2c->dev_comp->support_33bits) {
-			reg_4g_mode = mtk_i2c_set_4g_mode(rpaddr);
+		if (i2c->dev_comp->max_dma_support > 32) {
+			reg_4g_mode = upper_32_bits(rpaddr);
 			writel(reg_4g_mode, i2c->pdmabase + OFFSET_RX_4G_MODE);
 		}
 
@@ -908,8 +903,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 			return -ENOMEM;
 		}
 
-		if (i2c->dev_comp->support_33bits) {
-			reg_4g_mode = mtk_i2c_set_4g_mode(wpaddr);
+		if (i2c->dev_comp->max_dma_support > 32) {
+			reg_4g_mode = upper_32_bits(wpaddr);
 			writel(reg_4g_mode, i2c->pdmabase + OFFSET_TX_4G_MODE);
 		}
 
@@ -954,11 +949,11 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
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
 
@@ -1232,8 +1227,9 @@ static int mtk_i2c_probe(struct platform_device *pdev)
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
