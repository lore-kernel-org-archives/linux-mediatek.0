Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB13CCF34AB
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Nov 2025 13:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ByjE2fDXvVGt+lqsSwFhGv2RTSfBXtxTluzyqLNTpc=; b=L1fSgGwn3lAWWtiTWTYsGKX/i1
	NdLLMYxwLnH4qJ/Q6X0QibTa7dHdntNRvH48kHVci9P8JasrMdISq5lqwZFCacxScrh7XiTQFGG5N
	kMjuacvcfo9TGuqPBq2ydruIiqzLPDvPrCsAmlnMGV2qdj1sp3otZRh8fTKihszDAyUM847pEs/vB
	NS0vCeeDviPGmpdangQET1qG+mYZmieXFUflDbJbdmSKAmWpK2yD11d/Msb5Uns8Rtrc6Zkom1n18
	cjzvuNi1Lf2zx8QOYzaoTg1saBU+5GSpdwtjzOdXwbIvGb6F1Phh1+ZnCrxl5JZom4UZw61zVnQbQ
	pQL8KOag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhwU-00000003FmZ-0bZ3;
	Wed, 19 Nov 2025 13:09:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhwS-00000003Flc-0qOq
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Nov 2025 13:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6ByjE2fDXvVGt+lqsSwFhGv2RTSfBXtxTluzyqLNTpc=; b=MD8ukJBwPVP1E+MFt25dJiFU30
	c1r19znq4afupx8wuFjwoowcw/CDXNatN8jkEYNrbP09OMojHNUeXIlTfB8lRGrIDAd+ZSMBaA5vM
	9+G+pjLE9afn6m0CPxfNmAtXgUMtkwc2wtCzrP/SkkDVEX5cbfffHdiO6qPeABme+6A4an2KQnIGg
	YlnO3iC0Qu3ez5+t6yQoOknB2mVMcRwp7Q5cq0gJCRERNQqDgPnf0yNJd20M/f8J1B+zYs9Hy/fEf
	GWn/rKoRLVTJmJkq877TB8gEq6PDKGDxuBOigysKTdUmmID3PvpuocWswOE/UFc59XxqoF1oO0sL2
	lHI7fnfQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLh4l-0000000CAol-48un
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Nov 2025 12:14:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8B63B1A1BE7;
	Wed, 19 Nov 2025 13:09:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5EF5C60699;
	Wed, 19 Nov 2025 13:09:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0056410371A4D;
	Wed, 19 Nov 2025 14:09:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763557781; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6ByjE2fDXvVGt+lqsSwFhGv2RTSfBXtxTluzyqLNTpc=;
	b=kU1XUdf8s2RAsVwDA2ek/rPXMMhQONyRg2a1IvO4LGjlvPdwi13Mv7MIRc+3a1UDym0x7q
	5T/7OJCko+FA3Peet81z49JLbAAjnJSLki4fI1abemgPR1fdD9Cbmnvctzj2D7dw1sLVxR
	OBf4shc2KNmMVe3szWeZ9GSS/rMEvqaggAlMD/NtvK/qElnzbxMi2K8zt6HXzsYJq5yLFK
	+oJ1e+O1SCggskLwhwZ6199ig4iTiDBFn23TrLsa/KYeufoAUSCYRm0aNfdv0HezUP9+5j
	0bTIgxDzLor4AaAYgJpyV0e4fkWnc9x0kFf0tFt/GWqsrCNwIliDqcGWN5nh1A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 19 Nov 2025 14:05:56 +0100
Subject: [PATCH 25/26] drm/bridge: imx8qxp-pixel-link: simplify freeing of
 the remote device_node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-25-0db98a7fe474@bootlin.com>
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
X-CRM114-CacheID: sfid-20251119_121420_329413_E5917A3F 
X-CRM114-Status: GOOD (  12.54  )
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

The main loop in imx8qxp_pixel_link_find_next_bridge() requires calling
of_node_put() in multiple places, complicating code flow. Simplify it by
using a cleanup action and making the 'remote' variable scope local to the
loop.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 53016f0d53a0..2ecc3c1051e5 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -260,7 +260,7 @@ static struct drm_bridge *
 imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 {
 	struct device_node *np = pl->dev->of_node;
-	struct device_node *port, *remote;
+	struct device_node *port;
 	struct drm_bridge *selected_bridge = NULL;
 	u32 port_id;
 	bool found_port = false;
@@ -286,7 +286,8 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 	}
 
 	for (reg = 0; reg < PL_MAX_NEXT_BRIDGES; reg++) {
-		remote = of_graph_get_remote_node(np, port_id, reg);
+		struct device_node *remote __free(device_node) =
+			of_graph_get_remote_node(np, port_id, reg);
 		if (!remote)
 			continue;
 
@@ -294,15 +295,12 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 			DRM_DEV_DEBUG(pl->dev,
 				      "port%u endpoint%u remote parent is not available\n",
 				      port_id, reg);
-			of_node_put(remote);
 			continue;
 		}
 
 		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
-		if (!next_bridge) {
-			of_node_put(remote);
+		if (!next_bridge)
 			return ERR_PTR(-EPROBE_DEFER);
-		}
 
 		/*
 		 * Select the next bridge with companion PXL2DPI if
@@ -310,8 +308,6 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 		 */
 		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi"))
 			selected_bridge = next_bridge;
-
-		of_node_put(remote);
 	}
 
 	pl->mst_addr = port_id - 1;

-- 
2.51.1


