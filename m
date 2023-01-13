Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827BAC54EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 10:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3hfzWfWNXsC8suT6j3UP9nP8xEtncqRGTbF8cRkuLVc=; b=2l6g1+Y3YcZJOwEzZ/rd0F98Zd
	0cvOi3CQ7EU27nW4j1OkNoc7WhLpZHGa20w2sOhmLQ+0JFgZn0c30OnLSRAIKZKfQfGNjT6MqOJT6
	PzboTiT+Q5q3RPQiFS2Ek9sinuUCX6+WmMZtiQj8sanIRLPq3/lN8r+8ioPSdZCPJXzCOJaPYpVJM
	RH7MBnKEREiVSO43+irGSqDsPSve8ZFG31ZW/povGyza/UaC0hing0RLYaANPVhf9DkAYiJZDNTjS
	Gv2ZyVXSS+MO2NCoGtjNurH7ZX9KVXwz62HHdmfQA9tqwk/sY97uEokhDrJ7f3kEanuMeXxDMFy7d
	byGESUsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGHe9-001tTa-EJ; Fri, 13 Jan 2023 10:50:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGHaD-001rcT-5W; Fri, 13 Jan 2023 10:46:52 +0000
X-UUID: 9097e734932f11edbbe3f76fe852e059-20230113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3hfzWfWNXsC8suT6j3UP9nP8xEtncqRGTbF8cRkuLVc=;
	b=GOlwYoMvxQ21anwZkpNbuMR5+5fbW7vmhU+IRgz9ZCvAnQKyn5ngOUrYkHWf79IL6B9+4QWMDUqKtTIvb/4Xrv8hq62oysMIlH6q4OPEUHbkdMrh5lyHZXq2mf6A+yaZ2gxtNKBddEBu9Z9rXQ9gVpwUh5c0Zi0ZFS1XyNe7v5U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:cee94293-f25f-43ad-9d50-0866f5033b87,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:1,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:1
X-CID-META: VersionHash:543e81c,CLOUDID:365e2e8c-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 9097e734932f11edbbe3f76fe852e059-20230113
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1412153253; Fri, 13 Jan 2023 03:46:41 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 13 Jan 2023 18:44:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 13 Jan 2023 18:44:36 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, CK Hu
	<ck.hu@mediatek.com>
CC: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
	<ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, "Nathan
 Lu" <nathan.lu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, "Xinlei
 Lee" <xinlei.lee@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <llvm@lists.linux.dev>,
	<singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v30 07/11] soc: mediatek: add cmdq support of mtk-mmsys config API for mt8195 vdosys1
Date: Fri, 13 Jan 2023 18:44:30 +0800
Message-ID: <20230113104434.28023-8-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230113104434.28023-1-nancy.lin@mediatek.com>
References: <20230113104434.28023-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_024649_348837_F6C8EEBF 
X-CRM114-Status: GOOD (  20.45  )
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

Add cmdq support for mtk-mmsys config API.
The mmsys config register settings need to take effect with the other
HW settings(like OVL_ADAPTOR...) at the same vblanking time.

If we use CPU to write the mmsys reg, we can't guarantee all the
settings can be written in the same vblanking time.
Cmdq is used for this purpose. We prepare all the related HW settings
in one cmdq packet. The first command in the packet is "wait stream done",
and then following with all the HW settings. After the cmdq packet is
flush to GCE HW. The GCE waits for the "stream done event" to coming
and then starts flushing all the HW settings. This can guarantee all
the settings flush in the same vblanking.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-mmsys.c       | 63 ++++++++++++++++++--------
 include/linux/soc/mediatek/mtk-mmsys.h | 15 ++++--
 2 files changed, 55 insertions(+), 23 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 2aeb739b8503..a0a584f16405 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -105,12 +105,27 @@ struct mtk_mmsys {
 	const struct mtk_mmsys_driver_data *data;
 	spinlock_t lock; /* protects mmsys_sw_rst_b reg */
 	struct reset_controller_dev rcdev;
+	struct cmdq_client_reg cmdq_base;
 };
 
-static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
+static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val,
+				  struct cmdq_pkt *cmdq_pkt)
 {
 	u32 tmp;
 
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	if (cmdq_pkt) {
+		if (mmsys->cmdq_base.size == 0) {
+			pr_err("mmsys lose gce property, failed to update mmsys bits with cmdq");
+			return;
+		}
+		cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
+				    mmsys->cmdq_base.offset + offset, val,
+				    mask);
+		return;
+	}
+#endif
+
 	tmp = readl_relaxed(mmsys->regs + offset);
 	tmp = (tmp & ~mask) | (val & mask);
 	writel_relaxed(tmp, mmsys->regs + offset);
@@ -127,7 +142,7 @@ void mtk_mmsys_ddp_connect(struct device *dev,
 	for (i = 0; i < mmsys->data->num_routes; i++)
 		if (cur == routes[i].from_comp && next == routes[i].to_comp)
 			mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask,
-					      routes[i].val);
+					      routes[i].val, NULL);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
 
@@ -141,42 +156,45 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 
 	for (i = 0; i < mmsys->data->num_routes; i++)
 		if (cur == routes[i].from_comp && next == routes[i].to_comp)
-			mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask, 0);
+			mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask, 0, NULL);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
 
-void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width, int height)
+void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width, int height,
+				  struct cmdq_pkt *cmdq_pkt)
 {
 	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8195_VDO1_MERGE0_ASYNC_CFG_WD + 0x10 * idx,
-			      ~0, height << 16 | width);
+			      ~0, height << 16 | width, cmdq_pkt);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_merge_async_config);
 
-void mtk_mmsys_hdr_config(struct device *dev, int be_width, int be_height)
+void mtk_mmsys_hdr_config(struct device *dev, int be_width, int be_height,
+			  struct cmdq_pkt *cmdq_pkt)
 {
 	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8195_VDO1_HDRBE_ASYNC_CFG_WD, ~0,
-			      be_height << 16 | be_width);
+			      be_height << 16 | be_width, cmdq_pkt);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_hdr_config);
 
 void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16 alpha,
-			       u8 mode, u32 biwidth)
+			       u8 mode, u32 biwidth, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
 
 	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_MIXER_IN1_ALPHA + (idx - 1) * 4, ~0,
-			      alpha << 16 | alpha);
+			      alpha << 16 | alpha, cmdq_pkt);
 	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_HDR_TOP_CFG, BIT(19 + idx),
-			      alpha_sel << (19 + idx));
+			      alpha_sel << (19 + idx), cmdq_pkt);
 	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_MIXER_IN1_PAD + (idx - 1) * 4,
-			      GENMASK(31, 16) | GENMASK(1, 0), biwidth << 16 | mode);
+			      GENMASK(31, 16) | GENMASK(1, 0), biwidth << 16 | mode, cmdq_pkt);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_config);
 
-void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap)
+void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap,
+				     struct cmdq_pkt *cmdq_pkt)
 {
 	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8195_VDO1_MIXER_IN1_PAD + (idx - 1) * 4,
-			      BIT(4), channel_swap << 4);
+			      BIT(4), channel_swap << 4, cmdq_pkt);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_channel_swap);
 
@@ -187,20 +205,20 @@ void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
 	switch (val) {
 	case MTK_DPI_RGB888_SDR_CON:
 		mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
-				      MT8186_DPI_FORMAT_MASK, MT8186_DPI_RGB888_SDR_CON);
+				      MT8186_DPI_FORMAT_MASK, MT8186_DPI_RGB888_SDR_CON, NULL);
 		break;
 	case MTK_DPI_RGB565_SDR_CON:
 		mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
-				      MT8186_DPI_FORMAT_MASK, MT8186_DPI_RGB565_SDR_CON);
+				      MT8186_DPI_FORMAT_MASK, MT8186_DPI_RGB565_SDR_CON, NULL);
 		break;
 	case MTK_DPI_RGB565_DDR_CON:
 		mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
-				      MT8186_DPI_FORMAT_MASK, MT8186_DPI_RGB565_DDR_CON);
+				      MT8186_DPI_FORMAT_MASK, MT8186_DPI_RGB565_DDR_CON, NULL);
 		break;
 	case MTK_DPI_RGB888_DDR_CON:
 	default:
 		mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
-				      MT8186_DPI_FORMAT_MASK, MT8186_DPI_RGB888_DDR_CON);
+				      MT8186_DPI_FORMAT_MASK, MT8186_DPI_RGB888_DDR_CON, NULL);
 		break;
 	}
 }
@@ -215,9 +233,9 @@ static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned l
 	spin_lock_irqsave(&mmsys->lock, flags);
 
 	if (assert)
-		mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), 0);
+		mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), 0, NULL);
 	else
-		mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), BIT(id));
+		mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), BIT(id), NULL);
 
 	spin_unlock_irqrestore(&mmsys->lock, flags);
 
@@ -285,6 +303,13 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	}
 
 	mmsys->data = of_device_get_match_data(&pdev->dev);
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
+	if (ret)
+		dev_dbg(dev, "No mediatek,gce-client-reg!\n");
+#endif
+
 	platform_set_drvdata(pdev, mmsys);
 
 	clks = platform_device_register_data(&pdev->dev, mmsys->data->clk_driver,
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index de84ca230d33..8eb5846985b4 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -6,6 +6,10 @@
 #ifndef __MTK_MMSYS_H
 #define __MTK_MMSYS_H
 
+#include <linux/mailbox_controller.h>
+#include <linux/mailbox/mtk-cmdq-mailbox.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
 enum mtk_ddp_comp_id;
 struct device;
 
@@ -82,13 +86,16 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 
 void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val);
 
-void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width, int height);
+void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width,
+				  int height, struct cmdq_pkt *cmdq_pkt);
 
-void mtk_mmsys_hdr_config(struct device *dev, int be_width, int be_height);
+void mtk_mmsys_hdr_config(struct device *dev, int be_width, int be_height,
+			  struct cmdq_pkt *cmdq_pkt);
 
 void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16 alpha,
-			       u8 mode, u32 biwidth);
+			       u8 mode, u32 biwidth, struct cmdq_pkt *cmdq_pkt);
 
-void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap);
+void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap,
+				     struct cmdq_pkt *cmdq_pkt);
 
 #endif /* __MTK_MMSYS_H */
-- 
2.18.0


