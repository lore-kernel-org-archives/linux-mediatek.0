Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E02BC88E7D
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 16:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4TU13u1Mejf3+R/VztpyEKMgsFgdv4lrS3jA2CK6KvQ=; b=yVKoaxP1qaN8BbJHPFpZUq7cwN
	cj6NYcMykbzKVQv9R43wjSfYxpzOC+UwgEb+eYA095tr/9i67GB6i2gSAXVRjaUrBfAdyMgr0irWC
	ShZkMcmtlRyOW5U/+CD94ZPKzqlSEUHg/ktyxzKJT0NRdSj2WuimJBFL0vjpPouXNILb0tDjgeRGF
	0VFsG5fhM8CnrGIfNuel+SK7kYcLQN7DKwMavfZgVRBlhhxlxeT2e5owV9SoLra49vkadAuyH8pWW
	Ow7j7/25oFuEnOpPIbmamOWe4deitny37PjYtZViRdRVEciepkwMQPN9lQJz87N4ggMhboM2GvweO
	If/XO7Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WJO-00000007TEf-1OEu;
	Tue, 15 Sep 2026 16:47:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WJG-00000007TAX-1RE9
	for linux-mediatek@bombadil.infradead.org;
	Tue, 15 Sep 2026 16:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4TU13u1Mejf3+R/VztpyEKMgsFgdv4lrS3jA2CK6KvQ=; b=L+yZF45OekuyC0MmxQdq2BZCQY
	S/DWluc7SOeG1puEgnX1/jiW1/DSHPxY+e1yXr2CH4XD7a6+bwQmopnD/gnU71SbioRO3ijRI7I6r
	OTFgkYOPe3NZK2YrBxMLfX9l7bz9eLm+wkSifArZkrvMqPsjNc+G2ltAv2lwA49Nj3uzcmEClFRBY
	ORdIiOjz1CF96wi4BEKwf+jNMGyC+oFKHuATpJkqbycc6ckYAWGSVMAxsTxxX1fAjsk2W8abaxqqd
	Rt0lW+MtC4AoXXwVQf3Pweg8K0RHj6aNBp1gax2ep3m1/tzdVYeXvN1Ur38lo5xcErqjt/5vuxEoy
	xL2G4Hpw==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6WJD-000000072et-2og6
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 16:47:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8E295C5CD50;
	Tue, 15 Sep 2026 16:47:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE5AF602B0;
	Tue, 15 Sep 2026 16:47:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53BDC11C7AFFA;
	Tue, 15 Sep 2026 18:46:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789490821; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4TU13u1Mejf3+R/VztpyEKMgsFgdv4lrS3jA2CK6KvQ=;
	b=OZDG+q6G/fkjk4cU2J4pjm8icsNa2dTMQcpHIp5JvcQ8BhKfYLXCug8d+wVaWMeQalSb0d
	d9vYOQe2lgAHkK0U2RnW8otvWINqLtIvVAkaiEalLx4Duyi+3MNmP9c5NYiduULk+OR7VA
	swhnPo/kv4QYJpU5dqYocYPzaxk09mT+kWKG85pWUSSlXLvX9xavOcLTnpdnST36Bv+rDK
	lYtdz4GstXbK1CvlEc2g7Bcb+P9rx8rK+jfee4eYQuOEr8hpx1NHs6IIMdongMvEF3Hvkl
	lbjBysUu8pukLfuQRm9IeRfJDPpj0QVvrl3etc5SMjh5stME3mnZulG/v3Hn0Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 15 Sep 2026 18:46:16 +0200
Subject: [PATCH v4 3/9] drm/bridge: nxp-ptn3460: select DRM_PANEL_BRIDGE,
 not DRM_PANEL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-drm-bridge-drm_panel-cleanup-v4-3-30401d9406f3@bootlin.com>
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
 Sean Paul <seanpaul@chromium.org>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_174703_775462_8326E32E 
X-CRM114-Status: UNSURE (   9.95  )
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

But it uses devm_drm_of_get_bridge(), which is enabled by DRM_PANEL_BRIDGE.

Cc: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index c98f62b23b1d..1d4db73bd760 100644
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


