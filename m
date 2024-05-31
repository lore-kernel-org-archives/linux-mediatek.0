Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA4BC25B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 May 2024 20:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqstZFUnCSWQ2xORuorAxqcpfY3Wceki8OvvI1qKQuY=; b=o3b3G8vAgB/K/ffu8q96DgsjbU
	n99RPlueTF0jP1zT3N2hEPIYuZMoaD9D7VUunQm42Li4sxjYosj9GxnTfq42AuBJLpgrmznQMK9KT
	3J4TM/aU+8k/xWF6UPZw2Heq8nRJlvTXTBWDWRYIBzL6vbU9LJxp5eZZaOeVGTlgPo4T1zcCJfv6m
	XZhzo22PurktNrNeKF0/CPQriigkJtkR9fgp7GyC2BrWkOUNZemiRbTxHKburc4zmAW1mIpJ9BLgR
	O6qG+6zaakbwScZYht/5ylhMGnaHTwF1ymSWwAdsE/ku8Lc7ZuuyBmo7FsI/B8Bptkgj/yjCxH//a
	tLBJanow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD90e-0000000BOoE-0cWM;
	Fri, 31 May 2024 20:37:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD90Y-0000000BOlN-2Ua7;
	Fri, 31 May 2024 20:37:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1C140CE1BBF;
	Fri, 31 May 2024 20:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B3BCC32786;
	Fri, 31 May 2024 20:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717187866;
	bh=8bGM/eiU7NTz6fPCc/iXWib0hQ5x48YiJgZm3kopRQw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Wb9ElQb0U6cg5Zx/iN10na0lbdtBy6xM001hqbPCBI2TB0QH0szKwLsTsbnRKqygJ
	 Ozxz0ROMRXJDydbqseCjYrb2CZEaARALv3Zs24lURJhMwYKj5tCXVZI7hdWRFCn0b6
	 MsLsYWNvchlSzt+HK658s/eaJIzxPxEQFMdMdOBHq0ToGUAzJscQsGgpSjsjOj30b+
	 xwGbu/eK+aNW4X+ilIXFttSneKK64hUCn7AaV6lqJQVtQB987xW8CH93yhehXp2Hkc
	 X6QNGegppWh4bcHSB1hye6wCwOo8xo87Dvq21SwQLoyVw4/go4xkF/rI2Bg7kcBYCU
	 awz08vk35Z50Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4108FC27C50;
	Fri, 31 May 2024 20:37:46 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Fri, 31 May 2024 22:37:45 +0200
Subject: [PATCH 1/2] drm/mediatek: Drop chain_mode_fixup call in
 mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-bridge_chain_mode-v1-1-8b49e36c5dd3@ravnborg.org>
References: <20240531-bridge_chain_mode-v1-0-8b49e36c5dd3@ravnborg.org>
In-Reply-To: <20240531-bridge_chain_mode-v1-0-8b49e36c5dd3@ravnborg.org>
To: dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717187864; l=2519;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=g2zVbjZcqkh2hiGY7iFzlHZfu3znz4lPoZjniC5HZeQ=;
 b=w1EiPCAd7or7aUVHQp8xtVRJNOSZi3rzqoyygcHYSDL0tXhq+4GnhDrFo1QaJLFVumuIe3eIJ3h4
 mLJiwpcJBf0dYmx6OK/rqorlTGUd/cXH7dmKWbVIQxReLwBc+/tZ
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Relay for sam@ravnborg.org/20230107 with
 auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_133751_256437_FA5DE4E3 
X-CRM114-Status: GOOD (  16.28  )
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
Reply-To: sam@ravnborg.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sam Ravnborg <sam@ravnborg.org>

The mode_valid implementation had a call to
drm_bridge_chain_mode_fixup() which would be wrong as the mode_valid is
not allowed to change anything - only to validate the mode.

As the next bridge is often/always a connector the call had no effect
anyway. So drop it.

From the git history I could see this call was included in the original
version of the driver so there was no help there to find out why it was
added in the first place. But a lot has changed since the initial driver
were added and is seems safe to remove the call now.

v4:
  - Link to v3: https://lore.kernel.org/dri-devel/20220717174454.46616-4-sam@ravnborg.org/
  - Rebase, and added acks/rb
v3:
  - Link to v2: https://lore.kernel.org/dri-devel/20211020181901.2114645-6-sam@ravnborg.org/
v2:
  - Link to v1: https://lore.kernel.org/dri-devel/20210722062246.2512666-6-sam@ravnborg.org/

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 6e1cca97a654..0a90fe448d14 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1208,22 +1208,11 @@ mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 			   const struct drm_display_mode *mode)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
-	struct drm_bridge *next_bridge;
 
 	dev_dbg(hdmi->dev, "xres=%d, yres=%d, refresh=%d, intl=%d clock=%d\n",
 		mode->hdisplay, mode->vdisplay, drm_mode_vrefresh(mode),
 		!!(mode->flags & DRM_MODE_FLAG_INTERLACE), mode->clock * 1000);
 
-	next_bridge = drm_bridge_get_next_bridge(&hdmi->bridge);
-	if (next_bridge) {
-		struct drm_display_mode adjusted_mode;
-
-		drm_mode_init(&adjusted_mode, mode);
-		if (!drm_bridge_chain_mode_fixup(next_bridge, mode,
-						 &adjusted_mode))
-			return MODE_BAD;
-	}
-
 	if (hdmi->conf) {
 		if (hdmi->conf->cea_modes_only && !drm_match_cea_mode(mode))
 			return MODE_BAD;

-- 
2.34.1



