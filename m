Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF0ACA0FE8
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Aug 2025 15:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZxd9eYS815lGAS40gKDOSDnLp0ddSgV/akvsl4s/Kg=; b=umV+EcRBw9Gcc74EdPw8kbb6N8
	cOQ0b1NfpTZyFdhkft61TO5J/L3/KR0K8grvnVW94gap/lHUCJjDpCDG5PezSCPVfZWDRmfEzj7z2
	6N03Z/oIFwX7C0/DUQ9M+PsKlimE6XnKIlO6dAegGUKEyNpp5byALpbOs+xgjGni65y8jFPbhg9vy
	PVjqXLSrIPv1yd88FZvkPcG06SeA6L/k1cYACxVs4W07Q4BK/ug400tGYCFm0TbVtQTy7a73IgOeu
	GSfmcrKOslLR0KMAe/nEL+mAEmXIZxVfKi7Z4USyREkJrTL5CJ1gdpuqEI4qXzTHdQFDS2L0LMTAA
	vt0JfS/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYim-00000008QUL-3VQ6;
	Mon, 25 Aug 2025 15:02:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqXVl-000000088KV-1bDp;
	Mon, 25 Aug 2025 13:45:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BB9A45C5E39;
	Mon, 25 Aug 2025 13:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92DFDC19423;
	Mon, 25 Aug 2025 13:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756129513;
	bh=YPy4z4OaJoWUL9r4KrGzI/WKjSjH8TP5L3pV+kz8Tdg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kHPoqmIKFxMx29yCm9My/Ia0c6HynNhlcgUCc3kcBWfFAxgwb9hmbKmed6kdKTInR
	 VyC/9fJVC2g6e9wB0rQnWTZZnz//e5fzg7BAaC+8lPqXDaO+6qC3Hw63tPVV3dmzj5
	 2XEf2UxmqSjDQ9sNZChmihl3Hh6LukbtI6GghaMlOyPPyzOjnwuJF+mLqNW38hsSQ1
	 VRIApolTvHJIHUVklziyPQ7B46qjruca2szEJykJFON3oAu+1e3hcHnjuRzz6l3m2a
	 JcKnwRS08Ft8Nf0CdyZnQQUlDqypDg8KHGKttrOOX6SBYoHGUASoyzjwDyEmpSVBov
	 6imh0w7Zcreow==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:41 +0200
Subject: [PATCH 36/39] drm/atomic: Remove unused
 drm_atomic_get_existing_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-36-f08ccd9f85c9@kernel.org>
References: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org>
In-Reply-To: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Paul Cercueil <paul@crapouillou.net>, Liviu Dudau <liviu.dudau@arm.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Manikandan Muralidharan <manikandan.m@microchip.com>, 
 Dharma Balasubiramani <dharma.b@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, Paul Kocialkowski <paulk@sys-base.io>, 
 Sui Jingfeng <suijingfeng@loongson.cn>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Hans de Goede <hansg@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1526; i=mripard@kernel.org;
 h=from:subject:message-id; bh=YPy4z4OaJoWUL9r4KrGzI/WKjSjH8TP5L3pV+kz8Tdg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlrMpq4z94/mjM5g9Gl0v3fvtfWyp5dT7wuFtZMsp/gl
 eIZan+sYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzkynTG+hyu5J/GXy8duvOo
 4fv8iRN2VqVmNm5UWeSgEa+vcukzd0qmT7536edZnF1hJzQaVFfJMjYs3KU6QfJc4bONmvHWIZG
 S8hP3GjXyxnVtUFv68/QjN0bPlW9OL7vpsU28f+2NGj/7yfsB
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_064525_509391_12A487CD 
X-CRM114-Status: GOOD (  11.54  )
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

The drm_atomic_get_existing_crtc_state() function is deprecated and
isn't used anymore, so let's remove it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_atomic.h | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 89c9a059b36763205fc2fc764283423cbea62679..cba63857e920515b48b75fc3c2d5239fc1ae59c1 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -663,28 +663,10 @@ drm_atomic_get_old_crtc_for_encoder(struct drm_atomic_state *state,
 					 struct drm_encoder *encoder);
 struct drm_crtc *
 drm_atomic_get_new_crtc_for_encoder(struct drm_atomic_state *state,
 					 struct drm_encoder *encoder);
 
-/**
- * drm_atomic_get_existing_crtc_state - get CRTC state, if it exists
- * @state: global atomic state object
- * @crtc: CRTC to grab
- *
- * This function returns the CRTC state for the given CRTC, or NULL
- * if the CRTC is not part of the global atomic state.
- *
- * This function is deprecated, @drm_atomic_get_old_crtc_state or
- * @drm_atomic_get_new_crtc_state should be used instead.
- */
-static inline struct drm_crtc_state *
-drm_atomic_get_existing_crtc_state(const struct drm_atomic_state *state,
-				   struct drm_crtc *crtc)
-{
-	return state->crtcs[drm_crtc_index(crtc)].state;
-}
-
 /**
  * drm_atomic_get_old_crtc_state - get old CRTC state, if it exists
  * @state: global atomic state object
  * @crtc: CRTC to grab
  *

-- 
2.50.1


