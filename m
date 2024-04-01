Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0772FCD128A
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Apr 2024 07:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6up07oz+E4lRkVg4G4m1Ro3Wo23rEMwGuVVhgkbPHU=; b=FLSP75pDMk4wGGx6xAf1Kxg7rd
	evFGHftXU96POYjE2GqFwGmQKnifn8VyIIJmSy/xUhK1Q65k6ygoF6MFzbKRs0C9WJqQItPLzsrSK
	/Wig4TQGY4E175Whux+LINEVf9zWl6uIl3+X9NVac2+iXBx1Pot9pT83RI9bx0aJIbKg6z2PAb8bp
	CcGRUN8bwCN2v+4ynO6LxXG45iYl7DvqRdkYOkQDxD6nV20F3YxcKUXBIa9ZFg9WYFuXGVr0RLP6B
	9ay1y1nd4IW2Ud2nfUfoX7JOjCi90sOl5g8a/XxvJQEzqzNT6XhoT6Ggc9tIwqmntbWdAs25xh6sL
	B5AdqHeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrBuM-000000077vk-2EeX;
	Mon, 01 Apr 2024 07:16:42 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrAvj-000000071aP-0GUp;
	Mon, 01 Apr 2024 06:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711952041;
	bh=/4P3aj+65jq1KMn4eDAdcwK4Gk73ESnUIqfZFWemRFo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=0XJy+IBRTtm75nk2t7M5ce5bkQYt+TN9E9ms4ZRZk0N3pmCXV/wSQnKfK4yAqNb54
	 mbsX24AlG//18eXJfU7SR07O2tUv+OQnk4wLvr6Mu+9+/8N9enrA2ctRhNpUv93bL6
	 ZtAy4d8ROtTzD86MnUr4KdqLSNuFHR8EQHqb1Xhi6I1+aRs5ZQ0fEx534R8aUa5rrh
	 XUb1fQDaZDanTVXCOZopPyCA+QZqxw7UBeyq9W/yZJ4BPKlA2QHD6iORae6OO9SINZ
	 SVQVz1n7IbhfNb9lU7puLSsIkfe0VUpjZM5CPFTwzjdkdq7/xonpMLEm4mCA6xOScS
	 5HIfMRdsCqr8Q==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CFCA6378212B;
	Mon,  1 Apr 2024 06:13:57 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	emma@anholt.net,
	robdclark@gmail.com,
	david.heidelberg@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	hamohammed.sa@gmail.com,
	rodrigosiqueiramelo@gmail.com,
	melissa.srw@gmail.com,
	mairacanal@riseup.net,
	mcanal@igalia.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 08/10] drm/ci: rockchip: Refactor existing rockchip jobs
Date: Mon,  1 Apr 2024 11:42:33 +0530
Message-Id: <20240401061235.192713-9-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240401061235.192713-1-vignesh.raman@collabora.com>
References: <20240401061235.192713-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_231403_888641_9361A29D 
X-CRM114-Status: GOOD (  14.95  )
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

For rockchip rk3288 and rk3399, the display driver is rockchip.
Currently, in drm-ci for rockchip, only the display driver is
tested. Refactor the existing rockchip jobs so that gpu driver
testing jobs can be added later and update xfails accordingly.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Refactor the patch to rename job to indicate display driver testing,
    rename the existing xfail files.

v3:
  - Add the job name in GPU_VERSION and use it for xfail file names
    instead of using DRIVER_NAME. Also update xfails.

v4:
  - Remove the display suffix in job and rename xfails accordingly.
    Remove the change adding job name in GPU_VERSION.

v5:
  - Add rockchip-display job and skip driver-specfic tests.

---
 drivers/gpu/drm/ci/test.yml                   | 38 +++++++++-----
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   | 50 ++++++-------------
 .../drm/ci/xfails/rockchip-rk3288-flakes.txt  | 21 ++++++++
 .../drm/ci/xfails/rockchip-rk3288-skips.txt   |  6 +++
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   | 38 +++++++-------
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  | 28 +++++++++--
 .../drm/ci/xfails/rockchip-rk3399-skips.txt   |  4 ++
 7 files changed, 114 insertions(+), 71 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index d1d42ff7df2d..96b299c32c07 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -155,33 +155,47 @@ msm:sdm845:
   script:
     - ./install/bare-metal/cros-servo.sh
 
-rockchip:rk3288:
-  extends:
-    - .lava-igt:arm32
+.rockchip:
+  variables:
+    DTB: ${DEVICE_TYPE}
+    BOOT_METHOD: depthcharge
+
+.rockchip-display:
   stage: rockchip
   variables:
     DRIVER_NAME: rockchip
+
+.rk3288:
+  extends:
+    - .lava-igt:arm32
+    - .rockchip
+  variables:
     DEVICE_TYPE: rk3288-veyron-jaq
-    DTB: ${DEVICE_TYPE}
-    BOOT_METHOD: depthcharge
-    KERNEL_IMAGE_TYPE: "zimage"
     GPU_VERSION: rk3288
+    KERNEL_IMAGE_TYPE: "zimage"
     RUNNER_TAG: mesa-ci-x86-64-lava-rk3288-veyron-jaq
 
-rockchip:rk3399:
+.rk3399:
   extends:
     - .lava-igt:arm64
-  stage: rockchip
+    - .rockchip
   parallel: 2
   variables:
-    DRIVER_NAME: rockchip
     DEVICE_TYPE: rk3399-gru-kevin
-    DTB: ${DEVICE_TYPE}
-    BOOT_METHOD: depthcharge
-    KERNEL_IMAGE_TYPE: ""
     GPU_VERSION: rk3399
+    KERNEL_IMAGE_TYPE: ""
     RUNNER_TAG: mesa-ci-x86-64-lava-rk3399-gru-kevin
 
+rockchip:rk3288:
+  extends:
+    - .rk3288
+    - .rockchip-display
+
+rockchip:rk3399:
+  extends:
+    - .rk3399
+    - .rockchip-display
+
 .i915:
   extends:
     - .lava-igt:x86_64
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
index 90c63f519e9e..3137ebd4dc8e 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
@@ -1,54 +1,36 @@
 kms_3d,Crash
 kms_bw@linear-tiling-2-displays-1920x1080p,Fail
 kms_bw@linear-tiling-2-displays-2560x1440p,Fail
-kms_bw@linear-tiling-2-displays-3840x2160p,Fail
 kms_bw@linear-tiling-3-displays-1920x1080p,Fail
-kms_bw@linear-tiling-3-displays-2560x1440p,Fail
-kms_bw@linear-tiling-3-displays-3840x2160p,Fail
+kms_cursor_crc@cursor-onscreen-32x10,Crash
+kms_cursor_crc@cursor-onscreen-64x21,Crash
+kms_cursor_crc@cursor-onscreen-64x64,Crash
+kms_cursor_crc@cursor-random-32x10,Crash
+kms_cursor_crc@cursor-random-64x21,Crash
+kms_cursor_crc@cursor-random-64x64,Crash
+kms_cursor_crc@cursor-sliding-32x10,Crash
+kms_cursor_crc@cursor-sliding-32x32,Crash
+kms_cursor_crc@cursor-sliding-64x64,Crash
+kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
+kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
+kms_cursor_legacy@cursor-vs-flip-atomic,Fail
+kms_cursor_legacy@cursor-vs-flip-atomic-transitions,Fail
+kms_cursor_legacy@cursor-vs-flip-toggle,Fail
+kms_cursor_legacy@flip-vs-cursor-crc-atomic,Crash
+kms_cursor_legacy@flip-vs-cursor-crc-legacy,Crash
 kms_flip@flip-vs-modeset-vs-hang,Crash
 kms_flip@flip-vs-panning-vs-hang,Crash
-kms_force_connector_basic@force-load-detect,Fail
 kms_invalid_mode@int-max-clock,Crash
 kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Crash
 kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Crash
 kms_pipe_crc_basic@read-crc-frame-sequence,Crash
 kms_plane@pixel-format,Crash
 kms_plane@pixel-format-source-clamping,Crash
-kms_plane@plane-position-hole,Crash
-kms_plane@plane-position-hole-dpms,Crash
 kms_plane_cursor@overlay,Crash
-kms_plane_cursor@pipe-A-overlay-size-128,Fail
-kms_plane_cursor@pipe-A-overlay-size-256,Fail
-kms_plane_cursor@pipe-A-overlay-size-64,Fail
-kms_plane_cursor@pipe-A-primary-size-128,Fail
-kms_plane_cursor@pipe-A-primary-size-256,Fail
-kms_plane_cursor@pipe-A-primary-size-64,Fail
-kms_plane_cursor@pipe-A-viewport-size-128,Fail
-kms_plane_cursor@pipe-A-viewport-size-256,Fail
-kms_plane_cursor@pipe-A-viewport-size-64,Fail
-kms_plane_cursor@pipe-B-overlay-size-128,Fail
-kms_plane_cursor@pipe-B-overlay-size-256,Fail
-kms_plane_cursor@pipe-B-overlay-size-64,Fail
-kms_plane_cursor@pipe-B-primary-size-128,Fail
-kms_plane_cursor@pipe-B-primary-size-256,Fail
-kms_plane_cursor@pipe-B-primary-size-64,Fail
-kms_plane_cursor@pipe-B-viewport-size-128,Fail
-kms_plane_cursor@pipe-B-viewport-size-256,Fail
-kms_plane_cursor@pipe-B-viewport-size-64,Fail
 kms_plane_cursor@primary,Crash
 kms_plane_cursor@viewport,Crash
-kms_plane_lowres@tiling-none,Fail
-kms_plane_scaling@downscale-with-modifier-factor-0-25,Fail
-kms_plane_scaling@downscale-with-rotation-factor-0-25,Fail
-kms_plane_scaling@upscale-with-modifier-20x20,Fail
-kms_plane_scaling@upscale-with-modifier-factor-0-25,Fail
-kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
-kms_plane_scaling@upscale-with-pixel-format-factor-0-25,Fail
-kms_plane_scaling@upscale-with-rotation-20x20,Fail
-kms_prime@basic-crc,Fail
 kms_properties@connector-properties-atomic,Crash
 kms_properties@connector-properties-legacy,Crash
 kms_properties@get_properties-sanity-atomic,Crash
 kms_properties@get_properties-sanity-non-atomic,Crash
 kms_rmfb@close-fd,Crash
-kms_setmode@invalid-clone-single-crtc,Crash
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
new file mode 100644
index 000000000000..f1f22e8aecd3
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
@@ -0,0 +1,21 @@
+# Board Name: rk3288-veyron-jaq.dtb
+# Bug Report: https://lore.kernel.org/dri-devel/bdb53650-1888-30b8-93ee-2290d020af4a@collabora.com/T/#u
+# Failure Rate: 50
+# IGT Version: 1.28-gd2af13d9f
+# Linux Version: 6.7.0-rc3
+
+# Reported by deqp-runner
+kms_cursor_crc@cursor-offscreen-64x21
+kms_cursor_legacy@flip-vs-cursor-legacy
+kms_cursor_legacy@flip-vs-cursor-atomic
+kms_plane@plane-panning-top-left
+kms_cursor_crc@cursor-alpha-opaque
+kms_flip@dpms-vs-vblank-race-interruptible
+kms_flip@plain-flip-ts-check-interruptible
+kms_universal_plane@universal-plane-functional
+
+# The below test shows inconsistency across multiple runs, giving
+# results of Pass and Crash alternately.
+kms_cursor_crc@cursor-size-change
+core_setmaster_vs_auth
+kms_flip@modeset-vs-vblank-race
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
index a90fbb96520d..0866028d095c 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
@@ -57,3 +57,9 @@ msm_.*
 panfrost_.*
 v3d_.*
 vc4_.*
+
+# Machine is hanging in this test with linux kernel version 6.7.0-rc4, so skip it
+kms_cursor_crc@cursor-onscreen-32x32
+kms_pipe_crc_basic@disable-crc-after-crtc
+kms_pipe_crc_basic@pipe-A-eDP-1
+kms_bw@linear-tiling-3-displays-2560x1440
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
index d516d9c1d546..ace0d6ed6f2f 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
@@ -1,12 +1,13 @@
-kms_color@gamma,Fail
+kms_atomic_transition@modeset-transition,Fail
+kms_atomic_transition@modeset-transition-fencing,Fail
+kms_atomic_transition@plane-toggle-modeset-transition,Fail
 kms_color@legacy-gamma,Fail
-kms_color@pipe-A-legacy-gamma,Fail
-kms_color@pipe-B-legacy-gamma,Fail
 kms_cursor_crc@cursor-alpha-opaque,Fail
 kms_cursor_crc@cursor-alpha-transparent,Fail
 kms_cursor_crc@cursor-dpms,Fail
 kms_cursor_crc@cursor-offscreen-32x10,Fail
 kms_cursor_crc@cursor-offscreen-32x32,Fail
+kms_cursor_crc@cursor-offscreen-64x21,Fail
 kms_cursor_crc@cursor-offscreen-64x64,Fail
 kms_cursor_crc@cursor-onscreen-32x10,Fail
 kms_cursor_crc@cursor-onscreen-32x32,Fail
@@ -16,6 +17,7 @@ kms_cursor_crc@cursor-random-32x10,Fail
 kms_cursor_crc@cursor-random-32x32,Fail
 kms_cursor_crc@cursor-random-64x21,Fail
 kms_cursor_crc@cursor-random-64x64,Fail
+kms_cursor_crc@cursor-rapid-movement-32x10,Fail
 kms_cursor_crc@cursor-rapid-movement-32x32,Fail
 kms_cursor_crc@cursor-rapid-movement-64x21,Fail
 kms_cursor_crc@cursor-rapid-movement-64x64,Fail
@@ -24,23 +26,33 @@ kms_cursor_crc@cursor-sliding-32x10,Fail
 kms_cursor_crc@cursor-sliding-32x32,Fail
 kms_cursor_crc@cursor-sliding-64x21,Fail
 kms_cursor_crc@cursor-sliding-64x64,Fail
+kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
+kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
+kms_cursor_legacy@cursor-vs-flip-atomic,Fail
+kms_cursor_legacy@cursor-vs-flip-legacy,Fail
+kms_cursor_legacy@cursor-vs-flip-toggle,Fail
+kms_cursor_legacy@flip-vs-cursor-atomic,Fail
+kms_cursor_legacy@flip-vs-cursor-crc-atomic,Fail
+kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
+kms_cursor_legacy@flip-vs-cursor-legacy,Fail
+kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic,Fail
 kms_flip@basic-flip-vs-wf_vblank,Fail
 kms_flip@blocking-wf_vblank,Fail
 kms_flip@dpms-vs-vblank-race,Fail
+kms_flip@dpms-vs-vblank-race-interruptible,Fail
 kms_flip@flip-vs-absolute-wf_vblank,Fail
-kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
 kms_flip@flip-vs-blocking-wf-vblank,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning,Fail
 kms_flip@flip-vs-panning-interruptible,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
 kms_flip@modeset-vs-vblank-race,Fail
+kms_flip@modeset-vs-vblank-race-interruptible,Fail
 kms_flip@plain-flip-fb-recreate,Fail
 kms_flip@plain-flip-fb-recreate-interruptible,Fail
 kms_flip@plain-flip-ts-check,Fail
 kms_flip@plain-flip-ts-check-interruptible,Fail
 kms_flip@wf_vblank-ts-check,Fail
-kms_flip@wf_vblank-ts-check-interruptible,Fail
 kms_invalid_mode@int-max-clock,Fail
 kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
 kms_pipe_crc_basic@compare-crc-sanitycheck-xr24,Fail
@@ -56,20 +68,6 @@ kms_plane@plane-panning-top-left,Fail
 kms_plane@plane-position-covered,Fail
 kms_plane@plane-position-hole,Fail
 kms_plane@plane-position-hole-dpms,Fail
-kms_plane_cursor@overlay,Fail
-kms_plane_cursor@pipe-B-overlay-size-128,Fail
-kms_plane_cursor@pipe-B-overlay-size-256,Fail
-kms_plane_cursor@pipe-B-overlay-size-64,Fail
-kms_plane_cursor@pipe-B-primary-size-128,Fail
-kms_plane_cursor@pipe-B-primary-size-256,Fail
-kms_plane_cursor@pipe-B-primary-size-64,Fail
-kms_plane_cursor@pipe-B-viewport-size-128,Fail
-kms_plane_cursor@pipe-B-viewport-size-256,Fail
-kms_plane_cursor@pipe-B-viewport-size-64,Fail
-kms_plane_cursor@primary,Fail
-kms_plane_cursor@viewport,Fail
-kms_plane_multiple@atomic-pipe-B-tiling-none,Fail
 kms_plane_multiple@tiling-none,Fail
-kms_prime@basic-crc,Fail
 kms_rmfb@close-fd,Fail
-kms_universal_plane@universal-plane-pipe-B-functional,Fail
+kms_universal_plane@universal-plane-functional,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
index c9fdc623ab91..5126a849bf4a 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
@@ -1,7 +1,25 @@
-kms_bw@linear-tiling-2-displays-1920x1080p
-kms_cursor_crc@cursor-offscreen-64x21
+# Board Name: rk3399-gru-kevin.dtb
+# Bug Report: https://lore.kernel.org/dri-devel/bdb53650-1888-30b8-93ee-2290d020af4a@collabora.com/T/#u
+# IGT Version: 1.28-gd2af13d9f
+# Failure Rate: 50
+# Linux Version: 6.7.0-rc3
+
+# Reported by deqp-runner
+kms_bw@linear-tiling-1-displays-1920x1080p
+kms_color@gamma
+kms_cursor_legacy@cursorA-vs-flipA-toggle
+kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic
+kms_flip@dpms-vs-vblank-race
 kms_flip@dpms-vs-vblank-race-interruptible
+kms_flip@flip-vs-absolute-wf_vblank-interruptible
 kms_flip@flip-vs-wf_vblank-interruptible
-kms_plane_cursor@overlay
-kms_plane_cursor@primary
-kms_plane_cursor@viewport
+kms_flip@modeset-vs-vblank-race-interruptible
+kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
+kms_setmode@basic
+
+# The below test shows inconsistency across multiple runs, giving
+# results of Pass and Crash alternately.
+kms_bw@linear-tiling-2-displays-1920x1080p
+kms_bw@linear-tiling-3-displays-2560x1440p
+kms_cursor_crc@cursor-rapid-movement-32x10
+kms_flip@wf_vblank-ts-check-interruptible
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
index dc8221151d74..f309aeca857a 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
@@ -10,3 +10,7 @@ msm_.*
 panfrost_.*
 v3d_.*
 vc4_.*
+
+# Machine ends up hanging after lots of Oopses with linux version 6.7.0-rc4
+# rockchip-dp ff970000.dp: AUX CH error happened: 0x2
+kms_plane_multiple.*
-- 
2.40.1


