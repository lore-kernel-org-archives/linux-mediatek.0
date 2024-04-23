Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89862C18E72
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 04:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qY8HsfpmtY8RI9U96m32BO1SW705Abwpj8nfaawKDVo=; b=dPM9EfBPxy641Hqm9kMcsB45ZD
	sGYhEYCsJ+7Ev+paIIiZjIXdQhUwhChqkFCf/cs9ocOsyz5Wt6Rh/u+TLAq7vcCrWQEmYWghuv9Tu
	O1nNpSALbygyxvNhuQe6CNCrucUW8VMYSv7BPEBe1NqCS6LUj2/73eczRd76LWSiFrcAKp4CgwFuY
	RwaBZNN+oNw4XLvz7WhG6gjuGYpWdZPk6v7tPTuRVLw73/yvP3Vc4I9z+h63bSF5MBeiB/t4NbaEc
	BLd9Hj5sk9TPbeoHct+lwIpx5Z9BQhUrs4jhV2llXKpqhjXbJ7OvxrV/5MEYjNsOqMTTMHVYve9cZ
	GDVBEBbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz7Ne-0000000Ftub-3S80;
	Tue, 23 Apr 2024 04:03:42 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz7NW-0000000FtoX-3tgN;
	Tue, 23 Apr 2024 04:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713845013;
	bh=0It0Qs3oLGL49eT+4lgJbtyH9jMymo8SfQKGBHrJpCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZeZIBc5JysaPy/PnEnBfnE2xNj0uu2J6vUStlJoGCPdy6PgfC4MoLsB8oaWRQoObn
	 X+5F5KoFPB8SM3mopPx/P/tW/cQeFb4pLZYyfnfv4TOuzrtMcMe3RSD1+RT6mCxysv
	 pXLPzAdhPCZsgIlx0yr7pD1Yi8YvRE90sGCTn6ZUPuQpfEFmxtU+u3APPqYpCBItJk
	 VFE0umprzOLddFppeuB2JQp1dIBcH8pcFnBZVtzUOk0jHwBlUi4cHRAqfYzRKP86lE
	 BR8hB28Ql2w0LMmMjrzH3A56jkIN7qLInnNhtQZbPnEFwoCu7K7e0XL8VuSJyN1RwV
	 P29m8QFbCwCjQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 64D67378212B;
	Tue, 23 Apr 2024 04:03:30 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robdclark@gmail.com,
	david.heidelberg@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	dmitry.baryshkov@linaro.org,
	mcanal@igalia.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] drm/ci: build virtual GPU driver as module
Date: Tue, 23 Apr 2024 09:32:41 +0530
Message-Id: <20240423040243.448091-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240423040243.448091-1-vignesh.raman@collabora.com>
References: <20240423040243.448091-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_210335_143650_C17ADEF8 
X-CRM114-Status: GOOD (  11.50  )
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

With latest IGT, the tests tries to load the module and it
fails. So build the virtual GPU driver for virtio as module.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/build.sh                       |  1 -
 drivers/gpu/drm/ci/igt_runner.sh                  |  6 +++---
 drivers/gpu/drm/ci/image-tags.yml                 |  4 ++--
 drivers/gpu/drm/ci/test.yml                       |  1 +
 drivers/gpu/drm/ci/x86_64.config                  |  2 +-
 .../gpu/drm/ci/xfails/virtio_gpu-none-fails.txt   | 15 +++++++++++++++
 6 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 8a3baa003904..95493df9cdc2 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -156,7 +156,6 @@ fi
 
 mkdir -p artifacts/install/lib
 mv install/* artifacts/install/.
-rm -rf artifacts/install/modules
 ln -s common artifacts/install/ci-common
 cp .config artifacts/${CI_JOB_NAME}_config
 
diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index f1a08b9b146f..7d2ba69294dd 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -30,10 +30,10 @@ case "$DRIVER_NAME" in
             export IGT_FORCE_DRIVER="panfrost"
         fi
         ;;
-    amdgpu)
+    amdgpu|virtio_gpu)
         # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
-        mv /install/modules/lib/modules/* /lib/modules/.
-        modprobe amdgpu
+        mv /install/modules/lib/modules/* /lib/modules/. || true
+        modprobe --first-time $DRIVER_NAME
         ;;
 esac
 
diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
index d8f72b82c938..fd1cb6061166 100644
--- a/drivers/gpu/drm/ci/image-tags.yml
+++ b/drivers/gpu/drm/ci/image-tags.yml
@@ -4,9 +4,9 @@ variables:
    DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
 
    DEBIAN_X86_64_BUILD_IMAGE_PATH: "debian/x86_64_build"
-   DEBIAN_BUILD_TAG: "2023-10-08-config"
+   DEBIAN_BUILD_TAG: "2024-04-22-virtio"
 
-   KERNEL_ROOTFS_TAG: "2023-10-06-amd"
+   KERNEL_ROOTFS_TAG: "2024-04-22-virtio"
    PKG_REPO_REV: "3cc12a2a"
 
    DEBIAN_X86_64_TEST_BASE_IMAGE: "debian/x86_64_test-base"
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 612c9ede3507..864ac3809d84 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -350,6 +350,7 @@ virtio_gpu:none:
   script:
     - ln -sf $CI_PROJECT_DIR/install /install
     - mv install/bzImage /lava-files/bzImage
+    - mkdir -p /lib/modules
     - mkdir -p $CI_PROJECT_DIR/results
     - ln -sf $CI_PROJECT_DIR/results /results
     - install/crosvm-runner.sh install/igt_runner.sh
diff --git a/drivers/gpu/drm/ci/x86_64.config b/drivers/gpu/drm/ci/x86_64.config
index 1cbd49a5b23a..78479f063e8e 100644
--- a/drivers/gpu/drm/ci/x86_64.config
+++ b/drivers/gpu/drm/ci/x86_64.config
@@ -91,7 +91,7 @@ CONFIG_KVM=y
 CONFIG_KVM_GUEST=y
 CONFIG_VIRT_DRIVERS=y
 CONFIG_VIRTIO_FS=y
-CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_DRM_VIRTIO_GPU=m
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_VIRTIO_NET=y
 CONFIG_VIRTIO_CONSOLE=y
diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
index 007f21e56d89..5b8cbb28b25c 100644
--- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
@@ -68,6 +68,7 @@ kms_plane_scaling@upscale-with-rotation-20x20,Fail
 kms_selftest@drm_format,Timeout
 kms_selftest@drm_format_helper,Timeout
 kms_setmode@basic,Fail
+kms_vblank@accuracy-idle,Fail
 kms_vblank@crtc-id,Fail
 kms_vblank@invalid,Fail
 kms_vblank@pipe-A-accuracy-idle,Fail
@@ -82,3 +83,17 @@ kms_vblank@pipe-A-wait-busy,Fail
 kms_vblank@pipe-A-wait-forked,Fail
 kms_vblank@pipe-A-wait-forked-busy,Fail
 kms_vblank@pipe-A-wait-idle,Fail
+kms_vblank@query-busy,Fail
+kms_vblank@query-forked,Fail
+kms_vblank@query-forked-busy,Fail
+kms_vblank@query-idle,Fail
+kms_vblank@ts-continuation-dpms-rpm,Fail
+kms_vblank@ts-continuation-dpms-suspend,Fail
+kms_vblank@ts-continuation-idle,Fail
+kms_vblank@ts-continuation-modeset,Fail
+kms_vblank@ts-continuation-modeset-rpm,Fail
+kms_vblank@ts-continuation-suspend,Fail
+kms_vblank@wait-busy,Fail
+kms_vblank@wait-forked,Fail
+kms_vblank@wait-forked-busy,Fail
+kms_vblank@wait-idle,Fail
-- 
2.40.1


