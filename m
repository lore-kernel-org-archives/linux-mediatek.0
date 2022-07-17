Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E39C43334
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Jul 2022 17:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xMDkuUfPGn0o735pjsKmzPk0fBw5yBNOtUUSLza8y8=; b=gLlXQlX84PKW0aOSgVDula+yeY
	2avkbaN1+v4UPL7Xk9BPxjtNq1+eK1KpwOGd5mrH8e0T196r2PaPvZBkNHAH+c+HOs9wgZtMGrbVA
	ueTbQPiJxXJekdW5GraECVX/kVmVOB7yCmUg0rRVYN32IyiVg3xT7y5Wv+rCUNZg23eZczkvJJsR3
	o7bPisRagXGE0gVOnoZ8zr3kqZg4T2Z8T5ItK3XoXC6WQpKWK3Nm6dirp3AWxpsXRmmp5RmgmVYgj
	CbueD4mmySOMLdxeg5e0ZCMNe3XyBiVABbdeDM0Zg1s8SAvkkJ+xUC4i4D95n4cAyppodOSrh0pqj
	/Emms4xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD8XP-007xtR-4b; Sun, 17 Jul 2022 17:58:39 +0000
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com ([46.30.210.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD8X3-007xjk-3q
	for linux-mediatek@lists.infradead.org; Sun, 17 Jul 2022 17:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=8xMDkuUfPGn0o735pjsKmzPk0fBw5yBNOtUUSLza8y8=;
	b=aoi4B6bMH3Cqlb15Pt+qz0yBgpA74ySyu5WsJzQLwhx5nXceezPGoNu2Dqm1PJmOVmPfMNmxT8+8h
	 0Z8/JDQXKMg5v/f8+33EPObPtz1JjmoIBjNYH9+G06LdnT2ou2XsjpoEZ4OfqrlHYKAU1oX/v5+Luz
	 7SzvdZPdevTuMpVnkjvrPHOkAfai+pByhDs9StAky2XNzasryvXV076zl6t+g/jFbpF2S2pwUmZAH3
	 PkK/hbcyi9sLuRsnXX8sX9tBeK09kP/oW35yL5r/9rOuLbWdtgL8BG03YWgXvHVz/i+PkmDkViwUFv
	 a+pBpQwd7vsayyeD4gKIwygIJU1cvUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=8xMDkuUfPGn0o735pjsKmzPk0fBw5yBNOtUUSLza8y8=;
	b=wNVu+OQTZtFBwr05sqKFwWIn3xsPomNIVKtIlMY7HEFSLGeaKUoEF2OW6IeHdYoYe+yv3O5YQE2zM
	 tjk/AzvAA==
X-HalOne-Cookie: cb254aee6c7ec574bf0b0b704723fae5f8c7f5e7
X-HalOne-ID: 0789e88e-05fa-11ed-be7f-d0431ea8bb03
Received: from mailproxy1.cst.dirpod4-cph3.one.com (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 0789e88e-05fa-11ed-be7f-d0431ea8bb03;
	Sun, 17 Jul 2022 17:58:15 +0000 (UTC)
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
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v1 09/12] drm/rcar-du: lvds: Use drm_bridge_funcs.atomic_check
Date: Sun, 17 Jul 2022 19:57:58 +0200
Message-Id: <20220717175801.78668-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220717175801.78668-1-sam@ravnborg.org>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717175801.78668-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_105817_327472_74C9903E 
X-CRM114-Status: GOOD (  12.63  )
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

Replace the deprecated drm_bridge_funcs.mode_fixup() with
drm_bridge_funcs.atomic_check().
The driver implements the state operations, so no other changes
are required for the replacement.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 830aac0a2cb4..c4adbcede090 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -554,10 +554,12 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
 	clk_disable_unprepare(lvds->clocks.mod);
 }
 
-static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
-				 const struct drm_display_mode *mode,
-				 struct drm_display_mode *adjusted_mode)
+static int rcar_lvds_atomic_check(struct drm_bridge *bridge,
+				  struct drm_bridge_state *bridge_state,
+				  struct drm_crtc_state *crtc_state,
+				  struct drm_connector_state *conn_state)
 {
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
 	int min_freq;
 
@@ -569,7 +571,7 @@ static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
 	min_freq = lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL ? 5000 : 31000;
 	adjusted_mode->clock = clamp(adjusted_mode->clock, min_freq, 148500);
 
-	return true;
+	return 0;
 }
 
 static int rcar_lvds_attach(struct drm_bridge *bridge,
@@ -591,7 +593,7 @@ static const struct drm_bridge_funcs rcar_lvds_bridge_ops = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_enable = rcar_lvds_atomic_enable,
 	.atomic_disable = rcar_lvds_atomic_disable,
-	.mode_fixup = rcar_lvds_mode_fixup,
+	.atomic_check = rcar_lvds_atomic_check,
 };
 
 bool rcar_lvds_dual_link(struct drm_bridge *bridge)
-- 
2.34.1


