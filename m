Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1436C6377D
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 06:23:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99D1661264
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 06:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99D1661264
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+0y09nQC4tPtixp2ERfAjHqjoptST6P/u381VAP1nk=; b=UIZYtfdVRkIv1h
	GUGukEGu8p+8p2NNcnYbJXad3VfxkUbaW8CU5agku0iXZNzNQaB+Za9E6v4uvIvxwHiB7KWkt8q3s
	9/3Ir24I3Db1Wd14iHOUjmkz8aELkFG5DInYnYCEPQi99JAneKwfqBcTzoRhQOUCk4xGp87+lVuqE
	TPHgVgVxa9xvRagepzox8Rm3WuvNZ3Qe7KFH+HOvPDDIcbFQ/eaEb3CGTQq0tixDaB6rWfokYKxc7
	M35SjdpQ+cv8FU0TiANnOXEgpbVt/XGsDCeqO1Emnb7Z3ZcOpzjWAWFnDaqMfb4Ei9FmtB4+eeDbh
	82+uvEWKn5F2CSd51gaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6S7I-000L99-BC; Thu, 22 Jul 2021 06:23:32 +0000
Received: from mx2.smtp.larsendata.com ([91.221.196.228])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6S6p-000Kx4-MU
 for linux-mediatek@lists.infradead.org; Thu, 22 Jul 2021 06:23:06 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 4c755a92-eab5-11eb-8d1a-0050568cd888;
 Thu, 22 Jul 2021 06:23:15 +0000 (UTC)
Received: from saturn.lan (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 78666194B13;
 Thu, 22 Jul 2021 08:23:18 +0200 (CEST)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v1 2/7] drm/bridge: Drop unused drm_bridge_chain functions
Date: Thu, 22 Jul 2021 08:22:41 +0200
Message-Id: <20210722062246.2512666-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210722062246.2512666-1-sam@ravnborg.org>
References: <20210722062246.2512666-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_232303_924329_115F25B4 
X-CRM114-Status: GOOD (  17.28  )
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

The drm_bridge_chain_{pre_enable,enable,disable,post_disable} has no
users left and we have atomic variants that should be used.
Drop them so they do not gain new users.

Adjust a few comments to avoid references to the dropped functions.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_bridge.c | 110 -----------------------------------
 include/drm/drm_bridge.h     |  28 ---------
 2 files changed, 138 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 044acd07c153..f34a3382a738 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -415,61 +415,6 @@ drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_bridge_chain_mode_valid);
 
-/**
- * drm_bridge_chain_disable - disables all bridges in the encoder chain
- * @bridge: bridge control structure
- *
- * Calls &drm_bridge_funcs.disable op for all the bridges in the encoder
- * chain, starting from the last bridge to the first. These are called before
- * calling the encoder's prepare op.
- *
- * Note: the bridge passed should be the one closest to the encoder
- */
-void drm_bridge_chain_disable(struct drm_bridge *bridge)
-{
-	struct drm_encoder *encoder;
-	struct drm_bridge *iter;
-
-	if (!bridge)
-		return;
-
-	encoder = bridge->encoder;
-	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
-		if (iter->funcs->disable)
-			iter->funcs->disable(iter);
-
-		if (iter == bridge)
-			break;
-	}
-}
-EXPORT_SYMBOL(drm_bridge_chain_disable);
-
-/**
- * drm_bridge_chain_post_disable - cleans up after disabling all bridges in the
- *				   encoder chain
- * @bridge: bridge control structure
- *
- * Calls &drm_bridge_funcs.post_disable op for all the bridges in the
- * encoder chain, starting from the first bridge to the last. These are called
- * after completing the encoder's prepare op.
- *
- * Note: the bridge passed should be the one closest to the encoder
- */
-void drm_bridge_chain_post_disable(struct drm_bridge *bridge)
-{
-	struct drm_encoder *encoder;
-
-	if (!bridge)
-		return;
-
-	encoder = bridge->encoder;
-	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
-		if (bridge->funcs->post_disable)
-			bridge->funcs->post_disable(bridge);
-	}
-}
-EXPORT_SYMBOL(drm_bridge_chain_post_disable);
-
 /**
  * drm_bridge_chain_mode_set - set proposed mode for all bridges in the
  *			       encoder chain
@@ -499,61 +444,6 @@ void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_bridge_chain_mode_set);
 
-/**
- * drm_bridge_chain_pre_enable - prepares for enabling all bridges in the
- *				 encoder chain
- * @bridge: bridge control structure
- *
- * Calls &drm_bridge_funcs.pre_enable op for all the bridges in the encoder
- * chain, starting from the last bridge to the first. These are called
- * before calling the encoder's commit op.
- *
- * Note: the bridge passed should be the one closest to the encoder
- */
-void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
-{
-	struct drm_encoder *encoder;
-	struct drm_bridge *iter;
-
-	if (!bridge)
-		return;
-
-	encoder = bridge->encoder;
-	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
-		if (iter->funcs->pre_enable)
-			iter->funcs->pre_enable(iter);
-
-		if (iter == bridge)
-			break;
-	}
-}
-EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
-
-/**
- * drm_bridge_chain_enable - enables all bridges in the encoder chain
- * @bridge: bridge control structure
- *
- * Calls &drm_bridge_funcs.enable op for all the bridges in the encoder
- * chain, starting from the first bridge to the last. These are called
- * after completing the encoder's commit op.
- *
- * Note that the bridge passed should be the one closest to the encoder
- */
-void drm_bridge_chain_enable(struct drm_bridge *bridge)
-{
-	struct drm_encoder *encoder;
-
-	if (!bridge)
-		return;
-
-	encoder = bridge->encoder;
-	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
-		if (bridge->funcs->enable)
-			bridge->funcs->enable(bridge);
-	}
-}
-EXPORT_SYMBOL(drm_bridge_chain_enable);
-
 /**
  * drm_atomic_bridge_chain_disable - disables all bridges in the encoder chain
  * @bridge: bridge control structure
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 46bdfa48c413..7bf3d44ecf46 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -297,12 +297,6 @@ struct drm_bridge_funcs {
 	 * not enable the display link feeding the next bridge in the chain (if
 	 * there is one) when this callback is called.
 	 *
-	 * Note that this function will only be invoked in the context of an
-	 * atomic commit. It will not be invoked from
-	 * &drm_bridge_chain_pre_enable. It would be prudent to also provide an
-	 * implementation of @pre_enable if you are expecting driver calls into
-	 * &drm_bridge_chain_pre_enable.
-	 *
 	 * The @atomic_pre_enable callback is optional.
 	 */
 	void (*atomic_pre_enable)(struct drm_bridge *bridge,
@@ -323,11 +317,6 @@ struct drm_bridge_funcs {
 	 * callback must enable the display link feeding the next bridge in the
 	 * chain if there is one.
 	 *
-	 * Note that this function will only be invoked in the context of an
-	 * atomic commit. It will not be invoked from &drm_bridge_chain_enable.
-	 * It would be prudent to also provide an implementation of @enable if
-	 * you are expecting driver calls into &drm_bridge_chain_enable.
-	 *
 	 * The @atomic_enable callback is optional.
 	 */
 	void (*atomic_enable)(struct drm_bridge *bridge,
@@ -345,12 +334,6 @@ struct drm_bridge_funcs {
 	 * The bridge can assume that the display pipe (i.e. clocks and timing
 	 * signals) feeding it is still running when this callback is called.
 	 *
-	 * Note that this function will only be invoked in the context of an
-	 * atomic commit. It will not be invoked from
-	 * &drm_bridge_chain_disable. It would be prudent to also provide an
-	 * implementation of @disable if you are expecting driver calls into
-	 * &drm_bridge_chain_disable.
-	 *
 	 * The @atomic_disable callback is optional.
 	 */
 	void (*atomic_disable)(struct drm_bridge *bridge,
@@ -370,13 +353,6 @@ struct drm_bridge_funcs {
 	 * signals) feeding it is no longer running when this callback is
 	 * called.
 	 *
-	 * Note that this function will only be invoked in the context of an
-	 * atomic commit. It will not be invoked from
-	 * &drm_bridge_chain_post_disable.
-	 * It would be prudent to also provide an implementation of
-	 * @post_disable if you are expecting driver calls into
-	 * &drm_bridge_chain_post_disable.
-	 *
 	 * The @atomic_post_disable callback is optional.
 	 */
 	void (*atomic_post_disable)(struct drm_bridge *bridge,
@@ -860,13 +836,9 @@ enum drm_mode_status
 drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
 			    const struct drm_display_info *info,
 			    const struct drm_display_mode *mode);
-void drm_bridge_chain_disable(struct drm_bridge *bridge);
-void drm_bridge_chain_post_disable(struct drm_bridge *bridge);
 void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
 			       const struct drm_display_mode *mode,
 			       const struct drm_display_mode *adjusted_mode);
-void drm_bridge_chain_pre_enable(struct drm_bridge *bridge);
-void drm_bridge_chain_enable(struct drm_bridge *bridge);
 
 int drm_atomic_bridge_chain_check(struct drm_bridge *bridge,
 				  struct drm_crtc_state *crtc_state,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
