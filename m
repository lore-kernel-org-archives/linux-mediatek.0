Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A747C10F16
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 14:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dPxi5eULgQtjUJEWm5XQ/stzKXsCGde2+bCkQjq5p4=; b=H3nHS7r/Cspd9IBAhUUfrg30ra
	3EKuKg7O9BtsztE1vfIBjlm3xrHbfL8ZTju8ocZt7Ep5w09GKJtQWeMdYGtOh4LbCfsoK7KBHJ/fD
	hdwQPDzAzNoBzOGRwb9MvRGYB7EzAJ77EIaKO+SM8+xZ6yUcf5N8SJHsxbySm257C+mWrIUZ8HtYZ
	FJbBhAHlDPKCUUg4lYGL9cL9LPNpSCos86/5JBb2A6S/gzgROgH7b0FhSMp0W3qwY6AvuJsJLHiRh
	bWKvwCRMFc6NAmQ0gCNpqvi+eWxXdTL2U+Oyt2/wXQK6Ye6FWjje+tOqIaQUHGPaRFb+NijbBWWWF
	u4w/H/KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3zav-00000007ikU-2VHe;
	Mon, 06 May 2024 14:45:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yV3-00000007T4h-3kS4;
	Mon, 06 May 2024 13:35:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 36CF7612B7;
	Mon,  6 May 2024 13:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775B7C116B1;
	Mon,  6 May 2024 13:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715002522;
	bh=yYJipGADf8UJHcchwZluJd8e0AxButwRdoUdpxl7l5Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aoVRIpuMXfmKxTrrGGCBOz/nNDclfDeb3r8oq/8cGNaMUauqFc6TvCTxMWYoqLp/E
	 a4nWfgjh6HayGaegeyZ98S6GpU4KldaRIloHqEfuIt7hKnaxXCQh1qF4/D8cXGg+Nd
	 Zd4DBbnx2msAtHLmPP0jQB3wgtHs6Ox0ln9bE9ibwLUWM0UzkJxM92q+7yF9jvUCDu
	 14WOuZ6O5oGE3ga71J92BHv509CN80KR2qf/qAxWygZ1xZAe8PEigeFxBGBMDIn8vw
	 IMaTlAZq0ZF6YXWfO0SFI/u0PvUIQ9a3VQyzwALosJthO29zjoAQG3sSUnGVnbQ/7J
	 awDu2v5DOzH3A==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:33 +0200
Subject: [PATCH 04/20] drm/bridge: tc358775: fix regulator supply id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-4-545dcf00b8dd@kernel.org>
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
X-CRM114-CacheID: sfid-20240506_063526_589888_B3040FCF 
X-CRM114-Status: GOOD (  11.12  )
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

The regulator id is given without the "-supply" postfix. With that
fixed, the driver will look up the correct regulator from the device
tree.

Fixes: b26975593b17 ("display/drm/bridge: TC358775 DSI/LVDS driver")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 3b7cc3be2ccd..980f71ea5a6a 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -680,14 +680,14 @@ static int tc_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	tc->vddio = devm_regulator_get(dev, "vddio-supply");
+	tc->vddio = devm_regulator_get(dev, "vddio");
 	if (IS_ERR(tc->vddio)) {
 		ret = PTR_ERR(tc->vddio);
 		dev_err(dev, "vddio-supply not found\n");
 		return ret;
 	}
 
-	tc->vdd = devm_regulator_get(dev, "vdd-supply");
+	tc->vdd = devm_regulator_get(dev, "vdd");
 	if (IS_ERR(tc->vdd)) {
 		ret = PTR_ERR(tc->vdd);
 		dev_err(dev, "vdd-supply not found\n");

-- 
2.39.2


