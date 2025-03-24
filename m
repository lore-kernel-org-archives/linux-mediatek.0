Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7E9C36002
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Mar 2025 13:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0KdXJF27mp6zumhGhPwYMpFXFYh4NX8AS29XMRUS7KY=; b=pWsdPp7u4sBhmuqO4ML0VlOC31
	HbCZVIdOx31lVRY4M3lS8MD4Rhkk5NSgwOFLV4DD+g3//TlzVyHeuThIi/ofwPqPFhzNJbs0NxDqZ
	6VMKk/YyArMew3FUraCV6/Y4tCky2uX6Icq41aM1EOgju/3FQNWSqMGxHjOk/1uH96AlRaQsCTQYm
	6pTG7qw3K6v8qkD/3h3wCZEyfeFMiGgG48AYRVUfYWBVoEfsT4UY1LoZa++/5ShCMy8qMBjFnFIfw
	bq3UGBM4FK+TI0WAaZBjz40ERY5TG2iGqsa4A0ii559XqP5ZpCBCokrxLAM0lkX5Nizm1Gx1YQsZu
	Bsgeo1CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twhUU-00000003CAo-2LyL;
	Mon, 24 Mar 2025 13:05:18 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twhIa-000000036Hv-1sDp
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Mar 2025 12:53:01 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43bc21f831bso2602965e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Mar 2025 05:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742820779; x=1743425579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0KdXJF27mp6zumhGhPwYMpFXFYh4NX8AS29XMRUS7KY=;
        b=wSFhMrEzDxtDWhWJqxiI532DyXRFV+j1K87EFLdDrgISlDpoS1P8jPs1tkX/xa4An2
         QOl+/NLvDlaI3VEpIoQnwKgBUkqNitQ9SNi/t5WrPsP0hI8Ikk3fiv2GfCCBgYRVahJU
         gIBVpxKPZtinFnW0tl22njuLfIJ+MLX2n0+E+p+sfTDbmmKhTVSeOgAsMmYpADa8uew7
         /T4MWbDIRGBVoJM7LOwnVHAaNG8d7KH3+9srcgb9h+LhF3WedxR7TaVteTvmp4ZOUn3U
         zDoKsLM6jtHG8EBwJgbTmtlY7F9xGYCkMmn0MEkKmIUK3lCy4RJ9Pm0FQIxm0nQHaWYC
         PYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742820779; x=1743425579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0KdXJF27mp6zumhGhPwYMpFXFYh4NX8AS29XMRUS7KY=;
        b=BHNWb2O2kvRvE1UIaXTqEKwmYZhWSYpMmGj+bJUQctajdRTKyruIYHqyVU+AQxYnlB
         KhvHm5IezMDBk3R3K0ySPnVqae0Saru7uAMfE/kJpIZ9xmqyxrlipmgBTzBd/gK36x92
         39z9BGBuKM9+cNA5Qu+Ahf0LyckWYLGL4PlQseNYM1YKzSPWfvNQXfEMK+LIIQEFaBeX
         3ENiB2H19Y4eYZkgWTCLTjj2wIHn5rwlygyNgDQzgN11gtAIFrYP1snA+WjHpKb5AmmV
         qx7lxaRd308JZ5eBc8VCxsi/2yosGbjxW2DTos5Oux4e+RI9qSOuSKwoYkArPPK4wnYL
         qRMA==
X-Forwarded-Encrypted: i=1; AJvYcCVYILTr5JswHuSzhNGOLQ7PjM41tlr4pdxEAJVDhmw1JjzjU1rIFSOIzYDiIu9TwfuMxrJyUcQtFmzHf4S6oA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfhHb4NDEwUjQvnWHzl4PViNmtCp9yf/tAxv3XTkOa/G27GrDn
	Ey+7JRiqWg78ykNiHIwy4pz+5fuRpy+guWBFwGZkEJ3TbNWvH8/ojVdbpq10XTQ=
X-Gm-Gg: ASbGncv8IztijSwz3T2d6OEUDwvPRziDTjoGKDFYWnKb0MhJIxdWaPXW2QciuOgBBgB
	LkdhCB2Aw/1Fu9y2+YOFFtnenxaLYlhLRI2R0WPWMvNAYxgpegWwp51ceUSaMnGXfjNJola2rns
	BNpgYI7kFRIcE+6hII3mFL4CUqlnmgHYFKhFXkIM9GVDdbWcwIPi3K7KEGlD9fkmnqaYBuboR7U
	Yw1+EoMH3oqlnNUt8h2/UsiLaA5CyzFKJi2faYKu+paWi+93o55jIVF9uZg9qfmetaZRYnw9IBr
	KgE06K1oKPQ9svhvflYmbkQJhcQFClVO5fW8IddwQlK3xHvMmH93JTEPiw==
X-Google-Smtp-Source: AGHT+IHMYjwcP6IQLAQEeK4JGYmy7U3UUT8QxLTRI83cizBxKScOV+rOEFHkV2KbRv9UquSBZq4bDQ==
X-Received: by 2002:a05:600c:350b:b0:439:9909:c785 with SMTP id 5b1f17b1804b1-43d56dc2af2mr36266185e9.7.1742820778571;
        Mon, 24 Mar 2025 05:52:58 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9efcb1sm11087576f8f.94.2025.03.24.05.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 05:52:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Heidelberg <david@ixit.cz>,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: iommu: Correct indentation and style in DTS example
Date: Mon, 24 Mar 2025 13:52:50 +0100
Message-ID: <20250324125250.82137-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_055300_511096_1A212A8F 
X-CRM114-Status: GOOD (  13.51  )
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

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.  While re-indenting, drop
unused labels.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../iommu/allwinner,sun50i-h6-iommu.yaml      |  24 ++--
 .../bindings/iommu/arm,smmu-v3.yaml           |  20 ++--
 .../devicetree/bindings/iommu/arm,smmu.yaml   | 104 +++++++++---------
 .../bindings/iommu/mediatek,iommu.yaml        |  18 +--
 .../bindings/iommu/qcom,apq8064-iommu.yaml    |  20 ++--
 5 files changed, 92 insertions(+), 94 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml
index a8409db4a3e3..ad51ace9ca09 100644
--- a/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml
@@ -48,19 +48,19 @@ additionalProperties: false
 
 examples:
   - |
-      #include <dt-bindings/interrupt-controller/arm-gic.h>
-      #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
 
-      #include <dt-bindings/clock/sun50i-h6-ccu.h>
-      #include <dt-bindings/reset/sun50i-h6-ccu.h>
+    #include <dt-bindings/clock/sun50i-h6-ccu.h>
+    #include <dt-bindings/reset/sun50i-h6-ccu.h>
 
-      iommu: iommu@30f0000 {
-          compatible = "allwinner,sun50i-h6-iommu";
-          reg = <0x030f0000 0x10000>;
-          interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
-          clocks = <&ccu CLK_BUS_IOMMU>;
-          resets = <&ccu RST_BUS_IOMMU>;
-          #iommu-cells = <1>;
-      };
+    iommu@30f0000 {
+        compatible = "allwinner,sun50i-h6-iommu";
+        reg = <0x030f0000 0x10000>;
+        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_IOMMU>;
+        resets = <&ccu RST_BUS_IOMMU>;
+        #iommu-cells = <1>;
+    };
 
 ...
diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
index 75fcf4cb52d9..36b31197c908 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
@@ -82,14 +82,14 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
 
     iommu@2b400000 {
-            compatible = "arm,smmu-v3";
-            reg = <0x2b400000 0x20000>;
-            interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING>,
-                         <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>,
-                         <GIC_SPI 77 IRQ_TYPE_EDGE_RISING>,
-                         <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>;
-            interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
-            dma-coherent;
-            #iommu-cells = <1>;
-            msi-parent = <&its 0xff0000>;
+        compatible = "arm,smmu-v3";
+        reg = <0x2b400000 0x20000>;
+        interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 77 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
+        dma-coherent;
+        #iommu-cells = <1>;
+        msi-parent = <&its 0xff0000>;
     };
diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 7b9d5507d6cc..5b56e4f9d106 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -621,73 +621,71 @@ examples:
   - |+
     /* SMMU with stream matching or stream indexing */
     smmu1: iommu@ba5e0000 {
-            compatible = "arm,smmu-v1";
-            reg = <0xba5e0000 0x10000>;
-            #global-interrupts = <2>;
-            interrupts = <0 32 4>,
-                         <0 33 4>,
-                         <0 34 4>, /* This is the first context interrupt */
-                         <0 35 4>,
-                         <0 36 4>,
-                         <0 37 4>;
-            #iommu-cells = <1>;
+        compatible = "arm,smmu-v1";
+        reg = <0xba5e0000 0x10000>;
+        #global-interrupts = <2>;
+        interrupts = <0 32 4>,
+                     <0 33 4>,
+                     <0 34 4>, /* This is the first context interrupt */
+                     <0 35 4>,
+                     <0 36 4>,
+                     <0 37 4>;
+        #iommu-cells = <1>;
     };
 
     /* device with two stream IDs, 0 and 7 */
     master1 {
-            iommus = <&smmu1 0>,
-                     <&smmu1 7>;
+        iommus = <&smmu1 0>,
+                 <&smmu1 7>;
     };
 
 
     /* SMMU with stream matching */
     smmu2: iommu@ba5f0000 {
-            compatible = "arm,smmu-v1";
-            reg = <0xba5f0000 0x10000>;
-            #global-interrupts = <2>;
-            interrupts = <0 38 4>,
-                         <0 39 4>,
-                         <0 40 4>, /* This is the first context interrupt */
-                         <0 41 4>,
-                         <0 42 4>,
-                         <0 43 4>;
-            #iommu-cells = <2>;
+        compatible = "arm,smmu-v1";
+        reg = <0xba5f0000 0x10000>;
+        #global-interrupts = <2>;
+        interrupts = <0 38 4>,
+                     <0 39 4>,
+                     <0 40 4>, /* This is the first context interrupt */
+                     <0 41 4>,
+                     <0 42 4>,
+                     <0 43 4>;
+        #iommu-cells = <2>;
     };
 
     /* device with stream IDs 0 and 7 */
     master2 {
-            iommus = <&smmu2 0 0>,
-                     <&smmu2 7 0>;
+        iommus = <&smmu2 0 0>,
+                 <&smmu2 7 0>;
     };
 
     /* device with stream IDs 1, 17, 33 and 49 */
     master3 {
-            iommus = <&smmu2 1 0x30>;
+        iommus = <&smmu2 1 0x30>;
     };
 
 
     /* ARM MMU-500 with 10-bit stream ID input configuration */
     smmu3: iommu@ba600000 {
-            compatible = "arm,mmu-500", "arm,smmu-v2";
-            reg = <0xba600000 0x10000>;
-            #global-interrupts = <2>;
-            interrupts = <0 44 4>,
-                         <0 45 4>,
-                         <0 46 4>, /* This is the first context interrupt */
-                         <0 47 4>,
-                         <0 48 4>,
-                         <0 49 4>;
-            #iommu-cells = <1>;
-            /* always ignore appended 5-bit TBU number */
-            stream-match-mask = <0x7c00>;
+        compatible = "arm,mmu-500", "arm,smmu-v2";
+        reg = <0xba600000 0x10000>;
+        #global-interrupts = <2>;
+        interrupts = <0 44 4>,
+                     <0 45 4>,
+                     <0 46 4>, /* This is the first context interrupt */
+                     <0 47 4>,
+                     <0 48 4>,
+                     <0 49 4>;
+        #iommu-cells = <1>;
+        /* always ignore appended 5-bit TBU number */
+        stream-match-mask = <0x7c00>;
     };
 
     bus {
-            /* bus whose child devices emit one unique 10-bit stream
-               ID each, but may master through multiple SMMU TBUs */
-            iommu-map = <0 &smmu3 0 0x400>;
-
-
+        /* bus whose child devices emit one unique 10-bit stream
+           ID each, but may master through multiple SMMU TBUs */
+        iommu-map = <0 &smmu3 0 0x400>;
     };
 
   - |+
@@ -695,17 +693,17 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     smmu4: iommu@d00000 {
-      compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
-      reg = <0xd00000 0x10000>;
+        compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
+        reg = <0xd00000 0x10000>;
 
-      #global-interrupts = <1>;
-      interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
-             <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
-             <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>;
-      #iommu-cells = <1>;
-      power-domains = <&mmcc 0>;
+        #global-interrupts = <1>;
+        interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>;
+        #iommu-cells = <1>;
+        power-domains = <&mmcc 0>;
 
-      clocks = <&mmcc 123>,
-        <&mmcc 124>;
-      clock-names = "bus", "iface";
+        clocks = <&mmcc 123>,
+                 <&mmcc 124>;
+        clock-names = "bus", "iface";
     };
diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index ea6b0f5f24de..1eac27893b03 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -218,13 +218,13 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     iommu: iommu@10205000 {
-            compatible = "mediatek,mt8173-m4u";
-            reg = <0x10205000 0x1000>;
-            interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>;
-            clocks = <&infracfg CLK_INFRA_M4U>;
-            clock-names = "bclk";
-            mediatek,infracfg = <&infracfg>;
-            mediatek,larbs = <&larb0>, <&larb1>, <&larb2>,
-                             <&larb3>, <&larb4>, <&larb5>;
-            #iommu-cells = <1>;
+        compatible = "mediatek,mt8173-m4u";
+        reg = <0x10205000 0x1000>;
+        interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>;
+        clocks = <&infracfg CLK_INFRA_M4U>;
+        clock-names = "bclk";
+        mediatek,infracfg = <&infracfg>;
+        mediatek,larbs = <&larb0>, <&larb1>, <&larb2>,
+                         <&larb3>, <&larb4>, <&larb5>;
+        #iommu-cells = <1>;
     };
diff --git a/Documentation/devicetree/bindings/iommu/qcom,apq8064-iommu.yaml b/Documentation/devicetree/bindings/iommu/qcom,apq8064-iommu.yaml
index 9f83f851e61a..aaecad32dc9d 100644
--- a/Documentation/devicetree/bindings/iommu/qcom,apq8064-iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/qcom,apq8064-iommu.yaml
@@ -65,14 +65,14 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     iommu@7500000 {
-            compatible = "qcom,apq8064-iommu";
-            reg = <0x07500000 0x100000>;
-            interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&clk SMMU_AHB_CLK>,
-                     <&clk MDP_AXI_CLK>;
-            clock-names = "smmu_pclk",
-                          "iommu_clk";
-            #iommu-cells = <1>;
-            qcom,ncb = <2>;
+        compatible = "qcom,apq8064-iommu";
+        reg = <0x07500000 0x100000>;
+        interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk SMMU_AHB_CLK>,
+                 <&clk MDP_AXI_CLK>;
+        clock-names = "smmu_pclk",
+                      "iommu_clk";
+        #iommu-cells = <1>;
+        qcom,ncb = <2>;
     };
-- 
2.43.0


