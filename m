Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E974EE8015
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 15:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2OCADzv5VqY+GqigpLgWyFHmXcM3y8m0r49TzP43IA=; b=MCjzr0hkVj6/VCZtDCy6tMFqaI
	IwKjR5F54FHy6iQkE7Sietx/Neu/3+s6rvIhB8reUeiQMViKxniH7A3n0UAI6AOH7zoerTGh3pExa
	zfD0/rV4im1lbqCNuZl0Bg0TgqsWS6AzOl4coxPgIo9OJaxzhmoUx6oYDDD7euUugKzaFUZ1QlR3i
	8GW1xwHrMhuVKtamezy8meBijF8CjfMPnqLE+PbmozpICD9yHepJm4Glr6zSmVQZTaWBxslRLdme4
	j11vp6kyFpTIupMNvHi9q8bwdZV1dlYVXGULksn0Ug6Z9QbJ8IdwiSpV/SOPjQM/Tj4B+i5kXIjcQ
	Bypzp3lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qedKO-00Dzkx-0N;
	Fri, 08 Sep 2023 15:23:24 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qedKL-00Dzjn-08
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Sep 2023 15:23:22 +0000
Received: from localhost.localdomain (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DE52766072E2;
	Fri,  8 Sep 2023 16:23:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694186599;
	bh=WAVH3aE6YH73IbakKHhLz1OxqV6EfdN7Z6LYf6+NDJ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UcjB6R8jwmybsou4rFMPv9acOAA6HzKPS/vVOGD8KXnqUXT6g0gy7FBu9jA4wS073
	 MQyr50q5xlN02pWwznfoPImf0w7/x8KMWupqET/vWBps2Z15hh+3MinqjDcftckaMY
	 Q+rpXO+WEtoCUE0QRDt4sNX9PYUKotKNEW+XJFlcP8Jx88OVaZDBxzPK1QqzddFTHj
	 wWOda0UB873m1gxtCgMWvi+2bUYeDDBbUtzhxZMI5qXJ+mIWc8t+T5stCx0Jr1PD3k
	 n9DVKtiv0sxiGcvFjqHdHcaqCZJueLcotU853Hh4fJI65qtlomoSXhheaTWX7QAyTi
	 Rj3e9V6F7fY/w==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: helen.koike@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	david.heidelberg@collabora.com,
	daniels@collabora.com,
	gustavo.padovan@collabora.com,
	angelogioacchino.delregno@collabora.com,
	emma@anholt.net,
	robclark@freedesktop.org,
	robdclark@google.com,
	anholt@google.com,
	robdclark@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	jani.nikula@linux.intel.com,
	mripard@kernel.org,
	dmitry.baryshkov@linaro.org,
	matthias.bgg@gmail.com,
	agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 3/9] drm: ci: Force db410c to host mode
Date: Fri,  8 Sep 2023 20:52:19 +0530
Message-Id: <20230908152225.432139-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908152225.432139-1-vignesh.raman@collabora.com>
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_082321_205503_8E56483F 
X-CRM114-Status: GOOD (  12.64  )
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

Compile the base device tree with overlay support and use fdtoverlay
command to merge base device tree with an overlay which contains the
fix for USB controllers to work in host mode. [suggested by Maxime Ripard]

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Use fdtoverlay command to merge overlay dtbo with the base dtb instead of modifying the kernel sources

v3:
  - drm-ci scripts to use device tree overlay from arch/arm64/boot/dts/qcom and compile base device tree with overlay support

---
 drivers/gpu/drm/ci/build.sh | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 7b014287a041..092c195af242 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -91,7 +91,12 @@ for image in ${KERNEL_IMAGE_NAME}; do
 done
 
 if [[ -n ${DEVICE_TREES} ]]; then
-    make dtbs
+    make DTC_FLAGS=-@ dtbs
+    if [[ -e arch/arm64/boot/dts/qcom/apq8016-sbc.dtb ]]; then
+        dtc -@ -I dts -O dtb -o arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtbo arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
+        fdtoverlay -i arch/arm64/boot/dts/qcom/apq8016-sbc.dtb -o arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtbo
+        mv arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb arch/arm64/boot/dts/qcom/apq8016-sbc.dtb
+    fi
     cp ${DEVICE_TREES} /lava-files/.
 fi
 
-- 
2.40.1


