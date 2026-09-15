Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA807C88E75
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 16:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4S2yNFw54mi8kizpo4SMAmA0eCb6FLd+PRdQwv2Y0fs=; b=sWyXYHabynYltdNaUepj7cbwN1
	meUwK+deaODgua7hMPG9clBBjlEG+EI5Nu/WbkozsBv/vG20DTfW4jN5czocVzDkCqflUsl5FPDKG
	kte4ZuB+OJGPZU9iyJuIS8mzMxnCicAevZwiI+5tLPq3BnGPwkkrGIyGOibqQOf2Ccrk5hAmjin+W
	wNWEd1dmtOGHzoO8TGk8riz1yBBgRBE2xj+eyE00LoPuvDSQrHFapL+xvAunkaJmq9Ac7ceWFAks7
	uE9vQeh/kvvvAubL2NkRQcrFZ3cGbsxx/2yqiMnNjnsQSJrVr/ascaD6EnxuwZvIcJVAwIMi+KEPj
	c2+bDpMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WJf-00000007TYL-26gE;
	Tue, 15 Sep 2026 16:47:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WJQ-00000007TH9-2KvS;
	Tue, 15 Sep 2026 16:47:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D6B881A0815;
	Tue, 15 Sep 2026 16:47:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA326602B0;
	Tue, 15 Sep 2026 16:47:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E518711C7AFDA;
	Tue, 15 Sep 2026 18:47:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789490833; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4S2yNFw54mi8kizpo4SMAmA0eCb6FLd+PRdQwv2Y0fs=;
	b=FtmzQ07BTvx8EdVKTbS9SyOs1Kq3yodV33IwS4cYJlkwrsqEPrH3vNmLuo2ddjrFt3FC6g
	ydTKwgVpUG7Xmts1kcQf5OiPAueVoYHOdIR/NuuWXtEOyTfI0OZd1JD0ns/i9lT3xZTJ+4
	lJ0gJ3cPBkwcnl9/bDwPWZmguUldIQaqhA2Nr0vyQnH10nKUcbrtATqKU7BGgwMCLKz6jD
	fRK3BsxUZHwF4psveFWPcKXarEWXlRfyhTlnAK5FQ/3cetLBCslnghC6EpxKT0OXK0CowF
	qDYexFgpbeZvqvQPTdNKyuLnsOJRUv8EEHXHcHuH3DE8BbVQPO9NfZ6NbqUhIQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 15 Sep 2026 18:46:19 +0200
Subject: [PATCH v4 6/9] drm/bridge: tc358767: select DRM_PANEL_BRIDGE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-drm-bridge-drm_panel-cleanup-v4-6-30401d9406f3@bootlin.com>
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
 Maoyi Xie <maoyixie.tju@gmail.com>, Andy Yan <andy.yan@rock-chips.com>, 
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_094717_843231_DABD3837 
X-CRM114-Status: UNSURE (   8.28  )
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

This driver uses devm_drm_panel_bridge_add(), which is enabled by
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


