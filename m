Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0132DCDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 07:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ao+X2jqaQcL9q0XLo0Hodo/QFxd7Yjk81LvB4bGD0Nk=; b=KUEQoxdrbuFmz1S+1btEIWMkIy
	LzVpg+CTpTMfCr1BlCKCw0TizR6dryfomz0RRb2ArnMHOmn5AEwcvA6uIyPrXDSNE1Wf5++hzJYBI
	D1otaIpCnfQwI0kA1IHl+re/8u+WOEyeq8PioqKkBngJRyAsdXtpMTkGMogUzCM+6q4slUQeEonrq
	AyiZt7ACL31X/JnY6vSgEfAMQxN1SXJ7sJNBgj8SoZXW+FNTUiT3npwI/Z7i+8sSBQc+3kyUKJqQB
	2eqYz6GtdcUvk4ZWEf/C+mnkKwQOhc+QMWlGV41dpSoOaVaNecC2qql02AU91naRJs9AZjTpPR5bS
	Y3wbWoYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtN7s-00GZTG-32;
	Thu, 19 Oct 2023 07:07:24 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtN7q-00GZRX-02
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 07:07:23 +0000
Received: from localhost.localdomain (unknown [103.93.195.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 374276607323;
	Thu, 19 Oct 2023 08:07:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697699240;
	bh=vbXFJqs6f9vWXJOJeYHMKeu0F4lZ6PYsF44zuVrL1N8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A5IUwtXyNPJ+AQjJZ9ntYT5l9DZsGwEMbLWSPtLIgu47F6dJw/smT6npZMhHBbCgm
	 n+j0EXoyvLVPRTL1OrYUTEQm7OCb0A8qYoWUa84P2sBrEaSqyEh7c8/o55ya0s2QS1
	 vAlz8SSmTfTRB8XHvPqeuN0iQCHpiXx3MTKgksEttpOQwsM4EDOY8b417dVZBPP3cs
	 /VqPCnhM78RyxSrFahCzrK0/6fx2+lSKeVoG9aobmuA6HCxHSKKGyePpyyTu3hj8u8
	 i1HsfoJ/3OP7JSw/ZK8lIgaKo173uFwQzil083BzxrVWEdlDShKjQQ0fpx6AhQd81e
	 ud1aJphVKslJg==
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
Subject: [PATCH v5 2/9] drm: ci: Force db410c to host mode
Date: Thu, 19 Oct 2023 12:36:43 +0530
Message-Id: <20231019070650.61159-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019070650.61159-1-vignesh.raman@collabora.com>
References: <20231019070650.61159-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_000722_178049_13A863A5 
X-CRM114-Status: GOOD (  13.55  )
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
See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c80a54dda510743cefd1c4b65b8

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
  - No chaanges

---
 drivers/gpu/drm/ci/build.sh | 2 +-
 drivers/gpu/drm/ci/test.yml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 740b5008be2e..b1ea9b458922 100644
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
index a94af2f99d75..9d58c0e3bbab 100644
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


