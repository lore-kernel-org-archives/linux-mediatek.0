Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3CCC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Nov 2022 12:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WfPFIvXQkUy4+HZsCcjoOy5HXh/OR2xwCOtqD43AE4=; b=ph7x4ebysgL0ecMTXw326G44iB
	dpV6oScErxBwsjVas0BQ0c9QZE3KugY4kHfinesZHLK5fcx4wKMFqZH9l/H3qL06HkyjMlA5rhD95
	qpVFnXNKGmdSi8OMm6OIctwxBAnCEs9UK+gi0XE4gX7JFMTuPt95tv5rbnV8EpOmVfls5dwb1e1ku
	N7hmnN0sF4QasoRW9brsg3h/0bNu2B0zzsxfRtEUSlOk3NdO+zk9UO4lNPlE24ja+wHi498eeBiUV
	7aqCfnF8pzJdkH652w00rNWu+eFFgrwxl/SqCgF3ysjsot4K39GU5dbuBOp0CnRtk8JB1h6/sEqy3
	VBI8P0Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovHdw-003Ru8-Ns; Wed, 16 Nov 2022 12:35:52 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovHbr-003Qda-0R
	for linux-mediatek@lists.infradead.org; Wed, 16 Nov 2022 12:33:48 +0000
Received: by mail-wr1-x429.google.com with SMTP id a14so29701664wru.5
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Nov 2022 04:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/WfPFIvXQkUy4+HZsCcjoOy5HXh/OR2xwCOtqD43AE4=;
        b=anNTidUNH1tj7TSR3clk5+n+38GOcvy75BhyNV4cdzvdYCHO+HjxLuMWpobowQTKl7
         5hn8Kc80R4O41z4pkcIFDTyT/Xe5TywiKOyyVYG7dYSAmqltXZMm8MkZn/xaE0QTJoUh
         MmF26D9T/EllHHu5S1HHlvKkCf0UMqC0KLHgePQ5mBG+AfP21jaE/Ujzo6Qg6zE9HD6l
         MUU1HdXrBre0hKK6DKi5EXvfTU1Qftnn0XOG/snntBrLtRwNf8V+yFDy1/8oPRL7Vv+m
         B8IhSsZqb51dMoEjFvy+TJKlkoT+3ToyB0es21BKO7LpQsKa9VmDpKzDlKnGpLbM6RRG
         g24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WfPFIvXQkUy4+HZsCcjoOy5HXh/OR2xwCOtqD43AE4=;
        b=QF6qeZqr5TT91SkZHWKphp+ScbD4BK8Ufd/8H2DTKE4nXbp01nCuomzsaEtiCow+Gv
         hKVrUVSCiOREd2OErfjSRu3oH04jFdYY6tGg2zcYR5+gfD0N+A08jVWRkjiaUJzfn7hW
         tkzWWiAJ2zMZA1OMpmUAdkLlqdWfGEW7k2IMhCdOIfD9CGv1UNF1SeuFbOpR8PRTW+KD
         7Ey6It+cO9DSMuB/vXHp3VwzdcIYds9s0s991GEV5YXK/1/sUxVvuBJMpg2u2e7eUSar
         LM5Yn/TkSJv+xCel1DrCd9JfZfPiVTYNXraZjW8KerD/NPYPOQhY8WFozJvLSKJuvU6g
         7SqA==
X-Gm-Message-State: ANoB5plzxPEcgbcfFnE7T0kZ+KAWgFFvsYuXSsB8nkz6KGzm1LCN8NTD
	H9dkI1WjbbRrE6NZpCykDrTvtg==
X-Google-Smtp-Source: AA0mqf4n12wK9CCjIppl1FRYfRcSBS8fD+DvVYKOSREQwCcJOaNYMr8B9PHKzuyxxGfSFSxyAEYNeg==
X-Received: by 2002:a5d:4531:0:b0:22d:6ad5:bc0f with SMTP id j17-20020a5d4531000000b0022d6ad5bc0fmr14196682wra.115.1668602021629;
        Wed, 16 Nov 2022 04:33:41 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id z13-20020adff1cd000000b0024166413a4fsm15051607wro.37.2022.11.16.04.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 04:33:41 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 16 Nov 2022 13:32:59 +0100
Subject: [PATCH v5 05/10] dt-bindings: mfd: mediatek: Add bindings for MT6357 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v5-5-8210d955dd3d@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3860; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=hsHJv7tXwGtDI1+UamHOo/TefFAouJ5xvx7nyDsqMfU=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjdNieQ9Fl8OeMeICUpSLnSuM0BD70OdMnojNX0qWc
 u07fbgGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY3TYngAKCRArRkmdfjHURRraEA
 CEv/D0minFKV62jMF/0IbHr5ntv/eeMRm66nA1uv3+YuR42+mewSDq4Vo0dy7QQCNQGbV0QwPhi2/S
 nTd3BnqZoW377jskDvs+ot8b3jttwmF5cGW2TxYwbI472zCPrQgLgT7s+JfIxThZTX6zUxV0D8d9Sk
 K3kDc0ICCh0Maqo6afqLLQqyEWbTSigEibrsb2WlITYLLNLFXPj9Q/7dMmbv9MKnu8M3jSvslMP4j7
 CbWnpV2AQY8RHd0ccoE5QC4cbtGyJbAnRWudzqVeL+KiRnYJ9PPD7Mrbh4ckGExA8e0D3LzaCPm0Mc
 WgMpSgnfjh0W9vUopCM0PyDrX5ggfZUNPSNGUjO2vmn2leQDzGYWGVu56pIYr1U6sjRv17qiYnrpa3
 Ozfrk01f3yyhAXwncQkaRgTl/g+G/djr9oii5HeZIOuT9dxY/UBGSma9W482wfBsBQZqnFizBigdNa
 nWgOV+lc5i5nwbv6AzeVr1TKGXAA83EHEV+E33OKfy/Ap1pZupTvTxrPhTfBa0Lao93vbQrZyWGUIr
 XeI9FRzmHBDftKRuoJRpBDyt1BIgpVahsa0bw/ET3HnG1FlskktWvtzDSeUlnhWFim+zObQnfPlz1I
 DFfmhMEwubzKjwUW0afVN5dWVKt8xvb7B705IWg0AU2F3yLbYmrEIYF2pXtQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_043343_136213_70DFA2F2 
X-CRM114-Status: GOOD (  14.70  )
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

Currently, almost all MT63XX PMIC are documented mfd/mt6397.txt.
Unfortunately, the PMICs haven't always similar HW sub-features.
To have a better human readable schema, I chose to make one PMIC schema
to match the exact HW capabilities instead of convert mt6397.txt to
mediatek,mt63xx.yaml and put a bunch of properties behind
"if contain ... then ..."

- add interrupt property
- change property refs to match with new yaml documentation

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6357.yaml   | 105 +++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
new file mode 100644
index 000000000000..2aa8025d1e24
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6357 PMIC
+
+maintainers:
+  - Flora Fu <flora.fu@mediatek.com>
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+description: |
+  MT6357 is a power management system chip containing 5 buck
+  converters and 29 LDOs. Supported features are audio codec,
+  USB battery charging, fuel gauge, RTC
+
+  This is a multifunction device with the following sub modules:
+  - Regulator
+  - RTC
+  - Keys
+
+  It is interfaced to host controller using SPI interface by a proprietary hardware
+  called PMIC wrapper or pwrap. This MFD is a child device of pwrap.
+  See the following for pwrap node definitions:
+  Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+
+properties:
+  compatible:
+    const: mediatek,mt6357
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  regulators:
+    type: object
+    $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml
+    description:
+      List of MT6357 BUCKs and LDOs regulators.
+
+  rtc:
+    type: object
+    $ref: /schemas/rtc/mediatek,mt6397-rtc.yaml
+    description:
+      MT6357 Real Time Clock.
+
+  keys:
+    type: object
+    $ref: /schemas/input/mediatek,pmic-keys.yaml
+    description:
+      MT6357 power and home keys.
+
+required:
+  - compatible
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pwrap {
+        pmic {
+            compatible = "mediatek,mt6357";
+
+            interrupt-parent = <&pio>;
+            interrupts = <145 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+
+            regulators {
+                mt6357_vproc_reg: buck-vproc {
+                    regulator-name = "vproc";
+                    regulator-min-microvolt = <518750>;
+                    regulator-max-microvolt = <1312500>;
+                    regulator-ramp-delay = <6250>;
+                    regulator-enable-ramp-delay = <220>;
+                    regulator-always-on;
+                };
+
+                // ...
+
+                mt6357_vusb33_reg: ldo-vusb33 {
+                    regulator-name = "vusb33";
+                    regulator-min-microvolt = <3000000>;
+                    regulator-max-microvolt = <3100000>;
+                    regulator-enable-ramp-delay = <264>;
+                };
+            };
+
+            rtc {
+                compatible = "mediatek,mt6357-rtc";
+            };
+
+            keys {
+                compatible = "mediatek,mt6357-keys";
+            };
+        };
+    };

-- 
b4 0.10.1

