Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C14BC30653
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 10:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8fRfkbK+gMpfQR+Bu9h7ebMrI6SjQ3OhlJvckbAVgQ=; b=B3rlcwrGSZKQ+bH8LGcqflhkCO
	3H5mH+prw5FOO6NPy/L7RNZN9dG7p/506AEKShHLTcgQ+aO3AjkpwlPlpJhL7grd/YTAlXa6Aojjs
	+ssNyDLFF9JjMUFJw7IIwdMtTJjqtyu4da3hqDY2Wm4P4NCn2AoDLzkHmkCGLpQzqMjOD3UIVv2HB
	YwTCFoa5nG6RezkT2iJYwuuF4EBIVVndPQ0RE46rTvJhgXbuaxkWs52YSgxb2tBxw2J4AX5o500x/
	NEEHgaY5mh+zSPtSfRXDEpE6ekmDPWsPXDRCpwcsUsMD5L+VnhnUKFVmrQ3aViOpqDYPUBHDJ1Itz
	rwyVP39w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPc1-00000006Fmg-1sBv;
	Wed, 26 Jun 2024 10:10:49 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPbP-00000006FQA-4B5E
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jun 2024 10:10:21 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7eee734a668so290817239f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jun 2024 03:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719396611; x=1720001411; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8fRfkbK+gMpfQR+Bu9h7ebMrI6SjQ3OhlJvckbAVgQ=;
        b=UJOB1V6vqDDRpMzPIF6WPgQyc6Mf6XH6B4zYtxDJ1L1gUTQrGGYOcxBYX2YrfJzqJH
         E4Yki7VCRJrmnygv7FNFjHkW63bpixzvk3wyofKQAiDajgjbxlOAFZ3UHQIZKjhfMeUu
         b2rbCsm12dPxjE5hY2UXf14IoWJoQLXOBaOvCd5ybNxeajgNsDsfXLL9bUBaOEMR5APt
         0i7OdvL1psybNWOO+s3hN9oP9pQnVBK+DSw8qk99BW+/yLM8UFo/GLz6+PGt6BPQLqcA
         pgoWYc8s+cQM23Gqw/KWr12mux/VkMWYW0AQSyNiqgKDx1yLgH6S5XSbcbeMv2vAI3/v
         xBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396611; x=1720001411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8fRfkbK+gMpfQR+Bu9h7ebMrI6SjQ3OhlJvckbAVgQ=;
        b=qryCJA0TmetV0PZjptPbPUY6tWkkUexy78O+9awhO1FI7RG6NegZdS0bgVRl96edRF
         AE1Xl5BV6BVmhq2hzPT1dZ//Nt7rlM0MT3opzQy8kwnNfenYhJRBwQwd1Nx89Kl5FRPt
         yyOQ+DikHUCqVjQxRVMGKVnpG7+/WtpyszvUWfHQDdwFn72WW3Hph//g8Wz9jN/D1W+o
         xMAngoe0dh1/yJ9I21femW7eus/Ck9umhEG5J1yubLrndsL1I81pGu6RNnoO/PKTk0Uo
         Vd27OyFGLXW45CPklHOfMV3iJqd5VKkhuYEbpQizMHbJxbKiN+oiouqXQqvZLmqfiXXg
         4PWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDg/XWzsiuctcUtauNtKkQ38rK7vM615dlDNYDx29SaB5au7o3R+p6c9MDz6gRAI2zC+tL8EyQkgDieE4maCVhnHesPmRWY9v7T11yL85SV+HZ
X-Gm-Message-State: AOJu0Yyre+GjMx9C+p5D9MyDL+urTvnXZFt8N6nSa51p4zbrpPOEBPIX
	h7q/q28vIhrkRyMuIwRjve1uyP6BknV7x09w7UfZTwilbl6uRgJVaWRPFRnxaU0=
X-Google-Smtp-Source: AGHT+IHuvXo+RYs2Xkk+e4fqJBTU+2MN2962INVHaqRSAJWFi1uPZ2ur9QMwockXSIg8RhIqwjV9pQ==
X-Received: by 2002:a05:6602:6c15:b0:7eb:7e53:6e0d with SMTP id ca18e2360f4ac-7f3a1539ddamr1327118139f.13.1719396610999;
        Wed, 26 Jun 2024 03:10:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b9d121859csm3079108173.137.2024.06.26.03.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 03:10:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 26 Jun 2024 12:09:15 +0200
Subject: [PATCH v3 6/7] dt-bindings: mfd: syscon: Split and enforce
 documenting MFD children
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-dt-bindings-mfd-syscon-split-v3-6-3409903bb99b@linaro.org>
References: <20240626-dt-bindings-mfd-syscon-split-v3-0-3409903bb99b@linaro.org>
In-Reply-To: <20240626-dt-bindings-mfd-syscon-split-v3-0-3409903bb99b@linaro.org>
To: Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Khuong Dinh <khuong@os.amperecomputing.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuanhua Lei <lchuanhua@maxlinear.com>, 
 Rahul Tanwar <rtanwar@maxlinear.com>, 
 Lars Povlsen <lars.povlsen@microchip.com>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Nishanth Menon <nm@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14955;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rUuPQu2Jc4gyPXlsdebUXq4yKnnfYD1uvMadLkZtLXI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBme+jSKePh2BhiqcF5OxhqkoaVNNH0GJp7OBDtH
 C3eUOx+QumJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnvo0gAKCRDBN2bmhouD
 16HBD/90aByLqkgJpkR2snpTGozsVta+46U717JamQdf98sbNHcrN5WcccNh4jEIzF4+mbcCXr6
 XJtXrBh6+Nix4UBfj4CLaJog/VNZTYQVUby//xwIdf0nmR0ewGN3JLiHMPzOPF/L7jHOZC4UmTq
 aREMnCXlhA6l1tYzHCrad9ayRV0mq4P2spF+i7OQ46kB9tFaZcRZ70zZfZik89gWOWpJqE5KJSb
 fKwfI62v19liO7lrEl9kdPr5xTEYlJuNJ1USN5Lhs/E0GmIcPkUVezo/2pm9QgJ2j8jwLHtrYb+
 qfpwr1iff73D2zWPU9Y58flN8YUqA808IfdWLdZJYt9tYzr9vAEKEgKGrFng7JMllQ+ZLD44Flr
 ++QZrRhiN5bGDdkomBRa7gO6ZfZcbkHwU+yEt8edVOQ4gcWfrTGfISaEUVQTQY1e3D3/iI7v3FU
 dpZ4Eov1X/xKhyXH7KaqWxiYlNryU5MTc0BzO/FRJNa+wdioCIyK0eJR1uynl/WuG/Jz/CvFOPK
 ESU39MTpVmauh6JIQz0elAeTW19EkM+reGZGETY4y0heRrhVpTdrodAy9BHWSbQI4NpQX5JN9Rk
 c36KIBOW9foN4dpxvm2CTQSe3Nar/BNF9dwTQHUere7bSeA6d9iHZ8qdna9420I511HU1y16vRi
 Bw9rM6p9tpI9YIg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_031019_183580_4465212F 
X-CRM114-Status: GOOD (  16.42  )
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

Simple syscon nodes can be documented in common syscon.yaml, however
devices with simple-mfd compatible, thus with some children, should have
their own schema listing these children.  Such listing makes the binding
specific, allows better validation (so the incorrect child would not
appear in the simple-mfd node) and actually enforces repeated rule for
simple-mfd devices:

  "simple-mfd" is only for simple devices, where the children do not
  depend on the parent.

Currently the syscon+simple-mfd binding is quite broad and allows
any child or property, thus above rule cannot be enforced.

Split the syscon.yaml binding into:
1. Common syscon properties, used potentially by many bindings.
2. Simple syscon devices (NO simple-mfd!).

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Cc: Maxime Ripard <maxime@cerno.tech>

Depends on:
1. Patch in MFD: https://lore.kernel.org/all/171828959006.2643902.8308227314531523435.b4-ty@kernel.org/
2. Previous patches in the series.
---
 .../devicetree/bindings/mfd/syscon-common.yaml     |  71 +++++
 Documentation/devicetree/bindings/mfd/syscon.yaml  | 294 +++++++++++++--------
 2 files changed, 250 insertions(+), 115 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon-common.yaml b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
new file mode 100644
index 000000000000..451cbad467a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: System Controller Registers R/W Common Properties
+
+description:
+  System controller node represents a register region containing a set
+  of miscellaneous registers. The registers are not cohesive enough to
+  represent as any specific type of device. The typical use-case is
+  for some other node's driver, or platform-specific code, to acquire
+  a reference to the syscon node (e.g. by phandle, node path, or
+  search using a specific compatible value), interrogate the node (or
+  associated OS driver) to determine the location of the registers,
+  and access the registers directly.
+
+maintainers:
+  - Lee Jones <lee@kernel.org>
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: syscon
+
+  required:
+    - compatible
+
+properties:
+  compatible:
+    contains:
+      const: syscon
+    minItems: 2
+    maxItems: 5  # Should be enough
+
+  reg:
+    maxItems: 1
+
+  reg-io-width:
+    description:
+      The size (in bytes) of the IO accesses that should be performed
+      on the device.
+    enum: [1, 2, 4, 8]
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: simple-mfd
+    then:
+      properties:
+        compatible:
+          minItems: 3
+          maxItems: 5
+
+additionalProperties: true
+
+examples:
+  - |
+    syscon: syscon@1c00000 {
+        compatible = "allwinner,sun8i-h3-system-controller", "syscon";
+        reg = <0x01c00000 0x1000>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index d6fa58c9e4de..d4e9533cf3fe 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/mfd/syscon.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: System Controller Registers R/W
+title: System Controller Devices
 
 description: |
   System controller node represents a register region containing a set
@@ -19,123 +19,196 @@ description: |
 maintainers:
   - Lee Jones <lee@kernel.org>
 
+# Need a select with all compatibles listed for compatibility with older
+# dtschema (<2024.02), so this will not be selected for other schemas having
+# syscon fallback.
 select:
   properties:
     compatible:
       contains:
         enum:
-          - syscon
-
+          - al,alpine-sysfabric-servic
+          - allwinner,sun8i-a83t-system-controller
+          - allwinner,sun8i-h3-system-controller
+          - allwinner,sun8i-v3s-system-controller
+          - allwinner,sun50i-a64-system-controller
+          - altr,l3regs
+          - altr,sdr-ctl
+          - amd,pensando-elba-syscon
+          - amlogic,meson-mx-assist
+          - amlogic,meson-mx-bootrom
+          - amlogic,meson8-analog-top
+          - amlogic,meson8b-analog-top
+          - amlogic,meson8-pmu
+          - amlogic,meson8b-pmu
+          - apm,xgene-csw
+          - apm,xgene-efuse
+          - apm,xgene-mcb
+          - apm,xgene-rb
+          - apm,xgene-scu
+          - atmel,sama5d2-sfrbu
+          - atmel,sama5d3-nfc-io
+          - atmel,sama5d3-sfrbu
+          - atmel,sama5d4-sfrbu
+          - axis,artpec6-syscon
+          - brcm,cru-clkset
+          - brcm,sr-cdru
+          - brcm,sr-mhb
+          - cirrus,ep7209-syscon1
+          - cirrus,ep7209-syscon2
+          - cirrus,ep7209-syscon3
+          - cnxt,cx92755-uc
+          - freecom,fsg-cs2-system-controller
+          - fsl,imx93-aonmix-ns-syscfg
+          - fsl,imx93-wakeupmix-syscfg
+          - fsl,ls1088a-reset
+          - fsl,vf610-anatop
+          - fsl,vf610-mscm-cpucfg
+          - hisilicon,dsa-subctrl
+          - hisilicon,hi6220-sramctrl
+          - hisilicon,hip04-ppe
+          - hisilicon,pcie-sas-subctrl
+          - hisilicon,peri-subctrl
+          - hpe,gxp-sysreg
+          - loongson,ls1b-syscon
+          - loongson,ls1c-syscon
+          - lsi,axxia-syscon
+          - marvell,armada-3700-cpu-misc
+          - marvell,armada-3700-nb-pm
+          - marvell,armada-3700-avs
+          - marvell,armada-3700-usb2-host-misc
+          - marvell,dove-global-config
+          - mediatek,mt2701-pctl-a-syscfg
+          - mediatek,mt2712-pctl-a-syscfg
+          - mediatek,mt6397-pctl-pmic-syscfg
+          - mediatek,mt8135-pctl-a-syscfg
+          - mediatek,mt8135-pctl-b-syscfg
+          - mediatek,mt8173-pctl-a-syscfg
+          - mediatek,mt8365-syscfg
+          - microchip,lan966x-cpu-syscon
+          - microchip,sam9x60-sfr
+          - microchip,sama7g5-ddr3phy
+          - mscc,ocelot-cpu-syscon
+          - mstar,msc313-pmsleep
+          - nuvoton,ma35d1-sys
+          - nuvoton,wpcm450-shm
+          - rockchip,px30-qos
+          - rockchip,rk3036-qos
+          - rockchip,rk3066-qos
+          - rockchip,rk3128-qos
+          - rockchip,rk3228-qos
+          - rockchip,rk3288-qos
+          - rockchip,rk3368-qos
+          - rockchip,rk3399-qos
+          - rockchip,rk3568-qos
+          - rockchip,rk3588-qos
+          - rockchip,rv1126-qos
+          - st,spear1340-misc
+          - stericsson,nomadik-pmu
+          - starfive,jh7100-sysmain
+          - ti,am62-usb-phy-ctrl
+          - ti,am625-dss-oldi-io-ctrl
+          - ti,am62p-cpsw-mac-efuse
+          - ti,am654-dss-oldi-io-ctrl
+          - ti,j784s4-pcie-ctrl
+          - ti,keystone-pllctrl
   required:
     - compatible
 
 properties:
   compatible:
-    anyOf:
-      - items:
-          - enum:
-              - al,alpine-sysfabric-service
-              - allwinner,sun8i-a83t-system-controller
-              - allwinner,sun8i-h3-system-controller
-              - allwinner,sun8i-v3s-system-controller
-              - allwinner,sun50i-a64-system-controller
-              - altr,l3regs
-              - altr,sdr-ctl
-              - amd,pensando-elba-syscon
-              - amlogic,meson-mx-assist
-              - amlogic,meson-mx-bootrom
-              - amlogic,meson8-analog-top
-              - amlogic,meson8b-analog-top
-              - amlogic,meson8-pmu
-              - amlogic,meson8b-pmu
-              - apm,xgene-csw
-              - apm,xgene-efuse
-              - apm,xgene-mcb
-              - apm,xgene-rb
-              - apm,xgene-scu
-              - atmel,sama5d2-sfrbu
-              - atmel,sama5d3-nfc-io
-              - atmel,sama5d3-sfrbu
-              - atmel,sama5d4-sfrbu
-              - axis,artpec6-syscon
-              - brcm,cru-clkset
-              - brcm,sr-cdru
-              - brcm,sr-mhb
-              - cirrus,ep7209-syscon1
-              - cirrus,ep7209-syscon2
-              - cirrus,ep7209-syscon3
-              - cnxt,cx92755-uc
-              - freecom,fsg-cs2-system-controller
-              - fsl,imx93-aonmix-ns-syscfg
-              - fsl,imx93-wakeupmix-syscfg
-              - fsl,ls1088a-reset
-              - fsl,vf610-anatop
-              - fsl,vf610-mscm-cpucfg
-              - hisilicon,dsa-subctrl
-              - hisilicon,hi6220-sramctrl
-              - hisilicon,hip04-ppe
-              - hisilicon,pcie-sas-subctrl
-              - hisilicon,peri-subctrl
-              - hpe,gxp-sysreg
-              - loongson,ls1b-syscon
-              - loongson,ls1c-syscon
-              - lsi,axxia-syscon
-              - marvell,armada-3700-cpu-misc
-              - marvell,armada-3700-nb-pm
-              - marvell,armada-3700-avs
-              - marvell,armada-3700-usb2-host-misc
-              - marvell,dove-global-config
-              - mediatek,mt2701-pctl-a-syscfg
-              - mediatek,mt2712-pctl-a-syscfg
-              - mediatek,mt6397-pctl-pmic-syscfg
-              - mediatek,mt8135-pctl-a-syscfg
-              - mediatek,mt8135-pctl-b-syscfg
-              - mediatek,mt8173-pctl-a-syscfg
-              - mediatek,mt8365-syscfg
-              - microchip,lan966x-cpu-syscon
-              - microchip,sam9x60-sfr
-              - microchip,sama7g5-ddr3phy
-              - mscc,ocelot-cpu-syscon
-              - mstar,msc313-pmsleep
-              - nuvoton,ma35d1-sys
-              - nuvoton,wpcm450-shm
-              - rockchip,px30-qos
-              - rockchip,rk3036-qos
-              - rockchip,rk3066-qos
-              - rockchip,rk3128-qos
-              - rockchip,rk3228-qos
-              - rockchip,rk3288-qos
-              - rockchip,rk3368-qos
-              - rockchip,rk3399-qos
-              - rockchip,rk3568-qos
-              - rockchip,rk3588-qos
-              - rockchip,rv1126-qos
-              - st,spear1340-misc
-              - stericsson,nomadik-pmu
-              - starfive,jh7100-sysmain
-              - ti,am62-usb-phy-ctrl
-              - ti,am625-dss-oldi-io-ctrl
-              - ti,am62p-cpsw-mac-efuse
-              - ti,am654-dss-oldi-io-ctrl
-              - ti,j784s4-pcie-ctrl
-              - ti,keystone-pllctrl
-
-          - const: syscon
-
-      - contains:
-          const: syscon
-        minItems: 2
-        maxItems: 5  # Should be enough
+    items:
+      - enum:
+          - al,alpine-sysfabric-service
+          - allwinner,sun8i-a83t-system-controller
+          - allwinner,sun8i-h3-system-controller
+          - allwinner,sun8i-v3s-system-controller
+          - allwinner,sun50i-a64-system-controller
+          - altr,l3regs
+          - altr,sdr-ctl
+          - amd,pensando-elba-syscon
+          - amlogic,meson-mx-assist
+          - amlogic,meson-mx-bootrom
+          - amlogic,meson8-analog-top
+          - amlogic,meson8b-analog-top
+          - amlogic,meson8-pmu
+          - amlogic,meson8b-pmu
+          - apm,xgene-csw
+          - apm,xgene-efuse
+          - apm,xgene-mcb
+          - apm,xgene-rb
+          - apm,xgene-scu
+          - atmel,sama5d2-sfrbu
+          - atmel,sama5d3-nfc-io
+          - atmel,sama5d3-sfrbu
+          - atmel,sama5d4-sfrbu
+          - axis,artpec6-syscon
+          - brcm,cru-clkset
+          - brcm,sr-cdru
+          - brcm,sr-mhb
+          - cirrus,ep7209-syscon1
+          - cirrus,ep7209-syscon2
+          - cirrus,ep7209-syscon3
+          - cnxt,cx92755-uc
+          - freecom,fsg-cs2-system-controller
+          - fsl,imx93-aonmix-ns-syscfg
+          - fsl,imx93-wakeupmix-syscfg
+          - fsl,ls1088a-reset
+          - fsl,vf610-anatop
+          - fsl,vf610-mscm-cpucfg
+          - hisilicon,dsa-subctrl
+          - hisilicon,hi6220-sramctrl
+          - hisilicon,hip04-ppe
+          - hisilicon,pcie-sas-subctrl
+          - hisilicon,peri-subctrl
+          - hpe,gxp-sysreg
+          - loongson,ls1b-syscon
+          - loongson,ls1c-syscon
+          - lsi,axxia-syscon
+          - marvell,armada-3700-cpu-misc
+          - marvell,armada-3700-nb-pm
+          - marvell,armada-3700-avs
+          - marvell,armada-3700-usb2-host-misc
+          - marvell,dove-global-config
+          - mediatek,mt2701-pctl-a-syscfg
+          - mediatek,mt2712-pctl-a-syscfg
+          - mediatek,mt6397-pctl-pmic-syscfg
+          - mediatek,mt8135-pctl-a-syscfg
+          - mediatek,mt8135-pctl-b-syscfg
+          - mediatek,mt8173-pctl-a-syscfg
+          - mediatek,mt8365-syscfg
+          - microchip,lan966x-cpu-syscon
+          - microchip,sam9x60-sfr
+          - microchip,sama7g5-ddr3phy
+          - mscc,ocelot-cpu-syscon
+          - mstar,msc313-pmsleep
+          - nuvoton,ma35d1-sys
+          - nuvoton,wpcm450-shm
+          - rockchip,px30-qos
+          - rockchip,rk3036-qos
+          - rockchip,rk3066-qos
+          - rockchip,rk3128-qos
+          - rockchip,rk3228-qos
+          - rockchip,rk3288-qos
+          - rockchip,rk3368-qos
+          - rockchip,rk3399-qos
+          - rockchip,rk3568-qos
+          - rockchip,rk3588-qos
+          - rockchip,rv1126-qos
+          - st,spear1340-misc
+          - stericsson,nomadik-pmu
+          - starfive,jh7100-sysmain
+          - ti,am62-usb-phy-ctrl
+          - ti,am625-dss-oldi-io-ctrl
+          - ti,am62p-cpsw-mac-efuse
+          - ti,am654-dss-oldi-io-ctrl
+          - ti,j784s4-pcie-ctrl
+          - ti,keystone-pllctrl
+      - const: syscon
 
   reg:
     maxItems: 1
 
-  reg-io-width:
-    description: |
-      The size (in bytes) of the IO accesses that should be performed
-      on the device.
-    enum: [1, 2, 4, 8]
-
   resets:
     maxItems: 1
 
@@ -144,18 +217,9 @@ required:
   - reg
 
 allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: simple-mfd
-    then:
-      properties:
-        compatible:
-          minItems: 3
-          maxItems: 5
+  - $ref: syscon-common.yaml#
 
-additionalProperties: true
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


