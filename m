Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92ADC54E49
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Mar 2024 03:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=POwX1O+7lq0eg8z3ecGr4c0d1htA/9ZHIzgSlGUL7vg=; b=cj5P8PhpRwdrAakQ6BYcxzgPQG
	vLShSQm9exJc64kP9Q9SPNoQNzFP3Luc82F4T51VrsHCAK8Sjr4c+WcaUc5PnBiy6L8QCSKO87Vxw
	MR8SCpt1bV27eotOPQW/4Dy2tqy2buDEueL7YChVX8qmAj3TYBCvUDQCx2Lvf3zLpgCJgQf3qihqj
	9EyyP9/R3Nq9vXyD1sBQiqF6MT1ptUM65r8kQzmybjLSSpHkCwXhvM05qKnrsMw6cTWFrIJ/+3cDp
	lQB4AjeERAjlQXPBCnxVddwwVwPX1uhyjeZ6R7ylcxbfgpHdstv+O/t6bzPIwVJ1uaEZfAew+oTih
	P1pw3PoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhhdm-0000000G5Hi-0bbm;
	Wed, 06 Mar 2024 03:08:22 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhhdc-0000000G57j-18N5;
	Wed, 06 Mar 2024 03:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709694490;
	bh=c6Y8Gn/KQZwmp41qAJ+VlWSo1aO0mr/SX98YmYuvIH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VHUeSDrPCf7Rmf13q4kHhIqc5+ir2MsjL300vwNTw16H84DrWp2Z6pE0pphloxzPU
	 cIhWY2NtqXSV9M/snCkVDaqoffUIbkq2NIOLLVceuWpsMuLgDd1B0qM2e2WpcRiOCr
	 +23v2W6O3gApCLn+T4T+hZnAgPmjiFPetwLxvPE8b6IF30NikuxIM9KXst98UrgrHB
	 3pWWyxDev8AKOSaXm3B0vCkzJ6eRkE1ybB/x+kpCCKd4FOWeAAvPnIyQjx+XtENbdR
	 zcTgvYP2tdESkMx1Ru6968ZPjC67Qb8HpfvVU5icr2AoZoBGLalWaZ24yTGgROpX4/
	 ERsItJGgWicaQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D88F437820BB;
	Wed,  6 Mar 2024 03:08:06 +0000 (UTC)
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
Subject: [PATCH v4 04/11] drm/ci: amdgpu: update xfails
Date: Wed,  6 Mar 2024 08:36:42 +0530
Message-Id: <20240306030649.60269-5-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240306030649.60269-1-vignesh.raman@collabora.com>
References: <20240306030649.60269-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_190812_771666_0BFF77A9 
X-CRM114-Status: UNSURE (   9.22  )
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

Update xfails with the newly added tests in testlist-amdgpu.txt.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v4:
  - New patch in the series. Run tests with newly added tests in
    testlist-amdgpu.txt and update xfails.

---
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt | 26 +++++++++++++++++--
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    | 10 ++++++-
 .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt | 17 +++++++++++-
 3 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
index ea87dc46bc2b..537f942f54c4 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
@@ -1,7 +1,24 @@
+amdgpu/amd_assr@assr-links,Fail
+amdgpu/amd_assr@assr-links-dpms,Fail
+amdgpu/amd_deadlock@amdgpu-deadlock-compute,Timeout
+amdgpu/amd_ilr@ilr-policy,Fail
+amdgpu/amd_mall@static-screen,Crash
+amdgpu/amd_mode_switch@mode-switch-first-last-pipe-2,Crash
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_bo,Fail
+amdgpu/amd_plane@mpo-pan-nv12,Fail
+amdgpu/amd_plane@mpo-pan-p010,Fail
+amdgpu/amd_plane@mpo-pan-rgb,Crash
+amdgpu/amd_plane@mpo-scale-nv12,Fail
+amdgpu/amd_plane@mpo-scale-p010,Fail
+amdgpu/amd_plane@mpo-scale-rgb,Crash
+amdgpu/amd_plane@mpo-swizzle-toggle,Fail
+amdgpu/amd_uvd_dec@amdgpu_uvd_decode,Fail
+amdgpu/amd_vce_dec@amdgpu_cs_vce_destroy,Fail
+amdgpu/amd_vce_dec@amdgpu_cs_vce_encode,Fail
+amdgpu/amd_vrr_range@freesync-parsing,Timeout
 kms_addfb_basic@bad-pitch-65536,Fail
 kms_addfb_basic@bo-too-small,Fail
 kms_addfb_basic@too-high,Fail
-kms_async_flips@async-flip-with-page-flip-events,Fail
 kms_async_flips@crc,Fail
 kms_async_flips@invalid-async-flip,Fail
 kms_atomic_transition@plane-all-modeset-transition-internal-panels,Fail
@@ -14,7 +31,13 @@ kms_bw@linear-tiling-1-displays-3840x2160p,Fail
 kms_bw@linear-tiling-2-displays-3840x2160p,Fail
 kms_bw@linear-tiling-3-displays-1920x1080p,Fail
 kms_color@degamma,Fail
+kms_cursor_crc@cursor-onscreen-64x21,Fail
+kms_cursor_crc@cursor-onscreen-64x64,Fail
+kms_cursor_crc@cursor-random-64x21,Fail
+kms_cursor_crc@cursor-random-64x64,Fail
 kms_cursor_crc@cursor-size-change,Fail
+kms_cursor_crc@cursor-sliding-64x21,Fail
+kms_cursor_crc@cursor-sliding-64x64,Fail
 kms_cursor_crc@pipe-A-cursor-size-change,Fail
 kms_cursor_crc@pipe-B-cursor-size-change,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
@@ -23,5 +46,4 @@ kms_hdr@bpc-switch,Fail
 kms_hdr@bpc-switch-dpms,Fail
 kms_plane@pixel-format,Fail
 kms_plane_multiple@atomic-pipe-A-tiling-none,Fail
-kms_rmfb@close-fd,Fail
 kms_rotation_crc@primary-rotation-180,Fail
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
index 6faf75e667d3..c5085c5571eb 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
@@ -1 +1,9 @@
-kms_async_flips@async-flip-with-page-flip-events
+# Board Name: hp-11A-G6-EE-grunt
+# Bug Report: https://lore.kernel.org/dri-devel/903b01f7-3f0d-18b7-a4b7-301c118c9321@collabora.com/T/#u
+# IGT Version: 1.28-gb0cc8160e
+# Linux Version: 6.7.0-rc3
+
+# Reported by deqp-runner
+kms_async_flips@crc
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_simple
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_bo
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
index e2c538a0f954..8420906f6cd5 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
@@ -1,2 +1,17 @@
 # Suspend to RAM seems to be broken on this machine
-.*suspend.*
\ No newline at end of file
+.*suspend.*
+
+# GPU reset seen and it hangs the machine
+amdgpu/amd_deadlock@amdgpu-deadlock-sdma
+amdgpu/amd_deadlock@amdgpu-gfx-illegal-reg-access
+amdgpu/amd_dispatch@amdgpu-reset-test-gfx-with-IP-GFX-and-COMPUTE
+
+# Hangs the machine and timeout occurs
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_simple
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_cs
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_bo
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_fence
+
+# Skip this test as core_getrevision fails with
+# Module amdgpu already inserted
+amdgpu/amd_module_load@reload
-- 
2.40.1


