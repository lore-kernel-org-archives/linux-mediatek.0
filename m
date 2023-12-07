Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEA1C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 09:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/4Gvvrui3ZQpsidOsbN21FaZiSXJ52JyEoYkgc+qjM=; b=TIV8VoVJLlFHUKTQYSN1HvKtDD
	W+UjWy/O1l/J8UgeZF/gB0wcw49rWbAdDAzP6tsH5vwEGSK6oLZfKUG0W5132R9y2YcNWvDyM6oRn
	svoGyVy628BixHHmIg0bVLHOvHT5Ij5ZqDX90sc6zorRsGkDW9KcQh6B3q7/piDtDCHKPUJyRg6Qp
	TN1OYHYEusT7iIqYQE7rbC/37qJT8xZ2tvR5bIrpfrZzfY1rkivSuRzqtXU9H7i/1YCAStMSSl20F
	20JNJngU73/e7Le4DNozEGGrUpAvJBdB+CEJwn1590VknWXb2MI0FYRSeA+5sGBFMlyNn5PNVdBUu
	jEuw3HyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAX1-00CKKN-28;
	Thu, 07 Dec 2023 09:18:55 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAWy-00CKIH-2Y
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 09:18:54 +0000
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 78EBC6607391;
	Thu,  7 Dec 2023 09:18:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701940731;
	bh=s65wG8Xa27lvuBcW1EDiDAe4V6jKOd53wZ8KvwoHfkM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QsPc7Kxq3aAUGD/hvopThSPKYvQYNQjAzDOZ5KwNnt+Zdv8yIKsaBwVZnIGWKGD9p
	 Z3ajnMB6ZINiGzBt5trnRBXbQocOJR8rdfXO7MvlVUT9sk2Co8kP0wb9cvD8YnPknh
	 L/8ilLPkWxZY3WYqdwgK8h5mTep8Vgjg37srAW+MYn2FVoQrKEgZOIEaUs/Bb4u2rn
	 FhIL91KPVWte23fv/Fn0DpTiu2xJkWlmq0Sdk+Ze/R03VJ+aLbJrJzryKtXs6nYCL4
	 I6zVpCnWOtvlomnYszcrMOt+B5yGyH+JJgDBWjFMb5jwKDnPx6SNNxtXUwREuogkPM
	 6j7JS94bDrK8w==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: david.heidelberg@collabora.com,
	sergi.blanch.torne@collabora.com,
	guilherme.gallo@collabora.com,
	daniels@collabora.com,
	gustavo.padovan@collabora.com,
	emma@anholt.net,
	robdclark@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v7 02/10] drm: ci: Force db410c to host mode
Date: Thu,  7 Dec 2023 14:48:23 +0530
Message-Id: <20231207091831.660054-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231207091831.660054-1-vignesh.raman@collabora.com>
References: <20231207091831.660054-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_011852_958633_8DE5BCDE 
X-CRM114-Status: GOOD (  12.91  )
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

Force db410c to host mode to fix network issue which results in failure
to mount root fs via NFS.
See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629

Use apq8016-sbc-usb-host.dtb which allows the USB controllers
to work in host mode.

Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Use fdtoverlay command to merge overlay dtbo with the base dtb instead of modifying the kernel sources

v3:
  - drm-ci scripts to use device tree overlay from arch/arm64/boot/dts/qcom and compile base device tree with overlay support

v4:
  - Use apq8016-sbc-usb-host.dtb which allows the USB controllers to work in host mode.
    This patch depends on https://lore.kernel.org/lkml/20230911161518.650726-1-vignesh.raman@collabora.com/

v5:
  - No changes

v6:
  - No changes

v7:
  - Fix checkpatch style problems in commit message

---
 drivers/gpu/drm/ci/build.sh | 2 +-
 drivers/gpu/drm/ci/test.yml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index e5c5dcedd108..e2260b4a1c67 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -19,7 +19,7 @@ if [[ "$KERNEL_ARCH" = "arm64" ]]; then
     DEVICE_TREES+=" arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb"
-    DEVICE_TREES+=" arch/arm64/boot/dts/qcom/apq8016-sbc.dtb"
+    DEVICE_TREES+=" arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/qcom/apq8096-db820c.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb"
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index f285ed67eb3d..4af10f0ff82d 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -102,7 +102,7 @@ msm:apq8016:
   stage: msm
   variables:
     DRIVER_NAME: msm
-    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/apq8016-sbc.dtb
+    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/apq8016-sbc-usb-host.dtb
     GPU_VERSION: apq8016
     BM_CMDLINE: "ip=dhcp console=ttyMSM0,115200n8 $BM_KERNEL_EXTRA_ARGS root=/dev/nfs rw nfsrootdebug nfsroot=,tcp,nfsvers=4.2 init=/init $BM_KERNELARGS"
     RUNNER_TAG: google-freedreno-db410c
-- 
2.40.1


