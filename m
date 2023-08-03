Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76489C0015E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 07:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVtXI1HZxhBYq/0/uTELsRw0u0pAzWKlEP1Rn/MZ4jk=; b=vYlX5iH/nCxI+JRsQvJirtYMoP
	j9JOaRO3AeUnniJJ5+tA+D26UGPKONYRbAFJ10pb5qxKEOYgAWLctmxLgOMeZD+x0iDEdi71hZsFt
	SbXLLcNOdMG0uXOND0GamtmkFu0T7enyjqx1NfInYn8PeWfQRHjLLg1UKA/+5da6fNlEDkVZ3a3h6
	Rl3Adzij/vPxA51gGX/1/9Pka7Kh0lVZNfU/p4/WHmlCHlfW6177xLNKN8ZsLMYLTQD0R4oPIWUg8
	YE6f7f28F1WUYujgG7ZjnyRExZsMlv335U2tzWEMBwInGZcxyeY3eED9ksMzP4TuNlCVxr2UM3H0n
	IzfFPJfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSzJ-006uEW-0z;
	Thu, 03 Aug 2023 07:43:13 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSzF-006u9s-0I
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Aug 2023 07:43:11 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-55c993e26ffso342689a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Aug 2023 00:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691048588; x=1691653388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVtXI1HZxhBYq/0/uTELsRw0u0pAzWKlEP1Rn/MZ4jk=;
        b=PKwk4GEk3yopaHuENojxSNYlbNJmh6+WGq90OHBeQqMuCf/L03VfIqLe6JOtcSeJ2n
         2cxjXwsxhbh5alr8Uz9LKnOIPqOSUMrBCQmXJ9m98Li81fZgf/f+GjqyTiMEcsW3R7LK
         jPJez4gRDjDFj7HtyUX/mJ4++B3sv8bJDHcSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691048588; x=1691653388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVtXI1HZxhBYq/0/uTELsRw0u0pAzWKlEP1Rn/MZ4jk=;
        b=V/ZsVroUeVAM7quFTtDSEOdOPjZxeigOiODhNm6Phy2vyVUKt0MSWizCZ6mgjq4Gvj
         HUQtVvpc8fcc223bJQtj17bdhNkBOGOWpBdnDMbKdhhXjO9eLn4VmeRxFHfDn/Sh9e+A
         4Yb4uV+P6WXtZsGD2RCq15/Fcz9TDWxiwytNQEnJHGHrnoFQHxY2k07eMJN/ZZe0bVoO
         Cd9Ca3txjid8uBD4keLsgHgeVsuggzzVZdlTLwTx5jz9uqGIS29uRsoR1JihrafJj0WM
         i7610AmeJQQ+/RS8xNL+GbZLM2A2QJ/xjlsGilgG/ScULFeDVSiWceWj07GuOk9eiNNr
         /zkg==
X-Gm-Message-State: ABy/qLaN03N9FIOlioYYz5cdgkUWKdZRRPbSAx+zAtDRJu+VvaQHh/K+
	L9Fp9A2QiLKtodoiyfh4i5Jb2Q==
X-Google-Smtp-Source: APBJJlGwLafzFcT24plp42o/OZcYOgz8zEtjUf/9xsYA2D+hxTl0/0NE4IzHmiKxo9RnR9Rc36P5xg==
X-Received: by 2002:a17:90b:8d2:b0:267:75ce:f6d9 with SMTP id ds18-20020a17090b08d200b0026775cef6d9mr14285008pjb.3.1691048588039;
        Thu, 03 Aug 2023 00:43:08 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6f3e:66ee:db46:473b])
        by smtp.gmail.com with ESMTPSA id l11-20020a17090a72cb00b00262d079720bsm2095753pjk.29.2023.08.03.00.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 00:43:07 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Zhiyong Tao <zhiyong.tao@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH 4/9] regulator: dt-bindings: mediatek: Add MT6366 PMIC
Date: Thu,  3 Aug 2023 15:42:42 +0800
Message-ID: <20230803074249.3065586-5-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
In-Reply-To: <20230803074249.3065586-1-wenst@chromium.org>
References: <20230803074249.3065586-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_004309_143905_5BE5C1DB 
X-CRM114-Status: GOOD (  15.39  )
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

From: Zhiyong Tao <zhiyong.tao@mediatek.com>

The MediaTek MT6366 PMIC is similar to the MT6358 PMIC. It is designed
to be paired with the MediaTek MT8186 SoC. It has 9 buck regulators and
29 LDO regulators, not counting ones that feed internally and basically
have no controls. The regulators are named after their intended usage
for the SoC and system design, thus not named generically as ldoX or
dcdcX, but as vcn33 or vgpu.

Add a binding document describing all the regulators and their supplies.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
[wens@chromium.org: major rework and added commit message]
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since Zhiyong's last version (v4) [1]:
- simplified regulator names
- added descriptions to regulators
- removed bogus regulators (*_sshub)
- merged vcn33-wifi and vcn33-bt as vcn33
- added missing regulators (vm18, vmddr, vsram-core)
- cut down examples to a handful of cases and made them complete
- expanded commit message a lot

[1] https://lore.kernel.org/linux-arm-kernel/20220823123745.14061-1-zhiyong.tao@mediatek.com/

 .../regulator/mediatek,mt6366-regulator.yaml  | 154 ++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml
new file mode 100644
index 000000000000..715c6ffcb3ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6366-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MT6366 Regulator from MediaTek Integrated
+
+maintainers:
+  - Zhiyong Tao <zhiyong.tao@mediatek.com>
+
+description: |
+  Regulator part of the MT6366 PMIC. This node should be under the PMIC's
+  device node.
+
+properties:
+  compatible:
+    const: mediatek,mt6366-regulator
+
+  vsys_ldo1-supply:
+    description: Supply for LDOs vfe28, vxo22, vcn28, vaux18, vaud28, vsim1, vusb, vbif28
+  vsys_ldo2-supply:
+    description: Supply for LDOs vio28, vmc, vmch, vsim2
+  vsys_ldo3-supply:
+    description: Supply for LDOs vcn33, vemc, vibr
+  vsys_vcore-supply:
+    description: Supply for buck regulator vcore
+  vsys_vdram1-supply:
+    description: Supply for buck regulator vdram1
+  vsys_vgpu-supply:
+    description: Supply for buck regulator vgpu
+  vsys_vmodem-supply:
+    description: Supply for buck regulator vmodem
+  vsys_vpa-supply:
+    description: Supply for buck regulator vpa
+  vsys_vproc11-supply:
+    description: Supply for buck regulator vproc11
+  vsys_vproc12-supply:
+    description: Supply for buck regulator vproc12
+  vsys_vs1-supply:
+    description: Supply for buck regulator vs1
+  vsys_vs2-supply:
+    description: Supply for buck regulator vs2
+  vs1_ldo1-supply:
+    description: Supply for LDOs vrf18, vefuse, vcn18, vio18, vm18
+  vs2_ldo1-supply:
+    description: Supply for LDOs vmddr, vdram2
+  vs2_ldo2-supply:
+    description: Supply for LDOs vrf12, va12
+  vs2_ldo3-supply:
+    description: Supply for LDOs vsram-core, vsram-gpu, vsram-others, vsram-proc11, vsram-proc12
+
+patternProperties:
+  "^v(core|dram1|gpu|modem|pa|proc1[12]|s[12])$":
+    description: Buck regulators
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^v(a|rf)12":
+    description: LDOs with fixed 1.2V output and 0~100/10mV tuning
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^v(aux|io|rf)18":
+    description: LDOs with fixed 1.8V output and 0~100/10mV tuning
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^vxo22":
+    description: LDOs with fixed 2.2V output and 0~100/10mV tuning
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^v(aud|bif|cn|fe|io)28":
+    description: LDOs with fixed 2.8V output and 0~100/10mV tuning
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^vusb":
+    description: LDOs with fixed 3.0V output and 0~100/10mV tuning
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^vsram-(core|gpu|others|proc1[12])$":
+    description: LDOs with variable output
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^v(cn18|cn33|dram2|efuse|emc|ibr|m18|mc|mch|mddr|sim[12])$":
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
+        compatible = "mediatek,mt6366-regulator";
+
+        vdram1 {
+            regulator-name = "pp1125_emi_vdd2";
+            regulator-min-microvolt = <1125000>;
+            regulator-max-microvolt = <1125000>;
+            regulator-ramp-delay = <12500>;
+            regulator-enable-ramp-delay = <0>;
+            regulator-allowed-modes = <MT6397_BUCK_MODE_AUTO
+                                       MT6397_BUCK_MODE_FORCE_PWM>;
+            regulator-always-on;
+        };
+
+        vproc11 {
+            regulator-name = "ppvar_dvdd_proc_bc_mt6366";
+            regulator-min-microvolt = <600000>;
+            regulator-max-microvolt = <1200000>;
+            regulator-ramp-delay = <6250>;
+            regulator-enable-ramp-delay = <200>;
+            regulator-allowed-modes = <MT6397_BUCK_MODE_AUTO
+                                       MT6397_BUCK_MODE_FORCE_PWM>;
+            regulator-always-on;
+        };
+
+        vmddr {
+            regulator-name = "pm0750_emi_vmddr";
+            regulator-min-microvolt = <700000>;
+            regulator-max-microvolt = <750000>;
+            regulator-enable-ramp-delay = <325>;
+            regulator-always-on;
+        };
+
+        vsram-proc11 {
+            regulator-name = "pp0900_dvdd_sram_bc";
+            regulator-min-microvolt = <850000>;
+            regulator-max-microvolt = <1120000>;
+            regulator-ramp-delay = <6250>;
+            regulator-enable-ramp-delay = <240>;
+            regulator-always-on;
+        };
+    };
+
+...
-- 
2.41.0.585.gd2178a4bd4-goog


