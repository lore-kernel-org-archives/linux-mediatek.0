Return-Path: <SRS0=fv9r=HV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90310C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Feb 2021 10:04:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B02964EC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Feb 2021 10:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B02964EC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wcRTEYufpdf/zXzuHuuV3clqIkdEYKq0CdSih1OFtjk=; b=kjAUyKOh6X46948RIQLfIZJ6G
	rd5wgjFe9CRNnA5W1OjG0GA6eUmZkbUXLB5VsVwFg4Ne/n/LUe8NzIXKfzXIUd34yRpWAdBQI1QqY
	liS99xx3x/4hMo/URMTditUFrj3eryg/BaGDWHTcJHydBobmjjDZUfry+dPWMA1uuIVUA9Xy4a0l2
	jD5+RD6WSUzyg65253K8NtwZhbUC/wNV7bYo5qlcM1+H1hk+scQ3UlZVrZaD9p8etS3KjXfBX0R7r
	sH72/16RfIZebyjZRmONISnBVgQ+LhMgv6lhLmwG7MlaHh1TarCzylTfFbO8yzc0igRYhhpIR65GJ
	SEQgK+jvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lD2eB-0006RJ-1f; Fri, 19 Feb 2021 10:04:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lD2e7-0006QT-3q; Fri, 19 Feb 2021 10:04:24 +0000
X-UUID: 9b174f2733d6475ead2b3cac0695af45-20210219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zbFhxjKxU//Mvp/z1zqJYB0H3rdglSa83ZobhYrY0u0=; 
 b=ZU045o+T1/IvtWYNV5hczHMpE8gabWsgicSmNOAmGawHSGUVQckGLNLboIiaUtKsLUBr9VWlTOu3ciW2mu1WeGefm6P/kfu0IbSdlaoeHk+Es39rqN15q96trlmOciRr6GTl2Cedf2ejpyku2uxZmKykCCSMC884CLEdzBNYX9k=;
X-UUID: 9b174f2733d6475ead2b3cac0695af45-20210219
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 473880336; Fri, 19 Feb 2021 02:04:20 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Feb 2021 01:54:18 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Feb 2021 17:54:16 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Feb 2021 17:54:15 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1] drm/mediatek: move page flip handle into cmdq cb
Date: Fri, 19 Feb 2021 17:54:12 +0800
Message-ID: <1613728452-24871-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1613728452-24871-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1613728452-24871-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210219_050423_938630_54B19438 
X-CRM114-Status: GOOD (  14.46  )
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
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

move page flip handle into cmdq cb
irq callback will before cmdq flush ddp register
into hardware, that will cause the display frame page
flip event before it realy display out time

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index bdd37ea..bece327 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -72,6 +72,13 @@ struct mtk_crtc_state {
 	unsigned int			pending_vrefresh;
 };
 
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+struct mtk_cmdq_cb_data {
+	struct cmdq_pkt			*cmdq_handle;
+	struct mtk_drm_crtc		*mtk_crtc;
+};
+#endif
+
 static inline struct mtk_drm_crtc *to_mtk_crtc(struct drm_crtc *c)
 {
 	return container_of(c, struct mtk_drm_crtc, base);
@@ -96,7 +103,6 @@ static void mtk_drm_crtc_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
 
 static void mtk_drm_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
 {
-	drm_crtc_handle_vblank(&mtk_crtc->base);
 	if (mtk_crtc->pending_needs_vblank) {
 		mtk_drm_crtc_finish_page_flip(mtk_crtc);
 		mtk_crtc->pending_needs_vblank = false;
@@ -241,7 +247,19 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 static void ddp_cmdq_cb(struct cmdq_cb_data data)
 {
-	cmdq_pkt_destroy(data.data);
+	struct mtk_cmdq_cb_data *cb_data = data.data;
+
+	if (cb_data) {
+		struct mtk_drm_crtc *mtk_crtc = cb_data->mtk_crtc;
+
+		if (mtk_crtc)
+			mtk_drm_finish_page_flip(mtk_crtc);
+
+		if (cb_data->cmdq_handle)
+			cmdq_pkt_destroy(cb_data->cmdq_handle);
+
+		kfree(cb_data);
+	}
 }
 #endif
 
@@ -481,13 +499,20 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
 	}
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (mtk_crtc->cmdq_client) {
+		struct mtk_cmdq_cb_data *cb_data;
+
 		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
 		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
 		cmdq_pkt_finalize(cmdq_handle);
-		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
+
+		cb_data = kmalloc(sizeof(*cb_data), GFP_KERNEL);
+		cb_data->cmdq_handle = cmdq_handle;
+		cb_data->mtk_crtc = mtk_crtc;
+
+		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cb_data);
 	}
 #endif
 	mutex_unlock(&mtk_crtc->hw_lock);
@@ -674,7 +699,7 @@ void mtk_crtc_ddp_irq(struct drm_crtc *crtc, struct mtk_ddp_comp *comp)
 #endif
 		mtk_crtc_ddp_config(crtc, NULL);
 
-	mtk_drm_finish_page_flip(mtk_crtc);
+	drm_crtc_handle_vblank(&mtk_crtc->base);
 }
 
 static int mtk_drm_crtc_num_comp_planes(struct mtk_drm_crtc *mtk_crtc,
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
