Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20802C3DA52
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jul 2024 09:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r2ffZL2JLcFmHFUibjWdLUP8duZcmHpcTDw7am47NBU=; b=RIPhlr3yBghqpIgi1m+dWSh9Jk
	+imtWRLwJmKOMFgHdX4uiW41v61WTlbIGHMeNxVhpohH7r1oTIClqFvilaKgBIDN5c3svmzOAZSh6
	WHzYSeM/mETr83U7oLzNYV99aGoBMpiU6sW358UGIGiufSpS3+Sxt41n7Qsmcec66XP8PkrH3FeRS
	MdP72L6X4yQfZwhMMCWUYiq1VL+b357XdNv5TW49NGwN46F5nd0IbnALtKr9yxl10wiXoOI0kAw/+
	gKn1opTq7MtzcE1rYcK0OxhTg09AdwAT9NU2K6hPBAkbt8dkLnF0zQt53b8nZ0n/2dUnW/DFF683+
	Ua8U88Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSCP8-0000000H3ZZ-3kWY;
	Fri, 12 Jul 2024 09:17:26 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSCP3-0000000H3T0-0hZl;
	Fri, 12 Jul 2024 09:17:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720775840;
	bh=t6yELDpOJbb62+MQFwuvllWPT3+vSBdNmwfaKHtsDK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DYg6LrhDO6zTOuooyYjy8GlUqfRocrzDZ7RorV1HWzBdP6VCPZ2cbUe9d+QIgY8UN
	 QvhsArKNbmI/TFdLTYgiVCI0IsIaAVgFi1PTjbXaNmCsMctVwAv5IT3qViAL16DZoS
	 IsRcAylBs01RO9A1FDw+81z5WaSE/Qr6OMir/PAHnzPJNIQlJ6i7vKErbkcx75px+e
	 9rTuo+83fjia/fqv0BWCgRIL5wCNF11cWzNq86uRgr/BCe8sl+bkZ7ts7Fs8wfQmWo
	 9BFyAYpY1++RZPthZ0WmhqfCir1tYioK0/h611vgGEja1myeHMBlI+9bjP2qMTOIKC
	 wv6O6nyBrKppQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 17D973782212;
	Fri, 12 Jul 2024 09:17:16 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	deborah.brouwer@collabora.com,
	robdclark@gmail.com,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/5] drm/ci: mediatek: add tests for mediatek display driver
Date: Fri, 12 Jul 2024 14:45:46 +0530
Message-Id: <20240712091549.56635-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240712091549.56635-1-vignesh.raman@collabora.com>
References: <20240712091549.56635-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_021721_393894_B0FFC84B 
X-CRM114-Status: GOOD (  22.32  )
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

---
 MAINTAINERS                                   |  1 +
 drivers/gpu/drm/ci/gitlab-ci.yml              |  2 +-
 drivers/gpu/drm/ci/igt_runner.sh              |  7 ----
 drivers/gpu/drm/ci/test.yml                   | 38 +++++++++++++++----
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   | 28 +++++++++++---
 .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |  7 ++++
 .../drm/ci/xfails/mediatek-mt8183-skips.txt   |  4 +-
 .../drm/ci/xfails/panfrost-mt8183-fails.txt   | 11 ++++++
 .../drm/ci/xfails/panfrost-mt8183-skips.txt   | 18 +++++++++
 9 files changed, 92 insertions(+), 24 deletions(-)
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
index 5b7d623f404b..cf3a747f7cec 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
@@ -1,8 +1,24 @@
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
+kms_bw@linear-tiling-1-displays-2560x1440p,Fail
+kms_bw@linear-tiling-1-displays-3840x2160p,Fail
+kms_color@invalid-gamma-lut-sizes,Fail
+kms_flip@flip-vs-panning-vs-hang,Fail
+kms_flip@flip-vs-suspend,Fail
+kms_lease@lease-uevent,Fail
+kms_properties@plane-properties-atomic,Fail
+kms_rmfb@close-fd,Fail
 tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
new file mode 100644
index 000000000000..2d1f24e56083
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
@@ -0,0 +1,7 @@
+# Board Name: mt8183-kukui-jacuzzi-juniper-sku16
+# Bug Report: https://lore.kernel.org/linux-mediatek/0b2a1899-15dd-42fa-8f63-ea0ca28dbb17@collabora.com/T/#u
+# Failure Rate: 100
+# IGT Version: 1.28-gf13702b8e
+# Linux Version: 6.10.0-rc5
+kms_bw@linear-tiling-1-displays-2560x1440p
+kms_cursor_legacy@cursor-vs-flip-atomic-transitions
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
index 03eefa518afa..562662eff802 100644
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
@@ -10,9 +11,6 @@ nouveau_.*
 gem_.*
 i915_.*
 
-# Panfrost is not a KMS driver, so skip the KMS tests
-kms_.*
-
 # Currently fails and causes coverage loss for other tests
 # since core_getversion also fails.
 core_hotunplug.*
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
new file mode 100644
index 000000000000..fd6155dd99ef
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
@@ -0,0 +1,11 @@
+dumb_buffer@create-clear,Fail
+dumb_buffer@create-valid-dumb,Fail
+dumb_buffer@invalid-bpp,Fail
+dumb_buffer@map-invalid-size,Fail
+dumb_buffer@map-uaf,Fail
+dumb_buffer@map-valid,Fail
+fbdev@eof,Fail
+fbdev@read,Fail
+fbdev@unaligned-read,Fail
+panfrost/panfrost_prime@gem-prime-import,Fail
+tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
new file mode 100644
index 000000000000..03eefa518afa
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
@@ -0,0 +1,18 @@
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
+
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
+
+# Currently fails and causes coverage loss for other tests
+# since core_getversion also fails.
+core_hotunplug.*
-- 
2.40.1


