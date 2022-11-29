Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9919C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 16:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EaP34wv8cHsMbN5b2lelNoPsr3chehdl/q6+cIBNPQg=; b=1rb2IJRotxH3lEacXd3UsYeiVb
	W+udgO2Cwy11Lc7OsiDZHV6rIWyzZ2R7rAmdvH4OD1ogUw5i5H60tKixHg7DMBt4tRwB2Lonm4kOZ
	oM4pfUe+CLPMpl7y0igUZyn/a3NMFEoCmWeMMT+UGNQJFUxL/uAHLqETFsRNkAjNvIhZr/uyOILPX
	47isSebIZzSdUhkgH1mrATqp+kFqyiCMjK7oPa74GHPJFBHK7TWAxIkwyBUHzVNhpGDOXW2L7/P2V
	bEcPDZGRCEcDq9AGFoBY4OSNcgzEoaHI/2AozXnBIgAJrsTejOhI+5RDhRxhGrxf/Ikyq8+yD6kOx
	15qbWU/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p031x-009uiC-Nk; Tue, 29 Nov 2022 16:00:21 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p02yx-009tDl-LA
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 15:57:27 +0000
Received: by mail-wr1-x433.google.com with SMTP id w15so9602807wrl.9
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Nov 2022 07:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EaP34wv8cHsMbN5b2lelNoPsr3chehdl/q6+cIBNPQg=;
        b=Ldzl0Yp438arqXsgUSMh6kL7BW0sfLyySZqZp7wTrUK11oRDB28BDiyJOPatPacDhG
         bKRo8qiMFtmS16NFqHJsavf3p6hNxYYUjiHt/qLJ+7LFZLCDWcctwtBtb2EPJMhiUe3g
         3lKs/EUjmkEjksuydnFKSsMqPTuuCJe3ESSUOkSqcQ2051c+Qi2JeUy15X/6FeQlbYu0
         RGkBtfosQQCk8WZcvvJnhhUMrU8BWEVXeZMMw6/giwPVBrEDFzsWfVnN83Ruszq12wOx
         +MnJYW2COaGOT6Jmx1cdxiWdGhhBzRlXXq6XK1zbT9/wvMNWxo/QmTztwt6m+aH0w7Cq
         mrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EaP34wv8cHsMbN5b2lelNoPsr3chehdl/q6+cIBNPQg=;
        b=vv/aQZcVWXwsU0cnziadzhzla6qbq/FWRcQ+5nTO3rbNWjetENt3Xy3LUBxNrTydQW
         SZn6rArgKCO0ogWj+vHF+yZiJ6kBsHqcgF0Bgob3BTJ2WxTb6PdKdWeDtopQhv1Hfb8q
         /Y2yv+G2o44+VA0hniD0X0zp98cn1we/mvqY83yhHtLw872FBDEoGrzUwHM92a/iZI0e
         QGjhqrXommnRyfghBcw1ToR9rSXWSZPy0/sOO5MTPtolg0LcdypcnGmkLWKrk1aCdCjD
         glgpURe/dbWS4Wb8KRwTR1dTAGd+YGtoqWyquCyN9XoOOr80A00uJAvwv1RMMkoSn9CV
         6sNg==
X-Gm-Message-State: ANoB5plIndqOaRZNUhbd9osKnrSTn2ru5/9y9mE6+CgmJUxWHIkuHyQF
	eDWhpkcI/HL4QdqVX02bXwn85Q==
X-Google-Smtp-Source: AA0mqf5bQqqQYKnc/Htz/mz3qMfx6JmcNzPTQySDIH7fNPhMLdpc1Y8P9+f7xMl1tbosD4i+BiDd6w==
X-Received: by 2002:a5d:4fd0:0:b0:241:fdb9:c7b9 with SMTP id h16-20020a5d4fd0000000b00241fdb9c7b9mr16275175wrw.46.1669737427214;
        Tue, 29 Nov 2022 07:57:07 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f2-20020a7bc8c2000000b003cfb7c02542sm2601550wml.11.2022.11.29.07.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 07:57:06 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 29 Nov 2022 16:57:01 +0100
Subject: [PATCH v7 2/8] regulator: dt-bindings: Add binding schema for mt6357
 regulators
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v7-2-477e60126749@baylibre.com>
References: <20221005-mt6357-support-v7-0-477e60126749@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v7-0-477e60126749@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Fabien Parent <fabien.parent@linaro.org>, Tianping Fang <tianping.fang@mediatek.com>, Flora Fu <flora.fu@mediatek.com>,
 Chen Zhong <chen.zhong@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-mediatek@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-rtc@vger.kernel.org, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Fabien Parent <fparent@baylibre.com>, linux-leds@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=11440;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=y+MiriLy7hAWFi7TI2kfD8KqIfIYGSLRk1pCtSC2vQw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjhivPOwe6FK/kl/cWy442z70L2njtgfriUnqKopX/
 Mn3GwLeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY4YrzwAKCRArRkmdfjHURZQQD/
 44BnMtUfMf4bChIsh8QEcmTsD5ggkhQEYvVPVTZt2gBVQ/HqI13GKvwGXcDkmYYDyw1gWEHY9uxB4H
 WxMLJ+elqgRXLqpt43Ii1dO7yXBqDdg89KrfsL+bKZ1GiTzBg4MtrR4DUavnmqTeh+EvXgwRAkOOPn
 Iiuxm1/kZB/xLcEIauxpCVzpSthTm5cie+3Q8czSZgX3ap1IW7v6krltw1JrfyO6lQMWT4BXqrn7CP
 21vOm6hGmcfqaS+lygcl6muadO7JDe1h0jWSHLMHrXxLS7PVMrAQaNYE3ymnnPftj8DC3vmgBAnvx8
 uaRSJi2VLMrWpOGbJhrUexqd42VS6QnQGcatfSVZm4NLUaUnAZJjdupqqUTee500Y2ug3rZ3nZWFdZ
 pzPcq0tkLJsRz4ccFXJnY/mTAhfbPTtlApmIIPtCulHBN594Sx02iw5cxhwlQ4SMA3NAmFCJCE6pkB
 c0n7zEwxO7U/cmwNqcJKtstN3/RRrr5XdLSu3WfQ0TRUdrBwzeHqUl+5T3hc9C7VWcwNPGu/TlVg7J
 BmR2EE2ghVwc7bQ48gcImL7sItzE7gaPxGcWij1gnTBWsHNLEzksxjXy0n6H3N//BWUB8Ljjv7E+Y8
 F2EUiClbIgaeUQKHLkiHnIUQzCZFvUHKnpm25xi2ZvHrZvj2Q7U9Dk5A0S0A==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_075720_839475_23D7E521 
X-CRM114-Status: GOOD (  12.34  )
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
 .../regulator/mediatek,mt6357-regulator.yaml       | 294 +++++++++++++++++++++
 1 file changed, 294 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
new file mode 100644
index 000000000000..6327bb2f6ee0
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
@@ -0,0 +1,294 @@
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
+  - buck-<name>
+  - ldo-<name>.
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

