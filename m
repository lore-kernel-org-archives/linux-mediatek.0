Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D1CCF34AB
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Nov 2025 13:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=axXT5p39UcLgfeXlnv3r+PQb3eCsVz2C9lrKQC2f4Uk=; b=qsiXOx7aIbPYKFQH4YaIauKhjN
	6XTCmGgWnh8PWfHX0Yq6K8SHxASOV76JL/6H9V0SBfFce3Ud0Epa+K9tRdfI8wRR56yNZiSz/G3wi
	xL5FWxDYqsIf76z8TSh1Ipcdhq+sSN359jPs9L4vj3c6ZO571rSi6WUBAroo3cZdoNE0vdy6yOvIt
	pAB7mTnH2rjD8LUwVmqEKq+XcZQc6Sz+Y6V+XfEvdc+GVkgk6LBtX4V1sZaiiYLw2KTiJZucyYpdY
	0bckFHhTrx4fSVAQWG5PLwB29KX0siB5+oMXGX7pSnGMVc4Jg/e5E1+QS/OwYaLVqhh0Q5XGY9KYg
	0gBy2CMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhwc-00000003Fqc-0oEA;
	Wed, 19 Nov 2025 13:09:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhwZ-00000003FpY-43Ms;
	Wed, 19 Nov 2025 13:09:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=axXT5p39UcLgfeXlnv3r+PQb3eCsVz2C9lrKQC2f4Uk=; b=f1o7TEU5+1xe/PI08bEvroku1t
	ZkujTNMjgbUPeIOXnS9FZXW/ntzgLk03GstDZh1ew+wGDZgv8wNyTS9b/57RdYSe6Li0rQDN78jwo
	zbiPs+/d70Kp8spuiYz3aGh6uZufaCouF75ptcx1t5GNmTvqAtYE2BAB9fiRxi0IoZrxupRipeM6s
	YjHQIhhTiEf6PgbPvAW9ZlM30i44Vr4KfvZtnbKFbLfMLKnXdh4UvHkAMge298l6lAb9kG6iJrgJN
	inadWNa+WRM4vX40eOl0sQ2S6ifb11I1d8iqm7fev9O77gs8L//rY4uOYZbF2aSDoQO5iNi7Qp3kk
	Ib7wRWdg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLh4t-0000000CAra-3XW7;
	Wed, 19 Nov 2025 12:14:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5E7214E4179C;
	Wed, 19 Nov 2025 13:09:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F04860699;
	Wed, 19 Nov 2025 13:09:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2F8810371A53;
	Wed, 19 Nov 2025 14:09:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763557790; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=axXT5p39UcLgfeXlnv3r+PQb3eCsVz2C9lrKQC2f4Uk=;
	b=OlX/PF+dhNGJG27mrsK1i4MNguYEVaaiKq83NP0yOr041d9TgIxWfbA2GyldpQEAfPLd3J
	wNbvXQz9oBqELh/fqHBdK3mPbEJ3JKZLLabdZdqhqGE7GiQMZKWviSVNIdzuN1DuSJ9D6O
	ji63oyId+HMuMeLvrrbb9/FhGf8/Vn2JH5T3bED5Ab473KCMMc1GmDK6PMlKKy03bJn35W
	CR9esGIgCRwjBUdDQ8G/Q3ByDThJhNj95m+NHds8C3IrJVQlptjCCcIy0X+k2qNcCYxnYs
	7W0XT05zHAApmNT3EVv8sRDwLVGvyuBhAK9DAMINTmHuHkuNsVeo/QElxQso7A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 19 Nov 2025 14:05:57 +0100
Subject: [PATCH 26/26] drm/bridge: imx8qxp-pixel-link: convert to
 drm_of_find_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-26-0db98a7fe474@bootlin.com>
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
X-CRM114-CacheID: sfid-20251119_121428_118644_27A9A34D 
X-CRM114-Status: GOOD (  17.49  )
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

of_drm_find_bridge() is deprecated. Move to its replacement
drm_of_find_bridge() which gets a bridge reference, and put it when done.

This needs to be handled in various steps:

 * the bridge returned drm_of_find_bridge() is stored in next_bridge whose
   scope is the for loop, so a cleanup action is enough
 * the value of next_bridge is copied into selected_bridge, potentially
   more than once, so a cleanup action at function scope is useful here too
 * however on successful return selected_bridge must be returned and
   ultimately stored, so it should not be put in that case: use
   return_ptr() to defuse the cleanup action on successful return
 * finally, put the bridge reference on device remove

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 2ecc3c1051e5..9818239cf6e7 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -256,12 +256,13 @@ static int imx8qxp_pixel_link_disable_all_controls(struct imx8qxp_pixel_link *pl
 	return imx8qxp_pixel_link_disable_sync(pl);
 }
 
+/* The returned bridge has its refcount incremented */
 static struct drm_bridge *
 imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 {
 	struct device_node *np = pl->dev->of_node;
 	struct device_node *port;
-	struct drm_bridge *selected_bridge = NULL;
+	struct drm_bridge *selected_bridge __free(drm_bridge_put) = NULL;
 	u32 port_id;
 	bool found_port = false;
 	int reg;
@@ -298,7 +299,7 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 			continue;
 		}
 
-		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
+		struct drm_bridge *next_bridge __free(drm_bridge_put) = drm_of_find_bridge(remote);
 		if (!next_bridge)
 			return ERR_PTR(-EPROBE_DEFER);
 
@@ -306,13 +307,15 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 		 * Select the next bridge with companion PXL2DPI if
 		 * present, otherwise default to the first bridge
 		 */
-		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi"))
-			selected_bridge = next_bridge;
+		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi")) {
+			drm_bridge_put(selected_bridge);
+			selected_bridge = drm_bridge_get(next_bridge);
+		}
 	}
 
 	pl->mst_addr = port_id - 1;
 
-	return selected_bridge;
+	return_ptr(selected_bridge);
 }
 
 static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
@@ -392,6 +395,7 @@ static void imx8qxp_pixel_link_bridge_remove(struct platform_device *pdev)
 	struct imx8qxp_pixel_link *pl = platform_get_drvdata(pdev);
 
 	drm_bridge_remove(&pl->bridge);
+	drm_bridge_put(pl->next_bridge);
 }
 
 static const struct of_device_id imx8qxp_pixel_link_dt_ids[] = {

-- 
2.51.1


