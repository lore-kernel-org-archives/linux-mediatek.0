Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FAEC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 15:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q56vfM8JUuMqkwUDtEN3wmwRMn84cDlqRQ5oUYRYaDM=; b=XcWqvt25+/eWNk6qUzitdG94BT
	CQWqLqWkcf1LSWNMmqP9qbhG6SkBgRcVhu1gaJmMIkyk6blQIaliAH0J8gTxaeAGQrlsivhZKFGp4
	zyCNXexVB2Sak+I6eNqs11JYOAyP9yJVH2P05SgryF6nzjNSxjSjlKyFiuxzJM+cTZuMxjwkn+7z6
	1W6TKFDYAAKDvobBNKTHFVnHA5vRMYJK3Yp728jE8zHTam5NHs3Yk0Bx5YKW2S7nYzlr/QghfbaXF
	PAIWDV00hsqMc9xnnw0zAy9+avC9XPeeXUDFLbxJhPpsVr9dngPg05ieVEnYW61uNz9fmTKmycN4l
	2wH3/UtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUpgO-0000000H5y7-1nvM;
	Tue, 30 Jan 2024 15:05:52 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUpg6-0000000H5hi-1GzF;
	Tue, 30 Jan 2024 15:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706627133;
	bh=URYtar/EYKdvk24yq8i2kmfS77H7Oa8ScrMzfoeJcCg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RGNEnZ3Osl5NmwJb/YucgJH/VPBsfpuYGZdMIh9Osq3ocSSBTncfl7RqEHTlqcgwo
	 HYXqnHLkMJG+GbK0On8O2Yu7/XWl++SPYClDzyQ1WmbMbDnTCMHDvm/jzd9je9oseH
	 vA7cG0y64Bsjz/K9V9rRU4Pans333w4KAdqMIrjUU1o4qtVyzyxs6/BDeokiGUwDaA
	 ZGY5x5iX8iv/dWywlQZwMXhJjxOBNhOZKT3M3BansHFy2pAsWoRPlO9xIJZh03969L
	 kaX9yX7Qz39AGzd9b2f6WlFeThUe7sl9eCdY0NBrh0Pobfsyirwq2lLAnwsdIPqod6
	 ueKJx+DDL1/pA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EAE323782084;
	Tue, 30 Jan 2024 15:05:27 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniel@fooishbar.org,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	david.heidelberg@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	robdclark@gmail.com,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/9] drm/ci: rockchip: Add job to test panfrost GPU driver
Date: Tue, 30 Jan 2024 20:33:38 +0530
Message-Id: <20240130150340.687871-8-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240130150340.687871-1-vignesh.raman@collabora.com>
References: <20240130150340.687871-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_070534_776645_EFDDC460 
X-CRM114-Status: GOOD (  14.81  )
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
since it is not a not a KMS driver.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Add panfrost GPU jobs for rockchip SOC with new xfails.

v3:
  - Skip KMS tests for panfrost driver since it is not a not
    a KMS driver and update xfails. Add the job name in GPU_VERSION
    and use it for xfail file names instead of using DRIVER_NAME.

---
 drivers/gpu/drm/ci/test.yml                        | 14 ++++++++++++++
 .../drm/ci/xfails/rockchip-rk3288-gpu-fails.txt    |  1 +
 .../drm/ci/xfails/rockchip-rk3288-gpu-skips.txt    |  2 ++
 .../drm/ci/xfails/rockchip-rk3399-gpu-fails.txt    |  1 +
 .../drm/ci/xfails/rockchip-rk3399-gpu-skips.txt    |  2 ++
 5 files changed, 20 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-gpu-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-gpu-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-gpu-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-gpu-skips.txt

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 1b8846c6bdbf..8ab8a8f56d6a 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -175,6 +175,13 @@ msm:sdm845:
     KERNEL_IMAGE_TYPE: ""
     RUNNER_TAG: mesa-ci-x86-64-lava-rk3399-gru-kevin
 
+rockchip:rk3288-gpu:
+  extends:
+    - .rk3288
+  variables:
+    GPU_VERSION: rockchip-rk3288-gpu
+    DRIVER_NAME: panfrost
+
 rockchip:rk3288-display:
   extends:
     - .rk3288
@@ -182,6 +189,13 @@ rockchip:rk3288-display:
     GPU_VERSION: rockchip-rk3288-display
     DRIVER_NAME: rockchip
 
+rockchip:rk3399-gpu:
+  extends:
+    - .rk3399
+  variables:
+    GPU_VERSION: rockchip-rk3399-gpu
+    DRIVER_NAME: panfrost
+
 rockchip:rk3399-display:
   extends:
     - .rk3399
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-gpu-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-gpu-fails.txt
new file mode 100644
index 000000000000..abd35a8ef6f4
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-gpu-fails.txt
@@ -0,0 +1 @@
+panfrost_prime@gem-prime-import,Crash
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-gpu-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-gpu-skips.txt
new file mode 100644
index 000000000000..2ea09d1648bc
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-gpu-skips.txt
@@ -0,0 +1,2 @@
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-gpu-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-gpu-fails.txt
new file mode 100644
index 000000000000..6f5e760d5ec0
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-gpu-fails.txt
@@ -0,0 +1 @@
+panfrost_prime@gem-prime-import,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-gpu-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-gpu-skips.txt
new file mode 100644
index 000000000000..2ea09d1648bc
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-gpu-skips.txt
@@ -0,0 +1,2 @@
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
-- 
2.40.1


