Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F5BC433F2
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 12:33:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B9F820729
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 12:33:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tdwQLClC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eBTkJDsE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B9F820729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ddvv/twLtKrCYl7TREAjmfV8zE617hGlVXWXik5AwSg=; b=tdwQLClCS8rwczq6LDrjg3Z4A
	eQn+O4yFWp433IFYMl0keGd6GNS367RzVvqHbzb0HPvtXkYqj8mqttFnPObeFUTvRNcZ9sH+gFgLT
	9AZXc3RCqwiFPUGRaGIkFitRpBAh5hc1ulEaoKOL+FsK4hXzq52nvd/gobQ+e0PnLrkG+qr8wBcXj
	OoZmezJmaeVQv356oTJz6Y+bg5YG6Kjcwe/MXJxyloFtGoDLYnlLL4n1ozySR/dgfz1XOO9hjwDqA
	FepswLHLpAIllocDD7zscmpVQSxZJZMGOD50OxSR3rsOhUiPWSm++hEST4MjyL2egdZZfOH0aoMb1
	gcH+BAkcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyDvv-0007ST-2d; Wed, 22 Jul 2020 12:33:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyDvn-0007Pv-5n; Wed, 22 Jul 2020 12:33:08 +0000
X-UUID: 5bbc59d5a568440e868a0b839eafc6dd-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VDeeFSzCA5q8g3SgO7189jY/45GsdjKIUac8MfTLv1o=; 
 b=eBTkJDsEEHPif9vSwga4yO3P7719kylq5A52RiKElcytojiZ+AGVTaflszL7pd7OGqqYk/cZzP5XNuzRnvoOUA1wOsDTgGfCjx7fExZ055l/6r0UlYHqmyrm1sle64mnS2CllCH/wMzTIlI9eN6s5OhqS2fGQIxMM4YoCL1eSdw=;
X-UUID: 5bbc59d5a568440e868a0b839eafc6dd-20200722
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 197891284; Wed, 22 Jul 2020 04:32:55 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 05:32:56 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 20:32:55 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 20:32:54 +0800
From: Qii Wang <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
Subject: [PATCH 2/4] i2c: mediatek: Support DMA mask range over 33-bits
Date: Wed, 22 Jul 2020 20:31:44 +0800
Message-ID: <1595421106-10017-3-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1595421106-10017-1-git-send-email-qii.wang@mediatek.com>
References: <1595421106-10017-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_083307_382772_451180F6 
X-CRM114-Status: GOOD (  13.47  )
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

Replace 'support_33bits with 'dma_max_support' for DMA mask
operation, and replace 'mtk_i2c_set_4g_mode' with 'upper_32_bits'.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index e6b984a..e475877 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -209,6 +209,7 @@ struct mtk_i2c_compatible {
 	unsigned char dma_sync: 1;
 	unsigned char ltiming_adjust: 1;
 	unsigned char apdma_sync: 1;
+	unsigned char max_dma_support;
 };
 
 struct mtk_i2c_ac_timing {
@@ -311,11 +312,11 @@ struct i2c_spec_values {
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
@@ -325,11 +326,11 @@ struct i2c_spec_values {
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
@@ -339,11 +340,11 @@ struct i2c_spec_values {
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
@@ -353,11 +354,11 @@ struct i2c_spec_values {
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
@@ -366,11 +367,11 @@ struct i2c_spec_values {
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
@@ -380,11 +381,11 @@ struct i2c_spec_values {
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
@@ -796,11 +797,6 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
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
@@ -885,8 +881,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 			return -ENOMEM;
 		}
 
-		if (i2c->dev_comp->support_33bits) {
-			reg_4g_mode = mtk_i2c_set_4g_mode(rpaddr);
+		if (i2c->dev_comp->max_dma_support > 32) {
+			reg_4g_mode = upper_32_bits(rpaddr);
 			writel(reg_4g_mode, i2c->pdmabase + OFFSET_RX_4G_MODE);
 		}
 
@@ -908,8 +904,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 			return -ENOMEM;
 		}
 
-		if (i2c->dev_comp->support_33bits) {
-			reg_4g_mode = mtk_i2c_set_4g_mode(wpaddr);
+		if (i2c->dev_comp->max_dma_support > 32) {
+			reg_4g_mode = upper_32_bits(wpaddr);
 			writel(reg_4g_mode, i2c->pdmabase + OFFSET_TX_4G_MODE);
 		}
 
@@ -954,11 +950,11 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
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
 
@@ -1232,8 +1228,9 @@ static int mtk_i2c_probe(struct platform_device *pdev)
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
