Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDCAC00140
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 09:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/AE193goh4VtzXK5TNjfSKGI7YjyV9LcV+9UPyLd22g=; b=lhHf21/PaaTFdPnD7NAGcEE7C9
	6XYggXe5QXinpnkQk7KEiDnHb2opLNqOEfRDwTiyUpjaL4vQgh2reQVWvkpslQb3nfR6OzkNn6Wvh
	xiam6RCd1DlE7SlIS4dv89F196YvYGat8Q5LWArxhml/0XlyTzAmOX5cMMSUL6HvyOZbJFotRk2tl
	WE3X9R4Iw44909dU71McIse9DGcggiOa2qD0wNO+Q4gSQ8nmmjrE3781Y2IhxNzIBTiqhWZlU4Ga7
	e7nGq7ChJYKjVNGSx23C3YgyyvuOQxpLvkB5kFz/u9JJ20nlMFpNSHaM7RGSeqXYYMq0MGKgNeqvf
	7D25iAFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNW3U-00DaVX-Oa; Mon, 15 Aug 2022 09:06:40 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNVyy-00DWnQ-Rl; Mon, 15 Aug 2022 09:02:08 +0000
Received: by mail-pf1-x435.google.com with SMTP id z187so6159907pfb.12;
        Mon, 15 Aug 2022 02:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=/AE193goh4VtzXK5TNjfSKGI7YjyV9LcV+9UPyLd22g=;
        b=m5nWpIjJy7EJXW2a3685SfBViFzjpPmuFNoLVZeuBhLckuAxfYC3KLiH/IS/xFsspm
         G6MhQQdWKvBrU16JNQm8cXdWldKneUEX1W1SvjZkeH671KqURCk2tL+c3M95GU7Vt8fJ
         0XSTxwMZPL95TfH9xk+U9VWpiQDhC1pu8/hnAURWjhzQSnfTY4D0NQI1AYZVHH/3WgUA
         wnCZDZcsaDYDm4SbjregxrzvXuFCPZ2cneemdylqwDhjhXtp9N+kq1Hg46CjX5JsS+mN
         E7QHCHQLLcJ7CV8ke6e/VXuVT3nZMj/Y6f7qoE9Oz9hUdxo/BNMwb1ZqlhSl2x3BZqrT
         KdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=/AE193goh4VtzXK5TNjfSKGI7YjyV9LcV+9UPyLd22g=;
        b=E757jiyldTLrD7ZSj5Hlm4DXEqX666YtQeksYEX4uSKJgMxlqEur6bp7YW0Dkfpy5h
         F/w+KnIThENTzMTSDPhuhw6muqlgJ4JllaPbu5RVgxEvok2ONrrNJHeUjETp5DLjif90
         uEkPT3Mo9P87KM9ShqF21pslYp8x21FXQnOojydrXxQSn3eiJ5WAJ3CeJcNbeTfqhqsg
         z5MF6qawPhVa56se0defdcylDXmUxpfKj0dwIbFMv+DCa1jCsPbvtmrJCYHQ12akvAb8
         jwoNTitI1CjEVj1DEJeA+dKHpF1R93SQ+K28vB19kIV7dD0UFvKhG3sdDYXsRXSH5ooN
         iCtw==
X-Gm-Message-State: ACgBeo0u6P7TlXRGBQ5kWW/6GWI6J5oW9Nxe9QTJZ55QyGezOZBFsHMG
	bbGIkVq6LPY5AKSRUHLrkNI=
X-Google-Smtp-Source: AA6agR43tHlpMRGGkUjVoW0kAMt7dFn9LThfuhRLB9MLhSatBpqsbe/zBNS6osCLbVogDPmJ1T7tNg==
X-Received: by 2002:a62:ab01:0:b0:52d:ca30:f362 with SMTP id p1-20020a62ab01000000b0052dca30f362mr15297462pff.85.1660554116171;
        Mon, 15 Aug 2022 02:01:56 -0700 (PDT)
Received: from DESKTOP-IBN2BAQ.localdomain ([123.110.155.185])
        by smtp.gmail.com with ESMTPSA id a17-20020a656411000000b00412a708f38asm5491612pgv.35.2022.08.15.02.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 02:01:55 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee@kernel.org,
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
	linux@roeck-us.net,
	heikki.krogerus@linux.intel.com,
	deller@gmx.de,
	broonie@kernel.org,
	mazziesaccount@gmail.com,
	lgirdwood@gmail.com,
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
	linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	szunichen@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH v8 01/12] dt-bindings: usb: Add MediaTek MT6370 TCPC
Date: Mon, 15 Aug 2022 17:01:14 +0800
Message-Id: <20220815090125.27705-2-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815090125.27705-1-peterwu.pub@gmail.com>
References: <20220815090125.27705-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_020200_989102_9B8AF84C 
X-CRM114-Status: GOOD (  10.42  )
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

Add MediaTek MT6370 TCPC binding documentation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../bindings/usb/mediatek,mt6370-tcpc.yaml    | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
new file mode 100644
index 000000000000..72f56cc88457
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/mediatek,mt6370-tcpc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediatTek MT6370 Type-C Port Switch and Power Delivery controller
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  MediaTek MT6370 is a multi-functional device.
+  It integrates charger, ADC, flash, RGB indicators,
+  regulators (DSV/VIBLDO), and TypeC Port Switch with Power Delivery controller.
+  This document only describes MT6370 Type-C Port Switch and
+  Power Delivery controller.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6370-tcpc
+
+  interrupts:
+    maxItems: 1
+
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
+additionalProperties: false
+
+required:
+  - compatible
+  - interrupts
-- 
2.34.1


