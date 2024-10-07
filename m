Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AC1CFB440
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 07:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqUh6reBenVOo2PK0q3FWwTZxg0Z7SkzFkPrsnQOk9Q=; b=a61MglepRg75p/9FA1bihYAv5/
	QjJX/tQxjAgiffXMsWPbX1S6wv63Iec11HAkP8X3A8RvgyAfbyGCXBFbvjoGpODB1baj0y1C+GXly
	vYL/VLNSVMgFtCrFG+R4cdtqf9uTh8AOtFGlaE2kbmnldqijuxuoAN1xW6HpCr4MpVj7AX7H24MuJ
	crB8mqkM6SsfjMTOcJhwm9An5dQd99cNNpH4gnrcyuTa21w3PBXKd1EG9xnsK4/9F2B9ePzBsiKpd
	oYUxlrMqUe7+Ah6JsBY5/M+mmDA6kVe7KIK5/zGQ1CJwYQfvOg5I1WtEAl8QgV8q0WspbkanZQe4h
	J4XCfzVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxhrc-00000001XKZ-24z6;
	Mon, 07 Oct 2024 07:09:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxhk1-00000001VtI-09wm;
	Mon, 07 Oct 2024 07:01:15 +0000
X-UUID: ecb61b02847911efba0aef63c0775dbf-20241007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lqUh6reBenVOo2PK0q3FWwTZxg0Z7SkzFkPrsnQOk9Q=;
	b=JNUcQqyGoiwHp8DP3peDT0wQmJ4N4CPVHW5GrnKmz/AS2UImKsUM3MYUw/2hDL8aGXaU5tm/AuVDCJDU/fOJqO8GH3eJSDButxz/f0ITN3/kVxtxmHdeNJEDb2xSPpLiRE54w77gcLHcvuRGd9KTb6AgcCXSfK3sQtX5m6y//Hw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:cf180fbe-bdc5-44fd-8224-f1b80a45d583,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:e95adc40-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ecb61b02847911efba0aef63c0775dbf-20241007
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 878830127; Mon, 07 Oct 2024 00:01:06 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 7 Oct 2024 15:01:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 7 Oct 2024 15:01:03 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Adam Thiede <me@adamthiede.com>, Yassine Oudjana
	<yassine.oudjana@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Shawn Sung <shawn.sung@mediatek.com>, Alper Nebi Yasak
	<alpernebiyasak@gmail.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v9 4/5] drm/mediatek: ovl: Add blend_modes to driver data
Date: Mon, 7 Oct 2024 15:01:00 +0800
Message-ID: <20241007070101.23263-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241007070101.23263-1-jason-jh.lin@mediatek.com>
References: <20241007070101.23263-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.742200-8.000000
X-TMASE-MatchedRID: PIIqySEg3TIzP1+hKLmUcMu00lnG8+PWIaLR+2xKRDLb6Y+fnTZULz94
	HX24gqtC170RpEE9+Ch41slfouzT+EIjaJSsaV6q9Jn/ZrGuc8HSL+EVfOJR07FRmrhHzmfvR+m
	RDHa7QqxsMMavja2AExKqjdlR+seHLVayL7k7olyQOktEo73GFArefVId6fzVCqIJhrrDy28j7P
	LDbldk2nqqxcrRKidevws8hDIFFaPGWQHDiYaPQNF8NCC76P7lS8T7akvAZuebKItl61J/yZ+in
	TK0bC9eKrauXd3MZDVrKcxhGNhTPi2fcpKjyjtXPRyw9iLsE0+tmysOooI43i70ukIx9ljm
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.742200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 099BE6B5E68196C26FAC094FDF435403E79DD7BE1F77CD0C0344D5621E5954722000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_000113_177668_273FB13A 
X-CRM114-Status: GOOD (  19.62  )
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

Since previous SoCs did not support OVL_CON_CLRFMT_MAN, this means
that the SoC does not support the premultiplied color format.
It will break the original color format setting of MT8173.

Therefore, the blend_modes is added to the driver data and then
mtk_ovl_fmt_convert() will check the blend_modes to see if
premultiplied supported in current platform.
If it is not supported, use coverage mode to set it to the supported
color formats to solve the degradation problem.

Fixes: a3f7f7ef4bfe ("drm/mediatek: Support "Pre-multiplied" blending in OVL")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 34 ++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 22f17ebfd8b3..41874dc9d933 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -146,6 +146,7 @@ struct mtk_disp_ovl_data {
 	bool fmt_rgb565_is_0;
 	bool smi_id_en;
 	bool supports_afbc;
+	const u32 blend_modes;
 	const u32 *formats;
 	size_t num_formats;
 	bool supports_clrfmt_ext;
@@ -386,9 +387,27 @@ void mtk_ovl_layer_off(struct device *dev, unsigned int idx,
 		      DISP_REG_OVL_RDMA_CTRL(idx));
 }
 
-static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt,
-				    unsigned int blend_mode)
+static unsigned int mtk_ovl_fmt_convert(struct mtk_disp_ovl *ovl,
+					struct mtk_plane_state *state)
 {
+	unsigned int fmt = state->pending.format;
+	unsigned int blend_mode = DRM_MODE_BLEND_COVERAGE;
+
+	/*
+	 * For the platforms where OVL_CON_CLRFMT_MAN is defined in the hardware data sheet
+	 * and supports premultiplied color formats, such as OVL_CON_CLRFMT_PARGB8888.
+	 *
+	 * Check blend_modes in the driver data to see if premultiplied mode is supported.
+	 * If not, use coverage mode instead to set it to the supported color formats.
+	 *
+	 * Current DRM assumption is that alpha is default premultiplied, so the bitmask of
+	 * blend_modes must include BIT(DRM_MODE_BLEND_PREMULTI). Otherwise, mtk_plane_init()
+	 * will get an error return from drm_plane_create_blend_mode_property() and
+	 * state->base.pixel_blend_mode should not be used.
+	 */
+	if (ovl->data->blend_modes & BIT(DRM_MODE_BLEND_PREMULTI))
+		blend_mode = state->base.pixel_blend_mode;
+
 	switch (fmt) {
 	default:
 	case DRM_FORMAT_RGB565:
@@ -466,7 +485,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 		return;
 	}
 
-	con = ovl_fmt_convert(ovl, fmt, blend_mode);
+	con = mtk_ovl_fmt_convert(ovl, state);
 	if (state->base.fb) {
 		con |= state->base.alpha & OVL_CON_ALPHA;
 
@@ -664,6 +683,9 @@ static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
+		       BIT(DRM_MODE_BLEND_COVERAGE) |
+		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -674,6 +696,9 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
 	.layer_nr = 2,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
+		       BIT(DRM_MODE_BLEND_COVERAGE) |
+		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -685,6 +710,9 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
 	.supports_afbc = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
+		       BIT(DRM_MODE_BLEND_COVERAGE) |
+		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
 	.formats = mt8195_formats,
 	.num_formats = ARRAY_SIZE(mt8195_formats),
 	.supports_clrfmt_ext = true,
-- 
2.43.0


