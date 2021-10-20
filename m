Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EEC1C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 18:20:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E674B60F6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 18:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E674B60F6E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zq0Hyw4u9yl6w2/aGJei3hBoHF/mHZDYJJvfS8nnrmA=; b=KSp97IU3ABc1lO
	5QVmvbDK2DuV8DzLZE/UDNDGZ1M980clmnupXiXx/zN1Zqx4Cf1HfHrfprSqY3010+c3OeseYo5b0
	nPb97iX9nJCsMpWgtXYXtKz5JtESG4kTjVW6iM/40CNerlf0CUQYB5c9bvbh8/HtUR/iFMat3+heA
	RWVv0oSoP/FfDFaCIVwGkTQdIlqJVRUR18u0bPX403C/ltHLzzJtZo/eoeyIVfehCKCM6VhddiygZ
	tCnS+Oj3vshpspqDGJTTbfCu3UCDIgoPTnMJc0Vv41k8Xq1l9VXpuSDrrlCqLhb+P0puGllhKFH5w
	GAm5xKIPKY7QnD4ayCRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdGCX-005PfI-8S; Wed, 20 Oct 2021 18:20:33 +0000
Received: from mx2.smtp.larsendata.com ([91.221.196.228])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdGBM-005P3g-R3
 for linux-mediatek@lists.infradead.org; Wed, 20 Oct 2021 18:19:23 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 446a2974-31d2-11ec-ac3c-0050568cd888;
 Wed, 20 Oct 2021 18:19:30 +0000 (UTC)
Received: from saturn.localdomain (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 1D569194B68;
 Wed, 20 Oct 2021 20:19:17 +0200 (CEST)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Philip Chen <philipchen@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 3/7] drm/bridge: Add drm_atomic_get_new_crtc_for_bridge()
 helper
Date: Wed, 20 Oct 2021 20:18:57 +0200
Message-Id: <20211020181901.2114645-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211020181901.2114645-1-sam@ravnborg.org>
References: <20211020181901.2114645-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_111921_263097_EFC5DD24 
X-CRM114-Status: GOOD (  18.26  )
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

drm_atomic_get_new_crtc_for_bridge() will be used by bridge
drivers to provide easy access to the mode from the
drm_bridge_funcs operations.

The helper will be useful in the conversion to the atomic
operations of struct drm_bridge_funcs.

v2:
  - Renamed to drm_atomic_get_new_crtc_for_bridge (Maxime)
  - Use atomic_state, not bridge_State (Maxime)
  - Drop WARN on crtc_state as it is a valid case (Maxime)
  - Added small code snip to help readers
  - Updated description, fixed kernel-doc and exported the symbol

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
 drivers/gpu/drm/drm_atomic.c | 42 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_atomic.h     |  3 +++
 2 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index ff1416cd609a..8b107194b157 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1134,6 +1134,48 @@ drm_atomic_get_new_bridge_state(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_atomic_get_new_bridge_state);
 
+/**
+ * drm_atomic_get_new_crtc_for_bridge - get new crtc_state for the bridge
+ * @state: state of the bridge
+ * @bridge: bridge object
+ *
+ * This function is often used in the &struct drm_bridge_funcs operations
+ * to provide easy access to the mode like this:
+ *
+ * .. code-block:: c
+ *
+ *	crtc_state = drm_atomic_get_new_crtc_for_bridge(old_bridge_state->base.state,
+ *							bridge);
+ *	if (crtc_state) {
+ *		mode = &crtc_state->mode;
+ *		...
+ *
+ * If no connector can be looked up or if no connector state is available
+ * then this will be logged using WARN().
+ *
+ * Returns:
+ * The &struct drm_crtc_state for the given bridge/state, or NULL
+ * if no crtc_state could be looked up.
+ */
+const struct drm_crtc_state *
+drm_atomic_get_new_crtc_for_bridge(struct drm_atomic_state *state,
+				   struct drm_bridge *bridge)
+{
+	const struct drm_connector_state *conn_state;
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
+	return drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+}
+EXPORT_SYMBOL(drm_atomic_get_new_crtc_for_bridge);
+
 /**
  * drm_atomic_add_encoder_bridges - add bridges attached to an encoder
  * @state: atomic state
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 1701c2128a5c..f861d73296cc 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1119,5 +1119,8 @@ drm_atomic_get_old_bridge_state(struct drm_atomic_state *state,
 struct drm_bridge_state *
 drm_atomic_get_new_bridge_state(struct drm_atomic_state *state,
 				struct drm_bridge *bridge);
+const struct drm_crtc_state *
+drm_atomic_get_new_crtc_for_bridge(struct drm_atomic_state *state,
+				   struct drm_bridge *bridge);
 
 #endif /* DRM_ATOMIC_H_ */
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
