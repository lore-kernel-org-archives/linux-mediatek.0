Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFAAC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 11:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AJe8zyPpiB8C0KhyyEm6QWrTWzw6RCsQkr4W1CUSnQw=; b=YV2QAh1Li5A6bS
	oDSuW+/UxE52+hzfCf3kEHoKibTg4bSbLUAq3PZCHUigb8EF/rcEcqHMMjjLfs1sXx5YHbsBaNamy
	kD8yhCOuirHfPMj0DhhiXa4AqPD7Lj5P2Or046EPWjcD8Jl9JKOybssX6lVa5wiitwokgXRoOZK6j
	LwIxNsRf1cen/ECtuwcLjNmSp0HHkQtUlKmO9OkAzJKcFKS7KNOFyFg5Dk007TGCMXerYhEVuIvWv
	nNDNmBbAlEsfzm8i7WYtAFQbGKxrlNLWx5boS1x/kWHcXX9B3S5bwlEwGyPozebNcegQH4HtRu3s6
	h9uxCwlCO3or0xlnfEiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0i1a-00371v-T9; Mon, 13 Jun 2022 11:14:26 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0i0F-0036LB-Pq; Mon, 13 Jun 2022 11:13:05 +0000
Received: by mail-pl1-x631.google.com with SMTP id f8so4800950plo.9;
        Mon, 13 Jun 2022 04:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T2LOWa0LYPNbUOdZwXstN4Fj+e3Z/fV8r2vTbFyL+u4=;
        b=QWJkRnN2FsU0KWBpmQ0dClhx2X/Q4DMK9O2gzJeroxqmrEQxh9/Ce9w7uvOzjztTN9
         Cps7cjw2oA4cGlShBG+N3BaSCMmpzIcFqLITmOuYndkT5OOSpCYLbuZm6AYod79wiHOz
         xVxQdPM8KLhnmlyQPfmbbArC9EVKNCBtEWDpROJSIXStwGne0OEcce/wdz+9jeElhpw0
         KJj0XehQz+yipHnUvS6ka77cD9f4kLFkQWFhFNSZ5goan0N+XNhgPZ4LmSmiN7yOvxTm
         fSGhTRr5HnsKQa/cJWfTTvvC3Ou015Bb0VpJqhpcbUKXT6NXvuCMtFolGUcHOy2Si1gm
         lzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T2LOWa0LYPNbUOdZwXstN4Fj+e3Z/fV8r2vTbFyL+u4=;
        b=LIJLE0wMQQtgopXqIYjSWOfac6h7yRYYtGDphLFCdS2w2U5wBD9R9GjXlEBdF5VExD
         YeyIpBNpbTkWery/dyjUJeI2kAy70qDHkbkbXYs3mEdEQvGfsj7n7yeZip4v0Bwrvx5i
         +uZ5YCbOqcedUlywbF8smOuCTSStLrqCDl9ccI1gEqcbSLgASOxR9XZb/iwzTgFYZUBx
         cb0AwksiNtH9owpYsYKXvmdD382rJ27qLQhgddNJzOjYR+rmHPUVWq5/uUv9ttWIv3ic
         dzkBgnL1S8wwNksZk1DQX+oT6y0bGYFa6rl8kR0Pw4WIeWj7AyddbGC2L7Clow7MWqor
         7KDQ==
X-Gm-Message-State: AOAM53175YdUxU07SGPFJoexciiB2EWkYA0goRa3N5WIaNb77iJdRWUh
	5FdD06P8KnOyKfBFFYhuFETQbzcPgrk=
X-Google-Smtp-Source: ABdhPJziskZ5VakXCRbxfIE9XDHG2+SOluNMJVEggkCCLainBKLWkbDKcCDtwc49dmgiEPsQomfjZQ==
X-Received: by 2002:a17:902:bc84:b0:167:80c6:aedd with SMTP id bb4-20020a170902bc8400b0016780c6aeddmr38752631plb.97.1655118782858;
        Mon, 13 Jun 2022 04:13:02 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-115-109.emome-ip.hinet.net. [42.72.115.109])
        by smtp.gmail.com with ESMTPSA id g17-20020a056a000b9100b0051b4e53c487sm5199989pfj.45.2022.06.13.04.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 04:13:02 -0700 (PDT)
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
	Alice Chen <alice_chen@richtek.com>
Subject: [PATCH v2 04/15] dt-bindings: leds: Add Mediatek MT6370 flashlight
Date: Mon, 13 Jun 2022 19:11:35 +0800
Message-Id: <20220613111146.25221-5-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613111146.25221-1-peterwu.pub@gmail.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_041303_901441_7254A0FA 
X-CRM114-Status: GOOD (  11.68  )
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

From: Alice Chen <alice_chen@richtek.com>

Add Mediatek MT6370 flashlight binding documentation.

Signed-off-by: Alice Chen <alice_chen@richtek.com>
---
 .../leds/mediatek,mt6370-flashlight.yaml      | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
new file mode 100644
index 000000000000..13610bc23d0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/mediatek,mt6370-flashlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Flash LED driver for MT6370 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Alice Chen <alice_chen@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Add MT6370 flash LED driver include 2-channel flash LED support Torch/Strobe Mode.
+
+properties:
+  compatible:
+    const: mediatek,mt6370-flashlight
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-1]$":
+    type: object
+    $ref: common.yaml#
+
+    properties:
+      reg:
+        enum:
+          - 0 # Address of LED1
+          - 1 # Address of LED2
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
