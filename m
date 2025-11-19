Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D182CF34A1
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Nov 2025 13:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6WNrs9Y6V3IsNLzdFtu7YCg0CGh4zNPN+hLyMO6Fv8=; b=YPz0Mz59uOHqsBhs3//tQ5dH+X
	MEq/aWVTHfeoSafiV8aXsan8a9eBsm7tT5edOCyOIdywjgI13hosrmQKj3BlUncs8mElSi/Onq5dU
	DVXZEDx7ExzIbH6yHGtq/kVHJzG6tnLFfmYKL6PYpQl+Vw+2JokANsio2OPhdwjFhnspqthv7EK/W
	6Gw5cbWxE1sZMyZcG01JZpSnQP4ZdywKGw5ikOXF8frz5bjEEDjI1GJKRMQ5UU/uw52BcDCQesjPp
	KxjsmxBJ6m2Z8xgayNiY+L+4D7wmDS59pME+HN85KT+9KZ0HGMsCB2VJX3WtOm0tEO2oIs0STPFSf
	6pb6IOkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhtk-00000003EKA-0ChV;
	Wed, 19 Nov 2025 13:07:00 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhtf-00000003EGf-3CqI
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Nov 2025 13:06:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 581CA4E4179C;
	Wed, 19 Nov 2025 13:06:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D36F60720;
	Wed, 19 Nov 2025 13:06:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B60E410371A4D;
	Wed, 19 Nov 2025 14:06:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763557612; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a6WNrs9Y6V3IsNLzdFtu7YCg0CGh4zNPN+hLyMO6Fv8=;
	b=Wbwzn0uVxzL0e/KdCS6XpEu2u22Bhj89nT+j8V+lPOjs5nB08HSlWeIApMk5lqJTqTx0O8
	9a5kGAyCI0h3tBIL8GeAcGlzc0wiypsysOh5/bTgohaGSpK/RcIzB2QSLjN3z7w7CSPZM1
	cM4BGVsG3eh7Tde1ClKXPAce/5EIU5PYIfS7SFSnZMXIk6yiqFYu9m27WJGMB+JzN8Zh2P
	quo7b5H7V2VwfrAeEsKpGgEDayBJtAZF4iG5+3Q8xtiLzu1eFF4eWL6V54/8JN+uRhynPR
	JnW87vN4WO5iAWPI0jGeBK1k5B58PyuUE/mB32X4RBtSbbm9g6gPzztHbAeBPQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 19 Nov 2025 14:05:37 +0100
Subject: [PATCH 06/26] drm/bridge: add devm_drm_of_find_bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-6-0db98a7fe474@bootlin.com>
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
X-CRM114-CacheID: sfid-20251119_050656_098314_DE48A684 
X-CRM114-Status: GOOD (  20.44  )
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

Several drivers (about 20) follow the same pattern:

 1. get a pointer to a bridge (typically the next bridge in the chain) by
    calling of_drm_find_bridge()
 2. store the returned pointer in the private driver data, keep it until
    driver .remove
 3. dereference the pointer at attach time and possibly at other times

of_drm_find_bridge() is now deprecated because it does not increment the
refcount and should be replaced with drm_of_find_bridge() +
drm_bridge_put().

However some of those drivers have a complex code flow and adding a
drm_bridge_put() call in all the appropriate locations is error-prone,
leads to ugly and more complex code, and can lead to errors over time with
code flow changes.

To handle all those drivers in a straightforward way, add a devm variant of
drm_of_find_bridge() that adds a devm action to invoke drm_bridge_put()
when the said driver is removed. This allows all those drivers to put the
reference automatically and safely with a one line change:

  - priv->next_bridge = of_drm_find_bridge(remote_np);
  + priv->next_bridge = devm_drm_of_find_bridge(dev, remote_np);

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 30 ++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     |  5 +++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 09ad825f9cb8..c7baafbe5695 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1446,6 +1446,36 @@ struct drm_bridge *drm_of_find_bridge(struct device_node *np)
 }
 EXPORT_SYMBOL(drm_of_find_bridge);
 
+/**
+ * devm_drm_of_find_bridge - find the bridge corresponding to the device
+ *			     node in the global bridge list and add a devm
+ *			     action to put it
+ *
+ * @dev: device requesting the bridge
+ * @np: device node
+ *
+ * On success the returned bridge refcount is incremented, and a devm
+ * action is added to call drm_bridge_put() when @dev is removed. So the
+ * caller does not have to put the returned bridge explicitly.
+ *
+ * RETURNS:
+ * drm_bridge control struct on success, NULL on failure
+ */
+struct drm_bridge *devm_drm_of_find_bridge(struct device *dev, struct device_node *np)
+{
+	struct drm_bridge *bridge = drm_of_find_bridge(np);
+
+	if (bridge) {
+		int err = devm_add_action_or_reset(dev, drm_bridge_put_void, bridge);
+
+		if (err)
+			return ERR_PTR(err);
+	}
+
+	return bridge;
+}
+EXPORT_SYMBOL(devm_drm_of_find_bridge);
+
 /**
  * of_drm_find_bridge - find the bridge corresponding to the device node in
  *			the global bridge list
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index e74e91004c48..98d5433f7d35 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1314,12 +1314,17 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 
 #ifdef CONFIG_OF
 struct drm_bridge *drm_of_find_bridge(struct device_node *np);
+struct drm_bridge *devm_drm_of_find_bridge(struct device *dev, struct device_node *np);
 struct drm_bridge *of_drm_find_bridge(struct device_node *np);
 #else
 static inline struct drm_bridge *drm_of_find_bridge(struct device_node *np)
 {
 	return NULL;
 }
+static inline struct drm_bridge *devm_drm_of_find_bridge(struct device *dev, struct device_node *np)
+{
+	return NULL;
+}
 static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 {
 	return NULL;

-- 
2.51.1


