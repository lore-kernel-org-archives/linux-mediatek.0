Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBA9D2D8F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jan 2026 10:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXpz9R94Fan0dTFn9jUkmCY+NXtGBgGBea3VZtqd5Bg=; b=u/EpBH787/RrO9oo/E96tjIoFg
	u5pNbbD5Z9xZtmVzMupXLdXVBKS19jDZzxGBuaG7vETSt+KEabl3j4Fluzv5vfXtDxaehMP9sAZC0
	18tbiLC7ik5INtklaaPQcRUz7/dsBO2pCRyKDGtbG7yMLufvJDmp0TwX2wuWD/OQyRg9ubeXk+2hk
	D1kIKm8ttPWk8J+7mcpKhvR2swdQeZPwsonhEuHfmnZDUs7BHcPcr7d10d/PZlZcT7JolPCMF0Pm0
	8BEZdqiNrZA+zL6eKH9KS3+1e8YV1DXbRJu7jSRZaFAul55t82TWxf5W2THWH9eaWJiH2bbSMfuQs
	8BoZAlqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgYj-0000000E55F-1E1U;
	Tue, 27 Jan 2026 10:44:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgYg-0000000E505-0N3F;
	Tue, 27 Jan 2026 10:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769510667;
	bh=8k1knDjmTySyw7ZGPkl+PripTkXl+ZQ0RVPekZtLf28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ovdPJImiDu34OGf0iZGBId/tNMCq2xrdk6D5or+cjMUx6afma9RK2n6bM/SvFBXyI
	 +N1/JWv2Nmf4Jl7IC6bOLcEmrKT5ssCBLVYvSBmY9ZlgIEuTFey/Be1+/Tx70KY2If
	 SdlFsAoUG1uBFeAEpu/0MyiUteaK0v4XVL2oaRguhlG4ZI/iWdbK9jgw3l0TejCnVz
	 up+otSBFooml21DrmPxnQkhx4JpC7QKLiRe9PAXVgHzfOCt3eM6lSgqcDBiMl3gYzL
	 YNEMDCaA3Q9P76QR1l3SqldotHEOpyDBRuiSzKMMHafD5lUZ21GxjlYliAKUK+z72V
	 BH7HxHkUcu3PA==
Received: from vignesh-thinkpad.. (unknown [171.76.81.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3120C17E0DB7;
	Tue, 27 Jan 2026 11:44:23 +0100 (CET)
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
Subject: [PATCH v1 2/7] drm/ci: move qualcomm baremetal jobs to lava
Date: Tue, 27 Jan 2026 16:13:57 +0530
Message-ID: <20260127104406.200505-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260127104406.200505-1-vignesh.raman@collabora.com>
References: <20260127104406.200505-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_024430_313572_0971BD7C 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

Qualcomm apq8016 and apq8096 DUTS are moved to Collabora lava
farm. So enable these jobs to use lava and update expectation
files.

Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/arm64.config               |  1 +
 drivers/gpu/drm/ci/test.yml                   | 62 ++++++-------------
 .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |  4 ++
 .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |  2 +
 4 files changed, 27 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index fddfbd4d2493..b850b88787ad 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -83,6 +83,7 @@ CONFIG_SC_DISPCC_7180=y
 CONFIG_SC_GPUCC_7180=y
 CONFIG_SM_GPUCC_8350=y
 CONFIG_QCOM_SPMI_ADC5=y
+CONFIG_QCOM_SPMI_VADC=y
 CONFIG_DRM_PARADE_PS8640=y
 CONFIG_DRM_LONTIUM_LT9611UXC=y
 CONFIG_PHY_QCOM_USB_HS=y
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 754db71049f0..84153aa2ad68 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -67,31 +67,6 @@
     - testing:x86_64
     - igt:x86_64
 
-.baremetal-igt-arm64:
-  extends:
-    - .baremetal-test-arm64-gl
-    - .use-debian/baremetal_arm64_test-gl
-    - .allow_failure_lockdep
-  timeout: "1h30m"
-  rules:
-    - !reference [.scheduled_pipeline-rules, rules]
-    - !reference [.google-freedreno-farm-rules, rules]
-    - when: on_success
-  variables:
-    FDO_CI_CONCURRENT: 10
-    HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
-    S3_ARTIFACT_NAME: "arm64/kernel-files"
-    BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/Image.gz
-    BM_CMDLINE: "ip=dhcp console=ttyMSM0,115200n8 $BM_KERNEL_EXTRA_ARGS root=/dev/nfs rw nfsrootdebug nfsroot=,tcp,nfsvers=4.2 init=/init $BM_KERNELARGS"
-    FARM: google
-  needs:
-    - debian/baremetal_arm64_test-gl
-    - job: testing:arm64
-      artifacts: false
-    - igt:arm64
-  tags:
-    - $RUNNER_TAG
-
 .software-driver:
   stage: software-driver
   extends:
@@ -149,34 +124,37 @@ msm:sc7180-trogdor-kingoftown:
 
 msm:apq8016:
   extends:
-    - .baremetal-igt-arm64
+    - .lava-igt:arm64
   stage: msm
+  parallel: 3
   variables:
-    DEVICE_TYPE: apq8016-sbc-usb-host
+    BOOT_METHOD: fastboot
+    DEVICE_TYPE: dragonboard-410c
     DRIVER_NAME: msm
-    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/${DEVICE_TYPE}.dtb
+    DTB: apq8016-sbc-usb-host
+    FARM: collabora
     GPU_VERSION: apq8016
-    # disabling unused clocks congests with the MDSS runtime PM trying to
-    # disable those clocks and causes boot to fail.
-    # Reproducer: DRM_MSM=y, DRM_I2C_ADV7511=m
-    BM_KERNEL_EXTRA_ARGS: clk_ignore_unused
-    RUNNER_TAG: google-freedreno-db410c
-  script:
-    - ./install/bare-metal/fastboot.sh || exit $?
+    KERNEL_IMAGE_NAME: "Image.gz"
+    KERNEL_IMAGE_TYPE: ""
+    RUNNER_TAG: mesa-ci-x86-64-lava-dragonboard-410c
+    LAVA_FIRMWARE: qcom-lava
 
 msm:apq8096:
   extends:
-    - .baremetal-igt-arm64
+    - .lava-igt:arm64
   stage: msm
+  parallel: 3
   variables:
-    DEVICE_TYPE: apq8096-db820c
+    BOOT_METHOD: fastboot
+    DEVICE_TYPE: dragonboard-820c
     DRIVER_NAME: msm
-    BM_KERNEL_EXTRA_ARGS: maxcpus=2
-    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/${DEVICE_TYPE}.dtb
+    DTB: apq8096-db820c
+    FARM: collabora
     GPU_VERSION: apq8096
-    RUNNER_TAG: google-freedreno-db820c
-  script:
-    - ./install/bare-metal/fastboot.sh || exit $?
+    KERNEL_IMAGE_NAME: "Image.gz"
+    KERNEL_IMAGE_TYPE: ""
+    RUNNER_TAG: mesa-ci-x86-64-lava-dragonboard-820c
+    LAVA_FIRMWARE: qcom-lava
 
 msm:sm8350-hdk:
   extends:
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
index 72c469021b66..4546363447ff 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
@@ -1,5 +1,9 @@
+core_setmaster@master-drop-set-user,Fail
 kms_3d,Fail
+kms_cursor_legacy@forked-move,Fail
+kms_cursor_legacy@single-bo,Fail
 kms_force_connector_basic@force-edid,Fail
 kms_hdmi_inject@inject-4k,Fail
 kms_lease@lease-uevent,Fail
+msm/msm_mapping@memptrs,Fail
 msm/msm_mapping@ring,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
index 2893f98a6b97..0d5cb2a87e67 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
@@ -1,2 +1,4 @@
+core_setmaster@master-drop-set-user,Fail
 kms_3d,Fail
 kms_lease@lease-uevent,Fail
+msm/msm_mapping@memptrs,Fail
-- 
2.47.3


