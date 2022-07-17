Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD55BC43334
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Jul 2022 17:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfH9Qs5wD3KTt5THnRe+Ywjg0HUrKrXd9QuokU8dlm0=; b=Z18CRiepw5FVejxuKQPtpy3Uhd
	STIagKdAVok79XPbYAayiJtWgY/PE4qqu0MsNZhf0LXzRcCYiTpXyMcN3mDu1dx6kg7GaacqoqgQM
	2I/cTmHd/K7Kv4idO2mVVOetDcja4QiZ9tl0aYgs9tF62U+OdDH6Z/rG4m+ZnKOfczLctGmjlRklD
	N1Dar5o8LFsLGhTVhgZU5T4rYqaEJmLEkJflVRl+1XSnNFuC16rxQzIdOKuk+ALlDyLoGfygIBkQh
	2hYe+j5Fp8L6f+apNPqMtyGt72sWiOG3UQBJhc0om13Gdrmz+Mwae9gglxLefDR1qNOHyXvFP0JFS
	B237dBxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD8Lk-007tPT-GS; Sun, 17 Jul 2022 17:46:36 +0000
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com ([46.30.210.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD8KW-007snk-R0
	for linux-mediatek@lists.infradead.org; Sun, 17 Jul 2022 17:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=AfH9Qs5wD3KTt5THnRe+Ywjg0HUrKrXd9QuokU8dlm0=;
	b=Whtuk9yCXNltyVJGmT82ZE4RWmxFP7coq6NApU3N75TVhXACkuISqTzMPgwY3klO2WNeY+jCl3zVT
	 cvHoial7JYydrOcg9fv+SqI0Sd+rk+osanLTDy7He13QxZuomFQuS4At/XvbMfYdloXKi3a6dWHtmh
	 K9ebjOe3pMxB2vMUKtvscXqEx34W8uUULIqlxt8SWUhNWHHjCZo9tQMNSTkTvfhyWVrUk/VjFcYQET
	 U7jPe2MjAjdMAP4WCXCbCltkT1fTYo0VEtBqG5iB6Mr+c91FFX4YsupMFADh1X9H58XNT9iuHp5bIN
	 ghBXg1IPcvLuRMEY15JCJsCqziMtLFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=AfH9Qs5wD3KTt5THnRe+Ywjg0HUrKrXd9QuokU8dlm0=;
	b=GmKuQ7a3DwmGvbT3CzG3kUtioZ1YWa2gzXDCeVLowhKKayjpOz3rDyS2iPsoetCSiHFRqO12MrH2e
	 5ipeInWBg==
X-HalOne-Cookie: 281e936c87613b4ea5f8a9a665e5e773c0d67fb2
X-HalOne-ID: 3745decf-05f8-11ed-823f-d0431ea8bb10
Received: from mailproxy1.cst.dirpod4-cph3.one.com (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 3745decf-05f8-11ed-823f-d0431ea8bb10;
	Sun, 17 Jul 2022 17:45:16 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Robert Foss <robert.foss@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Benson Leung <bleung@chromium.org>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	chrome-platform@lists.linux.dev,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@linux.ie>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Philip Chen <philipchen@chromium.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sam Ravnborg <sam@ravnborg.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 07/12] drm/bridge: tc358767: Use drm_bridge_funcs.atomic_check
Date: Sun, 17 Jul 2022 19:44:49 +0200
Message-Id: <20220717174454.46616-8-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220717174454.46616-1-sam@ravnborg.org>
References: <20220717174454.46616-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_104521_099677_E48136DF 
X-CRM114-Status: GOOD (  11.50  )
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

When atomic_check() is defined, then mode_fixup() is ignored,
so it had no effect that drm_bridge_funcs.mode_fixup was assigned.
Embed the original implementation in the caller and drop the function.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 02bd757a8987..b2ab967504af 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1496,26 +1496,18 @@ tc_edp_bridge_atomic_disable(struct drm_bridge *bridge,
 		dev_err(tc->dev, "main link disable error: %d\n", ret);
 }
 
-static bool tc_bridge_mode_fixup(struct drm_bridge *bridge,
-				 const struct drm_display_mode *mode,
-				 struct drm_display_mode *adj)
-{
-	/* Fixup sync polarities, both hsync and vsync are active low */
-	adj->flags = mode->flags;
-	adj->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
-	adj->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
-
-	return true;
-}
-
 static int tc_common_atomic_check(struct drm_bridge *bridge,
 				  struct drm_bridge_state *bridge_state,
 				  struct drm_crtc_state *crtc_state,
 				  struct drm_connector_state *conn_state,
 				  const unsigned int max_khz)
 {
-	tc_bridge_mode_fixup(bridge, &crtc_state->mode,
-			     &crtc_state->adjusted_mode);
+	struct drm_display_mode *adj = &crtc_state->adjusted_mode;
+
+	/* Fixup sync polarities, both hsync and vsync are active low */
+	adj->flags = crtc_state->mode.flags;
+	adj->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+	adj->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
 
 	if (crtc_state->adjusted_mode.clock > max_khz)
 		return -EINVAL;
@@ -1783,7 +1775,6 @@ static const struct drm_bridge_funcs tc_edp_bridge_funcs = {
 	.atomic_check = tc_edp_atomic_check,
 	.atomic_enable = tc_edp_bridge_atomic_enable,
 	.atomic_disable = tc_edp_bridge_atomic_disable,
-	.mode_fixup = tc_bridge_mode_fixup,
 	.detect = tc_bridge_detect,
 	.get_edid = tc_get_edid,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
-- 
2.34.1


