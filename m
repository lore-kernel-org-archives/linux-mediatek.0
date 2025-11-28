Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6B2D116F1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Nov 2025 16:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xY2ofXoGQhkxcQSEXj3JcIw9s5fwbRbm+biYrRLlQeM=; b=osSCSslJCTwEJ6fFjvS6JUcJVe
	M9gWbOc9eb/sNx0Z5Q5HACX8/qXIPS30wUrFPGzdWACB4PNOZd/ZMa0mYV7AtkGoImFdwnQValXJr
	gHAWFmzaa2o23Y1EwcwWGArAwLNDyxX2+4iTj/T+yljD3qV4dO6OTBw4IPhO7li1yaNPGv5vWnscz
	+jZIAKDnZf4nrTuBRhkYlmsvYpmgCqu0zEOZTzpezsuBweU7biIv5VGOMy6PD4ywKPu8DNgPHcIOf
	jpmzmGuQ3lo3b8SGL6tcAXQ/UJaBt7X2h8rYaywf40h5gAFutWL3oREca6VqVFRTEGOUO6mjEvDFF
	LOsTgnhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1iF-00000000f68-06Kt;
	Fri, 28 Nov 2025 16:52:51 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1iA-00000000f28-2U00;
	Fri, 28 Nov 2025 16:52:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9D172C16A3C;
	Fri, 28 Nov 2025 16:52:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 87E9D60706;
	Fri, 28 Nov 2025 16:52:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1009910B02155;
	Fri, 28 Nov 2025 17:52:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764348762; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xY2ofXoGQhkxcQSEXj3JcIw9s5fwbRbm+biYrRLlQeM=;
	b=D9SPrZQmQfsfSxVbGR+pwv3gviqhxSdWmav5IWju8BOBdF1lGyaPh4I68aJac3CHyvbmCR
	xC+BaiLIpef6bnSe4czCRlm6hOy4g1r6spxJmmnkSC71kqqeyVqbSXNNoyUHuhkwAnlnrq
	YiQ5mlF3oiU4W9y1EdpSgW0NZmUVZsnsLvREUscdwINbFYUQf8lVH/uDovhtQLDPK+UxrH
	7ppyE5A3DM8VFejWx+CAdzSQCeY912uXF7DC2gvluWw94Xwewk2y/qw7uYsCyktC6XCtsb
	cDlXYTUTVJvHwZXYaAFIP6ApTsR118MyQ0obvDW7fqNBp3FxCkomcEwJpBF3FA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 28 Nov 2025 17:50:16 +0100
Subject: [PATCH v2 06/26] drm/bridge: add devm_of_drm_get_bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-6-88f8a107eca2@bootlin.com>
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
In-Reply-To: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
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
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_085246_974636_0B8F1727 
X-CRM114-Status: GOOD (  20.01  )
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
refcount and should be replaced with of_drm_get_bridge() +
drm_bridge_put().

However some of those drivers have a complex code flow and adding a
drm_bridge_put() call in all the appropriate locations is error-prone,
leads to ugly and more complex code, and can lead to errors over time with
code flow changes.

To handle all those drivers in a straightforward way, add a devm variant of
of_drm_get_bridge() that adds a devm action to invoke drm_bridge_put()
when the said driver is removed. This allows all those drivers to put the
reference automatically and safely with a one line change:

  - priv->next_bridge = of_drm_find_bridge(remote_np);
  + priv->next_bridge = devm_of_drm_get_bridge(dev, remote_np);

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v2:
- fix return value: NULL on error, as documented, not an ERR_PTR
---
 drivers/gpu/drm/drm_bridge.c | 28 ++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     |  5 +++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 9b7e3f859973..59575a84eff6 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1442,6 +1442,34 @@ struct drm_bridge *of_drm_get_bridge(struct device_node *np)
 }
 EXPORT_SYMBOL(of_drm_get_bridge);
 
+/**
+ * devm_of_drm_get_bridge - find the bridge corresponding to the device
+ *			    node in the global bridge list and add a devm
+ *			    action to put it
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
+struct drm_bridge *devm_of_drm_get_bridge(struct device *dev, struct device_node *np)
+{
+	struct drm_bridge *bridge = of_drm_get_bridge(np);
+
+	if (bridge) {
+		if (devm_add_action_or_reset(dev, drm_bridge_put_void, bridge))
+			return NULL;
+	}
+
+	return bridge;
+}
+EXPORT_SYMBOL(devm_of_drm_get_bridge);
+
 /**
  * of_drm_find_bridge - find the bridge corresponding to the device node in
  *			the global bridge list
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 0977eab78aac..da69cb252cad 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1314,12 +1314,17 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 
 #ifdef CONFIG_OF
 struct drm_bridge *of_drm_get_bridge(struct device_node *np);
+struct drm_bridge *devm_of_drm_get_bridge(struct device *dev, struct device_node *np);
 struct drm_bridge *of_drm_find_bridge(struct device_node *np);
 #else
 static inline struct drm_bridge *of_drm_get_bridge(struct device_node *np)
 {
 	return NULL;
 }
+static inline struct drm_bridge *devm_of_drm_get_bridge(struct device *dev, struct device_node *np)
+{
+	return NULL;
+}
 static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 {
 	return NULL;

-- 
2.51.1


