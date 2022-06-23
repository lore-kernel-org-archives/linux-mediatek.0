Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EA3C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 12:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9mqbhZoMmE2UGeXYY/i+9oRbxA8kCBRP28mwUFzZ1c=; b=BNrg5UK1Tnjhvg+0QORGzt0sxz
	s6qtxM+mM8asIf2gyB6IBHGV0DTPbn2nhW1Kp+k2uqsoAsV9KRlU+1dsMiRvOdH36MG5plKk8FbZC
	l7vJu1abNeoNjCeAsDzC2Ezh9ILcAT9dynbQlj5z3Pv3QlZL326AC6S1d1xns9p5n7CUCt/aIQohX
	dO5d3aoDffOd8rSp6QcbyXXCcPeoC/y6eCliOO42SVXiw0OU07SRBlDk5KO0JTL8MvZ6ilDdBpjmp
	lqC/mRPcYcNuE4rrDYlW+cPTstDbANW9YkeAkW4WKEOYjgAMRTNHcpRo5hDhUqSPutdsUzabT88mo
	yhL11UUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4LWD-00EppZ-6N; Thu, 23 Jun 2022 12:01:05 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4LSs-00Enw5-M9; Thu, 23 Jun 2022 11:57:40 +0000
Received: by mail-pl1-x62a.google.com with SMTP id a17so15994520pls.6;
        Thu, 23 Jun 2022 04:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q9mqbhZoMmE2UGeXYY/i+9oRbxA8kCBRP28mwUFzZ1c=;
        b=qRTVC2ywxT1/qxvRJKAAT+rtvj71hyQm21AvxxJe1uv3ptO9m3pvGeREZp++I03axd
         30X4cyu3w2QD3JckP/q3Y+aB4TIXTj13WQlliKAzlE0gBQ2upW3h+cnCIwrICcsqKOMy
         8JguM9hpd8ReKzGu0CwHNwk5pptUEVfXuDnYLneCQC3HDQUaP6gFeKle7yHwLCKt7Bo8
         fX7VIBQt1pdA+Vh16LC+H0UZS5IRqZGPg9Cwmcy8nzxfDI89mrYnFg/KfuS01nTK8c1y
         k0qn3lz5Yn0AxnSCot09dQ0CvRD/ZYEMrp2oZSI1K/oV/coFmNHJNhL41LBviiijSqRz
         M8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q9mqbhZoMmE2UGeXYY/i+9oRbxA8kCBRP28mwUFzZ1c=;
        b=fwIEBmpMAAO150jf5DFfSsSGz7MvnxFRAIuNMYO+sFSrAqjRa+YPB/hJttTTc5+bcc
         SJq3cGyzCBpr2Ya5ckcJPPlTgeWOIR0+2x4rBQQcO5ZkXuy7umqSUtMHjnkHt9hf5gr6
         9u3WCCXh5Abda1Y7l6DNL0bV/lgYbCUa6aR8it1eGrQ1sCo4tZPoCw+iFeGzlErkvGY6
         0y1Z1KDlzUO6mEugl5f0V2BIjfKs4cMRzbZSTYv9a9JQPFoq2TsDP8DPksfD9Y/n6cCk
         9TGAEWvh7E7TWLbj3NCd7aBG/2Q9ZCTdVK8XDCLRqMibxWpD1ruB9o9LBKMC2xBEeu+d
         jBSw==
X-Gm-Message-State: AJIora9DzgXXsYjnjsbbBL8+AiPeUEfolpTA9pTR5w8X4if6i7DC2iUf
	ZP4JrbjQxL4UV5A1CcftmWc=
X-Google-Smtp-Source: AGRyM1vkUp4DtpsTn2hg/SKsugyEWOTzH7LnpFRhRrqqEuoqcKYA/inTXAsFFb1PabSzgpqRwIY4Yw==
X-Received: by 2002:a17:902:d58a:b0:16a:3139:5ff7 with SMTP id k10-20020a170902d58a00b0016a31395ff7mr16262584plh.118.1655985455815;
        Thu, 23 Jun 2022 04:57:35 -0700 (PDT)
Received: from RD-3580-24288.rt.l (111-71-94-93.emome-ip.hinet.net. [111.71.94.93])
        by smtp.gmail.com with ESMTPSA id t6-20020a63b246000000b003fbfe88be17sm15016516pgo.24.2022.06.23.04.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 04:57:35 -0700 (PDT)
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
	szunichen@gmail.com
Subject: [PATCH v3 05/14] dt-bindings: backlight: Add Mediatek MT6370 backlight
Date: Thu, 23 Jun 2022 19:56:22 +0800
Message-Id: <20220623115631.22209-6-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220623115631.22209-1-peterwu.pub@gmail.com>
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_045738_780256_E2376549 
X-CRM114-Status: GOOD (  12.68  )
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
---

v3
- Rename "mediatek,bled-pwm-hys-input-threshold-steps" to
  "mediatek,bled-pwm-hys-input-th-steps"
- Refine "bled-pwm-hys-input-th-steps", "bled-ovp-microvolt",
  "bled-ocp-microamp" enum values
---
 .../leds/backlight/mediatek,mt6370-backlight.yaml  | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
new file mode 100644
index 0000000..26563ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
@@ -0,0 +1,92 @@
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
+  mediatek,bled-pwm-hys-input-th-steps:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [1, 4, 16, 64]
+    description: |
+      The selection of the upper and lower bounds threshold of backlight
+      PWM resolution. If we choose selection 64, the variation of PWM
+      resolution needs over than 64 steps.
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


