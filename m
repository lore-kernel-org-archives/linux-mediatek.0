Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F13EA3F22
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Feb 2026 07:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFjkFEgVQrPaNNpMGgKBVGgBkCAe+P3inUlufC0H4vI=; b=A9NZQf7xN7+D36dUmj+a9wlgub
	0ZkaKxj0QSOnYGGF9aX/TuEdWu2sJc3/5LFDLQoH6cLMhsdBncmDTAANbWsx8y4Uz3JpxouxtzL0y
	sJvkbOXp/eEy3DFa8lWpj7ejZUTrAeZ+krbHNH9mNggfXh0Y629x4ogxbUiCPuPe6hVl5XTv9rykh
	NxtRNzObKBIxerZtyextL64p0dK/vYgA44LYn4bhFzsbb7ecew/IqP8y7dl5robFFfOrlnr6Ua0tf
	9xw1jcRZowmhd/eUW2eGPIzkG0P/u7Uhwu8wqN2kNYhOGRyVTujxTDQP0v6D7G/lFmR8sQc7fxXZG
	0l9DruZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vphvD-0000000GaHj-3MM6;
	Tue, 10 Feb 2026 07:12:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vphvA-0000000GaC8-19qY;
	Tue, 10 Feb 2026 07:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770707546;
	bh=Zg7OUqfAZZe65f/9spAPWQfwgSU13zo2MWnxBVaGkLA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YP50/IL4e7POtXz6IJkLt0tcDzX5hhWruUKzmN6QecjvdEtEUXl6AQI6Or0gonakX
	 DlRiWU3fTdQfd+YHkiruzhUjxU6id0yuu8s2Ig5/m6FD8d0Ya+vxIXye+reUXJxYg8
	 ipho5/uLR7m3FX2Qvd2oKTd2q3H0axlmDbfargeFZhfIQj6pBc5xtBgcB+wNpSoJlw
	 QwGQHxXSZBotmgjKeNj3EO7ydkTUTZkQBJ98e5VeDpKTXpcaki660Ndnt8VDtq3Gn3
	 w/Jyl6DP890NdxXiolwnJncJGJD8+S0Bf7fWMtZoK35iqJJDGloslPiQXxkf77jHyI
	 LBgBbuYDpjLWw==
Received: from vignesh-thinkpad.. (unknown [171.76.81.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 850D917E1352;
	Tue, 10 Feb 2026 08:12:21 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	dmitry.baryshkov@oss.qualcomm.com,
	lumag@kernel.org,
	robdclark@gmail.com,
	robin.clark@oss.qualcomm.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] drm/ci: add rk3588-rock-5b
Date: Tue, 10 Feb 2026 12:41:34 +0530
Message-ID: <20260210071138.2256773-6-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260210071138.2256773-1-vignesh.raman@collabora.com>
References: <20260210071138.2256773-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_231228_641276_7C4270B0 
X-CRM114-Status: GOOD (  14.97  )
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
Reviewed-by: Daniel Stone <daniels@collabora.com>
---

v2:
  - No changes.

---
 MAINTAINERS                                   |  1 +
 drivers/gpu/drm/ci/arm64.config               |  5 ++++
 drivers/gpu/drm/ci/build.sh                   |  1 +
 drivers/gpu/drm/ci/gitlab-ci.yml              |  1 +
 drivers/gpu/drm/ci/igt_runner.sh              |  2 +-
 drivers/gpu/drm/ci/test.yml                   | 28 +++++++++++++++++++
 .../drm/ci/xfails/panthor-rk3588-fails.txt    |  5 ++++
 .../drm/ci/xfails/panthor-rk3588-skips.txt    | 20 +++++++++++++
 .../drm/ci/xfails/rockchip-rk3588-fails.txt   |  9 ++++++
 .../drm/ci/xfails/rockchip-rk3588-skips.txt   | 14 ++++++++++
 10 files changed, 85 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/panthor-rk3588-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panthor-rk3588-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3588-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3588-skips.txt

diff --git a/MAINTAINERS b/MAINTAINERS
index ff92b9cc9435..b0eed114ed29 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2149,6 +2149,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+F:	drivers/gpu/drm/ci/xfails/panthor*
 F:	drivers/gpu/drm/panthor/
 F:	include/uapi/drm/panthor_drm.h
 
diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index b850b88787ad..5da3913ec8a4 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -209,3 +209,8 @@ CONFIG_ARM_TEGRA_DEVFREQ=y
 CONFIG_TEGRA_SOCTHERM=y
 CONFIG_DRM_TEGRA_DEBUG=y
 CONFIG_PWM_TEGRA=y
+
+# For Rockchip rk3588
+CONFIG_DRM_PANTHOR=m
+CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=y
+CONFIG_PHY_ROCKCHIP_SAMSUNG_HDPTX=y
diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 4353ee0f8889..d00d549cbd9c 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -16,6 +16,7 @@ if [[ "$KERNEL_ARCH" = "arm64" ]]; then
     GCC_ARCH="aarch64-linux-gnu"
     DEBIAN_ARCH="arm64"
     DEVICE_TREES="arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb"
+    DEVICE_TREES+=" arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb"
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 20e8cbdc39e9..56088c5393cd 100644
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
index b7409f8a13a5..f6bee5b67931 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -206,6 +206,19 @@ msm:sm8350-hdk:
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
@@ -226,6 +239,16 @@ panfrost:rk3399:
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
@@ -354,6 +377,11 @@ amdgpu:stoney:
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
index 000000000000..799c3b04c3f2
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3588-fails.txt
@@ -0,0 +1,9 @@
+core_setmaster@master-drop-set-user,Fail
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
2.47.3


