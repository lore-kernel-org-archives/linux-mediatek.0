Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73494CD1297
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 08:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLKJ5W6DngIMWdDyrxHc6+0HoO3sHH/X9an3/xiVYic=; b=1h71cNj8+I1i9d/3FJlOlr/0aF
	l6ocGalARJeaVY6VuFgPn2mTA4XyCsLSuVK8rgs2+FZrPISqqmO4+sJ57FXiiNsow8QZFnej5FEOo
	4QYzhFlWbzI1M6q09u2pGksLIURNRbFiTrNAYKTS7WbAUR9ZTQtff+d3RPC2+j9eSpYWzxw7Sq6k/
	iXC5q7r6h6o0szwUh+z83dHNjzgXSza1BXIhecDIRDrl8flodlJeYByGlNgUyEcXrYJq6QYJdmNQ/
	lLq8Te8iOYHj6DFV1Gu0hdMHEBR/XeQu/NhONXY42WSXIjYH5vCyrt+dLhlMH/s078ROSE5Bkt9gY
	q3oAnNnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru6cy-00000000tjr-0ZQl;
	Tue, 09 Apr 2024 08:14:48 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru6cm-00000000tYv-1gjE;
	Tue, 09 Apr 2024 08:14:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712650475;
	bh=+MYc0Z6+oAClaQ2sIIemqiq6uwmUvAP48VR0Bsh6Too=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l7TFRw11yfr5912AR0DDUCsMNco+3lQJihKIG2gkk2VBDsCxsqAv4z33xTSes/Kbe
	 UlEu0JoKMp50hEPOda7laXQBParlWVMNL8clRz8u0QOMXzsjOqx2146LmWYbQjXsCd
	 zh1enN7Gd6P7rp6woZxYEgFpwI4hulbhEh1d1ccMhmxxy5qhjZepUrcnYgfPQdw9jM
	 yhzqZkjUWfU2cgyVUGeYyTs1vA+hzIYa5Vkv25na5c05Y7b7iMB89M4t36nAWwuSN4
	 zXMIjLtBIFW6uHjdDvWkBA5E8xZayoaEx1JiT+Des7u1Q9n8vrmOa036BoYWPcAykR
	 LInVV0KpewEWA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 566E737820F5;
	Tue,  9 Apr 2024 08:14:31 +0000 (UTC)
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
Subject: [PATCH v6 4/8] drm/ci: mediatek: add tests for mediatek display driver
Date: Tue,  9 Apr 2024 13:43:25 +0530
Message-Id: <20240409081329.472463-5-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240409081329.472463-1-vignesh.raman@collabora.com>
References: <20240409081329.472463-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_011436_966632_EB950578 
X-CRM114-Status: GOOD (  23.73  )
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

Skip kms tests for panfrost driver since it is not a kms driver
and skip driver-specific tests. Also update the MAINTAINERS file to
include xfails for panfrost driver.

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

---
 MAINTAINERS                                   |  1 +
 drivers/gpu/drm/ci/gitlab-ci.yml              |  3 +-
 drivers/gpu/drm/ci/igt_runner.sh              |  7 ----
 drivers/gpu/drm/ci/test.yml                   | 39 +++++++++++++++----
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   | 12 ------
 .../drm/ci/xfails/mediatek-mt8173-flakes.txt  | 13 +++++++
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   | 18 ++++-----
 .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |  8 ++++
 .../drm/ci/xfails/mediatek-mt8183-skips.txt   |  1 +
 .../drm/ci/xfails/panfrost-mt8183-fails.txt   |  1 +
 .../drm/ci/xfails/panfrost-mt8183-skips.txt   |  8 ++++
 11 files changed, 73 insertions(+), 38 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt

diff --git a/MAINTAINERS b/MAINTAINERS
index f7d0040a6c21..333704ceefb6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1666,6 +1666,7 @@ S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/gpu/panfrost.rst
 F:	drivers/gpu/drm/ci/testlist.txt
+F:	drivers/gpu/drm/ci/xfails/panfrost*
 F:	drivers/gpu/drm/panfrost/
 F:	include/uapi/drm/panfrost_drm.h
 
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index d03d76692f0e..9df55dc45173 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -111,6 +111,7 @@ stages:
   - meson
   - msm
   - rockchip
+  - panfrost
   - virtio-gpu
 
 # YAML anchors for rule conditions
@@ -267,4 +268,4 @@ sanity:
 
 # Jobs that need to pass before spending hardware resources on further testing
 .required-for-hardware-jobs:
-  needs: []
\ No newline at end of file
+  needs: []
diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index f1a08b9b146f..06946cd35491 100755
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
     amdgpu)
         # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
         mv /install/modules/lib/modules/* /lib/modules/.
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 612c9ede3507..959157449e4e 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -279,38 +279,61 @@ amdgpu:stoney:
     GPU_VERSION: stoney
     RUNNER_TAG: mesa-ci-x86-64-lava-hp-11A-G6-EE-grunt
 
-.mediatek:
+.mediatek-device:
   extends:
     - .lava-igt:arm64
-  stage: mediatek
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
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
index 640da02e508a..c63abd603b02 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
@@ -9,25 +9,13 @@ kms_bw@linear-tiling-3-displays-1920x1080p,Fail
 kms_bw@linear-tiling-3-displays-2560x1440p,Fail
 kms_bw@linear-tiling-3-displays-3840x2160p,Fail
 kms_color@invalid-gamma-lut-sizes,Fail
-kms_color@pipe-A-invalid-gamma-lut-sizes,Fail
-kms_color@pipe-B-invalid-gamma-lut-sizes,Fail
 kms_cursor_legacy@cursor-vs-flip-atomic,Fail
 kms_cursor_legacy@cursor-vs-flip-legacy,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
 kms_flip@flip-vs-suspend,Fail
 kms_flip@flip-vs-suspend-interruptible,Fail
-kms_force_connector_basic@force-load-detect,Fail
-kms_plane_scaling@planes-upscale-20x20,Fail
-kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25,Fail
-kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5,Fail
-kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75,Fail
-kms_plane_scaling@upscale-with-modifier-20x20,Fail
-kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
-kms_plane_scaling@upscale-with-rotation-20x20,Fail
 kms_properties@get_properties-sanity-atomic,Fail
 kms_properties@plane-properties-atomic,Fail
 kms_properties@plane-properties-legacy,Fail
 kms_rmfb@close-fd,Fail
-kms_selftest@drm_format,Timeout
-kms_selftest@drm_format_helper,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
new file mode 100644
index 000000000000..64b30c092c85
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
@@ -0,0 +1,13 @@
+# Board Name: mt8173-elm-hana.dtb
+# Bug Report: https://lore.kernel.org/dri-devel/931e3f9a-9c5c-fc42-16fc-abaac4e0c0ff@collabora.com/T/#u
+# IGT Version: 1.28-gd2af13d9f
+# Failure Rate: 50
+# Linux Version: 6.7.0-rc3
+
+# Reported by deqp-runner
+kms_cursor_legacy@cursor-vs-flip-atomic-transitions
+
+# Below test shows inconsistency across multiple runs,
+# giving results of Pass and Timeout/Fail alternately
+kms_prop_blob@invalid-set-prop
+kms_prop_blob@invalid-set-prop-any
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
index 2a09c88c0702..e2df17178c5a 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
@@ -1,14 +1,12 @@
-kms_addfb_basic@addfb25-bad-modifier,Fail
+core_setmaster_vs_auth,Fail
+kms_bw@linear-tiling-1-displays-1920x1080p,Fail
 kms_bw@linear-tiling-1-displays-2560x1440p,Fail
 kms_bw@linear-tiling-2-displays-1920x1080p,Fail
 kms_bw@linear-tiling-2-displays-2560x1440p,Fail
-kms_bw@linear-tiling-2-displays-3840x2160p,Fail
-kms_bw@linear-tiling-3-displays-2560x1440p,Fail
-kms_bw@linear-tiling-3-displays-3840x2160p,Fail
-kms_color@pipe-A-invalid-gamma-lut-sizes,Fail
-kms_plane_cursor@overlay,Fail
-kms_plane_cursor@primary,Fail
-kms_plane_cursor@viewport,Fail
-kms_plane_scaling@upscale-with-rotation-20x20,Fail
+kms_flip@flip-vs-panning-vs-hang,Fail
+kms_flip@flip-vs-suspend,Fail
+kms_flip@flip-vs-suspend-interruptible,Fail
+kms_properties@get_properties-sanity-atomic,Fail
+kms_properties@plane-properties-atomic,Fail
+kms_properties@plane-properties-legacy,Fail
 kms_rmfb@close-fd,Fail
-panfrost_prime@gem-prime-import,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
new file mode 100644
index 000000000000..5885a950fa72
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
@@ -0,0 +1,8 @@
+# Board Name: mt8183-kukui-jacuzzi-juniper-sku16.dtb
+# Bug Report: https://lore.kernel.org/dri-devel/931e3f9a-9c5c-fc42-16fc-abaac4e0c0ff@collabora.com/T/#u
+# IGT Version: 1.28-gd2af13d9f
+# Failure Rate: 100
+# Linux Version: 6.7.0-rc3
+
+# Reported by deqp-runner
+kms_cursor_legacy@cursor-vs-flip-atomic-transitions
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
index beb8d37362cf..f1a96db6a64e 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
@@ -1,5 +1,6 @@
 # Skip driver specific tests
 msm_.*
 ^amdgpu.*
+panfrost_.*
 v3d_.*
 vc4_.*
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
new file mode 100644
index 000000000000..6f5e760d5ec0
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
@@ -0,0 +1 @@
+panfrost_prime@gem-prime-import,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
new file mode 100644
index 000000000000..41a846a59644
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
@@ -0,0 +1,8 @@
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
+
+# Skip driver specific tests
+msm_.*
+^amdgpu.*
+v3d_.*
+vc4_.*
-- 
2.40.1


