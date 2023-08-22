Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E173CEE4993
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 08:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxGCtJ2Wep5efB+WkbsRfN8SMwC+vT6DRMJNr+uJtTM=; b=aDMjT3m3VSeroBnstZ0HUuzhR1
	0LiEnNFfqDvHO53oq4X9wizOsMV+bunYdBBnc3uT3CTupVsH1m84hgmgLAjeW1wAA5y+8MPHyJqRY
	wUl6Ojiyioe+aK2bNkVPBJI/+qfdePN6E8dW6vmV4V7qw4qsC0Fi1kAIkzQU7OwdpA08EEcd2YJzP
	Ijm893428cpoOfwD80Kv1IH1cCX003d5rWXqo3hJ+XErJK5BhUWDJkpiId8EfgU5cBA61bHqAX5Fw
	KVjfz4tGRVS391a0jUOG3w9xZEKyckklthio+bTgpuRHe7FQCHDEGidBmW21e11Q8O/DyDhScLaVU
	EoASU+CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYN1P-00FUHG-24;
	Tue, 22 Aug 2023 08:45:55 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYN18-00FU5d-1s
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Aug 2023 08:45:41 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-68a5457b930so1122191b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Aug 2023 01:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692693938; x=1693298738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxGCtJ2Wep5efB+WkbsRfN8SMwC+vT6DRMJNr+uJtTM=;
        b=cee35XBJgWrPIQZvclRYmKKPTK9TteoVtq9KR3/9hzVU2nQck7y1o5DKhwVRs7XFKK
         4NNAL4bucDmYnAC41qmpYUalcs3WZJxxorUDN3ByYWT2Z+itOdYmg9JElY4L3SgA0z+D
         Aw6ZodFVgTHZEDCF6UcY5gD1H1sWwuxiB5K0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692693938; x=1693298738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxGCtJ2Wep5efB+WkbsRfN8SMwC+vT6DRMJNr+uJtTM=;
        b=W9x8GZVrh2liXMFysHp56F5hwyj6U4cP/YdlJ/UJOxRiDcoWR9HqmS/kBW2HSyA166
         FAMb7jG9F2n6b+zkU02I4cYeC/Ew4HNwiXyCw0NhcnW7wtI4ATbGWYfLBsayTLc/hU26
         bjnl9LMNgzsplt1/DmhJcps9CLzfXbltlpjcXk3qlf9PUDxbmii4Hnhw/Ie+R2xoKqsF
         T3PlmYx+6whdyP1QVEvPOMur9XoMdGFuxPbdo7W0Jz03HP6frhTZn4mTsB3c4p1U0EDq
         uES2Bz9tUxGf05CIjZWVfn59lsHMeAgcNVTNt3fhLkwQn1a2nImY9pv08ubhoXPyRXIU
         xASQ==
X-Gm-Message-State: AOJu0YzUV2tSecIREL4XXYPpBWNSKzAd/nwFQmMxKCCqC6UmipUGgOMc
	YF/7OO9lluIf4u+hLfOCjXuwUA==
X-Google-Smtp-Source: AGHT+IFYd2YL0KrDWvgUIXKMErFKQPaxg058X5tel5M+GH8U6Yi8Ag0PHyjiaxw7yRafBPsTLXVK+A==
X-Received: by 2002:a05:6a00:2389:b0:688:9516:f703 with SMTP id f9-20020a056a00238900b006889516f703mr8179341pfc.31.1692693937996;
        Tue, 22 Aug 2023 01:45:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:e619:3fa0:1a90:6bb0])
        by smtp.gmail.com with ESMTPSA id s26-20020aa78d5a000000b00666b012baedsm7304790pfe.158.2023.08.22.01.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 01:45:37 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 03/11] regulator: dt-bindings: mt6358: Convert to DT schema
Date: Tue, 22 Aug 2023 16:45:11 +0800
Message-ID: <20230822084520.564937-4-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230822084520.564937-1-wenst@chromium.org>
References: <20230822084520.564937-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_014538_655244_D3914A40 
X-CRM114-Status: GOOD (  16.35  )
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

Convert this from the old style text based binding to the new DT schema
style. This will make adding the MT6366 portion easier.

The examples have been trimmed down considerably, and the remaining
entries now match what is seen in actual device trees.

The original submitter seems to have left MediaTek, so instead the
submitter and maintainer for the MT6366 binding is listed.

Cc: Zhiyong Tao <zhiyong.tao@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../regulator/mediatek,mt6358-regulator.yaml  | 105 ++++++
 .../bindings/regulator/mt6358-regulator.txt   | 350 ------------------
 2 files changed, 105 insertions(+), 350 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/mt6358-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml
new file mode 100644
index 000000000000..4d7924c5cc7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6358-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6358 Regulator
+
+maintainers:
+  - Zhiyong Tao <zhiyong.tao@mediatek.com>
+
+description: |
+  Regulator node of the PMIC. This node should under the PMIC's device node.
+  All voltage regulators provided by the PMIC are described as sub-nodes of
+  this node.
+
+properties:
+  compatible:
+    const: mediatek,mt6358-regulator
+
+patternProperties:
+  "^buck_v(core|dram1|gpu|modem|pa|proc1[12]|s[12])$":
+    description: Buck regulators
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo_v(a|rf)12":
+    description: LDOs with fixed 1.2V output and 0~100/10mV tuning
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo_v((aux|cn|io|rf)18|camio)":
+    description: LDOs with fixed 1.8V output and 0~100/10mV tuning
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo_vxo22":
+    description: LDOs with fixed 2.2V output and 0~100/10mV tuning
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo_v(aud|bif|cn|fe|io)28":
+    description: LDOs with fixed 2.8V output and 0~100/10mV tuning
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo_vusb":
+    description: LDOs with fixed 3.0V output and 0~100/10mV tuning
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo_vsram_(gpu|others|proc1[12])$":
+    description: LDOs with variable output
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo_v(cama[12]|camd|cn33|dram2|efuse|emc|ibr|ldo28|mc|mch|sim[12])$":
+    description: LDOs with variable output and 0~100/10mV tuning
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/regulator/mediatek,mt6397-regulator.h>
+
+    regulator {
+        compatible = "mediatek,mt6358-regulator";
+
+        buck_vgpu {
+            regulator-name = "vgpu";
+            regulator-min-microvolt = <625000>;
+            regulator-max-microvolt = <900000>;
+            regulator-ramp-delay = <6250>;
+            regulator-enable-ramp-delay = <200>;
+            regulator-allowed-modes = <MT6397_BUCK_MODE_AUTO
+                                       MT6397_BUCK_MODE_FORCE_PWM>;
+            regulator-coupled-with = <&mt6358_vsram_gpu_reg>;
+            regulator-coupled-max-spread = <100000>;
+        };
+
+        ldo_vsram_gpu {
+            regulator-name = "vsram_gpu";
+            regulator-min-microvolt = <850000>;
+            regulator-max-microvolt = <1000000>;
+            regulator-ramp-delay = <6250>;
+            regulator-enable-ramp-delay = <240>;
+            regulator-coupled-with = <&mt6358_vgpu_reg>;
+            regulator-coupled-max-spread = <100000>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/regulator/mt6358-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6358-regulator.txt
deleted file mode 100644
index b6384306db5c..000000000000
--- a/Documentation/devicetree/bindings/regulator/mt6358-regulator.txt
+++ /dev/null
@@ -1,350 +0,0 @@
-MediaTek MT6358 Regulator
-
-All voltage regulators provided by the MT6358 PMIC are described as the
-subnodes of the MT6358 regulators node. Each regulator is named according
-to its regulator type, buck_<name> and ldo_<name>. The definition for each
-of these nodes is defined using the standard binding for regulators at
-Documentation/devicetree/bindings/regulator/regulator.txt.
-
-The valid names for regulators are::
-BUCK:
-  buck_vdram1, buck_vcore, buck_vpa, buck_vproc11, buck_vproc12, buck_vgpu,
-  buck_vs2, buck_vmodem, buck_vs1
-LDO:
-  ldo_vdram2, ldo_vsim1, ldo_vibr, ldo_vrf12, ldo_vio18, ldo_vusb, ldo_vcamio,
-  ldo_vcamd, ldo_vcn18, ldo_vfe28, ldo_vsram_proc11, ldo_vcn28, ldo_vsram_others,
-  ldo_vsram_gpu, ldo_vxo22, ldo_vefuse, ldo_vaux18, ldo_vmch, ldo_vbif28,
-  ldo_vsram_proc12, ldo_vcama1, ldo_vemc, ldo_vio28, ldo_va12, ldo_vrf18,
-  ldo_vcn33, ldo_vcama2, ldo_vmc, ldo_vldo28, ldo_vaud28, ldo_vsim2
-
-Example:
-
-	pmic {
-		compatible = "mediatek,mt6358";
-
-		mt6358regulator: mt6358regulator {
-			compatible = "mediatek,mt6358-regulator";
-
-			mt6358_vdram1_reg: buck_vdram1 {
-				regulator-compatible = "buck_vdram1";
-				regulator-name = "vdram1";
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <2087500>;
-				regulator-ramp-delay = <12500>;
-				regulator-enable-ramp-delay = <0>;
-				regulator-always-on;
-			};
-
-			mt6358_vcore_reg: buck_vcore {
-				regulator-name = "vcore";
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <1293750>;
-				regulator-ramp-delay = <6250>;
-				regulator-enable-ramp-delay = <200>;
-				regulator-always-on;
-			};
-
-			mt6358_vpa_reg: buck_vpa {
-				regulator-name = "vpa";
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <3650000>;
-				regulator-ramp-delay = <50000>;
-				regulator-enable-ramp-delay = <250>;
-			};
-
-			mt6358_vproc11_reg: buck_vproc11 {
-				regulator-name = "vproc11";
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <1293750>;
-				regulator-ramp-delay = <6250>;
-				regulator-enable-ramp-delay = <200>;
-				regulator-always-on;
-			};
-
-			mt6358_vproc12_reg: buck_vproc12 {
-				regulator-name = "vproc12";
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <1293750>;
-				regulator-ramp-delay = <6250>;
-				regulator-enable-ramp-delay = <200>;
-				regulator-always-on;
-			};
-
-			mt6358_vgpu_reg: buck_vgpu {
-				regulator-name = "vgpu";
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <1293750>;
-				regulator-ramp-delay = <6250>;
-				regulator-enable-ramp-delay = <200>;
-			};
-
-			mt6358_vs2_reg: buck_vs2 {
-				regulator-name = "vs2";
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <2087500>;
-				regulator-ramp-delay = <12500>;
-				regulator-enable-ramp-delay = <0>;
-				regulator-always-on;
-			};
-
-			mt6358_vmodem_reg: buck_vmodem {
-				regulator-name = "vmodem";
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <1293750>;
-				regulator-ramp-delay = <6250>;
-				regulator-enable-ramp-delay = <900>;
-				regulator-always-on;
-			};
-
-			mt6358_vs1_reg: buck_vs1 {
-				regulator-name = "vs1";
-				regulator-min-microvolt = <1000000>;
-				regulator-max-microvolt = <2587500>;
-				regulator-ramp-delay = <12500>;
-				regulator-enable-ramp-delay = <0>;
-				regulator-always-on;
-			};
-
-			mt6358_vdram2_reg: ldo_vdram2 {
-				regulator-name = "vdram2";
-				regulator-min-microvolt = <600000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-enable-ramp-delay = <3300>;
-			};
-
-			mt6358_vsim1_reg: ldo_vsim1 {
-				regulator-name = "vsim1";
-				regulator-min-microvolt = <1700000>;
-				regulator-max-microvolt = <3100000>;
-				regulator-enable-ramp-delay = <540>;
-			};
-
-			mt6358_vibr_reg: ldo_vibr {
-				regulator-name = "vibr";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-enable-ramp-delay = <60>;
-			};
-
-			mt6358_vrf12_reg: ldo_vrf12 {
-				compatible = "regulator-fixed";
-				regulator-name = "vrf12";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <1200000>;
-				regulator-enable-ramp-delay = <120>;
-			};
-
-			mt6358_vio18_reg: ldo_vio18 {
-				compatible = "regulator-fixed";
-				regulator-name = "vio18";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-enable-ramp-delay = <2700>;
-				regulator-always-on;
-			};
-
-			mt6358_vusb_reg: ldo_vusb {
-				regulator-name = "vusb";
-				regulator-min-microvolt = <3000000>;
-				regulator-max-microvolt = <3100000>;
-				regulator-enable-ramp-delay = <270>;
-				regulator-always-on;
-			};
-
-			mt6358_vcamio_reg: ldo_vcamio {
-				compatible = "regulator-fixed";
-				regulator-name = "vcamio";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-enable-ramp-delay = <270>;
-			};
-
-			mt6358_vcamd_reg: ldo_vcamd {
-				regulator-name = "vcamd";
-				regulator-min-microvolt = <900000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-enable-ramp-delay = <270>;
-			};
-
-			mt6358_vcn18_reg: ldo_vcn18 {
-				compatible = "regulator-fixed";
-				regulator-name = "vcn18";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-enable-ramp-delay = <270>;
-			};
-
-			mt6358_vfe28_reg: ldo_vfe28 {
-				compatible = "regulator-fixed";
-				regulator-name = "vfe28";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <2800000>;
-				regulator-enable-ramp-delay = <270>;
-			};
-
-			mt6358_vsram_proc11_reg: ldo_vsram_proc11 {
-				regulator-name = "vsram_proc11";
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <1293750>;
-				regulator-ramp-delay = <6250>;
-				regulator-enable-ramp-delay = <240>;
-				regulator-always-on;
-			};
-
-			mt6358_vcn28_reg: ldo_vcn28 {
-				compatible = "regulator-fixed";
-				regulator-name = "vcn28";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <2800000>;
-				regulator-enable-ramp-delay = <270>;
-			};
-
-			mt6358_vsram_others_reg: ldo_vsram_others {
-				regulator-name = "vsram_others";
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <1293750>;
-				regulator-ramp-delay = <6250>;
-				regulator-enable-ramp-delay = <240>;
-				regulator-always-on;
-			};
-
-			mt6358_vsram_gpu_reg: ldo_vsram_gpu {
-				regulator-name = "vsram_gpu";
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <1293750>;
-				regulator-ramp-delay = <6250>;
-				regulator-enable-ramp-delay = <240>;
-			};
-
-			mt6358_vxo22_reg: ldo_vxo22 {
-				compatible = "regulator-fixed";
-				regulator-name = "vxo22";
-				regulator-min-microvolt = <2200000>;
-				regulator-max-microvolt = <2200000>;
-				regulator-enable-ramp-delay = <120>;
-				regulator-always-on;
-			};
-
-			mt6358_vefuse_reg: ldo_vefuse {
-				regulator-name = "vefuse";
-				regulator-min-microvolt = <1700000>;
-				regulator-max-microvolt = <1900000>;
-				regulator-enable-ramp-delay = <270>;
-			};
-
-			mt6358_vaux18_reg: ldo_vaux18 {
-				compatible = "regulator-fixed";
-				regulator-name = "vaux18";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-enable-ramp-delay = <270>;
-			};
-
-			mt6358_vmch_reg: ldo_vmch {
-				regulator-name = "vmch";
-				regulator-min-microvolt = <2900000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-enable-ramp-delay = <60>;
-			};
-
-			mt6358_vbif28_reg: ldo_vbif28 {
-				compatible = "regulator-fixed";
-				regulator-name = "vbif28";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <2800000>;
-				regulator-enable-ramp-delay = <270>;
-			};
-
-			mt6358_vsram_proc12_reg: ldo_vsram_proc12 {
-				regulator-name = "vsram_proc12";
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <1293750>;
-				regulator-ramp-delay = <6250>;
-				regulator-enable-ramp-delay = <240>;
-				regulator-always-on;
-			};
-
-			mt6358_vcama1_reg: ldo_vcama1 {
-				regulator-name = "vcama1";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3000000>;
-				regulator-enable-ramp-delay = <270>;
-			};
-
-			mt6358_vemc_reg: ldo_vemc {
-				regulator-name = "vemc";
-				regulator-min-microvolt = <2900000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-enable-ramp-delay = <60>;
-				regulator-always-on;
-			};
-
-			mt6358_vio28_reg: ldo_vio28 {
-				compatible = "regulator-fixed";
-				regulator-name = "vio28";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <2800000>;
-				regulator-enable-ramp-delay = <270>;
-			};
-
-			mt6358_va12_reg: ldo_va12 {
-				compatible = "regulator-fixed";
-				regulator-name = "va12";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <1200000>;
-				regulator-enable-ramp-delay = <270>;
-				regulator-always-on;
-			};
-
-			mt6358_vrf18_reg: ldo_vrf18 {
-				compatible = "regulator-fixed";
-				regulator-name = "vrf18";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-enable-ramp-delay = <120>;
-			};
-
-			mt6358_vcn33_reg: ldo_vcn33 {
-				regulator-name = "vcn33";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3500000>;
-				regulator-enable-ramp-delay = <270>;
-			};
-
-			mt6358_vcama2_reg: ldo_vcama2 {
-				regulator-name = "vcama2";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3000000>;
-				regulator-enable-ramp-delay = <270>;
-			};
-
-			mt6358_vmc_reg: ldo_vmc {
-				regulator-name = "vmc";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-enable-ramp-delay = <60>;
-			};
-
-			mt6358_vldo28_reg: ldo_vldo28 {
-				regulator-name = "vldo28";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <3000000>;
-				regulator-enable-ramp-delay = <270>;
-			};
-
-			mt6358_vaud28_reg: ldo_vaud28 {
-				compatible = "regulator-fixed";
-				regulator-name = "vaud28";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <2800000>;
-				regulator-enable-ramp-delay = <270>;
-			};
-
-			mt6358_vsim2_reg: ldo_vsim2 {
-				regulator-name = "vsim2";
-				regulator-min-microvolt = <1700000>;
-				regulator-max-microvolt = <3100000>;
-				regulator-enable-ramp-delay = <540>;
-			};
-		};
-	};
-- 
2.42.0.rc1.204.g551eb34607-goog


