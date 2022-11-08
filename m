Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE75BC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 19:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4S2wIE6tyE7Z7qbLSq9JMEZ2ArGmgl84IUzu0C5hxo=; b=rhdOpJ5NoNGKuWVarV4E8Wr9il
	g6kmUWpzmIa27nmWCmRfAS+MCND0NGNoc0tJDzZVF3npsBO6H3Xq9ncmubKUOXYdJiDeek2ktgnhE
	b1ynWHy2p7pDhNLT3D8/6/TIjgNWH8tkyMLD8RvvpLsfJLjXiXcFORVU0vWbCqWKF9CxSgY2Nd/0D
	YyDrGrH67x3TMTC6zRzMeoiH5PeQobk63bXCKtv9trBYumMyhs6tjgOKm9vDrBohXv9AIzN6h8FQ+
	wlnOeMyhcIZpmqxBcIdrcis4oH9C97B3ZqyPsCQcVHK6IteQ+iF9txPRI7SgNnfR9KVq7jOp+3aXM
	UrdCmQnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osUXH-007wAQ-MX; Tue, 08 Nov 2022 19:45:27 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osTa6-007ZqP-Cv
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 18:44:20 +0000
Received: by mail-wr1-x436.google.com with SMTP id g12so22377269wrs.10
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Nov 2022 10:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4S2wIE6tyE7Z7qbLSq9JMEZ2ArGmgl84IUzu0C5hxo=;
        b=Y18ug5W0xJ8M2ZFE/O6Dml7V2y527QV4+8AI560P/BOLhBwON5i0Tw/UMHtkCbl2nP
         Xe5PsLzdW5Qvg08vLvDU3C3XoSuvti5dZy2kWVEjEQqr1c6hJ/mzKvXE49LTiYnWl53d
         KY7FpivWfmO47FbSByagIKOeEy1qklqwB9lzCzzg66oJeb5MX+TMKQfrB+4S2s3NdLfM
         tLBVh6xDA2/STz36yzH8SgtliR4TiekMByVoHtCWDF9O+4Ao9aRAb8RGL/CkLBD2QPYH
         kF2BnyIy9128m0WtWDR5K2nXao38GXXT6fsJvas3c2QsvTqUnApeNS5fZIWsm6/wYTnd
         p8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4S2wIE6tyE7Z7qbLSq9JMEZ2ArGmgl84IUzu0C5hxo=;
        b=Klu/zYLWPyH28vdkoiuGclAflw2zjhW6cmEW+aJSur1xqNoxG7MJshzJsULNWhgZ3Z
         dJb7WwBCeQEvppXnJdxtOna2xspDmzWnOfxGECAZMcgLTwMSkNnhw5ugNx7daLzADio8
         bMMn+zPLG3vOToBoJw88LmSvHqM+4utdy6lM0fEQV7nVctY9C3QqZCU/pPR8CmPNJhPp
         xUoU5NaoAooiXQ0BhVRdaJqY/ElNVdvNh1kz88i4FDYDI+jsuXHOsBTAYebzZ0B5gGH1
         qynasaCSHyalAlQXnwkV9hASG1X9uU7yMf4ahxTxIBATRJLVS441URHMHqu9GtcCY8sc
         bJyg==
X-Gm-Message-State: ACrzQf3chJI2iDXsBFBZ40uTkgoNbxSfHXiMGjo9hH/wQgGSWfcQEHT0
	fLR20vI7/JVHK1kpjuOvCuvnSA==
X-Google-Smtp-Source: AMsMyM5Ccq1UQUqi9rNjGygn/pMbp/xasjQS+U+T8va1YRV/PnQrpGPJoYqD4qXFi+5S/YCMWmNHOg==
X-Received: by 2002:adf:f701:0:b0:236:e2b2:3b69 with SMTP id r1-20020adff701000000b00236e2b23b69mr27104551wrp.532.1667933056836;
        Tue, 08 Nov 2022 10:44:16 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id m6-20020a05600c3b0600b003cf6c2f9513sm13564009wms.2.2022.11.08.10.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 10:44:16 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 08 Nov 2022 19:43:39 +0100
Subject: [PATCH v4 4/9] dt-bindings: mfd: mediatek: Add bindings for MT6357 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v4-4-5d2bb58e6087@baylibre.com>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
To: Fabien Parent <fabien.parent@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Chen Zhong <chen.zhong@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-leds@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien Parent <fparent@baylibre.com>,
 linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3744; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=MbwBHR/2mMa0XKDOyJjMyD4H+RezYnxtaWTa6yRYsv8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjaqN6aU0sSWGEnsfMfHfVFyHyKDwvQ8KraqhxKnN6
 R4u3soWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY2qjegAKCRArRkmdfjHURYtbEA
 C7GlgDFkDrcsYCJ5KKJkexnAlem/nnnMTjuS7nXgDPhq1edcxjZdL0TxW/XaCExibNMtC6/gajNxxB
 gxws2eBOERFMjzVOHjUdh2xNklErHnuBEWqjh7FKRCsUVkQ9ydVNMbYwwmyA1tC3CU5HxQwQ7J8M4L
 VTQczexFohJ0+y0oG3OdKpx8qkyEDUtyhqb+urR5doCEaq/Ath0NAPwzukDiL04cg2UHpE8GJgoe+Q
 x/iXkZfw9gsCmAh9xnTH2uqO5mPjQXhTzIM5AmlvcJGAS9wVf8O1fZkDuHr+nGFeNKewCjxnzFXl/e
 BHn7VgUt6dBadMK7YHm3E2DXETA0badpK7r4LdHkNFCA+8K/751FS8TulQv8QDmh57WOm1wRA/HqPu
 8RI74f1on4ucyZMQ7LS9GBlheWd4DQtFTgZtgfGoppwECLoDVAUM5+ptWLbcKcbqb8seDGxvEF08Cx
 EO2SI1Ev56nfBRRYZA0st/yVFto2P1HPRmhFewfzDRqoyQQQIpo+F1XTQWHaq/kGN1GMH8QkMy3bIC
 gPMpBfhhjX3RlL3H2pdRZPR/BYjodJoqQwg6NR72MxjnNd5GD7O6mHVhKjYjj/uue5MvLw2/sOlc/H
 TquTcrWAtBHpk7+1n//WvF6rwlY5O5NvVxHMNgYRNh89PK1ltQ0+Gi+wufmA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_104418_459669_0988A4BA 
X-CRM114-Status: GOOD (  15.78  )
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
 .../devicetree/bindings/mfd/mediatek,mt6357.yaml   | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
new file mode 100644
index 000000000000..7b421f21d3f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6357 Multifunction Device Driver
+
+maintainers:
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
+  ../soc/mediatek/mediatek,pwrap.yaml
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
+    $ref: ../regulator/mediatek,mt6357-regulator.yaml
+    description:
+      Child node that specify the regulator.
+
+  rtc:
+    type: object
+    $ref: ../rtc/mediatek,mt6397-rtc.yaml
+    description:
+      Child node that specify the RTC.
+
+  keys:
+    type: object
+    $ref: ../input/mediatek,pmic-keys.yaml
+    description:
+      Child node that specify the keys.
+
+required:
+  - compatible
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
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

