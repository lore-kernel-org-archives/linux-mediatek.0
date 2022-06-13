Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76210C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 11:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ly+mYWeevYIpogqhyIhFrngQyk4igQaXM1N2GrVSrjs=; b=a264LVan8vHELh
	xNkdi2dEtKZmUdr1S5L3tupo6eA/g3vhjhzCZTclxilRM+F41h8PrLmxpgu5v6+4nW7D4JS+lALgK
	00pf4R09QnEsg73RjBcLHZEdRH0dikcY8gS2tnzdI6So8hX902RH4tvTZz0tVZm4oPJ9d1yySO6rH
	XmPyHdFoYsUlONAZymks08R8SlgKIxEZ00WuMVTBL6QjpDxPvd91He6YBS62Z2A3kPVhNNJGRV5MQ
	Pe2DP4500Pdy/yIjDBCdrJXIKZDHe+RxiYmvYRWmYhbheho9WpbNXjBjPiXIn5h2ZWC4kFz5jRj9A
	L+6prpd7UcLU7bwJedSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0i1u-0037D5-EG; Mon, 13 Jun 2022 11:14:46 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0i0K-0036N1-04; Mon, 13 Jun 2022 11:13:09 +0000
Received: by mail-pl1-x62f.google.com with SMTP id u18so4828027plb.3;
        Mon, 13 Jun 2022 04:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PNKL5EoQe9yNQuWSwGWw4HpwNtWpyytf5bVWi/2uSYA=;
        b=irUn2d6BF9k7/P7W7MnusQ2y6EAb7Yx6AVX6GzE3wbyM8y6CUrUTih/qiJ1axCO4AN
         B2t588m6wRAAs2572apEbLnl8l7NhOGqetTjQevrbCL2OI1fwdz3qLC3pbGxUC7Wzj+z
         hXx4vu06puhWg8Fepra01DMfBkXJvctaTbfCj6uJzYnX81nUXuhrzz8L9SG0plqiJUjx
         CbyZovfivyzHblzLa+MKTC5klfKuLd9PmZNbujf2eJRhcNzpnIWKJuVjJ0H8YhcRqFNi
         ufGgVrB5qORousrYENy/DpjK4bGU7S7YySVXIlNac2qOkBMPtz1ZI3xQ34OlX66VkMLE
         qhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PNKL5EoQe9yNQuWSwGWw4HpwNtWpyytf5bVWi/2uSYA=;
        b=U10XKzv91R9+8M+qze3snkvdeR5OTBUg6IT2283g66dY04UgTACv0nAo9lJrPbkvuu
         oTWD64VL8QaXYN148ME/y3p9PTE1tWVwgZlNYVwRqc6KFN1iATab+sIu1FJmhrU1vqYt
         2NYY1koaBSK54+zoPF5v6mB33RigR+ro2W5012NQsqzuhWiO764PlHT2cvRo7qFGyM1T
         T2SEwD45ErddkAO2PQMxwUeUBZOMED8HGqzaBGGMLbPF/9++MELlcNP6xSCAf9P/iwAg
         tSciHGUdU+HpFMH0q/Cuz/xbLsS2Zz6ViCaIOeWjgTyoLXVyzgGahG6s0tbY4iCr7C1m
         ryGQ==
X-Gm-Message-State: AOAM530csQ9tjBmz9Dg03b/ZSDfcfiUq5qlpyCCcEzZsmYiB6QdkgHs9
	ja94VrZk+ExO8s3RurXL2xc=
X-Google-Smtp-Source: ABdhPJwA0uTKm6Harp/uy6rve75bJedJD8dBySejgYRVOmkwylT9noUd8UmThrqE7/9jk0JuIyuc6A==
X-Received: by 2002:a17:902:8d98:b0:168:a310:3ea6 with SMTP id v24-20020a1709028d9800b00168a3103ea6mr23326338plo.9.1655118787075;
        Mon, 13 Jun 2022 04:13:07 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-115-109.emome-ip.hinet.net. [42.72.115.109])
        by smtp.gmail.com with ESMTPSA id g17-20020a056a000b9100b0051b4e53c487sm5199989pfj.45.2022.06.13.04.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 04:13:06 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: jic23@kernel.org,
	lars@metafoo.de,
	matthias.bgg@gmail.com,
	lee.jones@linaro.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	szunichen@gmail.com,
	ChiYuan Huang <cy_huang@richtek.com>
Subject: [PATCH v2 05/15] dt-bindings: backlight: Add Mediatek MT6370 backlight
Date: Mon, 13 Jun 2022 19:11:36 +0800
Message-Id: <20220613111146.25221-6-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613111146.25221-1-peterwu.pub@gmail.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_041308_139134_6BFEC2D1 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: ChiYuan Huang <cy_huang@richtek.com>

Add mt6370 backlight binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../backlight/mediatek,mt6370-backlight.yaml  | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
new file mode 100644
index 000000000000..25a05e607e83
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
@@ -0,0 +1,107 @@
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
+  mediatek,bled-pwm-hys-input-bit:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [0, 1, 2, 3]
+    description: |
+      The selection of the upper and lower bounds threshold of backlight
+      PWM resolution. If we choose selection 3 (6 bits), the variation of PWM
+      resolution needs over than 64 steps (2^6).
+      value mapping:
+        - 0: 1
+        - 1: 2
+        - 2: 4
+        - 3: 6
+
+  mediatek,bled-ovp-shutdown:
+    description: |
+      Enable the backlight shutdown when OVP level triggered
+    type: boolean
+
+  mediatek,bled-ovp-microvolt:
+    enum: [0, 1, 2, 3]
+    description: |
+      Backlight OVP level selection.
+      value mapping:
+        - 0: 17000000
+        - 1: 21000000
+        - 2: 25000000
+        - 3: 29000000
+
+  mediatek,bled-ocp-shutdown:
+    description: |
+      Enable the backlight shutdown when OCP level triggerred.
+    type: boolean
+
+  mediatek,bled-ocp-microamp:
+    enum: [0, 1, 2, 3]
+    description: |
+      Backlight OC level selection.
+      value mapping:
+        - 0: 900000
+        - 1: 1200000
+        - 2: 1500000
+        - 3: 1800000
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
