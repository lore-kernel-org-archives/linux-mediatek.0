Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801EDC624A5
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2026 16:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0iz7ra5tINPsxwJnofmPLbyLMhCRHxjEo4oxluGUxk=; b=L5X0uEwMKoJjCaR0pUReBwYvWM
	bELbkm9WbjEikQHjXcIHP5psMLiFcECvwkPn15oGrZBQL+ISDwf+ZxnmLw84JAAbaUpXecROKwEc/
	2TCn0a5Rn1g2qIZoF7Ra9AnI3T/Hs0wfFpgKrMvOyQLmYmTiYi/LfMtxHCuTF7MZ79iem+TCowmM+
	SD0OzXl3ETOJDgngwZAWnj3WADm3iPTY0Op6BI360jOMGb/AOwOWohCx4TYLEsVuYT8TS6WxWg9tg
	FWgbc36tR7+Is/qw0IWhpoRjARvvBlkJqwzIUN0TmMiCeD1rVURx7+ZdE1EJklprbOxXUJJYfIYl+
	sJ4uFi0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14eK-00000009zYF-2IaR;
	Mon, 31 Aug 2026 16:14:20 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14eH-00000009zV8-185W;
	Mon, 31 Aug 2026 16:14:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 86F114E4147F;
	Mon, 31 Aug 2026 16:14:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5272460231;
	Mon, 31 Aug 2026 16:14:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D120211C78B96;
	Mon, 31 Aug 2026 18:14:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788192853; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=J0iz7ra5tINPsxwJnofmPLbyLMhCRHxjEo4oxluGUxk=;
	b=kcBR4jyB/XUWbDv0yf/kSEtvcL11hmJxEFqFrQ/txQonEgx2XWyxPBQJfWlJhoAzGC19u/
	zzDcGyUMEvsiYAqGEogME0XJU2xKCP56F5dbyMxBZ4okAsL4UJAHyGZPXvwSDMyFqIxHaG
	X7cbX9dLttK6rUJmwuRf/KedeQWs+v79db2cdlC1FzisYW9y60FivzDVboaSKDPO08AA9O
	ZA3Hd0SVUHrK+SLxx+Gxn1TXRjDha5hb+ASsExgWVkGCF0JKbtVPzF13Ktn6CEunpt4iRU
	n6Cb2nIFE7ah9AdzQ2sx1PVIOfcjBoxJ+0d/okrc0GOW79mXGrhAWw7cEB8P9w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 31 Aug 2026 18:13:29 +0200
Subject: [PATCH v3 03/13] drm/bridge: ti-dlpc3433: don't depend on
 DRM_PANEL, select DRM_PANEL_BRIDGE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-drm-bridge-drm_panel-cleanup-v3-3-50efd8168b3e@bootlin.com>
References: <20260831-drm-bridge-drm_panel-cleanup-v3-0-50efd8168b3e@bootlin.com>
In-Reply-To: <20260831-drm-bridge-drm_panel-cleanup-v3-0-50efd8168b3e@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Christopher Vollo <chris@renewoutreach.org>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_091417_475042_1F426F35 
X-CRM114-Status: GOOD (  10.57  )
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

This driver does not use the drm_panel APIs at all, so no need to select
DRM_PANEL.

But it uses devm_drm_of_get_bridge(), which is enabled by DRM_PANEL_BRIDGE.

Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Christopher Vollo <chris@renewoutreach.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 958b4f687d4d..e85952c76f02 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -428,9 +428,10 @@ config DRM_TOSHIBA_TC358775
 
 config DRM_TI_DLPC3433
 	tristate "TI DLPC3433 Display controller"
-	depends on DRM && DRM_PANEL
+	depends on DRM
 	depends on OF
 	select DRM_MIPI_DSI
+	select DRM_PANEL_BRIDGE
 	help
 	  TI DLPC3433 is a MIPI DSI based display controller bridge
 	  for processing high resolution DMD based projectors.

-- 
2.55.0


