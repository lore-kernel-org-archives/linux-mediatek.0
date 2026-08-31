Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982EEC624A5
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2026 16:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISxahuzTjK18RJ7tFfdhN8vFdhO6CrMv3QE+PhwTL3Y=; b=rSMSBmXLZUyu6VB25Wka7N7asK
	Wfz/NhfA8sSjT5sohpQOZtWMGch/p3fvy6g/zmQe12WRmhXvMLTNcY6eC0l0ElKV9APDa6kWPyrWn
	je2SGES3OwyTo90ig6vhgTotKo60qoydHwNVjSi3JlaQxoHW6FQM1qgZ/XWevNCYta1cyR3uF1+DP
	WbrPC0batTenDQ5H58taXMV4z/MH59/HnUIjv7/+1fJ1GB/vUMY6c2xp6GCrSdMCJ1+N8J70LKeSg
	XEuqU+H+83Nt38Hgp8pvLfBseiXvNP+vl8IJjCGPK0jq9vYz7rnlfhqU2M/+narbO4NYrHqWdclKX
	YrsiwN1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14f0-0000000A0JQ-2Wps;
	Mon, 31 Aug 2026 16:15:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14ep-0000000A07K-3yyy
	for linux-mediatek@bombadil.infradead.org;
	Mon, 31 Aug 2026 16:14:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ISxahuzTjK18RJ7tFfdhN8vFdhO6CrMv3QE+PhwTL3Y=; b=l1NmVznhzcZ2Jywze/bYpKwPNf
	cnfTV7MtwN1QlJ3mKKvyXswfGtG+jiG/lF0sT7qZw/U7HiHzQl/Tb+FC7SafinYUlWQPlO+3bO9uO
	x22UrQ+OxvDnd7YAPHQVGwwven9JsWJBal5thqX1xWlHkdclTfcNEyAr7duqs1yvWIp+krsnXqqMv
	4FmMofuJaM0EwgoHH7xmMOYJRrbk5G+fxP04bIgt4BB9txlP7oGDAaFtodbyWB1M3BnacUSBzYbIZ
	X8D7rEyngtrgQ9gf9/B6Hct77CawefnmHkpQ1OrkOZZzgDC5tx6Pf9UxZiA0v0rqxgNIpaEYK0Z9p
	Zsb/rf+g==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x14em-0000000A2TN-2zTv
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Aug 2026 16:14:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0DF694E41480;
	Mon, 31 Aug 2026 16:14:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D557C60231;
	Mon, 31 Aug 2026 16:14:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 365C411C78AC8;
	Mon, 31 Aug 2026 18:14:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788192882; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ISxahuzTjK18RJ7tFfdhN8vFdhO6CrMv3QE+PhwTL3Y=;
	b=Wo41OvVGEcv3xdnykSNc1LxmCpmPYDBCUxtOEhOTAd6vR4P2qN1Y+Vw/z/Yldc78HY7mg/
	JOOq3j+zqCdKVP63u6xLj91kXxDre5jCbBPPOyRwDxmTk3hlU7BgMXhVvlgJDZLvowmX0h
	uWzoRANkYHOtBYdLPaH+6Vrcl14ePvTNymrZqfDg+X8j6miY9h01MKnb14jNU7avllFpAL
	TO9pbqdQH0aH3u/iwCuQlMWnBve7+fni5UBdFgwP2Djkfmk2awTI4HK9IrhJ+51i/ujZxu
	Xx1cH2xpLdqojXHmDfz0GezsqvOxzKzmAtrM4EjkdVjEUxxhegF2CiO2cH8XgA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 31 Aug 2026 18:13:36 +0200
Subject: [PATCH v3 10/13] drm/bridge: tc358767: select DRM_PANEL_BRIDGE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-drm-bridge-drm_panel-cleanup-v3-10-50efd8168b3e@bootlin.com>
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
 Maoyi Xie <maoyixie.tju@gmail.com>, Andy Yan <andy.yan@rock-chips.com>, 
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_171448_985708_ED62412D 
X-CRM114-Status: UNSURE (   7.62  )
X-CRM114-Notice: Please train this message.
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

This driver uses devm_drm_of_get_bridge(), which is enabled by
DRM_PANEL_BRIDGE.

Leave the 'select DRM_PANEL' because it is needed for drm_panel_put() which
the driver uses.

Cc: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index e2ee76899468..a4bc1b5401c0 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -400,6 +400,7 @@ config DRM_TOSHIBA_TC358767
 	select REGMAP_I2C
 	select DRM_MIPI_DSI
 	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	help
 	  Toshiba TC358767 eDP bridge chip driver.
 

-- 
2.55.0


