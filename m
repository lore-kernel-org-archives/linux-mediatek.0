Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FE2CF34AB
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Nov 2025 13:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEF9xZ8+PeSfk7CL/9gwgHJWA1O+EMNXV1ratkXqO+s=; b=F451uGoJlBe6i1440t6Kan51CI
	or0FKL36bNSVUQ+C3w9UzyOFp1YKSnn8W/V456Q61WQoc1EbQDyxpR8Ai9wj8Zo86e6RZaSYN+EwB
	VMIJZHmhG0BJGtBjgFfwsn9qY/GBrOUugWxO4Axf0ufFNwTFUWcjJ2MwCHJp882+EakQi4Wtj5sqk
	sVh2Oype4Q50yV10PCn8FTBoTrjaisY8/+eFGIbb7fPvHLaa5Nyc7Y5VPanKbAX+WTwdQ0oWrtYTm
	fCZ4oq9dmQ0K5uVkuT7lcuW+zj38pTw1+pNYkRkczndl8hRVxi2jdFH8t3bDRZthFEpKlbwS9HzTV
	Un4f87ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLht0-00000003DqV-1JUg;
	Wed, 19 Nov 2025 13:06:14 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhsx-00000003Dnd-1xT5
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Nov 2025 13:06:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 103D81A1BDE;
	Wed, 19 Nov 2025 13:06:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D02F060720;
	Wed, 19 Nov 2025 13:06:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04E9E10371A50;
	Wed, 19 Nov 2025 14:05:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763557567; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oEF9xZ8+PeSfk7CL/9gwgHJWA1O+EMNXV1ratkXqO+s=;
	b=AkgPy5yhw0AuO19ZuOS3zmP0YzmfT3oYUSz6fPbTCQlP/kCukV7pfya+N58TpLjpOaa7WJ
	pC7T9UmhklSb7a/TBMlCTyGZl4vFGO2vT2P1bRUzoGwjYZtxmrNlbadTbnJOsTKhhG/ZNa
	faraoY/nRl5NlCWf4FFDQQd6PGzi5Ki8cal5DGlQBnyund+cY9BnNMpjLfp/tkqRrb6Tix
	eQ2mc9WLqDI16oYvUnAXTW2XfUsGWAkjJnKybZ20HDhylZHW/UTeY0jYaDhHmZcOZed3zl
	Hrn4jgImlX+GGuBiu8RLtSQTFQtojubp9S0VUcaO4LeETgTfxvYSap4RRF4lVg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 19 Nov 2025 14:05:32 +0100
Subject: [PATCH 01/26] drm/bridge: add drm_of_find_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-1-0db98a7fe474@bootlin.com>
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
In-Reply-To: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_050611_655199_64BF2FA1 
X-CRM114-Status: GOOD (  15.11  )
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

of_drm_find_bridge() does not increment the refcount for the returned
bridge, but that is required now. However converting it and all its users
is not realistically doable at once given the large amount of (direct and
indirect) callers and the complexity of some. Also, "of_drm_find_bridge is
oddly named according to our convention and it would make more sense to be
called drm_of_find_bridge()" (quoted from Link: below).

Solve both issues by creating a new drm_of_find_bridge() that is identical
to of_drm_find_bridge() except it takes a reference. Then
of_drm_find_bridge() will be deprecated to be eventually removed.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad@houat/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Note: a simple implementation would just be
  { return drm_bridge_get(of_drm_find_bridge(np)); }
but it would release the mutex before getting the reference, so it is
not safe. Make things simple by duplicating the code. A later patch will
make instead the (to be deprecated) of_drm_find_bridge() become a wrapper
of the new drm_of_find_bridge()
---
 drivers/gpu/drm/drm_bridge.c | 29 +++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     |  5 +++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 8f355df883d8..d98a7b4a83c0 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1417,6 +1417,35 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
 
 #ifdef CONFIG_OF
+/**
+ * drm_of_find_bridge - find the bridge corresponding to the device node in
+ *			the global bridge list
+ * @np: device node
+ *
+ * The refcount of the returned bridge is incremented. Use drm_bridge_put()
+ * when done with it.
+ *
+ * RETURNS:
+ * drm_bridge control struct on success, NULL on failure
+ */
+struct drm_bridge *drm_of_find_bridge(struct device_node *np)
+{
+	struct drm_bridge *bridge;
+
+	mutex_lock(&bridge_lock);
+
+	list_for_each_entry(bridge, &bridge_list, list) {
+		if (bridge->of_node == np) {
+			mutex_unlock(&bridge_lock);
+			return drm_bridge_get(bridge);
+		}
+	}
+
+	mutex_unlock(&bridge_lock);
+	return NULL;
+}
+EXPORT_SYMBOL(drm_of_find_bridge);
+
 /**
  * of_drm_find_bridge - find the bridge corresponding to the device node in
  *			the global bridge list
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 0ff7ab4aa868..e74e91004c48 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1313,8 +1313,13 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		      enum drm_bridge_attach_flags flags);
 
 #ifdef CONFIG_OF
+struct drm_bridge *drm_of_find_bridge(struct device_node *np);
 struct drm_bridge *of_drm_find_bridge(struct device_node *np);
 #else
+static inline struct drm_bridge *drm_of_find_bridge(struct device_node *np)
+{
+	return NULL;
+}
 static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 {
 	return NULL;

-- 
2.51.1


