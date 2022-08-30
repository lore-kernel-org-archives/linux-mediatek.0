Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A91ECAAD1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 03:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4cHOvbmWb+911MO4SmchvUcHWTMXjifX3L1tpUmfy0=; b=Zst0eFj5uuGf++WtrOEEOVQFME
	/dbDLHw9u7YBa2sW3DMLpqkUtjKDyEHxA2HwxUIlSrMYfCqKuJH89nIg6PH5jeyeud/vBER4oaoGp
	ZIvi6JdAWCxgKUSAr+m9FERuUcsvL+6K0/M20KIw/mWjWw9qBn+kBd/BhM7/LyS4BmMXNAQexkYH8
	WHsOU9qf6QK122ilsoYShs4iw4e0QSeliKbwCCiPaiutjYXutT76bilswI7A5oEeITfiDnKUHkk2b
	kpmu8k1ZvMn7dobsFu7XC+s02iSsrBiozYiOf/NzZ5N6KuuHs94/J1j1Dnmw3cjI4D1QPKYnC035x
	IGfbI/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSsBE-00Dqgp-9X; Tue, 30 Aug 2022 03:44:48 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSs8h-00DpfW-Cw; Tue, 30 Aug 2022 03:42:13 +0000
Received: by mail-pg1-x52d.google.com with SMTP id x80so5941904pgx.0;
        Mon, 29 Aug 2022 20:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=X4cHOvbmWb+911MO4SmchvUcHWTMXjifX3L1tpUmfy0=;
        b=ZuSkZzXBd8rUftipY1vxAlKtDCmCwp0gx5Vlve62n0mArFzoXp82uhvAEy5fOVUchE
         PT6fM4yOE9mC1Wvg1E5AZR/q9zSyH132YX9IeHyqEcaWnuQHTW4sDlCuI9f9Daaacmit
         61pHdm+ClMCCbEbTk7UE3kXFJiDMkF1yHWzQsnvyeWY3jJ3aFnUBwJ7vzzSGEEj/RoHN
         QZyfkXaNJSrhZmaodBqRL20AplIcHSoDH1gGG8p5hfszVTznXs9oC7LArbvXBs3ehiFu
         bz0DnISpQssJb5vAmwkLhQS2orYk5tHfNAkUzeeM8PDry8rPB0M1+PtmG17VRlpQTLpM
         BAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=X4cHOvbmWb+911MO4SmchvUcHWTMXjifX3L1tpUmfy0=;
        b=kCMwlmXNOfW4g61SqWpO+SLnJc6+7QUUruXCtKvM8MrXoPrdde6FfSs71hnJbTTEQV
         BmVRmGb6vQkcd2jH7HVlvlc0akKDcno8m4oA3TtBNjlN4mFE2tYyKg86lBydAA/XICg6
         8wtqrAxpiyWy9gox4GCNDFELi6ecPUEoxzKJWZ0qy1IXKJgWYUOYE0UaeYFAgmToBDKF
         xcUKgyviKPzd2i+MjavQNT7ZE8m7k1F67gJBKjQg+yREEDWMuV8UID8J9DcFaROf/DTm
         hqh5IKtZ4QIbxBNYdyB4eNGT4HAWyGki+mMdGoFKoKuNMsD/vzAYHcSaKe2aAVRK2Lro
         +nHA==
X-Gm-Message-State: ACgBeo3xT5sWOdkoSabsBsyVOLG01jTqrSkMKYC+1PejOkiUjIxAZ7aL
	R7lwfRyh4E+hzY3p0V4QfPA=
X-Google-Smtp-Source: AA6agR5yfXHKV/ZMVsIC7f+ZHuhHVj+B8JofiTynrl5gxm/iZ0On3nsZl4Idx5tsMgA3Bez9c1pOJA==
X-Received: by 2002:a05:6a00:1ac7:b0:52f:4e43:5ace with SMTP id f7-20020a056a001ac700b0052f4e435acemr19591897pfv.59.1661830927793;
        Mon, 29 Aug 2022 20:42:07 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-77-88-242.emome-ip.hinet.net. [42.77.88.242])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ecc600b0016ed5266a5csm8439577plh.170.2022.08.29.20.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 20:42:07 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sre@kernel.org,
	jic23@kernel.org,
	lars@metafoo.de,
	deller@gmx.de,
	broonie@kernel.org,
	mazziesaccount@gmail.com,
	andriy.shevchenko@linux.intel.com
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
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	szunichen@gmail.com,
	andy.shevchenko@gmail.com,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v9 04/10] dt-bindings: backlight: Add MediaTek MT6370 backlight
Date: Tue, 30 Aug 2022 11:40:36 +0800
Message-Id: <20220830034042.9354-5-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220830034042.9354-2-peterwu.pub@gmail.com>
References: <20220830034042.9354-2-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_204211_507242_0661C960 
X-CRM114-Status: GOOD (  13.17  )
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

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../leds/backlight/mediatek,mt6370-backlight.yaml  | 121 +++++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
new file mode 100644
index 0000000..5533b65
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
@@ -0,0 +1,121 @@
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
+  capability with 2048 current steps (11 bits, only for MT6370/MT6371) or
+  16384 current steps (14 bits, only for MT6372) in exponential or linear
+  mapping curves.
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6370-backlight
+      - mediatek,mt6372-backlight
+
+  default-brightness:
+    minimum: 0
+
+  max-brightness:
+    minimum: 0
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
+  mediatek,bled-exponential-mode-enable:
+    description: |
+      Enable the exponential mode of backlight brightness. If this property
+      is not enabled, the default is to use linear mode.
+    type: boolean
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
+if:
+  properties:
+    compatible:
+      contains:
+        const: mediatek,mt6372-backlight
+
+then:
+  properties:
+    default-brightness:
+      maximum: 16384
+
+    max-brightness:
+      maximum: 16384
+
+else:
+  properties:
+    default-brightness:
+      maximum: 2048
+
+    max-brightness:
+      maximum: 2048
+
+required:
+  - compatible
+  - mediatek,bled-channel-use
+
+additionalProperties: false
-- 
2.7.4


