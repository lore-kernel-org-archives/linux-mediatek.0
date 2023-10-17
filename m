Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F4FCDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 06:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmWMoMNwy1Vj/2pYXEudaUwW19Ln7StYihfj7Lm+CSM=; b=pBLV8WFgxoOVpPXugx4gQ/mfGd
	Ok77xFzlrKeqaU4n+REUtjqYCNMKs1czY2fS65SIk6x0KAiSi/xjDXdjV0PYisJDPRAs2WaxM+KsA
	0vhsOZWtxYva/zNyqCNHypYC0VTgV4n9cO99F2oqz7CWOtfGAqgVegvbWInKog8wYOEIaZ2sIAVJT
	fkpNn1MRdzlI29UXdrn8WzF+c1GyLUWZjOL/d+o7nlLg7a7LF2/1t1B5aNBdmhjUfsxLe4owvqq0H
	zikJfoabmFiYKglZ85zgOfIAZPOyijnY8rA7xfxRQWQF0Ee4hYsgJUyjIc9NA9WdL5Agvb3bIUim1
	0XEiPFjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsdse-00BTn0-1Z;
	Tue, 17 Oct 2023 06:48:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsdsa-00BTjF-0f;
	Tue, 17 Oct 2023 06:48:37 +0000
X-UUID: 2c487ae66cb911ee9b7791016c24628a-20231016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=TmWMoMNwy1Vj/2pYXEudaUwW19Ln7StYihfj7Lm+CSM=;
	b=Au+Xr0ud2xwe02kESKJ9mcrBySYJfNw8qay6N07PyzRtz6kugvMhGsaCbXAVNM38j9CXRtqDrCPe4nXIrdaOiNq8Xq6toXFWewveH0LpXPYtQSWGGR1TyaJS9cVmrWcKMpqbFxH+gPBhCzt3I5/kOgQNG9LS1UAi7M/DTE/IgoU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:01939726-802c-454a-b875-165e33a3fdf5,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5f78ec9,CLOUDID:54bd05c0-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2c487ae66cb911ee9b7791016c24628a-20231016
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 197536649; Mon, 16 Oct 2023 23:48:26 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 17 Oct 2023 14:47:19 +0800
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
Subject: [PATCH v3 06/11] drm/mediatek: Support alpha blending in display driver
Date: Tue, 17 Oct 2023 14:47:12 +0800
Message-ID: <20231017064717.21616-7-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231017064717.21616-1-shawn.sung@mediatek.com>
References: <20231017064717.21616-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--13.241300-8.000000
X-TMASE-MatchedRID: sHBNP13/Fsz2fv0LTPfvM6MVgdN9w+TCG9Itfzsy8/Xvnm3ZesFzgrxX
	z8rVhwNp09NQNrxIpFaXO2uBwefMOJOD/r6k201R4pdq9sdj8LW4vBuE2X0HlfNhzIgXtFJVqcT
	eK67rgVPgN525AmZSDlrpZ2UgV/eS1x+eOID2gFVIOSHptb5tx5qCl1R34jDPtxF8SAx8/RmOx7
	X7h9Du63wAGFxWrqclKSiRRLHTYarlRxm3A2wKuhRFJJyf5BJe3QfwsVk0UbtuRXh7bFKB7j4Mm
	vPrGH5K+6DJezH7jeu8YBKVTOFKeAwhFEZZKPcO66XHIc5w+gc=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.241300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 00459956C72CDF8663DBAED2D777653D33981E0D0B403A95CF843A006A2041D42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_234836_252018_79151E38 
X-CRM114-Status: GOOD (  13.61  )
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

Support alpha blending by adding correct blend mode and
alpha property in plane initialization.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 10 ++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h   |  2 ++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 11 +++++++++++
 3 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a4b740420ebb..0467e80444d3 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -14,6 +14,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_generic.h>
 #include <drm/drm_fourcc.h>
@@ -305,6 +306,9 @@ static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
 	.conn_routes_num = ARRAY_SIZE(mt8188_mtk_ddp_main_routes),
 	.mmsys_dev_num = 2,
 	.max_pitch = GENMASK(15, 0),
+	.blend_mode = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+		      BIT(DRM_MODE_BLEND_PREMULTI)   |
+		      BIT(DRM_MODE_BLEND_COVERAGE),
 };
 
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
@@ -320,6 +324,9 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
 	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
 	.mmsys_dev_num = 2,
 	.max_pitch = GENMASK(15, 0),
+	.blend_mode = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+		      BIT(DRM_MODE_BLEND_PREMULTI)   |
+		      BIT(DRM_MODE_BLEND_COVERAGE),
 };
 
 static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
@@ -328,6 +335,9 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.mmsys_id = 1,
 	.mmsys_dev_num = 2,
 	.max_pitch = GENMASK(15, 0),
+	.blend_mode = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+		      BIT(DRM_MODE_BLEND_PREMULTI)   |
+		      BIT(DRM_MODE_BLEND_COVERAGE),
 };
 
 static const struct of_device_id mtk_drm_of_ids[] = {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 833ecee855bb..27865f8f1160 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -42,6 +42,7 @@ struct mtk_drm_route {
  * @mmsys_id: multi-media system ID
  * @mmsys_dev_num: number of devices for in the mmsys as a whole
  * @max_pitch: maximum pitch in bytes that the mmsys supports
+ * @blend_mode: alpha blend modes that the mmsys supports
  */
 struct mtk_mmsys_driver_data {
 	const unsigned int *main_path;
@@ -58,6 +59,7 @@ struct mtk_mmsys_driver_data {
 	unsigned int mmsys_dev_num;
 
 	u32 max_pitch;
+	u32 blend_mode;
 };
 
 struct mtk_drm_private {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 9208f03b3f8c..a6cf1ab94e42 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -327,6 +327,7 @@ int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		   size_t num_formats)
 {
 	int err;
+	struct mtk_drm_private *priv = dev->dev_private;
 
 	if (!formats || !num_formats) {
 		DRM_ERROR("no formats for plane\n");
@@ -349,6 +350,16 @@ int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 			DRM_INFO("Create rotation property failed\n");
 	}
 
+	err = drm_plane_create_alpha_property(plane);
+	if (err)
+		DRM_ERROR("failed to create property: alpha\n");
+
+	if (priv->data->blend_mode) {
+		err = drm_plane_create_blend_mode_property(plane, priv->data->blend_mode);
+		if (err)
+			DRM_ERROR("failed to create property: blend_mode\n");
+	}
+
 	drm_plane_helper_add(plane, &mtk_plane_helper_funcs);
 
 	return 0;
-- 
2.18.0


