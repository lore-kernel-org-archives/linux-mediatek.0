Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A736CDB474
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 04:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ldvco4cD1N2iRkeWeHPyDxnixRPCq726JfOrr8fwYQ=; b=GTCjUwuHcbDyZZ1IPNg7O2wQ8b
	ksLolQdnV2PsLVOs2i/W3rM1J1qyBJfS4enXm+awFHML+xctu/7TT0L93SZhVL6cKFT13IUaqljOp
	9xBZdrZKpfLN5XSiP+IvK8sPD915c5bk4c6bW7IXzbVW1HKEHDeKRPXoSzQ1xyyWh5GjoaEdQjjQo
	eSSMJMGwhloFFKZdxUrAH1zriZRD7qzwx/duUQNW9417+Y64Ez7CqyGDvh6hDfpW5kluYrZtksdzM
	hV3+HqgyKxnqVMj5APtpXUd5FCxev2EYUW0KUvIrQ2KNez0Lc0d2gUvbEDrMWuUbb/+moINRwo0cT
	MyCfATDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qumpn-006PyH-2d;
	Mon, 23 Oct 2023 04:46:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qumpk-006PuR-0L;
	Mon, 23 Oct 2023 04:46:33 +0000
X-UUID: 1e789d88715f11ee9b7791016c24628a-20231022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3ldvco4cD1N2iRkeWeHPyDxnixRPCq726JfOrr8fwYQ=;
	b=pRgCl49vCeDiB7xH6ufoWyPxV18SrPlVltA+k4NnN8YhqHKKyKAKEU/l3GaAYiWo4OPdDRFMLuYtnXFqX2jMKjmtiZ3DyZk6jBtXPqqDjSV/m9M27hIqaIYEqodekAt8wmhpFa83ceDVp/y6+eyQGkujTcCdr6EX5OSfuq9hGjg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:a58de3dc-46c0-4c70-971e-9e9ee321dab7,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5f78ec9,CLOUDID:320f8294-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1e789d88715f11ee9b7791016c24628a-20231022
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1390431494; Sun, 22 Oct 2023 21:46:24 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 12:45:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 12:45:51 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>, Jason-ch
 Chen <jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jeffrey Kardatzke
	<jkardatzke@google.com>
Subject: [PATCH v2 07/11] drm/mediatek: Add secure layer config support for ovl
Date: Mon, 23 Oct 2023 12:45:44 +0800
Message-ID: <20231023044549.21412-8-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231023044549.21412-1-jason-jh.lin@mediatek.com>
References: <20231023044549.21412-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_214632_157059_AE0F43A1 
X-CRM114-Status: GOOD (  18.60  )
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

Add secure layer config support for ovl.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  3 ++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 31 +++++++++++++++++--
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 12 +++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  2 ++
 4 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 2254038519e1..dec937b183a8 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -9,6 +9,7 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
 #include <linux/soc/mediatek/mtk-mutex.h>
+#include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_plane.h"
 #include "mtk_mdp_rdma.h"
 
@@ -79,6 +80,7 @@ void mtk_ovl_clk_disable(struct device *dev);
 void mtk_ovl_config(struct device *dev, unsigned int w,
 		    unsigned int h, unsigned int vrefresh,
 		    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+u64 mtk_ovl_get_sec_port(struct mtk_ddp_comp *comp, unsigned int idx);
 int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
 			struct mtk_plane_state *mtk_state);
 void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
@@ -112,6 +114,7 @@ void mtk_ovl_adaptor_clk_disable(struct device *dev);
 void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
 			    unsigned int h, unsigned int vrefresh,
 			    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+u64 mtk_ovl_adaptor_get_sec_port(struct mtk_ddp_comp *comp, unsigned int idx);
 void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
 				  struct mtk_plane_state *state,
 				  struct cmdq_pkt *cmdq_pkt);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 2bffe4245466..76e832e4875a 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -46,6 +46,7 @@
 #define DISP_REG_OVL_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n))
 #define DISP_REG_OVL_HDR_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n) + 0x04)
 #define DISP_REG_OVL_HDR_PITCH(ovl, n)		((ovl)->data->addr + 0x20 * (n) + 0x08)
+#define DISP_REG_OVL_SECURE			0x0fc0
 
 #define GMC_THRESHOLD_BITS	16
 #define GMC_THRESHOLD_HIGH	((1 << GMC_THRESHOLD_BITS) / 4)
@@ -126,8 +127,19 @@ struct mtk_disp_ovl {
 	const struct mtk_disp_ovl_data	*data;
 	void				(*vblank_cb)(void *data);
 	void				*vblank_cb_data;
+	resource_size_t			regs_pa;
 };
 
+u64 mtk_ovl_get_sec_port(struct mtk_ddp_comp *comp, unsigned int idx)
+{
+	if (comp->id == DDP_COMPONENT_OVL0)
+		return 1ULL << CMDQ_SEC_DISP_OVL0;
+	else if (comp->id == DDP_COMPONENT_OVL1)
+		return 1ULL << CMDQ_SEC_DISP_OVL1;
+
+	return 0;
+}
+
 static irqreturn_t mtk_disp_ovl_irq_handler(int irq, void *dev_id)
 {
 	struct mtk_disp_ovl *priv = dev_id;
@@ -449,8 +461,22 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 			      DISP_REG_OVL_SRC_SIZE(idx));
 	mtk_ddp_write_relaxed(cmdq_pkt, offset, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_OFFSET(idx));
-	mtk_ddp_write_relaxed(cmdq_pkt, addr, &ovl->cmdq_reg, ovl->regs,
-			      DISP_REG_OVL_ADDR(ovl, idx));
+
+	if (state->pending.is_sec) {
+		const struct drm_format_info *fmt_info = drm_format_info(fmt);
+		unsigned int buf_size = (pending->height - 1) * pending->pitch +
+					pending->width * fmt_info->cpp[0];
+
+		mtk_ddp_write_mask(cmdq_pkt, BIT(idx), &ovl->cmdq_reg, ovl->regs,
+				   DISP_REG_OVL_SECURE, BIT(idx));
+		mtk_ddp_sec_write(cmdq_pkt, ovl->regs_pa + DISP_REG_OVL_ADDR(ovl, idx),
+				  pending->addr, CMDQ_IWC_H_2_MVA, 0, buf_size, 0);
+	} else {
+		mtk_ddp_write_mask(cmdq_pkt, 0, &ovl->cmdq_reg, ovl->regs,
+				   DISP_REG_OVL_SECURE, BIT(idx));
+		mtk_ddp_write_relaxed(cmdq_pkt, addr, &ovl->cmdq_reg, ovl->regs,
+				      DISP_REG_OVL_ADDR(ovl, idx));
+	}
 
 	if (is_afbc) {
 		mtk_ddp_write_relaxed(cmdq_pkt, hdr_addr, &ovl->cmdq_reg, ovl->regs,
@@ -529,6 +555,7 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs_pa = res->start;
 	priv->regs = devm_ioremap_resource(dev, res);
 	if (IS_ERR(priv->regs)) {
 		dev_err(dev, "failed to ioremap ovl\n");
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 6bf6367853fb..28a0bccfb0b9 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -83,6 +83,18 @@ static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_MAX] = {
 	[OVL_ADAPTOR_ETHDR0]	= { OVL_ADAPTOR_TYPE_ETHDR, 0 },
 };
 
+static const u64 ovl_adaptor_sec_port[] = {
+	1ULL << CMDQ_SEC_VDO1_DISP_RDMA_L0,
+	1ULL << CMDQ_SEC_VDO1_DISP_RDMA_L1,
+	1ULL << CMDQ_SEC_VDO1_DISP_RDMA_L2,
+	1ULL << CMDQ_SEC_VDO1_DISP_RDMA_L3,
+};
+
+u64 mtk_ovl_adaptor_get_sec_port(struct mtk_ddp_comp *comp, unsigned int idx)
+{
+	return ovl_adaptor_sec_port[idx];
+}
+
 void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
 				  struct mtk_plane_state *state,
 				  struct cmdq_pkt *cmdq_pkt)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 3dca936b9143..eec3a1cc2ed4 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -373,6 +373,7 @@ static const struct mtk_ddp_comp_funcs ddp_ovl = {
 	.bgclr_in_off = mtk_ovl_bgclr_in_off,
 	.get_formats = mtk_ovl_get_formats,
 	.get_num_formats = mtk_ovl_get_num_formats,
+	.get_sec_port = mtk_ovl_get_sec_port,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_postmask = {
@@ -424,6 +425,7 @@ static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor = {
 	.remove = mtk_ovl_adaptor_remove_comp,
 	.get_formats = mtk_ovl_adaptor_get_formats,
 	.get_num_formats = mtk_ovl_adaptor_get_num_formats,
+	.get_sec_port = mtk_ovl_adaptor_get_sec_port,
 };
 
 static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
-- 
2.18.0


