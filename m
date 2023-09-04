Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF9DC83F2C
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Sep 2023 16:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAfbslHv+xG7XPYfTE6Yln5ou7CIkDaiuTV0aQxw5/g=; b=Gjnhp8X6Hkxm4e0JFPujH5qlZ9
	TYr5d6b5jCWDFiMMmMjSHCZrHTdADGxT2morQOjUI2T5i3ysYb0Ol+QL5CzKCDn0nNGtXcBwfmZT0
	g2jJyoobLf7J0BKhPsl2ZU9mbafYRxt4BbxFESjUrWxBhcYhV1V2/R2Mg0Lvgvs0GDd+LTHfijMiN
	qoVhlHJ2qfKTCPpLkIKmGRukZ4I+X+BTKwApt2JODVwpuYsNF0voEg0LClqgJiNRViDxSjTZLuIfK
	vs03dPmC0KkI8V/OdNMbbShmO9bvye7PP8GkuW78D2qQxIsiNYgCq1Ikvo3bMyYgsvCzQuzTlt55b
	PPdhd8BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCFN-004Rtq-1g;
	Mon, 04 Sep 2023 16:16:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCFL-004Rs4-0R
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Sep 2023 16:16:16 +0000
Received: from localhost.localdomain (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A3C0B660727F;
	Mon,  4 Sep 2023 17:16:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693844173;
	bh=PqnUcFY/q0lgjJw6DSUb9APr8xzTKq/rx+fSVIiGKME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FVMwR8E4oAKKzCINPOhr4QwIjSWZ8tYTACb7k+ABut6UyuFzhoTWsDJs97OB4Nhpt
	 3OWu9BILyy91S8DSMbar9kDvosLWcgYsPdkfuguBtI+LYr4So/VODZwKXQw2dGBDhb
	 NbR7JzRVJeu4HFgWw50XQOj2sQ8ajwoBb49xCN8q7S/yKTZyCQbvhFEZaY1hJ1IgpA
	 z3jo4/fhPr3IBImxZTH6vTJApbOAV4UPsuci+Gj/YMkCl1PHaNa5sISHrLb4o7er2V
	 iCs9x6ZbTouwUp+JpacW8rpRuIkL1P8Gmv13zzvkyZjVZpZHessUZLAtoyLBF+BbT0
	 T9IOljabH7TJg==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: helen.koike@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	david.heidelberg@collabora.com,
	daniels@collabora.com,
	gustavo.padovan@collabora.com,
	emma@anholt.net,
	robclark@freedesktop.org,
	robdclark@google.com,
	anholt@google.com,
	robdclark@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	jani.nikula@linux.intel.com,
	mripard@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/7] drm: ci: Force db410c to host mode
Date: Mon,  4 Sep 2023 21:45:11 +0530
Message-Id: <20230904161516.66751-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230904161516.66751-1-vignesh.raman@collabora.com>
References: <20230904161516.66751-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_091615_305798_3C7271E3 
X-CRM114-Status: GOOD (  14.42  )
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

Use fdtoverlay command to merge base device tree with an overlay
which contains the fix for USB controllers to work in host mode.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Use fdtoverlay command to merge overlay dtbo with the base dtb instead of modifying the kernel sources
  
---
 drivers/gpu/drm/ci/build.sh                         |  5 +++++
 .../gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts  | 13 +++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 7b014287a041..92ffd98cd09e 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -92,6 +92,11 @@ done
 
 if [[ -n ${DEVICE_TREES} ]]; then
     make dtbs
+    if [[ -e arch/arm64/boot/dts/qcom/apq8016-sbc.dtb ]]; then
+        dtc -@ -I dts -O dtb -o drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dtbo drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
+        fdtoverlay -i arch/arm64/boot/dts/qcom/apq8016-sbc.dtb -o arch/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dtbo
+        mv arch/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb arch/arm64/boot/dts/qcom/apq8016-sbc.dtb
+    fi
     cp ${DEVICE_TREES} /lava-files/.
 fi
 
diff --git a/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts b/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
new file mode 100644
index 000000000000..57b7604f1c23
--- /dev/null
+++ b/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
@@ -0,0 +1,13 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+    fragment@0 {
+        target-path = "/soc@0";
+        __overlay__ {
+            usb@78d9000 {
+                dr_mode = "host";
+            };
+        };
+    };
+};
-- 
2.40.1


