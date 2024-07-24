Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0448C3DA63
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jul 2024 10:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v17p4mHef17szhHUy2K8zC6xLbfnFLjGyX0Wufn5mx0=; b=HyOOFCxlbiS+idtC58svTWLfBI
	bu8GaX/KL+MVjVh1OwXIb2GIJfpHj63TFM/Yp44vk29gVl3n9BTUJeQKJttwPQot4cECLGtOOsRPd
	4pqxzKhhDk7OxnlRoGLqp0Z/PQ9N3/L0qPGAAfidObh4d1zXYZuh3wPvGY5oOxmv+rEMbJ6/RzouQ
	k2cuvc+7VvHFuJ1zckEQf3ihtjj8nimGC/+gnP7mhv91TFe1I+W54qdEB3mP3gEfX/2clGviq+gQq
	JtDWg6ge5IKPresHObJuONyg0s+5Sl2a0skk/8RbpoVOtF97ET5aN+boRIWThuFN93YEeL5Zi3Pob
	58QzFZeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWYyl-0000000F32I-1cSg;
	Wed, 24 Jul 2024 10:12:15 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWYyV-0000000F2l2-0zSa;
	Wed, 24 Jul 2024 10:12:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721815917;
	bh=0/OnTt/eLCQtSfMVzdN2NaVLmzeaKDrAyARFNmrq4MY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=my3sSF5hqlYl2WhgLddHvl5UGgiJJe+LHdQJNRzzKI0sjYgEr3x4xUDTELyzOfoTk
	 aQmsqOPAzdZf3lnWC1jniWRoYX4ra0MGn/aUUDO5vp7mKSzNGN0OaLUK2vF1OkG+xR
	 L22LmFepMkVwQlZ4uQhs+XYf8YTftty8N02/J5EvZhkHHBpcOcJ0lRgkL1U6makfnG
	 v+egMbi0IslRh1qXslqYMuiSyv4VS6XZkh/Nnmw9Cwnyx+x4YFuhv8HIzWJLpEcED5
	 cWz11poLSVn6zUk8gCn/CmO0Tn5CkMK6fcUKr6XaI4xmAZq3WAYr/+oWTk8AnahgQ1
	 DnWm9coGdHXnA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EE9D537820DE;
	Wed, 24 Jul 2024 10:11:54 +0000 (UTC)
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
Subject: [PATCH v8 4/5] drm/ci: meson: add tests for meson display driver
Date: Wed, 24 Jul 2024 15:40:07 +0530
Message-ID: <20240724101015.523535-5-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240724101015.523535-1-vignesh.raman@collabora.com>
References: <20240724101015.523535-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_031159_577855_BA6DD3E9 
X-CRM114-Status: GOOD (  17.41  )
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

For Amlogic Meson G12B (A311D) SOC the display driver is meson and
gpu driver is panfrost. Currently, in drm-ci for Meson G12B (A311D),
only the gpu driver is tested. Refactor the existing meson jobs
and add support in drm-ci to test both display and gpu driver for
Amlogic Meson G12B (A311D) and update xfails.

Since the correct driver name is passed from the job to test gpu
and display driver, remove the check to set IGT_FORCE_DRIVER
based on driver name for meson jobs.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Refactor the patch to rename job to indicate display driver testing,
    rename the existing xfail files.

v3:
  - Add the job name in GPU_VERSION and use it for xfail file names instead
    of using DRIVER_NAME.

v4:
  - Remove the display suffix in job and rename xfails accordingly.
    Remove the change adding job name in GPU_VERSION.

v5:
  - Add meson-display job.

v6:
  - Squash commits for display and gpu driver testing. Reword the commit message.

v7:
  - Rebase with recent drm-ci fixes and retest with latest IGT.

v8:
  - No changes.

---
 drivers/gpu/drm/ci/igt_runner.sh              |  2 +-
 drivers/gpu/drm/ci/test.yml                   | 23 +++++++++++++++----
 .../gpu/drm/ci/xfails/meson-g12b-fails.txt    | 18 ++++++++++-----
 .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |  4 +---
 .../gpu/drm/ci/xfails/panfrost-g12b-fails.txt |  8 +++++++
 .../gpu/drm/ci/xfails/panfrost-g12b-skips.txt | 18 +++++++++++++++
 6 files changed, 58 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt

diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index 6193865f23a3..1578a2a47a54 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -20,7 +20,7 @@ cat /sys/kernel/debug/dri/*/state
 set -e
 
 case "$DRIVER_NAME" in
-    rockchip|meson)
+    rockchip)
         export IGT_FORCE_DRIVER="panfrost"
         ;;
     amdgpu|vkms)
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 86875fb96eb5..5ccf57b3bf91 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -356,25 +356,38 @@ panfrost:mt8183:
     GPU_VERSION: mt8192
     RUNNER_TAG: mesa-ci-x86-64-lava-mt8192-asurada-spherion-r0
 
-.meson:
+.meson-device:
   extends:
     - .lava-igt:arm64
-  stage: meson
   variables:
-    DRIVER_NAME: meson
     DTB: ${DEVICE_TYPE}
     BOOT_METHOD: u-boot
     KERNEL_IMAGE_TYPE: "image"
 
-meson:g12b:
+.meson-display:
+  stage: meson
+  variables:
+    DRIVER_NAME: meson
+
+.g12b:
   extends:
-    - .meson
+    - .meson-device
   parallel: 3
   variables:
     DEVICE_TYPE: meson-g12b-a311d-khadas-vim3
     GPU_VERSION: g12b
     RUNNER_TAG: mesa-ci-x86-64-lava-meson-g12b-a311d-khadas-vim3
 
+meson:g12b:
+  extends:
+    - .g12b
+    - .meson-display
+
+panfrost:g12b:
+  extends:
+    - .g12b
+    - .panfrost-gpu
+
 virtio_gpu:none:
   stage: software-driver
   variables:
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
index 5b7d623f404b..53c5c91db5bb 100644
--- a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
@@ -1,8 +1,14 @@
-dumb_buffer@create-clear,Fail
-dumb_buffer@create-valid-dumb,Fail
 dumb_buffer@invalid-bpp,Fail
-dumb_buffer@map-invalid-size,Fail
-dumb_buffer@map-uaf,Fail
-dumb_buffer@map-valid,Fail
-panfrost/panfrost_prime@gem-prime-import,Fail
+kms_3d,Fail
+kms_cursor_legacy@forked-bo,Fail
+kms_cursor_legacy@forked-move,Fail
+kms_cursor_legacy@single-bo,Fail
+kms_cursor_legacy@single-move,Fail
+kms_cursor_legacy@torture-bo,Fail
+kms_cursor_legacy@torture-move,Fail
+kms_lease@lease-uevent,Fail
+kms_properties@connector-properties-atomic,Fail
+kms_properties@connector-properties-legacy,Fail
+kms_properties@get_properties-sanity-atomic,Fail
+kms_properties@get_properties-sanity-non-atomic,Fail
 tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
index 03eefa518afa..562662eff802 100644
--- a/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
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
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
new file mode 100644
index 000000000000..5b7d623f404b
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
@@ -0,0 +1,8 @@
+dumb_buffer@create-clear,Fail
+dumb_buffer@create-valid-dumb,Fail
+dumb_buffer@invalid-bpp,Fail
+dumb_buffer@map-invalid-size,Fail
+dumb_buffer@map-uaf,Fail
+dumb_buffer@map-valid,Fail
+panfrost/panfrost_prime@gem-prime-import,Fail
+tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
new file mode 100644
index 000000000000..03eefa518afa
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
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
2.43.0


