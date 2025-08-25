Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8061BCA0FED
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Aug 2025 16:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EhyqT5/Q1ZXtqubHnY3zddlOH8QWimHjDyFRzwlGGdo=; b=cOvYk0/Zh61USRrlRXGRVswf49
	AuvrR3plCEh32/qZtcj6DUkiNGXTzrHZmJlqISPdAUOidBb5a6BKpK3aabhXl28A69rDOEv754ILR
	irxkTAlwehchFygGb0CDoL/91RW9Gd8ERRifH/js3SycTxXiyAXnQQS8IfT5XGIvXzk2jk3EXHBDy
	fQoUwy2Duj5pevPi5KuVrpAfp+lFELCzeSiR0JDamB3304rsy5k50DvLcrkvknFlkvYCyFrCAqWxB
	zx6DaZ9pT1yrqlngIYY8iGEpCT8R1OkLBmi8FSmQR53fp843t+hozbbqh/Cxv06pb+6wWPgc8rvtB
	XRI5AYyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqa6P-00000008fL3-4ADb;
	Mon, 25 Aug 2025 16:31:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqXUS-000000087Xz-1moY;
	Mon, 25 Aug 2025 13:44:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD5B344D70;
	Mon, 25 Aug 2025 13:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8ACC116D0;
	Mon, 25 Aug 2025 13:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756129443;
	bh=C6SBK9f+7bulLE7wK72wcC2UO49lebBjUaSS4/etSHk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kuFMlZcOaggy7H/TnW/2fIeuvmGmNhqe545JxOWu+FKPHXCEv3cAOLv7tFlmWINkf
	 Qv87MjPZa7xy+awrIvACXNLmh3Ddwulo4Ex+qJvBLrOfsaxZRy0LTfHmH7egdKHuw1
	 l8sFTK/Pdfx7iVcmtJNj2AxSGyraWiX89sn//6GtbSGKZjOH9u+jUI281clOQemzKy
	 XO2aF7QrcXf9T8/6hOLCrzEUPZJ0zVb0755Y60NtFFeA2c0N6OAqkk4E6UyIDi6Oc1
	 AQUmBn2qvW9NaLqqThvbLnL6eWIYLNBzg4lvtrtufrENmucMM/D5JAiQnxR8zvGCk7
	 ifM6CCKgvkArw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:15 +0200
Subject: [PATCH 10/39] drm/atomic: Remove unused
 drm_atomic_get_existing_plane_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-10-f08ccd9f85c9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476; i=mripard@kernel.org;
 h=from:subject:message-id; bh=C6SBK9f+7bulLE7wK72wcC2UO49lebBjUaSS4/etSHk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlrMso6pBSFbaIeRLYXyL7czNnC9c3D9m7r6b35fc568
 uX7eP52TGVhEOZkkBVTZHkiE3Z6efviKgf7lT9g5rAygQxh4OIUgIkYZjHWh66a8CAp7eDRuS8+
 rw0uiLZuyqhdb2fRXXz0xUaOPybN1glbM/LOJmn4bu/h8DzXX7SLsaFpjobJ8Xk6SaYX3P8eUDQ
 VD9xw4WCslc7hKQZVNuoJm5U9l4ZFnH6zrqDq88Ef7z5EBwAA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_064404_509500_FDF76D43 
X-CRM114-Status: GOOD (  11.60  )
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

The drm_atomic_get_existing_plane_state() function is deprecated and
isn't used anymore, so let's remove it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_atomic.h | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 82e74d9444c4fa7f02ee0e472c8c68f7bc44cc6a..2f2c92fc4c20ee4e6abd6911bd574969d9cabbbb 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -696,28 +696,10 @@ drm_atomic_get_new_crtc_state(const struct drm_atomic_state *state,
 			      struct drm_crtc *crtc)
 {
 	return state->crtcs[drm_crtc_index(crtc)].new_state;
 }
 
-/**
- * drm_atomic_get_existing_plane_state - get plane state, if it exists
- * @state: global atomic state object
- * @plane: plane to grab
- *
- * This function returns the plane state for the given plane, or NULL
- * if the plane is not part of the global atomic state.
- *
- * This function is deprecated, @drm_atomic_get_old_plane_state or
- * @drm_atomic_get_new_plane_state should be used instead.
- */
-static inline struct drm_plane_state *
-drm_atomic_get_existing_plane_state(const struct drm_atomic_state *state,
-				    struct drm_plane *plane)
-{
-	return state->planes[drm_plane_index(plane)].state;
-}
-
 /**
  * drm_atomic_get_old_plane_state - get plane state, if it exists
  * @state: global atomic state object
  * @plane: plane to grab
  *

-- 
2.50.1


