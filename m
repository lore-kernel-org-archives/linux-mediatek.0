Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099F5ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 08:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmhuNMasJsnu7yKY0wuXEG96SXA8koMOiIgc3LgLhpU=; b=qd5rJXXBqBxdSu8AxC0u5oUxoZ
	1qbCysdNsxedZ0vPPfU4Z0jgj2M2k9As3a7ZflcMiTSyxgvNBu42W7nHhJhZQCpDAzj4EcUDVnrqp
	XAxMaId82NUW3WR3hnRYJc7r1kzHtEOitGroZ/6HjHJwZSeBaoekupupzqhdo5BxYKTmu/NID/MCL
	4gGuGpKJt+N2lM6TB0qp4g12Qb4wfAmiGbgBP+xxczYMrFGwI3OO1VtWyBCFJHtjMj79pUWHvrfQI
	mOsJxMlsrj1HKfK5TB+x7Kmf4GqEDaWSMNtSkybMHZr1OrG8Q4E8EwlktoXuU/T8BP3pUaaeJfwPt
	KpK0XVnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVU4n-00BJub-5J; Tue, 06 Sep 2022 08:36:57 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVU48-00BJPy-Rn; Tue, 06 Sep 2022 08:36:18 +0000
Received: by mail-pl1-x62c.google.com with SMTP id f24so10632665plr.1;
        Tue, 06 Sep 2022 01:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=pmhuNMasJsnu7yKY0wuXEG96SXA8koMOiIgc3LgLhpU=;
        b=QH4QxyHjiamJFT6P+kyrdG7hQuSZFo2jjJEAUzSmIQllYsrL22B4Rt84EopEjlpFTN
         t8MzfBYkJ81JZaQv9NP80EOsnyaplYz9GOn7Ea8RKTpNLtFWLUnOhJN4518+YidIXSHy
         xIac6dJQGaSDScA8yAngeYOGmt5Et8H47B7tzmjFH9OzY6d82UzpO8I3Ih7mG92er4YO
         IXWWCLLTTsrIFoEEJ6bZNJhXAphFTmTr+UsLOzZebCBdQK9SbMLZ7kxSaN3aMSD5MIP3
         fYyik3VoGfGkkbHGcYUyJl+y00HoB462tsYrErH/iRxf9bZ6dJmbeCAErO6YVUg0icLJ
         WbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pmhuNMasJsnu7yKY0wuXEG96SXA8koMOiIgc3LgLhpU=;
        b=c7SPVXlkr3ecfd/zQFk1TuNs3RdTfUJBRMQdZr+pGwQKuJpWQdeYqgCsIKmahR302x
         j5b/j+zOdMgG6zNYWqOCL2DOjsfK/ZRMYMDyoTqpOBKToTVjfuYJ+lmgzs7EUzWDF2W3
         JAjuSq4SkxZTwj7UJGa9/Tr1HKlgctOfh7NhHlfKIlSkSjaFEkSQ7fpWms34cJNP3FWh
         Y4yrr7nE5dfX0IPmZRFFmAQYplxszFdF+3HJ1C7qMgdkCWkBDxuMLjCLwXwX0E+pKFfI
         WNDYYS4RWMYQLidTPa6SjJoHr/+ZZjaC/P9ow+gMu77eViqMGBoNQQ6zMbdGAyHhROI7
         HRMQ==
X-Gm-Message-State: ACgBeo0LJ1VdlgPeko7eFIawW2IniTwLXev9+lj+4BNUxNNQr8fCrl80
	KZcUlcThWsEJwv5aglKkuXA=
X-Google-Smtp-Source: AA6agR71Io+TdKy+17uLo73iuzHfJUSRmcmrOhjsTa/TPvE7/GHX8ey+srRvKmpSWR05Dy9/E7Mdvg==
X-Received: by 2002:a17:902:dac2:b0:172:5f2a:f30 with SMTP id q2-20020a170902dac200b001725f2a0f30mr51502535plx.167.1662453374852;
        Tue, 06 Sep 2022 01:36:14 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-73-80-193.emome-ip.hinet.net. [42.73.80.193])
        by smtp.gmail.com with ESMTPSA id w12-20020aa79a0c000000b005363bc65bafsm9474506pfj.57.2022.09.06.01.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 01:36:14 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sre@kernel.org,
	jic23@kernel.org,
	lars@metafoo.de,
	broonie@kernel.org,
	mazziesaccount@gmail.com
Cc: chiaen_wu@richtek.com,
	alice_chen@richtek.com,
	cy_huang@richtek.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	szunichen@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v10 1/8] dt-bindings: power: supply: Add MediaTek MT6370 Charger
Date: Tue,  6 Sep 2022 16:33:57 +0800
Message-Id: <3184e9e5f59edf41788bb95e2ad496772dc70a4a.1662476695.git.chiaen_wu@richtek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662476695.git.chiaen_wu@richtek.com>
References: <cover.1662476695.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_013616_941838_C0AE7EC8 
X-CRM114-Status: GOOD (  12.15  )
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

From: ChiaEn Wu <chiaen_wu@richtek.com>

Add MediaTek MT6370 Charger binding documentation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../power/supply/mediatek,mt6370-charger.yaml      | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
new file mode 100644
index 0000000..bd09a0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/mediatek,mt6370-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6370 Battery Charger
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
+      - description: BC1.2 done irq
+      - description: usb plug in irq
+      - description: mivr irq
+
+  interrupt-names:
+    items:
+      - const: attach_i
+      - const: uvp_d_evt
+      - const: mivr
+
+  io-channels:
+    description: |
+      Use ADC channel to read VBUS, IBUS, IBAT, etc., info.
+    minItems: 1
+    items:
+      - description: |
+          VBUS voltage with lower accuracy (+-75mV) but higher measure
+          range (1~22V)
+      - description: |
+          VBUS voltage with higher accuracy (+-30mV) but lower measure
+          range (1~9.76V)
+      - description: the main system input voltage
+      - description: battery voltage
+      - description: battery temperature-sense input voltage
+      - description: IBUS current (required)
+      - description: battery current
+      - description: |
+          regulated output voltage to supply for the PWM low-side gate driver
+          and the bootstrap capacitor
+      - description: IC junction temperature
+
+  io-channel-names:
+    minItems: 1
+    items:
+      - const: vbusdiv5
+      - const: vbusdiv2
+      - const: vsys
+      - const: vbat
+      - const: ts_bat
+      - const: ibus
+      - const: ibat
+      - const: chg_vddp
+      - const: temp_jc
+
+  usb-otg-vbus-regulator:
+    type: object
+    description: OTG boost regulator.
+    unevaluatedProperties: false
+    $ref: /schemas/regulator/regulator.yaml#
+
+    properties:
+      enable-gpios:
+        maxItems: 1
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
2.7.4


