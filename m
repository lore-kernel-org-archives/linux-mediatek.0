Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3143CC6377D
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 06:23:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB2EF610CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 06:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB2EF610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+KYNPLaIhByi3ae+sBwY2/1j9/L9PAUnS2hT+VOV5Y8=; b=B7Rt6eUTPG9ymr
	U4s+cQcMHEz4NlGJ9dwdUWiIdgoLMoanjt2lHC5poxlk2k79zo8PhTXW1Ps6n2GHaVmg4fP1ByY8k
	SgTxE1V0CnED48hqpvrghorRF0jVU7HYQUya0XHwC8WOv4EI7FYW2MWk9b0XkHPaBA5+f+yqHgGzD
	ue659FijcUbjn8rjHzk23qzcYHW1AMLHLlfB5Y9AODs+kaycL7KHOFFxj3ur9aDBaLTmSLKT8npS+
	RS2jCWcjgpU6XROC9ZJ9r5rFcOZvhn8Dy9tcJItj0JQ1U7SOIQ0E8vh7LpHzb8Jt5lKw67ILkFxyD
	oFenaXWPMaacWKZo/BhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6S7V-000LDI-8a; Thu, 22 Jul 2021 06:23:45 +0000
Received: from mx2.smtp.larsendata.com ([91.221.196.228])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6S6s-000Kyz-QL
 for linux-mediatek@lists.infradead.org; Thu, 22 Jul 2021 06:23:09 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 4e801781-eab5-11eb-8d1a-0050568cd888;
 Thu, 22 Jul 2021 06:23:19 +0000 (UTC)
Received: from saturn.lan (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 06E1C194B13;
 Thu, 22 Jul 2021 08:23:22 +0200 (CEST)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v1 5/7] drm/mediatek: Drop chain_mode_fixup call in
 mode_valid()
Date: Thu, 22 Jul 2021 08:22:44 +0200
Message-Id: <20210722062246.2512666-6-sam@ravnborg.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210722062246.2512666-1-sam@ravnborg.org>
References: <20210722062246.2512666-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_232307_216523_788FDA2E 
X-CRM114-Status: GOOD (  18.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The mode_valid implementation had a call to
drm_bridge_chain_mode_fixup() which would be wrong as the mode_valid is
not allowed to change anything - only to validate the mode.

As the next bridge is often/always a connector the call had no effect
anyway. So drop it.

From the git history I could see this call was included in the original
version of the driver so there was no help there to find out why it was
added in the first place. But a lot has changed since the initial driver
were added and is seems safe to remove the call now.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
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
index dea46d66e712..c45e4dbd9a2f 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1206,22 +1206,11 @@ static int mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
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
-		drm_mode_copy(&adjusted_mode, mode);
-		if (!drm_bridge_chain_mode_fixup(next_bridge, mode,
-						 &adjusted_mode))
-			return MODE_BAD;
-	}
-
 	if (mode->clock < 27000)
 		return MODE_CLOCK_LOW;
 	if (mode->clock > 297000)
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
