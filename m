Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FB8C25B5F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 13:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vey2TT4ipuvIHSxIzwBx4wg9dcbnHV1wsJHFKSciqU=; b=jhX16+NvaucfjKN34KU8Wcq9CA
	/DdPa6XX+cOKh7VwNzRI/TI1ykelBHNb1QHrNcmpHC6y9zmiGXJ6tC8Wc6mWr8CwYhj3aLh5vboKp
	0h105/2fzZlTpOlsoIfhGMkgyeGaepeX12196QaDvihOr0k5VIoNxpO2NesStRNkYo1Dv5NGT+X2G
	lfLozJyYZJmcG6lglPOfnzVKM0EH7BlmwbMW4roQMVBmPIaE6WkVw/jJsf0FSPd0B/f24B7oNixYv
	nxiX3WHKpUGI+NiXOY/T+RZgf2hLOEml/1KVsRVmeEptNLAFdxaj5gWeDmonISdW7jcVBs4vcDggn
	i3q1Be1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yVf-00000007TXi-0nPg;
	Mon, 06 May 2024 13:36:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yV8-00000007T84-3MtG;
	Mon, 06 May 2024 13:35:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8067ACE0E76;
	Mon,  6 May 2024 13:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D7EC3277B;
	Mon,  6 May 2024 13:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715002527;
	bh=VjxeNKYDFVNa7bVWlPBb3FkbK1nSMTj0nhXJcYaVwIc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nHNFPtEnN3DVovJIBZ8EXSpxncOzcTVLRw3OInR2qD9SW4Pm67duBMCPv7Q3Q6QWH
	 juRnQIPbSSpg8gldlPDW4Odb4mDx/13lvV8Ysvk0EOk2HZl4JGJH9w5GKTfgmSXPWU
	 LvpWVIGdEYLk+OcBURS1Vk9s+E5wLWsNogrkMppg9wsqrARmRiRISdmUFWb3AyWRYj
	 2A5nZTil8CCd/WMzeVVgBMLd21jL64TBKx0F1K6mewxMxjSS0TPtuSocvJobJR+ifn
	 Qwr9NYW28ddIPfCNlIHS02bMPknXUFNqc+e8YaNLqdtHx9fOrZ8snWCEkl9Gd43rEG
	 PTABT1wdl9rvQ==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:34 +0200
Subject: [PATCH 05/20] drm/bridge: tc358775: add crtc modes fixup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-5-545dcf00b8dd@kernel.org>
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
In-Reply-To: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Vinay Simha BN <simhavcs@gmail.com>, 
 Tony Lindgren <tony@atomide.com>
Cc: Daniel Semkowicz <dse@thaumatec.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_063531_920122_9E3CB79E 
X-CRM114-Status: GOOD (  15.32  )
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

The bridge has some limitations regarding the horizontal display
timings. In particular, the pulse width has to be at least 8 pixels
and all horizontal timings have to be a multiple of two pixels, except
for the front porch which is ignored by the bridge anyway.

To accommodate that, add pixels to the pulse width and the back porch
until these requirements are satisfied. The added pixels are then
substracted from the front porch so we don't actually change the pixel
clock (or framerate).

Fixes: b26975593b17 ("display/drm/bridge: TC358775 DSI/LVDS driver")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 980f71ea5a6a..720c0d63fd6a 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -502,6 +502,37 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 	d2l_write(tc->i2c, LVCFG, val);
 }
 
+/*
+ * According to the datasheet, the horizontal back porch, front porch and sync
+ * length must be a multiple of 2 and the minimal horizontal pulse width is 8.
+ * To workaround this, we modify the back porch and the sync pulse width by
+ * adding enough pixels. These pixels will then be substracted from the front
+ * porch which is ignored by the bridge.  Hopefully, this marginal modified
+ * timing is tolerated by the panel. The alternative is either a black screen
+ * (if the sync pulse width is too short or a shifted picture if the lengths
+ * are not even).
+ */
+static bool tc_mode_fixup(struct drm_bridge *bridge,
+			  const struct drm_display_mode *mode,
+			  struct drm_display_mode *adj)
+{
+	u16 hsync_len, hback_porch;
+
+	hback_porch = adj->htotal - adj->hsync_end;
+	if (hback_porch & 1) {
+		adj->hsync_end -= 1;
+		adj->hsync_start -= 1;
+	}
+
+	hsync_len = adj->hsync_end - adj->hsync_start;
+	if (hsync_len < 8)
+		adj->hsync_start -= 8 - hsync_len;
+	else if (hsync_len & 1)
+		adj->hsync_start -= 1;
+
+	return adj->hsync_start >= adj->hdisplay;
+}
+
 static enum drm_mode_status
 tc_mode_valid(struct drm_bridge *bridge,
 	      const struct drm_display_info *info,
@@ -603,6 +634,7 @@ static const struct drm_bridge_funcs tc_bridge_funcs = {
 	.attach = tc_bridge_attach,
 	.pre_enable = tc_bridge_pre_enable,
 	.enable = tc_bridge_enable,
+	.mode_fixup = tc_mode_fixup,
 	.mode_valid = tc_mode_valid,
 	.post_disable = tc_bridge_post_disable,
 };

-- 
2.39.2


