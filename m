Return-Path: <SRS0=L+xn=ZT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594ACC33C99
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 01:18:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26CA020835
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 01:18:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K7AIrKQ+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JxAsfkmY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26CA020835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQvst3wH5n37JMiS0aHtMzC696IRgMwu0zXDBD2S91k=; b=K7AIrKQ+J83V0u
	Ok7hShaangCx/dmfh6o6nYubCtE0vniATqCbiTmGaVQcwAt5dmTViXQPG4c3KvLjJ9INk9PjP/eOt
	8ZV07oHAw1SnQ3ha3otU7MciQzwMoAQnS0xEcNjrX63Nojb254PMJ0Y7xD796DPGi11tnTfagWtIj
	BCaJB6TaCp4K5iGxXRHKQFfqvj6X5Mhb/+UxLwVU5xNf3NFrz+cP8656dC1zcTVrzbxNA0lXSUBXO
	WAsD5ImvjNGAHkKGEMzTil4Kl07rJ04zNsv0y/08BJOk66xTq9gULX9CkKHrgOs8GimBvxhfMtXi2
	KzKiTtgZYwZiA6mLPuSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZly9-0006Nb-GC; Wed, 27 Nov 2019 01:18:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZly6-0006M3-LD; Wed, 27 Nov 2019 01:18:12 +0000
X-UUID: a45640faeb9449fc93359b8a40ae8e24-20191126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ukDKw46dJ6kUKB8fK1XW/KSDkxflYgyotMjPJ393R3U=; 
 b=JxAsfkmYsU7GZwD1SjwJD3VODWVjmdz0BDgX2HXzPJ3BNq1bl5aN1gnVaW3q4ClflHxAAYeQmHskIWtjV5ON/xca9ecOf2WklWWlpUspMG2oOn/hdOnd5AtrBgUQYmuH2bJhLy70tUhbVFMps9X/Eb+JEEqW/vS8M1iRIIDoALw=;
X-UUID: a45640faeb9449fc93359b8a40ae8e24-20191126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1781169808; Tue, 26 Nov 2019 17:18:04 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 26 Nov 2019 17:18:33 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 27 Nov 2019 09:17:49 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 27 Nov 2019 09:17:10 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1,
 1/2] drm/mediatek: Fixup external display black screen issue
Date: Wed, 27 Nov 2019 09:17:54 +0800
Message-ID: <1574817475-22378-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1574817475-22378-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1574817475-22378-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_171810_710178_0748CF42 
X-CRM114-Status: GOOD (  12.84  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

Problem:
overlay hangup when external display hotplut test

Fix:
disable overlay when crtc disable

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 39 +++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 4fb346c..7eca02f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -369,6 +369,20 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 	mtk_disp_mutex_add_comp(mtk_crtc->mutex, mtk_crtc->ddp_comp[i]->id);
 	mtk_disp_mutex_enable(mtk_crtc->mutex);
 
+	/* Initially configure all planes */
+	for (i = 0; i < mtk_crtc->layer_nr; i++) {
+		struct drm_plane *plane = &mtk_crtc->planes[i];
+		struct mtk_plane_state *plane_state;
+		struct mtk_ddp_comp *comp;
+		unsigned int local_layer;
+
+		plane_state = to_mtk_plane_state(plane->state);
+		comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
+		if (comp)
+			mtk_ddp_comp_layer_config(comp, local_layer,
+						  plane_state, NULL);
+	}
+
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
 		struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[i];
 		enum mtk_ddp_comp_id prev;
@@ -385,20 +399,6 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 		mtk_ddp_comp_start(comp);
 	}
 
-	/* Initially configure all planes */
-	for (i = 0; i < mtk_crtc->layer_nr; i++) {
-		struct drm_plane *plane = &mtk_crtc->planes[i];
-		struct mtk_plane_state *plane_state;
-		struct mtk_ddp_comp *comp;
-		unsigned int local_layer;
-
-		plane_state = to_mtk_plane_state(plane->state);
-		comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
-		if (comp)
-			mtk_ddp_comp_layer_config(comp, local_layer,
-						  plane_state, NULL);
-	}
-
 	return 0;
 
 err_mutex_unprepare:
@@ -607,10 +607,21 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 	for (i = 0; i < mtk_crtc->layer_nr; i++) {
 		struct drm_plane *plane = &mtk_crtc->planes[i];
 		struct mtk_plane_state *plane_state;
+		struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+		unsigned int comp_layer_nr = mtk_ddp_comp_layer_nr(comp);
+		unsigned int local_layer;
 
 		plane_state = to_mtk_plane_state(plane->state);
 		plane_state->pending.enable = false;
 		plane_state->pending.config = true;
+
+		if (i >= comp_layer_nr) {
+			comp = mtk_crtc->ddp_comp[1];
+			local_layer = i - comp_layer_nr;
+		} else
+			local_layer = i;
+		mtk_ddp_comp_layer_config(comp, local_layer,
+					  plane_state, NULL);
 	}
 	mtk_crtc->pending_planes = true;
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
