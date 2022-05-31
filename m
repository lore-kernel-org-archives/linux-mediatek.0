Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21255C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 13:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dmxqeJIeOQqR2H2puC5g5t9b9Ayr3HcFSL+9VTR6FsI=; b=V6qLyN4oYaXnyt
	HAXjGPDZbrACu/JamguXsjTc6qkK+tDccS4WxBzRwDIFUfcqkixEfKq0ahSgiFDyis3xQGqDIL0xt
	n1O+JfAhBsnahTstXVMlCbsQGEiFeH7lSQFyXxyn/kVUQxnvdGLByMNArMwHXXEkU4DRBSWWDebO2
	gc8fP36e2IgjXEPNqMQtBjW57TQGecF8VhNfMfdBRNrUPe6BJl71FP86PDenVX8y1H6A7s0Tb/tk8
	40V9SRqDaUFKkZFXPeIbWCDBQhhOx/oJrDdJ4tFzwNlt5mPgEk78cu52dhjP3ldYvutjV649kEWDY
	yCM9zCUHodEQ8izGFXCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1XV-00Ax7O-0W; Tue, 31 May 2022 13:04:01 +0000
Received: from mail-oa1-x42.google.com ([2001:4860:4864:20::42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1XB-00Ax0O-26; Tue, 31 May 2022 13:03:42 +0000
Received: by mail-oa1-x42.google.com with SMTP id 586e51a60fabf-f2bb84f9edso18189551fac.10;
        Tue, 31 May 2022 06:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JSIsAVF9fVkTehhsFum2qIaOiKUkDyLxbABQD3He3l0=;
        b=hKih9lAOW8MRbbBGfOx7kiRTjz9QfEd3eSIsmozQoYetBrC+t6l22jSihqFRc12+Xm
         vm7gh7oP1PcUjMLC+CnfQsZGCRDHQzpDYCVe4SM1p5AKYCAg5+kuYV4IfOv3NmsBxCss
         7YG0ROpBieoxvaS2AVVkWoMEgzSjP8Q4MHJtD90Su22yuchHnMBHN2kYeHQjcAKUqPh+
         fcX1MaYIdZzOtul5ziWofq+/Kiip9n3rw51FxR1QAqdrDC5veq6VVK/6j9X92G9Hm8mp
         0N4LfQ2aWVG+WFVKCJfp1DpxXQSHB4/w8Ri2BU+4MT7fum/8hgvDqYI07FZLkP9abiy8
         yujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JSIsAVF9fVkTehhsFum2qIaOiKUkDyLxbABQD3He3l0=;
        b=iLLVLWhnhsktBIY8NcXxNCwhsvm5WcSUvvzRk/QngkiWB4clGlTej/beAYSrMHEGMm
         aL78rby+7l8YAxfcASTXIS6jjVP3JdO8YEfMwZKkCn8WknTieT8spzjG5azlLiz/gHop
         5wEhMRA2is8zDU/PpItmYUFeJUfZfvJ7hB4ykxzt21BhUbV3LjA41kOACqI5M6i2LgtQ
         nFJO5Kcza8ha1oa0T87GqVRH8sLHmrVYCeXuW9jvEVWmih+wFjkhEn49f4n4CNkMB7SV
         VFOYkafr2LJvSziGiPKuqLJep4T5nDKl3M83uzhWeJP4wbmXlMHms0XtziYEbzOGtpov
         v15g==
X-Gm-Message-State: AOAM532lEFXdJePaNIhmbO/QSQV53Prg/Gp0QSvJ6qO4oWqKxeTJzE4Z
	Yn1drPT9o9O/OYrOLfkcbJGIZ5uhLJg=
X-Google-Smtp-Source: ABdhPJzuEbDwbQWGn3CV/zE1vb9aceaeVtHBN5Ja0Ci/sA7YgIw7LlW8QzYq/gP7Sxq9ui9vU3D1gg==
X-Received: by 2002:a17:90b:17c6:b0:1e2:ab17:a8f9 with SMTP id me6-20020a17090b17c600b001e2ab17a8f9mr17018922pjb.68.1653995978760;
        Tue, 31 May 2022 04:19:38 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net. [42.72.220.172])
        by smtp.gmail.com with ESMTPSA id cm24-20020a056a00339800b00518142f8c37sm10751608pfb.171.2022.05.31.04.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 04:19:38 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sre@kernel.org,
	chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux@roeck-us.net,
	heikki.krogerus@linux.intel.com,
	deller@gmx.de
Cc: cy_huang@richtek.com,
	alice_chen@richtek.com,
	chiaen_wu@richtek.com,
	peterwu.pub@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [RESEND 05/14] dt-bindings: backlight: Add Mediatek MT6370 backlight binding
Date: Tue, 31 May 2022 19:18:51 +0800
Message-Id: <20220531111900.19422-6-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531111900.19422-1-peterwu.pub@gmail.com>
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_060341_133490_1FAEB9C6 
X-CRM114-Status: GOOD (  12.57  )
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

From: ChiYuan Huang <cy_huang@richtek.com>

Add mt6370 backlight binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../backlight/mediatek,mt6370-backlight.yaml  | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
new file mode 100644
index 000000000000..81d72ed44be4
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/mediatek,mt6370-backlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6370 Backlight
+
+maintainers:
+  - ChiaEn Wu <chiaen_wu@richtek.com>
+
+description: |
+  MT6370 is a highly-integrated smart power management IC, which includes a
+  single cell Li-Ion/Li-Polymer switching battery charger, a USB Type-C &
+  Power Delivery (PD) controller, dual flash LED current sources, a RGB LED
+  driver, a backlight WLED driver, a display bias driver and a general LDO for
+  portable devices.
+
+  For the LCD backlight, it can provide 4 channel WLED driving capability.
+  Each channel driving current is up to 30mA
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    const: mediatek,mt6370-backlight
+
+  default-brightness:
+    minimum: 0
+    maximum: 2048
+
+  max-brightness:
+    minimum: 0
+    maximum: 2048
+
+  enable-gpios:
+    description: External backlight 'enable' pin
+    maxItems: 1
+
+  mediatek,bled-pwm-enable:
+    description: |
+      Enable external PWM input for backlight dimming
+    type: boolean
+
+  mediatek,bled-pwm-hys-enable:
+    description: |
+      Enable the backlight input-hysteresis for PWM mode
+    type: boolean
+
+  mediatek,bled-pwm-hys-sel:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [0, 1, 2, 3]
+    description: |
+      Backlight PWM hysteresis input level selection.
+      value mapping:
+        - 0: 1bit
+        - 1: 2bit
+        - 2: 4bit
+        - 3: 6bit
+
+  mediatek,bled-ovp-shutdown:
+    description: |
+      Enable the backlight shutdown when OVP level triggered
+    type: boolean
+
+  mediatek,bled-ovp-level-sel:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [0, 1, 2, 3]
+    description: |
+      Backlight OVP level selection.
+      value mapping:
+        - 0: 17V
+        - 1: 21V
+        - 2: 25V
+        - 3: 29V
+
+  mediatek,bled-ocp-shutdown:
+    description: |
+      Enable the backlight shutdown when OCP level triggerred.
+    type: boolean
+
+  mediatek,bled-ocp-level-sel:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [0, 1, 2, 3]
+    description: |
+      Backlight OC level selection.
+      value mapping:
+        - 0: 900mA
+        - 1: 1200mA
+        - 2: 1500mA
+        - 3: 1800mA
+
+  mediatek,bled-channel-use:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: |
+      Backlight LED channel to be used.
+      Each bit mapping to:
+        - 0: CH4
+        - 1: CH3
+        - 2: CH2
+        - 3: CH1
+    minimum: 1
+    maximum: 15
+
+required:
+  - compatible
+  - mediatek,bled-channel-use
+
+additionalProperties: false
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
