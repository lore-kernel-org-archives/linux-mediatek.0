Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B45C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 12:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oYG4C7EjYfh+kElebz5FKcr4p81N8zXNy7w8D5DkdPU=; b=03+gfVoeIYrKsF
	ynP77+MgdyQxn3sRn9bAfBS4cWOavMOZvcajn8P4aOCE7zHkubA1W56PUiNAIsBFdoJAKowsuhXmS
	HsF3AUhaxsptjDCEp58Mz3fr1/AVpELkD2oi64J4OI5nvXtiEsqmBmdJkvqhQO6KbmeXKGQbTnyFN
	zX/+0l2om/Nz2vJzY1ufm7yLKDkzItL5A//PTDrlGxvZ2nk2HG3QQ0yliyhJFiUTHdYAoSdHOpGu0
	dBLpPji4JnoVl4G75cxoYw28s1ojc95UrLO1RyDw5PK0Uimkafqtt0mYykm5IwPN3oDNzS88gJPMg
	WWiIj7boV+eSxSnG9E5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw0td-00AiFw-Uj; Tue, 31 May 2022 12:22:49 +0000
Received: from mail-vk1-xa43.google.com ([2607:f8b0:4864:20::a43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw0t6-00Ai2i-C9; Tue, 31 May 2022 12:22:18 +0000
Received: by mail-vk1-xa43.google.com with SMTP id j11so6116679vka.6;
        Tue, 31 May 2022 05:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0sCP0jkvIeE07R1+RmlM9MygA92ez6zp1dtKYb5AvDE=;
        b=DM+UlGGCjjymtrinrTEP42yV6EtngTwfbFuO4RgI9RVddp2xprIV7OuizKvg7qBR4O
         yIiFxAwshb/oTw70/jqCpd8M2TuV0KBl489zPAW4HS5GHYOH6OuMyWh9l4U+i1CWb9wL
         RgN8AqpCbw+KLvXMfNKTnT+/CWROCAOo6uq8OJCg0fyxV4ZUXsaZlyER99RX44wfwpjf
         3P14iT3Ut2atvcFu3hWGrzj4/iORfBfX60nHVWae2fwDsL6zle/FSBAeoO0UdB61etJK
         i6VtDrYTEG4JwdEnrXONYBo5IygUdxTfY31ykJ8Cb2KI+syC8Owu19/mTbYV23++OmYk
         Ll2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0sCP0jkvIeE07R1+RmlM9MygA92ez6zp1dtKYb5AvDE=;
        b=Vpid/BD3Dtkdjt1SSnjOqph5MdtgvBaaPHv6O1uzCMVqnZ/XP3j7Hts4PLJOLF+1GG
         otT3SypTAJ5vaDd09pbxHWlaVjlAiJP5jk7sm5iQUo0lYdXSkVAdtUeTBUl0ksK4j6vv
         rRdgEEnzACpWhoyHKSmUyUuOsluFxNK42piFlmDpAbn3OqUaoGo0+8IwM+pBh4jgqQ2r
         KtjoY9QXMWV0Reqy8NPlMpt8jaVo/qlDLqZaxIoibQlGlxfCfscNnaWPPM3qBkPasJga
         w/QoF8id4AWwBOQua/oYqeHnwQiuR388nXn9TI/bYOoodLHKWwgKKvCQrXBU5wUgyiYC
         7l1w==
X-Gm-Message-State: AOAM5335xRWtnZcrIINsXevmsg6sJ01Y2jW7TkiyWhvYCeSjsj6Y185W
	qAjm4r6BIBlOUcFz4UDsocJobfo2Q5Q=
X-Google-Smtp-Source: ABdhPJxfRfYt0nV+dDr20o7LwUzTYTfaMj1alulfLmGKs8iiemw4ejZEwn2KjluWB+6QCEcQ6O5kpw==
X-Received: by 2002:a62:d045:0:b0:518:404d:9dc8 with SMTP id p66-20020a62d045000000b00518404d9dc8mr59548174pfg.60.1653993053493;
        Tue, 31 May 2022 03:30:53 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net. [42.72.220.172])
        by smtp.gmail.com with ESMTPSA id c1-20020a63d501000000b003c14af50631sm10216519pgg.73.2022.05.31.03.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 03:30:53 -0700 (PDT)
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
Subject: [PATCH 10/14] dt-bindings: power: supply: Add Mediatek MT6370 Charger binding documentation
Date: Tue, 31 May 2022 18:28:05 +0800
Message-Id: <20220531102809.11976-11-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531102809.11976-1-peterwu.pub@gmail.com>
References: <20220531102809.11976-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_052216_440088_E3B0D38E 
X-CRM114-Status: GOOD (  12.28  )
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
