Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E831CC432BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 17:09:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B714D60C40
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 17:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B714D60C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DjuCVDlvye+4rMwJ/1Ol5e/SBtaRo1q8hneIotzuDSQ=; b=xmmbXcFKE05b4o
	7/rv65978BGxWJexMKSc+kOO2Y2Q0ODqhjMVr8wa1JaS+Sm14CSIeu2HEeRv0t3eitjt+jf6ngYXl
	kl/YvYuoAzPAbTtHzN1BoAEdlLdyW01t1+JdbSwjLNxEpK6H2f2rNQm3L+0LjFRLZgfRCZssO7/TP
	vdnBV8BCCSn9h37A0YbU1G+5WXP9Psldv0HZCnRFBETofwsPSXWrxgXVxZda5SEj/DeKgTNazYJiM
	Uq03igcbts4LyoPy57O74OvPVJW78ZqKIfSptcAe+nbnyRQvmWArJRuWEGCh/pYATYcmr3ldOf6Lx
	DlaG8U9wcB6tdRGG8qrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m99X0-005EjA-H1; Thu, 29 Jul 2021 17:09:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m99Vr-005EEI-RZ; Thu, 29 Jul 2021 17:08:09 +0000
X-UUID: 000e19292057498b8495bfe1547fb36f-20210729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oUxD2fGRjQD/Wn9Vo/NVFC4P7AGSc0P/lVd1+24NyqI=; 
 b=kDmZW/M0IRZY4Xuj3bckh0ZjQTxq9vQfHDjoW6sXB2L40s946pu/0vJZ0KJm4RipCcC2Dm+nZTzN2aKuWBi4gH42clwq9ipPZ9E5JGS0NFANwYDzcKYMVjHmyBJwe1RG/7IxoMfENi5+/mSvNRdV5a5rm3RQr33D90JjDm2WTRg=;
X-UUID: 000e19292057498b8495bfe1547fb36f-20210729
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 548494418; Thu, 29 Jul 2021 10:07:43 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 10:07:42 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Jul 2021 01:07:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 30 Jul 2021 01:07:40 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, <fshao@chromium.org>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <hsinyi@chromium.org>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 6/6] drm/mediatek: add MERGE support for mt8195
Date: Fri, 30 Jul 2021 01:07:37 +0800
Message-ID: <20210729170737.21424-7-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210729170737.21424-1-jason-jh.lin@mediatek.com>
References: <20210729170737.21424-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_100803_987002_CA06A4E9 
X-CRM114-Status: GOOD (  22.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MERGE module file:

MERGE module is used to merge two slice-per-line inputs
into one side-by-side output.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
This patch is base on [1]

[1]add mt8195 SoC DRM binding
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=519597
---
 drivers/gpu/drm/mediatek/Makefile           |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   8 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c   | 277 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  16 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   6 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 7 files changed, 309 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index dc54a7a69005..538e0087a44c 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -3,6 +3,7 @@
 mediatek-drm-y := mtk_disp_ccorr.o \
 		  mtk_disp_color.o \
 		  mtk_disp_gamma.o \
+		  mtk_disp_merge.o \
 		  mtk_disp_ovl.o \
 		  mtk_disp_rdma.o \
 		  mtk_drm_crtc.o \
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index cafd9df2d63b..f407cd9d873e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -46,6 +46,14 @@ void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state);
 void mtk_gamma_start(struct device *dev);
 void mtk_gamma_stop(struct device *dev);
 
+int mtk_merge_clk_enable(struct device *dev);
+void mtk_merge_clk_disable(struct device *dev);
+void mtk_merge_config(struct device *dev, unsigned int width,
+		      unsigned int height, unsigned int vrefresh,
+		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+void mtk_merge_start(struct device *dev);
+void mtk_merge_stop(struct device *dev);
+
 void mtk_ovl_bgclr_in_on(struct device *dev);
 void mtk_ovl_bgclr_in_off(struct device *dev);
 void mtk_ovl_bypass_shadow(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
new file mode 100644
index 000000000000..594d76ccd205
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -0,0 +1,277 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
+#include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
+#include "mtk_disp_drv.h"
+
+#define DISP_REG_MERGE_CTRL		0x000
+#define FLD_MERGE_EN BIT(0)
+#define FLD_MERGE_RST BIT(4)
+#define FLD_MERGE_LR_SWAP BIT(8)
+#define FLD_MERGE_DCM_DIS BIT(12)
+
+#define DISP_MERGE_CFG_0		0x010
+#define DISP_MERGE_CFG_4		0x020
+#define DISP_MERGE_CFG_10		0x038
+#define DISP_MERGE_CFG_12		0x040
+#define CFG_10_10_1PI_2PO_BUF_MODE	6
+#define CFG_10_10_2PI_2PO_BUF_MODE	8
+#define DISP_MERGE_CFG_24		0x070
+#define DISP_MERGE_CFG_25		0x074
+
+#define DISP_MERGE_CFG_36		0x0a0
+#define DISP_MERGE_CFG_36_FLD_ULTRA_EN GENMASK(0, 0)
+#define DISP_MERGE_CFG_36_FLD_PREULTRA_EN GENMASK(4, 4)
+#define DISP_MERGE_CFG_36_FLD_HALT_FOR_DVFS_EN GENMASK(8, 8)
+#define DISP_MERGE_CFG_37		0x0a4
+#define DISP_MERGE_CFG_37_FLD_BUFFER_MODE GENMASK(1, 0)
+#define DISP_MERGE_CFG_38		0x0a8
+#define DISP_MERGE_CFG_38_FLD_VDE_BLOCK_ULTRA GENMASK(0, 0)
+#define DISP_MERGE_CFG_38_FLD_VALID_TH_BLOCK_ULTRA GENMASK(4, 4)
+#define DISP_MERGE_CFG_38_FLD_ULTRA_FIFO_VALID_TH GENMASK(31, 16)
+#define DISP_MERGE_CFG_39		0x0ac
+#define DISP_MERGE_CFG_39_FLD_NVDE_FORCE_PREULTRA GENMASK(8, 8)
+#define DISP_MERGE_CFG_39_FLD_NVALID_TH_FORCE_PREULTRA GENMASK(12, 12)
+#define DISP_MERGE_CFG_39_FLD_PREULTRA_FIFO_VALID_TH GENMASK(31, 16)
+#define DISP_MERGE_CFG_40		0x0b0
+#define DISP_MERGE_CFG_40_FLD_ULTRA_TH_LOW GENMASK(15, 0)
+#define DISP_MERGE_CFG_40_FLD_ULTRA_TH_HIGH GENMASK(31, 16)
+#define DISP_MERGE_CFG_41		0x0b4
+#define DISP_MERGE_CFG_41_FLD_PREULTRA_TH_LOW GENMASK(15, 0)
+#define DISP_MERGE_CFG_41_FLD_PREULTRA_TH_HIGH GENMASK(31, 16)
+
+struct mtk_disp_merge {
+	void __iomem *regs;
+	struct clk *clk;
+	struct clk *async_clk;
+	struct cmdq_client_reg		cmdq_reg;
+	bool				fifo_en;
+};
+
+void mtk_merge_start(struct device *dev)
+{
+	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
+
+	mtk_ddp_write(NULL, 0x1, &priv->cmdq_reg, priv->regs, DISP_REG_MERGE_CTRL);
+}
+
+void mtk_merge_stop(struct device *dev)
+{
+	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
+
+	mtk_ddp_write(NULL, 0x0, &priv->cmdq_reg, priv->regs, DISP_REG_MERGE_CTRL);
+}
+
+static void mtk_merge_fifo_setting(struct mtk_disp_merge *priv,
+				   struct cmdq_pkt *handle)
+{
+	unsigned int ultra_en = 1;
+	unsigned int preultra_en = 1;
+	unsigned int halt_for_dvfs_en = 0;
+	/*
+	 * 0 : Off
+	 * 1 : SRAM 0
+	 * 2 : SRAM 1
+	 * 3 : SRAM 0 + SRAM 1
+	 */
+	unsigned int buffer_mode = 3;
+	/* 6 us, 600M pixel/sec */
+	unsigned int ultra_th_low = 6 * 600;
+	/* 8 us, 600M pixel/sec */
+	unsigned int ultra_th_high = 8 * 600;
+	/* 8 us, 600M pixel/sec */
+	unsigned int preultra_th_low = 8 * 600;
+	/* 9 us, 600M pixel/sec */
+	unsigned int preultra_th_high = 9 * 600;
+
+	mtk_ddp_write_mask(handle, ultra_en << 0 | preultra_en << 4 | halt_for_dvfs_en << 8,
+			   &priv->cmdq_reg, priv->regs, DISP_MERGE_CFG_36,
+			   DISP_MERGE_CFG_36_FLD_ULTRA_EN | DISP_MERGE_CFG_36_FLD_PREULTRA_EN |
+			   DISP_MERGE_CFG_36_FLD_HALT_FOR_DVFS_EN);
+
+	mtk_ddp_write_mask(handle, buffer_mode << 0,
+			   &priv->cmdq_reg, priv->regs, DISP_MERGE_CFG_37,
+			   DISP_MERGE_CFG_37_FLD_BUFFER_MODE);
+
+	mtk_ddp_write_mask(handle, 0,
+			   &priv->cmdq_reg, priv->regs, DISP_MERGE_CFG_38,
+			   DISP_MERGE_CFG_38_FLD_VDE_BLOCK_ULTRA |
+			   DISP_MERGE_CFG_38_FLD_VALID_TH_BLOCK_ULTRA |
+			   DISP_MERGE_CFG_38_FLD_ULTRA_FIFO_VALID_TH);
+
+	mtk_ddp_write_mask(handle, 0,
+			   &priv->cmdq_reg, priv->regs, DISP_MERGE_CFG_39,
+			   DISP_MERGE_CFG_39_FLD_NVDE_FORCE_PREULTRA |
+			   DISP_MERGE_CFG_39_FLD_NVALID_TH_FORCE_PREULTRA |
+			   DISP_MERGE_CFG_39_FLD_PREULTRA_FIFO_VALID_TH);
+
+	mtk_ddp_write_mask(handle, ultra_th_low << 0 | ultra_th_high << 16,
+			   &priv->cmdq_reg, priv->regs, DISP_MERGE_CFG_40,
+			   DISP_MERGE_CFG_40_FLD_ULTRA_TH_LOW |
+			   DISP_MERGE_CFG_40_FLD_ULTRA_TH_HIGH);
+
+	mtk_ddp_write_mask(handle, preultra_th_low << 0 | preultra_th_high << 16,
+			   &priv->cmdq_reg, priv->regs, DISP_MERGE_CFG_41,
+			   DISP_MERGE_CFG_41_FLD_PREULTRA_TH_LOW |
+			   DISP_MERGE_CFG_41_FLD_PREULTRA_TH_HIGH);
+}
+
+void mtk_merge_config(struct device *dev, unsigned int w,
+		      unsigned int h, unsigned int vrefresh,
+		      unsigned int bpc, struct cmdq_pkt *handle)
+{
+	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
+	unsigned int mode = CFG_10_10_1PI_2PO_BUF_MODE;
+
+	if (!h || !w) {
+		pr_err("%s: input width(%d) or height(%d) is invalid\n",
+		       __func__, w, h);
+		return;
+	}
+
+	if (priv->fifo_en) {
+		mtk_merge_fifo_setting(priv, handle);
+		mode = CFG_10_10_2PI_2PO_BUF_MODE;
+	}
+
+	mtk_ddp_write(handle, (h << 16 | w), &priv->cmdq_reg, priv->regs,
+		      DISP_MERGE_CFG_0);
+	mtk_ddp_write(handle, (h << 16 | w), &priv->cmdq_reg, priv->regs,
+		      DISP_MERGE_CFG_4);
+	mtk_ddp_write(handle, (h << 16 | w), &priv->cmdq_reg, priv->regs,
+		      DISP_MERGE_CFG_24);
+	mtk_ddp_write(handle, (h << 16 | w), &priv->cmdq_reg, priv->regs,
+		      DISP_MERGE_CFG_25);
+	/* no swap */
+	mtk_ddp_write_mask(handle, 0, &priv->cmdq_reg, priv->regs,
+			   DISP_MERGE_CFG_10, 0x1f);
+	mtk_ddp_write_mask(handle, mode, &priv->cmdq_reg, priv->regs,
+			   DISP_MERGE_CFG_12, 0x1f);
+}
+
+int mtk_merge_clk_enable(struct device *dev)
+{
+	int ret = 0;
+	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
+
+	ret = clk_prepare_enable(priv->clk);
+	if (ret)
+		pr_err("merge clk prepare enable failed\n");
+
+	if (priv->async_clk) {
+		ret = clk_prepare_enable(priv->async_clk);
+		if (ret)
+			pr_err("async clk prepare enable failed\n");
+	}
+
+	return ret;
+}
+
+void mtk_merge_clk_disable(struct device *dev)
+{
+	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
+
+	if (priv->async_clk)
+		clk_disable_unprepare(priv->async_clk);
+
+	clk_disable_unprepare(priv->clk);
+}
+
+static int mtk_disp_merge_bind(struct device *dev, struct device *master,
+			       void *data)
+{
+	return 0;
+}
+
+static void mtk_disp_merge_unbind(struct device *dev, struct device *master,
+				  void *data)
+{
+}
+
+static const struct component_ops mtk_disp_merge_component_ops = {
+	.bind	= mtk_disp_merge_bind,
+	.unbind = mtk_disp_merge_unbind,
+};
+
+static int mtk_disp_merge_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	struct mtk_disp_merge *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->regs)) {
+		dev_err(dev, "failed to ioremap merge\n");
+		return PTR_ERR(priv->regs);
+	}
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "failed to get merge clk\n");
+		return PTR_ERR(priv->clk);
+	}
+
+	priv->async_clk = of_clk_get(dev->of_node, 1);
+	if (IS_ERR(priv->async_clk)) {
+		ret = PTR_ERR(priv->async_clk);
+		dev_dbg(dev, "No merge async clock: %d\n", ret);
+		priv->async_clk = NULL;
+	}
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+#endif
+
+	priv->fifo_en = of_property_read_bool(dev->of_node,
+					      "mediatek,merge-fifo-en");
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = component_add(dev, &mtk_disp_merge_component_ops);
+	if (ret != 0)
+		dev_err(dev, "Failed to add component: %d\n", ret);
+
+	return ret;
+}
+
+static int mtk_disp_merge_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_disp_merge_component_ops);
+
+	return 0;
+}
+
+static const struct of_device_id mtk_disp_merge_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8195-disp-merge", },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, mtk_disp_merge_driver_dt_match);
+
+struct platform_driver mtk_disp_merge_driver = {
+	.probe = mtk_disp_merge_probe,
+	.remove = mtk_disp_merge_remove,
+	.driver = {
+		.name = "mediatek-disp-merge",
+		.owner = THIS_MODULE,
+		.of_match_table = mtk_disp_merge_driver_dt_match,
+	},
+};
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 6f4a9b8c9914..a037b564052e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -376,6 +376,14 @@ static const struct mtk_ddp_comp_funcs ddp_rdma = {
 	.layer_config = mtk_rdma_layer_config,
 };
 
+static const struct mtk_ddp_comp_funcs ddp_merge = {
+	.clk_enable = mtk_merge_clk_enable,
+	.clk_disable = mtk_merge_clk_disable,
+	.start = mtk_merge_start,
+	.stop = mtk_merge_stop,
+	.config = mtk_merge_config,
+};
+
 static const struct mtk_ddp_comp_funcs ddp_ufoe = {
 	.clk_enable = mtk_ddp_clk_enable,
 	.clk_disable = mtk_ddp_clk_disable,
@@ -400,6 +408,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_OD] = "od",
 	[MTK_DISP_BLS] = "bls",
 	[MTK_DISP_DSC] = "dsc",
+	[MTK_DISP_MERGE] = "merge",
 };
 
 struct mtk_ddp_comp_match {
@@ -425,6 +434,12 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_DSI2]	= { MTK_DSI,		2, &ddp_dsi },
 	[DDP_COMPONENT_DSI3]	= { MTK_DSI,		3, &ddp_dsi },
 	[DDP_COMPONENT_GAMMA]	= { MTK_DISP_GAMMA,	0, &ddp_gamma },
+	[DDP_COMPONENT_MERGE0]	= { MTK_DISP_MERGE,	0, &ddp_merge },
+	[DDP_COMPONENT_MERGE1]	= { MTK_DISP_MERGE,	1, &ddp_merge },
+	[DDP_COMPONENT_MERGE2]	= { MTK_DISP_MERGE,	2, &ddp_merge },
+	[DDP_COMPONENT_MERGE3]	= { MTK_DISP_MERGE,	3, &ddp_merge },
+	[DDP_COMPONENT_MERGE4]	= { MTK_DISP_MERGE,	4, &ddp_merge },
+	[DDP_COMPONENT_MERGE5]	= { MTK_DISP_MERGE,	5, &ddp_merge },
 	[DDP_COMPONENT_OD0]	= { MTK_DISP_OD,	0, &ddp_od },
 	[DDP_COMPONENT_OD1]	= { MTK_DISP_OD,	1, &ddp_od },
 	[DDP_COMPONENT_OVL0]	= { MTK_DISP_OVL,	0, &ddp_ovl },
@@ -557,6 +572,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	    type == MTK_DISP_GAMMA ||
 	    type == MTK_DPI ||
 	    type == MTK_DSI ||
+	    type == MTK_DISP_MERGE ||
 	    type == MTK_DISP_OVL ||
 	    type == MTK_DISP_OVL_2L ||
 	    type == MTK_DISP_PWM ||
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 661fb620e266..0afd78c0bc92 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -35,6 +35,7 @@ enum mtk_ddp_comp_type {
 	MTK_DISP_OD,
 	MTK_DISP_BLS,
 	MTK_DISP_DSC,
+	MTK_DISP_MERGE,
 	MTK_DDP_COMP_TYPE_MAX,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 0f6bb4bdc58a..53e0de3f17d7 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -448,6 +448,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_DITHER },
 	{ .compatible = "mediatek,mt8195-disp-dsc",
 	  .data = (void *)MTK_DISP_DSC },
+	{ .compatible = "mediatek,mt8195-disp-merge",
+	  .data = (void *)MTK_DISP_MERGE },
 	{ .compatible = "mediatek,mt8173-disp-ufoe",
 	  .data = (void *)MTK_DISP_UFOE },
 	{ .compatible = "mediatek,mt2701-dsi",
@@ -558,13 +560,14 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		private->comp_node[comp_id] = of_node_get(node);
 
 		/*
-		 * Currently only the CCORR, COLOR, GAMMA, OVL, RDMA, DSI, and DPI
+		 * Currently only the CCORR, COLOR, GAMMA, MERGE, OVL, RDMA, DSI, and DPI
 		 * blocks have separate component platform drivers and initialize their own
 		 * DDP component structure. The others are initialized here.
 		 */
 		if (comp_type == MTK_DISP_CCORR ||
 		    comp_type == MTK_DISP_COLOR ||
 		    comp_type == MTK_DISP_GAMMA ||
+		    comp_type == MTK_DISP_MERGE ||
 		    comp_type == MTK_DISP_OVL ||
 		    comp_type == MTK_DISP_OVL_2L ||
 		    comp_type == MTK_DISP_RDMA ||
@@ -665,6 +668,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_disp_ccorr_driver,
 	&mtk_disp_color_driver,
 	&mtk_disp_gamma_driver,
+	&mtk_disp_merge_driver,
 	&mtk_disp_ovl_driver,
 	&mtk_disp_rdma_driver,
 	&mtk_dpi_driver,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 637f5669e895..0fa417219a69 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -49,6 +49,7 @@ struct mtk_drm_private {
 extern struct platform_driver mtk_disp_ccorr_driver;
 extern struct platform_driver mtk_disp_color_driver;
 extern struct platform_driver mtk_disp_gamma_driver;
+extern struct platform_driver mtk_disp_merge_driver;
 extern struct platform_driver mtk_disp_ovl_driver;
 extern struct platform_driver mtk_disp_rdma_driver;
 extern struct platform_driver mtk_dpi_driver;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
