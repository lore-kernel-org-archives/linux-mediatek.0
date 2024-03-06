Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800B9C54E49
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Mar 2024 03:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTSvXZZM4ZQVWUHvcDHhgmsw/WKdbUNzw+pjSYkQd2E=; b=fGDewkrjudEWKC1BoJu9gP415f
	5PlHTwUQkly8rNdtIB13/dFjyiW+6y85BTzkJVJdpaejrSHvwcmeJTRR8f7+1z/uums2a6CxKXs+u
	F+EDDgN72QFFOuDJmyNYp2gs5JiXrOhE0JE5eTzYJ7H2l01SgYlDElSwJbZWY6CNn2RxJ0XCsgWdp
	WRjvwk9nMD4k+U73TWza+rtwVGPtSBb3irQFoXW9YqsS7tbus/YLtBwkZ9NaQ4NL+FkUFMhRGiI6N
	JNE/xF597XXOKGkzjHrq0npL47pI2bOdgY/WEOuzlo0gP1xmXRE2s71pg57l8lE4H5sQCa/4+QLGH
	uktLgRng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhheA-0000000G5f9-3BH3;
	Wed, 06 Mar 2024 03:08:46 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhhdp-0000000G5Jt-0agr;
	Wed, 06 Mar 2024 03:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709694503;
	bh=WrPzrnol5F76rUH/mCw3AKr49uKqT5kpb9joX4owG+8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=raCF6Mf6XNvcbIo2js1OPjlcSQBgbrd5ikm/VipSzvi5gJMqJJG9yhu7CyFWpyJZa
	 6EYDZnYDkDTCdxyhiuhpndJLdmrd5i7qquF0ooZf4mffmHscbeITUl4+nQXIWJBKMF
	 OSoN1t0vwYIj9EYbuFLa5Jh5qkdAEyhXAWmWcc5dgW4XjmtRx7FeHdQt+REYVirATv
	 0nJwSx/Ut739rin++CFUhFJNVhQtPk/KyxcuTh5zcRIzYor3AaYVjpLQA/QFEuhr2n
	 8fLQ6SYI7cpqh9rYTa5wL53Bo1TGjiRoScahRUeELK0aZTBLfv0nKeGXP2Gt7LioIF
	 MmDb3QOVzVZTw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7E98A3780624;
	Wed,  6 Mar 2024 03:08:19 +0000 (UTC)
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
Subject: [PATCH v4 07/11] drm/ci: meson: Refactor existing meson jobs
Date: Wed,  6 Mar 2024 08:36:45 +0530
Message-Id: <20240306030649.60269-8-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240306030649.60269-1-vignesh.raman@collabora.com>
References: <20240306030649.60269-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_190825_612828_CD4A4F52 
X-CRM114-Status: UNSURE (   9.85  )
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

For Amlogic Meson SOC the display driver is meson. Currently,
in drm-ci for meson, only the display driver is tested.
Refactor the existing meson jobs so that gpu driver testing
jobs can be added later and update xfails accordingly.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Refactor the patch to rename job to indicate display driver testing,
    rename the existing xfail files.

v3:
  - Add the job name in GPU_VERSION and use it for xfail file names instead
    of using DRIVER_NAME.

v4:
  - Remove the display suffix in job and rename xfails accordingly.
    Remove the change adding job name in GPU_VERSION.

---
 drivers/gpu/drm/ci/test.yml                    | 11 ++++++++---
 drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt |  5 -----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 99fd101ce2fe..951a44bf9d19 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -351,20 +351,25 @@ panfrost:mt8183:
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
 
+meson:g12b:
+  extends:
+    - .g12b
+  variables:
+    GPU_VERSION: g12b
+    DRIVER_NAME: meson
+
 virtio_gpu:none:
   stage: virtio-gpu
   variables:
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
index 56a2ae7047b4..029b4ade21f6 100644
--- a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
@@ -5,11 +5,6 @@ kms_cursor_legacy@single-bo,Fail
 kms_cursor_legacy@single-move,Fail
 kms_cursor_legacy@torture-bo,Fail
 kms_cursor_legacy@torture-move,Fail
-kms_force_connector_basic@force-edid,Fail
-kms_hdmi_inject@inject-4k,Fail
-kms_plane_cursor@overlay,Fail
-kms_plane_cursor@primary,Fail
-kms_plane_cursor@viewport,Fail
 kms_properties@connector-properties-atomic,Fail
 kms_properties@connector-properties-legacy,Fail
 kms_properties@get_properties-sanity-atomic,Fail
-- 
2.40.1


