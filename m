Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE693C636C8
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 17:48:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5375B61370
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 17:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5375B61370
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/eLfXOs/b4Po1e8EqjPJwYh5qr+nvizGMhjsjxGvY0A=; b=Xz3MTLS25h44sK
	6rLyMUqFt+i259stEtoNDeYI4fFoKv/ODD+XAa1SqAL8lc7I0nsWuZwivefm1SdA4U3dzbdUXat8J
	RfAZf5Y7Sj9UrJSzGMuO1fwKFkdkcOwZPCRXSutDD3IAL/IZHhId7w1SBUMZIHD7YYUufcZpUvpHF
	SHOm1oyCZxYP2x/tHBM1+If3JWSx50UDyqSJTNNcW8Ce4fWSAhV3KFxmT3NGdDIqf5utwwZCi7HP3
	5pJpzCXKAhIvtezlIC/NvVwQcyW+J5lgntVK5adjx5uFRvhaIJ59HTxKX6bOVvd0ZQvePWWADDGgH
	hdn93Z5tmE2WKfvJzylg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m45T5-001r6r-FV; Thu, 15 Jul 2021 17:48:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m45Sx-001r4E-Gh; Thu, 15 Jul 2021 17:48:11 +0000
X-UUID: 6d3072aae4054509b01215335a74a055-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=34xWIA+EWALPjPRBA3FmZUdrg2H0mjHdZxoQorPtNLA=; 
 b=j0LqchX7Qf6Yw0JdZmUDvjtKoDIfoNtc5u7ee7bNridwPbl/iE/MgxXOTvZJODcPIqL76wdUXtqKJFcoYOSyLKZC+VxFvoqEl3kGXbYFAYC7CFKNwpB3BLa44fEgZvEAGQuUFr30+eB0h0mX8tCX7OWt1D+I8v2Qi1Rq3VpubBY=;
X-UUID: 6d3072aae4054509b01215335a74a055-20210715
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1725238081; Thu, 15 Jul 2021 10:48:05 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 10:38:03 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 01:37:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 16 Jul 2021 01:37:54 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v3 12/12] drm/mediatek: add MERGE support for MT8195
Date: Fri, 16 Jul 2021 01:37:50 +0800
Message-ID: <20210715173750.10852-13-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210715173750.10852-1-jason-jh.lin@mediatek.com>
References: <20210715173750.10852-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_104807_663429_E2199300 
X-CRM114-Status: GOOD (  18.33  )
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

1. Add MERGE module file:
   MERGE module is used to merge two slice-per-line inputs
   into one side-by-side output.

2. Add REG_FLD macro in mtk_dem_crtc header to support
   bitwise register settings.

Change-Id: Ie196aa61661eaf7d0959482d3700f3242de32e5e
Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile           |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   8 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c   | 372 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  14 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  16 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   4 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 8 files changed, 417 insertions(+)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 44948e221fd3..27c89847d43b 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -4,6 +4,7 @@ mediatek-drm-y := mtk_disp_ccorr.o \
 		  mtk_disp_color.o \
 		  mtk_disp_dsc.o \
 		  mtk_disp_gamma.o \
+		  mtk_disp_merge.o \
 		  mtk_disp_ovl.o \
 		  mtk_disp_rdma.o \
 		  mtk_drm_crtc.o \
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index c7e9bd370acd..3e27ce7fef57 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -54,6 +54,14 @@ void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state);
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
index 000000000000..768c282d2d63
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -0,0 +1,372 @@
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
+#include "mtk_drm_crtc.h"
+#include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
+#include "mtk_disp_drv.h"
+
+#define DISP_REG_MERGE_CTRL (0x000)
+#define FLD_MERGE_EN BIT(0)
+#define FLD_MERGE_RST BIT(4)
+#define FLD_MERGE_LR_SWAP BIT(8)
+#define FLD_MERGE_DCM_DIS BIT(12)
+#define DISP_MERGE_CFG_0		0x010
+#define DISP_MERGE_CFG_4		0x020
+#define DISP_MERGE_CFG_10	0x038
+#define DISP_MERGE_CFG_12	0x040
+#define CFG_10_10_1PI_2PO_BUF_MODE	6
+#define CFG_10_10_2PI_2PO_BUF_MODE	8
+#define DISP_MERGE_CFG_24	0x070
+#define DISP_MERGE_CFG_25	0x074
+#define DISP_MERGE_CFG_36	0x0a0
+#define DISP_MERGE_CFG_36_FLD_ULTRA_EN REG_FLD(1, 0)
+#define DISP_MERGE_CFG_36_FLD_PREULTRA_EN REG_FLD(1, 4)
+#define DISP_MERGE_CFG_36_FLD_HALT_FOR_DVFS_EN REG_FLD(1, 8)
+#define DISP_MERGE_CFG_36_VAL_ULTRA_EN(val) \
+	REG_FLD_VAL(DISP_MERGE_CFG_36_FLD_ULTRA_EN, val)
+#define DISP_MERGE_CFG_36_VAL_PREULTRA_EN(val) \
+	REG_FLD_VAL(DISP_MERGE_CFG_36_FLD_PREULTRA_EN, val)
+#define DISP_MERGE_CFG_36_VAL_HALT_FOR_DVFS_EN(val) \
+	REG_FLD_VAL(DISP_MERGE_CFG_36_FLD_HALT_FOR_DVFS_EN, val)
+#define DISP_MERGE_CFG_37	0x0a4
+#define DISP_MERGE_CFG_37_FLD_BUFFER_MODE REG_FLD(2, 0)
+#define DISP_MERGE_CFG_37_VAL_BUFFER_MODE(val) \
+	REG_FLD_VAL(DISP_MERGE_CFG_37_FLD_BUFFER_MODE, val)
+#define DISP_MERGE_CFG_38	0x0a8
+#define DISP_MERGE_CFG_38_FLD_VDE_BLOCK_ULTRA REG_FLD(1, 0)
+#define DISP_MERGE_CFG_38_FLD_VALID_TH_BLOCK_ULTRA REG_FLD(1, 4)
+#define DISP_MERGE_CFG_38_FLD_ULTRA_FIFO_VALID_TH REG_FLD(16, 16)
+#define DISP_MERGE_CFG_38_VAL_VDE_BLOCK_ULTRA(val) \
+	REG_FLD_VAL(DISP_MERGE_CFG_38_FLD_VDE_BLOCK_ULTRA, val)
+#define DISP_MERGE_CFG_38_VAL_VALID_TH_BLOCK_ULTRA(val) \
+	REG_FLD_VAL(DISP_MERGE_CFG_38_FLD_VALID_TH_BLOCK_ULTRA, val)
+#define DISP_MERGE_CFG_38_VAL_ULTRA_FIFO_VALID_TH(val) \
+	REG_FLD_VAL(DISP_MERGE_CFG_38_FLD_ULTRA_FIFO_VALID_TH, val)
+#define DISP_MERGE_CFG_39	0x0ac
+#define DISP_MERGE_CFG_39_FLD_NVDE_FORCE_PREULTRA REG_FLD(1, 8)
+#define DISP_MERGE_CFG_39_FLD_NVALID_TH_FORCE_PREULTRA REG_FLD(1, 12)
+#define DISP_MERGE_CFG_39_FLD_PREULTRA_FIFO_VALID_TH REG_FLD(16, 16)
+#define DISP_MERGE_CFG_39_VAL_NVDE_FORCE_PREULTRA(val) \
+	REG_FLD_VAL(DISP_MERGE_CFG_39_FLD_NVDE_FORCE_PREULTRA, val)
+#define DISP_MERGE_CFG_39_VAL_NVALID_TH_FORCE_PREULTRA(val) \
+	REG_FLD_VAL(DISP_MERGE_CFG_39_FLD_NVALID_TH_FORCE_PREULTRA, val)
+#define DISP_MERGE_CFG_39_VAL_PREULTRA_FIFO_VALID_TH(val) \
+	REG_FLD_VAL(DISP_MERGE_CFG_39_FLD_PREULTRA_FIFO_VALID_TH, val)
+#define DISP_MERGE_CFG_40	0x0b0
+#define DISP_MERGE_CFG_40_FLD_ULTRA_TH_LOW REG_FLD(16, 0)
+#define DISP_MERGE_CFG_40_FLD_ULTRA_TH_HIGH REG_FLD(16, 16)
+#define DISP_MERGE_CFG_40_VAL_ULTRA_TH_LOW(val) \
+	REG_FLD_VAL(DISP_MERGE_CFG_40_FLD_ULTRA_TH_LOW, (val))
+#define DISP_MERGE_CFG_40_VAL_ULTRA_TH_HIGH(val) \
+	REG_FLD_VAL(DISP_MERGE_CFG_40_FLD_ULTRA_TH_HIGH, val)
+#define DISP_MERGE_CFG_41	0x0b4
+#define DISP_MERGE_CFG_41_FLD_PREULTRA_TH_LOW REG_FLD(16, 0)
+#define DISP_MERGE_CFG_41_FLD_PREULTRA_TH_HIGH REG_FLD(16, 16)
+#define DISP_MERGE_CFG_41_VAL_PREULTRA_TH_LOW(val) \
+	REG_FLD_VAL(DISP_MERGE_CFG_41_FLD_PREULTRA_TH_LOW, val)
+#define DISP_MERGE_CFG_41_VAL_PREULTRA_TH_HIGH(val) \
+	REG_FLD_VAL(DISP_MERGE_CFG_41_FLD_PREULTRA_TH_HIGH, val)
+
+struct mtk_merge_config_struct {
+	unsigned short width_right;
+	unsigned short width_left;
+	unsigned int height;
+	unsigned int mode;
+};
+
+struct mtk_disp_merge {
+	enum mtk_ddp_comp_id comp_id;
+	struct drm_crtc *crtc;
+	struct clk *clk;
+	struct clk *async_clk;
+	void __iomem *regs;
+	struct cmdq_client_reg		cmdq_reg;
+	u32				fifo_en;
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
+static int mtk_merge_check_params(struct mtk_merge_config_struct *merge_config)
+{
+	if (!merge_config->height ||
+	    !merge_config->width_left || !merge_config->width_right) {
+		pr_err("%s:merge input width l(%u) w(%u) h(%u)\n",
+		       __func__, merge_config->width_left,
+		       merge_config->width_right, merge_config->height);
+		return -EINVAL;
+	}
+	pr_debug("%s:merge input width l(%u) r(%u) height(%u)\n",
+		 __func__, merge_config->width_left,
+		 merge_config->width_right, merge_config->height);
+	return 0;
+}
+
+static int mtk_merge_fifo_setting(struct mtk_disp_merge *priv,
+				    struct cmdq_pkt *handle)
+{
+	int ultra_en = 1;
+	int preultra_en = 1;
+	int halt_for_dvfs_en = 0;
+	int buffer_mode = 3;
+	int vde_block_ultra = 0;
+	int valid_th_block_ultra = 0;
+	int ultra_fifo_valid_th = 0;
+	int nvde_force_preultra = 0;
+	int nvalid_th_force_preultra = 0;
+	int preultra_fifo_valid_th = 0;
+	int ultra_th_low = 0xe10;
+	int ultra_th_high = 0x12c0;
+	int preultra_th_low = 0x12c0;
+	int preultra_th_high = 0x1518;
+
+	mtk_ddp_write_mask(handle,
+			   DISP_MERGE_CFG_36_VAL_ULTRA_EN(ultra_en) |
+			   DISP_MERGE_CFG_36_VAL_PREULTRA_EN(preultra_en) |
+			   DISP_MERGE_CFG_36_VAL_HALT_FOR_DVFS_EN(halt_for_dvfs_en),
+			   &priv->cmdq_reg, priv->regs, DISP_MERGE_CFG_36,
+			   REG_FLD_MASK(DISP_MERGE_CFG_36_FLD_ULTRA_EN) |
+			   REG_FLD_MASK(DISP_MERGE_CFG_36_FLD_PREULTRA_EN) |
+			   REG_FLD_MASK(DISP_MERGE_CFG_36_FLD_HALT_FOR_DVFS_EN));
+
+	mtk_ddp_write_mask(handle,
+			   DISP_MERGE_CFG_37_VAL_BUFFER_MODE(buffer_mode),
+			   &priv->cmdq_reg, priv->regs, DISP_MERGE_CFG_37,
+			   REG_FLD_MASK(DISP_MERGE_CFG_37_FLD_BUFFER_MODE));
+
+	mtk_ddp_write_mask(handle,
+			   DISP_MERGE_CFG_38_VAL_VDE_BLOCK_ULTRA(vde_block_ultra) |
+			   DISP_MERGE_CFG_38_VAL_VALID_TH_BLOCK_ULTRA(valid_th_block_ultra) |
+			   DISP_MERGE_CFG_38_VAL_ULTRA_FIFO_VALID_TH(ultra_fifo_valid_th),
+			   &priv->cmdq_reg, priv->regs, DISP_MERGE_CFG_38,
+			   REG_FLD_MASK(DISP_MERGE_CFG_38_FLD_VDE_BLOCK_ULTRA) |
+			   REG_FLD_MASK(DISP_MERGE_CFG_38_FLD_VALID_TH_BLOCK_ULTRA) |
+			   REG_FLD_MASK(DISP_MERGE_CFG_38_FLD_ULTRA_FIFO_VALID_TH));
+
+	mtk_ddp_write_mask(handle,
+			   DISP_MERGE_CFG_39_VAL_NVDE_FORCE_PREULTRA(nvde_force_preultra) |
+			   DISP_MERGE_CFG_39_VAL_NVALID_TH_FORCE_PREULTRA
+				(nvalid_th_force_preultra) |
+			   DISP_MERGE_CFG_39_VAL_PREULTRA_FIFO_VALID_TH(preultra_fifo_valid_th),
+			   &priv->cmdq_reg, priv->regs, DISP_MERGE_CFG_39,
+			   REG_FLD_MASK(DISP_MERGE_CFG_39_FLD_NVDE_FORCE_PREULTRA) |
+			   REG_FLD_MASK(DISP_MERGE_CFG_39_FLD_NVALID_TH_FORCE_PREULTRA) |
+			   REG_FLD_MASK(DISP_MERGE_CFG_39_FLD_PREULTRA_FIFO_VALID_TH));
+
+	mtk_ddp_write_mask(handle,
+			   DISP_MERGE_CFG_40_VAL_ULTRA_TH_LOW(ultra_th_low) |
+			   DISP_MERGE_CFG_40_VAL_ULTRA_TH_HIGH(ultra_th_high),
+			   &priv->cmdq_reg, priv->regs, DISP_MERGE_CFG_40,
+			   REG_FLD_MASK(DISP_MERGE_CFG_40_FLD_ULTRA_TH_LOW) |
+			   REG_FLD_MASK(DISP_MERGE_CFG_40_FLD_ULTRA_TH_HIGH));
+
+	mtk_ddp_write_mask(handle,
+			   DISP_MERGE_CFG_41_VAL_PREULTRA_TH_LOW(preultra_th_low) |
+			   DISP_MERGE_CFG_41_VAL_PREULTRA_TH_HIGH(preultra_th_high),
+			   &priv->cmdq_reg, priv->regs, DISP_MERGE_CFG_41,
+			   REG_FLD_MASK(DISP_MERGE_CFG_41_FLD_PREULTRA_TH_LOW) |
+			   REG_FLD_MASK(DISP_MERGE_CFG_41_FLD_PREULTRA_TH_HIGH));
+
+	return 0;
+}
+
+void mtk_merge_config(struct device *dev, unsigned int w,
+		      unsigned int h, unsigned int vrefresh,
+		      unsigned int bpc, struct cmdq_pkt *handle)
+{
+	struct mtk_merge_config_struct merge_config;
+	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
+
+	if (priv->fifo_en)
+		mtk_merge_fifo_setting(priv, handle);
+
+	switch (priv->comp_id) {
+	case DDP_COMPONENT_MERGE0:
+		merge_config.mode = CFG_10_10_1PI_2PO_BUF_MODE;
+		merge_config.width_left = w;
+		merge_config.width_right = w;
+		merge_config.height = h;
+		break;
+	case DDP_COMPONENT_MERGE5:
+		merge_config.mode = CFG_10_10_2PI_2PO_BUF_MODE;
+		merge_config.width_left = w;
+		merge_config.width_right = w;
+		merge_config.height = h;
+		break;
+	default:
+		pr_err("No find component merge %d\n", priv->comp_id);
+		return;
+	}
+
+	mtk_merge_check_params(&merge_config);
+
+	mtk_ddp_write(handle, (h << 16 | w), &priv->cmdq_reg, priv->regs,
+		     DISP_MERGE_CFG_0);
+
+	mtk_ddp_write(handle, (h << 16 | w), &priv->cmdq_reg, priv->regs,
+		     DISP_MERGE_CFG_4);
+
+	mtk_ddp_write(handle, (h << 16 | w), &priv->cmdq_reg, priv->regs,
+			   DISP_MERGE_CFG_24);
+
+	mtk_ddp_write(handle, (h << 16 | w), &priv->cmdq_reg, priv->regs,
+			   DISP_MERGE_CFG_25);
+
+	/* no swap */
+	mtk_ddp_write_mask(handle, 0, &priv->cmdq_reg, priv->regs,
+			   DISP_MERGE_CFG_10, 0x1f);
+
+	mtk_ddp_write_mask(handle, merge_config.mode, &priv->cmdq_reg, priv->regs,
+			   DISP_MERGE_CFG_12, 0x1f);
+}
+
+int mtk_merge_clk_enable(struct device *dev)
+{
+	int ret = 0;
+	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
+
+	if (priv->clk) {
+		ret = clk_prepare_enable(priv->clk);
+		if (ret)
+			pr_err("merge clk prepare enable failed\n");
+	}
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
+	if (priv->clk)
+		clk_disable_unprepare(priv->clk);
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
+	enum mtk_ddp_comp_id comp_id;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DISP_MERGE);
+	if ((int)comp_id < 0) {
+		dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
+		return comp_id;
+	}
+
+	priv->comp_id = comp_id;
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "failed to get merge clk\n");
+		return PTR_ERR(priv->clk);
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->regs)) {
+		dev_err(dev, "failed to ioremap merge\n");
+		return PTR_ERR(priv->regs);
+	}
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+#endif
+
+	priv->async_clk = of_clk_get(dev->of_node, 1);
+	if (IS_ERR(priv->async_clk)) {
+		ret = PTR_ERR(priv->async_clk);
+		dev_dbg(dev, "No merge async clock: %d\n", ret);
+		priv->async_clk = NULL;
+	}
+
+	priv->fifo_en = of_property_read_bool(dev->of_node,
+		"mediatek,merge-fifo-en");
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
+
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
index cb9a36c48d4f..66d1cf03dfe8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
@@ -14,6 +14,20 @@
 #define MTK_MAX_BPC	10
 #define MTK_MIN_BPC	3
 
+#define REG_FLD(width, shift) \
+	((unsigned int)((((width) & 0xff) << 16) | ((shift) & 0xff)))
+
+#define REG_FLD_WIDTH(field) ((unsigned int)(((field) >> 16) & 0xff))
+
+#define REG_FLD_SHIFT(field) ((unsigned int)((field) & 0xff))
+
+#define REG_FLD_MASK(field) \
+	((unsigned int)((1ULL << REG_FLD_WIDTH(field)) - 1) \
+	 << REG_FLD_SHIFT(field))
+
+#define REG_FLD_VAL(field, val) \
+	(((val) << REG_FLD_SHIFT(field)) & REG_FLD_MASK(field))
+
 void mtk_drm_crtc_commit(struct drm_crtc *crtc);
 int mtk_drm_crtc_create(struct drm_device *drm_dev,
 			const enum mtk_ddp_comp_id *path,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index ba3d7a1ce7ab..9125d0f6352f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -341,6 +341,14 @@ static const struct mtk_ddp_comp_funcs ddp_dsc = {
 	.clk_disable = mtk_dsc_clk_disable,
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
@@ -365,6 +373,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_OD] = "od",
 	[MTK_DISP_BLS] = "bls",
 	[MTK_DISP_DSC] = "dsc",
+	[MTK_DISP_MERGE] = "merge",
 };
 
 struct mtk_ddp_comp_match {
@@ -391,6 +400,12 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
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
@@ -522,6 +537,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	    type == MTK_DISP_COLOR ||
 	    type == MTK_DISP_DSC ||
 	    type == MTK_DISP_GAMMA ||
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
index 990a54049a7d..11c25daf05d8 100644
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
@@ -566,6 +568,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		    comp_type == MTK_DISP_COLOR ||
 		    comp_type == MTK_DISP_DSC ||
 		    comp_type == MTK_DISP_GAMMA ||
+		    comp_type == MTK_DISP_MERGE ||
 		    comp_type == MTK_DISP_OVL ||
 		    comp_type == MTK_DISP_OVL_2L ||
 		    comp_type == MTK_DISP_RDMA ||
@@ -667,6 +670,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_disp_color_driver,
 	&mtk_disp_dsc_driver,
 	&mtk_disp_gamma_driver,
+	&mtk_disp_merge_driver,
 	&mtk_disp_ovl_driver,
 	&mtk_disp_rdma_driver,
 	&mtk_dpi_driver,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 8b722330ef7d..c4d802a43531 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -52,6 +52,7 @@ extern struct platform_driver mtk_disp_gamma_driver;
 extern struct platform_driver mtk_disp_ovl_driver;
 extern struct platform_driver mtk_disp_rdma_driver;
 extern struct platform_driver mtk_disp_dsc_driver;
+extern struct platform_driver mtk_disp_merge_driver;
 extern struct platform_driver mtk_dpi_driver;
 extern struct platform_driver mtk_dsi_driver;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
