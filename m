Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9862EC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 09:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNS8/o5FxuNnFauNs4bQra3BWdExxGqh+Sb/I0yA2iQ=; b=h9O9DnveYl/FZwZ/4/EpbIFhzO
	PC4Sdn5ipP4NtDBT1Y3IxWlhO+2lJDHsxXDxPl2UlpaqqGhuizkMBqUMQRqxdL17gFABCmJMRPg2N
	FxYmWJQEPuY9gYn0wzHLtQoKGLfrcM05XOgTSubrEO1CAdxdEZs0qwA9TVLh6IS3jAU3bXrEbjU6T
	BH59MrtKs7x/AcoEogWaB/HlgEnfzUurUSflNtutAxzK88kY1G2IaD9fAkGXsJPll8zHBsDfFHspl
	5FYKB1CWkjN8tfNsElmX0nZGeY7tkSPlJ0G0mi9lIOOmV/oTJvPJHCRjnb6cLV3UrEyXah2igFNbO
	jz/GgenQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1jXu-00000005lvY-42Ii;
	Tue, 30 Apr 2024 09:13:06 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1jXT-00000005lb2-00IG;
	Tue, 30 Apr 2024 09:12:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714468357;
	bh=bUO7dtNgWSshDi1Qf2Uk5J0W1z0VPlq7iq325QaEprY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s053ceaXHb86mSvWIbuDRfgisrA5p7dSZL4B1xrqH+/G0DY+90ftctrYT2jef3a2d
	 SsPBAwfpc+0ixxgbOqtjru+eFWU7Xgsx41/yPNF8jy0dM/QeW8EFbZYeZGCmC0yR7K
	 BaOi6eI6ucQzi4g6qnvpSrZHEllJL24sLviwXUOvg4YnXM0iOQGVOaW5tp4p5aZlzT
	 kJzd6P1tg+HXlZZ4fd5mWETzO9itd9eOjjVudEWLcdv9A3/jvFxfSVZ+RRpsW0oXuy
	 EDU0MSW+RS/9wI6vQJoy2fjNR4eUwWDhkZMY/jIR2+Sn+DXEASKJMSwdVPR72YxpmA
	 nib2GTl+7REGg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8E5F23782169;
	Tue, 30 Apr 2024 09:12:33 +0000 (UTC)
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
Subject: [PATCH v1 4/5] drm/ci: skip driver specific tests
Date: Tue, 30 Apr 2024 14:41:20 +0530
Message-Id: <20240430091121.508099-5-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240430091121.508099-1-vignesh.raman@collabora.com>
References: <20240430091121.508099-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_021240_319520_CD7B7BA8 
X-CRM114-Status: GOOD (  14.03  )
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

Skip driver specific tests and skip kms tests for
panfrost driver since it is not a kms driver.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt   | 14 +++++++++++++-
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt   | 14 +++++++++++++-
 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt    | 14 +++++++++++++-
 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt    | 12 ++++++++++++
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt    | 14 +++++++++++++-
 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt    | 14 +++++++++++++-
 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt    | 14 +++++++++++++-
 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt    | 14 +++++++++++++-
 .../gpu/drm/ci/xfails/mediatek-mt8173-skips.txt | 12 ++++++++++++
 .../gpu/drm/ci/xfails/mediatek-mt8183-skips.txt | 14 ++++++++++++++
 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt  | 14 ++++++++++++++
 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt | 14 ++++++++++++++
 drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt | 14 +++++++++++++-
 .../msm-sc7180-trogdor-kingoftown-skips.txt     | 15 +++++++++++++++
 .../msm-sc7180-trogdor-lazor-limozeen-skips.txt | 15 +++++++++++++++
 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt  | 15 +++++++++++++++
 .../gpu/drm/ci/xfails/rockchip-rk3288-skips.txt | 17 ++++++++++++++++-
 .../gpu/drm/ci/xfails/rockchip-rk3399-skips.txt | 15 +++++++++++++++
 .../gpu/drm/ci/xfails/virtio_gpu-none-skips.txt | 15 ++++++++++++++-
 19 files changed, 260 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt

diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
index e2c538a0f954..70e2f925d06f 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
@@ -1,2 +1,14 @@
 # Suspend to RAM seems to be broken on this machine
-.*suspend.*
\ No newline at end of file
+.*suspend.*
+
+# Skip driver specific tests
+msm_.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt b/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
index fe55540a3f9a..59f8acfaa5ba 100644
--- a/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
@@ -1,4 +1,16 @@
 # Suspend to RAM seems to be broken on this machine
 .*suspend.*
 # This is generating kernel oops with divide error
-kms_plane_scaling@invalid-parameters
\ No newline at end of file
+kms_plane_scaling@invalid-parameters
+
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# GEM tests takes ~1000 hours, so skip it
+gem_.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
index 3430b215c06e..d97bc038b63a 100644
--- a/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
@@ -3,4 +3,16 @@
 # This is generating kernel oops with divide error
 kms_plane_scaling@invalid-parameters
 # This is cascading issues
-kms_3d
\ No newline at end of file
+kms_3d
+
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# GEM tests takes ~1000 hours, so skip it
+gem_.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt b/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
index 6d3d7ddc377f..92c0ffee8283 100644
--- a/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
@@ -1,2 +1,14 @@
 # This is generating kernel oops with divide error
 kms_plane_scaling@invalid-parameters
+
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# GEM tests takes ~1000 hours, so skip it
+gem_.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
index 4c7d00ce14bc..a168722caf13 100644
--- a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
@@ -2,4 +2,16 @@
 .*suspend.*
 
 # This is generating kernel oops with divide error
-kms_plane_scaling@invalid-parameters
\ No newline at end of file
+kms_plane_scaling@invalid-parameters
+
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# GEM tests takes ~1000 hours, so skip it
+gem_.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
index 4c7d00ce14bc..a168722caf13 100644
--- a/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
@@ -2,4 +2,16 @@
 .*suspend.*
 
 # This is generating kernel oops with divide error
-kms_plane_scaling@invalid-parameters
\ No newline at end of file
+kms_plane_scaling@invalid-parameters
+
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# GEM tests takes ~1000 hours, so skip it
+gem_.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
index 1d0621750b14..d41344627261 100644
--- a/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
@@ -8,4 +8,16 @@ gem_eio.*
 kms_flip@absolute-wf_vblank@a-edp1
 
 # This is generating kernel oops with divide error
-kms_plane_scaling@invalid-parameters
\ No newline at end of file
+kms_plane_scaling@invalid-parameters
+
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# GEM tests takes ~1000 hours, so skip it
+gem_.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
index f3be0888a214..92c0ffee8283 100644
--- a/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
@@ -1,2 +1,14 @@
 # This is generating kernel oops with divide error
-kms_plane_scaling@invalid-parameters
\ No newline at end of file
+kms_plane_scaling@invalid-parameters
+
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# GEM tests takes ~1000 hours, so skip it
+gem_.*
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
new file mode 100644
index 000000000000..db0c9dbbeb61
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
@@ -0,0 +1,12 @@
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
new file mode 100644
index 000000000000..7a1c8be89e5b
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
@@ -0,0 +1,14 @@
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
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
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
new file mode 100644
index 000000000000..7a1c8be89e5b
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
@@ -0,0 +1,14 @@
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
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
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
new file mode 100644
index 000000000000..cc0c2f1ecca7
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
@@ -0,0 +1,14 @@
+# Skip driver specific tests
+^amdgpu.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
+
+# Skip these tests as core_getrevision fails
+core_hotunplug.*
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
index cd49c8ce2059..9ab2177df1ab 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
@@ -1,2 +1,14 @@
 # Whole machine hangs
-kms_cursor_legacy@all-pipes-torture-move
\ No newline at end of file
+kms_cursor_legacy@all-pipes-torture-move
+
+# Skip driver specific tests
+^amdgpu.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
index 327039f70252..053810a24691 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
@@ -1,2 +1,17 @@
 # Suspend to RAM seems to be broken on this machine
 .*suspend.*
+
+# Skip driver specific tests
+^amdgpu.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
+
+# Skip these tests as core_getrevision fails
+core_hotunplug.*
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
index 327039f70252..053810a24691 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
@@ -1,2 +1,17 @@
 # Suspend to RAM seems to be broken on this machine
 .*suspend.*
+
+# Skip driver specific tests
+^amdgpu.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
+
+# Skip these tests as core_getrevision fails
+core_hotunplug.*
diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
index 618e3a3a7277..871110845b52 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
@@ -5,3 +5,18 @@ kms_bw.*
 # https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/4b49f902ec6f2bb382cbbf489870573f4b43371e
 # https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/38cdf4c5559771e2474ae0fecef8469f65147bc1
 msm_mapping@*
+
+# Skip driver specific tests
+^amdgpu.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
+
+# Skip these tests as core_getrevision fails
+core_hotunplug.*
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
index f20c3574b75a..c33dc95b7fc1 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
@@ -49,4 +49,19 @@ kms_plane_lowres@pipe-F-tiling-y
 kms_cursor_crc.*
 
 # Machine is hanging in this test, so skip it
-kms_pipe_crc_basic@disable-crc-after-crtc
\ No newline at end of file
+kms_pipe_crc_basic@disable-crc-after-crtc
+
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
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
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
index 10c3d81a919a..8a7c9464b30d 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
@@ -3,3 +3,18 @@
 
 # Too unstable, machine ends up hanging after lots of Oopses
 kms_cursor_legacy.*
+
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
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
diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
index 78be18174012..6f00d3670530 100644
--- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
@@ -3,4 +3,17 @@
 kms_cursor_legacy.*
 
 # Job just hangs without any output
-kms_flip@flip-vs-suspend.*
\ No newline at end of file
+kms_flip@flip-vs-suspend.*
+
+# Skip driver specific tests
+^amdgpu.*
+msm_.*
+nouveau_.*
+panfrost_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
-- 
2.40.1


