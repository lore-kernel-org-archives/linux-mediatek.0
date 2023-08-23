Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA77EE49A3
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 15:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0Qaq7yEE+PbElr21sGIYRtTD79cquPoMKOdqIW5Iv4=; b=rn/PdpfJAWnQECdAzMXz7k6bVn
	rGPAc+Y984iBtOiy1d3djV3KdmDeA7WrZoPA45j5BYk320zSRxhqwLDLAKJyRQ6WqY4A7U1/18lZH
	GVBa9xvxl/XHKsmNJo/RGh1NngqVIMbnUFNVP1m4gp1Awk371tNl2cx2Ze3lDcyUJ7L+ZVOqoaWHw
	D0nXajWdwtfb2FnZI3eT1Ma4pyobtgYz4Tp7BN60nJ3ezNCfEG9C1fKbpmlizjoZAN8Qiey8rXtUQ
	nkDyj3ehmMzjfbeefm3jIP1xDxS/ezn3eb7LD/dF/DjZMORvjGYqtyJpom/3tFyR8/EV5igyGpXuI
	92TwexqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYpZ8-000wJL-0o;
	Wed, 23 Aug 2023 15:14:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYpYc-000vz4-23;
	Wed, 23 Aug 2023 15:14:10 +0000
X-UUID: ae59db6441c711ee83ed1395ce914268-20230823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=e0Qaq7yEE+PbElr21sGIYRtTD79cquPoMKOdqIW5Iv4=;
	b=upi+v6NMJKfTtcgV+rWW2kANO5mtqpgZSqqv1OskYSfeXzc9Bf+UB43DYO8edawfVoGBSk2BIwAeMMxfqwxVTtOdFXhwM/HMuh1RTm4tZ6vo0SZt/60rZmgAv9bgJmd+wVeNM3Ju6+xHJJUmN36bEABtnapNvWHytLE/GhX0GDI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:44312d58-d2ef-43fb-9ed2-4d3a6240a829,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:0ad78a4,CLOUDID:8d271b13-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ae59db6441c711ee83ed1395ce914268-20230823
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 295957974; Wed, 23 Aug 2023 08:13:57 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Aug 2023 23:13:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 23 Aug 2023 23:13:54 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Jassi
 Brar" <jassisinghbrar@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH 12/15] drm/mediatek: Support CRC in VDOSYS1
Date: Wed, 23 Aug 2023 23:13:29 +0800
Message-ID: <20230823151332.28811-13-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230823151332.28811-1-shawn.sung@mediatek.com>
References: <20230823151332.28811-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_081406_684982_2B895191 
X-CRM114-Status: GOOD (  22.07  )
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

We choose Mixer as CRC generator in VDOSYS1 since
its frame done event will trigger vblanks, we can know
when is safe to retrieve CRC of the frame.

In VDOSYS1, there's no image procession after Mixer,
unlike OVL in VDOSYS0, Mixer's CRC will include all the
effects that are applied to the frame.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   1 +
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  10 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |   1 +
 drivers/gpu/drm/mediatek/mtk_ethdr.c          | 120 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_ethdr.h          |   4 +
 5 files changed, 136 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index d2753360ae1e..014086d4d7ca 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -127,6 +127,7 @@ unsigned int mtk_ovl_adaptor_layer_nr(struct device *dev);
 struct device *mtk_ovl_adaptor_dma_dev_get(struct device *dev);
 const u32 *mtk_ovl_adaptor_get_formats(struct device *dev);
 size_t mtk_ovl_adaptor_get_num_formats(struct device *dev);
+u32 mtk_ovl_adaptor_crc_cnt(struct device *dev);
 
 void mtk_rdma_bypass_shadow(struct device *dev);
 int mtk_rdma_clk_enable(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index c0a38f5217ee..64f98b26f4ce 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -159,6 +159,13 @@ void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
 	mtk_ethdr_layer_config(ethdr, idx, state, cmdq_pkt);
 }
 
+u32 mtk_ovl_adaptor_crc_cnt(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	return mtk_ethdr_crc_cnt(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
+}
+
 void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
 			    unsigned int h, unsigned int vrefresh,
 			    unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -274,6 +281,9 @@ void mtk_ovl_adaptor_register_vblank_cb(struct device *dev, void (*vblank_cb)(vo
 
 	mtk_ethdr_register_vblank_cb(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0],
 				     vblank_cb, vblank_cb_data);
+
+	mtk_ethdr_register_crtc(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0],
+				(struct drm_crtc *)vblank_cb_data);
 }
 
 void mtk_ovl_adaptor_unregister_vblank_cb(struct device *dev)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 1b747a34a06b..143136491607 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -398,6 +398,7 @@ static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor = {
 	.clk_enable = mtk_ovl_adaptor_clk_enable,
 	.clk_disable = mtk_ovl_adaptor_clk_disable,
 	.config = mtk_ovl_adaptor_config,
+	.crc_cnt = mtk_ovl_adaptor_crc_cnt,
 	.start = mtk_ovl_adaptor_start,
 	.stop = mtk_ovl_adaptor_stop,
 	.layer_nr = mtk_ovl_adaptor_layer_nr,
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 3058c122a4c3..9e341d86d9f9 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -24,6 +24,9 @@
 #define MIX_FME_CPL_INTEN			BIT(1)
 #define MIX_INTSTA			0x8
 #define MIX_EN				0xc
+#define MIX_TRIG			0x10
+#define MIX_TRIG_CRC_EN				BIT(8)
+#define MIX_TRIG_CRC_RST			BIT(9)
 #define MIX_RST				0x14
 #define MIX_ROI_SIZE			0x18
 #define MIX_DATAPATH_CON		0x1c
@@ -39,6 +42,11 @@
 #define PREMULTI_SOURCE				(3 << 12)
 #define MIX_L_SRC_SIZE(n)		(0x30 + 0x18 * (n))
 #define MIX_L_SRC_OFFSET(n)		(0x34 + 0x18 * (n))
+
+/* CRC register offsets for odd and even lines */
+#define MIX_CRC_O			0x110
+#define MIX_CRC_E			0x114
+
 #define MIX_FUNC_DCM0			0x120
 #define MIX_FUNC_DCM1			0x124
 #define MIX_FUNC_DCM_ENABLE			0xffffffff
@@ -70,6 +78,9 @@ struct mtk_ethdr_comp {
 	struct device		*dev;
 	void __iomem		*regs;
 	struct cmdq_client_reg	cmdq_base;
+	struct cmdq_client *cmdq_client;
+	struct cmdq_pkt *cmdq_pkt;
+	u32 cmdq_event;
 };
 
 struct mtk_ethdr {
@@ -80,6 +91,9 @@ struct mtk_ethdr {
 	void			*vblank_cb_data;
 	int			irq;
 	struct reset_control	*reset_ctl;
+	struct drm_crtc		*crtc;
+	const u32		*crcs;
+	size_t			crc_cnt;
 };
 
 static const char * const ethdr_clk_str[] = {
@@ -98,6 +112,95 @@ static const char * const ethdr_clk_str[] = {
 	"vdo_be_async",
 };
 
+static const u32 ethdr_crcs[] = {
+	MIX_CRC_O,
+	MIX_CRC_E,
+};
+
+u32 mtk_ethdr_crc_cnt(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+
+	return (u32)priv->crc_cnt;
+}
+
+void mtk_ethdr_register_crtc(struct device *dev, struct drm_crtc *crtc)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+
+	priv->crtc = crtc;
+}
+
+static void mtk_ethdr_crc_loop_start(struct device *dev)
+{
+	int i;
+	struct mtk_ethdr *priv;
+	struct mtk_ethdr_comp *mixer;
+	struct mtk_drm_crtc *mtk_crtc;
+
+	priv = dev_get_drvdata(dev);
+	mixer = &priv->ethdr_comp[ETHDR_MIXER];
+	mtk_crtc = container_of(priv->crtc, struct mtk_drm_crtc, base);
+
+	if (!mixer->cmdq_event || mixer->cmdq_client)
+		return;
+
+	mixer->cmdq_client = cmdq_mbox_create(dev, 0);
+	if (IS_ERR(mixer->cmdq_client)) {
+		pr_err("failed to create mailbox client\n");
+		return;
+	}
+	mixer->cmdq_pkt = cmdq_pkt_create(mixer->cmdq_client, PAGE_SIZE);
+	if (!mixer->cmdq_pkt) {
+		pr_err("failed to create cmdq packet\n");
+		return;
+	}
+
+	cmdq_pkt_wfe(mixer->cmdq_pkt, mixer->cmdq_event, true);
+
+	for (i = 0; i < priv->crc_cnt; i++) {
+		/* put crc to spr1 register */
+		cmdq_pkt_read_s(mixer->cmdq_pkt, mixer->cmdq_base.subsys,
+				mixer->cmdq_base.offset + priv->crcs[i],
+				CMDQ_THR_SPR_IDX1);
+		cmdq_pkt_assign(mixer->cmdq_pkt, CMDQ_THR_SPR_IDX0,
+				CMDQ_ADDR_HIGH(mtk_crtc->crc.pa + i * sizeof(u32)));
+
+		/* copy spr1 register to crc.pa */
+		cmdq_pkt_write_s(mixer->cmdq_pkt, CMDQ_THR_SPR_IDX0,
+				 CMDQ_ADDR_LOW(mtk_crtc->crc.pa + i * sizeof(u32)),
+				 CMDQ_THR_SPR_IDX1);
+	}
+
+	/* reset crc */
+	mtk_ddp_write_mask(mixer->cmdq_pkt, ~0, &mixer->cmdq_base,
+			   mixer->regs, MIX_TRIG, MIX_TRIG_CRC_RST);
+
+	/* clear reset bit */
+	mtk_ddp_write_mask(mixer->cmdq_pkt, 0, &mixer->cmdq_base,
+			   mixer->regs, MIX_TRIG, MIX_TRIG_CRC_RST);
+
+	cmdq_pkt_finalize_loop(mixer->cmdq_pkt);
+	cmdq_pkt_flush_async(mixer->cmdq_pkt);
+}
+
+static void mtk_ethdr_crc_loop_stop(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
+
+	if (mixer->cmdq_pkt) {
+		cmdq_pkt_destroy(mixer->cmdq_pkt);
+		mixer->cmdq_pkt = NULL;
+	}
+
+	if (mixer->cmdq_client) {
+		mbox_flush(mixer->cmdq_client->chan, 2000);
+		cmdq_mbox_destroy(mixer->cmdq_client);
+		mixer->cmdq_client = NULL;
+	}
+}
+
 void mtk_ethdr_register_vblank_cb(struct device *dev,
 				  void (*vblank_cb)(void *),
 				  void *vblank_cb_data)
@@ -265,6 +368,9 @@ void mtk_ethdr_start(struct device *dev)
 	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
 
 	writel(1, mixer->regs + MIX_EN);
+	writel(MIX_TRIG_CRC_EN | MIX_TRIG_CRC_RST, mixer->regs + MIX_TRIG);
+
+	mtk_ethdr_crc_loop_start(dev);
 }
 
 void mtk_ethdr_stop(struct device *dev)
@@ -272,6 +378,8 @@ void mtk_ethdr_stop(struct device *dev)
 	struct mtk_ethdr *priv = dev_get_drvdata(dev);
 	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
 
+	mtk_ethdr_crc_loop_stop(dev);
+
 	writel(0, mixer->regs + MIX_EN);
 	writel(1, mixer->regs + MIX_RST);
 	reset_control_reset(priv->reset_ctl);
@@ -334,6 +442,15 @@ static int mtk_ethdr_probe(struct platform_device *pdev)
 					      &priv->ethdr_comp[i].cmdq_base, i);
 		if (ret)
 			dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+
+		if (i == ETHDR_MIXER) {
+			if (of_property_read_u32_index(dev->of_node,
+						       "mediatek,gce-events", 0,
+						       &priv->ethdr_comp[i].cmdq_event)) {
+				dev_err(dev, "gce-events not defined\n");
+				return -ENOPARAM;
+			}
+		}
 #endif
 		dev_dbg(dev, "[DRM]regs:0x%p, node:%d\n", priv->ethdr_comp[i].regs, i);
 	}
@@ -363,6 +480,9 @@ static int mtk_ethdr_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->reset_ctl);
 	}
 
+	priv->crcs = ethdr_crcs;
+	priv->crc_cnt = ARRAY_SIZE(ethdr_crcs);
+
 	platform_set_drvdata(pdev, priv);
 
 	ret = component_add(dev, &mtk_ethdr_component_ops);
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.h b/drivers/gpu/drm/mediatek/mtk_ethdr.h
index 81af9edea3f7..86d3fa4cf917 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.h
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.h
@@ -22,4 +22,8 @@ void mtk_ethdr_register_vblank_cb(struct device *dev,
 void mtk_ethdr_unregister_vblank_cb(struct device *dev);
 void mtk_ethdr_enable_vblank(struct device *dev);
 void mtk_ethdr_disable_vblank(struct device *dev);
+
+u32 mtk_ethdr_crc_cnt(struct device *dev);
+void mtk_ethdr_register_crtc(struct device *dev, struct drm_crtc *crtc);
+
 #endif
-- 
2.18.0


