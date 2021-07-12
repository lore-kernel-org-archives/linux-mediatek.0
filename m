Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BB7C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 18:12:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08DB26120A
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 18:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08DB26120A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hoq8a5w3Hfe5rDXvOX/tpeEr9n5E6NlqVWECTaoO/zo=; b=nrh5IWIlHuw54p
	mj57KAzdo4eUKRgpa9uioOYyqMqbbOjOqz9Zeochs8/f5lcAUsL4Nsla+BLkXY2Y++aNjTh5jd8HX
	5GS8ufqOVeih6J+wAM1opLH73Pt3h9V1bJVdky2j8TsT0GCVonvWL+SyYBvRzbVdC00EbXst8m1wC
	GvsEmuGVE+Je9w6+Pi4PaT0aEOpnmjIPf5Dqi+JL3/ZwahiavsChF5f6Euc64DBlnag3z0RZLw2vZ
	Jrbn91qVWoe+fPIuAumaL5uqK58jCBH74wiU/LjgyviQGD2QGUjdQrR/x6uOjKZ82w9T+/DbEmemW
	pFbdOJ2rRJGpTqJZYL5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m30Po-0088Oj-Jk; Mon, 12 Jul 2021 18:12:24 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m30Pm-0088Nr-DW
 for linux-mediatek@lists.infradead.org; Mon, 12 Jul 2021 18:12:23 +0000
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:e464:19d5:3655:dde7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 784C11F422BE;
 Mon, 12 Jul 2021 19:12:17 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: dafna.hirschfeld@collabora.com, kernel@collabora.com, dafna3@gmail.com,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, enric.balletbo@collabora.com,
 laurent.pinchart@ideasonboard.com
Subject: [PATCH] drm/mediatek: Test component initialization earlier in the
 function mtk_drm_crtc_create
Date: Mon, 12 Jul 2021 20:12:09 +0200
Message-Id: <20210712181209.27023-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_111222_631809_CC0AE51A 
X-CRM114-Status: GOOD (  12.84  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The initialization is currently tested in a later stage in
the function for no reason.
In addition, the test '!comp' will never fail since comp is
set with the '&' operator. Instead, test if a comp was not
initialized by testing "!comp->dev".

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 474efb844249..06f40e589922 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -755,14 +755,22 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	for (i = 0; i < path_len; i++) {
 		enum mtk_ddp_comp_id comp_id = path[i];
 		struct device_node *node;
+		struct mtk_ddp_comp *comp;
 
 		node = priv->comp_node[comp_id];
+		comp = &priv->ddp_comp[comp_id];
+
 		if (!node) {
 			dev_info(dev,
 				 "Not creating crtc %d because component %d is disabled or missing\n",
 				 pipe, comp_id);
 			return 0;
 		}
+
+		if (!comp->dev) {
+			dev_err(dev, "Component %pOF not initialized\n", node);
+			return -ENODEV;
+		}
 	}
 
 	mtk_crtc = devm_kzalloc(dev, sizeof(*mtk_crtc), GFP_KERNEL);
@@ -787,16 +795,8 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
 		enum mtk_ddp_comp_id comp_id = path[i];
 		struct mtk_ddp_comp *comp;
-		struct device_node *node;
 
-		node = priv->comp_node[comp_id];
 		comp = &priv->ddp_comp[comp_id];
-		if (!comp) {
-			dev_err(dev, "Component %pOF not initialized\n", node);
-			ret = -ENODEV;
-			return ret;
-		}
-
 		mtk_crtc->ddp_comp[i] = comp;
 
 		if (comp->funcs) {
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
