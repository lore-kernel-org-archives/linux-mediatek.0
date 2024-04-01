Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B11CD1283
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Apr 2024 07:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=indRTsEmMxT6XTkQ37q+Gjf058IdZDE0xIStl7FbgwA=; b=3/y7YJ4YS6w405obt7XEAspZdu
	NQZBg1hmQKu8H1c6ckOF7hFwS8mxE5oJbYe7Q/XKKQzxNwaxJMiFSriq3Jupw7OtoIasCuu2eoOYU
	n+iEIVyohldPYQAOJh+t3KBICetDIb7bI0591tiQ/S3yhMAd+q7u1TUbfaKj7ulmSuSS+iEJj6IEB
	pCvlD/sU55a8VWTuuBQknpdrm5MZwXzdFFPZCnw08oYh47UW+mA1K0c7wA10Rr1MftMlQKmYmVkjq
	MHEec0aGB4kB2okCFZPCXLK+UIICGVDror/KPii4/Io/XulAmf9T2g7UF2D4jqzbisLxj6Z0vy4gs
	SCTVdM3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrBuK-000000077v4-07fG;
	Mon, 01 Apr 2024 07:16:40 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrAve-000000071X3-3WIO;
	Mon, 01 Apr 2024 06:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711952037;
	bh=E2aghGpQK92An1ZuPhL1vFyz1L4o8jK/Gv/KB0mTOfc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rpt+mpCcvI4BrBXMmH0MmkLCykedyO2xVlGSExe8lfeRK0LYHIejnsMXD+IAIneFU
	 1/gWi1q59vtqRtZb5OdlMtEeGKbp5CoKLn4V5beViSnCRyPYWh+M9/Ln7qgrRYBpdY
	 8kwybmMANSO7y/3BbU9dnzTeGsG1+m49AIE6HK634o4Nf+jtgC3s01M6fUerrd48Hw
	 QDZfzPfxR6oxouPiQlUnlG3Z+knh4P9WXJn2NbPEycuObWP88KaASPzIPJz6KAxpVu
	 Dtl1IgJCxYIy1Sgl25OnBXnXYsWpvMdqtLUwKUMO4xN9Zz2WT0Pq2X3CooekROWD/T
	 CGIhcdKLZek8w==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E08603782121;
	Mon,  1 Apr 2024 06:13:53 +0000 (UTC)
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
Subject: [PATCH v5 07/10] drm/ci: meson: Add job to test panfrost GPU driver
Date: Mon,  1 Apr 2024 11:42:32 +0530
Message-Id: <20240401061235.192713-8-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240401061235.192713-1-vignesh.raman@collabora.com>
References: <20240401061235.192713-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_231359_463876_D82BC447 
X-CRM114-Status: GOOD (  15.56  )
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
SOC and update xfails. Skip KMS tests for panfrost driver since
it is not a not a KMS driver and skip driver-specific tests.

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

v5:
  - Use panfrost-gpu job and skip driver-specific tests.

---
 drivers/gpu/drm/ci/test.yml                       | 5 +++++
 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt | 1 +
 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt | 8 ++++++++
 3 files changed, 14 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 505733069995..d1d42ff7df2d 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -381,6 +381,11 @@ meson:g12b:
     - .g12b
     - .meson-display
 
+panfrost:g12b:
+  extends:
+    - .g12b
+    - .panfrost-gpu
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
index 000000000000..41a846a59644
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
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


