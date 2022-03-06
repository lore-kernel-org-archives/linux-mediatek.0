Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF98C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Mar 2022 11:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RjvVwI9pq7l1GWfPrnEj9uGO3GP1zrbvBQXfzXtqGY0=; b=mEy0rpT9kPWMkJ
	FWHUdCI7iOy5b6VWvc13Luh+TI1oiLUlAs9xOIHFKSoUWHEhgkRV3wv5Wlv4/OFFSCBjeyAuoMHii
	Rdm0LJct9jnm1N16yZqDAX0M5sbWhU48QDjVF+lU7ek1/7+CtCsyx1dlpjb8+zDQ2P17nNsUYekAw
	7GqiUom1ZeuxHL8WVtHrW1Hv0uxH1KUCN9MEvz0I0tApSmSxwtIps44wxc8B4jydJG+CGi2Q/BpVi
	8dQXw5+25GRsqWLjHNgJuvcv1vOQqFoJPYoKv9/4/FdG3RXW4PQ/W+FHstbq19fy0MP1+iGq6MfME
	4jQ/KYjUSY432ehi5aZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQooW-00EVQK-NA; Sun, 06 Mar 2022 11:12:36 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQond-00EUsF-Vj
 for linux-mediatek@lists.infradead.org; Sun, 06 Mar 2022 11:11:44 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 107F23F61B
 for <linux-mediatek@lists.infradead.org>; Sun,  6 Mar 2022 11:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646565100;
 bh=FGttSVm3AOiDX4kvxPqXkJk5PmKF+Pk7rwRRH1kKwyI=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=WPq391AeD5F6GR6go84GyJQJ9UqF6qq5jfneMO/ESWCZWz9wjMEKr3+Wbf86gZs5K
 fOKun8/n02+d7UfgEGcFiq1VUOlKQ5f3ixl0/nOkS4AXLlHfpL0mYL6f8k7NtRv8B0
 N29PPHl55z+hV+8SdhuT1qeuT4W8EfAxu9iZXf2IwoR+pQMqrmUYYc4st58k7K9jdw
 6IiNjwmMjMd5FiTZLt+aIh27rCEjNi6fphBlW6v5A+tfmBajQSJrg8octc8TekPsKv
 5DLLGLl9FYGcSxss+8ZkXVHMI+oratPDmjKWk6cDPfU0dt4LtPQTqQLAibY9MDFdTt
 FCukip47tYKDg==
Received: by mail-ed1-f69.google.com with SMTP id
 bd4-20020a056402206400b004162b6d8618so1010784edb.19
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Mar 2022 03:11:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FGttSVm3AOiDX4kvxPqXkJk5PmKF+Pk7rwRRH1kKwyI=;
 b=jMYqMAj9n4SRPkubWR3u1SOJ41mfk1PyULPSWqYpCQJ6Ej8gLUMVwj5OijWOezSkLx
 w70NgkP0jcDoAvWAqplzr/bYn9tI172n19/KDgVZvjumq8LDoVSa52anI9M+qukyT/ei
 aWBARLdW6AhG0jQ9IitW3smYxBVqzfIOgw81jTUHdNZbJcTvRZLsa/4xIPdZrh6wfr3a
 nTLDwpbM+v5l2hD/3JjWfo3fi6fZ6jJUsw9jniF57i/gol6h1CIj/SNG8GhPY2iTswSN
 4gIeVJzokqI9hAUzktP1XlCUlOnsiWeW3LpZ75rjZwan4GA3rwyhzsQB6cM1CG4WPJfJ
 w41g==
X-Gm-Message-State: AOAM531vnf9CQ31+nN/rHUaUwnCjOpU76FNdW7Irx9ggarYWm0c1Ha7l
 Wcsjua4YqN8WyUqHPqB+67vZVRyE7SeF5xi1qS0/Tiki+RhXzQmtF4UEemiuo592VHZa2j8282V
 PAi58VtJ2KWRjEoJNTf50OVPlRH5EeYbZ/ryvDwMgqiOq47GHFg==
X-Received: by 2002:aa7:dd17:0:b0:416:320:5e56 with SMTP id
 i23-20020aa7dd17000000b0041603205e56mr6462864edv.240.1646565098298; 
 Sun, 06 Mar 2022 03:11:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8p2KbgFhI1I2Ikw/4n8J4HQA2bo1ehmJYMMx/l163HUehzMkDRF66IoBY/QncxL072lItNA==
X-Received: by 2002:aa7:dd17:0:b0:416:320:5e56 with SMTP id
 i23-20020aa7dd17000000b0041603205e56mr6462839edv.240.1646565098003; 
 Sun, 06 Mar 2022 03:11:38 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 a9-20020a1709066d4900b006da888c3ef0sm3720444ejt.108.2022.03.06.03.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 03:11:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Wei Xu <xuwei5@hisilicon.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>
Subject: [PATCH v3 05/12] dt-bindings: ufs: qcom,ufs: convert to dtschema
Date: Sun,  6 Mar 2022 12:11:18 +0100
Message-Id: <20220306111125.116455-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_031142_335088_FF2FFF84 
X-CRM114-Status: GOOD (  23.72  )
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

Convert the Qualcomm Universal Flash Storage (UFS) Controller to DT
schema format.

Except the conversion, add also properties already present in DTS:
iommus, interconnects and power-domains.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/ufs/qcom,ufs.yaml     | 242 ++++++++++++++++++
 .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |  90 -------
 2 files changed, 242 insertions(+), 90 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
 delete mode 100644 Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
new file mode 100644
index 000000000000..5b3a2157f7e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -0,0 +1,242 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Universal Flash Storage (UFS) Controller
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+  - Andy Gross <agross@kernel.org>
+
+# Select only our matches, not all jedec,ufs-2.0
+select:
+  properties:
+    compatible:
+      contains:
+        const: qcom,ufshc
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,msm8994-ufshc
+          - qcom,msm8996-ufshc
+          - qcom,msm8998-ufshc
+          - qcom,sdm845-ufshc
+          - qcom,sm8150-ufshc
+          - qcom,sm8250-ufshc
+          - qcom,sm8350-ufshc
+          - qcom,sm8450-ufshc
+      - const: qcom,ufshc
+      - const: jedec,ufs-2.0
+
+  clocks:
+    minItems: 8
+    maxItems: 11
+
+  clock-names:
+    minItems: 8
+    maxItems: 11
+
+  interconnects:
+    minItems: 2
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: ufs-ddr
+      - const: cpu-ufs
+
+  iommus:
+    minItems: 1
+    maxItems: 2
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: ufsphy
+
+  power-domains:
+    maxItems: 1
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  resets:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 1
+
+  reset-names:
+    items:
+      - const: rst
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the RESET pin of the UFS memory device.
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: ufs-common.yaml
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8998-ufshc
+              - qcom,sm8250-ufshc
+              - qcom,sm8350-ufshc
+              - qcom,sm8450-ufshc
+    then:
+      properties:
+        clocks:
+          minItems: 8
+          maxItems: 8
+        clock-names:
+          items:
+            - const: core_clk
+            - const: bus_aggr_clk
+            - const: iface_clk
+            - const: core_clk_unipro
+            - const: ref_clk
+            - const: tx_lane0_sync_clk
+            - const: rx_lane0_sync_clk
+            - const: rx_lane1_sync_clk
+        reg:
+          minItems: 1
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sdm845-ufshc
+              - qcom,sm8150-ufshc
+    then:
+      properties:
+        clocks:
+          minItems: 9
+          maxItems: 9
+        clock-names:
+          items:
+            - const: core_clk
+            - const: bus_aggr_clk
+            - const: iface_clk
+            - const: core_clk_unipro
+            - const: ref_clk
+            - const: tx_lane0_sync_clk
+            - const: rx_lane0_sync_clk
+            - const: rx_lane1_sync_clk
+            - const: ice_core_clk
+        reg:
+          minItems: 2
+          maxItems: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8996-ufshc
+    then:
+      properties:
+        clocks:
+          minItems: 11
+          maxItems: 11
+        clock-names:
+          items:
+            - const: core_clk_src
+            - const: core_clk
+            - const: bus_clk
+            - const: bus_aggr_clk
+            - const: iface_clk
+            - const: core_clk_unipro_src
+            - const: core_clk_unipro
+            - const: core_clk_ice
+            - const: ref_clk
+            - const: tx_lane0_sync_clk
+            - const: rx_lane0_sync_clk
+        reg:
+          minItems: 1
+          maxItems: 1
+
+    # TODO: define clock bindings for qcom,msm8994-ufshc
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sm8450.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interconnect/qcom,sm8450.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ufs@1d84000 {
+            compatible = "qcom,sm8450-ufshc", "qcom,ufshc",
+                         "jedec,ufs-2.0";
+            reg = <0 0x01d84000 0 0x3000>;
+            interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+            phys = <&ufs_mem_phy_lanes>;
+            phy-names = "ufsphy";
+            lanes-per-direction = <2>;
+            #reset-cells = <1>;
+            resets = <&gcc GCC_UFS_PHY_BCR>;
+            reset-names = "rst";
+            reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+            vcc-supply = <&vreg_l7b_2p5>;
+            vcc-max-microamp = <1100000>;
+            vccq-supply = <&vreg_l9b_1p2>;
+            vccq-max-microamp = <1200000>;
+
+            power-domains = <&gcc UFS_PHY_GDSC>;
+            iommus = <&apps_smmu 0xe0 0x0>;
+            interconnects = <&aggre1_noc MASTER_UFS_MEM &mc_virt SLAVE_EBI1>,
+                            <&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_UFS_MEM_CFG>;
+            interconnect-names = "ufs-ddr", "cpu-ufs";
+
+            clock-names = "core_clk",
+                          "bus_aggr_clk",
+                          "iface_clk",
+                          "core_clk_unipro",
+                          "ref_clk",
+                          "tx_lane0_sync_clk",
+                          "rx_lane0_sync_clk",
+                          "rx_lane1_sync_clk";
+            clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
+                     <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+                     <&gcc GCC_UFS_PHY_AHB_CLK>,
+                     <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+                     <&rpmhcc RPMH_CXO_CLK>,
+                     <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+                     <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+                     <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+            freq-table-hz = <75000000 300000000>,
+                            <0 0>,
+                            <0 0>,
+                            <75000000 300000000>,
+                            <75000000 300000000>,
+                            <0 0>,
+                            <0 0>,
+                            <0 0>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
deleted file mode 100644
index d0fee78e6203..000000000000
--- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
+++ /dev/null
@@ -1,90 +0,0 @@
-* Universal Flash Storage (UFS) Host Controller
-
-UFSHC nodes are defined to describe on-chip UFS host controllers.
-Each UFS controller instance should have its own node.
-
-Required properties:
-- compatible		: must contain "jedec,ufs-1.1" or "jedec,ufs-2.0"
-
-			  For Qualcomm SoCs must contain, as below, an
-			  SoC-specific compatible along with "qcom,ufshc" and
-			  the appropriate jedec string:
-			    "qcom,msm8994-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
-			    "qcom,msm8996-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
-			    "qcom,msm8998-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
-			    "qcom,sdm845-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
-			    "qcom,sm8150-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
-			    "qcom,sm8250-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
-			    "qcom,sm8350-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
-			    "qcom,sm8450-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
-- interrupts        : <interrupt mapping for UFS host controller IRQ>
-- reg               : <registers mapping>
-
-Optional properties:
-- phys                  : phandle to UFS PHY node
-- phy-names             : the string "ufsphy" when is found in a node, along
-                          with "phys" attribute, provides phandle to UFS PHY node
-- vdd-hba-supply        : phandle to UFS host controller supply regulator node
-- vcc-supply            : phandle to VCC supply regulator node
-- vccq-supply           : phandle to VCCQ supply regulator node
-- vccq2-supply          : phandle to VCCQ2 supply regulator node
-- vcc-supply-1p8        : For embedded UFS devices, valid VCC range is 1.7-1.95V
-                          or 2.7-3.6V. This boolean property when set, specifies
-			  to use low voltage range of 1.7-1.95V. Note for external
-			  UFS cards this property is invalid and valid VCC range is
-			  always 2.7-3.6V.
-- vcc-max-microamp      : specifies max. load that can be drawn from vcc supply
-- vccq-max-microamp     : specifies max. load that can be drawn from vccq supply
-- vccq2-max-microamp    : specifies max. load that can be drawn from vccq2 supply
-
-- clocks                : List of phandle and clock specifier pairs
-- clock-names           : List of clock input name strings sorted in the same
-                          order as the clocks property.
-			  "ref_clk" indicates reference clock frequency.
-			  UFS host supplies reference clock to UFS device and UFS device
-			  specification allows host to provide one of the 4 frequencies (19.2 MHz,
-			  26 MHz, 38.4 MHz, 52MHz) for reference clock. This "ref_clk" entry is
-			  parsed and used to update the reference clock setting in device.
-			  Defaults to 26 MHz(as per specification) if not specified by host.
-- freq-table-hz		: Array of <min max> operating frequencies stored in the same
-                          order as the clocks property. If this property is not
-			  defined or a value in the array is "0" then it is assumed
-			  that the frequency is set by the parent clock or a
-			  fixed rate clock source.
--lanes-per-direction	: number of lanes available per direction - either 1 or 2.
-			  Note that it is assume same number of lanes is used both
-			  directions at once. If not specified, default is 2 lanes per direction.
-- #reset-cells		: Must be <1> for Qualcomm UFS controllers that expose
-			  PHY reset from the UFS controller.
-- resets            : reset node register
-- reset-names       : describe reset node register, the "rst" corresponds to reset the whole UFS IP.
-- reset-gpios       : A phandle and gpio specifier denoting the GPIO connected
-		      to the RESET pin of the UFS memory device.
-
-Note: If above properties are not defined it can be assumed that the supply
-regulators or clocks are always on.
-
-Example:
-	ufshc@fc598000 {
-		compatible = "jedec,ufs-1.1";
-		reg = <0xfc598000 0x800>;
-		interrupts = <0 28 0>;
-
-		vdd-hba-supply = <&xxx_reg0>;
-		vcc-supply = <&xxx_reg1>;
-		vcc-supply-1p8;
-		vccq-supply = <&xxx_reg2>;
-		vccq2-supply = <&xxx_reg3>;
-		vcc-max-microamp = 500000;
-		vccq-max-microamp = 200000;
-		vccq2-max-microamp = 200000;
-
-		clocks = <&core 0>, <&ref 0>, <&phy 0>, <&iface 0>;
-		clock-names = "core_clk", "ref_clk", "phy_clk", "iface_clk";
-		freq-table-hz = <100000000 200000000>, <0 0>, <0 0>, <0 0>;
-		resets = <&reset 0 1>;
-		reset-names = "rst";
-		phys = <&ufsphy1>;
-		phy-names = "ufsphy";
-		#reset-cells = <1>;
-	};
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
