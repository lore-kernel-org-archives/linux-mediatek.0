Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC87C44515
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 15:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glDDRAcdG2z8u1IQ6JIBLAUYK0TMezc+/0A/g0HZvjw=; b=ySZRLxqtz4sL3gMNgSVzZEOMZY
	Yq6MAgaKaGjQ5JLq6ssE3bi/m5N43p7LAnqif1+L3L7enMkUWCf2DLiMiwK4jewfhhOsdw7nIv1PP
	REjAdymyZSZYJOvXQDqde9huSVkvKKFWVmw4cSfyPzTc0c1KZ/fgG7dtrwiH6E+PKaVKOBgfz5wvq
	hzhMAPapwndbc7gY32//AfnlwqnPAdyp5IzYPD84cubpq+YCemArHCEhiw/TONruTWspgsUEwYDhk
	RdvF1yFsOpgFKoELi50XuPLl/EQMKxwqSx0T9+PCWg3p6/ZY9BoEITu7N48wqd+ULuja5TMjLvgXY
	9I/qGtDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7e-00000007Eke-0RPw;
	Mon, 20 Jul 2026 15:41:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7c-00000007EhA-0lvF
	for linux-mediatek@bombadil.infradead.org;
	Mon, 20 Jul 2026 15:41:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=glDDRAcdG2z8u1IQ6JIBLAUYK0TMezc+/0A/g0HZvjw=; b=eYPCQQFJR+aGBFYTR8qXqIeY3n
	CCEAqQ03or4n0GDd++eWT3YhSDNLpVqYktxFPHAbH0JUHR9fruHoqskH4JzSrb/4SD/NxQjDyvoEg
	/LVhHT7dFXs21LbRq0/Hb41/RzDQd38E0GBVZMYCHfWcv8CWy4gfMu3yYs4CsI3t5IbZ2QtUSIfkE
	utC5O55w5GOCb3bhm2+jJ2Mgvdk51vPX3LzIMMsqG9J9EOUwvQz3L9WHZQv7bSKsvXd4cNzMXg889
	9HcRA5Ipet3QVJfh0lxVLMUzGvOe052y5WTz/7XbkY+8yaP93hK5FnASX1Vvm7RU2kKo3fDMRYTnK
	AAREIIOg==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlq7Z-0000000GkMr-2QT6
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jul 2026 15:41:35 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47de0093c42so5587533f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 08:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562092; x=1785166892; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=glDDRAcdG2z8u1IQ6JIBLAUYK0TMezc+/0A/g0HZvjw=;
        b=syhNxJPmmJs7HLazq3io4ZsrFDt3458S5XXnyxZRNkLf7aAWpfm4UaiJxMDKdg9y/6
         4+L+RkEgs0W0QmF8XOrqbrw+2HD1UUDTk9ac3tGyI+d6jUW+W4aR/M2VlgtqsYBpY2a8
         BanPmvn2J6fOUrnsEODDGxbE/NpuGtSciCDTEZsVVQC6R5UzbntXsCy2EI5w/SEnNBxS
         NOh7cPNH+7S0QIwrmRwSoch5MeU5azCxnj6AeGW+X8K2/eAQ846wkeNiKhqxt9/H4KQW
         3owP9eMv/jygOLEeIb5AJ015pr404IXfz1PNVwQmINCENlaNb7mTVvsd1euIbvRuJ4cB
         RcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562092; x=1785166892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=glDDRAcdG2z8u1IQ6JIBLAUYK0TMezc+/0A/g0HZvjw=;
        b=Bi8YdRTS3kD9nY4H0YbuotGf7jXAJEmLt2NuxqaAHzgHHDxiLQKuUbzRju9/Wp0pCN
         QOl2JP2Q0vdWCaXYcZiF2MVUR88pPeMgXEABo68ixjeucJ6VztAtyBqtIX+TNGWzUcNE
         8WhDlxW/Vxh5DZc6OXdNqVGr1B/iK5aKhfbHkx1Z4muYXexmUWvJ4U2WfgnjzbwS6RE0
         ShtyVdW4KLQbc7EKmG8RDdPf9dUdau7akyYMfCRG5pVfx9ROmM/iN935YDadgB+FqFm8
         N/9KfkElhxGaayAImhNEE04zmvDq+Gwz2Px4wqOwsm12lh7Gg3sPu0Pa6lHNIPnmRs3R
         AOgQ==
X-Forwarded-Encrypted: i=1; AHgh+RoBSIVXqi3HXRRKEDX/ayw7zLwewz43v0+OzTs6+GqAO9AgKSrKZSKfp7tfhf0SKaYB9HgDotxENJ9XBU63VA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3bx4RjpqqjCDT5aG5AzteOxCCrpJxT3UuNVQqBcsZ2eMVr4iM
	M/rY88svBVdrxtdZ7qvLlbCvcW5cdSLaOcHgBfmQxt/Z6uWBNEUmOXxb
X-Gm-Gg: AR+sD12QQNEoj4q/5yRgLLBEuB9j+kx1JecEPzeuEL1MUpNN203I8bQIDE/DFOtqJMJ
	sTpecYgn2WEDQpLPbR0oHimBfxYLbr3/j7x+2boG7G4P0uFb1RRk8kEq+OFBQdQNc41xspbplO0
	m8EgQsUIk5TMluYSYYd3eBUlF0qsXmx5ete7I/mtvY82R4LM+T68wr09KfB5OdV4c8qn9OUNmd5
	INZAov0gbEUdJhsuOlxpZTPaRDASJfz3fPSU12LyHavJsSOR4J3t5Vag1G4Fec2DfImCSFPI9Fb
	zHSSSnegBdHOZOLLK/ilCcEBfJWCmAZPmrWiw8fb72BXjNKDGfAffVf2wRjyQetRrjlAnCeQuBy
	H7W87b9BwOM6VNk7uR0c5DgfGo+F1dLqvJKv8FBYeMNK9YkYE4TbrpH1k6hsUkmtzeqQQU0rbIS
	AA3XEWhZfXgQ==
X-Received: by 2002:a05:6000:29c8:b0:47f:699b:a80c with SMTP id ffacd0b85a97d-47f699ba8a2mr8405565f8f.52.1784562091837;
        Mon, 20 Jul 2026 08:41:31 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:31 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:44 +0200
Subject: [PATCH v2 12/15] drm/arm/komeda: remove dependency on DRM simple
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-12-5020b630668a@gmail.com>
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
In-Reply-To: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Michal Simek <michal.simek@amd.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Xinliang Liu <xinliang.liu@linaro.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-doc@vger.kernel.org, Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_164133_653518_1E927F18 
X-CRM114-Status: GOOD (  12.57  )
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

The simple KMS helpers are deprecated because they only add an
intermediate layer between drivers and atomic modesetting.

Open-code drm_simple_encoder_init() by calling drm_encoder_init()
directly and providing driver-local drm_encoder_funcs.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index e8cb782a6f8e..719568d9f7c2 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -11,9 +11,9 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_bridge.h>
 
 #include "komeda_dev.h"
@@ -635,6 +635,10 @@ static int komeda_attach_bridge(struct device *dev,
 	return err;
 }
 
+static const struct drm_encoder_funcs komeda_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int komeda_crtc_add(struct komeda_kms_dev *kms,
 			   struct komeda_crtc *kcrtc)
 {
@@ -658,7 +662,8 @@ static int komeda_crtc_add(struct komeda_kms_dev *kms,
 	 * bridge
 	 */
 	kcrtc->encoder.possible_crtcs = drm_crtc_mask(crtc);
-	err = drm_simple_encoder_init(base, encoder, DRM_MODE_ENCODER_TMDS);
+	err = drm_encoder_init(base, encoder, &komeda_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (err)
 		return err;
 

-- 
2.54.0


