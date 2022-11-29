Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E666C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 15:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBEMKkU5Jf78zjhTP42yrtwbbgdcFAxazcCxLhs1i2o=; b=Pov5OwZEBEbEwECuac95K15tvI
	MmC4IzwoOYvd45kSqMLsNyhVywDn5f37fV8MOYEF/aF1EFlNCOVI2a6eR6/b1uax6UgH9d1YSZpEj
	euIJBpHDMqFZu95l3eIXInpSZ8tht5rPdEdye9aFTQ0/e9jQREN9fVJxLcP3+Dj4HV1fD2qvSFnA0
	0wxT4efsw0QZs7yDi6H7vD8Kjz2HwdLwkQgM6HKyR0mN3xL/+6rdtMVojc9pq7wnGoQbCshInaWT9
	FKUfkwiG3kaUMMsbpmp6oISqO2j10DGr0ZXJpfkUlq9NhYeQ2UB/IKb2awTGD851a6KN5dr27f66U
	hk1GoO3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p02zX-009tWQ-Ne; Tue, 29 Nov 2022 15:57:51 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p02yx-009tEY-Hs
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 15:57:20 +0000
Received: by mail-wr1-x42d.google.com with SMTP id w15so9603014wrl.9
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Nov 2022 07:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZBEMKkU5Jf78zjhTP42yrtwbbgdcFAxazcCxLhs1i2o=;
        b=xfoOuWSZqyMyOIKY7rBPH2i53/duEI2uIFWNKjRjVItORcEK8rKcU1KWrMr3TUqU9P
         6za0UXBiEETgq6pAAVVTQK2yxf4nZXUyJPpazSZot8DWo4dglWmkKVfQI9/zTFMVd/yr
         Zcu/X/LPEFXwzyGtGmhKXZwbXYLtXtLyPhqzwIwk+c8REy9btGh6MWQHUHuQ5cSKWNO2
         GmhnqZoM3gzNEQzPzR6R6vWOTkbbtsZRYlEzb6GMUXCDJb8w9ZfpjDaE1bEvVyxAZsII
         bnB+T7+ZvXya0+HIrI4t2Vu/mBinhRzmAjZaomsyWrXvzaY7Kzc8YjU/e2enHw89L3X6
         dYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBEMKkU5Jf78zjhTP42yrtwbbgdcFAxazcCxLhs1i2o=;
        b=U+UFdPjPtPV+eIWvbOqW+sRGk7V86k24S/7BKph8jlDQUpMGZMoEc8KL/Xhk36UgOq
         jGL7tHdc1Qf6SbAK/Ap1NW8TO0Tn6UTeKk18+VymC1U0ZOnKyXt8P3s+emcx27J/3Ias
         Vsz/W6/UKzcQCqoyi8gi7JNii9PySGMq1wpr8z04jlpM95T+d8wT5VGnet4xkRz0HITK
         ipIdH/HUXoOLTKzQbFl/nN9t5UAGkq9OvyOkficK32iQf231wvWcyNww/9XbJ1h1fFya
         YUZx9YWP4e/jGNeA6QxN+XksdJeh/7siDk43OSE1xggp5EQfNHYGE9QbkMae0bjPKnO+
         yM9w==
X-Gm-Message-State: ANoB5pnysa6WkxpNqN2iQjg91MrfSiF9nWoo0/kjVF3dL//VqoRacqbR
	lSODF0pwFWRqcDMLFi+AB7YU8A==
X-Google-Smtp-Source: AA0mqf4On90wvRcTiqcwXp55MGsSJPFm/4r9Mi8bAqomdqBkBCRU3ZBB9nFMyyRw6wQhVjCuIVuBQQ==
X-Received: by 2002:a5d:484d:0:b0:242:22a9:ff72 with SMTP id n13-20020a5d484d000000b0024222a9ff72mr2178802wrs.281.1669737429509;
        Tue, 29 Nov 2022 07:57:09 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f2-20020a7bc8c2000000b003cfb7c02542sm2601550wml.11.2022.11.29.07.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 07:57:09 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 29 Nov 2022 16:57:03 +0100
Subject: [PATCH v7 4/8] dt-bindings: mfd: mediatek: Add bindings for MT6357 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v7-4-477e60126749@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4049; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=uKuF7biK8c+btRJLJuyALjWX3u9C1resjYMNnQJShXI=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjhivPLKePPwTHV0AdahqJYOr6Gp1yZ4zFY/+8aXs5
 BT/1numJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY4YrzwAKCRArRkmdfjHURQbTD/
 9RPSSL0Wgi+YOM6r71qng1P22fsNB2SFQdxmBjBByjd2CgLjrcaF1fezd0rnelnS6HrY6WGuV3FpBW
 kUNsmGg8FYuIhTtrTyp3S+ox/xsDbN23JPNu1fFPoHpja4RF4ma6FbVLXP2Oll9E/9Qt2nZazj5Qtj
 EG5MUiNNlZ4zOi1z3/ZBtO8PHKvg1IoBcVV1uRmbDP9y5B8LuvwUBNA0hUJP9ELcmjPpL96TnA9Rp3
 Ohg4KtnRgvkG0JL1NarIFtRNQmvDcxScct41LzweaF1ByHW4sQYZYaun167CrnuH5cqmdw61ARByAT
 nvX/9Xyc67AmcL+ilu7eODGT53kc+9tjjO1s+vfUhvh57Hb97UVdiS/0sKQrY08x4j+hD8mw7/fVjB
 +nU4MQ0QaugC92B2UqhbfZJF48BT6ctIKOlSHKoLN5IMV16BiFrVchG0YNmL11D1NJi4Z1S4zW2Dqi
 +7tpinHG8E6lhz6muNSg9xDx4xWr6TPtM+OSg4c3Qum9BdrUYCeoGgdy5HESuM9/ILf8bWtHciZfjO
 AjfI387TL6lruRpVcJ0+xEboaL6HKyXsMiTR2ZroEzjISA/DFTXl0Yl9Tk32cpwRBuA51/vKXq51mD
 53Wb39apPijHJIpYf0CIi0+3/jon2b+kKvo4HSnMGHaq9DSrQGXFluOFmDoA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_075715_942630_26065CEB 
X-CRM114-Status: GOOD (  15.20  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6357.yaml   | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
new file mode 100644
index 000000000000..837a77013d57
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -0,0 +1,111 @@
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
+    $ref: /schemas/rtc/rtc.yaml#
+    description:
+      MT6357 Real Time Clock.
+    properties:
+      compatible:
+        const: mediatek,mt6357-rtc
+      start-year: true
+    required:
+      - compatible
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

