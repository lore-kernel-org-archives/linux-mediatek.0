Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9B7C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 06:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYj7loisJ3H2pjCRfHrPpCo8nX9yormKQJSVo2wzl3E=; b=BeuHGyH5h2Uf8KNi42VsYjqKDA
	MRzsREXoSdcMgfFVHHAKwXLftN0KAEmjBQ579gx6b89Mk8EH1Uu9ErbpQH5LcxnpBww19XS2XfXrL
	EgCKff3bzumjoA5IWTioz8ztGn6qgd7OdJPVkHAa6zBGWxmPDG4ywhP7n+DEBRlTgTAqNvjNzEe7u
	IiRIJ5CvpF+yOkKrDC5FrC0sx+xrd4bQ10GV3VKKfup05lqukP4sXICnMGaWPggeoEaMc3+wVMu33
	AxBWU+lATPV3fnv7nX0BWz7ECTW9x09kT4JJrMEU3L/XYBYGNRxw3Uq5X3BogGpeNXWwJLSgzhfuy
	0U3xzVjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Kft-00Ds5I-6z; Thu, 07 Jul 2022 06:07:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Kfh-00Ds32-Nv; Thu, 07 Jul 2022 06:07:31 +0000
X-UUID: 1eef1b7fcd8b461b9064171f32f9fd00-20220706
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:308af9bb-1e0f-4472-81ea-116385f64158,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:2ab4c786-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 1eef1b7fcd8b461b9064171f32f9fd00-20220706
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kewei.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 659599173; Wed, 06 Jul 2022 23:07:27 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 7 Jul 2022 13:46:24 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Jul 2022 13:46:23 +0800
From: Kewei Xu <kewei.xu@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
	<leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
	<liguo.zhang@mediatek.com>, <caiyu.chen@mediatek.com>,
	<housong.zhang@mediatek.com>, <yuhan.wei@mediatek.com>,
	<kewei.xu@mediatek.com>, <david-yh.chiu@mediatek.com>,
	<liju-clr.chen@mediatek.com>
Subject: [PATCH 2/2] i2c: mediatek: Add i2c compatible for Mediatek MT8188
Date: Thu, 7 Jul 2022 13:46:17 +0800
Message-ID: <20220707054617.13583-3-kewei.xu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220707054617.13583-1-kewei.xu@mediatek.com>
References: <20220707054617.13583-1-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_230729_818988_87F2EC73 
X-CRM114-Status: GOOD (  14.09  )
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

Add i2c compatible for MT8188. Compare to MT8192 i2c controller,
The MT8188 i2c OFFSET_SLAVE_ADDR register changed from 0x04 to 0x94.

Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 41 +++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 8e6985354fd5..aa2e1cb87420 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -135,6 +135,7 @@ enum mtk_trans_op {
 enum I2C_REGS_OFFSET {
 	OFFSET_DATA_PORT,
 	OFFSET_SLAVE_ADDR,
+	OFFSET_SLAVE_ADDR1,
 	OFFSET_INTR_MASK,
 	OFFSET_INTR_STAT,
 	OFFSET_CONTROL,
@@ -203,6 +204,7 @@ static const u16 mt_i2c_regs_v1[] = {
 static const u16 mt_i2c_regs_v2[] = {
 	[OFFSET_DATA_PORT] = 0x0,
 	[OFFSET_SLAVE_ADDR] = 0x4,
+	[OFFSET_SLAVE_ADDR1] = 0x94,
 	[OFFSET_INTR_MASK] = 0x8,
 	[OFFSET_INTR_STAT] = 0xc,
 	[OFFSET_CONTROL] = 0x10,
@@ -241,6 +243,7 @@ struct mtk_i2c_compatible {
 	unsigned char ltiming_adjust: 1;
 	unsigned char apdma_sync: 1;
 	unsigned char max_dma_support;
+	unsigned char slave_addr_ver;
 };
 
 struct mtk_i2c_ac_timing {
@@ -345,6 +348,7 @@ static const struct mtk_i2c_compatible mt2712_compat = {
 	.ltiming_adjust = 0,
 	.apdma_sync = 0,
 	.max_dma_support = 33,
+	.slave_addr_ver = 0,
 };
 
 static const struct mtk_i2c_compatible mt6577_compat = {
@@ -359,6 +363,7 @@ static const struct mtk_i2c_compatible mt6577_compat = {
 	.ltiming_adjust = 0,
 	.apdma_sync = 0,
 	.max_dma_support = 32,
+	.slave_addr_ver = 0,
 };
 
 static const struct mtk_i2c_compatible mt6589_compat = {
@@ -373,6 +378,7 @@ static const struct mtk_i2c_compatible mt6589_compat = {
 	.ltiming_adjust = 0,
 	.apdma_sync = 0,
 	.max_dma_support = 32,
+	.slave_addr_ver = 0,
 };
 
 static const struct mtk_i2c_compatible mt7622_compat = {
@@ -387,6 +393,7 @@ static const struct mtk_i2c_compatible mt7622_compat = {
 	.ltiming_adjust = 0,
 	.apdma_sync = 0,
 	.max_dma_support = 32,
+	.slave_addr_ver = 0,
 };
 
 static const struct mtk_i2c_compatible mt8168_compat = {
@@ -400,6 +407,7 @@ static const struct mtk_i2c_compatible mt8168_compat = {
 	.ltiming_adjust = 0,
 	.apdma_sync = 0,
 	.max_dma_support = 33,
+	.slave_addr_ver = 0,
 };
 
 static const struct mtk_i2c_compatible mt8173_compat = {
@@ -413,6 +421,7 @@ static const struct mtk_i2c_compatible mt8173_compat = {
 	.ltiming_adjust = 0,
 	.apdma_sync = 0,
 	.max_dma_support = 33,
+	.slave_addr_ver = 0,
 };
 
 static const struct mtk_i2c_compatible mt8183_compat = {
@@ -427,6 +436,7 @@ static const struct mtk_i2c_compatible mt8183_compat = {
 	.ltiming_adjust = 1,
 	.apdma_sync = 0,
 	.max_dma_support = 33,
+	.slave_addr_ver = 0,
 };
 
 static const struct mtk_i2c_compatible mt8186_compat = {
@@ -440,6 +450,21 @@ static const struct mtk_i2c_compatible mt8186_compat = {
 	.ltiming_adjust = 1,
 	.apdma_sync = 0,
 	.max_dma_support = 36,
+	.slave_addr_ver = 0,
+};
+
+static const struct mtk_i2c_compatible mt8188_compat = {
+	.regs = mt_i2c_regs_v2,
+	.pmic_i2c = 0,
+	.dcm = 0,
+	.auto_restart = 1,
+	.aux_len_reg = 1,
+	.timing_adjust = 1,
+	.dma_sync = 0,
+	.ltiming_adjust = 1,
+	.apdma_sync = 1,
+	.max_dma_support = 36,
+	.slave_addr_ver = 1,
 };
 
 static const struct mtk_i2c_compatible mt8192_compat = {
@@ -454,6 +479,7 @@ static const struct mtk_i2c_compatible mt8192_compat = {
 	.ltiming_adjust = 1,
 	.apdma_sync = 1,
 	.max_dma_support = 36,
+	.slave_addr_ver = 0,
 };
 
 static const struct of_device_id mtk_i2c_of_match[] = {
@@ -465,6 +491,7 @@ static const struct of_device_id mtk_i2c_of_match[] = {
 	{ .compatible = "mediatek,mt8173-i2c", .data = &mt8173_compat },
 	{ .compatible = "mediatek,mt8183-i2c", .data = &mt8183_compat },
 	{ .compatible = "mediatek,mt8186-i2c", .data = &mt8186_compat },
+	{ .compatible = "mediatek,mt8188-i2c", .data = &mt8188_compat },
 	{ .compatible = "mediatek,mt8192-i2c", .data = &mt8192_compat },
 	{}
 };
@@ -877,8 +904,15 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
 
 static void i2c_dump_register(struct mtk_i2c *i2c)
 {
+	enum I2C_REGS_OFFSET sla_addr_offset;
+
+	if (i2c->dev_comp->slave_addr_ver == 1)
+		sla_addr_offset = OFFSET_SLAVE_ADDR1;
+	else
+		sla_addr_offset = OFFSET_SLAVE_ADDR;
+
 	dev_dbg(i2c->dev, "SLAVE_ADDR: 0x%x, INTR_MASK: 0x%x\n",
-		mtk_i2c_readw(i2c, OFFSET_SLAVE_ADDR),
+		mtk_i2c_readw(i2c, sla_addr_offset),
 		mtk_i2c_readw(i2c, OFFSET_INTR_MASK));
 	dev_dbg(i2c->dev, "INTR_STAT: 0x%x, CONTROL: 0x%x\n",
 		mtk_i2c_readw(i2c, OFFSET_INTR_STAT),
@@ -982,7 +1016,10 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 	mtk_i2c_writew(i2c, control_reg, OFFSET_CONTROL);
 
 	addr_reg = i2c_8bit_addr_from_msg(msgs);
-	mtk_i2c_writew(i2c, addr_reg, OFFSET_SLAVE_ADDR);
+	if (i2c->dev_comp->slave_addr_ver == 1)
+		mtk_i2c_writew(i2c, addr_reg, OFFSET_SLAVE_ADDR1);
+	else
+		mtk_i2c_writew(i2c, addr_reg, OFFSET_SLAVE_ADDR);
 
 	/* Clear interrupt status */
 	mtk_i2c_writew(i2c, restart_flag | I2C_HS_NACKERR | I2C_ACKERR |
-- 
2.18.0


