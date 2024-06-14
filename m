Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFAFC27C77
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 03:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Wg+cfzFV869KNlYc3FkYfypiH8tKZlabSpmjEIudDw=; b=XFrF4A2Uuhxn6xHXqcSRLu5Cfc
	fP1jBO4hagEClBARtJYnrg1gcpEZEXFAxUzS1AOTm1qNmgMNQXPBfBXHj/8CdNhq+kZaEc2kbBt2N
	2xovnLoMwXOEQNLJjdd9klrGhzb4XwqfQ50lpgRtsh+nwD2ZfoQumQnBW+Zo6A9DUFbSxJfAEcgl/
	5nr8biG+qW+9k9315oDeBbzLZn9wNZjm0Sci85HESUCk+DwIF6SVhsy1+ZTlx/pECAQ36gTTHcgP6
	Sj1RigEdvvW9yaH8oCFyYz0yXO3VnUD9wG+dgILmDrFKfQz932xu03feYu8u4/FepAIkQOq7+T4UG
	KjO9DY3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHxwi-00000001JSp-0b5u;
	Fri, 14 Jun 2024 03:49:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHxwe-00000001JRa-48V1;
	Fri, 14 Jun 2024 03:49:46 +0000
X-UUID: 213bcbac2a0111efba8bfb22b0451c12-20240613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=3Wg+cfzFV869KNlYc3FkYfypiH8tKZlabSpmjEIudDw=;
	b=E23AktRk6fWgaY3HW3Hw4BIid+eVEJwBntVUYTfPuSsWMNx4GVWH57fKAGeZ4IN0zBVfPs1LGcg1KECTTy596JL/cCmzIdIwT9MemgpM/1FWSE0XVw7r2bavqMWO/L618c8PRhYThBPOmP1erp6qJpzMxDs8ATHQhQ/QIUH0KLM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:0811d2f0-25d7-4141-ba74-427b8dd8faff,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:3e0b9044-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 213bcbac2a0111efba8bfb22b0451c12-20240613
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 967912633; Thu, 13 Jun 2024 20:49:41 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Jun 2024 11:49:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jun 2024 11:49:38 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Nancy
 . Lin" <nancy.lin@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH] drm/mediatek: Remove less-than-zero comparison of an unsigned value
Date: Fri, 14 Jun 2024 11:49:37 +0800
Message-ID: <20240614034937.23978-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_204945_061357_E6E8D2B8 
X-CRM114-Status: GOOD (  10.97  )
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

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

Fix a Coverity error that less-than-zero comparison of an unsigned value
is never true.

Fixes: 0d9eee9118b7 ("drm/mediatek: Add drm ovl_adaptor sub driver for MT8195")
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index 17b036411292..a66e46d0b45e 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -593,7 +593,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	int ret;
 #endif
 
-	if (comp_id < 0 || comp_id >= DDP_COMPONENT_DRM_ID_MAX)
+	if (comp_id >= DDP_COMPONENT_DRM_ID_MAX)
 		return -EINVAL;
 
 	type = mtk_ddp_matches[comp_id].type;
-- 
2.18.0


