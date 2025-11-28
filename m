Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035F0D116F1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Nov 2025 16:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4KsAxr99sySjsHY4TzPD3tHVsqK24nvaf2pqUbhtfhE=; b=we4SXTN1l9j3aURXDgV5JrOJiB
	r3ifzsgrph2lFWOgPsgBQIhds9xlVIfNedrfe0GtwoCBzvNGKm/yVyuC7U+M9WAFICgXOWsF2iJhL
	8bJZtn9VKOTxWbasRYcVZV99mjb6kN6RL13I4DFSFYp+WsMGTxjQWIX0GCDZ+9cRCRyak5qD928h8
	2LUUFctDIzvHVxiO6yMIejtKBprVzyjoYveSOz1XwNF17zP5bk/KA3n0MplAQZfLITzOBL3azUYdZ
	zK55p5turQXeivCNRchs4rboeXEFqG1oveLUTamh5ezq/h556YF9uMGe0yo+Luo5lQlqguwYqm/aA
	SxoGKbFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1kp-00000000gdW-3x5W;
	Fri, 28 Nov 2025 16:55:31 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1kf-00000000gZf-3pC5;
	Fri, 28 Nov 2025 16:55:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1A415C16A3C;
	Fri, 28 Nov 2025 16:54:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0357F60706;
	Fri, 28 Nov 2025 16:55:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9BF110B02187;
	Fri, 28 Nov 2025 17:55:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764348916; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4KsAxr99sySjsHY4TzPD3tHVsqK24nvaf2pqUbhtfhE=;
	b=YVI71PvCVzgmOQp16UtVOf8VdYpNuV79FTjRiPbKsJQVTVyqxnuaeM/dgMAH35gLARG0Ur
	1Uo4a1yenzCCTwAvRHXyLb5t/Rmdw1mGAZe87wHcoDmGz617/QiKXdKvBE9cs6Col4akJ+
	Sodw7fGjEiMNJ5qzy5mEi9yEblzwZEba0n/ElagD7LGnlbj1lFGrjffZ5mIcTaZPsX+Oig
	EuEdtbZ82quA3LNem2FG01OQuh35riUzwR02oZr3xZ86V0H6E8ylboKLFqt04tIT4Pp9wk
	gIUSG1ZlG1djqE9oSZETMCjG8DqUEXAChf0Dqp1nsN+Zr6DtAmcLcyS1jcxNdg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 28 Nov 2025 17:50:34 +0100
Subject: [PATCH v2 24/26] drm/bridge: imx8qxp-pixel-link: simplify logic to
 find next bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-24-88f8a107eca2@bootlin.com>
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
X-CRM114-CacheID: sfid-20251128_085522_120228_B832BE56 
X-CRM114-Status: GOOD (  16.10  )
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

imx8qxp_pixel_link_find_next_bridge() uses a sophisticated logic to find
the preferred next bridge, using an array with two supporting index
variables. This is more sophisticated than required because we only ever
need a pointer to the "current" bridge and to the "best so far" bridge.

Additionally this logic is going to make the addition of proper refcounting
quite complex.

Rewrite the logic using two drm_bridge pointers, which is by itself
slightly simpler and is a preparation step for introducing bridge
refcounting in a later commit.

Also reword a comment to make it clearer.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index e5943506981d..53016f0d53a0 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -261,12 +261,10 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 {
 	struct device_node *np = pl->dev->of_node;
 	struct device_node *port, *remote;
-	struct drm_bridge *next_bridge[PL_MAX_NEXT_BRIDGES];
+	struct drm_bridge *selected_bridge = NULL;
 	u32 port_id;
 	bool found_port = false;
-	int reg, ep_cnt = 0;
-	/* select the first next bridge by default */
-	int bridge_sel = 0;
+	int reg;
 
 	for (port_id = 1; port_id <= PL_MAX_MST_ADDR + 1; port_id++) {
 		port = of_graph_get_port_by_id(np, port_id);
@@ -300,24 +298,25 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 			continue;
 		}
 
-		next_bridge[ep_cnt] = of_drm_find_bridge(remote);
-		if (!next_bridge[ep_cnt]) {
+		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
+		if (!next_bridge) {
 			of_node_put(remote);
 			return ERR_PTR(-EPROBE_DEFER);
 		}
 
-		/* specially select the next bridge with companion PXL2DPI */
-		if (of_property_present(remote, "fsl,companion-pxl2dpi"))
-			bridge_sel = ep_cnt;
-
-		ep_cnt++;
+		/*
+		 * Select the next bridge with companion PXL2DPI if
+		 * present, otherwise default to the first bridge
+		 */
+		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi"))
+			selected_bridge = next_bridge;
 
 		of_node_put(remote);
 	}
 
 	pl->mst_addr = port_id - 1;
 
-	return next_bridge[bridge_sel];
+	return selected_bridge;
 }
 
 static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)

-- 
2.51.1


