Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BE8C63682
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 16:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qls/7PQ6bggvsm9yzB9zvzuPU1WcxWhnFLPSyVv4290=; b=4G475yrxK7JYGB
	o251AJa8nJyl0koJnuJ6iqQS6l0AGWxtdjOivWI80dnAIUjjYyufbHICnF7Ij/fdz7pHnCvNxkrzU
	GOuzoTi/tryD/gpGTu7On7qOb4fbVft5yhSpmvA0NDfVHwEht/6xSgKjIF7s3AeY8+MfDfFDKHckb
	XwHtZ8mnw/YOsnzwX0kg8UIyN2OEz/4RQDmjim92gUCXSjh2hh72SmpwHrdV9wyGw2+ie540wjQlN
	qGQXNP1yaOtG1uXU6fUtwljkDvUU8MmZJ50kwyzflpyJrZlUZtNBPAE4hkGMzIczhKsKizUeEemDz
	Ok+IMjLm5XxEMZmI+OKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCld2-00CoWu-Eo; Wed, 26 Jan 2022 16:58:40 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCkKU-00CKWe-IY
 for linux-mediatek@lists.infradead.org; Wed, 26 Jan 2022 15:35:30 +0000
Received: by mail-wr1-x42f.google.com with SMTP id r25so9758665wrc.12
 for <linux-mediatek@lists.infradead.org>; Wed, 26 Jan 2022 07:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tj0guoNH4q4novDmtBoOtGAutOOdll1d2XmoKB6eeJQ=;
 b=KLDGbuNMN9AsrespV+rifmAQkBzvZnJJSTQRykm8Ve53hmVPqybnoLNAuP5qZ0+pMi
 l8TgXuBqYOTW+Kcn8Ug6O/JBDHeiOmZ1STSMk8uLpWNMP/IEoea9IpUlj41BhVOKB2ap
 tDsUpRwhvERDpDD6Oj+8MJtSG6+0Pxzs1xKqQdg0KcDxfSh4yeasNF7mEVrb5KSKs+jW
 Ag1eYx6in8ux1Frg6+JlhYd3ZP707cWCoc1eUi7mUIAGWdZMK04VE6v+SLyrrh3mv5hd
 kzRqv5YwA9VyrH43ttV+O6+k4gsr058EB92IpujSfJeS3oWZmPbjYwHVF7AKUsr5rnhP
 Cz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tj0guoNH4q4novDmtBoOtGAutOOdll1d2XmoKB6eeJQ=;
 b=bgbNrmfNTekyBbFu8JBXH8mFV6BWTeVhkfyiPEF+k9ld5KhTSmQyXhEW81v/nKVPLc
 xoUGO93chdDrCC/IvHXRw0SUyZbhmCmZ906G6eV3ajbiCBUroqyxtb3NS/PaqiiKfH5v
 ixHHT19iLA3Y+JCtnwcNvE8q0ScV5yQ1ZlusIUwqU2rS751t/mOQBfIIY+GLlje/nPxj
 GebwL9AIdKRWMcoxDhAuB9ituKmkzog9SZO/PECQ2c/U+3xM7ray7gtE43Fry5lQgUje
 aLZ2eQmaBZ16LGroz/uTHV41Ibd/3D5fklmrMMo1p2yVWivu6ep5H3rgibjuU2wPauCG
 7KiA==
X-Gm-Message-State: AOAM532qrE0fK3RAR7lhOUwOFJEHKQRre57d7SBomZuB91vtOHW7wiXE
 0CDMfVIO0Bfi3Q3Coj4bD5IWdQ==
X-Google-Smtp-Source: ABdhPJxDVe28gY+kPTckZyTnR7HQC2FGkOhdqzuq6gh4Nnq6nenw4euktvSatUsoFs70CM1rv2AJTA==
X-Received: by 2002:a05:6000:18a2:: with SMTP id
 b2mr14030363wri.282.1643211324822; 
 Wed, 26 Jan 2022 07:35:24 -0800 (PST)
Received: from mkorpershoek-XPS-13-9370..
 (laubervilliers-656-1-151-143.w92-154.abo.wanadoo.fr. [92.154.18.143])
 by smtp.gmail.com with ESMTPSA id n10sm3360958wmr.25.2022.01.26.07.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 07:35:24 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fengping Yu <fengping.yu@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v19 1/3] dt-bindings: input: Add bindings for Mediatek matrix
 keypad
Date: Wed, 26 Jan 2022 16:35:17 +0100
Message-Id: <20220126153519.3637496-2-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220126153519.3637496-1-mkorpershoek@baylibre.com>
References: <20220126153519.3637496-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_073526_654251_51BCFCC7 
X-CRM114-Status: GOOD (  15.81  )
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

From: "fengping.yu" <fengping.yu@mediatek.com>

This patch add devicetree bindings for Mediatek matrix keypad driver.

Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 .../input/mediatek,mt6779-keypad.yaml         | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
new file mode 100644
index 000000000000..2c76029224a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/mediatek,mt6779-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek's Keypad Controller device tree bindings
+
+maintainers:
+  - Fengping Yu <fengping.yu@mediatek.com>
+
+allOf:
+  - $ref: "/schemas/input/matrix-keymap.yaml#"
+
+description: |
+  Mediatek's Keypad controller is used to interface a SoC with a matrix-type
+  keypad device. The keypad controller supports multiple row and column lines.
+  A key can be placed at each intersection of a unique row and a unique column.
+  The keypad controller can sense a key-press and key-release and report the
+  event using a interrupt to the cpu.
+
+properties:
+  compatible:
+    oneOf:
+      - const: mediatek,mt6779-keypad
+      - items:
+          - enum:
+            - mediatek,mt6873-keypad
+          - const: mediatek,mt6779-keypad
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    description: Names of the clocks listed in clocks property in the same order
+    items:
+       - const: kpd
+
+  wakeup-source:
+    description: use any event on keypad as wakeup event
+    type: boolean
+
+  mediatek,debounce-us:
+    description: |
+      Debounce interval in microseconds, if not specified, the default
+      value is 16000
+    maximum: 256000
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        kp@10010000 {
+          compatible = "mediatek,mt6779-keypad";
+          reg = <0 0x10010000 0 0x1000>;
+          interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_FALLING>;
+          clocks = <&clk26m>;
+          clock-names = "kpd";
+        };
+    };
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
