Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6EFC624D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2026 16:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1xFnzyvbY+1gakmxJcJ6RhkCkSKMzvAZUwHJRdf2VVI=; b=r9W6pDq5GRpx9z8NxJt39m+Yfk
	nC/GlhBAP7QVY+A63NKS35NyomUCb+51wQrYWu7FBVa3Io6g6P3CxT3bnwR2R1GaOLD5oZ1RnhDXq
	fnyKwT46Sh+waCNKXnSMmhN2XKZcWqIkzgcLb/XAHsgtzUnYLJHlcpkPgm+hrK1fyisEhoIo/MK8l
	EHP8izLKFpXxb2dIW9LiNFztV+JDSfVaKsy2v2sc4CRNXU0fcTR1O2ucLB7iDcX/g/yc2bUrjss3q
	G1PtAQNP9kpcDC0xW7RL6vgth94pfoPsitZFHcu2fB177ldsPTrOsTGK3Qyqooi6erjfLhopqULUH
	Ny1JHsBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14eY-00000009zmD-3Ola;
	Mon, 31 Aug 2026 16:14:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14eX-00000009zhm-2Pv6
	for linux-mediatek@bombadil.infradead.org;
	Mon, 31 Aug 2026 16:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1xFnzyvbY+1gakmxJcJ6RhkCkSKMzvAZUwHJRdf2VVI=; b=YHd+0UusLZdiBk9DMUmFq+6EA4
	v8gFGbayJt4z06m4v/z91AK8Q8zoJ+zED7VSA46iBC4QMSDCr6p9tF0HvfS7qVPib1GzNECpXS4HP
	we8oY+LXDSz1Te7mSlwv4vgSqFRgT0eFbEhM3nz4ju6QNIRdAuqWuRSgfbBI27KhsVYdvgZhc2rbR
	pLV3pFQMiMyaUAFVp1lyfGdPm4HgT4sBCMkOyk1Sy78hyuUlhcCH8xCmyaQzKtRyw1HvKUTab2V7B
	sKacy5pJ1V31XZBlVLv9KTCfl4ZRQQijlpyM7pLH29ZwU+mWWMAa4osEKkAm48bqWf2DuEtMPwAwC
	oy/AFKXQ==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x14eU-0000000A2PT-33xx
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Aug 2026 16:14:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 33FB54E41482;
	Mon, 31 Aug 2026 16:14:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0084060231;
	Mon, 31 Aug 2026 16:14:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86C8911C78B96;
	Mon, 31 Aug 2026 18:14:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788192862; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1xFnzyvbY+1gakmxJcJ6RhkCkSKMzvAZUwHJRdf2VVI=;
	b=J2tBdgbVroRZDoiVMPegJf2WxPeDcUWZ0T8OvBnJnWbANcbAcnZ8o6SyvOOcftXlZb3yeS
	SCr/z9K6SB6hI13cg7qc2vos0eluYIAtEKEcT/zb/xYriLYpaKNa9f7Rd1hQR0VHovPc1m
	0p03Id/2F7RWDLipbDmyyZDsfZWKWwcHQAXwgtYEzj/dA+EcIsMZsmsltAepN0JVKje5oe
	AhEmFZtKAgJY85BTJM2tZC5N1GWiqrT/Qk9pU/iLrMLrq/YwM1kELIQtJelIAvx173kNul
	yPpNYtpp9m3bTv/gRV/OdvcdLsFKCNKPIwePWhh4H8Evy7UoLkaard/vSbQftg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 31 Aug 2026 18:13:31 +0200
Subject: [PATCH v3 05/13] drm/bridge: ti-sn65dsi83: select DRM_PANEL_BRIDGE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-drm-bridge-drm_panel-cleanup-v3-5-50efd8168b3e@bootlin.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Marek Vasut <marex@denx.de>, 
 Sudarshan Shetty <tessolveupstream@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Herve Codina <herve.codina@bootlin.com>, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_171430_883374_0BB37F98 
X-CRM114-Status: GOOD (  10.51  )
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

This driver uses the drm_panel_bridge API and not the drm_panel API so it
should select DRM_PANEL_BRIDGE and not DRM_PANEL.

Cc: Marek Vasut <marex@denx.de>
Cc: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Herve Codina <herve.codina@bootlin.com>
Cc: Esben Haabendal <esben@geanix.com>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Acked-by: Esben Haabendal <esben@geanix.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index b6754ee505d0..944f2c00bf0a 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -462,7 +462,7 @@ config DRM_TI_SN65DSI83
 	depends on OF
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
-	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	select DRM_MIPI_DSI
 	help
 	  Texas Instruments SN65DSI83 and SN65DSI84 DSI to LVDS Bridge driver

-- 
2.55.0


