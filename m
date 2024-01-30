Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED89C48286
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 15:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zNWIiQnVSbEKrDSjzrfmjGwn64/3tvgMaOWj4nJaq8=; b=q9oBpzI9U8WoJ+e5Ft3aZzU4dT
	ZZnBCbuJE/9DCm692Y07sZ4PwtIIo2qaNcAGQ2gIMAoy92baeQavJVCCoZyq5toSeR3VUfoDM47kc
	1zjM3moRmrnm2l6I8Ij43So2VxVF4oxctXgs6Y3G7yGtVKj7ZtaKrJ4NmbtY8YmMHkRumRTROksv9
	dMzvwK1a0AOxQIMSoA+0BzQ/O4qU7aj6jgCkQh0AhhhEo8avpZSoBjdTFZgi0+ncpeD02MiLiq3Rf
	tnrv2v54HcioE8ncgIVBOoicmaYmnhw4j0fZ+zcjtNfmkAKJaiMqVBcJhu/9mKfPxBquLIASm2EzU
	lXPgsWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUpg6-0000000H5iC-1DL2;
	Tue, 30 Jan 2024 15:05:34 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUpfu-0000000H5YP-3nY5;
	Tue, 30 Jan 2024 15:05:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706627121;
	bh=zvEHPqsSi2mmxgkeDkWSdLIXDtcP/2UPBIsgY7QDhVY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y7I63n76OUj2pQJtD1zFNyuejbbnbSQjLkRcqs1py3PAdTlydMWXOuLzFG/U0BrnZ
	 UZvuWMaeg5fUJD3rSHYjv4Dv8vKhuun4Y7Dy4PFU1rUPBlU3H3TVFP/m/kRE/fr0CP
	 G0bH++zt1joHs40Qm5t2dZv4x7KC5ckUJRBHe1MDD4KU91KdBPi9M/FHZNQjO/WfGD
	 woiqQU78fHzMqoJFCPd1gnkSC6z7GIVH7Fik5fr7EI38640Guo22f1Vujc7Vk8b+ZK
	 PEzBqpEP1rvy8JabfDq+FV+F2OyeUR1h0yOQp4D2qcrF49IAKeJY9I7+5FKriXJXQ1
	 71AZ4qqHLF8Hg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E0EAE3782089;
	Tue, 30 Jan 2024 15:05:16 +0000 (UTC)
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
Subject: [PATCH v3 5/9] drm/ci: meson: Add job to test panfrost GPU driver
Date: Tue, 30 Jan 2024 20:33:36 +0530
Message-Id: <20240130150340.687871-6-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240130150340.687871-1-vignesh.raman@collabora.com>
References: <20240130150340.687871-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_070523_312668_732F4B0A 
X-CRM114-Status: GOOD (  14.54  )
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

---
 drivers/gpu/drm/ci/test.yml                        | 7 +++++++
 drivers/gpu/drm/ci/xfails/meson-g12b-gpu-fails.txt | 1 +
 drivers/gpu/drm/ci/xfails/meson-g12b-gpu-skips.txt | 2 ++
 3 files changed, 10 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-gpu-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-gpu-skips.txt

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index bf4c303a65f2..f4053bc0e365 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -358,6 +358,13 @@ mediatek:mt8183-display:
     DEVICE_TYPE: meson-g12b-a311d-khadas-vim3
     RUNNER_TAG: mesa-ci-x86-64-lava-meson-g12b-a311d-khadas-vim3
 
+meson:g12b-gpu:
+  extends:
+    - .g12b
+  variables:
+    GPU_VERSION: meson-g12b-gpu
+    DRIVER_NAME: panfrost
+
 meson:g12b-display:
   extends:
     - .g12b
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-gpu-fails.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-gpu-fails.txt
new file mode 100644
index 000000000000..6f5e760d5ec0
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-gpu-fails.txt
@@ -0,0 +1 @@
+panfrost_prime@gem-prime-import,Fail
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-gpu-skips.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-gpu-skips.txt
new file mode 100644
index 000000000000..2ea09d1648bc
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-gpu-skips.txt
@@ -0,0 +1,2 @@
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
-- 
2.40.1


