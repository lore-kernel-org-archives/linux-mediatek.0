Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA994CD1288
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 08:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GmGZAW8mpfexN64ehNWIW0/mmu8YZ8RFchKd47zeVTI=; b=RZguvA3QQvmvWuBAmQyTB7Y90B
	v8WLIwRROoYC6LDfbKoU3BzE2r2Qw0TZpxLF4PNWh1hudKxpID9/uelCkqL0z4/W5BW48DUc+A+cL
	bGQqOBoq0oR55l9xiYEaTE28hZkIDrynxehJz8jSXWJ7wrCciwFxIEEwIENKDh2mGMNQym2BdFmez
	r2DmA0yDokJCHPop0lFfkDgRpfi7r+aZzQ8UMEr3MIbiihZQsPm9g8nWDK4+cAt79b0PN/LI6hg5U
	2gSXAxRel6Fzf1G+nKmVPi1gI4vYQXBKL/AAbSLXUmzkG1vM4qbpNmEc4xeyBX/vD5AtB7z99AZSu
	SOXH+sCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvpk-0000000Epny-0fWw;
	Wed, 03 Apr 2024 08:19:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrujP-0000000EOgw-3s4t;
	Wed, 03 Apr 2024 07:08:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GmGZAW8mpfexN64ehNWIW0/mmu8YZ8RFchKd47zeVTI=; b=Umc8HQkNiB/Asy3kPy9rn9wPYj
	Wjyi8zCd/goC/EBKqdQlMeGdFZOwJE6mapbSkFk2FpmXbsH7kWyPPFzNoVZVLos3hCQeWZoMc3UEO
	sV39C1JbC8JGw59Tl3ZVrP50mkrcYzA7w9nwrNNyjQ75eeyN6j5Est4ujAqcmHUoFAippUOGZdods
	NIHyeiVTlQ1nFTmMhBqUSCwjkjQtymNDwreXbgLjhI96mzOrjIv9ywkyeupLhcWooHxBfg3Ubs0Xh
	7L7AX+P/SMTLh+9yqfKssoajMswxjPa+FTPvb2FJeyr3UA6Y2F+0Q3Ku+DXMJKbJ7vWmTwmqvHw0x
	x5VoYv1A==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrujL-000000043YT-2Fy1;
	Wed, 03 Apr 2024 07:08:22 +0000
X-UUID: ef6922d8f18811eeac1957ae9f99f617-20240403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GmGZAW8mpfexN64ehNWIW0/mmu8YZ8RFchKd47zeVTI=;
	b=DyBzs/CNwIR7wGc4HPRrR+2zrVxtRKb36PNpEC/q4EPdJ9oAx5xSGLyC+tBnnDBXJyub1jIalayJoBK83aI0bh45J0Yl4XR5ZrzXrhh3WiFE10PgmoISdPwtE9eZSbhcZmqrW/ZpSVmxYssgHKeZfDG61EddvVmAV8N21ZgsvG0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:014f1008-35ae-4107-af89-da34789713e2,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:1f12a800-c26b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ef6922d8f18811eeac1957ae9f99f617-20240403
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1856443780; Wed, 03 Apr 2024 00:08:12 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Apr 2024 15:07:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Apr 2024 15:07:34 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal
	<sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>, Jason-JH.Lin <jason-jh.lin@mediatek.com>,
	Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH v4 6/9] drm/mediatek: Add secure layer config support for ovl_adaptor
Date: Wed, 3 Apr 2024 15:07:29 +0800
Message-ID: <20240403070732.22085-7-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240403070732.22085-1-shawn.sung@mediatek.com>
References: <20240403070732.22085-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.834500-8.000000
X-TMASE-MatchedRID: DpePiNkRMPoXSulpnju2H23NvezwBrVm3zhylsE9dsyOUV82NDH4AnB4
	4IkzjfYyThbvLLI8RvMG5c7m0h1VRbvaJG+XDhc27spMO3HwKCB51GakW92m5n5h6y4KCSJcuhl
	6WurGX2r9RAbT7UVIFpszRCLl5Qsxi9Om4SO4imSNzYJBKgDdEVg3VqSTJ7So+Cckfm+bb6Dv6l
	FsG12On0EkMRBsoO4JtHv1o/Ln88+BkjWfpo1TNp4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyH4gK
	q42LRYkDs65JOs30n7UOBg1Tk/3dlBCXvoDkHND7p6xRsjIubd+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.834500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B186393543F08BCE398BC1D711E465D599CCD6446D9385CB3EC5DF72F617BDC82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_080820_486268_8A678673 
X-CRM114-Status: GOOD (  15.05  )
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

From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

Add secure layer config support for ovl_adaptor and sub driver mdp_rdma.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c         |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h         |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 15 +++++++++++++++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c         | 11 ++++++++---
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h         |  2 ++
 5 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index 0ee9e42cdf0a0..cda0da4848029 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -439,6 +439,7 @@ static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor = {
 	.get_formats = mtk_ovl_adaptor_get_formats,
 	.get_num_formats = mtk_ovl_adaptor_get_num_formats,
 	.mode_valid = mtk_ovl_adaptor_mode_valid,
+	.get_sec_port = mtk_ovl_adaptor_get_sec_port,
 };
 
 static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 24af08b1c86d6..d2c8fac468798 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -122,6 +122,7 @@ void mtk_ovl_adaptor_clk_disable(struct device *dev);
 void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
 			    unsigned int h, unsigned int vrefresh,
 			    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+u64 mtk_ovl_adaptor_get_sec_port(struct mtk_ddp_comp *comp, unsigned int idx);
 void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
 				  struct mtk_plane_state *state,
 				  struct cmdq_pkt *cmdq_pkt);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index bf6d7429561fe..7b42ea6b8c221 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -130,6 +130,18 @@ static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_MAX] = {
 	[OVL_ADAPTOR_PADDING7] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING7, 7, &padding },
 };
 
+static const u64 ovl_adaptor_sec_port[] = {
+	BIT_ULL(CMDQ_SEC_VDO1_DISP_RDMA_L0),
+	BIT_ULL(CMDQ_SEC_VDO1_DISP_RDMA_L1),
+	BIT_ULL(CMDQ_SEC_VDO1_DISP_RDMA_L2),
+	BIT_ULL(CMDQ_SEC_VDO1_DISP_RDMA_L3),
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
@@ -188,6 +200,9 @@ void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
 	rdma_config.pitch = pending->pitch;
 	rdma_config.fmt = pending->format;
 	rdma_config.color_encoding = pending->color_encoding;
+	rdma_config.source_size = (pending->height - 1) * pending->pitch +
+				  pending->width * fmt_info->cpp[0];
+	rdma_config.is_secure = state->pending.is_secure;
 	mtk_mdp_rdma_config(rdma_l, &rdma_config, cmdq_pkt);
 
 	if (use_dual_pipe) {
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
index ee9ce9b6d0786..1ecbefdd161f9 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -94,6 +94,7 @@ struct mtk_mdp_rdma {
 	void __iomem		*regs;
 	struct clk		*clk;
 	struct cmdq_client_reg	cmdq_reg;
+	resource_size_t		regs_pa;
 };
 
 static unsigned int rdma_fmt_convert(unsigned int fmt)
@@ -198,9 +199,12 @@ void mtk_mdp_rdma_config(struct device *dev, struct mtk_mdp_rdma_cfg *cfg,
 	else
 		mtk_ddp_write_mask(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
 				   MDP_RDMA_SRC_CON, FLD_OUTPUT_ARGB);
-
-	mtk_ddp_write_mask(cmdq_pkt, cfg->addr0, &priv->cmdq_reg, priv->regs,
-			   MDP_RDMA_SRC_BASE_0, FLD_SRC_BASE_0);
+	if (cfg->is_secure)
+		mtk_ddp_sec_write(cmdq_pkt, priv->regs_pa + MDP_RDMA_SRC_BASE_0,
+				  cfg->addr0, CMDQ_IWC_H_2_MVA, 0, cfg->source_size, 0);
+	else
+		mtk_ddp_write_mask(cmdq_pkt, cfg->addr0, &priv->cmdq_reg, priv->regs,
+				   MDP_RDMA_SRC_BASE_0, FLD_SRC_BASE_0);
 
 	mtk_ddp_write_mask(cmdq_pkt, src_pitch_y, &priv->cmdq_reg, priv->regs,
 			   MDP_RDMA_MF_BKGD_SIZE_IN_BYTE, FLD_MF_BKGD_WB);
@@ -300,6 +304,7 @@ static int mtk_mdp_rdma_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs_pa = res->start;
 	priv->regs = devm_ioremap_resource(dev, res);
 	if (IS_ERR(priv->regs)) {
 		dev_err(dev, "failed to ioremap rdma\n");
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
index 9943ee3aac31e..cd48404114111 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
@@ -15,6 +15,8 @@ struct mtk_mdp_rdma_cfg {
 	unsigned int	y_top;
 	int		fmt;
 	int		color_encoding;
+	unsigned int	source_size;
+	unsigned int	is_secure;
 };
 
 #endif // __MTK_MDP_RDMA_H__
-- 
2.18.0


