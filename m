Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60271C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Nov 2022 12:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HATzFcKyNJNLHGShh4QYR7TLWgba746X9u+EhN4svqk=; b=b/qrQhTMkG9e6dykBoKD+M6Hgi
	J5ISeF5T28/IBVVeJC+edI/fY6IdFNn6a3B6qdKySDEF5q3ZAE6MOU/U+/sxm4+nvoUSZiuSNgRDa
	envAaz+P9qZ8ECVLJnqsonl1kDhIRu6KL+WXLuHDgASoRQzbG67qQTIM/jrFk+/z3LjsJIPlBZeu8
	yvBitwX+mqXQDy8s9lqoWwXC6IOivG32Yn3xyvSMCk2XHVi/v3eQqTUU7etDMjHy6ZIep/XGsLc4P
	BgbXcGn8xWL84un9k3MJvz5+neSxgRMEGSDGYXyBgK1LRAqzNXefAqTKhczT6OduSnR6GBawLCNsg
	lVvEvJ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovHdQ-003RZc-TZ; Wed, 16 Nov 2022 12:35:20 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovHbp-003Qcr-UV
	for linux-mediatek@lists.infradead.org; Wed, 16 Nov 2022 12:33:47 +0000
Received: by mail-wr1-x431.google.com with SMTP id z14so29518995wrn.7
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Nov 2022 04:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HATzFcKyNJNLHGShh4QYR7TLWgba746X9u+EhN4svqk=;
        b=qW+UYumOo0IeZysDt62lV2NdZjLKnGnlxSpR+5Yi7sdmP/Ascf3x33VtFCoUy1Xtlr
         y2Bt4LiBSxlG92M+yOxsBZHmlS7GFw5nG7LoUp86ioaLO1C3Z13kb14WB3laQlkJ9JuN
         UCgz8XlixciAqbNfT8TvzgM1EAnXBusFdj59gCskY7bcWIksDPxq7WcvwBdLaf2Shfx+
         XTadC3fGIoE6ZmsGokVVsC9UoSERNWngSM+aloLO18pMp9hELotLq1pfczahVaxNkjGo
         AwwHwEABBkxt2veTIdKjePclUKJp46MmUc1QLrvNolnOGuGdxaPJk5d73CSWpp9w/46h
         XgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HATzFcKyNJNLHGShh4QYR7TLWgba746X9u+EhN4svqk=;
        b=r8SPrmLcrq0JH2ZDsM3ZOpOn8YcEe+KUX7q9d/BXNOy4CxpIfYv5v39YMIgmQ6JnD/
         aQ29rahx8uMdR8o+B76bMxvjEX/DLprCdrv7x5wt1AMtHKqfTbcWP08scKO2YLs4R5oo
         dmAcqRra43VD2+tQJcykO7f7kxWlGmx6MgS8o4muGvHvyWsITf2S1w2qVGT/e4DpGuko
         ofsk0QNPtsM+THVwv47s60bJeha71315UB8RQ0prug/wXU5E2YjkixvJv4ydxJXtmRjk
         Y1EvmacCoS2oon1+2mwkNbunxQFqSIN4RHuk/uMSFmy3XiSxoCXntu+R0oinSt2KGYGK
         JjlQ==
X-Gm-Message-State: ANoB5pkRrjxsF+rxyc8XEOqX1rt8WTDTJLy5FAWJr5na8M29X5GNtYgo
	uxaT+cDmy0/MK9Iv0zrOUhnVhQ==
X-Google-Smtp-Source: AA0mqf5lT+Bg5bZ4UHXq/23WChK96o76jj4mVkZRF8ElFGvgaFprzVhxURsY27RTWJZZNi7Rw8PVjg==
X-Received: by 2002:a5d:6086:0:b0:22e:71db:47ba with SMTP id w6-20020a5d6086000000b0022e71db47bamr14223316wrt.359.1668602020488;
        Wed, 16 Nov 2022 04:33:40 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id z13-20020adff1cd000000b0024166413a4fsm15051607wro.37.2022.11.16.04.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 04:33:40 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 16 Nov 2022 13:32:58 +0100
Subject: [PATCH v5 04/10] regulator: dt-bindings: Add binding schema for mt6357
 regulators
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v5-4-8210d955dd3d@baylibre.com>
References: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
To: Flora Fu <flora.fu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tianping Fang <tianping.fang@mediatek.com>,
 Fabien Parent <fabien.parent@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Brown <broonie@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Chen Zhong <chen.zhong@mediatek.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-rtc@vger.kernel.org,
 linux-input@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=11436;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=oN1mPz7HLBv6qktF6GkCn4WCRTLtCt2bqJ71/SAMGkw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjdNiemYeIS6GPViPY65ESxG4uUG9xhxdeWKz90Nnl
 wXjsQnuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY3TYngAKCRArRkmdfjHURSL3EA
 C8k6M3XB6y9c4iWfJZiY5qm7aziRuCS6BAqyIpyykFzkVL1vA4U0U7ZTYXI666QYfrA0D7ZOO56eM6
 TLMiV/KuNRi17LM1rDBjJwdHChxb8ZjNZx2ZvMG+bF8De67WlgHECCVC1BuucjdyiN9Fx/VjAvBwrF
 CsJa8pUcDslP1VVRFfrBDtJXgBWl6E/8k2exvrfaj6HsaJYg0/3hhOb6RczwqlMqkJ+VnYxPUU+atB
 /VWDgFKtylb/huxIujdHE++KGehv9N/iM8fUZnhaA+GMfjVVOyYyh3Il9mybuV01tvv5sjkXK+S7xs
 S2bIZ4KK+jWe/b7pw/Y6YoIlH4f/Pc9PiRDh4RO3kOaGjDo/WQyMSEzcieFTqWJXA5W8BFbN3AWE/A
 VCmdg6MEM4+eILw5qskceU1FvTYCqBqh7fxJMMd3I7gaOIQI77nhDSMK1y2fMVnc/ExRlW6vraKt2q
 3VASxJS1V4EBNYCxqQs4pHi+rmtC7V4K4kDO62VosEgUpjgTHeaorDyMbUrIIhT8m/Jc/MwLysk0ET
 dDNs0Y3kIsUDtOaDBp2rKXrK5vv1Bz3snbQHskt60GyeMl2dHPmSW2F3HlZcdbkYOgJgZqctuRYql2
 SEGdiTi85xs4MxCpsEikvmVSIGVYUYmG/RClz/ARctz76/wWy++Cb615sJig==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_043342_152697_0C97DAA1 
X-CRM114-Status: GOOD (  11.85  )
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

From: Fabien Parent <fparent@baylibre.com>

Add YAML schema for the MediaTek MT6357 regulators.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../regulator/mediatek,mt6357-regulator.yaml       | 293 +++++++++++++++++++++
 1 file changed, 293 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
new file mode 100644
index 000000000000..2c5f3f53a86f
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
@@ -0,0 +1,293 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6357-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6357 Regulators
+
+maintainers:
+  - Chen Zhong <chen.zhong@mediatek.com>
+  - Fabien Parent <fabien.parent@linaro.org>
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+description: |
+  The MT6357 PMIC provides 5 BUCK and 29 LDO.
+  Regulators and nodes are named according to the regulator type:
+  buck-<name> and ldo-<name>.
+  MT6357 regulators node should be sub node of the MT6397 MFD node.
+
+patternProperties:
+  "^buck-v(core|modem|pa|proc|s1)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single BUCK regulator.
+
+    required:
+      - regulator-name
+      - regulator-min-microvolt
+      - regulator-max-microvolt
+
+  "^ldo-v(camio18|aud28|aux18|io18|io28|rf12|rf18|cn18|cn28|fe28)$":
+    type: object
+    $ref: fixed-regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single fixed LDO regulator.
+
+    required:
+      - regulator-name
+      - regulator-min-microvolt
+      - regulator-max-microvolt
+
+  "^ldo-v(efuse|ibr|ldo28|mch|cama|camd|cn33-bt|cn33-wifi)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
+
+    required:
+      - regulator-name
+      - regulator-min-microvolt
+      - regulator-max-microvolt
+
+  "^ldo-v(xo22|emc|mc|sim1|sim2|sram-others|sram-proc|dram|usb33)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
+
+    required:
+      - regulator-name
+      - regulator-min-microvolt
+      - regulator-max-microvolt
+
+additionalProperties: false
+
+examples:
+  - |
+    pmic {
+      regulators {
+        mt6357_vproc_reg: buck-vproc {
+          regulator-name = "vproc";
+          regulator-min-microvolt = <518750>;
+          regulator-max-microvolt = <1312500>;
+          regulator-ramp-delay = <6250>;
+          regulator-enable-ramp-delay = <220>;
+          regulator-always-on;
+        };
+        mt6357_vcore_reg: buck-vcore {
+          regulator-name = "vcore";
+          regulator-min-microvolt = <518750>;
+          regulator-max-microvolt = <1312500>;
+          regulator-ramp-delay = <6250>;
+          regulator-enable-ramp-delay = <220>;
+          regulator-always-on;
+        };
+        mt6357_vmodem_reg: buck-vmodem {
+          regulator-name = "vmodem";
+          regulator-min-microvolt = <500000>;
+          regulator-max-microvolt = <1193750>;
+          regulator-ramp-delay = <6250>;
+          regulator-enable-ramp-delay = <220>;
+        };
+        mt6357_vs1_reg: buck-vs1 {
+          regulator-name = "vs1";
+          regulator-min-microvolt = <1200000>;
+          regulator-max-microvolt = <2200000>;
+          regulator-ramp-delay = <12500>;
+          regulator-enable-ramp-delay = <220>;
+          regulator-always-on;
+        };
+        mt6357_vpa_reg: buck-vpa {
+          regulator-name = "vpa";
+          regulator-min-microvolt = <500000>;
+          regulator-max-microvolt = <3650000>;
+          regulator-ramp-delay = <50000>;
+          regulator-enable-ramp-delay = <220>;
+        };
+        mt6357_vfe28_reg: ldo-vfe28 {
+          compatible = "regulator-fixed";
+          regulator-name = "vfe28";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <2800000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vxo22_reg: ldo-vxo22 {
+          regulator-name = "vxo22";
+          regulator-min-microvolt = <2200000>;
+          regulator-max-microvolt = <2400000>;
+          regulator-enable-ramp-delay = <110>;
+        };
+        mt6357_vrf18_reg: ldo-vrf18 {
+          compatible = "regulator-fixed";
+          regulator-name = "vrf18";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-enable-ramp-delay = <110>;
+        };
+        mt6357_vrf12_reg: ldo-vrf12 {
+          compatible = "regulator-fixed";
+          regulator-name = "vrf12";
+          regulator-min-microvolt = <1200000>;
+          regulator-max-microvolt = <1200000>;
+          regulator-enable-ramp-delay = <110>;
+        };
+        mt6357_vefuse_reg: ldo-vefuse {
+          regulator-name = "vefuse";
+          regulator-min-microvolt = <1200000>;
+          regulator-max-microvolt = <3300000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vcn33_bt_reg: ldo-vcn33-bt {
+          regulator-name = "vcn33-bt";
+          regulator-min-microvolt = <3300000>;
+          regulator-max-microvolt = <3500000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vcn33_wifi_reg: ldo-vcn33-wifi {
+          regulator-name = "vcn33-wifi";
+          regulator-min-microvolt = <3300000>;
+          regulator-max-microvolt = <3500000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vcn28_reg: ldo-vcn28 {
+          compatible = "regulator-fixed";
+          regulator-name = "vcn28";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <2800000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vcn18_reg: ldo-vcn18 {
+          compatible = "regulator-fixed";
+          regulator-name = "vcn18";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vcama_reg: ldo-vcama {
+          regulator-name = "vcama";
+          regulator-min-microvolt = <2500000>;
+          regulator-max-microvolt = <2800000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vcamd_reg: ldo-vcamd {
+          regulator-name = "vcamd";
+          regulator-min-microvolt = <1000000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vcamio_reg: ldo-vcamio18 {
+          compatible = "regulator-fixed";
+          regulator-name = "vcamio";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vldo28_reg: ldo-vldo28 {
+          regulator-name = "vldo28";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <3000000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vsram_others_reg: ldo-vsram-others {
+          regulator-name = "vsram-others";
+          regulator-min-microvolt = <518750>;
+          regulator-max-microvolt = <1312500>;
+          regulator-ramp-delay = <6250>;
+          regulator-enable-ramp-delay = <110>;
+          regulator-always-on;
+        };
+        mt6357_vsram_proc_reg: ldo-vsram-proc {
+          regulator-name = "vsram-proc";
+          regulator-min-microvolt = <518750>;
+          regulator-max-microvolt = <1312500>;
+          regulator-ramp-delay = <6250>;
+          regulator-enable-ramp-delay = <110>;
+          regulator-always-on;
+        };
+        mt6357_vaux18_reg: ldo-vaux18 {
+          compatible = "regulator-fixed";
+          regulator-name = "vaux18";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vaud28_reg: ldo-vaud28 {
+          compatible = "regulator-fixed";
+          regulator-name = "vaud28";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <2800000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vio28_reg: ldo-vio28 {
+          compatible = "regulator-fixed";
+          regulator-name = "vio28";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <2800000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vio18_reg: ldo-vio18 {
+          compatible = "regulator-fixed";
+          regulator-name = "vio18";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-enable-ramp-delay = <264>;
+          regulator-always-on;
+        };
+        mt6357_vdram_reg: ldo-vdram {
+          regulator-name = "vdram";
+          regulator-min-microvolt = <1100000>;
+          regulator-max-microvolt = <1200000>;
+          regulator-enable-ramp-delay = <3300>;
+        };
+        mt6357_vmc_reg: ldo-vmc {
+          regulator-name = "vmc";
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <3300000>;
+          regulator-enable-ramp-delay = <44>;
+        };
+        mt6357_vmch_reg: ldo-vmch {
+          regulator-name = "vmch";
+          regulator-min-microvolt = <2900000>;
+          regulator-max-microvolt = <3300000>;
+          regulator-enable-ramp-delay = <44>;
+        };
+        mt6357_vemc_reg: ldo-vemc {
+          regulator-name = "vemc";
+          regulator-min-microvolt = <2900000>;
+          regulator-max-microvolt = <3300000>;
+          regulator-enable-ramp-delay = <44>;
+          regulator-always-on;
+        };
+        mt6357_vsim1_reg: ldo-vsim1 {
+          regulator-name = "vsim1";
+          regulator-min-microvolt = <1700000>;
+          regulator-max-microvolt = <3100000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vsim2_reg: ldo-vsim2 {
+          regulator-name = "vsim2";
+          regulator-min-microvolt = <1700000>;
+          regulator-max-microvolt = <3100000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+        mt6357_vibr_reg: ldo-vibr {
+          regulator-name = "vibr";
+          regulator-min-microvolt = <1200000>;
+          regulator-max-microvolt = <3300000>;
+          regulator-enable-ramp-delay = <44>;
+        };
+        mt6357_vusb33_reg: ldo-vusb33 {
+          regulator-name = "vusb33";
+          regulator-min-microvolt = <3000000>;
+          regulator-max-microvolt = <3100000>;
+          regulator-enable-ramp-delay = <264>;
+        };
+      };
+    };
+...

-- 
b4 0.10.1

