Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A24C2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 10:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRiVLfyw86NkzbonvH4WCz23BCZLJebDCKU+AP0xtKo=; b=OVeomcyX4DNlU956xmP2s+tQex
	+yKSa0OUQxjFZgKhe+BxSJvrikPniCSZcb6suaVIMBZdMLGWl4WEDibKB/lHfh4LOrv3+ERyiKPU0
	yloNdwTeuyvpWyPVJihc51/WC24JgTl9niqYVlFRM0y06rVaxz3IE08BB4ZHDVGlgPADdhN1Dh3fD
	cfeq+SiprHzXOkbVjKdP42X/Wad5YRq0rLrQPqcGYsomPewApkZF5iptmL1M8Ueyxv93m+jDBEQ0p
	T7zkbWOd9F166Fa2j1RcasJQcTmPMZuUQGIebRquHTd0202L1wp9lXkhFvlEu6FO9ttGDZ31/CwVk
	uxqBtpLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmSG-00000009xqR-0BAk;
	Thu, 27 Jun 2024 10:34:16 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmQt-00000009xGA-0B3Y
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jun 2024 10:33:08 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-366e70d0330so1614780f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jun 2024 03:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719484368; x=1720089168; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRiVLfyw86NkzbonvH4WCz23BCZLJebDCKU+AP0xtKo=;
        b=vdoSLvbsucxfxXo7rCOEkD+XhJEBtQ6c69n566p+RgPwPUxkAJ7GyLxHE7cQyFbi14
         qtrkLR3kHkfCcoDVj94uNSM2gT8vcqlZfUy9Ediy4sZLxZ3P9t6ETKaFGxBCfVjwWHQJ
         jP6Bv2B3QG86I0/OLB2XE8UoS3wa4bLTCTLBZst1WzPjFJhILva3LR237YXOXFSKZU0C
         /6Q6SZrNWfUqfVfbk/0u9JgrX6qX+7vfUb2HtI0Mvm842H+DT4kL5LF1cM6L93k3GTQv
         FzRsRyiJvboZQwTCuQdI9VwKEYmXXg/IaHe9AdB/csBP0A4PHwERYsyumK7cSxDbguWU
         +15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719484368; x=1720089168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRiVLfyw86NkzbonvH4WCz23BCZLJebDCKU+AP0xtKo=;
        b=cShFQelInt2LD9uR2eWMEtfgYDE98sa72TC0YqJ9N8zKwRdYEaduQjQmBm7JtzBBfT
         C5yNLA8OAqVzD9Qz1F4DoqBnQJbju5CAFS/pSP1xK6h+PSx+35dWdK9JK5ufx3DnHVti
         yzMmzHSEdIi0j3PDH6bsW5kmkgV84WC6iE0PkNDYVUZib/SkjN39+AWN8oWJJH6T06mj
         YPW2Xs4jz30Bg+aVpyvCdn4ii0ulFSKVUg87X7HzDP8HjHuLEuqUtpRAtX212lduvgz1
         BpcTMpJQLTn0DI5kzdT8Jx38V9J83OKU9JulbmfC7q/kTq7ZgKjLq76RH9Ey+KjhyppA
         0jig==
X-Forwarded-Encrypted: i=1; AJvYcCWw6cr9v52vm9QyxrHMur3AZbf+AjWpw5jRdo2qbr7eVM6TLsR+fiq/Zz4vawIiWEdnvcz2dqrPK/G2e60Pfnh0x2mSslyxi7KXy8KiJnBWSok9
X-Gm-Message-State: AOJu0YyXYHucUWi9JX3sNAV7FQ240RIAiucYRAqTGHanq1ccPqjDlOJg
	jadcwG8HQpVRvrpP14WSS1eLDyxOnEpxsWhbZdJelV8k14UIA5dCHpmv+4JsZj4=
X-Google-Smtp-Source: AGHT+IG2lFcWwoWZMveLDhCCCWvJfSVenWOD1F5xlyqkeUd/2YVIsdCwJKvozlxdGDb3OkE3iKTyeA==
X-Received: by 2002:a05:6000:1009:b0:35f:1d40:82fa with SMTP id ffacd0b85a97d-366e949758bmr7805494f8f.18.1719484368232;
        Thu, 27 Jun 2024 03:32:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367435852afsm1384352f8f.53.2024.06.27.03.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 03:32:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 27 Jun 2024 12:32:22 +0200
Subject: [PATCH v4 6/7] dt-bindings: mfd: syscon: Split and enforce
 documenting MFD children
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dt-bindings-mfd-syscon-split-v4-6-dc6699a9f3e4@linaro.org>
References: <20240627-dt-bindings-mfd-syscon-split-v4-0-dc6699a9f3e4@linaro.org>
In-Reply-To: <20240627-dt-bindings-mfd-syscon-split-v4-0-dc6699a9f3e4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15073;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=UL3bMBSC7fZLJ+OmlKYjrtZduFHkkJzaAM5VOgAMneA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfT+/FfK+ytBzfzBqwCGPx5LWK7VWiiwBXiFOY
 bYk0VRsfc+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn0/vwAKCRDBN2bmhouD
 18izD/wPHmcjKYkC5WuGoV3U3DqYOD8fDYSSrpAE/KKY+K6QthTefENsL87Ma8kpBed3PA28iQm
 3YbtmrasN3JGChG0fj1cPOh3CkPlgmldOHQ+FZB18EwuZ/BPv+zR8P4rfj3ifjEQJwAwXtCbZJA
 IAC5rkpv7FXSFq8r8adFYbyaoYI8q4m8iAzx/w1jTs2O2bDZG99mG7Wp0oxKLfqRGt9l5Fzj6Bl
 bnoT327RTGQko7pmlSZdEU1p9ooPJTqpmtcfGY8AGHI2FSsCEwBZ9emDP4gwy93BOEQ+lzn+7Er
 n0vieoDkY/8NmgxgyGdaU+VIyh3H4uv456PgiPXecyrjetTjERJXF/zRKquFy1/t8N/E29Xm7xX
 SZRZ+p87je3DeKTRLSjaQBybYhNV0HMpQRc4D5QFYK1+LqK3Lb02IQKDBfNkOnBxwweMC6/M77l
 vYM8lrWcV+TD0q0071LrMDkaYS82xt7G2VcpO4sf9nUi5OaJ9wBnodwrC3RZ27iudfQuVgf3AH+
 GgZO3StsJYKvWAsly9skj2PP6hEzoAEh3GKgqwVybfdUUldujpxIEx4L7wo0dDdzthTuweXEpPY
 GOwmuC+phzU1Kro/Ek7Icm0+OIAFas4BuFeB8jMfWdTJpij88/qfbQ5CL7u5XijZjK5s+wqXTtn
 /EtOaFeS8AoCvVw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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
 Documentation/devicetree/bindings/mfd/syscon.yaml  | 297 +++++++++++++--------
 2 files changed, 252 insertions(+), 116 deletions(-)

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
index 0f6fd1a41dd8..aa1c2608d326 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/mfd/syscon.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: System Controller Registers R/W
+title: System Controller Devices
 
 description: |
   System controller node represents a register region containing a set
@@ -19,124 +19,198 @@ description: |
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
+          - ti,am62-opp-efuse-table
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
-              - ti,am62-opp-efuse-table
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
+          - ti,am62-opp-efuse-table
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
 
@@ -145,18 +219,9 @@ required:
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


