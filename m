Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40798E75423
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 05:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/VJfK7QTCboY1n5TddMHgU1jpzpDXxYp7al9ZHl+4Q8=; b=VTi3gHIZdbwI45v0N4rSmjPyim
	+vjKs5OpKgS2FpgntD9sLwL8JRLrQx9CVDhkRWifyTVlPDCYIVVgeIZj96Io12W75E8ON5FnHbKFe
	5SlMHNzCjs6UKsAN5cNJ4S+tAzuTcaZxDTOsF07dycHic3sunmtW5zG+ZCnS1n1D+oEVK5mUtrmUh
	ExFEN6ghRjqGT1xrjbOSIrdP7/jk80y3wlD4qAUHKRwPKsSMnc4TjOaeoO2JENZ7HE8Mf/sY25uZK
	Zlq9T/7vNjtqvNoSaaXrg+5VBnWbCZRJzoT6wdkPMATgz1E68MxvGmLkjeD7MBETFbkkpjYFHGJOB
	ZoF6XlZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXaA-00Dq4n-38;
	Tue, 03 Oct 2023 05:04:30 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXa3-00Dq18-1a;
	Tue, 03 Oct 2023 05:04:26 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9b2cee40de8so95757166b.1;
        Mon, 02 Oct 2023 22:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696309460; x=1696914260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/VJfK7QTCboY1n5TddMHgU1jpzpDXxYp7al9ZHl+4Q8=;
        b=VVg2PnFzil3t4AKXVFZYy5mi9aMRftO2+r93D4RULHPZwC3QPSRalPqnfP4JkH3Tb0
         FSb7WF2pV5IX3pEfFJo02Jy0LWeyU9D/7p9CkZZWYfiYt6b0a2sP9mqAppssgQyLwakC
         xgHJSUokvpC2pYsnVScC7mslcRHXuOBpoJg7j517c6NRQqqcd61Ce+rv6saysQiPE/Lw
         jR7oj2EeGBEkeDKcDGreTkOgadOyTh3EmHnDkPMCqA/gDkwcQI+saeVJ/fe8bH31CNqp
         A8lzKibIIR8LUVkBF92y5k5bTPGO4pcc622PTRMGjc79NHahlOX48fYejhKs87CLe2jX
         J3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696309460; x=1696914260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/VJfK7QTCboY1n5TddMHgU1jpzpDXxYp7al9ZHl+4Q8=;
        b=Yatnfu5/z9O0bzhnKTWuz7LoFOd4cROavqC+T1kkz/hdXqN9IgGdv/sd6cJ9MZtiwR
         +Ab9nuPMOTSN7VF3tRhxdsQhxh+L2TSdqqGQKBRwcuaxvowtwwuWDPZEAzQU+9kKGtsQ
         HxLeB/LrsPikHN7u0MSLSd3vfqP5dZuAczsrHhz4DGo4eQ0PYSnwPEcWbRYsJOfdH9a4
         3IvhFwsUzAmJIpjTLFzyEIxqPYTdVeaO+wgzRkSB1SVHGwLRq0f9Na45h5UaeOmI5x0k
         tbmqDT1cra5oYaxTVoMooBbdwbRAHRw8fvZ41Q+dNIXpc1Fv6IB1/wUHKNWBwGK8leuj
         DjOw==
X-Gm-Message-State: AOJu0YxmiSFb/ygPNLqblMrlCIQ5kr6Zyt6q7A94zM6q/TBaN6q3hxCc
	ySnt7xmrB+SrhRwgI+3K/rA=
X-Google-Smtp-Source: AGHT+IGXtUK1wBIoK3P5LU3I9KqYNPlB/8WvR6qWFyVSqXt1GdxSzxXhYmIiFhUuyMm1g1rw5KIONQ==
X-Received: by 2002:a17:906:cd2:b0:9a1:ca55:d0cb with SMTP id l18-20020a1709060cd200b009a1ca55d0cbmr1274444ejh.23.1696309459585;
        Mon, 02 Oct 2023 22:04:19 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id gg24-20020a170906e29800b0099bd7b26639sm384497ejb.6.2023.10.02.22.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 22:04:19 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Vincent Shih <vincent.sunplus@gmail.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Anson Huang <Anson.Huang@nxp.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Lala Lin <lala.lin@mediatek.com>,
	Komal Bajaj <quic_kbajaj@quicinc.com>,
	Kumar Thella <sthella@codeaurora.org>,
	Keiji Hayashibara <hayashibara.keiji@socionext.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: nvmem: move deprecated cells binding to its own file
Date: Tue,  3 Oct 2023 07:03:55 +0200
Message-Id: <20231003050355.1631-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_220423_558009_445983F6 
X-CRM114-Status: GOOD (  17.31  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Support for old NVMEM fixed cells was deprecated in favour of
"fixed-layout". It's still part of the nvmem.yaml though and may be
unknowingly used by new bindings added without much of analyze.

To make it more difficult to accidentally support old syntax move its
binding to separated file with "deprecated" in its name.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../devicetree/bindings/mtd/mtd.yaml          |  7 ++++-
 .../bindings/mtd/partitions/nvmem-cells.yaml  |  1 +
 .../nvmem/amlogic,meson-gxbb-efuse.yaml       |  1 +
 .../bindings/nvmem/amlogic,meson6-efuse.yaml  |  1 +
 .../bindings/nvmem/apple,efuses.yaml          |  1 +
 .../devicetree/bindings/nvmem/imx-ocotp.yaml  |  1 +
 .../bindings/nvmem/mediatek,efuse.yaml        |  1 +
 .../nvmem/microchip,sama7g5-otpc.yaml         |  1 +
 .../devicetree/bindings/nvmem/mxs-ocotp.yaml  |  1 +
 .../nvmem/nvmem-deprecated-cells.yaml         | 28 +++++++++++++++++++
 .../devicetree/bindings/nvmem/nvmem.yaml      |  9 ------
 .../bindings/nvmem/qcom,qfprom.yaml           |  1 +
 .../bindings/nvmem/qcom,sec-qfprom.yaml       |  1 +
 .../bindings/nvmem/qcom,spmi-sdam.yaml        |  1 +
 .../bindings/nvmem/rockchip,otp.yaml          |  1 +
 .../bindings/nvmem/rockchip-efuse.yaml        |  1 +
 .../nvmem/socionext,uniphier-efuse.yaml       |  1 +
 .../bindings/nvmem/sunplus,sp7021-ocotp.yaml  |  1 +
 .../bindings/rtc/amlogic,meson6-rtc.yaml      |  1 +
 19 files changed, 50 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/nvmem-deprecated-cells.yaml

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index b82ca03e969c..f322290ee516 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -43,7 +43,12 @@ patternProperties:
     deprecated: true
 
   "^otp(-[0-9]+)?$":
-    $ref: ../nvmem/nvmem.yaml#
+    type: object
+
+    allOf:
+      - $ref: ../nvmem/nvmem.yaml#
+      - $ref: ../nvmem/nvmem-deprecated-cells.yaml#
+
     unevaluatedProperties: false
 
     description: |
diff --git a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
index 5474d63268dc..9518281007af 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
@@ -19,6 +19,7 @@ maintainers:
 allOf:
   - $ref: /schemas/mtd/partitions/partition.yaml#
   - $ref: /schemas/nvmem/nvmem.yaml#
+  - $ref: /schemas/nvmem/nvmem-deprecated-cells.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml b/Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml
index e49c2754ff55..9801fe6f91b5 100644
--- a/Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/amlogic,meson6-efuse.yaml b/Documentation/devicetree/bindings/nvmem/amlogic,meson6-efuse.yaml
index 84b3dfd21e09..b5cf740f96fa 100644
--- a/Documentation/devicetree/bindings/nvmem/amlogic,meson6-efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/amlogic,meson6-efuse.yaml
@@ -12,6 +12,7 @@ maintainers:
 
 allOf:
   - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml b/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
index e0860b6b85f3..d3abdafdbca0 100644
--- a/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
+++ b/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
@@ -16,6 +16,7 @@ maintainers:
 
 allOf:
   - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
index 99e60d713dac..be1314454bec 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
@@ -16,6 +16,7 @@ description: |
 
 allOf:
   - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index 7ec2988b597e..cf5f9e22bb7e 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -16,6 +16,7 @@ maintainers:
 
 allOf:
   - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
 
 properties:
   $nodename:
diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
index a296d348adb4..cc25f2927682 100644
--- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
+++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
@@ -16,6 +16,7 @@ description: |
 
 allOf:
   - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml
index a9b822aeaa7e..f43186f98607 100644
--- a/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/nvmem-deprecated-cells.yaml b/Documentation/devicetree/bindings/nvmem/nvmem-deprecated-cells.yaml
new file mode 100644
index 000000000000..951af28bbfb3
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/nvmem-deprecated-cells.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/nvmem-deprecated-cells.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVMEM old syntax for fixed cells
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Before introducing NVMEM layouts all NVMEM (fixed) cells were defined
+  as direct device subnodes. That syntax was replaced by "fixed-layout"
+  and is deprecated now. No new bindings should use it.
+
+patternProperties:
+  "@[0-9a-f]+(,[0-7])?$":
+    type: object
+    allOf:
+      - $ref: layouts/fixed-cell.yaml
+      - properties:
+          compatible: false
+    deprecated: true
+
+additionalProperties: true
+
+...
diff --git a/Documentation/devicetree/bindings/nvmem/nvmem.yaml b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
index 9f921d940142..4fd015d402ce 100644
--- a/Documentation/devicetree/bindings/nvmem/nvmem.yaml
+++ b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
@@ -46,15 +46,6 @@ properties:
       container may reference more advanced (dynamic) layout
       parsers.
 
-patternProperties:
-  "@[0-9a-f]+(,[0-7])?$":
-    type: object
-    allOf:
-      - $ref: layouts/fixed-cell.yaml
-      - properties:
-          compatible: false
-    deprecated: true
-
 additionalProperties: true
 
 examples:
diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 8740938c32eb..8c8f05d9eaf1 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/qcom,sec-qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,sec-qfprom.yaml
index 9b133f783d29..2ada2099946d 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,sec-qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,sec-qfprom.yaml
@@ -16,6 +16,7 @@ description:
 
 allOf:
   - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml b/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
index cd980def97b8..068bedf5dbc9 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
@@ -16,6 +16,7 @@ description: |
 
 allOf:
   - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
index 9c6eff788928..a44d44b32809 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
@@ -49,6 +49,7 @@ required:
 
 allOf:
   - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
 
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
index c5403e149080..b80fd8d1ae5b 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
index efccc5aacbe0..e27cbae2d63a 100644
--- a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
@@ -12,6 +12,7 @@ maintainers:
 
 allOf:
   - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml
index da3f1de7d281..af97eeb8316c 100644
--- a/Documentation/devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml
@@ -12,6 +12,7 @@ maintainers:
 
 allOf:
   - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/rtc/amlogic,meson6-rtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,meson6-rtc.yaml
index 8bf7d3a9be98..def24d52c8a5 100644
--- a/Documentation/devicetree/bindings/rtc/amlogic,meson6-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/amlogic,meson6-rtc.yaml
@@ -13,6 +13,7 @@ maintainers:
 allOf:
   - $ref: rtc.yaml#
   - $ref: /schemas/nvmem/nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
 
 properties:
   compatible:
-- 
2.35.3


