Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BBDC19F2D
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Aug 2022 10:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BM1cHQPutbJT/weJKIewcPcyGXF9P1GaLV7WSvTfPNE=; b=LSlOgcD7fLiHJl6Q0c3JyJJYYw
	gFiFuSjzqyYs8soKKpLGq0rFWUz6A9ckYADed285tzNthYHGQrpvD6b1iolT16cihDQNqzTqs+Txf
	armiXaTx9cnRzDLuEgS3UhUiQo6YF65aUwmHOmU3o8ge/Z92Yrz6c7JNHE/qN61r94DXPS9hEIp1k
	pPC1vQdXAt0qRUWp1uTDX6ZNoEEcjswUMrZ0PZvUdg0W+MJR+PkTtbaFzOEmoN+lzUjHVllap88gk
	y3xZL72BUQRomIgQetgOq21+TLQytnry2iqTDxzSZL3K+LBXbh93Q0ekHPi8Py4Gd+zVGmJjggGjU
	EMmG+9LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKGoc-009Mps-VR; Sat, 06 Aug 2022 10:13:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKGoX-009MZJ-Pl; Sat, 06 Aug 2022 10:13:52 +0000
X-UUID: 9f77218b5abd44448ff0681756ad9d6d-20220806
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:9a2c21b1-68a7-47c9-8ab6-9e081b0a9e1a,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:3efd15ae-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 9f77218b5abd44448ff0681756ad9d6d-20220806
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kewei.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 578961400; Sat, 06 Aug 2022 03:13:37 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 6 Aug 2022 18:02:59 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 6 Aug 2022 18:02:58 +0800
From: <kewei.xu@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
	<leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
	<liguo.zhang@mediatek.com>, <caiyu.chen@mediatek.com>,
	<housong.zhang@mediatek.com>, <yuhan.wei@mediatek.com>,
	<kewei.xu@mediatek.com>, <ryan-jh.yu@mediatek.com>,
	<david-yh.chiu@mediatek.com>
Subject: [PATCH v5 2/2] i2c: mediatek: add i2c compatible for MT8188
Date: Sat, 6 Aug 2022 18:02:49 +0800
Message-ID: <20220806100249.12375-2-kewei.xu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220806100249.12375-1-kewei.xu@mediatek.com>
References: <20220806100249.12375-1-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220806_031349_873574_4E3663F8 
X-CRM114-Status: UNSURE (   9.41  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Kewei Xu <kewei.xu@mediatek.com>

Add i2c compatible for MT8188 and added mt_i2c_regs_v3[], since
MT8188 i2c OFFSET_SLAVE_ADDR register changed from 0x04 to 0x94.

Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
v5: modify the order of mt_i2c_regs_v3[] members and add Reviewed-by owner.
v4: no changes
V3: no changes
V2: added mt_i2c_regs_v3[] to replace slave_addr_version.
---
 drivers/i2c/busses/i2c-mt65xx.c | 43 +++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 8e6985354fd5..bd8abba3d1c9 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -229,6 +229,35 @@ static const u16 mt_i2c_regs_v2[] = {
 	[OFFSET_DCM_EN] = 0xf88,
 };
 
+static const u16 mt_i2c_regs_v3[] = {
+	[OFFSET_DATA_PORT] = 0x0,
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
+	[OFFSET_SLAVE_ADDR] = 0x94,
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


