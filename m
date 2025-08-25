Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384BBCA0FE7
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Aug 2025 15:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASo8isZ0V/H5JqJ77wFtuR1j73PROrgqcBpXao68I/w=; b=R54PuUOHze9TB/X5lkNIKNjnl+
	gXftCW+WgJlfcqILP4GCy5iJanw6eUXi0ILXahAViZBOPz+H6LxsJFk+HOMSGXjozVk++bofLbaQC
	+SDMj1KEJ71VesSU2MnnkCaTSQKFmPwjc38v3XR8+68WyiaXE35Es3NVl+uj8MqhCvncDy7OGKBiX
	21YdOCE7RCe5Kg9Ui7c7+dmJwaMoN3qeDvgROJPKPW1eHzWL5ACrcU8CagX+L43dAa09BZmkpJ46U
	UF3klIpydBG/ordmPCQ6luShA+TBxwBKEdQTrB/UE07r+5Jx7mlSf6L76eSOHW33gnKHHuNFwCFN8
	fWEFhNKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYiG-00000008Pj2-3l4D;
	Mon, 25 Aug 2025 15:02:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqXVD-0000000884I-3jAd;
	Mon, 25 Aug 2025 13:44:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52AA75C5E01;
	Mon, 25 Aug 2025 13:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99272C4CEF4;
	Mon, 25 Aug 2025 13:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756129491;
	bh=6I4cjWmc+WVPkO4VqeMBMZH+a0S+K78ArYVVbJCy75Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UBdZ4fvbcB1gK1sPvlc52XJT6vIylouOXMxiTewWW3hWnHN10+5S61d2kYXfRcpTR
	 nSzJAcyff47d8IrGfcWUmu55Xi4jjvfgah/sih7/rKeB5ZjSJn1RqEYRgwmmGw7gBS
	 aOUVGTtQTDppuaBctyt/nBuJzLOO/C/54XJM+TftDyJVNgGm6Qms30K+o6+6LQ3dKa
	 ExFWKB4zyxlSqaGzX+p7IJxm7g6BySjZFfCoB+sGcZ+P+gXp85TfV9ECJhwRB7anbU
	 kiZKCUupNZr+2DafU3269x/YhhRyOsq4d1DIL8z11nuX6RejgDn/wPQPwJ0khJ2yJC
	 hxxLMLIddLyxg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:33 +0200
Subject: [PATCH 28/39] drm/rockchip: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-28-f08ccd9f85c9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2507; i=mripard@kernel.org;
 h=from:subject:message-id; bh=6I4cjWmc+WVPkO4VqeMBMZH+a0S+K78ArYVVbJCy75Y=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlrMur+pf76lrLm4LXnv5ZzPP6Tq56oGpR9I1d/8aMdr
 Ld5v/1o6ZjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATqd7B2PDrqNQt9cmMHx8H
 PjjOMLnkiuE0rcrudMmf2znz4hKdm9iLCqzOx+/92vM/cU9ajNLeCMaGfc4GLTkLr+1pkv24xYm
 JvW5N4ldHv6K3GbpXUz7W+Fj3/5p6+/RRd9NT3AodSV/5Vq8AAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_064452_013488_7FE536BC 
X-CRM114-Status: GOOD (  13.35  )
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

The rockchip atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c  | 6 +++---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index ba6b0528d1e5a493cdef85dd1ea258e70c31ccd5..5369b77ea434c794ed7d509802fa29c39d2bfa7a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -824,12 +824,11 @@ static int vop_plane_atomic_check(struct drm_plane *plane,
 					DRM_PLANE_NO_SCALING;
 
 	if (!crtc || WARN_ON(!fb))
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale, max_scale,
@@ -1090,11 +1089,12 @@ static int vop_plane_atomic_async_check(struct drm_plane *plane,
 		return -EINVAL;
 
 	if (!plane->state->fb)
 		return -EINVAL;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state, new_plane_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state,
+						   new_plane_state->crtc);
 
 	/* Special case for asynchronous cursor updates. */
 	if (!crtc_state)
 		crtc_state = plane->crtc->state;
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index b50927a824b4020a7ffd57974070ed202cd8b838..4556cf7a33641529c673b8d7842115dc739dede2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1011,11 +1011,11 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 
 	vp = to_vop2_video_port(crtc);
 	vop2 = vp->vop2;
 	vop2_data = vop2->data;
 
-	cstate = drm_atomic_get_existing_crtc_state(pstate->state, crtc);
+	cstate = drm_atomic_get_new_crtc_state(pstate->state, crtc);
 	if (WARN_ON(!cstate))
 		return -EINVAL;
 
 	ret = drm_atomic_helper_check_plane_state(pstate, cstate,
 						  min_scale, max_scale,

-- 
2.50.1


