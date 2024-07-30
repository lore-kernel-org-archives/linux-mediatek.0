Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D475C49EA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 02:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89T5EnQgdDOK2Th+sWuqY5suNlO9NpEPRH665u1UXW0=; b=MXBS7gHPgsj4181bC5jbk0gT1+
	YqBKIX35plddjzfust2wnjghYuMUr1BzBH01Iw53MhHeEtggQ46D9PwpbewWd1N5W1gmxs1i8FAID
	nEqnU3/KgasIWZ8WuLYwI68GmiDBrPTnWYJyeTfX9bHcu0i/Yr8VzjVoU/DaXSfjxXnANjRAamAZd
	FNoUo2GuaIDXFIQDu6/yS/jdUfR+jDUvVsdMxFK/0VlrkxvJ3hBfUX8ZU8zHYHwJosW9xIqhcZG9O
	x8z0rU++wbsXu2IHmHVBeCTSLh1XZTFy6bYfAw+pqMRFmxIqW+VPpoGdcSMikxD6VrkNOMUrjFjad
	+I9XlgTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYcQH-0000000DKNw-1b8w;
	Tue, 30 Jul 2024 02:17:09 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYcQ0-0000000DK8V-3guC;
	Tue, 30 Jul 2024 02:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722305811;
	bh=uMbh7Osl28ZaSw+7CfzYyeg/kT8fDaFHO1NY0dBJ4Y8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OxQFiWXxQ2JT1RD/G8XjyTIU0oW95ZYTInaNxtnpQS9wN2iwnzMwb56oiNT35pvn/
	 vu08K/n4qlH9k8NvTiv+ULXMf7aWyUeEkzoVY4gOrmDLGoa2U1X2I0qAe051DLGaUR
	 YGqb/LYyY2xDZpL7Bdi88Fzt2KDfI+Jf1MrgD/ilM7LS238I6ur+DSjqstqTN0Fkc8
	 hzR8ZeWmx2FWbO302Bkk1g0DpSkvVYQAFhL1SMzOFeQfL8q+Fibsh3L8rcEacY4G2R
	 rGnuMVw3/h1geArWXEbYt0/FI7ZchpgOmCMiH3vXnE+ixtLCeykBN9JkS8QHBDOye9
	 4SSxlO4jRvtcA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8551F3782191;
	Tue, 30 Jul 2024 02:16:47 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	deborah.brouwer@collabora.com,
	dmitry.baryshkov@linaro.org,
	mcanal@igalia.com,
	melissa.srw@gmail.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 3/6] drm/ci: mediatek: add tests for mediatek display driver
Date: Tue, 30 Jul 2024 07:45:38 +0530
Message-ID: <20240730021545.912271-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730021545.912271-1-vignesh.raman@collabora.com>
References: <20240730021545.912271-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_191653_085293_7CF460C2 
X-CRM114-Status: GOOD (  22.38  )
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

For mediatek mt8183, the display driver is mediatek, while the
gpu driver is panfrost. Currently, in drm-ci for mt8183, only
the gpu driver is tested. Refactor the existing mediatek jobs
and add support in drm-ci to test both display and gpu driver
for mt8183 and update xfails.

Since the correct driver name is passed from the job to test gpu
and display driver, remove the check to set IGT_FORCE_DRIVER
based on driver name for mediatek jobs.

Update the MAINTAINERS file to include xfails for panfrost driver.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Refactor the patch to rename job to indicate display driver testing,
    rename the existing xfail files, and remove IGT_FORCE_DRIVER from the
    script since it's now set by the job.

v3:
  - Add the job name in GPU_VERSION and use it for xfail file names instead
    of using DRIVER_NAME. Also update xfails.

v4:
  - Remove the display suffix in job and rename xfails accordingly.
    Remove the change adding job name in GPU_VERSION.

v5:
  - Add mediatek-display job.

v6:
  - Squash commits for display and gpu driver testing. Reword the commit message.


v7:
  - Rebase with recent drm-ci fixes and retest with latest IGT.

v8:
  - Add header for each flaky test.

v9:
  - Skip display functionality tests for GPU-only drivers and update expectation files.

---
 MAINTAINERS                                   |  1 +
 drivers/gpu/drm/ci/gitlab-ci.yml              |  2 +-
 drivers/gpu/drm/ci/igt_runner.sh              |  7 ----
 drivers/gpu/drm/ci/test.yml                   | 38 +++++++++++++++----
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   | 27 ++++++++++---
 .../drm/ci/xfails/mediatek-mt8183-flakes.txt  | 20 ++++++++++
 .../drm/ci/xfails/mediatek-mt8183-skips.txt   |  4 +-
 .../drm/ci/xfails/panfrost-mt8183-fails.txt   |  1 +
 .../drm/ci/xfails/panfrost-mt8183-skips.txt   | 23 +++++++++++
 9 files changed, 99 insertions(+), 24 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt

diff --git a/MAINTAINERS b/MAINTAINERS
index cb8355f20b36..f3783f2269ff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1741,6 +1741,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/gpu/panfrost.rst
+F:	drivers/gpu/drm/ci/xfails/panfrost*
 F:	drivers/gpu/drm/panfrost/
 F:	include/uapi/drm/panfrost_drm.h
 
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index b09976c3d2c2..9d800f629f08 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -121,8 +121,8 @@ stages:
   - mediatek
   - meson
   - msm
+  - panfrost
   - rockchip
-  - virtio-gpu
   - software-driver
 
 # YAML anchors for rule conditions
diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index 37c724dba8cb..6193865f23a3 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -23,13 +23,6 @@ case "$DRIVER_NAME" in
     rockchip|meson)
         export IGT_FORCE_DRIVER="panfrost"
         ;;
-    mediatek)
-        if [ "$GPU_VERSION" = "mt8173" ]; then
-            export IGT_FORCE_DRIVER=${DRIVER_NAME}
-        elif [ "$GPU_VERSION" = "mt8183" ]; then
-            export IGT_FORCE_DRIVER="panfrost"
-        fi
-        ;;
     amdgpu|vkms)
         # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
         mv /install/modules/lib/modules/* /lib/modules/. || true
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index ee908b66aad2..219eca5ef24c 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -280,38 +280,62 @@ amdgpu:stoney:
     GPU_VERSION: stoney
     RUNNER_TAG: mesa-ci-x86-64-lava-hp-11A-G6-EE-grunt
 
-.mediatek:
+.mediatek-device:
   extends:
     - .lava-igt:arm64
   stage: mediatek
   variables:
-    DRIVER_NAME: mediatek
     DTB: ${DEVICE_TYPE}
     BOOT_METHOD: depthcharge
     KERNEL_IMAGE_TYPE: ""
 
-mediatek:mt8173:
+.mediatek-display:
+  stage: mediatek
+  variables:
+    DRIVER_NAME: mediatek
+
+.panfrost-gpu:
+  stage: panfrost
+  variables:
+    DRIVER_NAME: panfrost
+
+.mt8173:
   extends:
-    - .mediatek
+    - .mediatek-device
   parallel: 4
   variables:
     DEVICE_TYPE: mt8173-elm-hana
     GPU_VERSION: mt8173
     RUNNER_TAG: mesa-ci-x86-64-lava-mt8173-elm-hana
 
-mediatek:mt8183:
+.mt8183:
   extends:
-    - .mediatek
+    - .mediatek-device
   parallel: 3
   variables:
     DEVICE_TYPE: mt8183-kukui-jacuzzi-juniper-sku16
     GPU_VERSION: mt8183
     RUNNER_TAG: mesa-ci-x86-64-lava-mt8183-kukui-jacuzzi-juniper-sku16
 
+mediatek:mt8173:
+  extends:
+    - .mt8173
+    - .mediatek-display
+
+mediatek:mt8183:
+  extends:
+    - .mt8183
+    - .mediatek-display
+
+panfrost:mt8183:
+  extends:
+    - .mt8183
+    - .panfrost-gpu
+
 # drm-mtk doesn't even probe yet in mainline for mt8192
 .mediatek:mt8192:
   extends:
-    - .mediatek
+    - .mediatek-device
   parallel: 3
   variables:
     DEVICE_TYPE: mt8192-asurada-spherion-r0
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
index 70053ea74b5d..8cb2cb67853d 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
@@ -1,7 +1,22 @@
-dumb_buffer@create-clear,Fail
-dumb_buffer@create-valid-dumb,Fail
+core_setmaster@master-drop-set-shared-fd,Fail
+device_reset@cold-reset-bound,Fail
+device_reset@reset-bound,Fail
+device_reset@unbind-cold-reset-rebind,Fail
+device_reset@unbind-reset-rebind,Fail
+dumb_buffer@create-clear,Crash
 dumb_buffer@invalid-bpp,Fail
-dumb_buffer@map-invalid-size,Fail
-dumb_buffer@map-uaf,Fail
-dumb_buffer@map-valid,Fail
-panfrost/panfrost_prime@gem-prime-import,Fail
+fbdev@eof,Fail
+fbdev@pan,Fail
+fbdev@read,Fail
+fbdev@unaligned-read,Fail
+kms_bw@connected-linear-tiling-1-displays-1920x1080p,Fail
+kms_bw@connected-linear-tiling-1-displays-2160x1440p,Fail
+kms_bw@connected-linear-tiling-1-displays-2560x1440p,Fail
+kms_bw@linear-tiling-1-displays-1920x1080p,Fail
+kms_bw@linear-tiling-1-displays-3840x2160p,Fail
+kms_color@invalid-gamma-lut-sizes,Fail
+kms_flip@flip-vs-panning-vs-hang,Fail
+kms_flip@flip-vs-suspend,Fail
+kms_lease@lease-uevent,Fail
+kms_properties@plane-properties-atomic,Fail
+kms_rmfb@close-fd,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
new file mode 100644
index 000000000000..df7e5ce7a036
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
@@ -0,0 +1,20 @@
+# Board Name: mt8183-kukui-jacuzzi-juniper-sku16
+# Bug Report: https://lore.kernel.org/linux-mediatek/0b2a1899-15dd-42fa-8f63-ea0ca28dbb17@collabora.com/T/#u
+# Failure Rate: 100
+# IGT Version: 1.28-gf13702b8e
+# Linux Version: 6.10.0-rc5
+kms_bw@linear-tiling-1-displays-2560x1440p
+
+# Board Name: mt8183-kukui-jacuzzi-juniper-sku16
+# Bug Report: https://lore.kernel.org/linux-mediatek/0b2a1899-15dd-42fa-8f63-ea0ca28dbb17@collabora.com/T/#u
+# Failure Rate: 100
+# IGT Version: 1.28-gf13702b8e
+# Linux Version: 6.10.0-rc5
+kms_cursor_legacy@cursor-vs-flip-atomic-transitions
+
+# Board Name: mt8183-kukui-jacuzzi-juniper-sku16
+# Bug Report: https://lore.kernel.org/linux-mediatek/0b2a1899-15dd-42fa-8f63-ea0ca28dbb17@collabora.com/T/#u
+# Failure Rate: 100
+# IGT Version: 1.28-gf13702b8e
+# Linux Version: 6.10.0-rc5
+fbdev@write
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
index aeec535107c1..8198e06344a3 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
@@ -2,6 +2,7 @@
 ^amdgpu.*
 ^msm.*
 nouveau_.*
+^panfrost.*
 ^v3d.*
 ^vc4.*
 ^vmwgfx*
@@ -11,9 +12,6 @@ gem_.*
 i915_.*
 tools_test.*
 
-# Panfrost is not a KMS driver, so skip the KMS tests
-kms_.*
-
 # Currently fails and causes coverage loss for other tests
 # since core_getversion also fails.
 core_hotunplug.*
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
new file mode 100644
index 000000000000..fe8ce2ce33e6
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
@@ -0,0 +1 @@
+panfrost/panfrost_prime@gem-prime-import,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
new file mode 100644
index 000000000000..3c7e494857b5
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
@@ -0,0 +1,23 @@
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
+
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
+
+# Skip display functionality tests for GPU-only drivers
+dumb_buffer.*
+fbdev.*
+
+# Currently fails and causes coverage loss for other tests
+# since core_getversion also fails.
+core_hotunplug.*
-- 
2.43.0


