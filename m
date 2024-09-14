Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E4FC021B1
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Sep 2024 20:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KzEvm60ursdehxva7VL1w/guECU2w+ClPXr73nuhGlM=; b=TV3LSJGC8Q8pQGaD8qkUJnTpT6
	KjZuvRiaE6JXxWhEdLsdQsHFZ+eUJojljto6IzPvXNHFBso0aKsGcaPhjSNA98tT5B992RciTeEfq
	kIyJ+sj5sDK3tuUGS5VymjGuFG070g6X52OvnPa6nXEJjMR0wdYy6x76O/xuVFMLP0RyWnjXPvf1W
	gfT5leqomoo+wxI9SWX25O6BQTDYvi78iX69tn9AbzIPZKjggf+oBotXMnpwijx4cGI8yKBZMHJBk
	S4DkE3++7VN35sCjBLOIkNxa2vLvLAkimsyyb1tSC6puK/9lNW/bNUj2QXmVANjhsKNex8OmfJ1/B
	5XPD/GvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spZF3-00000001Cm6-4BRo;
	Sat, 14 Sep 2024 20:19:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spZDy-00000001Ch1-3eSI;
	Sat, 14 Sep 2024 20:18:32 +0000
X-UUID: 7da93de872d611efba0aef63c0775dbf-20240914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=KzEvm60ursdehxva7VL1w/guECU2w+ClPXr73nuhGlM=;
	b=oXj/Rwd4KrxNPAFdYgOhJTPGOy+yk0VmHdzQq+YpapcFLqdlqwOzVnx/cm/lobD6ZFSIFWzNxc+fuzyfew7lpwWj9941BpAayorsYgGHC3gOuupmFNXDzhCI6V5J+8tkA1NuVyLcVTv20aTFBOSpLgFJ77zwUTCLzmNAkI4EdWg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:959b9f82-242d-461a-bfb6-02eb7400bbb9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:500706b7-8c4d-4743-b649-83c6f3b849d4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7da93de872d611efba0aef63c0775dbf-20240914
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1150224985; Sat, 14 Sep 2024 13:18:22 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 15 Sep 2024 04:18:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 15 Sep 2024 04:18:20 +0800
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
Subject: [PATCH] drm/mediatek: ovl: Add fmt_support_man for MT8192 and MT8195
Date: Sun, 15 Sep 2024 04:18:19 +0800
Message-ID: <20240914201819.3357-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240914_131830_942330_651B68B3 
X-CRM114-Status: GOOD (  12.80  )
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

OVL_CON_CLRFMT_MAN is an configuration for extending color format
settings of DISP_REG_OVL_CON(n).
It will change some of the original color format settings.

Take the settings of (3 << 12) for example.
- If OVL_CON_CLRFMT_MAN = 0 means OVL_CON_CLRFMT_RGBA8888.
- If OVL_CON_CLRFMT_MAN = 1 means OVL_CON_CLRFMT_PARGB8888.

Since OVL_CON_CLRFMT_MAN is not supported on previous SoCs,
It breaks the OVL color format setting of MT8173.
So add fmt_support_man to the driver data of MT8192 and MT8195
to solve the downgrade problem.

Fixes: a3f7f7ef4bfe ("drm/mediatek: Support "Pre-multiplied" blending in OVL")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 28 ++++++++++++++++++-------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 89b439dcf3a6..aa575569f996 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -70,10 +70,18 @@
 #define OVL_CON_CLRFMT_UYVY	(4 << 12)
 #define OVL_CON_CLRFMT_YUYV	(5 << 12)
 #define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
-#define OVL_CON_CLRFMT_PARGB8888 ((3 << 12) | OVL_CON_CLRFMT_MAN)
-#define OVL_CON_CLRFMT_PABGR8888 (OVL_CON_CLRFMT_PARGB8888 | OVL_CON_RGB_SWAP)
-#define OVL_CON_CLRFMT_PBGRA8888 (OVL_CON_CLRFMT_PARGB8888 | OVL_CON_BYTE_SWAP)
-#define OVL_CON_CLRFMT_PRGBA8888 (OVL_CON_CLRFMT_PABGR8888 | OVL_CON_BYTE_SWAP)
+#define OVL_CON_CLRFMT_PARGB8888(ovl)	((ovl)->data->fmt_support_man ? \
+					((3 << 12) | OVL_CON_CLRFMT_MAN) : \
+					OVL_CON_CLRFMT_ABGR8888)
+#define OVL_CON_CLRFMT_PABGR8888(ovl)	((ovl)->data->fmt_support_man ? \
+					(OVL_CON_CLRFMT_PARGB8888 | OVL_CON_RGB_SWAP) : \
+					OVL_CON_CLRFMT_ABGR8888)
+#define OVL_CON_CLRFMT_PBGRA8888(ovl)	((ovl)->data->fmt_support_man ? \
+					(OVL_CON_CLRFMT_PARGB8888 | OVL_CON_BYTE_SWAP) : \
+					OVL_CON_CLRFMT_BGRA8888)
+#define OVL_CON_CLRFMT_PRGBA8888(ovl)	((ovl)->data->fmt_support_man ? \
+					(OVL_CON_CLRFMT_PABGR8888 | OVL_CON_BYTE_SWAP) : \
+					OVL_CON_CLRFMT_RGBA8888)
 #define OVL_CON_CLRFMT_RGB565(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
 					0 : OVL_CON_CLRFMT_RGB)
 #define OVL_CON_CLRFMT_RGB888(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
@@ -144,6 +152,7 @@ struct mtk_disp_ovl_data {
 	unsigned int gmc_bits;
 	unsigned int layer_nr;
 	bool fmt_rgb565_is_0;
+	bool fmt_support_man;
 	bool smi_id_en;
 	bool supports_afbc;
 	const u32 *formats;
@@ -410,28 +419,28 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt,
 	case DRM_FORMAT_RGBA1010102:
 		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
 		       OVL_CON_CLRFMT_RGBA8888 :
-		       OVL_CON_CLRFMT_PRGBA8888;
+		       OVL_CON_CLRFMT_PRGBA8888(ovl);
 	case DRM_FORMAT_BGRX8888:
 	case DRM_FORMAT_BGRA8888:
 	case DRM_FORMAT_BGRX1010102:
 	case DRM_FORMAT_BGRA1010102:
 		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
 		       OVL_CON_CLRFMT_BGRA8888 :
-		       OVL_CON_CLRFMT_PBGRA8888;
+		       OVL_CON_CLRFMT_PBGRA8888(ovl);
 	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_ARGB8888:
 	case DRM_FORMAT_XRGB2101010:
 	case DRM_FORMAT_ARGB2101010:
 		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
 		       OVL_CON_CLRFMT_ARGB8888 :
-		       OVL_CON_CLRFMT_PARGB8888;
+		       OVL_CON_CLRFMT_PARGB8888(ovl);
 	case DRM_FORMAT_XBGR8888:
 	case DRM_FORMAT_ABGR8888:
 	case DRM_FORMAT_XBGR2101010:
 	case DRM_FORMAT_ABGR2101010:
 		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
 		       OVL_CON_CLRFMT_ABGR8888 :
-		       OVL_CON_CLRFMT_PABGR8888;
+		       OVL_CON_CLRFMT_PABGR8888(ovl);
 	case DRM_FORMAT_UYVY:
 		return OVL_CON_CLRFMT_UYVY | OVL_CON_MTX_YUV_TO_RGB;
 	case DRM_FORMAT_YUYV:
@@ -662,6 +671,7 @@ static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
+	.fmt_support_man = true,
 	.smi_id_en = true,
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
@@ -672,6 +682,7 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 2,
 	.fmt_rgb565_is_0 = true,
+	.fmt_support_man = true,
 	.smi_id_en = true,
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
@@ -682,6 +693,7 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
+	.fmt_support_man = true,
 	.smi_id_en = true,
 	.supports_afbc = true,
 	.formats = mt8195_formats,
-- 
2.43.0


