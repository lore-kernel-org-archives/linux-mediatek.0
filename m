Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A15FEEB580
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 03:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJMdFtgqyP6VN945exsJPEuc/JSUvYoUCpM4658s/H0=; b=JAxTx5/wwBb4MMCDSYxkVFaUQi
	7MbXQjpHivD2LWn7mp7H1wcxRYUgn/n4uPq7Dbi8R/gcY3DwkEUEK8s05bRew5tM/tT1lxdaExa6U
	WYs7xzQ1uOHBWFIwni9/Il+eGEdm6WspKBwRyHd8CArkxR7dRzxGaC8hIUP+MKOFK9ROYoq1jy9XH
	+CYHzcivLYia6dAY+iA0svvpC2GyHgyTi+TebIBSGoPMNShbAvYw/iiybmjLgr3S8Aqd24J5x4QT7
	YR8Es77ZO6aTXI3st6PoxdsIAi2EOy/Bb0dtN8c/JvWH5L0fvkkAAKQgJyeVNWS2+QD8Y8lQrydRC
	PF7XzVHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfXQj-00H9Ui-0l;
	Mon, 11 Sep 2023 03:17:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfXQP-00H95f-0e;
	Mon, 11 Sep 2023 03:17:26 +0000
X-UUID: b5f5a716505111ee9b7791016c24628a-20230910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mJMdFtgqyP6VN945exsJPEuc/JSUvYoUCpM4658s/H0=;
	b=MPwlg0I1TCfsEX5HFssU0MUwirEf00d9a92I8Fjcziy0LG4xOoIS9QICLIEp+1qs/emC1TPt/6fIUuHmjJWHWyutKnWQKlkWf2qVNZ2IVc1JyL5dGpDtJuDfMkyGczah0ogTMn6wNRqhph5+vmunCvp8reBIPMeRJyUOv14i8gE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:04005797-1e64-488f-b5f5-972df05417db,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:0ad78a4,CLOUDID:67fbadbe-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b5f5a716505111ee9b7791016c24628a-20230910
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1690889269; Sun, 10 Sep 2023 20:17:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 11:16:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 11:16:41 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH v6 17/20] drm/mediatek: Support MT8188 Padding in display driver
Date: Mon, 11 Sep 2023 11:16:27 +0800
Message-ID: <20230911031630.12613-18-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230911031630.12613-1-shawn.sung@mediatek.com>
References: <20230911031630.12613-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.388500-8.000000
X-TMASE-MatchedRID: 9nkzMtsPLI7yZ92BnYqk5lz+axQLnAVB2+EpBnZEzfWNTnqOMBIJ4WlW
	Rvn/M8gY+C56g4Ua7emMWZk+4DO9WLgSigd+50baiS8eKdD/7uRaNaxZBRbNWkdmDSBYfnJRRzB
	gyFiNMBgHnuQrI7SweSc4AVgtpRONJBVW14/3QK0D2WXLXdz+AQrefVId6fzV1yGUyFK3oV4wKY
	tIU69m3V+2TZ8bogGeASo1XNPhrPrB1tTdqQfkDG3NvezwBrVm+LidURF+DB3xCQaCt6X8brCza
	+U6obX4wBpgf0BadqINBaBCS6tQ1OaqzANVaJArZRXMZqv808+7nrAU9KQxUVFFa3XGCWSdMH1x
	x17eFtSugpIE2nzunoAy6p60ZV62fJ5/bZ6npdg7AFczfjr/7FcorynoL/RgvTe8xjOg64FH+qX
	jn9cDIpAfSfwFez3WHw/cFVUOMXU=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.388500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E556F98070C384CE9E95B3626FB0FF8322F05552710EA71DE5B160F8430D49502000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_201721_282765_0F868D1B 
X-CRM114-Status: GOOD (  24.30  )
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

Padding is a new display module on MT8188, it provides ability
to add pixels to width and height of a layer with specified colors.

Due to hardware design, Mixer in VDOSYS1 requires width of a layer
to be 2-pixel-align, or 4-pixel-align when ETHDR is enabled,
we need Padding to deal with odd width.

Please notice that even if the Padding is in bypass mode,
settings in register must be cleared to 0,
or undefined behaviors could happen.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile       |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h |   3 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h  |   2 +-
 drivers/gpu/drm/mediatek/mtk_padding.c  | 136 ++++++++++++++++++++++++
 5 files changed, 143 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_padding.c

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index d4d193f60271..5e4436403b8d 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -16,7 +16,8 @@ mediatek-drm-y := mtk_disp_aal.o \
 		  mtk_dsi.o \
 		  mtk_dpi.o \
 		  mtk_ethdr.o \
-		  mtk_mdp_rdma.o
+		  mtk_mdp_rdma.o \
+		  mtk_padding.o
 
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 2254038519e1..f9fdb1268aa5 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -157,4 +157,7 @@ void mtk_mdp_rdma_config(struct device *dev, struct mtk_mdp_rdma_cfg *cfg,
 const u32 *mtk_mdp_rdma_get_formats(struct device *dev);
 size_t mtk_mdp_rdma_get_num_formats(struct device *dev);
 
+int mtk_padding_clk_enable(struct device *dev);
+void mtk_padding_clk_disable(struct device *dev);
+void mtk_padding_config(struct device *dev, struct cmdq_pkt *cmdq_pkt);
 #endif
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 93552d76b6e7..cde69f39a066 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -973,6 +973,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_dsi_driver,
 	&mtk_ethdr_driver,
 	&mtk_mdp_rdma_driver,
+	&mtk_padding_driver,
 };
 
 static int __init mtk_drm_init(void)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index eb2fd45941f0..562f2db47add 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -64,5 +64,5 @@ extern struct platform_driver mtk_dpi_driver;
 extern struct platform_driver mtk_dsi_driver;
 extern struct platform_driver mtk_ethdr_driver;
 extern struct platform_driver mtk_mdp_rdma_driver;
-
+extern struct platform_driver mtk_padding_driver;
 #endif /* MTK_DRM_DRV_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_padding.c b/drivers/gpu/drm/mediatek/mtk_padding.c
new file mode 100644
index 000000000000..bbb9c5e286ce
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_padding.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ */
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
+#include "mtk_disp_drv.h"
+#include "mtk_drm_crtc.h"
+#include "mtk_drm_ddp_comp.h"
+
+/**
+ * struct mtk_padding - basic information of Padding
+ * @clk: Clock of the module
+ * @regs: Virtual address of the Padding for CPU to access
+ * @cmdq_reg: CMDQ setting of the Padding
+ *
+ * Every Padding should have different clock source, register base, and
+ * CMDQ settings, we stored these differences all together.
+ */
+struct mtk_padding {
+	struct clk		*clk;
+	void __iomem		*regs;
+	struct cmdq_client_reg	cmdq_reg;
+};
+
+int mtk_padding_clk_enable(struct device *dev)
+{
+	struct mtk_padding *padding = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(padding->clk);
+}
+
+void mtk_padding_clk_disable(struct device *dev)
+{
+	struct mtk_padding *padding = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(padding->clk);
+}
+
+void mtk_padding_config(struct device *dev, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_padding *padding = dev_get_drvdata(dev);
+
+	/* bypass padding */
+	mtk_ddp_write_mask(cmdq_pkt, GENMASK(1, 0), &padding->cmdq_reg, padding->regs, 0,
+			   GENMASK(1, 0));
+}
+
+static int mtk_padding_bind(struct device *dev, struct device *master, void *data)
+{
+	return 0;
+}
+
+static void mtk_padding_unbind(struct device *dev, struct device *master, void *data)
+{
+}
+
+static const struct component_ops mtk_padding_component_ops = {
+	.bind	= mtk_padding_bind,
+	.unbind = mtk_padding_unbind,
+};
+
+static int mtk_padding_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_padding *priv;
+	struct resource *res;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "failed to get clk\n");
+		return PTR_ERR(priv->clk);
+	}
+
+	priv->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(priv->regs)) {
+		dev_err(dev, "failed to do ioremap\n");
+		return PTR_ERR(priv->regs);
+	}
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
+	if (ret) {
+		dev_err(dev, "failed to get gce client reg\n");
+		return ret;
+	}
+#endif
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = component_add(dev, &mtk_padding_component_ops);
+	if (ret) {
+		pm_runtime_disable(dev);
+		return dev_err_probe(dev, ret, "failed to add component\n");
+	}
+
+	return 0;
+}
+
+static int mtk_padding_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_padding_component_ops);
+	return 0;
+}
+
+static const struct of_device_id mtk_padding_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8188-padding" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mtk_padding_driver_dt_match);
+
+struct platform_driver mtk_padding_driver = {
+	.probe		= mtk_padding_probe,
+	.remove		= mtk_padding_remove,
+	.driver		= {
+		.name	= "mediatek-padding",
+		.owner	= THIS_MODULE,
+		.of_match_table = mtk_padding_driver_dt_match,
+	},
+};
-- 
2.18.0


