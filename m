Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73362C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Jul 2022 17:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUNzKCt4Zms15cwedQlM5lolVcnjoxkbNdM9xZbtnXY=; b=S5GMvE2GJwLaHhShVxxfHEfX8b
	UuoThFUfFQxhyFWUNm2JSXiTgeyPAckPnwHTUg7O8DM3BVE+uFRYv8H+anfhVVO9mOr1Uf+2J1FOv
	Ml2yEHdfDgZbHK9F5x+NOosygvrqH9Z0HjaWiVJ5eHCAsVNN3uO/H2JOp4btmt32BLFBnfvY5++uG
	R/wV4mZQ8Ukmqqhyte8mZP+qVQq6u62bFjYFD94M02yJLy9qW7+UeLnblkdew2MnCyNCXa/Q/QgpJ
	DeXkhdr9ok4tTuKCmNL1MrGwCP1xdTZTiqYKf4uC2OYhLwPuYx4FLBrS3vUbDbiFWmahAtE5IT25q
	8VzqmILA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD8L2-007t1p-OP; Sun, 17 Jul 2022 17:45:52 +0000
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com ([46.30.210.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD8KQ-007sio-E9
	for linux-mediatek@lists.infradead.org; Sun, 17 Jul 2022 17:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=tUNzKCt4Zms15cwedQlM5lolVcnjoxkbNdM9xZbtnXY=;
	b=HdFn1ETyit4OaCqBQQGlXtNovIrF5rsy8lLAHWcEcybftrSgiT5SCEwEt72LJrOHNE2arLyDhwwam
	 PR28Mf/SOxeBE/mtbQmHDcINjP8Gb038jncvvFlMp/FwdDn8Vyg/pYBfUBM9651pUIxN3qB0Ijw1fz
	 LUgVEmwfBhU/sgSVPfRFJmwTnbKEGmOFX7ocgIJGLqNdaUloXEgjWnfaoYCSaoew7QYNfklTOBOm5c
	 Vw1b5xHu5hmm+1R7u1EZVZGYWd8JXe+FbmhMnUYstOJSSxINZFiBZBjDh+HFuv9+yI6eP2HbA85Ys4
	 vL6jXWNWdDL8gTcY60TOIXPESd1Z3hw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=tUNzKCt4Zms15cwedQlM5lolVcnjoxkbNdM9xZbtnXY=;
	b=KEmxVha5B+qyEWKB+Yxxo71t4ryP28oUobas/F9bGwH0PvgiUzrAUENXT4o5Oa9vcpdEQUPfW15dr
	 H17Zrc5Ag==
X-HalOne-Cookie: c5eba13afd76c8abb22d288d6bb6ff2fa5436d67
X-HalOne-ID: 3503b0f2-05f8-11ed-823f-d0431ea8bb10
Received: from mailproxy1.cst.dirpod4-cph3.one.com (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 3503b0f2-05f8-11ed-823f-d0431ea8bb10;
	Sun, 17 Jul 2022 17:45:12 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Robert Foss <robert.foss@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Benson Leung <bleung@chromium.org>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	chrome-platform@lists.linux.dev,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@linux.ie>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Philip Chen <philipchen@chromium.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sam Ravnborg <sam@ravnborg.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v1 04/12] drm/bridge: Drop drm_bridge_chain_mode_fixup
Date: Sun, 17 Jul 2022 19:44:46 +0200
Message-Id: <20220717174454.46616-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220717174454.46616-1-sam@ravnborg.org>
References: <20220717174454.46616-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_104515_617503_17396455 
X-CRM114-Status: GOOD (  11.35  )
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

There are no users left of drm_bridge_chain_mode_fixup() and we
do not want to have this function available, so drop it.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_bridge.c | 37 ------------------------------------
 include/drm/drm_bridge.h     |  3 ---
 2 files changed, 40 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index bb7fc09267af..b6f56d8f3547 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -430,43 +430,6 @@ void drm_bridge_detach(struct drm_bridge *bridge)
  *   needed, in order to gradually transition to the new model.
  */
 
-/**
- * drm_bridge_chain_mode_fixup - fixup proposed mode for all bridges in the
- *				 encoder chain
- * @bridge: bridge control structure
- * @mode: desired mode to be set for the bridge
- * @adjusted_mode: updated mode that works for this bridge
- *
- * Calls &drm_bridge_funcs.mode_fixup for all the bridges in the
- * encoder chain, starting from the first bridge to the last.
- *
- * Note: the bridge passed should be the one closest to the encoder
- *
- * RETURNS:
- * true on success, false on failure
- */
-bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
-				 const struct drm_display_mode *mode,
-				 struct drm_display_mode *adjusted_mode)
-{
-	struct drm_encoder *encoder;
-
-	if (!bridge)
-		return true;
-
-	encoder = bridge->encoder;
-	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
-		if (!bridge->funcs->mode_fixup)
-			continue;
-
-		if (!bridge->funcs->mode_fixup(bridge, mode, adjusted_mode))
-			return false;
-	}
-
-	return true;
-}
-EXPORT_SYMBOL(drm_bridge_chain_mode_fixup);
-
 /**
  * drm_bridge_chain_mode_valid - validate the mode against all bridges in the
  *				 encoder chain.
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 1eca9c4c3346..7496f41535b1 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -845,9 +845,6 @@ drm_bridge_chain_get_first_bridge(struct drm_encoder *encoder)
 #define drm_for_each_bridge_in_chain(encoder, bridge)			\
 	list_for_each_entry(bridge, &(encoder)->bridge_chain, chain_node)
 
-bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
-				 const struct drm_display_mode *mode,
-				 struct drm_display_mode *adjusted_mode);
 enum drm_mode_status
 drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
 			    const struct drm_display_info *info,
-- 
2.34.1


