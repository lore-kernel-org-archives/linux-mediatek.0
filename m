Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FAF606A31F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2026 16:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yPfHCBSD;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Osoh/pow
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hsr4q6N64Fcf6mYkwtlmKaY913OD6ROMQBz3nI6nZSA=; b=yPfHCBSD5d3veN
	KJgLtwdv2M4oTO0MwQOep45fydsKQwtgXAdnO9uuEhUHSXoUg08mQCxloQIszcOKiisOXfQGwfdGZ
	6St2gbWOdXho3TuQHhMVuyF3kqPOO8pFav67vulbAG3DEommPCwMi55SK7gQD9y7KrTG0Usi8Yktx
	mCXB+8mqmpCRVKcKvzPTWdxtm0HcjgmUfixY20cwMc0kXiFVUPJaolWsWhij1q6cai2xI9KGHuzeK
	LZ3ZQ73jqgkNavicCZyW7jxG/hCy0GY9nbMXdk7DZs3c/UxVtnFzFaQVdclq7kCDh5V6WxU98kCAK
	+TGCSWFltoa5R4Ld/R2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvpB-0000000EWA0-0EEe;
	Thu, 22 Oct 2026 16:39:29 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvp7-0000000EW6b-3767
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Oct 2026 16:39:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3DF074E412B6;
	Thu, 22 Oct 2026 16:39:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10EF060763;
	Thu, 22 Oct 2026 16:39:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CCA3910328EDB;
	Thu, 22 Oct 2026 18:39:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792687158; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hsr4q6N64Fcf6mYkwtlmKaY913OD6ROMQBz3nI6nZSA=;
	b=Osoh/powtRvm8laxTWwHQorj/7S0Orjw58SZ1kmNiwaDR47d2tW0qs6r0IVHwGXsquGzD/
	e3Qe8SYUZWDZsX3UkRsX4Km96dbjSalHiWhjxxsyNblndh8zmGDTl1tb1WNnt2jwYyhwqG
	sIUVDrfvqyggTX4PsZt5IUEqrUkvO+sdOPDCkOM9qpp4nNtJc15tw8+wAldAl7ApJgiNnD
	2frRP1gtvG/ggq6MgDoSOvpZ5fTBkSb3o/v6jBbvSJkuKrdM1FIA8fod0KaTJbZi/Hhb5o
	PyhFPjxlkk43+e1JfXlkJk888aQiMXmYVQfP6kj3Wo+NM0rl85HWG/zDLGxAEQ==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Thu, 22 Oct 2026 18:38:02 +0200
Subject: [PATCH v4 6/8] drm/bridge: Expose link training state via new
 DRM_BRIDGE_OP_DP flag
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-feat_link_cap-v4-6-a4f3f6e8cad9@bootlin.com>
References: <20261022-feat_link_cap-v4-0-a4f3f6e8cad9@bootlin.com>
In-Reply-To: <20261022-feat_link_cap-v4-0-a4f3f6e8cad9@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Daniel Stone <daniels@collabora.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mark Yacoub <markyacoub@google.com>, Sean Paul <seanpaul@google.com>, 
 Manasi Navare <navaremanasi@google.com>, 
 Drew Davenport <ddavenport@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.16.1-dev-17221
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_093926_079876_8A0A021D 
X-CRM114-Status: GOOD (  15.09  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Introduce DRM_BRIDGE_OP_DP, a new bridge operation flag for bridges
that provide DisplayPort connector operations with link training support.
Bridges advertising this flag must fill the dp_link_caps field in
struct drm_bridge with their link capabilities.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Changes in v3:
- Mone on from drmm_connector_dp_init() to drm_dp_source_set_caps().

Change in v2:
- New patch
---
 drivers/gpu/drm/display/Kconfig                |  1 +
 drivers/gpu/drm/display/drm_bridge_connector.c | 29 ++++++++++++++++++++++++++
 include/drm/drm_bridge.h                       | 13 ++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index df09cf9a8ca19..ce2f6d62c76d0 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -19,6 +19,7 @@ config DRM_BRIDGE_CONNECTOR
 	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select DRM_DISPLAY_HDMI_CEC_HELPER
 	select DRM_DISPLAY_HDMI_STATE_HELPER
+	select DRM_DISPLAY_DP_HELPER
 	help
 	  DRM connector implementation terminating DRM bridge chains.
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 81f3e26f6fdf5..5b58e86da6259 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -26,6 +26,7 @@
 #include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
+#include <drm/display/drm_dp_helper.h>
 
 /**
  * DOC: overview
@@ -109,6 +110,13 @@ struct drm_bridge_connector {
 	 * HDMI Audio infrastructure, if any (see &DRM_BRIDGE_OP_HDMI_AUDIO).
 	 */
 	struct drm_bridge *bridge_hdmi_audio;
+	/**
+	 * @bridge_dp:
+	 *
+	 * The bridge in the chain that implements necessary support for the
+	 * DisplayPort connector infrastructure, if any (see &DRM_BRIDGE_OP_DP).
+	 */
+	struct drm_bridge *bridge_dp;
 	/**
 	 * @bridge_dp_audio:
 	 *
@@ -835,6 +843,7 @@ static void drm_bridge_connector_put_bridges(struct drm_device *dev, void *data)
 	drm_bridge_put(bridge_connector->bridge_hdmi_audio);
 	drm_bridge_put(bridge_connector->bridge_dp_audio);
 	drm_bridge_put(bridge_connector->bridge_hdmi_cec);
+	drm_bridge_put(bridge_connector->bridge_dp);
 }
 
 /**
@@ -968,6 +977,15 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			bridge_connector->bridge_hdmi_audio = drm_bridge_get(bridge);
 		}
 
+		if (bridge->ops & DRM_BRIDGE_OP_DP) {
+			if (bridge_connector->bridge_dp)
+				return ERR_PTR(-EBUSY);
+			if (!bridge->dp_link_caps)
+				return ERR_PTR(-EINVAL);
+
+			bridge_connector->bridge_dp = drm_bridge_get(bridge);
+		}
+
 		if (bridge->ops & DRM_BRIDGE_OP_DP_AUDIO) {
 			if (bridge_connector->bridge_dp_audio)
 				return ERR_PTR(-EBUSY);
@@ -1079,6 +1097,17 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 					       connector_type, ddc);
 		if (ret)
 			return ERR_PTR(ret);
+	} else if (bridge_connector->bridge_dp) {
+		ret = drmm_connector_init(drm, connector,
+					  &drm_bridge_connector_funcs,
+					  connector_type, ddc);
+		if (ret)
+			return ERR_PTR(ret);
+
+		ret = drm_dp_source_set_caps(connector,
+					     bridge_connector->bridge_dp->dp_link_caps);
+		if (ret)
+			return ERR_PTR(ret);
 	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 1981d24a700d2..d1430b2b72518 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1021,6 +1021,14 @@ enum drm_bridge_ops {
 	 * &drm_bridge_funcs->hdmi_clear_spd_infoframe callbacks.
 	 */
 	DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME = BIT(10),
+	/**
+	 * @DRM_BRIDGE_OP_DP: The bridge provides DisplayPort connector
+	 * operations, including link training support. Bridges that set
+	 * this flag must provide DisplayPort-related information and
+	 * fill the &drm_bridge->dp_link_caps link training
+	 * capabilities.
+	 */
+	DRM_BRIDGE_OP_DP = BIT(11),
 };
 
 /**
@@ -1214,6 +1222,11 @@ struct drm_bridge {
 	 */
 	void *hpd_data;
 
+	/**
+	 * @dp_link_caps: DisplayPort link capabilities
+	 */
+	const struct drm_connector_dp_link_caps *dp_link_caps;
+
 	/**
 	 * @next_bridge: Pointer to the following bridge, automatically put
 	 * when this bridge is freed (i.e. at destroy time). This is for

-- 
2.43.0


