Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6322C44521
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2026 23:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glDDRAcdG2z8u1IQ6JIBLAUYK0TMezc+/0A/g0HZvjw=; b=Oo5DvhB2NzuYXzYXMpvFv/tDTM
	kvsaeQB0FiUYELrtQAmX4CnznVXQsDDtHpiV9ic8fn1vpnOtqqCXk/apZAJoYgPOpgPnVxbmyNLas
	dAyy33mD+MTnuTE9dgiXdgravEE/PsrkzV2bNIrr8b29IpId+G1FlTKn5nSBhkLPHZX72YruE2rFM
	QP+0K5yy2SKQfrksPIwpqERjYt5C5Zb2rq4qiV1CZwRRGdroiM74IJYkJleAJZ1k4m8/rEcrh0B5e
	Apl6Dpc+v3+iPOVL6+Mbm9xUaGIpBA0VxIXR7dkoKl8pRpen5kILPB6ikELOfMsGsweYDxA61+AWv
	4GrIpmrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEaK-00000004cMO-39eg;
	Sat, 18 Jul 2026 23:36:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEaH-00000004cFr-13FL
	for linux-mediatek@lists.infradead.org;
	Sat, 18 Jul 2026 23:36:44 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4954dff6536so8402855e9.0
        for <linux-mediatek@lists.infradead.org>; Sat, 18 Jul 2026 16:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417799; x=1785022599; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=glDDRAcdG2z8u1IQ6JIBLAUYK0TMezc+/0A/g0HZvjw=;
        b=KlVdMl/qXwq+BwOa4FlBKSLOP5dLXQtXN36aHChwMf3LuLl3rknhAgXi2z65KoZsNm
         QreIdzLqGworI8aaWdCR6yWSwwOK05U8cRqXeRW8SBliS112fCIqbMtrxI+tLS5M+9qi
         g38T6972xqw6YtHlZW6z/EbmjM9AIroib4MsfUrGJg0Cjm05vdoBfvWdpwreXVoOegPx
         y18tbFIRybcg6xn8YtsC4c3VNMhefP8V71uiRhqnaUo8E9H9cWDGkVfHBBf0X24WeWJG
         Yhaota7QFGdk/sP4ZbySpsuql01GydWWGFL9VDZVK/LBgkhQyYnoTAZzcxtNacwsraR4
         2t9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417799; x=1785022599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=glDDRAcdG2z8u1IQ6JIBLAUYK0TMezc+/0A/g0HZvjw=;
        b=S4B1TVdhKF8XHE1dIbw65fY8X5ZKRo12iLSC9LP7ZnEY+ZmqGykqcF7VYrMdq+FOvJ
         q2Ez5BVBsy6g4K5LDMNyTCmISIsOhWkey1Iew4JHlsQ5D7HjD8LL0KhbvW4zhAL23ZUv
         +Lhid4DX8HcT0N07BXEntMq9m+9ezTrEACfXHRz6XqPUocfbg3Qn6eXs5czxs42hTNps
         /cEEAksUam6BiU7wCMR7U6rBxhKZzfCufEkruhndAKMlNjugYVJCWvgw8irHUimDpQFi
         zBdtm7llLHXPDNn/pAMgfGB68+6otW5kM3ydhaVp//tt5T5YdywoUg1EAS3s2eQKKfCs
         AuLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+M0nstBE0FaY76yjmMrC/GYsvqZX6f7wcLfI66NM+3aWIGPlS4KcHA4V44c/XSjjA8Q/OD7wrHFt3hFyeIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDIQD6jz2VCykCQHXWCwUfh/SD5aQ/4GKNb3hmLKJjgBoE4KT/
	J5JO4Dvf2QRtLOEvwOA4I1t8rfah9AdXh/ZYgcd/41LjZVhI1l2P9RNn
X-Gm-Gg: AfdE7ckbqBodjkh/V+JJKsPScXU2xptWBQOwU2EB78Hc7Au/yapRvcY9XGx4VyDjaZi
	XAdXtAHXqISkQ7FCt3LVY5hP1JQBKDgVZ3IjRrgqHi6LgqwTPkypyCMHC9cOcOETKvaP3lj+0PR
	GqzbE8m1JbstzqwuxUwvvGEXyiotTrv2WhCpyH+St7wunIGfRRj1i0L0PRlfojErE8XS7azPv86
	ZDJfxvrIwMlrZOtUB6k1GFlgMl7ZjK6ZR6WtfG+ijT0ELkEMz2kqZlm/3wG74phP48SKQRS6+x6
	X+CS8ILpdIoW2Np1cMf3A/Gf8Sw2sw3uyhNw+t9sSMW2yjnzzl1TTU14sQYhqJVg8HygKSpHfQv
	MOEOd42iX+Wj3IfltNmKztoXOALpSYGJ7dg52hQ7zi51pUPwQChv5so3zIDVexBTujM7Q3j+NCE
	hJLluIcNp8+A==
X-Received: by 2002:a05:600c:3b91:b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-4954a3d0065mr111986515e9.3.1784417799407;
        Sat, 18 Jul 2026 16:36:39 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:39 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:43 +0200
Subject: [PATCH 12/15] drm/arm/komeda: remove dependency on DRM simple
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-12-a78c509e3062@gmail.com>
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
In-Reply-To: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
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
X-CRM114-CacheID: sfid-20260718_163641_415575_55854481 
X-CRM114-Status: GOOD (  12.60  )
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


