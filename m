Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D77606A31A
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2026 12:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AdmAb2Dp;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RRQVjpwH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dsnhxVyCRsDB7IzLyR1PYJXVzOdADR8u2HKSk2GZFPk=; b=AdmAb2Dp4AdN/RjPeIYeJokItF
	ISgLLA5Jhe/YC6M5oz1UnWfJ77ehlaQ7gRhhhrzXWlRws4i2EJoOsouLi/cGoizq4WNdk0koJUKsz
	mdmctC2N2+2z55lx4myqSJRkxmgPTEX2wWaa8Q34P2RHMpn5ckfa9fwQj3tFerKi6cXi793yLFCIX
	ggZ1l/BTik/Wit5AGoJWbjEs6pQ83qFFG5k+6B3gqze4h//gZ0e+GntvT4v+1M44CSFVx8DrhUU5Q
	CSffWfyk8xjJ1wnmCcT4BH7bSm4bG30tck0PrqkhzNz2kxEKVZZUKXXmHNeroklbMRTxJMU/xBGuy
	/xus6M/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2Mw-00000006v3s-1IEQ;
	Wed, 28 Oct 2026 12:03:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2Ml-00000006v0u-2X6T;
	Wed, 28 Oct 2026 12:02:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BA6946022B;
	Wed, 28 Oct 2026 12:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282771F01828;
	Wed, 28 Oct 2026 12:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793188970;
	bh=dsnhxVyCRsDB7IzLyR1PYJXVzOdADR8u2HKSk2GZFPk=;
	h=From:To:Cc:Subject:Date;
	b=RRQVjpwH4sY11i/17VHL7AM40KXNuiYJdRXnbyur+Nx1X6LRie4UMFncaXFYLvxoH
	 vEMx+GQHbHaIzp/LF1pxgiZjCGpoM593FiSdoC0oumS9cQ+QXTG2jrhbH/rMsMGOc4
	 ny46eU+ErXiBlXUO9wIGSiSWyJt1DtVl5MzqstZpNxbA3vh1urvuNEXUEs3XtTQKG5
	 7Btj3/p7neZupn/jFjINQHb1iG9rUE+2UcStPVD07cRqNeLl1k7LTJk5b+1SSApV+8
	 TQK2keKsYvQ1wZP6bUVcqP55KiyxGZ4p7tUPGT59f84Fh951p+6KXMENhtAVhM6LuI
	 GcDn6NkyRpNOQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Frank Li <Frank.Li@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Eric Anholt <eric@anholt.net>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Peng Fan <peng.fan@nxp.com>,
	Aakarsh Jain <aakarsh.jain@samsung.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org,
	imx@lists.linux.dev,
	dmaengine@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: Fix property name typos in if/then schemas
Date: Wed, 28 Oct 2026 07:02:12 -0500
Message-ID: <20261028120216.2657397-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Property names within if/then schemas currently go unchecked whether
they have a type defined or match what's in the top-level schema. Adding
a check finds a number of instances of typos. The typos result in the
schema having no effect on constraints.

With this, fix the mediatek,vcodec-encoder 'clocks' count constraint
exposed by the name correction.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/clock/qcom,kpss-gcc.yaml     |  2 +-
 .../bindings/display/brcm,bcm2711-hdmi.yaml          |  2 +-
 .../bindings/display/msm/dp-controller.yaml          |  2 +-
 .../devicetree/bindings/display/msm/hdmi.yaml        |  4 ++--
 Documentation/devicetree/bindings/dma/fsl,edma.yaml  |  2 +-
 .../devicetree/bindings/gpio/loongson,ls-gpio.yaml   |  2 +-
 .../bindings/iio/adc/amlogic,meson-saradc.yaml       |  2 +-
 .../bindings/media/mediatek,vcodec-encoder.yaml      | 12 ++++--------
 .../devicetree/bindings/media/samsung,s5p-mfc.yaml   |  2 +-
 .../devicetree/bindings/pci/mediatek-pcie.yaml       | 12 ++++++------
 10 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,kpss-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,kpss-gcc.yaml
index 88b7672123a0..ed347096df46 100644
--- a/Documentation/devicetree/bindings/clock/qcom,kpss-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,kpss-gcc.yaml
@@ -62,7 +62,7 @@ then:
     - '#clock-cells'
 else:
   properties:
-    clock: false
+    clocks: false
     clock-names: false
     '#clock-cells': false
 
diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
index c1cefd547391..fd4d598f6ff8 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
@@ -145,7 +145,7 @@ allOf:
             - description: CEC stuck at low interrupt
             - description: Hotplug connected interrupt
             - description: Hotplug removed interrupt
-        interrupts-names:
+        interrupt-names:
           items:
             - const: cec-tx
             - const: cec-rx
diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 094a6383bb77..f72d1b354007 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -304,7 +304,7 @@ allOf:
         clocks:
           minItems: 6
           maxItems: 6
-        clocks-names:
+        clock-names:
           minItems: 6
           maxItems: 6
 
diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index dfec6c3480f3..02d27ccad024 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -113,7 +113,7 @@ allOf:
             - const: core
             - const: master_iface
             - const: slave_iface
-        core-vcc-supplies: false
+        core-vcc-supply: false
 
   - if:
       properties:
@@ -136,7 +136,7 @@ allOf:
             - const: core
             - const: alt_iface
             - const: extp
-        hdmi-mux-supplies: false
+        hdmi-mux-supply: false
 
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
index f609038e35ae..0260d177c7d0 100644
--- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
+++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
@@ -172,7 +172,7 @@ allOf:
             const: fsl,imx7ulp-edma
     then:
       properties:
-        clock:
+        clocks:
           minItems: 2
           maxItems: 2
         clock-names:
diff --git a/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml b/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
index 69852444df23..07c8b233c6bd 100644
--- a/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
@@ -80,7 +80,7 @@ allOf:
         - resets
     else:
       properties:
-        "#interrupts-cells": false
+        "#interrupt-cells": false
         interrupt-controller: false
         resets: false
 
diff --git a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
index 70ab4e140e71..535213ba0c5e 100644
--- a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
@@ -92,7 +92,7 @@ allOf:
     else:
       properties:
         nvmem-cells: false
-        mvmem-cel-names: false
+        nvmem-cell-names: false
         clocks:
           minItems: 4
         clock-names:
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index 4505e66876a2..52f471a070d5 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -110,19 +110,15 @@ allOf:
 
     then:
       properties:
-        clock:
-          items:
-            minItems: 1
-            maxItems: 1
+        clocks:
+          maxItems: 1
         clock-names:
           items:
             - const: venc_lt_sel
     else:
       properties:
-        clock:
-          items:
-            minItems: 1
-            maxItems: 1
+        clocks:
+          maxItems: 1
         clock-names:
           items:
             - const: venc_sel
diff --git a/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml b/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
index b46cc780703c..4488d5ca9b9c 100644
--- a/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
+++ b/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
@@ -174,7 +174,7 @@ allOf:
             - const: mfc
         iommus:
           maxItems: 2
-        iommus-names: false
+        iommu-names: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
index c009a7a52bc6..7c40361f95ec 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
@@ -127,7 +127,7 @@ allOf:
         phy-names:
           const: pcie-phy1
 
-        power-domain: false
+        power-domains: false
 
       required:
         - resets
@@ -150,7 +150,7 @@ allOf:
           minItems: 2
           maxItems: 2
 
-        reset: false
+        resets: false
 
         reset-names: false
 
@@ -171,7 +171,7 @@ allOf:
         clocks:
           minItems: 6
 
-        reset: false
+        resets: false
 
         reset-names: false
 
@@ -193,7 +193,7 @@ allOf:
         clocks:
           minItems: 6
 
-        reset: false
+        resets: false
 
         reset-names: false
 
@@ -215,7 +215,7 @@ allOf:
         clock-names:
           maxItems: 1
 
-        reset: false
+        resets: false
 
         reset-names: false
 
@@ -223,7 +223,7 @@ allOf:
 
         phy-names: false
 
-        power-domain: false
+        power-domains: false
 
         mediatek,pbus-csr: false
 
-- 
2.53.0


