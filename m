Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A855C6377D
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 06:24:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E046B610CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 06:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E046B610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CnkhGjab74fhFPU0+ILIKq3gSmJ0pjoS7IM5y5+ywL4=; b=JJs5Ym/E94MXgc
	J/7iz4m64GKkP12o6eU3BI9KQ+Jxhx+4bhKwdVTIqNYR78sRazMooWaJKsvDyLT6D48MBDYrF3w0T
	NG4M72ecJXvtRNJxZ2kQA9f5dWSrzktZrZNNY3hUtdsevWnUJOYIUbEcBxaV3jrHvROUv9fVZcwT5
	G8pKX8mH4g5P4uLFLncJXm55c4tIUPy5/c/CJbVk0RObC9SNoC+GMOCfgZQNgBovPNoJAfa0lCHec
	OoCN7yrNphshFFjACMB3Q+JSMK0V+mB81Pir0SqN2h8tws5cGb84mJdYc1dNlgox6hmdHUI2HUOOr
	Kvu5ZrXy6hNA9+suETSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6S80-000LV2-ER; Thu, 22 Jul 2021 06:24:16 +0000
Received: from mx1.smtp.larsendata.com ([91.221.196.215])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6S6s-000Kxx-NJ
 for linux-mediatek@lists.infradead.org; Thu, 22 Jul 2021 06:23:09 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 4717710f-eab5-11eb-9082-0050568c148b;
 Thu, 22 Jul 2021 06:23:06 +0000 (UTC)
Received: from saturn.lan (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id CDB52194B25;
 Thu, 22 Jul 2021 08:23:19 +0200 (CEST)
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
Subject: [PATCH v1 3/7] drm/bridge: Add drm_bridge_new_crtc_state() helper
Date: Thu, 22 Jul 2021 08:22:42 +0200
Message-Id: <20210722062246.2512666-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210722062246.2512666-1-sam@ravnborg.org>
References: <20210722062246.2512666-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_232307_199823_AEF92026 
X-CRM114-Status: GOOD (  16.45  )
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

drm_bridge_new_crtc_state() will be used by bridge drivers to provide
easy access to the mode from the drm_bridge_funcs operations.

The helper will be useful in the atomic operations of
struct drm_bridge_funcs.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_atomic.c | 34 ++++++++++++++++++++++++++++++++++
 include/drm/drm_atomic.h     |  3 +++
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index a8bbb021684b..93d513078e9a 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1133,6 +1133,40 @@ drm_atomic_get_new_bridge_state(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_atomic_get_new_bridge_state);
 
+/**
+ * drm_bridge_new_crtc_state - get crtc_state for the bridge
+ * @bridge: bridge object
+ * @old_bridge_state: state of the bridge
+ *
+ * This function returns the &struct drm_crtc_state for the given bridge/state,
+ * or NULL if no crtc_state could be looked up. In case no crtc_state then this is
+ * logged using WARN as the crtc_state is always expected to be present.
+ * This function is often used in the &struct drm_bridge_funcs operations.
+ */
+const struct drm_crtc_state *
+drm_bridge_new_crtc_state(struct drm_bridge *bridge,
+			  struct drm_bridge_state *old_bridge_state)
+{
+	struct drm_atomic_state *state = old_bridge_state->base.state;
+	const struct drm_connector_state *conn_state;
+	const struct drm_crtc_state *crtc_state;
+	struct drm_connector *connector;
+
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	if (WARN_ON(!connector))
+		return NULL;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (WARN_ON(!conn_state || !conn_state->crtc))
+		return NULL;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	if (WARN_ON(!crtc_state))
+		return NULL;
+
+	return crtc_state;
+}
+
 /**
  * drm_atomic_add_encoder_bridges - add bridges attached to an encoder
  * @state: atomic state
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 1701c2128a5c..a3001eef98bf 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1119,5 +1119,8 @@ drm_atomic_get_old_bridge_state(struct drm_atomic_state *state,
 struct drm_bridge_state *
 drm_atomic_get_new_bridge_state(struct drm_atomic_state *state,
 				struct drm_bridge *bridge);
+const struct drm_crtc_state *
+drm_bridge_new_crtc_state(struct drm_bridge *bridge,
+			  struct drm_bridge_state *old_bridge_state);
 
 #endif /* DRM_ATOMIC_H_ */
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
