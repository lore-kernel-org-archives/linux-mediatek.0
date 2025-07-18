Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E170C87FC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jul 2025 11:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNzh59s9NcgtARkCCNWFtY6Yp3lbY95GmXt8cPlbVE8=; b=0RQ2VATjaCrJYUKXs2A06/DqAR
	VqcXxr3Jx+sioEmpJJ6JR4tSiKJ9E1D8Wj/KIOiaMarpGWNHHakIZx0AgDmm+cZva03iheKP2Uehe
	GBNI8a+WB0y0fQ/DnG4wDotBQD39PbRTZ9BzvC5VroL3VkwjnTR3RtTiM1E3Kw3dwKh5lNvldTY+R
	O7M8YFApHhPpWZgsybBV/5pGaiCUAFZfTle6kLesWeU2h+GfAB14YfCz15HAH6mZEeETKlKSMGarb
	4EVUHk/LNAy8jExmjAfYKlIZ+tu0kJhiLAhrd0M944eJ43ZRJ3bEt2ULBhv+Mz4xaeNy5L0cdlESa
	bMvqJ/8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjFR-0000000CR0I-275u;
	Fri, 18 Jul 2025 11:27:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucijk-0000000CMTl-0od1;
	Fri, 18 Jul 2025 10:54:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752836082;
	bh=JoBUT/gzu47M9SFqe98i/QzSy38xnTM83ZAr+zyvoEA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S/kr8tHdbr9avflGv5djCx1j/5ffjZOhQqXk9FEalZtIdCyqzOFsw3F8BKSdwQhJw
	 CoyxEnJg9ruzKAse5DK6Oflbd5K7Q6nH8iTTMT2M5Tqwcn1Qo5h6rnkmh9m1u+MS3X
	 +zy1HL1aWdFJc34EYX9bZxbPqDYFIwfySLEmeEJbeK4nI786QJhKAxyeGnul8N4/DK
	 hfZk2cmoyuCxFI87eVoM7GxiDPs2bwiBoNtfBp2Jfd8y57vKkPibxSxlF6s1gPpvr8
	 /ycwiIAiXwVLPSAGUSq0/e3pmMA9j64CRKYsSjguvHcYZjJ8ulnjlVBs4LN58xYpyk
	 5fop58eMpFYQQ==
Received: from debian.. (unknown [171.76.80.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4CB1917E156D;
	Fri, 18 Jul 2025 12:54:39 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	lumag@kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/7] drm/ci: add rk3588-rock-5b
Date: Fri, 18 Jul 2025 16:23:58 +0530
Message-ID: <20250718105407.32878-7-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250718105407.32878-1-vignesh.raman@collabora.com>
References: <20250718105407.32878-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_035444_392714_67262343 
X-CRM114-Status: GOOD (  15.33  )
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

Add job that executes the IGT test suite for rk3588-rock-5b.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 MAINTAINERS                                   |  1 +
 drivers/gpu/drm/ci/arm64.config               |  5 ++++
 drivers/gpu/drm/ci/build.sh                   |  1 +
 drivers/gpu/drm/ci/gitlab-ci.yml              |  1 +
 drivers/gpu/drm/ci/igt_runner.sh              |  2 +-
 drivers/gpu/drm/ci/test.yml                   | 28 +++++++++++++++++++
 .../drm/ci/xfails/panthor-rk3588-fails.txt    |  5 ++++
 .../drm/ci/xfails/panthor-rk3588-skips.txt    | 20 +++++++++++++
 .../drm/ci/xfails/rockchip-rk3588-fails.txt   | 10 +++++++
 .../drm/ci/xfails/rockchip-rk3588-skips.txt   | 14 ++++++++++
 10 files changed, 86 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/panthor-rk3588-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panthor-rk3588-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3588-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3588-skips.txt

diff --git a/MAINTAINERS b/MAINTAINERS
index 7e7515a412e9..2efd4174f2d2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2036,6 +2036,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+F:	drivers/gpu/drm/ci/xfails/panthor*
 F:	drivers/gpu/drm/panthor/
 F:	include/uapi/drm/panthor_drm.h
 
diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index fddfbd4d2493..7cd6d9d612fc 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -208,3 +208,8 @@ CONFIG_ARM_TEGRA_DEVFREQ=y
 CONFIG_TEGRA_SOCTHERM=y
 CONFIG_DRM_TEGRA_DEBUG=y
 CONFIG_PWM_TEGRA=y
+
+# For Rockchip rk3588
+CONFIG_DRM_PANTHOR=m
+CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=y
+CONFIG_PHY_ROCKCHIP_SAMSUNG_HDPTX=y
diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index ac5e7ed195cf..5485ea756382 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -19,6 +19,7 @@ if [[ "$KERNEL_ARCH" = "arm64" ]]; then
     GCC_ARCH="aarch64-linux-gnu"
     DEBIAN_ARCH="arm64"
     DEVICE_TREES="arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb"
+    DEVICE_TREES+=" arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb"
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 8f9767d27f90..ac0bd24dfb36 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -136,6 +136,7 @@ stages:
   - meson
   - msm
   - panfrost
+  - panthor
   - powervr
   - rockchip
   - software-driver
diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index 1c01bda52237..741d30655ab5 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -23,7 +23,7 @@ set -e
 
 mkdir -p /lib/modules
 case "$DRIVER_NAME" in
-    amdgpu|vkms)
+    amdgpu|vkms|panthor)
         # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
         mv /install/modules/lib/modules/* /lib/modules/. || true
         modprobe --first-time $DRIVER_NAME
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 64b682f8ecd8..dbd582442776 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -233,6 +233,19 @@ msm:sm8350-hdk:
     KERNEL_IMAGE_TYPE: ""
     RUNNER_TAG: mesa-ci-x86-64-lava-rk3399-gru-kevin
 
+.rk3588:
+  extends:
+    - .lava-igt:arm64
+    - .rockchip-device
+  parallel: 2
+  variables:
+    DEVICE_TYPE: rk3588-rock-5b
+    GPU_VERSION: rk3588
+    BOOT_METHOD: u-boot
+    KERNEL_IMAGE_NAME: Image
+    KERNEL_IMAGE_TYPE: "image"
+    RUNNER_TAG: mesa-ci-x86-64-lava-rk3588-rock-5b
+
 rockchip:rk3288:
   extends:
     - .rk3288
@@ -253,6 +266,16 @@ panfrost:rk3399:
     - .rk3399
     - .panfrost-gpu
 
+rockchip:rk3588:
+  extends:
+    - .rk3588
+    - .rockchip-display
+
+panthor:rk3588:
+  extends:
+    - .rk3588
+    - .panthor-gpu
+
 .i915:
   extends:
     - .lava-igt:x86_64
@@ -381,6 +404,11 @@ amdgpu:stoney:
   variables:
     DRIVER_NAME: panfrost
 
+.panthor-gpu:
+  stage: panthor
+  variables:
+    DRIVER_NAME: panthor
+
 .mt8173:
   extends:
     - .mediatek-device
diff --git a/drivers/gpu/drm/ci/xfails/panthor-rk3588-fails.txt b/drivers/gpu/drm/ci/xfails/panthor-rk3588-fails.txt
new file mode 100644
index 000000000000..7407bd0128d4
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panthor-rk3588-fails.txt
@@ -0,0 +1,5 @@
+core_hotunplug@hotreplug,Fail
+core_hotunplug@hotreplug-lateclose,Fail
+core_hotunplug@hotunplug-rescan,Fail
+core_hotunplug@unplug-rescan,Fail
+core_setmaster@master-drop-set-user,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panthor-rk3588-skips.txt b/drivers/gpu/drm/ci/xfails/panthor-rk3588-skips.txt
new file mode 100644
index 000000000000..b724cf04e3b3
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panthor-rk3588-skips.txt
@@ -0,0 +1,20 @@
+# Skip driver specific tests
+^amdgpu.*
+^msm.*
+nouveau_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
+tools_test.*
+kms_dp_link_training.*
+
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
+
+# Skip display functionality tests for GPU-only drivers
+dumb_buffer.*
+fbdev.*
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3588-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3588-fails.txt
new file mode 100644
index 000000000000..a3aac6acb5df
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3588-fails.txt
@@ -0,0 +1,10 @@
+core_setmaster@master-drop-set-user,Fail
+dumb_buffer@create-clear,Crash
+kms_3d,Fail
+kms_cursor_legacy@forked-bo,Fail
+kms_cursor_legacy@forked-move,Fail
+kms_cursor_legacy@single-bo,Fail
+kms_cursor_legacy@single-move,Fail
+kms_cursor_legacy@torture-bo,Fail
+kms_cursor_legacy@torture-move,Fail
+kms_lease@lease-uevent,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3588-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3588-skips.txt
new file mode 100644
index 000000000000..a165fccd8a93
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3588-skips.txt
@@ -0,0 +1,14 @@
+# Skip driver specific tests
+^amdgpu.*
+^msm.*
+nouveau_.*
+^panfrost.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
+tools_test.*
+kms_dp_link_training.*
-- 
2.47.2


