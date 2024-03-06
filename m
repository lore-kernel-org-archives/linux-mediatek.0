Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8B6C54798
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Mar 2024 03:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NerHGNlqJoq9Vw558isIy4Nihg63xszwkk3xRmi/G+k=; b=hIeB1GSxTn6idDxnuQfX9xg8ZF
	BdNx7Dvqt2XjDolIlMX9hw2q/I6MUgC27hAA3HSgxYntP6M/mW+fYLYJZMp0CsoEkSedIiGQOLV8z
	d7T4VnMhDyYCYY5TAtyoxM3dJ+Bxhl1LKSUKOjxmBrYwLad63qbol0dmUK7opJaG077tdFanBQN7R
	k22MicTu8CXroKw9O8AmgA5Q9lKSR1zv/oCTPLkPeAulmUuE09vDBrZmOkXFUmDGuR1S2sJCVqoBs
	OJTJfVws214DFOpNlKDKp/4BFEt//QQPdn9AwwZTF/7RD5WenCJYvQ52VHGRki3GXmLcAMuMmCa+q
	APeZo2SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhheQ-0000000G5pP-2KMn;
	Wed, 06 Mar 2024 03:09:02 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhhe2-0000000G5W6-3MJP;
	Wed, 06 Mar 2024 03:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709694517;
	bh=Ier7Zs9YGiPE6VTwgq6zjqYKqPQimOUMviUj1yfjmjs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FnKYoGZ81TDnfWT+3G0NKjLwVz3d8pjPGml7hX64VkJBxYANpkcm9sc0RsENdRjiL
	 9JlfO7Hn5/+4uWNIL3aY1GRO2UFaJm9Zz0Tav0bd47Qt3E0nK/Prg+20Ybu+yaQNse
	 feXpaWbEjaAkBieo3y+jSerWGcNPGKzPVpc3qE3Yrw8OUUCu2Va01s8NpmGVGuicPB
	 QuXcg6nkS0yIG4xocLXUf8zq4SF42nU67Pv0LLNrxdKt3h25X5Bdq0cNBZRG6FcVnY
	 hk0IzvMHPr5VL7v0u6+utdhLKW9OAaGD+kYwYcmTdP52rdMxNpdCbKUAKaZdBSjrEb
	 7vfO9sI2rjqCw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 48F9B37820DE;
	Wed,  6 Mar 2024 03:08:33 +0000 (UTC)
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
Subject: [PATCH v4 10/11] drm/ci: rockchip: Add job to test panfrost GPU driver
Date: Wed,  6 Mar 2024 08:36:48 +0530
Message-Id: <20240306030649.60269-11-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240306030649.60269-1-vignesh.raman@collabora.com>
References: <20240306030649.60269-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_190839_902856_3A2F531B 
X-CRM114-Status: GOOD (  14.35  )
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

v4:
  - Remove the gpu suffix in job and rename xfails accordingly.

---
 drivers/gpu/drm/ci/test.yml                      | 16 ++++++++++++++++
 .../gpu/drm/ci/xfails/panfrost-rk3288-fails.txt  |  1 +
 .../gpu/drm/ci/xfails/panfrost-rk3288-skips.txt  |  2 ++
 .../gpu/drm/ci/xfails/panfrost-rk3399-fails.txt  |  1 +
 .../gpu/drm/ci/xfails/panfrost-rk3399-skips.txt  |  2 ++
 5 files changed, 22 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 831e580e6dfd..ac8e974723a5 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -185,6 +185,14 @@ rockchip:rk3288:
     GPU_VERSION: rk3288
     DRIVER_NAME: rockchip
 
+panfrost:rk3288:
+  extends:
+    - .rk3288
+  stage: panfrost
+  variables:
+    GPU_VERSION: rk3288
+    DRIVER_NAME: panfrost
+
 rockchip:rk3399:
   extends:
     - .rk3399
@@ -192,6 +200,14 @@ rockchip:rk3399:
     GPU_VERSION: rk3399
     DRIVER_NAME: rockchip
 
+panfrost:rk3399:
+  extends:
+    - .rk3399
+  stage: panfrost
+  variables:
+    GPU_VERSION: rk3399
+    DRIVER_NAME: panfrost
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
index 000000000000..2ea09d1648bc
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
@@ -0,0 +1,2 @@
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
new file mode 100644
index 000000000000..6f5e760d5ec0
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
@@ -0,0 +1 @@
+panfrost_prime@gem-prime-import,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt
new file mode 100644
index 000000000000..2ea09d1648bc
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt
@@ -0,0 +1,2 @@
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
-- 
2.40.1


