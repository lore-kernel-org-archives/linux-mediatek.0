Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE40C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 11:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1u5oyif5xJc6tf3rWTCcNAXqF09LYJdHLNTlsfB9J08=; b=I4uJaLwrA+Wtb5uaebXUTKlQMS
	crM1rEnrzdT03wNeNt4ip5YjRKxWgjSlZQ+mwFajAzmcrvaO1LG2kygpRw0jdpqSbK21P5Da5c7RS
	deYcQOcSd3poG3/Bczwol5TRQEkD4d4Gg9m9EYcJjCEe7WExjTeQdMpS7VzUPqHCGeq8/2tFhqpZa
	+LWZZlM5JsmedqGnmaguxNKtQOwT3hmb3gyMghnHOgMAq3OmqqJOvcAv2hQoj43KBXCoyKxzRxmZe
	1SDV4IjZ8PpEXXIErkiq12hqCc+o453iPVyAfvNC+nCJkjUMne3J4i8jSPKCtqridUVlrJSiPjUBy
	9nasj9IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJUi-006ZlL-3q; Fri, 15 Jul 2022 11:28:28 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJTE-006YqL-A7; Fri, 15 Jul 2022 11:26:57 +0000
Received: by mail-pg1-x52b.google.com with SMTP id g4so4166006pgc.1;
        Fri, 15 Jul 2022 04:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1u5oyif5xJc6tf3rWTCcNAXqF09LYJdHLNTlsfB9J08=;
        b=qF6pWmeF0M4udMy4fnaDKGqlHpvWfnrSleUsZ1R3LvzAA164EL4eUuh21No19uTWwA
         4Ncn12fEmplqmDy7Y1eNhwl3wGCNNNm2SdH6vTqBLEJ82FVKIhkbr2dJyuMLjYkk4AzC
         3+iqQmtO9Aubo0Xz6rxLxPZ/g10BuYSZdOwPIOykslr7B2bNNhQhS2jvfU7rYgeNxka7
         bbYB0AybPKmVCU2ZmVhxLoFB9J/GHwYRsfEeTmk0OpBlC8FAu+4EwMb7iHLyEHxJYcqu
         pIWkmCmfOIT2Fl0CvVjXYS7kjUcs+GbIFM1wdSRMcPXxDhiIhG6d3PLs0HfXut5ZbjFH
         KdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1u5oyif5xJc6tf3rWTCcNAXqF09LYJdHLNTlsfB9J08=;
        b=tQ7dGoFq9HIgP+kfcxJEQDdkYi8BTfAWXUa5T6AN8ytC/Y4X3RQBPiJRwyJ5JwQLPg
         +v9jF+GTg3yILqk/JQZnVJHHGDWqECrFFSjQ/CY4APJgw8eM061e85kXKQYIKslkdSBl
         W8ViJ6xSx6ZOLfw/AzlxK1wYb4tqV9iJwUgBY7rV23akHYqUPYRWzr+KIu16ihWlIGge
         zVJu11ti+JOvrlViG8LkS+W1ZBH7Wp3fdQl1EElPKv4ItL2KYe3tqKtED4C0afm8771F
         WkXKeXIxaHGszJVqkywxtUckgmFZE0Q6tPEpdN7vRvZEsi0UbOMgfYZWrpacTpKLBbBh
         xLig==
X-Gm-Message-State: AJIora+PTcLPe9vydFS8O7t3zcA+j1iJ3VZ21/vW4X7CkN1iwV6PQzJ0
	/swfW7B21rKyyK6ssJTMNlo=
X-Google-Smtp-Source: AGRyM1tn+1VSM0nJrDcicImUQfV+BJwlknSwvv/sZpqhQ8QXScW6TUatzKl62b43uUmVmtXsdqu/qQ==
X-Received: by 2002:a62:4e04:0:b0:52b:30f5:59b8 with SMTP id c4-20020a624e04000000b0052b30f559b8mr5028844pfb.37.1657884412477;
        Fri, 15 Jul 2022 04:26:52 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-159-86.emome-ip.hinet.net. [42.72.159.86])
        by smtp.gmail.com with ESMTPSA id a5-20020aa78e85000000b00525b61f4792sm3550604pfr.109.2022.07.15.04.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 04:26:52 -0700 (PDT)
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
Cc: chiaen_wu@richtek.com,
	alice_chen@richtek.com,
	cy_huang@richtek.com,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	szunichen@gmail.com,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v5 05/13] dt-bindings: backlight: Add MediaTek MT6370 backlight
Date: Fri, 15 Jul 2022 19:25:59 +0800
Message-Id: <20220715112607.591-6-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715112607.591-1-peterwu.pub@gmail.com>
References: <20220715112607.591-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_042656_389330_2F167D70 
X-CRM114-Status: GOOD (  12.48  )
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

From: ChiYuan Huang <cy_huang@richtek.com>

Add MT6370 backlight binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../leds/backlight/mediatek,mt6370-backlight.yaml  | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
new file mode 100644
index 0000000..d674212
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/mediatek,mt6370-backlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6370 Backlight
+
+maintainers:
+  - ChiaEn Wu <chiaen_wu@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  The MT6370 Backlight WLED driver supports up to a 29V output voltage for
+  4 channels of 8 series WLEDs. Each channel supports up to 30mA of current
+  capability with 2048 current steps (11 bits) in exponential or linear
+  mapping curves.
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
+  mediatek,bled-pwm-hys-input-th-steps:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [1, 4, 16, 64]
+    description: |
+      The selection of the upper and lower bounds threshold of backlight
+      PWM resolution. If we choose selection 64, the variation of PWM
+      resolution needs more than 64 steps.
+
+  mediatek,bled-ovp-shutdown:
+    description: |
+      Enable the backlight shutdown when OVP level triggered
+    type: boolean
+
+  mediatek,bled-ovp-microvolt:
+    enum: [17000000, 21000000, 25000000, 29000000]
+    description: |
+      Backlight OVP level selection.
+
+  mediatek,bled-ocp-shutdown:
+    description: |
+      Enable the backlight shutdown when OCP level triggerred.
+    type: boolean
+
+  mediatek,bled-ocp-microamp:
+    enum: [900000, 1200000, 1500000, 1800000]
+    description: |
+      Backlight OC level selection.
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
2.7.4


