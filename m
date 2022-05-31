Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B5BC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 13:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oYG4C7EjYfh+kElebz5FKcr4p81N8zXNy7w8D5DkdPU=; b=iefarGJV2QSqCl
	2kTfBOUovQRnAWjQbLN7OeX0DmEB2qoWBB1pOlE6Zw16ZUAISMr9m+TueNME9WtkHEofXO5O62eiX
	KGxNSdlzizA2QhQ1CBJqj6kFI3X1YPD933gbbKwE0/5cu0zFh6k+3OooI4fc1NY/Koh0bFy1IDVGD
	Tv4F6OfFS84kIcfoZt4/X+pMdzz3iDZ8vsjlih6ziaem3QTipqY3UlSfigRExaDMKXe6ZmSxxxZdA
	Ath1Q5MfG6Lkq20tOFrLXdRhHxkbCM0zYPvjcP/Np6gIO1HMVJm4PlJckIvNB1VIF6wMMOWnG52V7
	CCC7IwrdW688IiHb0SGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1Uz-00Avyw-MA; Tue, 31 May 2022 13:01:25 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1Uc-00AvpW-BG; Tue, 31 May 2022 13:01:07 +0000
Received: by mail-qv1-xf42.google.com with SMTP id a9so5030236qvt.6;
        Tue, 31 May 2022 06:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0sCP0jkvIeE07R1+RmlM9MygA92ez6zp1dtKYb5AvDE=;
        b=nXmORH65SpUjbhTvE2/X4vleVvzj6HP+vuXT2wdUKKV3uYzPcGvjjNbaiQXbwG8qzK
         uPv/BkQ+TkqS/c/pTyH3MEcmQTjImLnIAQwYIywCz9eE2DXVRcjWE2BFU0DaPWbtLi/6
         JIvwS/TtGLCo09S6g+UL6qkaUK2oeoCMkdiukx7QIlym1KreWmFGviLxAhPsUcZHmlSM
         OSkgJCSvXdBwmw4Gici4yb0fk/qD+ZeAOnsOxdBN99m27wOxY2bmru3yqNJ3C7pNDS41
         mUuOOYgxXC4RL+LYjsYCmgj2KzDBSJcjDqVJDm+H+8YT3Rf9D+evD4SgQIcZFSpWOpWa
         kFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0sCP0jkvIeE07R1+RmlM9MygA92ez6zp1dtKYb5AvDE=;
        b=eHtKMy2PsGXsEdDvHqNEyBarqzKoGLIKqd6YECwMIGt/fxI+hFwkTAzy+0ACKl6yHa
         IzSTuU6sdv0/vgQfYkPj4Gsky9N+oFREfNJDeHe+8Gc3+KV2koc1eXiNVbyM9JjGsagn
         203h47IMWhVZ7UAHPl1OMcGQfIfPs9hqtZUsZC0RjHpwRak+cS+OyE3AyAvOkrOMAU1f
         BHzDgHHYIFhsEtRnpBXjoGZI+pAi48Yfslk5DeTqqUFT8PQ4QC8sbbV7FSiCAqiYRfh5
         Ru4k9hZ4axd4S18aFGST6dJhMygpD+K09hlQHiqtCxAwOLx+WkzuPkJX1FBTf6SE96l9
         5/kw==
X-Gm-Message-State: AOAM530YBp2QxVuMULkK4U8Y6lAL0BfPxqBWfU5q40n0K/Z089jdWT6x
	F9pyUGICVbA2YZvCN51jv7FojaQw588=
X-Google-Smtp-Source: ABdhPJxJCbqOi6bcKGG2j8vTrhwclOHUg/eFfbPHJw6XvHla1B8QXbEiVn8d3/yztpo6Xy5/cUsecA==
X-Received: by 2002:a17:902:e5c4:b0:163:4c5e:5b39 with SMTP id u4-20020a170902e5c400b001634c5e5b39mr33395049plf.69.1653995961377;
        Tue, 31 May 2022 04:19:21 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net. [42.72.220.172])
        by smtp.gmail.com with ESMTPSA id cm24-20020a056a00339800b00518142f8c37sm10751608pfb.171.2022.05.31.04.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 04:19:21 -0700 (PDT)
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
Subject: [RESEND 02/14] dt-bindings: power: supply: Add Mediatek MT6370 Charger binding
Date: Tue, 31 May 2022 19:18:48 +0800
Message-Id: <20220531111900.19422-3-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531111900.19422-1-peterwu.pub@gmail.com>
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_060105_654420_21A8C4DC 
X-CRM114-Status: GOOD (  12.07  )
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

From: ChiaEn Wu <chiaen_wu@richtek.com>

Add Mediatek MT6370 Charger binding documentation.

Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../power/supply/mediatek,mt6370-charger.yaml | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
new file mode 100644
index 000000000000..9d5c4487ca9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/mediatek,mt6370-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6370 Battery Charger
+
+maintainers:
+  - ChiaEn Wu <chiaen_wu@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Provides Battery Charger, Boost for OTG devices and BC1.2 detection.
+
+properties:
+  compatible:
+    const: mediatek,mt6370-charger
+
+  interrupts:
+    description: |
+      Specify what irqs are needed to be handled by MT6370 Charger driver. IRQ
+      "MT6370_IRQ_CHG_MIVR", "MT6370_IRQ_ATTACH" and "MT6370_IRQ_OVPCTRL_UVP_D"
+      are required.
+    items:
+      - description: BC1.2 done irq for mt6370 charger
+      - description: usb plug in irq for mt6370 charger
+      - description: mivr irq for mt6370 charger
+
+  interrupt-names:
+    items:
+      - const: attach_i
+      - const: uvp_d_evt
+      - const: mivr
+
+  io-channels:
+    description: |
+      Use ADC channel to read vbus, ibus, ibat, etc., info. Ibus ADC channel
+      is required.
+
+  usb-otg-vbus:
+    type: object
+    description: OTG boost regulator.
+    $ref: /schemas/regulator/regulator.yaml#
+
+    properties:
+      enable-gpio:
+        maxItems: 1
+        description: |
+          Specify a valid 'enable' gpio for the regulator and it's optional
+
+required:
+  - compatible
+  - interrupts
+  - interrupt-names
+  - io-channels
+
+additionalProperties: false
+
+...
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
