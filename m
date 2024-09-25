Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEA6C369C8
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 10:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDDoq6n155yp2huL1be1iYeaanZR0hGeY9yLalpGtL0=; b=w3H580i5kGMXIUNcbaKR2F76+x
	GcT3X3hY0Edgu//5phlm+2VmZLnKPYaREuaElsfxZwYkSn5bt6eobOPNCGmkayJ0JrWWzsY+jEPCr
	UbL4W6XN+328oy3GnPviRpCWjv0fNZp5LhZuNYk3TPHa5NNMK/hBLfo6PQDZFRZTa9SRRLz6msmG+
	R4zAqQm6VOT4oUpftH6WKMLpWzJtWyXY+aBHsZF+9PfSWNN+ZYLJ5zebqfedxayfywIAGEcE12gDY
	xK2mkqYub59Ef7W9CYvCsRQhEIYyC53xNgb37IVBD1eWZf5NmKTx4tTvRM+ioiadB6hmxKwFXl40k
	BYiC9rJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stP8e-00000004jiB-1VqE;
	Wed, 25 Sep 2024 10:20:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stP7S-00000004jTb-3nqV;
	Wed, 25 Sep 2024 10:19:40 +0000
X-UUID: a79db0127b2711efba0aef63c0775dbf-20240925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IDDoq6n155yp2huL1be1iYeaanZR0hGeY9yLalpGtL0=;
	b=OQtds6+1xZXNo/odhQORZ+4ekf0xe5cCdMKPh4bAbvb+AQf+IxO52LX15qIYxc4Esm1wJ1XQ6mu2TbYxkKnhrSkgHvcHv9h/w6bIPSVV+jfXDj71+L5VnjiCoj79xUMWuILDFVRkvnTF74TBNZotX8nmtpIWpV0Y7ai7vo/EpvU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:dd888460-009e-4adc-acb9-d78c97b8fb87,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:73ff8a9e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a79db0127b2711efba0aef63c0775dbf-20240925
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 910105624; Wed, 25 Sep 2024 03:19:31 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Sep 2024 18:19:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Sep 2024 18:19:28 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Shawn Sung <shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5 1/2] drm/mediatek: ovl: Add fmt_convert function pointer to driver data
Date: Wed, 25 Sep 2024 18:19:26 +0800
Message-ID: <20240925101927.17042-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240925101927.17042-1-jason-jh.lin@mediatek.com>
References: <20240925101927.17042-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_031938_979365_148580A3 
X-CRM114-Status: GOOD (  18.52  )
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

OVL_CON_CLRFMT_MAN is a configuration for extending color format
settings of DISP_REG_OVL_CON(n).
It will change some of the original color format settings.

Take the settings of (3 << 12) for example.
- If OVL_CON_CLRFMT_MAN = 0 means OVL_CON_CLRFMT_RGBA8888.
- If OVL_CON_CLRFMT_MAN = 1 means OVL_CON_CLRFMT_PARGB8888.

Since OVL_CON_CLRFMT_MAN is not supported on previous SoCs,
It breaks the OVL color format setting of MT8173.

Therefore, the fmt_convert function pointer is added to the driver data
and mtk_ovl_fmt_convert_with_blend is implemented for MT8192 and MT8195
that support OVL_CON_CLRFMT_MAN, and mtk_ovl_fmt_convert is implemented
for other SoCs that do not support it to solve the degradation problem.

Fixes: a3f7f7ef4bfe ("drm/mediatek: Support "Pre-multiplied" blending in OVL")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Tested-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 68 ++++++++++++++++++++++---
 1 file changed, 61 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 89b439dcf3a6..8f7b7e07aeb1 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -143,6 +143,7 @@ struct mtk_disp_ovl_data {
 	unsigned int addr;
 	unsigned int gmc_bits;
 	unsigned int layer_nr;
+	unsigned int (*fmt_convert)(struct device *dev, struct mtk_plane_state *state);
 	bool fmt_rgb565_is_0;
 	bool smi_id_en;
 	bool supports_afbc;
@@ -386,13 +387,59 @@ void mtk_ovl_layer_off(struct device *dev, unsigned int idx,
 		      DISP_REG_OVL_RDMA_CTRL(idx));
 }
 
-static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt,
-				    unsigned int blend_mode)
+static unsigned int mtk_ovl_fmt_convert(struct device *dev, struct mtk_plane_state *state)
 {
-	/* The return value in switch "MEM_MODE_INPUT_FORMAT_XXX"
-	 * is defined in mediatek HW data sheet.
-	 * The alphabet order in XXX is no relation to data
-	 * arrangement in memory.
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+	unsigned int fmt = state->pending.format;
+
+	switch (fmt) {
+	default:
+	case DRM_FORMAT_RGB565:
+		return OVL_CON_CLRFMT_RGB565(ovl);
+	case DRM_FORMAT_BGR565:
+		return OVL_CON_CLRFMT_RGB565(ovl) | OVL_CON_BYTE_SWAP;
+	case DRM_FORMAT_RGB888:
+		return OVL_CON_CLRFMT_RGB888(ovl);
+	case DRM_FORMAT_BGR888:
+		return OVL_CON_CLRFMT_RGB888(ovl) | OVL_CON_BYTE_SWAP;
+	case DRM_FORMAT_RGBX8888:
+	case DRM_FORMAT_RGBA8888:
+	case DRM_FORMAT_RGBX1010102:
+	case DRM_FORMAT_RGBA1010102:
+		return OVL_CON_CLRFMT_RGBA8888;
+	case DRM_FORMAT_BGRX8888:
+	case DRM_FORMAT_BGRA8888:
+	case DRM_FORMAT_BGRX1010102:
+	case DRM_FORMAT_BGRA1010102:
+		return OVL_CON_CLRFMT_BGRA8888;
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_XRGB2101010:
+	case DRM_FORMAT_ARGB2101010:
+		return OVL_CON_CLRFMT_ARGB8888;
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+	case DRM_FORMAT_XBGR2101010:
+	case DRM_FORMAT_ABGR2101010:
+		return OVL_CON_CLRFMT_ABGR8888;
+	case DRM_FORMAT_UYVY:
+		return OVL_CON_CLRFMT_UYVY | OVL_CON_MTX_YUV_TO_RGB;
+	case DRM_FORMAT_YUYV:
+		return OVL_CON_CLRFMT_YUYV | OVL_CON_MTX_YUV_TO_RGB;
+	}
+}
+
+static unsigned int mtk_ovl_fmt_convert_with_blend(struct device *dev,
+						   struct mtk_plane_state *state)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+	unsigned int fmt = state->pending.format;
+	unsigned int blend_mode = state->base.pixel_blend_mode;
+
+	/*
+	 * For the platforms where OVL_CON_CLRFMT_MAN is defined in the
+	 * hardware data sheet and supports premultiplied color formats
+	 * such as OVL_CON_CLRFMT_PARGB8888.
 	 */
 	switch (fmt) {
 	default:
@@ -471,7 +518,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 		return;
 	}
 
-	con = ovl_fmt_convert(ovl, fmt, blend_mode);
+	con = ovl->data->fmt_convert(dev, state);
 	if (state->base.fb) {
 		con |= OVL_CON_AEN;
 		con |= state->base.alpha & OVL_CON_ALPHA;
@@ -625,6 +672,7 @@ static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT2701,
 	.gmc_bits = 8,
 	.layer_nr = 4,
+	.fmt_convert = mtk_ovl_fmt_convert,
 	.fmt_rgb565_is_0 = false,
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
@@ -634,6 +682,7 @@ static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT8173,
 	.gmc_bits = 8,
 	.layer_nr = 4,
+	.fmt_convert = mtk_ovl_fmt_convert,
 	.fmt_rgb565_is_0 = true,
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
@@ -643,6 +692,7 @@ static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT8173,
 	.gmc_bits = 10,
 	.layer_nr = 4,
+	.fmt_convert = mtk_ovl_fmt_convert,
 	.fmt_rgb565_is_0 = true,
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
@@ -652,6 +702,7 @@ static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT8173,
 	.gmc_bits = 10,
 	.layer_nr = 2,
+	.fmt_convert = mtk_ovl_fmt_convert,
 	.fmt_rgb565_is_0 = true,
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
@@ -661,6 +712,7 @@ static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT8173,
 	.gmc_bits = 10,
 	.layer_nr = 4,
+	.fmt_convert = mtk_ovl_fmt_convert_with_blend,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
 	.formats = mt8173_formats,
@@ -671,6 +723,7 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT8173,
 	.gmc_bits = 10,
 	.layer_nr = 2,
+	.fmt_convert = mtk_ovl_fmt_convert_with_blend,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
 	.formats = mt8173_formats,
@@ -681,6 +734,7 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT8173,
 	.gmc_bits = 10,
 	.layer_nr = 4,
+	.fmt_convert = mtk_ovl_fmt_convert_with_blend,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
 	.supports_afbc = true,
-- 
2.43.0


