Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED63C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 09:25:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AE95600D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 09:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8AE95600D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+nz+m7CimolffGTN5kWdyDyilwxruZtm+OzO1MdNQY=; b=lmKzOh0VZ4USZS
	WfmMFrhUvYgMUSnA/dJ7VSZbGBgNDHeIW5ZPnut51wBMYXESOUEsW+E+R6ocV1FGVASV8mDBw3KDH
	x2vOatHtcilDSQe2kflzCNusXeIEM7bQPhWX7TM9W1nGPzpgtypjClmZKzh1e35OLNzOYRoxk7eCI
	csqElO9GYEg9YNP+yPP7/iQDGs7CoQjNXZgHm2x7K+VFIO7CC2S69hteOw3+8OJCy/6gqAdwCmv1g
	iv8eOOp5lCF5vd8KRCrvm/S2VUPlRr4kD2p5KJucoSHZIkznHa/V9h5Q/Kji+4orGn1HZ1xD8sKgv
	uBQZlW/Q5ZIh3qXqGcZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGHor-004sIh-8A; Wed, 18 Aug 2021 09:25:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGHj1-004pUn-Sb; Wed, 18 Aug 2021 09:19:12 +0000
X-UUID: 5e35c9cd21994490ad13c208c4bf1d00-20210818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=lzKKV84Rc5v2IKyJuV1/1ZMnofJ8abIDKOVTyhNs7Z4=; 
 b=W75pIGcKk1XKD9oNMal1DoTGErYd5Lr9JRmZacAlqTxi2QfVEQjnBeClt0urr+2+cTqfpEGSTlxJ3W8QN96CsC7TPEb+KthC/1AsBeMHWJ418FGdAoL/e06s1cl4+1yhb/kiOh/qmnqQmN8lDsaZv688ewoDhFFkmcdYaFwthWo=;
X-UUID: 5e35c9cd21994490ad13c208c4bf1d00-20210818
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 916102422; Wed, 18 Aug 2021 02:18:53 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 02:18:52 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 17:18:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 18 Aug 2021 17:18:51 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH v3 13/15] drm/mediatek: add ovl_adaptor support for MT8195
Date: Wed, 18 Aug 2021 17:18:45 +0800
Message-ID: <20210818091847.8060-14-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210818091847.8060-1-nancy.lin@mediatek.com>
References: <20210818091847.8060-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_021908_044179_5E50948C 
X-CRM114-Status: GOOD (  19.54  )
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

Add ovl_adaptor driver for MT8195.
Ovl_adaptor is an encapsulated module and designed for simplified
DRM control flow. This module is composed of 8 RDMAs, 4 MERGEs and
an ETHDR. Two RDMAs merge into one layer, so this module support 4
layers.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile             |   3 +-
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 528 ++++++++++++++++++
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.h   |  19 +
 3 files changed, 549 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.h

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 38ec2354a894..f04ac86c9593 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -13,7 +13,8 @@ mediatek-drm-y := mtk_disp_ccorr.o \
 		  mtk_drm_plane.o \
 		  mtk_dsi.o \
 		  mtk_dpi.o \
-		  mtk_mdp_rdma.o
+		  mtk_mdp_rdma.o \
+		  mtk_disp_ovl_adaptor.o
 
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
new file mode 100644
index 000000000000..8222ec5ff799
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -0,0 +1,528 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <drm/drm_fourcc.h>
+#include <linux/clk.h>
+#include <linux/reset.h>
+#include <linux/component.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/soc/mediatek/mtk-mmsys.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
+#include "mtk_drm_drv.h"
+#include "mtk_drm_crtc.h"
+#include "mtk_drm_ddp_comp.h"
+#include "mtk_disp_drv.h"
+#include "mtk_disp_ovl_adaptor.h"
+
+#define DISP_MERGE_ENABLE	0x0
+	#define MERGE_ENABLE BIT(0)
+#define DISP_MERGE_CFG_0	0x10
+#define DISP_MERGE_CFG_1	0x14
+#define DISP_MERGE_CFG_4	0x20
+#define DISP_MERGE_CFG_5	0x24
+#define DISP_MERGE_CFG_10	0x38
+	#define CFG_10_NO_SWAP 0
+#define DISP_MERGE_CFG_12	0x40
+	#define CFG12_10_10_1PI_2PO_BUF_MODE 6
+	#define CFG12_11_10_1PI_2PO_MERGE 18
+#define DISP_MERGE_CFG_24	0x70
+#define DISP_MERGE_CFG_25	0x74
+#define DISP_MERGE_CFG_26	0x78
+#define DISP_MERGE_CFG_27	0x7c
+#define DISP_MERGE_MUTE_0	0xf00
+
+#define MTK_OVL_ADAPTOR_RDMA_MAX_WIDTH 1920
+#define MTK_OVL_ADAPTOR_LAYER_NUM 4
+
+enum mtk_ovl_adaptor_comp_type {
+	OVL_ADAPTOR_TYPE_RDMA = 0,
+	OVL_ADAPTOR_TYPE_MERGE,
+	OVL_ADAPTOR_TYPE_NUM,
+};
+
+enum mtk_ovl_adaptor_comp_id {
+	OVL_ADAPTOR_MDP_RDMA0,
+	OVL_ADAPTOR_MDP_RDMA1,
+	OVL_ADAPTOR_MDP_RDMA2,
+	OVL_ADAPTOR_MDP_RDMA3,
+	OVL_ADAPTOR_MDP_RDMA4,
+	OVL_ADAPTOR_MDP_RDMA5,
+	OVL_ADAPTOR_MDP_RDMA6,
+	OVL_ADAPTOR_MDP_RDMA7,
+	OVL_ADAPTOR_MERGE0,
+	OVL_ADAPTOR_MERGE1,
+	OVL_ADAPTOR_MERGE2,
+	OVL_ADAPTOR_MERGE3,
+	OVL_ADAPTOR_ID_MAX
+};
+
+struct ovl_adaptor_comp_match {
+	enum mtk_ovl_adaptor_comp_type type;
+	int alias_id;
+};
+
+struct ovl_adaptor_merge_config {
+	unsigned int fmt;
+	unsigned int merge_mode;
+	unsigned int in_w[2];
+	unsigned int out_w[2];
+	unsigned int in_h;
+};
+
+struct mtk_ovl_adaptor_comp {
+	struct device *dev;
+	struct clk *clks[2];
+	struct cmdq_client_reg cmdq_base;
+	void __iomem *regs;
+};
+
+struct mtk_disp_ovl_adaptor {
+	struct mtk_ovl_adaptor_comp ovl_adaptor_comp[OVL_ADAPTOR_ID_MAX];
+	struct device *mmsys_dev;
+};
+
+static const char * const ovl_adaptor_comp_str[] = {
+	"OVL_ADAPTOR_MDP_RDMA0",
+	"OVL_ADAPTOR_MDP_RDMA1",
+	"OVL_ADAPTOR_MDP_RDMA2",
+	"OVL_ADAPTOR_MDP_RDMA3",
+	"OVL_ADAPTOR_MDP_RDMA4",
+	"OVL_ADAPTOR_MDP_RDMA5",
+	"OVL_ADAPTOR_MDP_RDMA6",
+	"OVL_ADAPTOR_MDP_RDMA7",
+	"OVL_ADAPTOR_MERGE0",
+	"OVL_ADAPTOR_MERGE1",
+	"OVL_ADAPTOR_MERGE2",
+	"OVL_ADAPTOR_MERGE3",
+	"OVL_ADAPTOR_ID_MAX"
+};
+
+static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
+	[OVL_ADAPTOR_TYPE_RDMA] = "vdo1_rdma",
+	[OVL_ADAPTOR_TYPE_MERGE] = "merge",
+};
+
+static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_MAX] = {
+	[OVL_ADAPTOR_MDP_RDMA0] =	{ OVL_ADAPTOR_TYPE_RDMA, 0 },
+	[OVL_ADAPTOR_MDP_RDMA1] =	{ OVL_ADAPTOR_TYPE_RDMA, 1 },
+	[OVL_ADAPTOR_MDP_RDMA2] =	{ OVL_ADAPTOR_TYPE_RDMA, 2 },
+	[OVL_ADAPTOR_MDP_RDMA3] =	{ OVL_ADAPTOR_TYPE_RDMA, 3 },
+	[OVL_ADAPTOR_MDP_RDMA4] =	{ OVL_ADAPTOR_TYPE_RDMA, 4 },
+	[OVL_ADAPTOR_MDP_RDMA5] =	{ OVL_ADAPTOR_TYPE_RDMA, 5 },
+	[OVL_ADAPTOR_MDP_RDMA6] =	{ OVL_ADAPTOR_TYPE_RDMA, 6 },
+	[OVL_ADAPTOR_MDP_RDMA7] =	{ OVL_ADAPTOR_TYPE_RDMA, 7 },
+	[OVL_ADAPTOR_MERGE0] =	{ OVL_ADAPTOR_TYPE_MERGE, 1 },
+	[OVL_ADAPTOR_MERGE1] =	{ OVL_ADAPTOR_TYPE_MERGE, 2 },
+	[OVL_ADAPTOR_MERGE2] =	{ OVL_ADAPTOR_TYPE_MERGE, 3 },
+	[OVL_ADAPTOR_MERGE3] =	{ OVL_ADAPTOR_TYPE_MERGE, 4 },
+};
+
+static void mtk_ovl_adaptor_merge_config(struct mtk_ovl_adaptor_comp *comp,
+					 struct ovl_adaptor_merge_config *merge_cfg,
+					 struct cmdq_pkt *cmdq_pkt)
+{
+	switch (merge_cfg->merge_mode) {
+	case 6:
+		mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[0]),
+			      &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_0);
+		mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->out_w[0]),
+			      &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_4);
+		mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[0]),
+			      &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_24);
+		mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[0]),
+			      &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_25);
+		break;
+	case 18:
+		mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[0]),
+			      &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_0);
+		mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[1]),
+			      &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_1);
+		mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->out_w[0]),
+			      &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_4);
+		mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[0]),
+			      &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_24);
+		mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[1]),
+			      &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_25);
+		mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[0]),
+			      &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_26);
+		mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cfg->in_w[1]),
+			      &comp->cmdq_base, comp->regs, DISP_MERGE_CFG_27);
+		break;
+	default:
+		break;
+	}
+
+	mtk_ddp_write(cmdq_pkt, merge_cfg->merge_mode, &comp->cmdq_base,
+		      comp->regs, DISP_MERGE_CFG_12);
+	mtk_ddp_write(cmdq_pkt, CFG_10_NO_SWAP, &comp->cmdq_base,
+		      comp->regs, DISP_MERGE_CFG_10);
+	mtk_ddp_write_mask(cmdq_pkt, 1, &comp->cmdq_base, comp->regs,
+			   DISP_MERGE_ENABLE, MERGE_ENABLE);
+}
+
+void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
+				  struct mtk_plane_state *state,
+				  struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+	struct mtk_plane_pending_state *pending = &state->pending;
+	struct ovl_adaptor_merge_config merge_cfg = {0};
+	struct mtk_mdp_rdma_cfg rdma_config = {0};
+	struct mtk_ovl_adaptor_comp *rdma_l;
+	struct mtk_ovl_adaptor_comp *rdma_r;
+	struct mtk_ovl_adaptor_comp *merge;
+	const struct drm_format_info *fmt_info = drm_format_info(pending->format);
+	bool use_dual_pipe = false;
+
+	dev_dbg(dev, "%s+ idx:%d, enable:%d, fmt:0x%x\n", __func__, idx,
+		pending->enable, pending->format);
+	dev_dbg(dev, "addr 0x%lx, fb w:%d, {%d,%d,%d,%d}\n",
+		pending->addr, (pending->pitch / fmt_info->cpp[0]),
+		pending->x, pending->y, pending->width, pending->height);
+
+	rdma_l = &ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 + 2 * idx];
+	rdma_r = &ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 + 2 * idx + 1];
+	merge = &ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MERGE0 + idx];
+
+	if (!pending->enable) {
+		mtk_ddp_write_mask(cmdq_pkt, 0x0, &merge->cmdq_base, merge->regs,
+				   DISP_MERGE_ENABLE, MERGE_ENABLE);
+		mtk_mdp_rdma_stop(rdma_l->regs, cmdq_pkt, &rdma_l->cmdq_base);
+		mtk_mdp_rdma_stop(rdma_r->regs, cmdq_pkt, &rdma_r->cmdq_base);
+		return;
+	}
+
+	if (pending->width > MTK_OVL_ADAPTOR_RDMA_MAX_WIDTH)
+		use_dual_pipe = true;
+
+	merge_cfg.out_w[0] = pending->width;
+	merge_cfg.in_h = pending->height;
+	merge_cfg.fmt = pending->format;
+	if (use_dual_pipe) {
+		merge_cfg.merge_mode = CFG12_11_10_1PI_2PO_MERGE;
+		merge_cfg.in_w[0] = (pending->width / 2) + ((pending->width / 2) % 2);
+		merge_cfg.in_w[1] = (pending->width / 2) - ((pending->width / 2) % 2);
+	} else {
+		merge_cfg.merge_mode = CFG12_10_10_1PI_2PO_BUF_MODE;
+		merge_cfg.in_w[0] = pending->width;
+	}
+	mtk_ovl_adaptor_merge_config(merge, &merge_cfg, cmdq_pkt);
+
+	mtk_mmsys_ddp_config(ovl_adaptor->mmsys_dev, MMSYS_CONFIG_MERGE_ASYNC_WIDTH,
+			     idx, pending->width / 2, cmdq_pkt);
+	mtk_mmsys_ddp_config(ovl_adaptor->mmsys_dev, MMSYS_CONFIG_MERGE_ASYNC_HEIGHT,
+			     idx, pending->height, cmdq_pkt);
+
+	rdma_config.source_width = pending->pitch / fmt_info->cpp[0];
+	rdma_config.csc_enable = fmt_info->is_yuv ? true : false;
+	rdma_config.profile = RDMA_CSC_FULL709_TO_RGB;
+	rdma_config.width = merge_cfg.in_w[0];
+	rdma_config.height = pending->height;
+	rdma_config.addr0 = pending->addr;
+	rdma_config.pitch = pending->pitch;
+	rdma_config.fmt = pending->format;
+	mtk_mdp_rdma_config(rdma_l->regs, &rdma_config, cmdq_pkt, &rdma_l->cmdq_base);
+
+	rdma_config.x_left = merge_cfg.in_w[0];
+	rdma_config.width = merge_cfg.in_w[1];
+	mtk_mdp_rdma_config(rdma_r->regs, &rdma_config, cmdq_pkt, &rdma_r->cmdq_base);
+
+	mtk_ddp_write_mask(cmdq_pkt, 0x1, &merge->cmdq_base, merge->regs,
+			   DISP_MERGE_ENABLE, MERGE_ENABLE);
+	mtk_ddp_write_mask(cmdq_pkt, 0x0, &merge->cmdq_base, merge->regs,
+			   DISP_MERGE_MUTE_0, 0x1);
+
+	mtk_mdp_rdma_start(rdma_l->regs, cmdq_pkt, &rdma_l->cmdq_base);
+	if (use_dual_pipe)
+		mtk_mdp_rdma_start(rdma_r->regs, cmdq_pkt, &rdma_r->cmdq_base);
+	else
+		mtk_mdp_rdma_stop(rdma_r->regs, cmdq_pkt, &rdma_r->cmdq_base);
+}
+
+void mtk_ovl_adaptor_stop(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+	struct mtk_ovl_adaptor_comp *rdma_l;
+	struct mtk_ovl_adaptor_comp *rdma_r;
+	struct mtk_ovl_adaptor_comp *merge;
+	unsigned int reg;
+	u32 i;
+
+	for (i = 0; i < MTK_OVL_ADAPTOR_LAYER_NUM; i++) {
+		rdma_l = &ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 + 2 * i];
+		rdma_r = &ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 + 2 * i + 1];
+		merge = &ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MERGE0 + i];
+
+		mtk_mdp_rdma_stop(rdma_l->regs, NULL, &rdma_l->cmdq_base);
+		mtk_mdp_rdma_stop(rdma_r->regs, NULL, &rdma_r->cmdq_base);
+
+		reg = readl(merge->regs + DISP_MERGE_ENABLE);
+		reg = reg & ~MERGE_ENABLE;
+		writel_relaxed(reg, merge->regs + DISP_MERGE_ENABLE);
+
+		device_reset_optional(merge->dev);
+	}
+}
+
+int mtk_ovl_adaptor_clk_enable(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+	struct mtk_ovl_adaptor_comp *comp;
+	int ret;
+	int i;
+	int j;
+
+	for (i = OVL_ADAPTOR_MDP_RDMA0; i < OVL_ADAPTOR_ID_MAX; i++) {
+		comp = &ovl_adaptor->ovl_adaptor_comp[i];
+		if (!comp->dev)
+			continue;
+
+		/* Need to power on for private rdma devices */
+		if (i < OVL_ADAPTOR_MERGE0) {
+			ret = pm_runtime_get_sync(comp->dev);
+			if (ret < 0)
+				dev_err(dev,
+					"Failed to power on, err %d-%s\n",
+					ret, ovl_adaptor_comp_str[i]);
+		}
+
+		for (j = 0; j < ARRAY_SIZE(comp->clks); j++) {
+			if (IS_ERR(comp->clks[j]))
+				break;
+
+			ret = clk_prepare_enable(comp->clks[j]);
+			if (ret)
+				dev_err(dev,
+					"Failed to enable clock %d, err %d-%s\n",
+					i, ret, ovl_adaptor_comp_str[i]);
+		}
+	}
+
+	return ret;
+}
+
+void mtk_ovl_adaptor_clk_disable(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+	struct mtk_ovl_adaptor_comp *comp;
+	int ret;
+	int i;
+	int j;
+
+	for (i = OVL_ADAPTOR_MDP_RDMA0; i < OVL_ADAPTOR_ID_MAX; i++) {
+		comp = &ovl_adaptor->ovl_adaptor_comp[i];
+		if (!comp->dev)
+			continue;
+
+		for (j = 0; i < ARRAY_SIZE(comp->clks); j++) {
+			if (IS_ERR(comp->clks[j]))
+				break;
+			clk_disable_unprepare(comp->clks[j]);
+		}
+
+		/* Need to power off for private rdma devices */
+		if (i < OVL_ADAPTOR_MERGE0) {
+			ret = pm_runtime_put(comp->dev);
+			if (ret < 0)
+				dev_err(dev,
+					"Failed to power off, err-%s\n",
+					ret, ovl_adaptor_comp_str[i]);
+		}
+	}
+}
+
+static int ovl_adaptor_comp_get_id(struct device *dev, struct device_node *node,
+				   enum mtk_ovl_adaptor_comp_type type)
+{
+	int alias_id = of_alias_get_id(node, private_comp_stem[type]);
+	int ret;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(comp_matches); i++)
+		if (comp_matches[i].type == type &&
+		    comp_matches[i].alias_id == alias_id)
+			return i;
+
+	dev_err(dev, "Failed to get id. type: %d, alias: %d\n", type, alias_id);
+	return -EINVAL;
+}
+
+static int private_comp_init(struct device *dev, struct device_node *node,
+			     struct mtk_ovl_adaptor_comp *comp,
+			     enum mtk_ovl_adaptor_comp_id id)
+{
+	struct platform_device *comp_pdev;
+	int ret;
+	int i;
+
+	if (id < 0 || id >= OVL_ADAPTOR_ID_MAX) {
+		dev_err(dev, "Invalid component id %d\n", id);
+		return -EINVAL;
+	}
+
+	comp_pdev = of_find_device_by_node(node);
+	if (!comp_pdev) {
+		dev_warn(dev, "can't find platform device of node:%s\n",
+			 node->name);
+		return -ENODEV;
+	}
+	comp->dev = &comp_pdev->dev;
+	comp->regs = of_iomap(node, 0);
+
+	for (i = 0; i < ARRAY_SIZE(comp->clks); i++) {
+		comp->clks[i] = of_clk_get(node, i);
+		if (IS_ERR(comp->clks[i]))
+			break;
+	}
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(comp->dev, &comp->cmdq_base, 0);
+	if (ret)
+		dev_info(dev, "get mediatek,gce-client-reg fail!\n");
+#endif
+
+	if (id < OVL_ADAPTOR_MERGE0)
+		pm_runtime_enable(comp->dev);
+
+	dev_info(dev, "[DRM]regs:0x%p, node:%s\n", comp->regs, ovl_adaptor_comp_str[id]);
+
+	return 0;
+}
+
+static int mtk_disp_ovl_adaptor_comp_probe(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static int mtk_disp_ovl_adaptor_comp_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static const struct of_device_id mtk_ovl_adaptor_comp_dt_ids[] = {
+	{
+		.compatible = "mediatek,mt8195-vdo1-rdma",
+		.data = (void *)OVL_ADAPTOR_TYPE_RDMA,
+	}, {
+		.compatible = "mediatek,mt8195-vdo1-merge",
+		.data = (void *)OVL_ADAPTOR_TYPE_MERGE,
+	},
+	{},
+};
+
+static struct platform_driver mtk_disp_ovl_adaptor_comp_driver = {
+	.probe		= mtk_disp_ovl_adaptor_comp_probe,
+	.remove		= mtk_disp_ovl_adaptor_comp_remove,
+	.driver = {
+		.name	= "mediatek-disp-ovl-adaptor-comp",
+		.owner	= THIS_MODULE,
+		.of_match_table = mtk_ovl_adaptor_comp_dt_ids,
+	},
+};
+module_platform_driver(mtk_disp_ovl_adaptor_comp_driver);
+
+static int ovl_adaptor_comp_init(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *priv = dev_get_drvdata(dev);
+	struct device_node *node, *parent;
+	int i, ret;
+
+	parent = dev->parent->of_node->parent;
+
+	for_each_child_of_node(parent, node) {
+		const struct of_device_id *of_id;
+		enum mtk_ovl_adaptor_comp_type type;
+		struct mtk_ovl_adaptor_comp *comp;
+		int id;
+
+		of_id = of_match_node(mtk_ovl_adaptor_comp_dt_ids, node);
+		if (!of_id)
+			continue;
+
+		if (!of_device_is_available(node)) {
+			dev_info(dev, "Skipping disabled component %pOF\n",
+				 node);
+			continue;
+		}
+
+		type = (enum mtk_ovl_adaptor_comp_type)of_id->data;
+		id = ovl_adaptor_comp_get_id(dev, node, type);
+		if (id < 0) {
+			dev_warn(dev, "Skipping unknown component %pOF\n",
+				 node);
+			continue;
+		}
+
+		ret = private_comp_init(dev, node, &priv->ovl_adaptor_comp[id], id);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id ovl_adaptor_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8195-disp-ethdr"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_disp_ovl_adaptor_driver_dt_match);
+
+static int mtk_disp_ovl_adaptor_probe(struct platform_device *pdev)
+{
+	struct mtk_disp_ovl_adaptor *priv;
+	struct device *dev = &pdev->dev;
+	struct device_node *phandle = dev->parent->of_node;
+	const struct of_device_id *of_id;
+	int ret;
+	int i;
+
+	dev_info(dev, "%s+\n", __func__);
+
+	of_id = of_match_node(ovl_adaptor_driver_dt_match, phandle);
+	if (!of_id)
+		return -ENODEV;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->mmsys_dev = pdev->dev.platform_data;
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = ovl_adaptor_comp_init(dev);
+	if (ret) {
+		dev_notice(dev, "ovl_adaptor comp init fail\n");
+		return ret;
+	}
+
+	dev_info(dev, "%s-\n", __func__);
+	return ret;
+}
+
+static int mtk_disp_ovl_adaptor_remove(struct platform_device *pdev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(&pdev->dev);
+	int i;
+
+	for (i = OVL_ADAPTOR_MDP_RDMA0; i < OVL_ADAPTOR_MERGE0; i++)
+		pm_runtime_disable(ovl_adaptor->ovl_adaptor_comp[i].dev);
+
+	return 0;
+}
+
+struct platform_driver mtk_disp_ovl_adaptor_driver = {
+	.probe = mtk_disp_ovl_adaptor_probe,
+	.remove = mtk_disp_ovl_adaptor_remove,
+	.driver = {
+			.name = "mediatek-disp-ovl-adaptor",
+			.owner = THIS_MODULE,
+		},
+};
+module_platform_driver(mtk_disp_ovl_adaptor_driver);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.h b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.h
new file mode 100644
index 000000000000..7d757be1f491
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef __MTK_DISP_OVL_ADAPTOR_H__
+#define __MTK_DISP_OVL_ADAPTOR_H__
+
+#include <drm/mediatek_drm.h>
+
+void mtk_ovl_adaptor_stop(struct device *dev);
+int mtk_ovl_adaptor_clk_enable(struct device *dev);
+void mtk_ovl_adaptor_clk_disable(struct device *dev);
+void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
+				  struct mtk_plane_state *state,
+				  struct cmdq_pkt *cmdq_pkt);
+
+#endif
+
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
