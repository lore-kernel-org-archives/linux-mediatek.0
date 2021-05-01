Return-Path: <SRS0=lfsG=J4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A95CC433B4
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 May 2021 03:14:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E832A61409
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 May 2021 03:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E832A61409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gY6TrvpKBXT/rKB3tlmbfFIiQ7dK5DDCapSjavGZjDE=; b=cm+xjIw0Ay4frSaSK4MtqzglL
	JXunUm7XBNyOexQJA7nrIalQbRH0Jr7naXpyn8UrkuQzO5Hl8NC8IJigb9XU0T+3JI72HnNyjjU0x
	DPfFjpUkA+ByVjx98SIg0sMXKwHCheQDsQMrxxJVoBLnicbUKTw2PuWVSP4qFEmqpJnwxPieESWvu
	XpmpS67hSRE7DBsIqifGgIWi4kPO0IpjCZuqWq0i7lhGhTduBFteumw4vFd5RgG/x7Xr2hEw2TvF3
	NKlAiCyOXqJUt/6GT2izSIFn0zeH56Vl/g07ZoGyaFn8eFOy215Kyc2fd30FbEA2vqVTlb3idTP/r
	n5hiOIPNg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcg5Q-009HB5-94; Sat, 01 May 2021 03:14:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcg4s-009H80-28; Sat, 01 May 2021 03:14:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=8UAO/BxT3fOe+SRJAwmY0XhPAvndOwd7oxL3OB2xvjI=; b=PJrGUCQGGXqoQ/OaNA4oXrT3k/
 +AoTKxVzMaJHZh2PvFFAm/kDCV/7hHCScJoZlbVKmrkPmViXsnDYoLbxodqgPu+jnRq6rUInil8Em
 ZzhVX+ppOMIU9zMSzzbtTgZplUFEsW/odqDyWaeKjykjN5vtQv+xvT4DBsrpdD1kagYATHlWxxEsj
 Lau03bNG4BEEdcl2LMRIhWDtB/v8eFwPIqrd+k7gwmEhp43pHvngQ8zH2SVwrioWllc9zeLukNiaf
 sTifVB1vc9dZjJtUr+ocVWiHvT6hJXhRCGUWoPXR1ExYAPCUqe5JQSFjLEoKQVZ+HOpHkHNGD28Jd
 ZsdBmMNw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcg4o-001nKx-7U; Sat, 01 May 2021 03:13:56 +0000
X-UUID: 6f28ff22d5ac452493d123656dfbc97c-20210430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8UAO/BxT3fOe+SRJAwmY0XhPAvndOwd7oxL3OB2xvjI=; 
 b=YK/o5XUjwmUHAk2Jj8K74JFVk+kNe7aZsJkykX7CP6e0nwCyErbmN+wXdFFGTrEZFcCcsqusDjIpeZVe/eez+usfcC3eOeH9T/L9L2bQlfd7u6fbBb4e93svyTqQwTentJXw4Psgdu+4ZI/rkw9DAQTIUVSxVeON8gMeYyUT0aQ=;
X-UUID: 6f28ff22d5ac452493d123656dfbc97c-20210430
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 524654070; Fri, 30 Apr 2021 20:13:46 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Apr 2021 20:13:45 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 1 May 2021 11:13:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 1 May 2021 11:13:42 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Hung Wu
 <chun-hung.wu@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: [PATCH 1/2] drm/mediatek: move page flip handle into cmdq cb
Date: Sat, 1 May 2021 11:13:38 +0800
Message-ID: <1619838819-11309-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1619838819-11309-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1619838819-11309-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_201354_296783_E75901BB 
X-CRM114-Status: GOOD (  14.33  )
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
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 46 ++++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 8b0de90..c37881b 100644
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
@@ -223,7 +229,27 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 static void ddp_cmdq_cb(struct cmdq_cb_data data)
 {
-	cmdq_pkt_destroy(data.data);
+	struct mtk_cmdq_cb_data *cb_data = data.data;
+	struct mtk_drm_crtc *mtk_crtc;
+
+	if (!cb_data) {
+		DRM_ERROR("cmdq callback data is null pointer!\n");
+		return;
+	}
+
+	mtk_crtc = cb_data->mtk_crtc;
+	if (!mtk_crtc) {
+		DRM_ERROR("cmdq callback mtk_crtc is null pointer!\n");
+		goto destroy_pkt;
+	}
+
+	mtk_drm_finish_page_flip(mtk_crtc);
+
+destroy_pkt:
+	if (cb_data->cmdq_handle)
+		cmdq_pkt_destroy(cb_data->cmdq_handle);
+
+	kfree(cb_data);
 }
 #endif
 
@@ -463,13 +489,20 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
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
@@ -488,7 +521,14 @@ static void mtk_crtc_ddp_irq(void *data)
 #endif
 		mtk_crtc_ddp_config(crtc, NULL);
 
+	drm_crtc_handle_vblank(&mtk_crtc->base);
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client)
+		mtk_drm_finish_page_flip(mtk_crtc);
+#else
 	mtk_drm_finish_page_flip(mtk_crtc);
+#endif
 }
 
 static int mtk_drm_crtc_enable_vblank(struct drm_crtc *crtc)
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
