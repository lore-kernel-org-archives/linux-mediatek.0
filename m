Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2FDC54798
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Mar 2024 03:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQ21/vFePOKLf1oLV48p4zpt4LnL5liaRj6I8P5Xmzc=; b=eLDm5jRwbkNe38uIUgIcEYFy44
	OZzX+uwU0axCtmR5kPoWicVBHsQKFOPHIu6aUqGXH2spR/HjcVB5fpcH91yOWdDm3L1aR1iRgEH1A
	sAkHtD3m4V2owiydLwsMEtAmiV77ssRcd1WGYcDNFksLO4+qRS2pBXBCSMNAygk8GAgYrO2gcPWmu
	VHoY2y3JjCWZY8BlYaSE2EEr1D79h4LVZVncIFltXGyNRBmRaKz400BdNGkH719gHn93nPemndqER
	LC+j0zyhb3cRf2GkG9mnEGBzKX9KoG/csIHwp6ZmGjaAd55+iJGe5B68HWwIb2J92yluLAK/LE2Y5
	ZpQG+5sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhheE-0000000G5hh-2Uik;
	Wed, 06 Mar 2024 03:08:50 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhhdt-0000000G5NX-2Kqj;
	Wed, 06 Mar 2024 03:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709694508;
	bh=dZZpqBCxb8y7M5MKHNPlz5VMqXrw7cQklFnPCTea1T4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=yauTSKWHuKheWOM/eQuJxn95LCKiN4XmruEWzB1kLYgBD3DaaeJbEbBcgE0Iezwe8
	 TlZe5Hg6irmXaQRUGK/KqepVsQ+UIVVJUpfXqIV8Zh9ThqxNkueHTD8JaldbyMuBNu
	 rpmngc8VvVwDyGA4ElFjd8lU1fH7Pjim4NpU3Gzy9PpBPcgC6lo6RKxUT+s1Zakdus
	 5hIV+MJcAsRS8LyBQBqnt+MU2hbY1EMAPp8KsngpOzOniyfY/F3RTgOVenL/gSJOSp
	 srsgjX3/vwax6TjcBCk10Rb5X2KYiZzwFmYrTv1bVViMf1pGabu0o9iVrgkxPmOTnL
	 Pz0HJcQCYcFdw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2AA6537820CC;
	Wed,  6 Mar 2024 03:08:24 +0000 (UTC)
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
Subject: [PATCH v4 08/11] drm/ci: meson: Add job to test panfrost GPU driver
Date: Wed,  6 Mar 2024 08:36:46 +0530
Message-Id: <20240306030649.60269-9-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240306030649.60269-1-vignesh.raman@collabora.com>
References: <20240306030649.60269-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_190830_089949_C1CFADE3 
X-CRM114-Status: GOOD (  14.23  )
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

For amlogic meson SOC the GPU driver is panfrost. So add
support in drm-ci to test panfrost driver for amlogic meson
SOC and update xfails. Skip KMS tests for panfrost driver
since it is not a not a KMS driver.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Add panfrost GPU jobs for amlogic meson SOC with new xfails.

v3:
  - Skip KMS tests for panfrost driver since it is not a not a KMS
    driver and update xfails. Add the job name in GPU_VERSION and use
    it for xfail file names instead of using DRIVER_NAME.

v4:
  - Remove the gpu suffix in job and rename xfails accordingly.

---
 drivers/gpu/drm/ci/test.yml                       | 8 ++++++++
 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt | 1 +
 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt | 2 ++
 3 files changed, 11 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 951a44bf9d19..6ae6398b3d88 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -370,6 +370,14 @@ meson:g12b:
     GPU_VERSION: g12b
     DRIVER_NAME: meson
 
+panfrost:g12b:
+  extends:
+    - .g12b
+  stage: panfrost
+  variables:
+    GPU_VERSION: g12b
+    DRIVER_NAME: panfrost
+
 virtio_gpu:none:
   stage: virtio-gpu
   variables:
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
new file mode 100644
index 000000000000..6f5e760d5ec0
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
@@ -0,0 +1 @@
+panfrost_prime@gem-prime-import,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
new file mode 100644
index 000000000000..2ea09d1648bc
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
@@ -0,0 +1,2 @@
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
-- 
2.40.1


