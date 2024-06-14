Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388B4C27C7B
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 02:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toZI1eMYvUVCsfzTbCuF8F4eC4xSRVwzzC5k4uSZ54g=; b=ik+K8yTF5uUIfWt4dhPO7mzZAb
	kvsd9yJ823kErbNwckTxMOtPAsVMORDEKJwzAooiG/uXB0w2lLq6VNX56JEurLzRI3/wNh8Fe+8hM
	Vl36RZEqNHNKl25LswGuNhMYK/AO1aLfnMCxUWFdJDMNf2EpMOdGTsv+IuVwXmnzeiBjDdMoLcOLI
	sb+0wAH8u+FkUBngeVDyN5U3oFIJt9J+pG3nQZrJYKq2jSPDuH1U7NA4dspoyBTYKET8iPP51AUcI
	98UeLKkr54I9n8na7fMOvaMZts3oCRMB8+/L4kOLngCmi5Onppr9st+wp8Csu4gRkRhe1Qm1JzkCl
	LIVEjE8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHwy4-00000001ASJ-0mys;
	Fri, 14 Jun 2024 02:47:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHwxT-000000019uI-3DYT;
	Fri, 14 Jun 2024 02:46:33 +0000
X-UUID: 4ab7e3f229f811efaf04eb0598667787-20240613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=toZI1eMYvUVCsfzTbCuF8F4eC4xSRVwzzC5k4uSZ54g=;
	b=jUVWhhfPWTuWsQvuAbwaorZRfe2HQbN60Sd77eYtsjsAUWqHw+pPiLFr6D6gWE+HUkokZxpINj5I6TDV6xB//wJ4mH3lur4I3wgrQJJyrcYQ4FSPGGdc5NvNaeiNMirb0+bfk+lHyMKyp4vfGD10YOdgHaFt61JzQE2NkEJpsa4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:af571583-e4e6-43c0-8bba-b34c96ae9956,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:393d96e,CLOUDID:d9df9188-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4ab7e3f229f811efaf04eb0598667787-20240613
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 236548146; Thu, 13 Jun 2024 19:46:25 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Jun 2024 10:46:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jun 2024 10:46:24 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v9 14/21] drm/mediatek: Support "None" blending in OVL
Date: Fri, 14 Jun 2024 10:46:13 +0800
Message-ID: <20240614024620.19011-15-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240614024620.19011-1-shawn.sung@mediatek.com>
References: <20240614024620.19011-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_194631_887144_CB290307 
X-CRM114-Status: GOOD (  12.24  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Hsiao Chien Sung <shawn.sung@mediatek.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

Support "None" alpha blending mode on MediaTek's chips.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 2316d4a6dca7..6567806cf4e2 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -431,6 +431,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 	unsigned int fmt = pending->format;
 	unsigned int offset = (pending->y << 16) | pending->x;
 	unsigned int src_size = (pending->height << 16) | pending->width;
+	unsigned int blend_mode = state->base.pixel_blend_mode;
 	unsigned int ignore_pixel_alpha = 0;
 	unsigned int con;
 	bool is_afbc = pending->modifier != DRM_FORMAT_MOD_LINEAR;
@@ -460,7 +461,8 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 	 * For RGB888 related formats, whether CONST_BLD is enabled or not won't
 	 * affect the result. Therefore we use !has_alpha as the condition.
 	 */
-	if (state->base.fb && !state->base.fb->format->has_alpha)
+	if ((state->base.fb && !state->base.fb->format->has_alpha) ||
+	    blend_mode == DRM_MODE_BLEND_PIXEL_NONE)
 		ignore_pixel_alpha = OVL_CONST_BLEND;
 
 	if (pending->rotation & DRM_MODE_REFLECT_Y) {
-- 
2.18.0


