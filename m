Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814CAC04FFE
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 May 2024 10:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISiu5oCrTHSMBWOGo4l0BGgl5eIo2Dd/Biyc/Dg5eSY=; b=pBCAHxC2Z5gy1l8AzmV/HZC3lI
	3VEIKshcU59KXJYK5dBjaALhvAghvouOqGNZREBnM8FILeNVCZmmDgge/n9yH5lhCqpo/y3zlvgZn
	9qcWHzicwNHdt7QL6Q6aAPhJ6tL4WjTNsPGImMFQ52V1/GA/CpidU97t4ZxD1o4KYXrLTYmrSzBJX
	werUop/uIdYYs3dfFMiJW+lEgq9pXFD5tA7MZ927Gyxb9kBGVyEFvYNDoO5vvKNqkWWdncvmQQlLJ
	2UQtZb0M6D9H/aIhxqvM0hsUhwJRvVWNjYyZ2ieR1WTscPFRCfurVDPugODeqRH9BxuUiYku0edqY
	VNU9cvYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2U9a-0000000CQpD-0KtW;
	Thu, 02 May 2024 10:59:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2U9W-0000000CQnv-0ud0;
	Thu, 02 May 2024 10:59:03 +0000
X-UUID: fac8a710087211ef9a78ddf43a9225dc-20240502
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ISiu5oCrTHSMBWOGo4l0BGgl5eIo2Dd/Biyc/Dg5eSY=;
	b=fXymFVKvEJ+iXLHwO/Tqne+QD8xLtChrUc6F/s7IKHQqkCHcx2tS7HXGS9o6LLuJTKRn2P9s1apfJaRUh6Ef7+IWXKy0y2ow/i1UuKCt1RuAZqZrVSdk2+ZnI43UbXq2ZPwf2YgrbeeHR99CDitUc5Z3rYueOctDpGUuFHHEypk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:d3284e36-b534-46b9-9efc-fd8ecba81624,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:bb149bfb-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: fac8a710087211ef9a78ddf43a9225dc-20240502
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 577374669; Thu, 02 May 2024 03:58:59 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 2 May 2024 18:38:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 2 May 2024 18:38:56 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: [PATCH v7 04/18] drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property
Date: Thu, 2 May 2024 18:38:34 +0800
Message-ID: <20240502103848.5845-5-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240502103848.5845-1-shawn.sung@mediatek.com>
References: <20240502103848.5845-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.554900-8.000000
X-TMASE-MatchedRID: tzdmYTDShTlYXTxImR5ZvO7KTDtx8Cgg71JtSKHw1r+OUV82NDH4Akfp
	kQx2u0KsA8+wLcXiwMrijpjet3oGSEbHh97RjZjI6/xAZojbl7crHkgIan9a0dM2my+Pv+HLK33
	GICKuN/+mPSxSNVOyW1EnfB+90ISXB85Y5vI5GEWeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8geb2
	CAVWgJwO/o3b7wwpl/Fee9v418yf4MMtkcfge+lO/zYOg+8kcVHNEiOlfoDuV+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.554900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C7466655D8AC9960445E68106F3A417EDF7C911E5D92E9153A1224245383398B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_035902_265431_2340A4CD 
X-CRM114-Status: GOOD (  15.37  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, "Nancy .
 Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Hsiao Chien Sung <shawn.sung@mediatek.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

Always add DRM_MODE_ROTATE_0 to rotation property to meet
IGT's (Intel GPU Tools) requirement.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  6 +++++-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 17 +++++------------
 drivers/gpu/drm/mediatek/mtk_plane.c    |  2 +-
 3 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index 26236691ce4c2..f7fe2e08dc8e2 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -192,7 +192,11 @@ unsigned int mtk_ddp_comp_supported_rotations(struct mtk_ddp_comp *comp)
 	if (comp->funcs && comp->funcs->supported_rotations)
 		return comp->funcs->supported_rotations(comp->dev);
 
-	return 0;
+	/*
+	 * In order to pass IGT tests, DRM_MODE_ROTATE_0 is required when
+	 * rotation is not supported.
+	 */
+	return DRM_MODE_ROTATE_0;
 }
 
 static inline unsigned int mtk_ddp_comp_layer_nr(struct mtk_ddp_comp *comp)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index b552a02d7eae7..862ab683ed1b4 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -296,27 +296,20 @@ int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
 			struct mtk_plane_state *mtk_state)
 {
 	struct drm_plane_state *state = &mtk_state->base;
-	unsigned int rotation = 0;
 
-	rotation = drm_rotation_simplify(state->rotation,
-					 DRM_MODE_ROTATE_0 |
-					 DRM_MODE_REFLECT_X |
-					 DRM_MODE_REFLECT_Y);
-	rotation &= ~DRM_MODE_ROTATE_0;
-
-	/* We can only do reflection, not rotation */
-	if ((rotation & DRM_MODE_ROTATE_MASK) != 0)
+	/* check if any unsupported rotation is set */
+	if (state->rotation & ~mtk_ovl_supported_rotations(dev))
 		return -EINVAL;
 
 	/*
 	 * TODO: Rotating/reflecting YUV buffers is not supported at this time.
 	 *	 Only RGB[AX] variants are supported.
+	 *	 Since DRM_MODE_ROTATE_0 means "no rotation", we should not
+	 *	 reject layers with this property.
 	 */
-	if (state->fb->format->is_yuv && rotation != 0)
+	if (state->fb->format->is_yuv && (state->rotation & ~DRM_MODE_ROTATE_0))
 		return -EINVAL;
 
-	state->rotation = rotation;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index a74b26d359857..1723d4333f371 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -338,7 +338,7 @@ int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		return err;
 	}
 
-	if (supported_rotations & ~DRM_MODE_ROTATE_0) {
+	if (supported_rotations) {
 		err = drm_plane_create_rotation_property(plane,
 							 DRM_MODE_ROTATE_0,
 							 supported_rotations);
-- 
2.18.0


