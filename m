Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74E2C27C55
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 02:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfcssT6b6w34hF4tqy1OKTHUiCaWE6ZWOjnXQZfy++4=; b=J1Kv8FvKyjCY7YDJgLwfp+wNHa
	Gc3Xwa0Mn3fRjYHLIBUwyVqeV00rnoIJsySx1f6+grLWVe6R/Fuc43Pb5vCZ4tQ9HXrAzvdoRLwR4
	aeAIgLsC3w46VaAxSDe6iBQ89Yb4PEqaxj/PyFwrDmIlfP/QcmqmACcRcP187zltsIRYfjrmzlC2W
	1zVkT1OIuoHDMKQwoBY5N0gh7mjqaDA0NACW3WFvDkmKkIK4EP7L02AONXrwcJ5xVMCef083cxx8o
	EoNG8QpU+DlFuynILJkHkDB4E/LCKX8B6GsVugEy4gpnDok7VbfEsZRGk+CXqtL3sz26xg/O12/9I
	+3NbEf4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC9GG-00000002cZt-3vHJ;
	Wed, 29 May 2024 02:41:56 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC9G8-00000002cT5-2azf;
	Wed, 29 May 2024 02:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716950507;
	bh=drcScXGLE4jwIM52dvLFwFXHUKgIPNbmDTogc7vKjCA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RxwB3g7j+qpq95PlwokEpAR5Gg7K0AE8kIQNE6i+siYW9c2rkIuXKBk8xHtQIj48n
	 VEZpLAdFVqKFTH4FGLsE4HQNdASujkA7axAdNoSMECG4sDtzvMxhNCMadqMPjy+hhR
	 M9m6jID7BjnyrxPMOrWNp+Wr0q7vstBNV27dWhWp08qFM6hZBvqbY9lCh0kxz/IG/e
	 djTMM9yOUbGOo1CbH2mQUGdcrdqKMR+Fsxih2A23n5wa9CuEvR53jA2zAzRhD/BjBh
	 by6rLc1/Q9drl5VnxUboeu8vDxCgkDQ1pip5SgTsPWL6hCQKivRb69cJtfpNFKxm17
	 DmEZqliQ5CLCA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3ECBD3782160;
	Wed, 29 May 2024 02:41:43 +0000 (UTC)
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
Subject: [PATCH v3 2/6] drm/ci: add farm variable
Date: Wed, 29 May 2024 08:10:45 +0530
Message-Id: <20240529024049.356327-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240529024049.356327-1-vignesh.raman@collabora.com>
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_194148_907047_417AA0D4 
X-CRM114-Status: UNSURE (   9.57  )
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

Mesa uses structured logs for logging and debug purpose,
https://mesa.pages.freedesktop.org/-/mesa/-/jobs/59165650/artifacts/results/job_detail.json

Since drm-ci uses the mesa scripts, add the farm variable
and update the device type for missing jobs.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v3:
  - New commit to add farm variable and update device type variable.

---
 drivers/gpu/drm/ci/test.yml | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 8bc63912fddb..2615f67f6aa3 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -24,6 +24,7 @@
   variables:
     HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
     DEBIAN_ARCH: "armhf"
+    FARM: collabora
   dependencies:
     - testing:arm32
   needs:
@@ -39,6 +40,7 @@
   variables:
     HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
     DEBIAN_ARCH: "arm64"
+    FARM: collabora
   dependencies:
     - testing:arm64
   needs:
@@ -54,6 +56,7 @@
   variables:
     HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
     DEBIAN_ARCH: "amd64"
+    FARM: collabora
   dependencies:
     - testing:x86_64
   needs:
@@ -74,6 +77,7 @@
     S3_ARTIFACT_NAME: "arm64/kernel-files"
     BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/Image.gz
     BM_CMDLINE: "ip=dhcp console=ttyMSM0,115200n8 $BM_KERNEL_EXTRA_ARGS root=/dev/nfs rw nfsrootdebug nfsroot=,tcp,nfsvers=4.2 init=/init $BM_KERNELARGS"
+    FARM: google
   needs:
     - debian/arm64_test
     - job: testing:arm64
@@ -116,8 +120,9 @@ msm:apq8016:
     - .baremetal-igt-arm64
   stage: msm
   variables:
+    DEVICE_TYPE: apq8016-sbc-usb-host
     DRIVER_NAME: msm
-    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/apq8016-sbc-usb-host.dtb
+    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/${DEVICE_TYPE}.dtb
     GPU_VERSION: apq8016
     # disabling unused clocks congests with the MDSS runtime PM trying to
     # disable those clocks and causes boot to fail.
@@ -132,9 +137,10 @@ msm:apq8096:
     - .baremetal-igt-arm64
   stage: msm
   variables:
+    DEVICE_TYPE: apq8096-db820c
     DRIVER_NAME: msm
     BM_KERNEL_EXTRA_ARGS: maxcpus=2
-    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/apq8096-db820c.dtb
+    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/${DEVICE_TYPE}.dtb
     GPU_VERSION: apq8096
     RUNNER_TAG: google-freedreno-db820c
   script:
@@ -146,6 +152,7 @@ msm:sdm845:
   stage: msm
   parallel: 6
   variables:
+    DEVICE_TYPE: sdm845-cheza-r3
     DRIVER_NAME: msm
     BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/cheza-kernel
     GPU_VERSION: sdm845
-- 
2.40.1


