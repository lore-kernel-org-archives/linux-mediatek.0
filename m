Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F12ECD128D
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Apr 2024 07:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yXJvugeNffQ3YZZswETUEJm6TUNIIvEYxECEaQdHL8=; b=pBPDLVgxC9lAyFF6XST57XTh5s
	L497io4dVhOGTs9YtDEDMdtTSvNwHVtR0BBjTF6TAENpNrA4PtMpXX3BqRPdLN2gJUAwuced70mnK
	9S4R10Hklpma+NsCt36rm3BtGz7yHD7K1WJvIaxOTGfoGuOKeQXVtT6pKDgJdWK39wCAP9nxPcTmZ
	Y7lR4iJIOwkFv2xhANBpK8xmRT0aTIqIaQfFimWFglb1jPDpwmKUw8w72GqGsPBTCMOmapf8Yu3T5
	tmzuPi6pAuPdGNJ1ynEo44nsSmmCZZguJyFUJO7UTyuKVBXKS28bHrs4PltkioKyxmQUi90Wimv+C
	ci6IBKBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrBuM-000000077w7-3u2z;
	Mon, 01 Apr 2024 07:16:42 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrAvn-000000071dX-0Dms;
	Mon, 01 Apr 2024 06:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711952045;
	bh=8qJ3ciIUKXzXMXkGK0xRIsuO+xbVMIkMF57BNwi+b7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UmQnnZvIRURZFOh1t9ztUQYqqAkkUnvyoENbOwxPitVhdVSeDvES9QDs+k8HBEHRm
	 VyfW+8BQYx98LfJwHJxKD/VZwP08w+RNbEYIKeId2um/qBawDvWpGHrtArAmoYpfVb
	 jwDrKySp+Iu7VbJli79F/rWj9+XIZkAxu5SN8vm6Gb96cmGMr+rZmLs8gxFzte8LNf
	 KNhqnNfRVCCg82JfKmVkZhvj/9nZ3PmCH++Oa8yGpkjP2z/r7XPxVZ+Z2vYynzsMRu
	 jE1RCqpPXx4A7oMB9TYhAyylFCMw10RdJqBWT5zHdoA9oQWvcXnyL0G2OEGsJQiMpV
	 mBiSmKBRKvAig==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 01DAC37813B6;
	Mon,  1 Apr 2024 06:14:01 +0000 (UTC)
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
Subject: [PATCH v5 09/10] drm/ci: rockchip: Add job to test panfrost GPU driver
Date: Mon,  1 Apr 2024 11:42:34 +0530
Message-Id: <20240401061235.192713-10-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240401061235.192713-1-vignesh.raman@collabora.com>
References: <20240401061235.192713-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_231407_734072_CFC17284 
X-CRM114-Status: GOOD (  15.44  )
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

For rockchip rk3288 and rk3399, the GPU driver is panfrost.
So add support in drm-ci to test panfrost driver for rockchip
SOC and update xfails. Skip KMS tests for panfrost driver
since it is not a not a KMS driver and skip driver-specific tests.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Add panfrost GPU jobs for rockchip SOC with new xfails.

v3:
  - Skip KMS tests for panfrost driver since it is not a not
    a KMS driver and update xfails. Add the job name in GPU_VERSION
    and use it for xfail file names instead of using DRIVER_NAME.

v4:
  - Remove the gpu suffix in job and rename xfails accordingly.

v5:
  - Skip driver-specific tests.

---
 drivers/gpu/drm/ci/test.yml                         | 10 ++++++++++
 drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt |  1 +
 drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt |  8 ++++++++
 drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt |  1 +
 drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt |  8 ++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 96b299c32c07..8c90ae5a51e6 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -191,11 +191,21 @@ rockchip:rk3288:
     - .rk3288
     - .rockchip-display
 
+panfrost:rk3288:
+  extends:
+    - .rk3288
+    - .panfrost-gpu
+
 rockchip:rk3399:
   extends:
     - .rk3399
     - .rockchip-display
 
+panfrost:rk3399:
+  extends:
+    - .rk3399
+    - .panfrost-gpu
+
 .i915:
   extends:
     - .lava-igt:x86_64
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
new file mode 100644
index 000000000000..abd35a8ef6f4
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
@@ -0,0 +1 @@
+panfrost_prime@gem-prime-import,Crash
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
new file mode 100644
index 000000000000..41a846a59644
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
@@ -0,0 +1,8 @@
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
+
+# Skip driver specific tests
+msm_.*
+^amdgpu.*
+v3d_.*
+vc4_.*
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
new file mode 100644
index 000000000000..6f5e760d5ec0
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
@@ -0,0 +1 @@
+panfrost_prime@gem-prime-import,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt
new file mode 100644
index 000000000000..41a846a59644
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt
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


