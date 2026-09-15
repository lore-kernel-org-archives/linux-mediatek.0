Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08898C88E75
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 16:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6366VsSiaRH0wdJwmxft2fxgluFM1XPLj8kd59Ruwc=; b=qN36YX3+2iXJ5KhuINj7gtap2a
	YKETc3SZz4PkmN7B58TKOXqIhom6g4g39ZMdtP9V4oElRuinuaCilRrxz6T4DiNmAcjTV6THoD/Ku
	sQ3u8oliR9q712lGjQn1s5yS/3sz0P7mRMwDhdZWMtYpTSjTfMIkmgVtW7flo6Xhj++tSsmCNfF7y
	4rVp15JfBFP9W+QOvlUVRabxroBTiTTeXawGkTMLBRAvLcALfxx4Nr3WSejIqGrTUo0UuOBD33mWw
	9VLAyNkFnfxGdYO1birbj4/eGwIFdiv05HnT/M3yfkeWiW90fWn1Fx3E/rFDhEoFzzJXP2ZMcrVKL
	fn1W7SfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WJ7-00000007T4E-3WED;
	Tue, 15 Sep 2026 16:46:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WJ4-00000007T2M-30Mj
	for linux-mediatek@bombadil.infradead.org;
	Tue, 15 Sep 2026 16:46:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=v6366VsSiaRH0wdJwmxft2fxgluFM1XPLj8kd59Ruwc=; b=Qwa8FGYQ/JNr9gGNx75xlWE7yT
	MaCVpujYNzP+VjFYZoOYTWk/P4dU+qTTQHFina2XRV80SNmEGryRs1DfJRWyJ0vj+dwtqL1e8mQYm
	a2ujhuB40r7ZpuZr4oWdpzhgBgDTX4EY3r0ZCJk0SzRizi8vyXJ5zM+hAdJOXWqMVN3bMU+JBYP6U
	oALSxbtlLJkC9Rdz0r01k53OEB2RqmK+GOrZYdmAgmmvqzLyaoUekk34gUDQseTwRyRyZ72z/e1b7
	qbsbeXph2xmWT+DOzunsISAZmdOwrDtbHBZzacarhhnvmjUmUY2Gx4rC8xhWuoyrVidz3hJ0DY51y
	xpkEtGmg==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6WJ1-000000072ci-3E20
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 16:46:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2D7661A0809;
	Tue, 15 Sep 2026 16:46:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 00450602B0;
	Tue, 15 Sep 2026 16:46:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 022B811C7AFFA;
	Tue, 15 Sep 2026 18:46:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789490805; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=v6366VsSiaRH0wdJwmxft2fxgluFM1XPLj8kd59Ruwc=;
	b=Pq7XWDymMysrdOecCyVudyOxDERJXurAMNR0wMNtMkEB2Sid9ez+h8F71OOd+BsOt262/N
	op9yGOZpAKcKvpiPi60Ad1hGLzLFxca2g/6y7+qSlWRmDc3/3Lcz1sqI5LeOCajDJ6jkF3
	u+jMl7jxa0B3ojZ51nKF2SYPxthV2e4mpC9kEvpAO9yYuBTur7g6wGMYTt4IA21E6dpRE2
	Nbw1qvhXXgxOTnNmWx3y3ghGpkziMLDiaLNaFU2eTW0zULVp5p32DlMVMBK62qEDSmhUGw
	pkdOu53QsZPlfy6zl6TnVRAhUoEgcY/YzNsnlhjrDpYYOntdGelpZjxntCIeBw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 15 Sep 2026 18:46:14 +0200
Subject: [PATCH v4 1/9] drm/bridge: tc358764: don't select unused DRM_PANEL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-drm-bridge-drm_panel-cleanup-v4-1-30401d9406f3@bootlin.com>
References: <20260915-drm-bridge-drm_panel-cleanup-v4-0-30401d9406f3@bootlin.com>
In-Reply-To: <20260915-drm-bridge-drm_panel-cleanup-v4-0-30401d9406f3@bootlin.com>
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
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Jagan Teki <jagan@amarulasolutions.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_174652_060686_77FCE067 
X-CRM114-Status: UNSURE (   8.97  )
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

This driver does not use the drm_panel APIs at all, so no need to select
DRM_PANEL.

Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 837db36cdf48..a402f8c5b321 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -388,7 +388,6 @@ config DRM_TOSHIBA_TC358764
 	depends on OF
 	select DRM_MIPI_DSI
 	select DRM_KMS_HELPER
-	select DRM_PANEL
 	help
 	  Toshiba TC358764 DSI/LVDS bridge driver.
 

-- 
2.55.0


