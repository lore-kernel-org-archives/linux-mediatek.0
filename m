Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B09C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 05:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWWIzp3zgslezCNul6+nxXbGngGq0I4WyiRjetX+/Ak=; b=3Xkpqj5Edx6ODx4PpacSgcv3RL
	3r+zfn4vo1gh8o0soBIqSvETA5Jo4ZkY3ITFDSEsKNP1JhsbcWvjn1qes9loImFaawq6MLPpeS/vB
	OeFJq5JQEQqDTfKcKaLbmj6wgL3Xv2ihQAbMh+aMP3yUHWzwTdtkcJXuBqky01wPbSN/uNwsGv35a
	GrBl0IU4ENckbJ/GDjV4V6LHqcMSpseU8m4NxICiefCkG8EyF6JJt3fKBT+R3tXx/QVsRrCVZFHn5
	4DiO53imwN1RapkTgutcaYT31ZUoQ9W/YMk7n732BYNQCkEZskBkJ3QDKfLH39hnNnxt+dfyqlzb9
	9HBzceuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8EqE-0055Gy-8F; Mon, 04 Jul 2022 05:41:50 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8EoR-0053om-Rc; Mon, 04 Jul 2022 05:40:01 +0000
Received: by mail-pl1-x633.google.com with SMTP id d5so7615016plo.12;
        Sun, 03 Jul 2022 22:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yWWIzp3zgslezCNul6+nxXbGngGq0I4WyiRjetX+/Ak=;
        b=A/PWT5+nf7UihBmh5/6QOuqbLHvlsNKycwDpmbxUcdzaotHw/AtLjUtfCyO4hMUhhZ
         HhIFMz+ed4k/QoYrmKUqrLAr3SjooLZaOunS3q/P1a733hJjFsNRdSWSjEQlSgchE0Xf
         3aZvcm0Oqv0U2HeQhc4dAYdco87H792NaA40ZosUb4XxjbQZx7xCx9fycsC+VdPmkh5h
         DXObLLs8j+6ljVvlQIoBfC2xQQWbdWoJnHthNZ1W6HLlwDZLHSolkmNC7gQlWNMGYLjZ
         xxmRHL495X9uhp9NRKQKN4Bc60ZWQCtnU4H2I4iJxqzkkPdfCemd9UcCzqoLobu3VdA9
         fukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yWWIzp3zgslezCNul6+nxXbGngGq0I4WyiRjetX+/Ak=;
        b=lPWzLt/3fvqu9lRoQevI2F7ImQ4AFjCWqXlb+yhhUHttfVCyIBC/juhDmpEJlwt87v
         1Elfs4shXzHDD4nQaTgd2CVUF7PINtReVxLckM0sJHbRoob7FWtpVwkhQdx5D7/HQ7yn
         JwGEekVkxCfMaRo0CNdMJGTPeUOtwLqOmubSB5BdoP9gWUGGqF6Co37nQL2KgYpU+O3S
         lDJC4VGvj+6hSwty+5ccCXrdItt0EO7Arpsa1QucLY3PojL9eleR/cyXUbFj8+/GzxPX
         NrzEgU8111f3Lbn0hnTvS0quxXj14dNGIX3rOduDqYjUVzp4SbFV1B/VKLvyz1rFgNDZ
         sEYg==
X-Gm-Message-State: AJIora81woj5ItFDOnmkt0/L3ZaziepXmKU3KYTXrX99MAQ0j44UVYkg
	NkAqCr0bqV0dqnkyi+7AZcU=
X-Google-Smtp-Source: AGRyM1tozWyY8xBgkbdKS0PGZnGE2mbk2Gyiy1oNesrM5UXVUaAgssbgivFn7zfZmUjgy2Vpl7duEQ==
X-Received: by 2002:a17:903:11d2:b0:167:8a0f:8d4b with SMTP id q18-20020a17090311d200b001678a0f8d4bmr34505404plh.78.1656913198762;
        Sun, 03 Jul 2022 22:39:58 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-4-255.emome-ip.hinet.net. [42.72.4.255])
        by smtp.gmail.com with ESMTPSA id h24-20020a635318000000b0040dffa7e3d7sm13904507pgb.16.2022.07.03.22.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 22:39:58 -0700 (PDT)
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
Subject: [PATCH v4 05/13] dt-bindings: backlight: Add Mediatek MT6370 backlight
Date: Mon,  4 Jul 2022 13:38:53 +0800
Message-Id: <20220704053901.728-6-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704053901.728-1-peterwu.pub@gmail.com>
References: <20220704053901.728-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220703_223959_977279_F24D1088 
X-CRM114-Status: GOOD (  12.86  )
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

Add mt6370 backlight binding documentation.

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


