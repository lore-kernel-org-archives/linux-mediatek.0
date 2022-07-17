Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC8FC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Jul 2022 17:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fr26D2ca3PHdfYt82xP4O3qHYRqQcjO5dKvaWIOgNBE=; b=M6zt218FINXc1OWCLN0zGiCHwJ
	FLPtR0udkkmJxqRVTO6kgYngJBrHggIFB3kmL0AriWRCogaVjpXP1kNcgEF45GriWbq2Qtw9AJZeS
	6i2utdMTustnc/2zoheFX+sVDX2xPUxSbuPhJVyOuGsPwwT3TDDEiHaHqvwRUELlNWHPyfg4ioVkm
	TOxuPqWoR/xugCoug70oLrhMBsgsvKekQKUi85WLKAxc32sMIuUKX7vxtg7iCnutu9We+Y5Hfnex+
	n7H92Ju2eyDayt8hgw/ru22ivIwC0YsbEfds9LN0fWzMv+VFUCkNFuDpBqbvlPFv74E9/X9VEesPp
	Vaj/23Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD8Ld-007tKr-M5; Sun, 17 Jul 2022 17:46:29 +0000
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com ([46.30.210.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD8KV-007smO-7k
	for linux-mediatek@lists.infradead.org; Sun, 17 Jul 2022 17:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=Fr26D2ca3PHdfYt82xP4O3qHYRqQcjO5dKvaWIOgNBE=;
	b=JSzummkp8PX0dmwtxN7hkOfqVk7KPXZXT7dncb2h2pW3SYrZ/UfnCOkF4nppkRoKbtxjnWZwl2gnJ
	 FeSMcCKfdkQ4EK7Y6LYEeJr5oWd+ugr7K8yF14/xdIE5VNrJWK674ChkoxvC+lN5mB5m2qcpZOQ1aJ
	 ek8Ws35wRL8qerXjhvihzyUYJOQ6xKVMIUIJ649yQgXsIUKJ2pBxE6q48HqA+yODr0tIwUTCV16qbz
	 yvq8byD+gr3niIpINXHUXMCOOFzfCID9YqSSnAAA5XPmJP5ikuQ6syRVMiAoXRxUwphkz01y+rPKxA
	 9w/kYQVbMh9QwmGl2ugD1ltNGVQyh0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=Fr26D2ca3PHdfYt82xP4O3qHYRqQcjO5dKvaWIOgNBE=;
	b=bp33bWHdJ/F16zfPQlZFJBx92uYHy/9BWgyz/kR+lggXBSx57hYIjg8TJIbpKYHWB1EyGye2UDt18
	 DYaeHfzBQ==
X-HalOne-Cookie: 31248d9cf3a18da4ee56357dc78f2dda447207e8
X-HalOne-ID: 35c44d3c-05f8-11ed-823f-d0431ea8bb10
Received: from mailproxy1.cst.dirpod4-cph3.one.com (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 35c44d3c-05f8-11ed-823f-d0431ea8bb10;
	Sun, 17 Jul 2022 17:45:13 +0000 (UTC)
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
Subject: [PATCH v1 05/12] drm/bridge: sii8620: Use drm_bridge_funcs.atomic_check
Date: Sun, 17 Jul 2022 19:44:47 +0200
Message-Id: <20220717174454.46616-6-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220717174454.46616-1-sam@ravnborg.org>
References: <20220717174454.46616-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_104519_493438_73881343 
X-CRM114-Status: GOOD (  12.57  )
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

drm_bridge_funcs.atomic_check() requires the atomic state operations,
update these to the default implementations.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/bridge/sil-sii8620.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index ab0bce4a988c..b6e5c285c8ea 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -8,6 +8,7 @@
 
 #include <asm/unaligned.h>
 
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/bridge/mhl.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
@@ -2262,26 +2263,30 @@ static enum drm_mode_status sii8620_mode_valid(struct drm_bridge *bridge,
 	}
 }
 
-static bool sii8620_mode_fixup(struct drm_bridge *bridge,
-			       const struct drm_display_mode *mode,
-			       struct drm_display_mode *adjusted_mode)
+static int sii8620_atomic_check(struct drm_bridge *bridge,
+				struct drm_bridge_state *bridge_state,
+				struct drm_crtc_state *crtc_state,
+				struct drm_connector_state *conn_state)
 {
 	struct sii8620 *ctx = bridge_to_sii8620(bridge);
 
 	mutex_lock(&ctx->lock);
 
-	ctx->use_packed_pixel = sii8620_is_packing_required(ctx, adjusted_mode);
+	ctx->use_packed_pixel = sii8620_is_packing_required(ctx, &crtc_state->adjusted_mode);
 
 	mutex_unlock(&ctx->lock);
 
-	return true;
+	return 0;
 }
 
 static const struct drm_bridge_funcs sii8620_bridge_funcs = {
 	.attach = sii8620_attach,
 	.detach = sii8620_detach,
-	.mode_fixup = sii8620_mode_fixup,
+	.atomic_check = sii8620_atomic_check,
 	.mode_valid = sii8620_mode_valid,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
 static int sii8620_probe(struct i2c_client *client,
-- 
2.34.1


