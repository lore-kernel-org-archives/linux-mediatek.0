Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D11CDB483
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 05:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCddrdlDqKBenFHKsmGj9TdLiwG7aCIS6uamT9ldeW0=; b=jA3rhNIghxmG7S73b8x2vcPVNC
	qJkiFLNKSz3Je0q54B0ACjrJTyzpAoKwuukM7kRh7KHmhdkrrcj8wq4YtK33/L9Psd244hwhJge1M
	8Y6g4txFtRhBqKLAjrDMD6Ed5AICL7WFRCZBfOneFY5FLg7yF9QRraH2/tI6SzuyFlGgYfOqO5LqM
	y4tWSM/Eah14kie5XQTkBSvGmfz1nJ+z1uD7YiE7WHF4zUoR23Kw7XUsmo/6PX+JnOh7U8JrTfAS3
	77x6n5XEbnzz/kccfB0m7MkOE9mhRFZ4RDT0xQ/5XJK8T9NVgmZMi2pgwYByG97J4vuZUxxl3cyl0
	PHExLiVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtM1t-00GQ9e-3B;
	Thu, 19 Oct 2023 05:57:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtM1l-00GPx5-1w;
	Thu, 19 Oct 2023 05:57:05 +0000
X-UUID: 4e8fbb006e4411ee86758d4a7c00f3a0-20231018
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hCddrdlDqKBenFHKsmGj9TdLiwG7aCIS6uamT9ldeW0=;
	b=dBY78zsjgnqvcVrisbsOmlD4Ll5niGxTj5Twt6E/dI/V+goRii5xV0wm2+ozGG+DVuSuRiwolpVxzOXQt20Hoaj0Ayrnh/1sQ+R4eHljba4TWt2ymZ01u7ZaV8NiE7+NSCqzLypDqHGJfm30LKMuA9RJnExW0+CBhQkHbJ4gEP4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:4318b888-d3d5-4581-82de-f4fccfcdbe04,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:92b83615-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 4e8fbb006e4411ee86758d4a7c00f3a0-20231018
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1546290608; Wed, 18 Oct 2023 22:56:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 19 Oct 2023 13:56:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 19 Oct 2023 13:56:22 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK
 Hu <ck.hu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v10 15/24] drm/mediatek: Remove ineffectual power management codes
Date: Thu, 19 Oct 2023 13:56:10 +0800
Message-ID: <20231019055619.19358-16-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231019055619.19358-1-shawn.sung@mediatek.com>
References: <20231019055619.19358-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_225701_700035_978DEE15 
X-CRM114-Status: GOOD (  15.19  )
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Display modules will be powered on when .atomic_enable(),
there is no need to do it again in mtk_crtc_ddp_hw_init().
Besides, the DRM devices are created manually when mtk-mmsys
is probed and there is no power domain linked to it.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index bc4cc75cca18..c7edd80be428 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -6,7 +6,6 @@
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/mailbox_controller.h>
-#include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
 #include <linux/soc/mediatek/mtk-mutex.h>
@@ -362,22 +361,16 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc, struct drm_atomic
 		drm_connector_list_iter_end(&conn_iter);
 	}
 
-	ret = pm_runtime_resume_and_get(crtc->dev->dev);
-	if (ret < 0) {
-		DRM_ERROR("Failed to enable power domain: %d\n", ret);
-		return ret;
-	}
-
 	ret = mtk_mutex_prepare(mtk_crtc->mutex);
 	if (ret < 0) {
 		DRM_ERROR("Failed to enable mutex clock: %d\n", ret);
-		goto err_pm_runtime_put;
+		goto error;
 	}
 
 	ret = mtk_crtc_ddp_clk_enable(mtk_crtc);
 	if (ret < 0) {
 		DRM_ERROR("Failed to enable component clocks: %d\n", ret);
-		goto err_mutex_unprepare;
+		goto error;
 	}
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
@@ -426,16 +419,13 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc, struct drm_atomic
 
 	return 0;
 
-err_mutex_unprepare:
+error:
 	mtk_mutex_unprepare(mtk_crtc->mutex);
-err_pm_runtime_put:
-	pm_runtime_put(crtc->dev->dev);
 	return ret;
 }
 
 static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
 {
-	struct drm_device *drm = mtk_crtc->base.dev;
 	struct drm_crtc *crtc = &mtk_crtc->base;
 	int i;
 
@@ -465,8 +455,6 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
 	mtk_crtc_ddp_clk_disable(mtk_crtc);
 	mtk_mutex_unprepare(mtk_crtc->mutex);
 
-	pm_runtime_put(drm->dev);
-
 	if (crtc->state->event && !crtc->state->active) {
 		spin_lock_irq(&crtc->dev->event_lock);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-- 
2.18.0


