Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266ABCF34AB
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Nov 2025 13:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gXiH7KcRJHe1y+SYEzwMmqFZuuFI7TA/lpp17IXqG8=; b=OmLdjtBWWA1b2rnFt3uPJdpIhv
	PZ32KdAMWXK3hRir/N3UZfMYQQ3B28nNHUVsPQ/Y6gE9LF7JA+uEi8hF87BLyNdEOyYJDFA5ugw9n
	cIT24BisyMhQP4CmgOGDvkAEbOXNk18vCfK+XWmZ9Zu1hYIaDHof0r16iaDWNKQxSgZnTZXJaXG7A
	9/NYDmEvg2CQbPaWevHnJ/KVl8bcuJuVtia1gtoCjS2kCq0t8yOJskiy9m+/g9fdzpkN6YZEcVnVc
	OmDb94h6eDGwlCffVdOgr2TyR1jJ7IYPo4H5/fPe82zjYMIS9gtj+EB+rWOCGqlMuNQkYWkvyyifk
	O5ZKAyxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLht9-00000003DwZ-1NZ9;
	Wed, 19 Nov 2025 13:06:23 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLht5-00000003DtH-3KUh;
	Wed, 19 Nov 2025 13:06:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 36ADB4E4179E;
	Wed, 19 Nov 2025 13:06:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 07FAC60720;
	Wed, 19 Nov 2025 13:06:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F0AD10371A51;
	Wed, 19 Nov 2025 14:06:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763557576; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7gXiH7KcRJHe1y+SYEzwMmqFZuuFI7TA/lpp17IXqG8=;
	b=0Hd83lZn7CdaVUWqOlfWjJu1jw/lw2DIktzY9jb0BeiS7Y4iIApnXv4P92JPO2ooDgbfDq
	v7u5idqxDSoseWG//QVTOcBPGjFmXiNTrbASRGB/nRtdeMAunctuzwm98BbFQvhOeDQVGD
	l4Ts7WrSeasXZM1QJ/fw0WHIIWWBlxsenw+f7vMNUQgE1Xh9xO+mTq7UmiZdq45tyFU9S2
	XKbKIfz2IRdhFZVRRVV6pHl5yrHQhhAgLGzw7PjQcfuiDRV5MT2wNKndy0RkwsclB3fgNt
	b0VhYtHooEpKf/t2W6nWBWBfYm4XKqM9y3ZAG0Q2F+12er81mhAqq2pfA/oBIQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 19 Nov 2025 14:05:33 +0100
Subject: [PATCH 02/26] drm/bridge: deprecate of_drm_find_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-2-0db98a7fe474@bootlin.com>
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
X-CRM114-CacheID: sfid-20251119_050619_966351_E3DAB949 
X-CRM114-Status: GOOD (  13.13  )
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

of_drm_find_bridge() does not increment the returned bridge
refcount. drm_of_find_bridge() is to be used as a replacement.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad@houat/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index d98a7b4a83c0..6debbf20aaa8 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -299,7 +299,7 @@ EXPORT_SYMBOL(__devm_drm_bridge_alloc);
  * @bridge: bridge control structure
  *
  * Add the given bridge to the global list of bridges, where they can be
- * found by users via of_drm_find_bridge().
+ * found by users via drm_of_find_bridge().
  *
  * The bridge to be added must have been allocated by
  * devm_drm_bridge_alloc().
@@ -360,7 +360,7 @@ EXPORT_SYMBOL(devm_drm_bridge_add);
  * @bridge: bridge control structure
  *
  * Remove the given bridge from the global list of registered bridges, so
- * it won't be found by users via of_drm_find_bridge(), and add it to the
+ * it won't be found by users via drm_of_find_bridge(), and add it to the
  * lingering bridge list, to keep track of it until its allocated memory is
  * eventually freed.
  */
@@ -1452,6 +1452,9 @@ EXPORT_SYMBOL(drm_of_find_bridge);
  *
  * @np: device node
  *
+ * This function is deprecated. Use drm_of_find_bridge() instead for proper
+ * refcounting.
+ *
  * RETURNS:
  * drm_bridge control struct on success, NULL on failure
  */

-- 
2.51.1


