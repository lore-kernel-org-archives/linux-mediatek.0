Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA23CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 07:43:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9F70610FD
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 07:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9F70610FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kD6ZXSLd4QK/xPIGZ3kP+WW/7x18WwjvF/OBc194BVQ=; b=w7I9OfAnC/LK5A
	KU5xeUMPsPHHaBlpAQPgiM5Ctsm+B9oOTpfy6FjMRXsAtt5s31fcu+RoGRW0IAGXld9c8vHbAT/Tl
	bOVMykbdsYTtLeNHd7KNWaTXFBRwxZGsnARH4BsufBf4/j5Hm+WX+WcSvx1o+N3RfoC5koBSH3gQa
	+e9rgN3XCgFk0FltYw6vqSUl9SvWQpgKEPKFuwPLbTnPH7wkbmDpQebphy1LvKqr1Voxdm8Dckyuz
	V4KpFp9lHDcG3+4mmygmO8TWNn99umfmkmS+tUfjsTNUGwpgK0NcZRsWicdrEqU4fUaS98TU1O4do
	NeUa6/uLrXmrt35Xsziw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg04g-0078G2-2C; Thu, 28 Oct 2021 07:43:46 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg04U-0078Ds-0J; Thu, 28 Oct 2021 07:43:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E8C8F1F44C4E
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dafna.hirschfeld@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] drm/mediatek: hdmi: Perform NULL pointer check for
 mtk_hdmi_conf
Date: Thu, 28 Oct 2021 09:43:11 +0200
Message-Id: <20211028074311.57842-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_004334_223302_6E26DA43 
X-CRM114-Status: GOOD (  11.15  )
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

In commit 41ca9caaae0b ("drm/mediatek: hdmi: Add check for CEA modes only")
a check for CEA modes was added to function mtk_hdmi_bridge_mode_valid()
in order to address possible issues on MT8167; moreover, with commit
c91026a938c2 ("drm/mediatek: hdmi: Add optional limit on maximal HDMI mode clock")
another similar check was introduced.

Unfortunately though, at the time of writing, MT8173 does not provide
any mtk_hdmi_conf structure and this is crashing the kernel with NULL
pointer upon entering mtk_hdmi_bridge_mode_valid(), which happens as
soon as a HDMI cable gets plugged in.

To fix this regression, add a NULL pointer check for hdmi->conf in the
said function, restoring HDMI functionality and avoiding NULL pointer
kernel panics.

Fixes: 41ca9caaae0b ("drm/mediatek: hdmi: Add check for CEA modes only")
Fixes: c91026a938c2 ("drm/mediatek: hdmi: Add optional limit on maximal HDMI mode clock")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 5838c44cbf6f..3196189429bc 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1224,12 +1224,14 @@ static int mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 			return MODE_BAD;
 	}
 
-	if (hdmi->conf->cea_modes_only && !drm_match_cea_mode(mode))
-		return MODE_BAD;
+	if (hdmi->conf) {
+		if (hdmi->conf->cea_modes_only && !drm_match_cea_mode(mode))
+			return MODE_BAD;
 
-	if (hdmi->conf->max_mode_clock &&
-	    mode->clock > hdmi->conf->max_mode_clock)
-		return MODE_CLOCK_HIGH;
+		if (hdmi->conf->max_mode_clock &&
+		    mode->clock > hdmi->conf->max_mode_clock)
+			return MODE_CLOCK_HIGH;
+	}
 
 	if (mode->clock < 27000)
 		return MODE_CLOCK_LOW;
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
