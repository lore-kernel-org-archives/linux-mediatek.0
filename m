Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E53DC48BF6
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 08:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwc9kDknZAzyKajXb2vq1Cm2P/QPOwxJq4Z1t9O4ssc=; b=WMuZu4ugaKZ0ccy1TKHCEBLh1g
	q6JYFXYtA0V6zvWuXg/h/GeVsFV/Rmd/oCI14oBIFv/egr4jINjObcJn67t5VzyBXuo2fJcH3+m/C
	eXVdfKPQX7yL2MaGhAADbQkaL1m2wVYIGPDp+ACAaNLgk+M8rCr5yWZIziu29cut8hWkAuAJzs4tR
	q1t3qxeQQexpBcIa3gOg7QxJrDKErf1p2i1LltK7uzY6FlYMUVLMduyo3tQQ4L4FBpOt31tt8Fi6O
	VZkT2sfmk8LiHFvDjpZep/erTt5JsD+rTg/LAQ+UjPxiOxll/x0zR6ZJ6Jf1kSQthU0QQhgvVznzl
	wObh/TaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWiX-0000000H8Ck-2EiN;
	Mon, 26 Feb 2024 08:52:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWi9-0000000H7tJ-1pDL;
	Mon, 26 Feb 2024 08:51:47 +0000
X-UUID: 40d8190cd48411eeb017d5921c808e14-20240226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=iwc9kDknZAzyKajXb2vq1Cm2P/QPOwxJq4Z1t9O4ssc=;
	b=u1QF3DjLzz17ehgLXiVDgylbqeXPgOJi34swrTiFQDh53LBqrpBtUEMS0alVFW7DuePMy8tvh83hVIFg0/Wi6adibSrkG9DF+YNnKrDGXhRGpEjW6tA4ubDKzVl86h+A0ArhLbTlQJYxIrVQP8I4Bo2zNCtcQx4MohnJYRW0Bmg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:2b40781c-f492-486d-8acb-2c4b514698cd,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:1065d280-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 40d8190cd48411eeb017d5921c808e14-20240226
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 481529967; Mon, 26 Feb 2024 01:51:38 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 26 Feb 2024 16:51:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 26 Feb 2024 16:51:02 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>, Hsiao Chien Sung
	<shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH 11/11] drm/mediatek: Rename "pending_needs_vblank" to "needs_vblank"
Date: Mon, 26 Feb 2024 16:50:59 +0800
Message-ID: <20240226085059.26850-12-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240226085059.26850-1-shawn.sung@mediatek.com>
References: <20240226085059.26850-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_005145_538396_E87947F7 
X-CRM114-Status: GOOD (  12.41  )
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

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Rename "pending_needs_vblank" to "needs_vblank" to reduce the code size.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 7fe234de83a3..a1fb6c67681d 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -42,7 +42,7 @@ struct mtk_crtc {
 	struct drm_crtc			base;
 	bool				enabled;
 
-	bool				pending_needs_vblank;
+	bool				needs_vblank;
 	struct drm_pending_vblank_event	*event;
 
 	struct drm_plane		*planes;
@@ -105,9 +105,9 @@ static void mtk_crtc_finish_page_flip(struct mtk_crtc *mtk_crtc)
 static void mtk_drm_finish_page_flip(struct mtk_crtc *mtk_crtc)
 {
 	drm_crtc_handle_vblank(&mtk_crtc->base);
-	if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank) {
+	if (!mtk_crtc->config_updating && mtk_crtc->needs_vblank) {
 		mtk_crtc_finish_page_flip(mtk_crtc);
-		mtk_crtc->pending_needs_vblank = false;
+		mtk_crtc->needs_vblank = false;
 	}
 }
 
@@ -571,7 +571,7 @@ static void mtk_crtc_update_config(struct mtk_crtc *mtk_crtc, bool needs_vblank)
 	mutex_lock(&mtk_crtc->hw_lock);
 	mtk_crtc->config_updating = true;
 	if (needs_vblank)
-		mtk_crtc->pending_needs_vblank = true;
+		mtk_crtc->needs_vblank = true;
 
 	for (i = 0; i < mtk_crtc->layer_nr; i++) {
 		struct drm_plane *plane = &mtk_crtc->planes[i];
-- 
2.18.0


