Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5907CA0EFA
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Aug 2025 15:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YYjKcibBPJDjvj2ehwicFaAVSQlzEYaHEo/VbabFnyg=; b=BYalL8+aUO3UllobKXq5X5BmT6
	jqdjIykhpUy8OGwFbfLHU3aAHqEu8x73Kj3NGyYTOKKZ690zwOyvIn/7pFiJX9q0SJasP7tnEusB/
	KgiVhJuEScdF8R1JkGkJIRK7vyKlOMoeDzO+ck+0zOCjP22BPZ6FWmYoRY9dcbSLgnhw5CsR085tx
	oxxD1pqHRl+PcNvdp48mjQQK90hQqE+X9ap1ruGUynVGUMD5muB03J5B4o/JL7/yvxEQlfQgXnyqd
	yhTH/CAtek1naX0nuD+RZ3wacr8D+I3ucYXiJZ394mwVi6wmaw08rBy+sc0Br1UJl7dz4qMNtJjCx
	oAcBhhwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYi6-00000008PUw-0KZ2;
	Mon, 25 Aug 2025 15:02:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqXUx-000000087xR-3RgG;
	Mon, 25 Aug 2025 13:44:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B26440A1B;
	Mon, 25 Aug 2025 13:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDE8C4CEF4;
	Mon, 25 Aug 2025 13:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756129475;
	bh=r//PbdFPjHr7vUob6ri6yFjKMzvvCTRP454ffiE2Ecc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TCkJc+XmHGkjaks4GDLVAXSvsoo/DUF15Wv+s3w5PSpoinfeP0lRoscvqt/dAEyRN
	 /mdgP2nKlD9c8cPA5gfSWq65zZI2f8COJisGk2Qvq/VZgoUlCvb9ETNKe3RwgdENFy
	 ygQt0eStc8muabQqn9iLALMxVB8Csg4rn0Lw1nIQ2ByQyf8KypJJND79lE0JJ35h0d
	 M04mrOvmzBMFaXX/bMbbL8qJSJO/3TskneugpfRnfEJict1X65h+JOAc/ESbi7O7M8
	 se9OzCE2t36W6+/AsE1vPXuCxh/NJtQm6BgTQJH7xO31PsWLLl27VA90Di08zzo3Vi
	 K/9A7syg8gNXg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:27 +0200
Subject: [PATCH 22/39] drm/kmb: Switch to drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-22-f08ccd9f85c9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1329; i=mripard@kernel.org;
 h=from:subject:message-id; bh=r//PbdFPjHr7vUob6ri6yFjKMzvvCTRP454ffiE2Ecc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlrMqpT21gUhGLdKnj09j9gf56yS9Tn/f1nz6IiP9RWn
 9UV2fOzYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEyE4zRjDdfMJM6i79fsmvKd
 nm9j1zysZKg/6aZrVVD2MgPrb4+ins+P4+TqtxHLCElL/mI74bkGYzVL/qqAD/qCPkoVh7d4KW6
 45LLx3GnB59GM28zUi1bvkjFQDvlRUeC/ISnsqp7WyW/JXwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_064435_908418_00B02EDD 
X-CRM114-Status: GOOD (  12.01  )
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

The kmb atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/kmb/kmb_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 9e0562aa2bcb5ab4e2cbd71940ef4c147a7aa5ad..9562fe6711ffe2c5ad377e9973fcfdb76bf04daa 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -127,12 +127,11 @@ static int kmb_plane_atomic_check(struct drm_plane *plane,
 		drm_dbg(&kmb->drm, "Cannot change plane height or width after initial configuration");
 		return -EINVAL;
 	}
 	can_position = (plane->type == DRM_PLANE_TYPE_OVERLAY);
 	crtc_state =
-		drm_atomic_get_existing_crtc_state(state,
-						   new_plane_state->crtc);
+		drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
 	return drm_atomic_helper_check_plane_state(new_plane_state,
 						   crtc_state,
 						   DRM_PLANE_NO_SCALING,
 						   DRM_PLANE_NO_SCALING,
 						   can_position, true);

-- 
2.50.1


