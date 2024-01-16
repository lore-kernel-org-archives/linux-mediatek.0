Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E24C47077
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 09:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ScGCSRV6AX7Kz+dCRGT1WSj3GHKVfji+ht0WxH5OcUg=; b=ueSPBL+9xCT7ssKsVIORc4gMqQ
	eoJaxAe0hve21lkzciUfEZuFc+dVx3t9TZ9xgk3Zc9H2RrdoC2/vBtYuN0G+PSKaArcH+zkS7SAh/
	n1UuFP8WcFfT/g9tPA7rwdviusMou9E81gQndgzuNSyj1oAt+TE1uQz0E7TtekWKcadPvAZPtaUSm
	zH1jjDxR6AT5VZNoUcOVIL72i7SQUPaQ8xT6b72U5bcgigrmQWmSuZSh1cY9W36NgWaAI+2XF6epI
	ayjlMDX08OA0PRG5XIjJfSWwtIK8hnVFaHvcsDo4+jMRplxEJ6qKxtrULg2sZ79D46WS4/7FliX5L
	xWLo0ODw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPgAp-00BblI-2H;
	Tue, 16 Jan 2024 09:55:59 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPgAk-00Bbg2-35;
	Tue, 16 Jan 2024 09:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705398953;
	bh=oAl+ARqZDBtvwn2FWLM07zp3WihuS+fhA+dco/5vli4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ye+7HlTHy2N6eUEE1N22Ryi0C9xZzqmOy3O6J7X7yHC5q/51YR6cPEo+G6Fewm+Nx
	 3G+U8AfWCNDNIuoM36eJr0SKw0lhyix6iW6W5uHldPahROKwuxPbtFie3EyV1skgTd
	 nU6NEHxImljZEVqnHEms/QGNgX9PlyYU1B6jFYeFiKUUGlOCHOgcfSQzhHtGYYIsbZ
	 37S8hOSDYN22LY6mKA8RfCZpQsEwTrhv/qxx878SrNvK0/1MLKImkk2ELca+iqkG4R
	 sEvAw3Rw3pDHcvKJgXNjC9YxaRRxmleCB8lZjO928LCBzs3WUWxABxCyfRya/aaqUq
	 GmX0WlAvSYufw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 87F63378206C;
	Tue, 16 Jan 2024 09:55:49 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniel@fooishbar.org,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	david.heidelberg@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] drm/ci: meson: Rename exisitng job
Date: Tue, 16 Jan 2024 15:24:36 +0530
Message-Id: <20240116095439.107324-5-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116095439.107324-1-vignesh.raman@collabora.com>
References: <20240116095439.107324-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_015555_139582_5A1251F0 
X-CRM114-Status: GOOD (  10.53  )
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

For Amlogic Meson SOC the display driver is meson. Currently,
in drm-ci for meson, only the display driver is tested.
So rename the meson job to indicate that display driver is tested.

Rename the name of xfail files for meson (g12b), to include
information about the tested driver and update xfails
accordingly.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Refactor the patch to rename job to indicate display driver testing,
    rename the existing xfail files.

---
 drivers/gpu/drm/ci/test.yml                           | 11 ++++++++---
 ...on-g12b-fails.txt => meson-g12b-display-fails.txt} |  3 ---
 2 files changed, 8 insertions(+), 6 deletions(-)
 rename drivers/gpu/drm/ci/xfails/{meson-g12b-fails.txt => meson-g12b-display-fails.txt} (84%)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 65578427355d..8a04f7daafed 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -346,20 +346,25 @@ mediatek:mt8183-display:
     - .lava-igt:arm64
   stage: meson
   variables:
-    DRIVER_NAME: meson
     DTB: ${DEVICE_TYPE}
     BOOT_METHOD: u-boot
     KERNEL_IMAGE_TYPE: "image"
 
-meson:g12b:
+.g12b:
   extends:
     - .meson
   parallel: 3
   variables:
     DEVICE_TYPE: meson-g12b-a311d-khadas-vim3
-    GPU_VERSION: g12b
     RUNNER_TAG: mesa-ci-x86-64-lava-meson-g12b-a311d-khadas-vim3
 
+meson:g12b-display:
+  extends:
+    - .g12b
+  variables:
+    GPU_VERSION: g12b-display
+    DRIVER_NAME: meson
+
 virtio_gpu:none:
   stage: virtio-gpu
   variables:
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-display-fails.txt
similarity index 84%
rename from drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
rename to drivers/gpu/drm/ci/xfails/meson-g12b-display-fails.txt
index 56a2ae7047b4..f123fb0cb820 100644
--- a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-display-fails.txt
@@ -7,9 +7,6 @@ kms_cursor_legacy@torture-bo,Fail
 kms_cursor_legacy@torture-move,Fail
 kms_force_connector_basic@force-edid,Fail
 kms_hdmi_inject@inject-4k,Fail
-kms_plane_cursor@overlay,Fail
-kms_plane_cursor@primary,Fail
-kms_plane_cursor@viewport,Fail
 kms_properties@connector-properties-atomic,Fail
 kms_properties@connector-properties-legacy,Fail
 kms_properties@get_properties-sanity-atomic,Fail
-- 
2.40.1


