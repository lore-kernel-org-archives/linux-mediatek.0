Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18972C624A5
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2026 16:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QC2ncT9iFGMQFCG676BSb70bx2OHLa4ftQWY9juZi8s=; b=Ig4RRenLlTwIWQnEAYw014j9U1
	QvfaMrc56DqdrcJStRjpXpyae/jLgjgcfLCIhbB9dHhfMO1+b2/nxjGC57JCv0xjijyx0f8LJBQB1
	592221qg1NX/7lBsEhN5+7hJHU3qkU8V8kbT8wVkpLFvRXW/3zOftoLwMLfj6dppBWuPP3yIZzPF0
	AalLr7UP3/tcezLBylBtavYgJXazqpJQbYcWq00lalNyujmcNFvnsOskVTaEBTvnCQfl3VRRsiBmp
	vlfQYoSuQMuZemvpaZwRC6LXWipz6EvfEVFFa85D4HA5wTvdmCUluZIPmftGBUg6lRx/qrXAqqUQL
	WTzOgnPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14eX-00000009zk1-2Kpj;
	Mon, 31 Aug 2026 16:14:33 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14eT-00000009zex-1psT;
	Mon, 31 Aug 2026 16:14:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CB38E1A1909;
	Mon, 31 Aug 2026 16:14:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F73360231;
	Mon, 31 Aug 2026 16:14:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E74F611C78AC8;
	Mon, 31 Aug 2026 18:14:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788192866; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QC2ncT9iFGMQFCG676BSb70bx2OHLa4ftQWY9juZi8s=;
	b=IT+lc+OSfwhHlPA44xbyVNN4CrHhrBqY3+mAkTQ/oLILWTBbAUHQnnSWC2vQ/I+J1d7RJA
	QT4H1/6bOzkA457fR6/rp65ZzyCdnFew0GYN219hAirV9m8ol52xwXXrjCrSRRgYO1vZup
	IDo+hjd0TQBeuo4dPr/4Z3KxNb90DmJ0/fLFbXnc66sfbEBIn+BesUsmYh8wK595OYZ2WI
	GASy0R3GZc+S7AlKRv73XF5FGNsBWb1bvCVscePfyu4MvOq/H5DY6fNWNCKmxJNnzYSZTs
	ItH8HhUwEdLub67efhTaOtmagVbCnStKXA34GD4nVzlyXLB3kbGi/jGeCFawdg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 31 Aug 2026 18:13:32 +0200
Subject: [PATCH v3 06/13] drm/bridge: nxp-ptn3460: select DRM_PANEL_BRIDGE,
 not DRM_PANEL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-drm-bridge-drm_panel-cleanup-v3-6-50efd8168b3e@bootlin.com>
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
 Sean Paul <seanpaul@chromium.org>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_091429_656891_2A2E1542 
X-CRM114-Status: GOOD (  10.11  )
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

Cc: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 944f2c00bf0a..b11c8705c5c9 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -259,7 +259,7 @@ config DRM_NXP_PTN3460
 	tristate "NXP PTN3460 DP/LVDS bridge"
 	depends on OF
 	select DRM_KMS_HELPER
-	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	help
 	  NXP PTN3460 eDP-LVDS bridge chip driver.
 

-- 
2.55.0


