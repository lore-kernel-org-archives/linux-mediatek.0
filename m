Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0607C2BC81
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 16:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=swngFnG4YnTt27YPM6Mw6xXcg6EN4vXWT+VleOEX4dE=; b=e20pIAD5ztNZF3UCAhKsN6930C
	PkCt2LqeTusSs6jKGMIqZLMGa+odZaxR2oO5bQ4ceO7dJ2UbMwBgozK8xJPJhMwnn81JZ4DppAOjj
	5br6YiNcvL44B24tAjoXzj2VaU4cyVv+ojl8j+lmCAICncqxq7v3Wp71i869+jobchybWz2eiMsLm
	9cfvw1N2jd6z0KQlOF3OumqyMzMHP7WSHNyzF5Fz4EVGhxV/ai+Gn0wsKNAIW/yapKA3EGEw3V9dx
	4PyDSP05nHfaCHQsJCRnoBzY/KrgQuzY7bc7EkUj/MIqMm/VIsUZ4WrmKff7rJIzwBDrLps7OZAVT
	C7GcRSxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJyMG-000000025HC-0mi9;
	Wed, 19 Jun 2024 16:40:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJyKk-0000000243J-3ueS;
	Wed, 19 Jun 2024 16:38:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C0984CE207A;
	Wed, 19 Jun 2024 16:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61A93C4AF17;
	Wed, 19 Jun 2024 16:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718815125;
	bh=3aUYguHtRDqCw/S5lSWIEdbAfyJRnGHQWsvSPUjXElg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KtWlVfXCYHz1/wK1L4vQ9Gach+JA74htLFzZgTRMnixUxct+rh5TCp2Kxap1lVG4c
	 16+yHjqIiYnCvlsDioZ0kKC51X8OAezo7g3cYKpt2+bBEhiQJEhy2aJF234wemdGxX
	 IblpCbU/a3h+/tdHGnEs/Jx8XRwMeXF9RiPU7+WqOJYmL/DAptWquMRN+2EWiIQ1KE
	 wKIHrw6U054HZkOZgwJTW7UV4LIaXJicx96suiJfg6QVYV17ITtLOPgQBNIol3R76h
	 o7YWN78XEHqroW+ojxMFwnGsFvzPmSc9aNf0BvnRDCK5ib7GA9HGynQ3X6zpDrZeQb
	 4hDAz85wK8j3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B404C27C53;
	Wed, 19 Jun 2024 16:38:45 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Thu, 20 Jun 2024 00:38:51 +0800
Subject: [PATCH v3 11/14] drm/mediatek: Support more 10bit formats in OVL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-igt-v3-11-a9d62d2e2c7e@mediatek.com>
References: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
In-Reply-To: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, 
 Daniel Kurtz <djkurtz@chromium.org>, Mao Huang <littlecvr@chromium.org>, 
 "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: YT Shen <yt.shen@mediatek.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718815123; l=2982;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=VYe2wP07/kjaGGRWdu9nnYY2/AwgAqg6ZWQZL457sn0=;
 b=1J86WIQwN6L5+6SMHDONDSilK4wTfVrjkyNvS+OEgzz5NIkEE0ck/BvrVC++ue3ZHdMkRzh7+
 Yp5UQrTfIObBCQY3x4KLY2supMPkkWH3ZGOCQqfF31I8igibu4l9aWY
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_093855_849651_AFA4A7B6 
X-CRM114-Status: GOOD (  10.20  )
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
Reply-To: shawn.sung@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

Support more 10bit formats in OVL.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 33c332b29381..767338206780 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -76,6 +76,22 @@
 
 #define OVL_COLOR_ALPHA		GENMASK(31, 24)
 
+static inline bool is_10bit_rgb(u32 fmt)
+{
+	switch (fmt) {
+	case DRM_FORMAT_XRGB2101010:
+	case DRM_FORMAT_ARGB2101010:
+	case DRM_FORMAT_RGBX1010102:
+	case DRM_FORMAT_RGBA1010102:
+	case DRM_FORMAT_XBGR2101010:
+	case DRM_FORMAT_ABGR2101010:
+	case DRM_FORMAT_BGRX1010102:
+	case DRM_FORMAT_BGRA1010102:
+		return true;
+	}
+	return false;
+}
+
 static const u32 mt8173_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
@@ -93,12 +109,18 @@ static const u32 mt8173_formats[] = {
 static const u32 mt8195_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_XRGB2101010,
 	DRM_FORMAT_ARGB2101010,
 	DRM_FORMAT_BGRX8888,
 	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRX1010102,
 	DRM_FORMAT_BGRA1010102,
 	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_XBGR2101010,
+	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_RGBX1010102,
+	DRM_FORMAT_RGBA1010102,
 	DRM_FORMAT_RGB888,
 	DRM_FORMAT_BGR888,
 	DRM_FORMAT_RGB565,
@@ -258,9 +280,7 @@ static void mtk_ovl_set_bit_depth(struct device *dev, int idx, u32 format,
 	reg = readl(ovl->regs + DISP_REG_OVL_CLRFMT_EXT);
 	reg &= ~OVL_CON_CLRFMT_BIT_DEPTH_MASK(idx);
 
-	if (format == DRM_FORMAT_RGBA1010102 ||
-	    format == DRM_FORMAT_BGRA1010102 ||
-	    format == DRM_FORMAT_ARGB2101010)
+	if (is_10bit_rgb(format))
 		bit_depth = OVL_CON_CLRFMT_10_BIT;
 
 	reg |= OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, idx);
@@ -379,17 +399,23 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt)
 		return OVL_CON_CLRFMT_RGB888(ovl) | OVL_CON_BYTE_SWAP;
 	case DRM_FORMAT_RGBX8888:
 	case DRM_FORMAT_RGBA8888:
+	case DRM_FORMAT_RGBX1010102:
+	case DRM_FORMAT_RGBA1010102:
 		return OVL_CON_CLRFMT_RGBA8888;
 	case DRM_FORMAT_BGRX8888:
 	case DRM_FORMAT_BGRA8888:
+	case DRM_FORMAT_BGRX1010102:
 	case DRM_FORMAT_BGRA1010102:
 		return OVL_CON_CLRFMT_BGRA8888;
 	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_XRGB2101010:
 	case DRM_FORMAT_ARGB2101010:
 		return OVL_CON_CLRFMT_ARGB8888;
 	case DRM_FORMAT_XBGR8888:
 	case DRM_FORMAT_ABGR8888:
+	case DRM_FORMAT_XBGR2101010:
+	case DRM_FORMAT_ABGR2101010:
 		return OVL_CON_CLRFMT_ABGR8888;
 	case DRM_FORMAT_UYVY:
 		return OVL_CON_CLRFMT_UYVY | OVL_CON_MTX_YUV_TO_RGB;

-- 
Git-146)



