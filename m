Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4FDCDB482
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 06:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyhExmFtiD+nJw4XewMD7zH+Y8AdCMVR4yz0ZmziQH8=; b=w1fzANOzE3ixZIsRb8x2CMfD6P
	1JnDeY2SFPMRsuapCD2OBkwe/kXFwkU40BKwTZ7DTAp1wthlKb9TsFXWqky8qNXnNhl2+n0lQBkLq
	WMBInkinJw2hRd3O0XW1YYgngq4amtLQNnCWiFi/Xm4B5jOvBobGSRCI2f2k5PWn9YlQUvDN1sq6m
	iI6FpO6msoZx56KScagNM8ZT95GYvS170LUAHDVqG4BBQz2WrOh+bUjxIRPw3W9Zf2ijrFQNykNcb
	LJyyrbUt97/RKk+UlK9uXpkXg4mz4X712McgfvdXU+zr6fYc5jWRdsSRquJVE2CzU1Yd2snit1aoG
	8sIH/XsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsdsf-00BTo9-3D;
	Tue, 17 Oct 2023 06:48:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsdsa-00BTjz-0f;
	Tue, 17 Oct 2023 06:48:37 +0000
X-UUID: 2d5c1f826cb911ee9b7791016c24628a-20231016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JyhExmFtiD+nJw4XewMD7zH+Y8AdCMVR4yz0ZmziQH8=;
	b=lXADXIbwV60tG3RwUATM+87iYnxTTMOmuaefGU0Ris0p1Xapvd5jOoYFBidxnfSix3xKYbAwN3IGUfOXbbgotGVepX4X8KtIXRyKweaGf0yc5owsghQ/oUZmKRAYUR4w4izeDTEo6y+v2jaMkGl3r/DsaHtY3darm56Aky6yM2M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:f266d5e7-7f51-4854-a615-d46cb10aac08,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5f78ec9,CLOUDID:79bd05c0-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 2d5c1f826cb911ee9b7791016c24628a-20231016
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 97042190; Mon, 16 Oct 2023 23:48:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 17 Oct 2023 14:47:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 17 Oct 2023 14:47:19 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, "Chen-Yu
 Tsai" <wenst@chromium.org>, Sean Paul <sean@poorly.run>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH v3 11/11] drm/mediatek: Support CRC in VDOSYS1
Date: Tue, 17 Oct 2023 14:47:17 +0800
Message-ID: <20231017064717.21616-12-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231017064717.21616-1-shawn.sung@mediatek.com>
References: <20231017064717.21616-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.538200-8.000000
X-TMASE-MatchedRID: bHUmO6Ydv7rXldNKzKPlvawxbZnudyr73FYvKmZiVnOCsBeCv8CM/a9q
	iUd5V6DYAak79SdgQsDW9RHvDZKnVSUtdpGicV4RA9lly13c/gEraL2mh8ZVK35h6y4KCSJcjse
	1+4fQ7uvLqCJZs0VuwGSLax1QSEcDqH7dGVt6/4kOSj4RiINDEZKLNrbpy/A0DZjzHLL3eRahBi
	oZvW2mjSxzuGmAt8MyuPAycf9X/Euns5Q49D70/XV7tdtvoibaGEfoClqBl86bKItl61J/yZ+in
	TK0bC9eKrauXd3MZDW9BjdpmOpiFz7+kssY6nfZUJ3n0pe5bZvPFRwTtIfGyXlV/+NE19rZ
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.538200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 29FE47CF0718792DAAD5E3A9D4560E4510C43FF83A78B4D750A9BEE7F6544B4A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_234836_254736_C71D0D7E 
X-CRM114-Status: GOOD (  18.69  )
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
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  3 +
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 21 ++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  3 +
 drivers/gpu/drm/mediatek/mtk_ethdr.c          | 73 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_ethdr.h          |  5 ++
 5 files changed, 105 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 08cc2d2fef9f..4d6e8b667bc3 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -133,6 +133,9 @@ unsigned int mtk_ovl_adaptor_layer_nr(struct device *dev);
 struct device *mtk_ovl_adaptor_dma_dev_get(struct device *dev);
 const u32 *mtk_ovl_adaptor_get_formats(struct device *dev);
 size_t mtk_ovl_adaptor_get_num_formats(struct device *dev);
+size_t mtk_ovl_adaptor_crc_cnt(struct device *dev);
+u32 *mtk_ovl_adaptor_crc_entry(struct device *dev);
+void mtk_ovl_adaptor_crc_read(struct device *dev);
 
 void mtk_rdma_bypass_shadow(struct device *dev);
 int mtk_rdma_clk_enable(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index b69ac90b2e65..b4329d23d22d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -205,6 +205,27 @@ void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
 	mtk_ethdr_layer_config(ethdr, idx, state, cmdq_pkt);
 }
 
+size_t mtk_ovl_adaptor_crc_cnt(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	return mtk_ethdr_crc_cnt(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
+}
+
+u32 *mtk_ovl_adaptor_crc_entry(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	return mtk_ethdr_crc_entry(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
+}
+
+void mtk_ovl_adaptor_crc_read(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	mtk_ethdr_crc_read(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
+}
+
 void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
 			    unsigned int h, unsigned int vrefresh,
 			    unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 1118efcde98a..ffa4868b1222 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -404,6 +404,9 @@ static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor = {
 	.clk_enable = mtk_ovl_adaptor_clk_enable,
 	.clk_disable = mtk_ovl_adaptor_clk_disable,
 	.config = mtk_ovl_adaptor_config,
+	.crc_cnt = mtk_ovl_adaptor_crc_cnt,
+	.crc_entry = mtk_ovl_adaptor_crc_entry,
+	.crc_read = mtk_ovl_adaptor_crc_read,
 	.start = mtk_ovl_adaptor_start,
 	.stop = mtk_ovl_adaptor_stop,
 	.layer_nr = mtk_ovl_adaptor_layer_nr,
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 648e14e85bd0..3fec052212ca 100644
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
+#define MIX_CRC_ODD			0x110
+#define MIX_CRC_EVEN			0x114
+
 #define MIX_FUNC_DCM0			0x120
 #define MIX_FUNC_DCM1			0x124
 #define MIX_FUNC_DCM_ENABLE			0xffffffff
@@ -74,6 +82,17 @@ struct mtk_ethdr_comp {
 	struct cmdq_client_reg	cmdq_base;
 };
 
+/**
+ * struct mtk_ethdr - ethdr driver data
+ * @ethdr_comp: components of ethdr(mixer)
+ * @ethdr_clk: clocks of ethdr components
+ * @mmsys_dev: mmsys device that ethdr binds to
+ * @vblank_cb: callback function when vblank irq occurs
+ * @vblank_cb_data: data fo vblank callback
+ * @irq: irq that triggers irq handler
+ * @reset_ctl: reset control of ethdr
+ * @crc: crc information
+ */
 struct mtk_ethdr {
 	struct mtk_ethdr_comp	ethdr_comp[ETHDR_ID_MAX];
 	struct clk_bulk_data	ethdr_clk[ETHDR_CLK_NUM];
@@ -82,6 +101,7 @@ struct mtk_ethdr {
 	void			*vblank_cb_data;
 	int			irq;
 	struct reset_control	*reset_ctl;
+	struct mtk_drm_crc	crc;
 };
 
 static const char * const ethdr_clk_str[] = {
@@ -100,6 +120,32 @@ static const char * const ethdr_clk_str[] = {
 	"vdo_be_async",
 };
 
+static const u32 ethdr_crc_ofs[] = {
+	MIX_CRC_ODD,
+	MIX_CRC_EVEN,
+};
+
+size_t mtk_ethdr_crc_cnt(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+
+	return priv->crc.cnt;
+}
+
+u32 *mtk_ethdr_crc_entry(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+
+	return priv->crc.va;
+}
+
+void mtk_ethdr_crc_read(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+
+	mtk_drm_crc_read(&priv->crc, priv->ethdr_comp[ETHDR_MIXER].regs);
+}
+
 void mtk_ethdr_register_vblank_cb(struct device *dev,
 				  void (*vblank_cb)(void *),
 				  void *vblank_cb_data)
@@ -267,6 +313,13 @@ void mtk_ethdr_start(struct device *dev)
 	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
 
 	writel(1, mixer->regs + MIX_EN);
+
+	if (priv->crc.cnt) {
+		writel(MIX_TRIG_CRC_EN, mixer->regs + MIX_TRIG);
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+		mtk_drm_crc_cmdq_start(&priv->crc);
+#endif
+	}
 }
 
 void mtk_ethdr_stop(struct device *dev)
@@ -274,6 +327,9 @@ void mtk_ethdr_stop(struct device *dev)
 	struct mtk_ethdr *priv = dev_get_drvdata(dev);
 	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
 
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	mtk_drm_crc_cmdq_stop(&priv->crc);
+#endif
 	writel(0, mixer->regs + MIX_EN);
 	writel(1, mixer->regs + MIX_RST);
 	reset_control_reset(priv->reset_ctl);
@@ -328,6 +384,10 @@ static int mtk_ethdr_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	mtk_drm_crc_init(&priv->crc,
+			 ethdr_crc_ofs, ARRAY_SIZE(ethdr_crc_ofs),
+			 MIX_TRIG, MIX_TRIG_CRC_RST);
+
 	for (i = 0; i < ETHDR_ID_MAX; i++) {
 		priv->ethdr_comp[i].dev = dev;
 		priv->ethdr_comp[i].regs = of_iomap(dev->of_node, i);
@@ -336,6 +396,16 @@ static int mtk_ethdr_probe(struct platform_device *pdev)
 					      &priv->ethdr_comp[i].cmdq_base, i);
 		if (ret)
 			dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+
+		if (i == ETHDR_MIXER) {
+			if (of_property_read_u32_index(dev->of_node,
+						       "mediatek,gce-events", i,
+						       &priv->crc.cmdq_event)) {
+				dev_warn(dev, "failed to get gce-events for crc\n");
+			}
+			priv->crc.cmdq_reg = &priv->ethdr_comp[i].cmdq_base;
+			mtk_drm_crc_cmdq_create(dev, &priv->crc);
+		}
 #endif
 		dev_dbg(dev, "[DRM]regs:0x%p, node:%d\n", priv->ethdr_comp[i].regs, i);
 	}
@@ -376,6 +446,9 @@ static int mtk_ethdr_probe(struct platform_device *pdev)
 
 static int mtk_ethdr_remove(struct platform_device *pdev)
 {
+	struct mtk_ethdr *priv = dev_get_drvdata(&pdev->dev);
+
+	mtk_drm_crc_destroy(&priv->crc);
 	component_del(&pdev->dev, &mtk_ethdr_component_ops);
 	return 0;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.h b/drivers/gpu/drm/mediatek/mtk_ethdr.h
index 81af9edea3f7..d17d7256bd12 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.h
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.h
@@ -22,4 +22,9 @@ void mtk_ethdr_register_vblank_cb(struct device *dev,
 void mtk_ethdr_unregister_vblank_cb(struct device *dev);
 void mtk_ethdr_enable_vblank(struct device *dev);
 void mtk_ethdr_disable_vblank(struct device *dev);
+
+size_t mtk_ethdr_crc_cnt(struct device *dev);
+u32 *mtk_ethdr_crc_entry(struct device *dev);
+void mtk_ethdr_crc_read(struct device *dev);
+
 #endif
-- 
2.18.0


