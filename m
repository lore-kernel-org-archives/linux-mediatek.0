Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21DEC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 12:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mauwWE9WCoCA+UWXJBynKBXy//N7lYa2hPe7tjiWAw0=; b=jZC7Ky2Ik/eP9kQwxHnNFHFLkp
	sTkjr+zO6+omoZJOGxJy8WQTtJw5Cw+l59momLPdQ8ssOpRrSisnIgh0tKqrZ+L1RGhhefnbpNPiO
	BOGTbjhZm9qs5c7hHCpl2IjSyb+CuzEMCZDphq8XilVZW5gpZhPRxfDgEfInhQ1HTFahuJupXjkB0
	Cx0xIG3KSjSj+Ee7+fEkjvdQqkzKHypEXApIjnfTD0b/v4EvrIfQk9SLjHVN9a5YYJIFfM8gCqEcC
	vFrewVIU6B+HVyVlcujl8uiOCj0Tk/xKnTp1EA1w6u+mGVit541CokBaFRVpGCeRG9w0OzCRW6U+i
	KZcqEI9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFvQb-00HJNP-2O;
	Wed, 20 Dec 2023 12:11:57 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFvQY-00HJKZ-2g;
	Wed, 20 Dec 2023 12:11:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703074313;
	bh=cpGbNlIDrcIqhAFCyy26RbpIG22BYa4C8X4/107Zjy8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H826zMsu4Ly2DqEn2dK54lHrjWC37YcV8O1ySVSqZjIhNZXFth9HFiQ5cPYSiXQs4
	 6nYwDCj0JViAuWFV+f2RmXtHzu1QaOLmelK0NqTPsoZwUr6rER4/dpQvsJwp4UfR4h
	 T5r+ROQkeRrl6Gb7/JGzUTn8fx/WsJYq6j5YaG/Sokk41Jflnud+mcgW9V+7b5xqy+
	 408M2U9Ku6TMpEMXtqYZvvMWID2JWK4qhFTFWJgXyQKG8sfW0oL8nI5Pb8kZQ3uvla
	 5+yKUYIGfXMiI9Ts7GbiIgGkZbEPGsDsPGW8oS5Tx+hlolGyM6o0bjMVdJ21a9cRRQ
	 T6D5oDR733+Ug==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9DEB73781FD5;
	Wed, 20 Dec 2023 12:11:48 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	daniels@collabora.com
Cc: david.heidelberg@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	emma@anholt.net,
	robdclark@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/8] drm/ci: meson: Test both GPU and display drivers
Date: Wed, 20 Dec 2023 17:41:06 +0530
Message-Id: <20231220121110.1441160-5-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231220121110.1441160-1-vignesh.raman@collabora.com>
References: <20231220121110.1441160-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_041155_001835_8CB19096 
X-CRM114-Status: UNSURE (   7.98  )
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

Meson SOC have a separate display controller and GPU,
with different drivers for each. Add support in drm-ci
to test both these drivers.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/test.yml | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 8081925303f5..159eb7ba3588 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -357,20 +357,32 @@ mediatek:mt8183-display:
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
 
+meson:g12b-gpu:
+  extends:
+    - .g12b
+  variables:
+    GPU_VERSION: g12b-gpu
+    DRIVER_NAME: panfrost
+
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
-- 
2.40.1


