Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6CBC27C4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 02:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V1EauJ6GG10ekiMKBZvKKR3RKcMKjWk5KURXh9N2N+Q=; b=yzG1tRJ4ULPg7Ttk+FIWQdkuK3
	U57amaYaGOBYjM1LyJO59Ez7Bgln7Ut+kQ3sQR2TlsLadUEkRIZZXZ9Vz8hEzaX8YI4YjHzZ5aZul
	OiNlgE6Fhu1IJJ4iJM6EITKaJzsS8sLJIheRmEOlUHD+v2iiuYqcBuQA6gLgPmU9KA5N/Fg6e+bU4
	Gm5Gzgm4Rt7Gv8Ffn+sua+fvosKzI9tsFiiaUP83KK4h7Y1ewntdJ57XTr0JcIEqCqMTivb17GGmf
	yI01r9RgZiTnF7+0VcU9JLtD4LdkX12NZC7YgQKKBmd2HrisMYuJWsR2Osm1u5GVs+9s9ABwgkRQW
	vv42RxhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHwyc-00000001Az9-29JN;
	Fri, 14 Jun 2024 02:47:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHwxW-000000019sk-1mUy;
	Fri, 14 Jun 2024 02:46:38 +0000
X-UUID: 4c1a36c829f811efaf04eb0598667787-20240613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=V1EauJ6GG10ekiMKBZvKKR3RKcMKjWk5KURXh9N2N+Q=;
	b=a88Cw49V/LJ9aCaQy9lkddS7ECpMqBVX/2BxfecV6DbwDaEanF0w1+YN3Xjwg1BtIOdp6DyDDzwZn4t95RLBCS0b70TpYtvzg0v/iN6XRSYMcqr8PYe1BvodWF0O4iS1ryvYlPA8S1uvT0+scpI2HazP6XU4I/Xuige0Fmf27vE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:89cac419-4661-4afc-ad45-8ece7ca6f849,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:d5c6f893-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 4c1a36c829f811efaf04eb0598667787-20240613
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1222225574; Thu, 13 Jun 2024 19:46:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Jun 2024 10:46:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jun 2024 10:46:25 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v9 20/21] drm/mediatek: Support CRC in OVL
Date: Fri, 14 Jun 2024 10:46:19 +0800
Message-ID: <20240614024620.19011-21-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240614024620.19011-1-shawn.sung@mediatek.com>
References: <20240614024620.19011-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--18.755200-8.000000
X-TMASE-MatchedRID: A8b3BrqdBHwl5/wzaArBEKKa0xB73sAA7yWPaQc4INS0rcU5V/oSe4yv
	o/OB/UWI0R+/GIIn918gBcG4U0AQa68O8b+klXu8oMfp2vHck9WRS1J577nsgY8D7T+G1GV/+UG
	EI8sthRoZB0R4cFpbTeKOmN63egZIkKjL2IOi2LCHZXNSWjgdU09nxZsOR/FTnp9KgXcu34zx32
	HnCwVczyACA5ub2VruiIlayt+3hhzD/HB6o7/l2Fz+axQLnAVBMVx/3ZYby79pG3YgOhBCuRsYD
	extMHGuK2J8/Pd5Ox73liFAN6Qn3gW/eUHwJTrId7Dt86/2u/gHsnt0u0M2AEpv30toAMb6OATX
	kqj2pKHlztime3+UZcjVNRvJeEXUNq34+vFNn4UshGpBsK6H7rmnDa2zGPi0RQ0dAChl/lzdhEE
	ZJRcD0S2TF8JaS5nzcBOyDww4NUgfE8yM4pjsDwtuKBGekqUpPjKoPgsq7cA=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--18.755200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 5C887E11E826B64D7F9AAF803D9975B04553B7439DC7F57062EB2A2C81FCC0652000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_194634_782628_37CDC3B8 
X-CRM114-Status: GOOD (  26.89  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Bibby
 Hsieh <bibby.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Hsiao Chien Sung <shawn.sung@mediatek.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

We choose OVL as the CRC generator from other hardware
components that are also capable of calculating CRCs,
since its frame done event triggers vblanks, it can be
used as a signal to know when is safe to retrieve CRC of
the frame.

Please note that position of the hardware component
that is chosen as CRC generator in the display path is
significant. For example, while OVL is the first module
in VDOSYS0, its CRC won't be affected by the modules
after it, which means effects applied by PQ, Gamma,
Dither or any other components after OVL won't be
calculated in CRC generation.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c |   5 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h |   5 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 209 ++++++++++++++++++++++--
 3 files changed, 209 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index dc2b36a8bdd6..c583869b110a 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -365,6 +365,11 @@ static const struct mtk_ddp_comp_funcs ddp_ovl = {
 	.clk_enable = mtk_ovl_clk_enable,
 	.clk_disable = mtk_ovl_clk_disable,
 	.config = mtk_ovl_config,
+	.crc_cnt = mtk_ovl_crc_cnt,
+	.crc_entry = mtk_ovl_crc_entry,
+	.crc_read = mtk_ovl_crc_read,
+	.crc_start = mtk_ovl_crc_start,
+	.crc_stop = mtk_ovl_crc_stop,
 	.start = mtk_ovl_start,
 	.stop = mtk_ovl_stop,
 	.register_vblank_cb = mtk_ovl_register_vblank_cb,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 082ac18fe04a..a03d7a10847a 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -105,6 +105,11 @@ void mtk_ovl_enable_vblank(struct device *dev);
 void mtk_ovl_disable_vblank(struct device *dev);
 const u32 *mtk_ovl_get_formats(struct device *dev);
 size_t mtk_ovl_get_num_formats(struct device *dev);
+size_t mtk_ovl_crc_cnt(struct device *dev);
+u32 *mtk_ovl_crc_entry(struct device *dev);
+void mtk_ovl_crc_read(struct device *dev);
+void mtk_ovl_crc_start(struct device *dev);
+void mtk_ovl_crc_stop(struct device *dev);
 
 void mtk_ovl_adaptor_add_comp(struct device *dev, struct mtk_mutex *mutex);
 void mtk_ovl_adaptor_remove_comp(struct device *dev, struct mtk_mutex *mutex);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 47d0b039a616..f43b31eec8ad 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -24,12 +24,20 @@
 #define OVL_FME_CPL_INT					BIT(1)
 #define DISP_REG_OVL_INTSTA			0x0008
 #define DISP_REG_OVL_EN				0x000c
+#define OVL_EN						BIT(0)
+#define OVL_OP_8BIT_MODE				BIT(4)
+#define OVL_HG_FOVL_CK_ON				BIT(8)
+#define OVL_HF_FOVL_CK_ON				BIT(10)
+#define DISP_REG_OVL_TRIG			0x0010
+#define OVL_CRC_EN					BIT(8)
+#define OVL_CRC_CLR					BIT(9)
 #define DISP_REG_OVL_RST			0x0014
 #define DISP_REG_OVL_ROI_SIZE			0x0020
 #define DISP_REG_OVL_DATAPATH_CON		0x0024
 #define OVL_LAYER_SMI_ID_EN				BIT(0)
 #define OVL_BGCLR_SEL_IN				BIT(2)
 #define OVL_LAYER_AFBC_EN(n)				BIT(4+n)
+#define OVL_OUTPUT_CLAMP				BIT(26)
 #define DISP_REG_OVL_ROI_BGCLR			0x0028
 #define DISP_REG_OVL_SRC_CON			0x002c
 #define DISP_REG_OVL_CON(n)			(0x0030 + 0x20 * (n))
@@ -42,7 +50,26 @@
 #define DISP_REG_OVL_RDMA_CTRL(n)		(0x00c0 + 0x20 * (n))
 #define DISP_REG_OVL_RDMA_GMC(n)		(0x00c8 + 0x20 * (n))
 #define DISP_REG_OVL_ADDR_MT2701		0x0040
+#define DISP_REG_OVL_CRC			0x0270
+#define OVL_CRC_OUT_MASK				GENMASK(30, 0)
 #define DISP_REG_OVL_CLRFMT_EXT			0x02D0
+#define DISP_REG_OVL_CLRFMT_EXT1		0x02D8
+#define OVL_CLRFMT_EXT1_CSC_EN(n)			(1 << (((n) * 4) + 1))
+#define DISP_REG_OVL_Y2R_PARA_R0(n)		(0x0134 + 0x28 * (n))
+#define OVL_Y2R_PARA_C_CF_RMY				(GENMASK(14, 0))
+#define DISP_REG_OVL_Y2R_PARA_G0(n)		(0x013c + 0x28 * (n))
+#define OVL_Y2R_PARA_C_CF_GMU				(GENMASK(30, 16))
+#define DISP_REG_OVL_Y2R_PARA_B1(n)		(0x0148 + 0x28 * (n))
+#define OVL_Y2R_PARA_C_CF_BMV				(GENMASK(14, 0))
+#define DISP_REG_OVL_Y2R_PARA_YUV_A_0(n)	(0x014c + 0x28 * (n))
+#define OVL_Y2R_PARA_C_CF_YA				(GENMASK(10, 0))
+#define OVL_Y2R_PARA_C_CF_UA				(GENMASK(26, 16))
+#define DISP_REG_OVL_Y2R_PARA_YUV_A_1(n)	(0x0150 + 0x28 * (n))
+#define OVL_Y2R_PARA_C_CF_VA				(GENMASK(10, 0))
+#define DISP_REG_OVL_Y2R_PRE_ADD2(n)		(0x0154 + 0x28 * (n))
+#define DISP_REG_OVL_R2R_R0(n)			(0x0500 + 0x40 * (n))
+#define DISP_REG_OVL_R2R_G1(n)			(0x0510 + 0x40 * (n))
+#define DISP_REG_OVL_R2R_B2(n)			(0x0520 + 0x40 * (n))
 #define DISP_REG_OVL_ADDR_MT8173		0x0f40
 #define DISP_REG_OVL_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n))
 #define DISP_REG_OVL_HDR_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n) + 0x04)
@@ -58,6 +85,8 @@
 /* OVL_CON_RGB_SWAP works only if OVL_CON_CLRFMT_MAN is enabled */
 #define OVL_CON_RGB_SWAP	BIT(25)
 
+#define OVL_CON_MTX_AUTO_DIS	BIT(26)
+#define OVL_CON_MTX_EN		BIT(27)
 #define OVL_CON_CLRFMT_RGB	(1 << 12)
 #define OVL_CON_CLRFMT_ARGB8888	(2 << 12)
 #define OVL_CON_CLRFMT_RGBA8888	(3 << 12)
@@ -70,6 +99,7 @@
 #define OVL_CON_CLRFMT_PABGR8888 (OVL_CON_CLRFMT_PARGB8888 | OVL_CON_RGB_SWAP)
 #define OVL_CON_CLRFMT_PBGRA8888 (OVL_CON_CLRFMT_PARGB8888 | OVL_CON_BYTE_SWAP)
 #define OVL_CON_CLRFMT_PRGBA8888 (OVL_CON_CLRFMT_PABGR8888 | OVL_CON_BYTE_SWAP)
+#define OVL_CON_MTX_PROGRAMMABLE	(8 << 16)
 #define OVL_CON_CLRFMT_RGB565(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
 					0 : OVL_CON_CLRFMT_RGB)
 #define OVL_CON_CLRFMT_RGB888(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
@@ -139,6 +169,10 @@ static const u32 mt8195_formats[] = {
 	DRM_FORMAT_YUYV,
 };
 
+static const u32 mt8195_ovl_crc_ofs[] = {
+	DISP_REG_OVL_CRC,
+};
+
 struct mtk_disp_ovl_data {
 	unsigned int addr;
 	unsigned int gmc_bits;
@@ -149,12 +183,15 @@ struct mtk_disp_ovl_data {
 	const u32 *formats;
 	size_t num_formats;
 	bool supports_clrfmt_ext;
+	const u32 *crc_ofs;
+	size_t crc_cnt;
 };
 
 /*
  * struct mtk_disp_ovl - DISP_OVL driver structure
  * @crtc: associated crtc to report vblank events to
  * @data: platform data
+ * @crc: crc related information
  */
 struct mtk_disp_ovl {
 	struct drm_crtc			*crtc;
@@ -164,8 +201,49 @@ struct mtk_disp_ovl {
 	const struct mtk_disp_ovl_data	*data;
 	void				(*vblank_cb)(void *data);
 	void				*vblank_cb_data;
+	resource_size_t			regs_pa;
+	struct mtk_crtc_crc		crc;
 };
 
+size_t mtk_ovl_crc_cnt(struct device *dev)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+	return ovl->crc.cnt;
+}
+
+u32 *mtk_ovl_crc_entry(struct device *dev)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+	return ovl->crc.va;
+}
+
+void mtk_ovl_crc_read(struct device *dev)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+	mtk_crtc_read_crc(&ovl->crc, ovl->regs);
+}
+
+void mtk_ovl_crc_start(struct device *dev)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	mtk_crtc_start_crc_cmdq(&ovl->crc);
+#endif
+}
+
+void mtk_ovl_crc_stop(struct device *dev)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	mtk_crtc_stop_crc_cmdq(&ovl->crc);
+#endif
+}
+
 static irqreturn_t mtk_disp_ovl_irq_handler(int irq, void *dev_id)
 {
 	struct mtk_disp_ovl *priv = dev_id;
@@ -245,15 +323,27 @@ void mtk_ovl_clk_disable(struct device *dev)
 void mtk_ovl_start(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+	unsigned int reg = readl(ovl->regs + DISP_REG_OVL_DATAPATH_CON);
 
-	if (ovl->data->smi_id_en) {
-		unsigned int reg;
+	if (ovl->data->smi_id_en)
+		reg |= OVL_LAYER_SMI_ID_EN;
 
-		reg = readl(ovl->regs + DISP_REG_OVL_DATAPATH_CON);
-		reg = reg | OVL_LAYER_SMI_ID_EN;
-		writel_relaxed(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
+	/*
+	 * When doing Y2R conversion, it's common to get an output
+	 * that is larger than 10 bits (negative numbers).
+	 * Enable this bit to clamp the output to 10 bits per channel
+	 * (should always be enabled)
+	 */
+	reg |= OVL_OUTPUT_CLAMP;
+	writel_relaxed(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
+
+	reg = OVL_EN;
+	if (ovl->data->crc_cnt) {
+		/* enable crc  and its related clocks */
+		writel_relaxed(OVL_CRC_EN, ovl->regs + DISP_REG_OVL_TRIG);
+		reg |= OVL_OP_8BIT_MODE | OVL_HG_FOVL_CK_ON | OVL_HF_FOVL_CK_ON;
 	}
-	writel_relaxed(0x1, ovl->regs + DISP_REG_OVL_EN);
+	writel_relaxed(reg, ovl->regs + DISP_REG_OVL_EN);
 }
 
 void mtk_ovl_stop(struct device *dev)
@@ -491,6 +581,83 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 	    blend_mode == DRM_MODE_BLEND_PIXEL_NONE)
 		ignore_pixel_alpha = OVL_CONST_BLEND;
 
+	/*
+	 * OVL only supports 8 bits data in CRC calculation, transform 10-bit
+	 * RGB to 8-bit RGB by leveraging the ability of the Y2R (YUV-to-RGB)
+	 * hardware to multiply coefficients, although there is nothing to do
+	 * with the YUV format.
+	 */
+	if (ovl->data->supports_clrfmt_ext) {
+		u32 y2r_coef = 0, y2r_offset = 0, r2r_coef = 0, csc_en = 0;
+
+		if (is_10bit_rgb(fmt)) {
+			con |= OVL_CON_MTX_AUTO_DIS | OVL_CON_MTX_EN | OVL_CON_MTX_PROGRAMMABLE;
+
+			/*
+			 * Y2R coefficient setting
+			 * bit 13 is 2^1, bit 12 is 2^0, bit 11 is 2^-1,
+			 * bit 10 is 2^-2 = 0.25
+			 */
+			y2r_coef = BIT(10);
+
+			/* -1 in 10bit */
+			y2r_offset = GENMASK(10, 0) - 1;
+
+			/*
+			 * R2R coefficient setting
+			 * bit 19 is 2^1, bit 18 is 2^0, bit 17 is 2^-1,
+			 * bit 20 is 2^2 = 4
+			 */
+			r2r_coef = BIT(20);
+
+			/* CSC_EN is for R2R */
+			csc_en = OVL_CLRFMT_EXT1_CSC_EN(idx);
+
+			/*
+			 * 1. YUV input data - 1 and shift right for 2 bits to remove it
+			 * [R']   [0.25    0    0]   [Y in - 1]
+			 * [G'] = [   0 0.25    0] * [U in - 1]
+			 * [B']   [   0    0 0.25]   [V in - 1]
+			 *
+			 * 2. shift left for 2 bit letting the last 2 bits become 0
+			 * [R out]   [ 4  0  0]   [R']
+			 * [G out] = [ 0  4  0] * [G']
+			 * [B out]   [ 0  0  4]   [B']
+			 */
+		}
+
+		mtk_ddp_write_mask(cmdq_pkt, y2r_coef,
+				   &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_Y2R_PARA_R0(idx),
+				   OVL_Y2R_PARA_C_CF_RMY);
+		mtk_ddp_write_mask(cmdq_pkt, (y2r_coef << 16),
+				   &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_Y2R_PARA_G0(idx),
+				   OVL_Y2R_PARA_C_CF_GMU);
+		mtk_ddp_write_mask(cmdq_pkt, y2r_coef,
+				   &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_Y2R_PARA_B1(idx),
+				   OVL_Y2R_PARA_C_CF_BMV);
+
+		mtk_ddp_write_mask(cmdq_pkt, y2r_offset,
+				   &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_Y2R_PARA_YUV_A_0(idx),
+				   OVL_Y2R_PARA_C_CF_YA);
+		mtk_ddp_write_mask(cmdq_pkt, (y2r_offset << 16),
+				   &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_Y2R_PARA_YUV_A_0(idx),
+				   OVL_Y2R_PARA_C_CF_UA);
+		mtk_ddp_write_mask(cmdq_pkt, y2r_offset,
+				   &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_Y2R_PARA_YUV_A_1(idx),
+				   OVL_Y2R_PARA_C_CF_VA);
+
+		mtk_ddp_write_relaxed(cmdq_pkt, r2r_coef,
+				      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_R2R_R0(idx));
+		mtk_ddp_write_relaxed(cmdq_pkt, r2r_coef,
+				      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_R2R_G1(idx));
+		mtk_ddp_write_relaxed(cmdq_pkt, r2r_coef,
+				      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_R2R_B2(idx));
+
+		mtk_ddp_write_mask(cmdq_pkt, csc_en,
+				   &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_CLRFMT_EXT1,
+				   OVL_CLRFMT_EXT1_CSC_EN(idx));
+	}
+
 	if (pending->rotation & DRM_MODE_REFLECT_Y) {
 		con |= OVL_CON_VIRT_FLIP;
 		addr += (pending->height - 1) * pending->pitch;
@@ -602,15 +769,31 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 		dev_err(dev, "failed to ioremap ovl\n");
 		return PTR_ERR(priv->regs);
 	}
+
+	priv->data = of_device_get_match_data(dev);
+	platform_set_drvdata(pdev, priv);
+
+	if (priv->data->crc_cnt) {
+		mtk_crtc_init_crc(&priv->crc,
+				  priv->data->crc_ofs, priv->data->crc_cnt,
+				  DISP_REG_OVL_TRIG, OVL_CRC_CLR);
+	}
+
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
 	if (ret)
 		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
-#endif
-
-	priv->data = of_device_get_match_data(dev);
-	platform_set_drvdata(pdev, priv);
 
+	if (priv->data->crc_cnt) {
+		if (of_property_read_u32_index(dev->of_node,
+					       "mediatek,gce-events", 0,
+					       &priv->crc.cmdq_event)) {
+			dev_warn(dev, "failed to get gce-events for crc\n");
+		}
+		priv->crc.cmdq_reg = &priv->cmdq_reg;
+		mtk_crtc_create_crc_cmdq(dev, &priv->crc);
+	}
+#endif
 	ret = devm_request_irq(dev, irq, mtk_disp_ovl_irq_handler,
 			       IRQF_TRIGGER_NONE, dev_name(dev), priv);
 	if (ret < 0) {
@@ -631,6 +814,10 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 
 static void mtk_disp_ovl_remove(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+	mtk_crtc_destroy_crc(&ovl->crc);
 	component_del(&pdev->dev, &mtk_disp_ovl_component_ops);
 	pm_runtime_disable(&pdev->dev);
 }
@@ -701,6 +888,8 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.formats = mt8195_formats,
 	.num_formats = ARRAY_SIZE(mt8195_formats),
 	.supports_clrfmt_ext = true,
+	.crc_ofs = mt8195_ovl_crc_ofs,
+	.crc_cnt = ARRAY_SIZE(mt8195_ovl_crc_ofs),
 };
 
 static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
-- 
2.18.0


