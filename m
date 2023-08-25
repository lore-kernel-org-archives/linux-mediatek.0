Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBE2C71133
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 12:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dyms579liwRNhDyGW0s9jFPvgQR2Nqbkr6/Yd5de6Fo=; b=PjbkyFnfUH8914nSN11Xeytuq8
	IRZDBGyFBoilPaPOHcWdDqas7hu5vHiYMbYYBkpxlFoqyKrigiKki4+pNW3rY8u1rMzwlJRj1eDXE
	aDHn+R9yIYik0fW8bRAMY/P9O1Y6ruma+nD9I0gRutiTgTxREX2agEufJWQdfp3tSKMrpQvKEKbiF
	EDFdlV5S+GvOy2TeVUJmXwZbOvhkgp5VBn9n/6FERFNutGnTNZn4f11t6I+rgItRFahYHjav5OA87
	HjdTIgKujTHri6KElE3GYad84+GPLJAqrXwq0m53rZpkW/gshT+73vwXRbQ2P2JrhSRx/A35jeYgi
	mf9a3x5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVt2-005NrO-23;
	Fri, 25 Aug 2023 12:26:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVsc-005NaZ-36;
	Fri, 25 Aug 2023 12:25:37 +0000
Received: from localhost.localdomain (unknown [171.76.83.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 360716607289;
	Fri, 25 Aug 2023 13:25:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1692966333;
	bh=LOz7TrCPhydL2soCFtC1quGrk7D5lvCnOflJhvHbSi8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IC+j8aWSW5Q6iKetS/kVKuYIOvKiSN332Fd+fndBULeLEBLn+nZYaf8kes/bu9mK+
	 OPwZUNYXIQmgYM5DAMSLAsoK6GLF0Uey4qg/27NDVaBZX2zX1fYQc87y/QFQ+OJYte
	 hCuy5Gr5AJRHCxd+x53oL2cab9HMFeCGwgvvHKbi1aqJw/oBVLwWGC1oiLZQXxOFLU
	 /uhFVr8NlLagySoIkmzXKrN8AAmijpWUTX+nhQ6XRbKB8fmUu75vJWUoyTJlQIL6Ey
	 CdY8vy6H/d7B8cA3qEhMdQCYho15wxcnDs77OvglydRSsP9q4jz4cIcdOc7/EJusC9
	 cxEeqNlvSS5uw==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: helen.koike@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	david.heidelberg@collabora.com,
	daniels@collabora.com,
	emma@anholt.net,
	robclark@freedesktop.org,
	gustavo.padovan@collabora.com,
	robdclark@google.com,
	anholt@google.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	corbet@lwn.net,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	heiko@sntech.de,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 5/6] drm: ci: Update xfails
Date: Fri, 25 Aug 2023 17:54:34 +0530
Message-Id: <20230825122435.316272-6-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230825122435.316272-1-vignesh.raman@collabora.com>
References: <20230825122435.316272-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_052535_613961_B1AE9BE6 
X-CRM114-Status: GOOD (  12.07  )
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

Update amdgpu-stoney-fails, mediatek-mt8173-flakes,
mediatek-mt8173-fails, rockchip-rk3399-fails, rockchip-rk3399-flakes,
rockchip-rk3288-flakes, i915-cml-fails, i915-cml-flakes,
msm-apq8016-flakes files.

Add tests that fail sometimes into the *-flakes file and tests
that are failing into the *-fails file.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt    |  1 -
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt     |  1 -
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt    |  2 ++
 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt    |  1 +
 .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt  |  2 --
 .../gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt | 16 ++++++++++++++++
 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt |  2 ++
 .../gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt |  1 +
 .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt  |  4 ++--
 .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt |  3 +++
 10 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
index bd9392536e7c..58bfded8a3fc 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
@@ -1,7 +1,6 @@
 kms_addfb_basic@bad-pitch-65536,Fail
 kms_addfb_basic@bo-too-small,Fail
 kms_async_flips@invalid-async-flip,Fail
-kms_atomic@plane-immutable-zpos,Fail
 kms_atomic_transition@plane-toggle-modeset-transition,Fail
 kms_bw@linear-tiling-1-displays-2560x1440p,Fail
 kms_bw@linear-tiling-1-displays-3840x2160p,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
index 6139b410e767..5f513c638beb 100644
--- a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
@@ -1,4 +1,3 @@
-kms_color@ctm-0-25,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
index 0514a7b3fdb0..f06f1a5b16f9 100644
--- a/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
@@ -7,6 +7,8 @@ kms_bw@linear-tiling-3-displays-3840x2160p
 kms_bw@linear-tiling-4-displays-1920x1080p
 kms_bw@linear-tiling-4-displays-2560x1440p
 kms_bw@linear-tiling-4-displays-3840x2160p
+kms_color@ctm-0-25
+kms_cursor_legacy@torture-move
 kms_draw_crc@draw-method-xrgb8888-render-xtiled
 kms_flip@flip-vs-suspend
 kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling
diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
index fc41d13a2d56..3aee1f11ee90 100644
--- a/drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
@@ -8,6 +8,7 @@ kms_bw@linear-tiling-3-displays-3840x2160p
 kms_bw@linear-tiling-4-displays-1920x1080p
 kms_bw@linear-tiling-4-displays-2560x1440p
 kms_bw@linear-tiling-4-displays-3840x2160p
+kms_cursor_legacy@torture-bo
 kms_flip@blocking-wf_vblank
 kms_flip@wf_vblank-ts-check
 kms_flip@wf_vblank-ts-check-interruptible
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
index 671916067dba..c8e64bbfd480 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
@@ -1,5 +1,4 @@
 kms_3d,Fail
-kms_addfb_basic@addfb25-bad-modifier,Fail
 kms_bw@linear-tiling-1-displays-1920x1080p,Fail
 kms_bw@linear-tiling-1-displays-2560x1440p,Fail
 kms_bw@linear-tiling-1-displays-3840x2160p,Fail
@@ -11,7 +10,6 @@ kms_bw@linear-tiling-3-displays-2560x1440p,Fail
 kms_bw@linear-tiling-3-displays-3840x2160p,Fail
 kms_color@pipe-A-invalid-gamma-lut-sizes,Fail
 kms_color@pipe-B-invalid-gamma-lut-sizes,Fail
-kms_force_connector_basic@force-connector-state,Fail
 kms_force_connector_basic@force-edid,Fail
 kms_force_connector_basic@force-load-detect,Fail
 kms_force_connector_basic@prune-stale-modes,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
index e69de29bb2d1..9ed6722df2c2 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
@@ -0,0 +1,16 @@
+core_setmaster_vs_auth
+kms_addfb_basic@addfb25-bad-modifier
+kms_color@invalid-gamma-lut-sizes
+kms_cursor_legacy@cursor-vs-flip-atomic
+kms_cursor_legacy@cursor-vs-flip-legacy
+kms_force_connector_basic@force-connector-state
+kms_hdmi_inject@inject-4k
+kms_plane_scaling@plane-scaler-with-pixel-format-unity-scaling
+kms_plane_scaling@plane-upscale-with-modifiers-20x20
+kms_plane_scaling@plane-upscale-with-pixel-format-20x20
+kms_plane_scaling@plane-upscale-with-rotation-20x20
+kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20
+kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20
+kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20
+kms_prop_blob@invalid-set-prop
+kms_prop_blob@invalid-set-prop-any
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
index 0e3b60d3fade..cd48a8c1d569 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
@@ -1,3 +1,5 @@
+kms_cursor_legacy@forked-bo
+kms_cursor_legacy@forked-move
 kms_force_connector_basic@force-connector-state
 kms_force_connector_basic@force-edid
 kms_force_connector_basic@force-load-detect
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
index 45c54c75c899..081fe6f8d488 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
@@ -1,6 +1,7 @@
 kms_addfb_basic@addfb25-bad-modifier
 kms_cursor_crc@.*
 kms_flip@basic-flip-vs-wf_vblank
+kms_flip@blocking-wf_vblank
 kms_invalid_mode@int-max-clock,Crash
 kms_pipe_crc_basic@.*
 kms_properties@connector-properties-atomic,Crash
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
index 6db08ba6b008..029a3be3164d 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
@@ -2,14 +2,13 @@ kms_color@legacy-gamma,Fail
 kms_color@pipe-A-legacy-gamma,Fail
 kms_color@pipe-B-legacy-gamma,Fail
 kms_flip@basic-flip-vs-wf_vblank,Fail
-kms_flip@blocking-wf_vblank,Fail
 kms_flip@dpms-vs-vblank-race,Fail
 kms_flip@flip-vs-absolute-wf_vblank,Fail
 kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
 kms_flip@flip-vs-blocking-wf-vblank,Fail
 kms_flip@flip-vs-panning,Fail
 kms_flip@flip-vs-panning-interruptible,Fail
-kms_flip@flip-vs-wf_vblank-interruptible,Fail
+kms_flip@modeset-vs-vblank-race,Fail
 kms_flip@plain-flip-fb-recreate,Fail
 kms_flip@plain-flip-fb-recreate-interruptible,Fail
 kms_flip@plain-flip-ts-check,Fail
@@ -35,3 +34,4 @@ kms_plane_multiple@atomic-pipe-B-tiling-none,Fail
 kms_plane_multiple@tiling-none,Fail
 kms_prime@basic-crc,Fail
 kms_rmfb@close-fd,Fail
+kms_universal_plane@universal-plane-pipe-B-functional,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
index 4c0539b4beaf..869426a02cbd 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
@@ -1,7 +1,10 @@
 
+kms_color@gamma
 kms_cursor_crc@.*
+kms_flip@blocking-wf_vblank
 kms_flip@dpms-vs-vblank-race-interruptible
 kms_flip@flip-vs-expired-vblank
+kms_flip@flip-vs-wf_vblank-interruptible
 kms_flip@modeset-vs-vblank-race-interruptible
 kms_pipe_crc_basic@.*
 kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-A
-- 
2.40.1


