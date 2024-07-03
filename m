Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C966C2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 10:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iQeVTtzgmCg1R84emw3yEtPy2VOguvtZOSyCu6KYw3k=; b=O/o+nXbIkOvaNFWTS4iipyrYR8
	0meh6EwZUi7k7ZqrF+taenGodqfcUm2npajHscmzThlj1qnQuUo1W7uJI1azJ9yQg+1Yka0XU3jbk
	3LMOTce9KGkHcx1HloMfvhv+FisboGsUcHjbfejwDTvgQ2pvBwJnwMsO79t5grj8u/Xfkq86F6BNn
	pDWID0YOQeusDvIxtBJ7PckgzEp2u8sBARx6gxYkuxwCCwoub31BpddiJos0rhML3HIOc7T5VzsID
	fCs5xQA7l5TuLFm4ldVv3g7n7OJzvzA2Pw9DnOcW38EkqNBTW6Z/MmIxEtk2KOdXgXDzJbbhqFFeV
	c0WFLxIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxSW-00000009rFk-3M97;
	Wed, 03 Jul 2024 10:43:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxSJ-00000009rBR-1VRQ;
	Wed, 03 Jul 2024 10:43:20 +0000
X-UUID: 0bf6c2e2392911efb2966dae1f787272-20240703
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=iQeVTtzgmCg1R84emw3yEtPy2VOguvtZOSyCu6KYw3k=;
	b=jlRa9r4LK6NO99wen73Bb47Bc6UmIr3rg1havqcFyP+22nVlO3nxtRpef9jHSllAQZe7kriAKJMnAoZVn5TlwQoCzimXBQoyH20SRS6F/oktefvq6ofxYYObcShJheMCFk2thJf4tdgxV7wlsF/VaNH/qTRexMHlBtP1ohEppgI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:5d60d012-05b7-4783-97bf-3dad58db964a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:3079dc44-a117-4f46-a956-71ffeac67bfa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0bf6c2e2392911efb2966dae1f787272-20240703
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 362844833; Wed, 03 Jul 2024 03:43:12 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Jul 2024 18:33:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Jul 2024 18:33:09 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jeffrey Kardatzke
	<jkardatzke@google.com>
Subject: [PATCH] drm/mediatek: Fix missing configuration flags in mtk_crtc_ddp_config()
Date: Wed, 3 Jul 2024 18:33:08 +0800
Message-ID: <20240703103308.10198-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_034319_544120_422E06EB 
X-CRM114-Status: GOOD (  13.28  )
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

In mtk_crtc_ddp_config(), mtk_crtc will use some configuration flags to
generate instructions to cmdq_handle, such as:
  state->pending_config
  mtk_crtc->pending_planes
  plane_state->pending.config
  mtk_crtc->pending_async_planes
  plane_state->pending.async_config

These configuration flags may be set to false when a GCE IRQ comes calling
ddp_cmdq_cb(). This may result in missing prepare instructions,
especially if mtk_crtc_update_config() with the flase need_vblank (no need
to wait for vblank) cases.

Therefore, use the mtk_crtc->config_updating flag set at the beginning of
mtk_crtc_update_config() to ensure that these configuration flags won't be
changed when the mtk_crtc_ddp_config() is preparing instructions.

Fixes: 7f82d9c43879 ("drm/mediatek: Clear pending flag when cmdq packet is done")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 34 +++++++++++++++--------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 6f34f573e127..bc3bf0c3edd9 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -314,30 +314,32 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 
 	state = to_mtk_crtc_state(mtk_crtc->base.state);
 
-	state->pending_config = false;
+	if (!mtk_crtc->config_updating) {
+		state->pending_config = false;
 
-	if (mtk_crtc->pending_planes) {
-		for (i = 0; i < mtk_crtc->layer_nr; i++) {
-			struct drm_plane *plane = &mtk_crtc->planes[i];
-			struct mtk_plane_state *plane_state;
+		if (mtk_crtc->pending_planes) {
+			for (i = 0; i < mtk_crtc->layer_nr; i++) {
+				struct drm_plane *plane = &mtk_crtc->planes[i];
+				struct mtk_plane_state *plane_state;
 
-			plane_state = to_mtk_plane_state(plane->state);
+				plane_state = to_mtk_plane_state(plane->state);
 
-			plane_state->pending.config = false;
+				plane_state->pending.config = false;
+			}
+			mtk_crtc->pending_planes = false;
 		}
-		mtk_crtc->pending_planes = false;
-	}
 
-	if (mtk_crtc->pending_async_planes) {
-		for (i = 0; i < mtk_crtc->layer_nr; i++) {
-			struct drm_plane *plane = &mtk_crtc->planes[i];
-			struct mtk_plane_state *plane_state;
+		if (mtk_crtc->pending_async_planes) {
+			for (i = 0; i < mtk_crtc->layer_nr; i++) {
+				struct drm_plane *plane = &mtk_crtc->planes[i];
+				struct mtk_plane_state *plane_state;
 
-			plane_state = to_mtk_plane_state(plane->state);
+				plane_state = to_mtk_plane_state(plane->state);
 
-			plane_state->pending.async_config = false;
+				plane_state->pending.async_config = false;
+			}
+			mtk_crtc->pending_async_planes = false;
 		}
-		mtk_crtc->pending_async_planes = false;
 	}
 
 	mtk_crtc->cmdq_vblank_cnt = 0;
-- 
2.18.0


