Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62924C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 03:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sD164AK13/n6cV2uzyWIjrcyM9f4zmeUeGmjXANE65g=; b=xg23F1NPvhPVK++uWBYpJa9ee3
	Nj5g6YvvVtXYWFSqrlqlUORFIIxROLLwMDiJEcrRFNl+iE3h8ZYz7nyHtDIsaLQVQGhELeRF7VX2C
	ZNzJpykkUdX8Jbrb7MSNgsOjtybZvQNcuD0UFuuYONmX9oPHcn6MRAODNUrdOUiySU5vxjDQFytIz
	CmB9D6SBLzsWR+oBsFa7a1mUw+C4BDoSFv5yITvoUn/1A5RqX1NkPNRXG2zbPxq7uonFGRe5d1tUN
	WmthmGySbKT1muaIGLbRPizDw7jQVVKkhTP/2pas6GbpT08mmGic+ADJ8CcWTCkKXnUscEGYIpIFu
	Muejzgsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9f6h-001cvd-Ak; Fri, 08 Jul 2022 03:56:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9f6e-001cuB-L5; Fri, 08 Jul 2022 03:56:42 +0000
X-UUID: 0e0a867ccabf43abb9bac823c9543a80-20220707
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:a169ddf1-c4f8-4b1f-939d-4909a8fe45a9,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:2d6abc63-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 0e0a867ccabf43abb9bac823c9543a80-20220707
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kewei.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 532559849; Thu, 07 Jul 2022 20:56:33 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 8 Jul 2022 11:15:26 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Jul 2022 11:15:25 +0800
From: <kewei.xu@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <leilk.liu@mediatek.com>,
	<qii.wang@mediatek.com>, <liguo.zhang@mediatek.com>,
	<caiyu.chen@mediatek.com>, <housong.zhang@mediatek.com>,
	<yuhan.wei@mediatek.com>, <kewei.xu@mediatek.com>,
	<david-yh.chiu@mediatek.com>, <liju-clr.chen@mediatek.com>
Subject: [PATCH 2/2] i2c: mediatek: Add i2c compatible for Mediatek MT8188
Date: Fri, 8 Jul 2022 11:15:19 +0800
Message-ID: <20220708031520.22053-2-kewei.xu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220708031520.22053-1-kewei.xu@mediatek.com>
References: <20220708031520.22053-1-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_205640_738472_DC7E5EF7 
X-CRM114-Status: GOOD (  10.32  )
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

From: Kewei Xu <kewei.xu@mediatek.com>

Add i2c compatible for MT8188. Compare to MT8192 i2c controller,
The MT8188 i2c OFFSET_SLAVE_ADDR register changed from 0x04 to 0x94.

Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
Change-Id: Ibcfa101061f058508eb1ae2cc07af5a3e7e3bf4f
---
 drivers/i2c/busses/i2c-mt65xx.c | 43 +++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 8e6985354fd5..70aff42adf5d 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -229,6 +229,35 @@ static const u16 mt_i2c_regs_v2[] = {
 	[OFFSET_DCM_EN] = 0xf88,
 };
 
+static const u16 mt_i2c_regs_v3[] = {
+	[OFFSET_DATA_PORT] = 0x0,
+	[OFFSET_SLAVE_ADDR] = 0x94,
+	[OFFSET_INTR_MASK] = 0x8,
+	[OFFSET_INTR_STAT] = 0xc,
+	[OFFSET_CONTROL] = 0x10,
+	[OFFSET_TRANSFER_LEN] = 0x14,
+	[OFFSET_TRANSAC_LEN] = 0x18,
+	[OFFSET_DELAY_LEN] = 0x1c,
+	[OFFSET_TIMING] = 0x20,
+	[OFFSET_START] = 0x24,
+	[OFFSET_EXT_CONF] = 0x28,
+	[OFFSET_LTIMING] = 0x2c,
+	[OFFSET_HS] = 0x30,
+	[OFFSET_IO_CONFIG] = 0x34,
+	[OFFSET_FIFO_ADDR_CLR] = 0x38,
+	[OFFSET_SDA_TIMING] = 0x3c,
+	[OFFSET_TRANSFER_LEN_AUX] = 0x44,
+	[OFFSET_CLOCK_DIV] = 0x48,
+	[OFFSET_SOFTRESET] = 0x50,
+	[OFFSET_MULTI_DMA] = 0x8c,
+	[OFFSET_SCL_MIS_COMP_POINT] = 0x90,
+	[OFFSET_DEBUGSTAT] = 0xe4,
+	[OFFSET_DEBUGCTRL] = 0xe8,
+	[OFFSET_FIFO_STAT] = 0xf4,
+	[OFFSET_FIFO_THRESH] = 0xf8,
+	[OFFSET_DCM_EN] = 0xf88,
+};
+
 struct mtk_i2c_compatible {
 	const struct i2c_adapter_quirks *quirks;
 	const u16 *regs;
@@ -442,6 +471,19 @@ static const struct mtk_i2c_compatible mt8186_compat = {
 	.max_dma_support = 36,
 };
 
+static const struct mtk_i2c_compatible mt8188_compat = {
+	.regs = mt_i2c_regs_v3,
+	.pmic_i2c = 0,
+	.dcm = 0,
+	.auto_restart = 1,
+	.aux_len_reg = 1,
+	.timing_adjust = 1,
+	.dma_sync = 0,
+	.ltiming_adjust = 1,
+	.apdma_sync = 1,
+	.max_dma_support = 36,
+};
+
 static const struct mtk_i2c_compatible mt8192_compat = {
 	.quirks = &mt8183_i2c_quirks,
 	.regs = mt_i2c_regs_v2,
@@ -465,6 +507,7 @@ static const struct of_device_id mtk_i2c_of_match[] = {
 	{ .compatible = "mediatek,mt8173-i2c", .data = &mt8173_compat },
 	{ .compatible = "mediatek,mt8183-i2c", .data = &mt8183_compat },
 	{ .compatible = "mediatek,mt8186-i2c", .data = &mt8186_compat },
+	{ .compatible = "mediatek,mt8188-i2c", .data = &mt8188_compat },
 	{ .compatible = "mediatek,mt8192-i2c", .data = &mt8192_compat },
 	{}
 };
-- 
2.18.0


