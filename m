Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDC7CA0FE7
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Aug 2025 15:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AF58YK4IMRXyirmKcVJRrNhJiITvKQsOZ0BfhD8yyE=; b=TwoV+lbkJchDAu02C8Q5GksSfS
	OuAnrmIbxDFhevoRjWCPPkLp02oBV46IwJYrUhYW39xKFBlE2wA4ObaX/bxdLygec5Uxf++WumzhZ
	xGS1QYfklsbFGuQgrDZb5OM93uq19LvKeSeNVfzbdmqz1KLh3XbXZKH1EX6uTmsrT1n5ARTU/tIvh
	Pn1FTK8uJU5x0Y+MDYpWDR2gkWyLHyiy4U9tdsIe7Ex0VCFSeC30VicZ+oR7cmRjkz2eGGOiHbvox
	mWu3+K1fBkJu97zCxrxro/Z6VVPnYCzlFYYyZK0Uqot2G8SlfYYCzXuKvwpcsnXi346YdAh5i++9i
	7XPdVmPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYhZ-00000008Omu-1lFo;
	Mon, 25 Aug 2025 15:01:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqXUY-000000087cU-1M0W;
	Mon, 25 Aug 2025 13:44:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA7965C5D9A;
	Mon, 25 Aug 2025 13:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94136C4CEED;
	Mon, 25 Aug 2025 13:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756129438;
	bh=NL/gUAJ4sIjNPwnSozhuU7h8qZ5NynPwYFn0NVg/z20=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fgBDgoVaIourxnbrRS4y/CZZLhlIVtTl22TtkyJZS9peLcfe0F/A7gCevRIm6Zg2k
	 Adzy0laZ6fLc64b24jqtcP2Qfv/l+BbQZCoQJyc9ib1ttq09onAE/vwEfx0DHLpJOz
	 cdvfG9xGYTkT+CmI85G1PTC3BsClqpm70q/Ncl3mPjbX6sorTRsCFXXXXCLPEPv3vp
	 CYglnd3Vh3m3qxm921UwItW3CD9zSalFHDmIUk8P+2gH3yvmL5LEeZibt9OCpHuSzd
	 1NI0nqoWyFWUmxMzJP73OeR1DEr8Eq27jupj6OHzdeJpoQuE2rU1cTmSyaAli46hZy
	 LYHaROrLYRqcw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:13 +0200
Subject: [PATCH 08/39] drm/vkms: Convert vkms_crtc_atomic_check() to use
 new plane state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-8-f08ccd9f85c9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1691; i=mripard@kernel.org;
 h=from:subject:message-id; bh=NL/gUAJ4sIjNPwnSozhuU7h8qZ5NynPwYFn0NVg/z20=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlrMkqThP5ZJadaNoUdO8n6QVDol8o0/Rfqa10bWOe7v
 PdctdelYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExkTiljwzPhJ+ffhTz3r7bd
 v2NtRK/7KtPLd7jXRV9ZPcfQMm1jl4HL1/OnX2287qdm4BfTaBb/m7Gh580OtuKPrUeOetfdWxc
 Z+jekLPv4x/mrZv1X0r+Qv7XsfVfGnwLz692/5yTsyzHQl5gLAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_064410_445454_540C0E2E 
X-CRM114-Status: GOOD (  13.63  )
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

The vkms_crtc_atomic_check() function calls the deprecated
drm_atomic_get_existing_plane_state() helper for its internal mode
checking logic.

During atomic_check, the existing state is the new state and
drm_atomic_get_existing_plane_state() can thus be replaced by
drm_atomic_get_new_plane_state().

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index e60573e0f3e9510252e1f198b00e28bcc7987620..48237f32ac3b8f78b1495e8fbcc630be863ec7e4 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -183,11 +183,11 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 	ret = drm_atomic_add_affected_planes(crtc_state->state, crtc);
 	if (ret < 0)
 		return ret;
 
 	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
-		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state, plane);
+		plane_state = drm_atomic_get_new_plane_state(crtc_state->state, plane);
 		WARN_ON(!plane_state);
 
 		if (!plane_state->visible)
 			continue;
 
@@ -199,11 +199,11 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 		return -ENOMEM;
 	vkms_state->num_active_planes = i;
 
 	i = 0;
 	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
-		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state, plane);
+		plane_state = drm_atomic_get_new_plane_state(crtc_state->state, plane);
 
 		if (!plane_state->visible)
 			continue;
 
 		vkms_state->active_planes[i++] =

-- 
2.50.1


