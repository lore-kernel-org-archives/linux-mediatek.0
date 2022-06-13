Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FADC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 11:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LowpXFxcuU0PZN0WojHQI4xGAYJaf1I4f68qVDVBvPw=; b=Q+mcfG2o3UGL7V
	I6vyKDS3EAAajYQDeUOpAbHmVmJt85c01p4VhNnj/Bz2ydcypFYlldodr0s94TxqHlHHcJgzxCEDK
	9Kzxd36t0s0LjlvyPsMSBi2c0i+svGVzW7lfjU1TjsK/vtNRQ4QJ/Joh5VkaiZ6Fnrvddasm6NQSA
	e5oYYvO/ECziE622UaZ8jIkDhr6zy1XQhED86VHioJRUMvUiUqloLEO+kl2D8t96yBfDo5oKd4EaF
	zCC+BES4+inmnaAuefXlgG/x0KDc5Zmf175G/qHcffbrrmbBkgSWx59//xL3u/+O8jKl9LX1FRUmO
	E2F42Fs/I6woSd5Dz9Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0i0e-0036Yo-Oj; Mon, 13 Jun 2022 11:13:28 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0i07-0036Gn-Mc; Mon, 13 Jun 2022 11:12:57 +0000
Received: by mail-pl1-x635.google.com with SMTP id t2so4820682pld.4;
        Mon, 13 Jun 2022 04:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5PhEd/hCsm+H0s/MYgcNh9Jcss9lmcQSw7vjFLzWUag=;
        b=Suc6iBHRFwzduJcDko660RQDxH8yM9viwXxb8kLirMiKU3L4sZb2X0B5lKMBVXKi5m
         C9x103BsKW1QIXl69OQHktmu0sQ3TRjuqgfyotPqL/6uHnOybIy+Nxkse1c0ISdmSoiF
         PMKWMq5mJY9d5yWnR/OsT/YTfccwN04V8IEw6u0XkdipUSHnBDYPmDC5o3Bcig2Rl2Mt
         H+xeFH/SA2v1DMTus00eyR3bLPHDR3rMPAjogql5vp2kyoddKeIIfYwgwNwhp0+iY7C7
         5UybtJdfXvabI83NctAt+Y1VE+5sSULv89R2w2dsvoy1D9tHlASeb57h1nIkXoD1B1In
         omug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5PhEd/hCsm+H0s/MYgcNh9Jcss9lmcQSw7vjFLzWUag=;
        b=oLWpIX4BjOZMLs7GPXwamEFyWbiAmq4r3sS3YC52KInYte4ZRHdDqhEDQyKT6KDDDx
         o5OV+RqeJFom2nEgvh1iWUgIfpwboRVYDOoskLtBBV8ycbYRXwhzhIOCNC2SsmYUrG8Z
         owP/8H8FC8q904ikedYkfZcSn9/MWhbh/9+RPdiz8zbHau/Mh4eD5XCAZ/LVKXRDHFGX
         RA5H7XvrqtbWrnB75LCvXNrSLZ7esHZW1pq7mupdKSfuNYchNlwl3Mh2KzP6XEpAtLtB
         FkGwhfZ/+qxmrexH9CiyH76KnLzI+CI0F43tkL07VxeQrXvt8Q1Nb/GVWRR87XqZINmo
         KDlQ==
X-Gm-Message-State: AOAM532GdGnHaNSWLEoTTiEO3+i9HBD428N9ExHGJmsSaWE8Qx4BnB9C
	j05miyQpo/9NYQUNwbUq50U=
X-Google-Smtp-Source: ABdhPJwg+KdzNhzT/AjwhzSIUVFwI7i5f/6BugmkfhPT6mWaHcgxcAdsTgruwXA2gFhNBmT+m6N0DQ==
X-Received: by 2002:a17:902:b68c:b0:167:95e2:f822 with SMTP id c12-20020a170902b68c00b0016795e2f822mr30806898pls.128.1655118774234;
        Mon, 13 Jun 2022 04:12:54 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-115-109.emome-ip.hinet.net. [42.72.115.109])
        by smtp.gmail.com with ESMTPSA id g17-20020a056a000b9100b0051b4e53c487sm5199989pfj.45.2022.06.13.04.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 04:12:53 -0700 (PDT)
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
	ChiaEn Wu <chiaen_wu@richtek.com>
Subject: [PATCH v2 02/15] dt-bindings: power: supply: Add Mediatek MT6370 Charger
Date: Mon, 13 Jun 2022 19:11:33 +0800
Message-Id: <20220613111146.25221-3-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613111146.25221-1-peterwu.pub@gmail.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_041255_782452_53CC094D 
X-CRM114-Status: GOOD (  11.73  )
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
index 000000000000..b63553ebb15b
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
+      Use ADC channel to read vbus, ibus, ibat, etc., info. Ibus ADC channel
+      is required.
+    minItems: 1
+    maxItems: 9
+
+  usb-otg-vbus-regulator:
+    type: object
+    description: OTG boost regulator.
+    $ref: /schemas/regulator/regulator.yaml#
+
+    properties:
+      enable-gpio:
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
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
