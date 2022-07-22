Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA384C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 10:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1u5oyif5xJc6tf3rWTCcNAXqF09LYJdHLNTlsfB9J08=; b=VOS21lkxe8uVkWaqc+5u+JaI1h
	DIr/iDVdtoLlW+zqJQ55rlUz40sWRu+zsfcmGYXZj9dJKCR7KwuY4Ufn0gBuJSbZgJA7SK6nXhHwH
	EauToEedl9VoaSk8Ih0cQdcZ2S559sWZA80+ltFFmYX+mmX+83SsjHQy3Se1dG0R2b1vz88H6jd5Z
	a0e6JEGvSK+VdSlaHS7ZDuszWI2dMjbU/WK+k/DwJgduilfDI3l+xEDZyxh5ybNQsOPGPB2SmI1TV
	AUkXVMH+8EBJ1hdWIVxSx+MfauW3kA6hvIhqtLGp4x8pZDzxp5r8KGON1IHNj6BTPwxKprhPOcPfd
	kceFLphQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEpsH-002fRg-O7; Fri, 22 Jul 2022 10:27:13 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEpq4-002dU6-FE; Fri, 22 Jul 2022 10:24:58 +0000
Received: by mail-pl1-x62a.google.com with SMTP id w7so4176749ply.12;
        Fri, 22 Jul 2022 03:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1u5oyif5xJc6tf3rWTCcNAXqF09LYJdHLNTlsfB9J08=;
        b=Va/ZFolxjqdQpywlXMH3qQZL5S8zFIPG3P6c8GczcatNDc97dsD4frMKg4pKf2bSLw
         t4Z/ajPZywogaaX/SPrjUSQgrR0YF0u4G74Z3R6AzAZUZ1LYpJtZWFlf++4AIA5VO6w7
         NArtp/LWZ0KwN5NetcxKDhFhh2v+8/+zLVL2tGPTRcsy9LjOdWga1JEwvIRotbBHYdcB
         Wf22Vn9w6cazHq/FqvtAUtRUQPnvEkHrFCZzQsxBMV7i2jMnIlTnJLWWzboimM4h+YZW
         mlmfW/A/FhCiv7FGQ4yu+uAAnYTuFjC70W+HDK/DMeeZ4qmsdqw8ySBpv+RnRdTMBc9H
         ohqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1u5oyif5xJc6tf3rWTCcNAXqF09LYJdHLNTlsfB9J08=;
        b=3SYx4D7E5nOAUaQwttSfOohsd32enFWt9g+ZSe2uT94cHviOAifoyBLNAOvriXwqpu
         TYR/W6zOP6DTg+ZU1aCkgX8x+aOgt48gIs/m0RGOlH82csIsnF5oBwPX0RR6mVAfKNJG
         uCD44YPIbLZj7PvSl3WKTpdLjHrYp3zM9HazM4IVo/6Svzv2NEUogV1MaD6VlIxhkaal
         Z+dUCRUiE8YgjEBC63hwvcLTP+xTLl1KfmT22UdeTBdBukZEOovRl5HFcPNX3BnaTs5A
         zZ6w//8z47X55CRAf+qnr1+pCdTvWvEvnTAyay7UZruvLXQ1/U+TzqkQP2S//7v9jcKF
         n4Lg==
X-Gm-Message-State: AJIora/hxwlcMMiMhQaU4cdCMHM1cGUdKtCtuJiDsQs55FPVxJV/04K4
	7w75aatIjd9BMy55X5BBUPg=
X-Google-Smtp-Source: AGRyM1v9vvDyM/BJsoE/KomA78PQu4wonZArH2/Vu134WD51JOcbLz0O0pmkPfaBUOGRbtN8YvutGA==
X-Received: by 2002:a17:90b:3b8e:b0:1f0:2a5f:b4b3 with SMTP id pc14-20020a17090b3b8e00b001f02a5fb4b3mr3285870pjb.135.1658485493500;
        Fri, 22 Jul 2022 03:24:53 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-73-82-239.emome-ip.hinet.net. [42.73.82.239])
        by smtp.gmail.com with ESMTPSA id h189-20020a6283c6000000b00528d620eb58sm3614551pfe.17.2022.07.22.03.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 03:24:53 -0700 (PDT)
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
	deller@gmx.de,
	andy.shevchenko@gmail.com
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
Subject: [PATCH v6 05/13] dt-bindings: backlight: Add MediaTek MT6370 backlight
Date: Fri, 22 Jul 2022 18:23:59 +0800
Message-Id: <20220722102407.2205-6-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722102407.2205-1-peterwu.pub@gmail.com>
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_032456_571439_A86A2569 
X-CRM114-Status: GOOD (  12.67  )
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


