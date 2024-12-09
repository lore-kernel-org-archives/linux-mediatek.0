Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66C8E77181
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2024 11:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RqH0dlrlbRQJY6hV8nIShWo9I2kKBRUgR2UyDp6lXjU=; b=O+jJlL0b8mWFRslySkrN2ylMMm
	6S4t9LAPf/rJpzFHUruh7rwG9ZDULEui6deFdL78zJAjO5tGmtHo5BtGMRpXSePuhteasJl9YgqV4
	33/Xic6K1yLnLHE4WqCqJRkdiJLVwZTuG1tPyYz3IOdnDD0wQGwP9fVdNKlFmvLgpbvnKApB6d7I0
	SV7+Vq9hoSxz5b0lSqWoS08B/YtiAEr3SNb3x2c3A/KNZiFUevos4gBVNrHoOEsLQuw6o5fwZHpR0
	uz577iyYx0aCALaPmBPcHSmX5yWEnIF/PRqJefSEi5JGFygH/fTX4qVLOlvs5gxIc8wWc/0JuDxHb
	bli5yzlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKc2f-00000007WSz-2sJe;
	Mon, 09 Dec 2024 11:35:09 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKc1k-00000007WFv-1c1h
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Dec 2024 11:34:14 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aa6965ad2a5so5788366b.3
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Dec 2024 03:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733744050; x=1734348850; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RqH0dlrlbRQJY6hV8nIShWo9I2kKBRUgR2UyDp6lXjU=;
        b=K73nRz8LvSwVGkoDZCzl31lcIoWlG5slF1UhN5eibzvH1r3NqnVvqlJ10i4rNFT0qj
         1Fnkt+A7TyHZbW8ERUsLq7M/qo+KVM2bbz95TdB9EGSKIs9LkMDEp2PNVCFsiAK9m/S0
         9AMq11iWqpqapxj4hTTszU34BZjh6Y8rPaMf0FUC3p38Jn/1SCZUDyNOj2IukzXzoDZX
         6KE0GpGcjhioyFhNVGClnadi29jxuIMVyNusBDEgF1Zl719ToIUTUJ95Ksym0F+PBhWC
         XMViwNIBaiAz30azSG6wdyYY2iD1ssoi5BAu/YsHnFe6U4MqOvzJNt+MEma+VJM3nNK4
         n9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733744050; x=1734348850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RqH0dlrlbRQJY6hV8nIShWo9I2kKBRUgR2UyDp6lXjU=;
        b=q4WSfhdnEVe9WCYSlaCs4mF35Fo/VTLQSuKlA60arCX8cO/l1JeLkduA1nzMnnbngp
         5hWklx0bNAPCHU5ZRlraUKhExtanKbDJAxJjqWAPZZtawO3anPFYjBaNjQjoix/zFsPt
         73I9LlJHOjiTuxJQh7AvFq0ljfBIFxWZieroZFbV4aK7T8oVHAdqQSFcCIsAzw6qyqdQ
         AHw8lcEyLarWvhqJ3Y0h7F/aCes3PV7lz5a4Ij/8G87WP5kLnETw1/bpg7p/tPHw4wIR
         6/a3GDOgYwq5bqjrAc8u4Uca0BXMBY0FCWN3zsYhExNaHuO+qc8IteXpadDXJorODmKq
         jyiA==
X-Forwarded-Encrypted: i=1; AJvYcCVm/Tu0OHinhr6HNCFiOYn+2Rh/RAOPqgo//5Qbng99zQj232K7/Sdh7ujsdj2tSKtZFnneZmpg7ye3OWx+7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNIa6XwZW+wFbDGT+vQ/BoyU+sMSWqPEKsWEHp+V5l1spZuJmn
	f3+aizuWitznU9bE4wlQKg4dmM2ttCAmecQhBR+liDQ04EPJJatnPUTY33bKUUI=
X-Gm-Gg: ASbGnctNaqhFAYelttOSL1cKOVVOX0oH3TsuKQpcsHmFzt3uFR9ctUCjDniDmdQtwdv
	0sMKUdoDyTAFKI5+3xe9zGrN2KbKmom1VnsX1zSD6RrgBINWlwcQTzIBG3dkac16xmL87RThJub
	j4UFbPwRkBa+0qlgPaf8SEOQwEBpMTlJKI2EPxcfgeF5SQ9R88ukPx5IUVlyO2rpa+faZRLs641
	Xx9kM34udBCGHRvD1uzF2YInaUGdyssTuYcoRYvophHhJmZoG/0KZkaMTaUW+0E
X-Google-Smtp-Source: AGHT+IEUwOZ9YFvIosvQUmmKdASOWnMUlhYJRR8cEOp3nz5ctbynKBiSrS7H9SVLSEx6wlTFIk5CRQ==
X-Received: by 2002:a17:907:3dab:b0:aa6:6e2e:b8b with SMTP id a640c23a62f3a-aa66e2e15a6mr265628966b.1.1733744050339;
        Mon, 09 Dec 2024 03:34:10 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa695c3ac07sm61789166b.66.2024.12.09.03.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 03:34:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
	Shijie Qin <shijie.qin@nxp.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Emil Velikov <emil.velikov@collabora.com>,
	Del Regno <angelogioacchino.delregno@somainline.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH] media: dt-bindings: trivial white-space and example cleanup
Date: Mon,  9 Dec 2024 12:34:05 +0100
Message-ID: <20241209113405.74226-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_033412_449847_DB7AE298 
X-CRM114-Status: GOOD (  11.04  )
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

Minor cleanups without funcitonal impact:
 - There should not be an empty blank line after SPDX tag,
 - Convention is to indent DTS examples in coding style with 2- or
   4-space indentation (4 is preferred),
 - Drop unused labels in DTS examples.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

No comments since August... Can it be applied?

---


 .../media/allwinner,sun50i-h6-vpu-g2.yaml     |  1 -
 .../bindings/media/amlogic,meson-ir-tx.yaml   |  1 -
 .../bindings/media/amphion,vpu.yaml           |  1 -
 .../bindings/media/fsl,imx6ull-pxp.yaml       |  1 -
 .../media/mediatek,vcodec-decoder.yaml        |  1 -
 .../media/mediatek,vcodec-encoder.yaml        |  1 -
 .../media/mediatek,vcodec-subdev-decoder.yaml |  1 -
 .../media/microchip,sama5d4-vdec.yaml         | 17 ++++----
 .../bindings/media/nxp,imx8mq-vpu.yaml        | 41 +++++++++----------
 .../bindings/media/qcom,msm8916-camss.yaml    |  1 -
 .../bindings/media/qcom,msm8996-camss.yaml    |  1 -
 .../bindings/media/qcom,sdm660-camss.yaml     |  1 -
 .../bindings/media/qcom,sdm845-camss.yaml     |  1 -
 .../bindings/media/qcom,sm8250-camss.yaml     |  1 -
 .../bindings/media/rockchip,rk3568-vepu.yaml  |  1 -
 .../bindings/media/rockchip-vpu.yaml          | 29 +++++++------
 16 files changed, 42 insertions(+), 58 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
index a4f06bbdfe49..8ba5177ac631 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/allwinner,sun50i-h6-vpu-g2.yaml#
diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
index 377acce93423..6da8a6aded23 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/amlogic,meson-ir-tx.yaml#
diff --git a/Documentation/devicetree/bindings/media/amphion,vpu.yaml b/Documentation/devicetree/bindings/media/amphion,vpu.yaml
index 9801de3ed84e..5a920d9e78c7 100644
--- a/Documentation/devicetree/bindings/media/amphion,vpu.yaml
+++ b/Documentation/devicetree/bindings/media/amphion,vpu.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/amphion,vpu.yaml#
diff --git a/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
index 84a5e894ace4..3f47744459aa 100644
--- a/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
+++ b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/fsl,imx6ull-pxp.yaml#
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
index b401c67e3ba0..d726d141a434 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index b45743d0a9ec..110e8f5f1f9e 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index a500a585c692..5865e6f0be89 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/mediatek,vcodec-subdev-decoder.yaml#
diff --git a/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
index 59b805ca47c5..ede086d55add 100644
--- a/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
+++ b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/microchip,sama5d4-vdec.yaml#
@@ -36,12 +35,12 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/clock/at91.h>
-        #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
 
-        vdec0: vdec@300000 {
-                compatible = "microchip,sama5d4-vdec";
-                reg = <0x00300000 0x100000>;
-                interrupts = <19 IRQ_TYPE_LEVEL_HIGH 4>;
-                clocks = <&pmc PMC_TYPE_PERIPHERAL 19>;
-        };
+    vdec@300000 {
+        compatible = "microchip,sama5d4-vdec";
+        reg = <0x00300000 0x100000>;
+        interrupts = <19 IRQ_TYPE_LEVEL_HIGH 4>;
+        clocks = <&pmc PMC_TYPE_PERIPHERAL 19>;
+    };
diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
index 3d58f02b0c5d..19528262810a 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/nxp,imx8mq-vpu.yaml#
@@ -44,26 +43,26 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/clock/imx8mq-clock.h>
-        #include <dt-bindings/power/imx8mq-power.h>
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/power/imx8mq-power.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-        vpu_g1: video-codec@38300000 {
-                compatible = "nxp,imx8mq-vpu-g1";
-                reg = <0x38300000 0x10000>;
-                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
-                clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>;
-                power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
-        };
+    video-codec@38300000 {
+        compatible = "nxp,imx8mq-vpu-g1";
+        reg = <0x38300000 0x10000>;
+        interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>;
+        power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
+    };
   - |
-        #include <dt-bindings/clock/imx8mq-clock.h>
-        #include <dt-bindings/power/imx8mq-power.h>
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/power/imx8mq-power.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-        vpu_g2: video-codec@38300000 {
-                compatible = "nxp,imx8mq-vpu-g2";
-                reg = <0x38310000 0x10000>;
-                interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
-                clocks = <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
-                power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
-        };
+    video-codec@38300000 {
+        compatible = "nxp,imx8mq-vpu-g2";
+        reg = <0x38310000 0x10000>;
+        interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
+        power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
+    };
diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
index 9cc0a968a401..3469a43f00d4 100644
--- a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/qcom,msm8916-camss.yaml#
diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
index 5cb0e337ea6e..644646de338a 100644
--- a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/qcom,msm8996-camss.yaml#
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
index 584106e275f6..68d8670557f5 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/qcom,sdm660-camss.yaml#
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
index d32daaef1b50..289494f561e5 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/qcom,sdm845-camss.yaml#
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
index 06db2c1e6079..a372d991e652 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/qcom,sm8250-camss.yaml#
diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
index 947ad699cc5e..d246f5d38427 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/rockchip,rk3568-vepu.yaml#
diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
index 719aeb2dc593..8c2501634080 100644
--- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
@@ -92,18 +91,18 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/clock/rk3288-cru.h>
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        #include <dt-bindings/power/rk3288-power.h>
+    #include <dt-bindings/clock/rk3288-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3288-power.h>
 
-        vpu: video-codec@ff9a0000 {
-                compatible = "rockchip,rk3288-vpu";
-                reg = <0xff9a0000 0x800>;
-                interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
-                             <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
-                interrupt-names = "vepu", "vdpu";
-                clocks = <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
-                clock-names = "aclk", "hclk";
-                power-domains = <&power RK3288_PD_VIDEO>;
-                iommus = <&vpu_mmu>;
-        };
+    video-codec@ff9a0000 {
+        compatible = "rockchip,rk3288-vpu";
+        reg = <0xff9a0000 0x800>;
+        interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "vepu", "vdpu";
+        clocks = <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
+        clock-names = "aclk", "hclk";
+        power-domains = <&power RK3288_PD_VIDEO>;
+        iommus = <&vpu_mmu>;
+    };
-- 
2.43.0


