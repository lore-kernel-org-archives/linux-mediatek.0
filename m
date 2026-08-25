Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EEEC61CE2
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2026 10:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cRtwK+WOv9l/LelXJ5+4zu2t9xR/X9wu9v8jrXWyWoE=; b=HbmiybSZX942lwDClAg6O1k1mK
	KTUO8qtha2NXpIr/cuLUqNaScDOSVrUL4k0JNYwQJkwG42eUlZhh0k3jKKFanIFqdGTFKmtbct4ni
	rWAiTPLJVvnglPqYdJ5xvSfN5X17TdfR/zJTSDAbAFSYjd1c8F4BjBCobRUhfTmULWMObPkc2PYQw
	byNXWBJwOT40BEBuQivbXlAZJC1Up9vvLvXEROBGiE6epkA0dSSNHS5w1Zh1RY948R2kzRCwEid5R
	+QACcxk+OBGODO0Tpvlhtlm1zv5FnH/CyOT9flYMsx9cT9F7W0jV5x6+x3HnhzbneXFjDpg3ZNNFj
	J8OcBoig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyo7f-00000000Ylw-0FAG;
	Tue, 25 Aug 2026 10:11:15 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyo7b-00000000Yij-2XuL;
	Tue, 25 Aug 2026 10:11:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E57E54E412E5;
	Tue, 25 Aug 2026 10:11:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B8120604C4;
	Tue, 25 Aug 2026 10:11:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87A8F11C7A3C8;
	Tue, 25 Aug 2026 12:10:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787652664; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cRtwK+WOv9l/LelXJ5+4zu2t9xR/X9wu9v8jrXWyWoE=;
	b=iydiKKRbeGl4KFx87Ho0Jk81IHqjVEtcjPzqx6OkH/BIGQrU1GuxlPBzdkltUamK0vVPbX
	FNx4G385S8M8DWzwkrjcoZDYF/eYVpCveY5TUBf2uVi6yBPgv9qCotbp/LyoHhUiaSUFWU
	IeXKFy7bwCtmwJrgNaG8egUZfFdJpqpPeFKvVouTC5QqwmcXlBNPoBR3Q4c2uOir3UscmP
	GK2BoXoy8/s+UEqQQd9SJWKeMansXpMcvpvSHux4nswT+UqD7KsZQmwJJQ9N+e34ijGbe3
	cB1mnUHE73ARVjryyHrWXavwRRjMy71pGiIcBFhfi/WIaHQyw5w1r402GuDDCQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 25 Aug 2026 12:09:37 +0200
Subject: [PATCH v2 04/12] drm/bridge: ti-sn65dsi86: don't select unused
 DRM_PANEL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-drm-bridge-drm_panel-cleanup-v2-4-c6c88ba7ffd2@bootlin.com>
References: <20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com>
In-Reply-To: <20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com>
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
 Douglas Anderson <dianders@chromium.org>, 
 Sandeep Panda <spanda@codeaurora.org>, 
 Franz Schnyder <franz.schnyder@toradex.com>, 
 John Ripple <john.ripple@keysight.com>, Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_031111_794167_D56EF1D6 
X-CRM114-Status: UNSURE (   9.18  )
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

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Sandeep Panda <spanda@codeaurora.org>
Cc: Franz Schnyder <franz.schnyder@toradex.com>
Cc: John Ripple <john.ripple@keysight.com>
Cc: Michael Walle <mwalle@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 043596801a65..d46aa2eb01b5 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -474,7 +474,6 @@ config DRM_TI_SN65DSI86
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
-	select DRM_PANEL
 	select DRM_MIPI_DSI
 	select AUXILIARY_BUS
 	select DRM_DISPLAY_DP_AUX_BUS

-- 
2.55.0


