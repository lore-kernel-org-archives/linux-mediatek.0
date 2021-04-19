Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B11C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 07:33:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9DAA6102A
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 07:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9DAA6102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZI9X3rULhSufaF3sjFCsNjWh2Fjt7CHjiThQbxEOLgs=; b=IJvYCYmZvMdcWUCjnF23D2ZEf
	dXzsGfGi3+7yNlZgTKGgZP2l5+FdPNOjZQHXS/8RI+98oS/CogZl56tzx6I9m/ADrWE+TmEN71zUl
	ZGfc/3CNxuQSw8Hb9SRoTEyKqlvaPGcePbGd0GRbiAesD+6KUvu0xnVUIfItkEUPE9WcD8pDM9lSG
	vDWAHPcChKwhqaEW2IcxZYgEBVWJH1CH2tYn4ObtASq5l7brUehYn5YnM8HfiPPDQq2Aq5qU56XbI
	sw+xPA8JwuRdJmL0b6OWCZ02sFw4+IOAGJxjR0RircTqcApkQ4s2RZHwgti8KvXhb7Cg5qZJxabf4
	kbDVbfhvg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYOPF-009LKq-Tn; Mon, 19 Apr 2021 07:33:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYOP4-009LHt-Dr
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 07:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=naT4vjrblF93sEVUd8S4n+AfLj9s7pbcAl4+qNtMAzM=; b=iuVDSmHtFRzT2kcXsyDg/7oy3W
 IRSvHFiF836PNYvb7Os6kqztFuMVSjCqpdAjpO9THn8wvR+1kHOKJmuTVNt324EFJjByfNqiuTc1H
 RJsburMmcWJjeA8+l0lUrYlGzQEsqLmDsEnZ8RJrb4TFOrvPjRtkWduCnARd4UNYcEVwSFG7WY/i+
 6JP6S3yCBoqFUOrKM+FJNiQpuJtB6OhXcAcM39p00iiuyRXVHKJ7OAyvbwLaRRhXmz3IlTNP18L/W
 m5VbpkHRvGYcM3/Q2XYWlQ+8/FHwefH/mDWioUyrr5qzNPs6xQpqbqqiASDT1WAmgELi/YAcWCmzk
 4fZqmYZA==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYOP0-00B8Kb-94
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 07:33:05 +0000
Received: by mail-wm1-x335.google.com with SMTP id u20so13032400wmj.0
 for <linux-mediatek@lists.infradead.org>; Mon, 19 Apr 2021 00:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=naT4vjrblF93sEVUd8S4n+AfLj9s7pbcAl4+qNtMAzM=;
 b=QRpwNL5SftIsym3EnqHd+GB10WVr1NekRy0txlloSZ6on7eP4GG4G+RkB52Eun4qyD
 kgXlKMEjUzxAXBxw70iA+6g78KEc5mUjB/msX1WF7r4Nn7qQyD1ipTt7qBJko1coDPhi
 H2LuVfHdcsmblaF7CjBUDWYmHaPh87tqNjRJ6fTy/+f6W+vXK+DNOc2mDpXUt/G/BLjv
 5Jh8XizCLD3IY8OQ2lhS91Z40wA51O0y4en85Rny2aNfsvF2gGz5MeSLhZUk9Lk3B6JK
 S5b6q9fYkXBD7aNutCUGHKZgSYlz+d/x7Y+gZ0c8LvZTGE5rFQZ6QqA+4RX8MI2zIjpW
 k9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=naT4vjrblF93sEVUd8S4n+AfLj9s7pbcAl4+qNtMAzM=;
 b=GY7D6zVwgw9xPrS1NyUv7xhrqxINdzbZqsFMRvNl1w8QfH6tsnvn7qS8qD1C/zPT2D
 aPGfHYTaBTQtJ39TmolOBqGFT+URYdfuGlZkiiBJnaCqJtOrj5Cw1m3EIL/pkFSNJCeB
 DKG4TnUXHMHxfZ0RWYOlejphzBfDM/42Ad5BN2U6VeobpoRUJG/FZSslAPghxnQUoq2I
 vPAovUaMFP3T795fpBd4jGOhTGhDDyiH6noYT6ndBcQxhiCBSHhOZWWNwPTzZXuLOBDg
 yFhLbInfIvtixiFfGwVj2TviYptSuTFVRzHtqEdKAajQ69SguWJ9Tg/dFc61YxG+lfdP
 /+QA==
X-Gm-Message-State: AOAM530V2b0CCM6tT25EhsEN4ADnxScLGUkJEQ5mwICqKXlOqUbi8P+m
 QDMvz+r6mcxRAFHhGNpjAl7m/A==
X-Google-Smtp-Source: ABdhPJzvQzK8iPEapXbulNnMBQxBJBduDTWdki/cPiB3sIonAH2SZ9eP9p3Uucjjd6pnt7gK13UM3Q==
X-Received: by 2002:a05:600c:190f:: with SMTP id
 j15mr1918017wmq.157.1618817580360; 
 Mon, 19 Apr 2021 00:33:00 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:2e82:31e6:67f1:4f33])
 by smtp.gmail.com with ESMTPSA id
 y125sm5492311wmy.34.2021.04.19.00.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 00:32:59 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 1/5] dt-bindings: display: mediatek,
 hdmi: Convert to use graph schema
Date: Mon, 19 Apr 2021 09:32:40 +0200
Message-Id: <20210419073244.2678688-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419073244.2678688-1-narmstrong@baylibre.com>
References: <20210419073244.2678688-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=76lew5EeaRRhsAki7YLcUNiHeBtoR+DlILtleRFF7fM=;
 m=nn8XzvbbItXNlk7a/2M6U3KbnSIqLoOqQ26l1yCYhrQ=;
 p=y6Xf5rjieTHDTy2Ro4habUke5zB6c71HJAuGrU2DG3k=;
 g=50686022c2e5549f28b159c238abb8963aacaa81
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmB9MgwACgkQd9zb2sjISdGVEBAAxlf
 VrxJ6XBb2HsruF9PwMuTazSU8NKQ5+nQh3eMLexzYd5hMI+HGG0l9WpjsWvx1+heBxfWdACgg4aNB
 /hzm4wHrDp417iXI8XaoH2Wuj9SBppkg9ELvGJinkVDj3v2jrXpuSGw7B2wAtQ7cB6UmQcGG7+eQv
 HRz19m3V8U/yHs6Qi+yKWT3H+6NsWhuVICJsKLXE2uFTwsnGudjbc/MG1jzAz6bTWJu7EiJdxTDCv
 +SWqeCWBjwt8XyMROjISwLbtaM1Jv6p5RnrqDLKffKJXadg7yemYU1UzLlxoK3mw1Lw6XFNy4erV4
 J7//8sqWMW616ChPaTiMFixLsnZsWoTR27/aTmctgwJxai7K5XBSV8kUDep9zGysdD21efDqvWJyp
 olaWOZdYd0Vc6PCdiGAoedv2xR7ZSVAbtyyJfDK9yJBJ2EDsB+mLQb04elpdDEnWsgtUF0tBUMw6E
 rvijjdcPCkRB9oLNfObx4UnRsPkTk0K3QLUZIdfCvjEFy2ZN85lYxhhK8heM3hN7pE+APDaDwtIO4
 eAHQB+TalqsjxEnD6XEJDmBHTtP1e6AS0zHo49Y1welkOcbzn9FwMcKFCrMu8qPoczHXtA982MRXH
 5Lie9Vcd1lG3rqkrxloCzFIY970+nMxVSMQ/x7MLdeAQJyznorrMSlgZn8BPE4EU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_003302_349661_440227E8 
X-CRM114-Status: GOOD (  20.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Update the mediatek,dpi binding to use the graph schema.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../display/mediatek/mediatek,cec.yaml        |  51 +++++++
 .../display/mediatek/mediatek,hdmi-ddc.yaml   |  57 ++++++++
 .../display/mediatek/mediatek,hdmi.txt        | 136 ------------------
 .../display/mediatek/mediatek,hdmi.yaml       | 132 +++++++++++++++++
 4 files changed, 240 insertions(+), 136 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
new file mode 100644
index 000000000000..b38d8732d7e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,cec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek HDMI CEC Controller Device Tree Bindings
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  The HDMI CEC controller handles hotplug detection and CEC communication.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt7623-cec
+      - mediatek,mt8173-cec
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    cec: cec@10013000 {
+        compatible = "mediatek,mt8173-cec";
+        reg = <0x10013000 0xbc>;
+        interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_LOW>;
+        clocks = <&infracfg CLK_INFRA_CEC>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
new file mode 100644
index 000000000000..c8ba94d6908b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,hdmi-ddc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek HDMI DDC Device Tree Bindings
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  The HDMI DDC i2c controller is used to interface with the HDMI DDC pins.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt7623-hdmi-ddc
+      - mediatek,mt8173-hdmi-ddc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: ddc-i2c
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    hdmi_ddc0: i2c@11012000 {
+        compatible = "mediatek,mt8173-hdmi-ddc";
+        reg = <0x11012000 0x1c>;
+        interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_LOW>;
+        clocks = <&pericfg CLK_PERI_I2C5>;
+        clock-names = "ddc-i2c";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
deleted file mode 100644
index b284ca51b913..000000000000
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
+++ /dev/null
@@ -1,136 +0,0 @@
-Mediatek HDMI Encoder
-=====================
-
-The Mediatek HDMI encoder can generate HDMI 1.4a or MHL 2.0 signals from
-its parallel input.
-
-Required properties:
-- compatible: Should be "mediatek,<chip>-hdmi".
-- the supported chips are mt2701, mt7623 and mt8173
-- reg: Physical base address and length of the controller's registers
-- interrupts: The interrupt signal from the function block.
-- clocks: device clocks
-  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
-- clock-names: must contain "pixel", "pll", "bclk", and "spdif".
-- phys: phandle link to the HDMI PHY node.
-  See Documentation/devicetree/bindings/phy/phy-bindings.txt for details.
-- phy-names: must contain "hdmi"
-- mediatek,syscon-hdmi: phandle link and register offset to the system
-  configuration registers. For mt8173 this must be offset 0x900 into the
-  MMSYS_CONFIG region: <&mmsys 0x900>.
-- ports: A node containing input and output port nodes with endpoint
-  definitions as documented in Documentation/devicetree/bindings/graph.txt.
-- port@0: The input port in the ports node should be connected to a DPI output
-  port.
-- port@1: The output port in the ports node should be connected to the input
-  port of a connector node that contains a ddc-i2c-bus property, or to the
-  input port of an attached bridge chip, such as a SlimPort transmitter.
-
-HDMI CEC
-========
-
-The HDMI CEC controller handles hotplug detection and CEC communication.
-
-Required properties:
-- compatible: Should be "mediatek,<chip>-cec"
-- the supported chips are mt7623 and mt8173
-- reg: Physical base address and length of the controller's registers
-- interrupts: The interrupt signal from the function block.
-- clocks: device clock
-
-HDMI DDC
-========
-
-The HDMI DDC i2c controller is used to interface with the HDMI DDC pins.
-The Mediatek's I2C controller is used to interface with I2C devices.
-
-Required properties:
-- compatible: Should be "mediatek,<chip>-hdmi-ddc"
-- the supported chips are mt7623 and mt8173
-- reg: Physical base address and length of the controller's registers
-- clocks: device clock
-- clock-names: Should be "ddc-i2c".
-
-HDMI PHY
-========
-See phy/mediatek,hdmi-phy.yaml
-
-Example:
-
-cec: cec@10013000 {
-	compatible = "mediatek,mt8173-cec";
-	reg = <0 0x10013000 0 0xbc>;
-	interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_LOW>;
-	clocks = <&infracfg CLK_INFRA_CEC>;
-};
-
-hdmi_phy: hdmi-phy@10209100 {
-	compatible = "mediatek,mt8173-hdmi-phy";
-	reg = <0 0x10209100 0 0x24>;
-	clocks = <&apmixedsys CLK_APMIXED_HDMI_REF>;
-	clock-names = "pll_ref";
-	clock-output-names = "hdmitx_dig_cts";
-	mediatek,ibias = <0xa>;
-	mediatek,ibias_up = <0x1c>;
-	#clock-cells = <0>;
-	#phy-cells = <0>;
-};
-
-hdmi_ddc0: i2c@11012000 {
-	compatible = "mediatek,mt8173-hdmi-ddc";
-	reg = <0 0x11012000 0 0x1c>;
-	interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_LOW>;
-	clocks = <&pericfg CLK_PERI_I2C5>;
-	clock-names = "ddc-i2c";
-};
-
-hdmi0: hdmi@14025000 {
-	compatible = "mediatek,mt8173-hdmi";
-	reg = <0 0x14025000 0 0x400>;
-	interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_LOW>;
-	clocks = <&mmsys CLK_MM_HDMI_PIXEL>,
-		 <&mmsys CLK_MM_HDMI_PLLCK>,
-		 <&mmsys CLK_MM_HDMI_AUDIO>,
-		 <&mmsys CLK_MM_HDMI_SPDIF>;
-	clock-names = "pixel", "pll", "bclk", "spdif";
-	pinctrl-names = "default";
-	pinctrl-0 = <&hdmi_pin>;
-	phys = <&hdmi_phy>;
-	phy-names = "hdmi";
-	mediatek,syscon-hdmi = <&mmsys 0x900>;
-	assigned-clocks = <&topckgen CLK_TOP_HDMI_SEL>;
-	assigned-clock-parents = <&hdmi_phy>;
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-
-			hdmi0_in: endpoint {
-				remote-endpoint = <&dpi0_out>;
-			};
-		};
-
-		port@1 {
-			reg = <1>;
-
-			hdmi0_out: endpoint {
-				remote-endpoint = <&hdmi_con_in>;
-			};
-		};
-	};
-};
-
-connector {
-	compatible = "hdmi-connector";
-	type = "a";
-	ddc-i2c-bus = <&hdmiddc0>;
-
-	port {
-		hdmi_con_in: endpoint {
-			remote-endpoint = <&hdmi0_out>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
new file mode 100644
index 000000000000..6a144faed682
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek HDMI Encoder Device Tree Bindings
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  The Mediatek HDMI encoder can generate HDMI 1.4a or MHL 2.0 signals from
+  its parallel input.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt2701-hdmi
+      - mediatek,mt7623-hdmi
+      - mediatek,mt8173-hdmi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Pixel Clock
+      - description: HDMI PLL
+      - description: Bit Clock
+      - description: S/PDIF Clock
+
+  clock-names:
+    items:
+      - const: pixel
+      - const: pll
+      - const: bclk
+      - const: spdif
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: hdmi
+
+  mediatek,syscon-hdmi:
+    $ref: '/schemas/types.yaml#/definitions/phandle-array'
+    maxItems: 1
+    description: |
+      phandle link and register offset to the system configuration registers.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: |
+          Input port node. This port should be connected to a DPI output port.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: |
+          Output port node. This port should be connected to the input port of a connector
+          node that contains a ddc-i2c-bus property, or to the  input port of an attached
+          bridge chip, such as a SlimPort transmitter.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - phys
+  - phy-names
+  - mediatek,syscon-hdmi
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    hdmi0: hdmi@14025000 {
+        compatible = "mediatek,mt8173-hdmi";
+        reg = <0x14025000 0x400>;
+        interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_LOW>;
+        clocks = <&mmsys CLK_MM_HDMI_PIXEL>,
+             <&mmsys CLK_MM_HDMI_PLLCK>,
+             <&mmsys CLK_MM_HDMI_AUDIO>,
+             <&mmsys CLK_MM_HDMI_SPDIF>;
+        clock-names = "pixel", "pll", "bclk", "spdif";
+        pinctrl-names = "default";
+        pinctrl-0 = <&hdmi_pin>;
+        phys = <&hdmi_phy>;
+        phy-names = "hdmi";
+        mediatek,syscon-hdmi = <&mmsys 0x900>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            hdmi0_in: endpoint {
+              remote-endpoint = <&dpi0_out>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+
+            hdmi0_out: endpoint {
+              remote-endpoint = <&hdmi_con_in>;
+            };
+          };
+        };
+    };
+
+...
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
