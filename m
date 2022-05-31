Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084E8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 12:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Wi32tmpiQHX52ETq9Uk/4lGPfSR1D8G8ZTXJ1dPWC8=; b=17ai+ILCSHPxmA
	2GND9A5B1VUwQk7Hyign9k3SG+Tiy66mP8kuc1QNcPINtCVMv4m05jGP4G26WFeiYDoQQNVzNxXEE
	MTuOy/TkoLFWRJZzne01mFC+ZgOzBEy1knSC8IMw3twvk0qihNq/ekGL1Hk2xUkfINdpncCLFvB2E
	LyuokSd/Uayth2+mvJCGXoOx7HBvKJuaoCuPr9E9BLsZro0SCNOb3NCNHpVBhMdlSL4Wj+Tru+cwL
	04wO1IT2QbuR/YPd8za2U82tXcG49iFywvRzaREgMIJZC/PzL3UqbqD1Vrj6ImaMl6OXQOc6Wxb95
	Io8Ms1YGWY9R+vvG7mSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw10n-00AlCe-V1; Tue, 31 May 2022 12:30:13 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw10N-00Al3X-6p; Tue, 31 May 2022 12:29:48 +0000
Received: by mail-io1-xd43.google.com with SMTP id y8so13874109iof.10;
        Tue, 31 May 2022 05:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NLlQWPmyPhz9LkYQh7iizThmB3DZjfxS2yfzbAOphFg=;
        b=I4w6+q3mrUIL109pwzpTze5IvWiG+1Sm6Q/7ihB35G4+4nU2YnPrXRziLx+TjwQPKJ
         27v96U4XlLTj4qvRe1P7BgC7TeHdudGmcMfT8xhVbtoceFoPSsDrFiSspzWjKMLuZBJW
         NNPufZ9HklQcqk+CRGhV5CV3j//Lsh2GOI3ZrSJSChpHw4LFbutgxJNqUqN6lh3qf+xQ
         3FMeYyOYJBXw4mgAWgYyBsEGP+9QcO74DD7r3ElXM/gBg5lFBlDhaRkqIxCfG86r2kGS
         qTg9vzWnm3t4x6/LXNTmuPN2mNUySP8cPOORTBWUclVtUSbi0DxWMAHxDg2PiIXQwtc3
         IH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NLlQWPmyPhz9LkYQh7iizThmB3DZjfxS2yfzbAOphFg=;
        b=BgFNZyM1xG7oViHQjm9Kon98orckeWYbMnYefU98GLuq0z+1pQSoAo6QHOa3NbcN0z
         RMnRthp1xzGmaTOrjZHK/x0nn7NRQPg7tr3DIXsl8SWTIvlE/AKBJnqvTnbuiHmS1LLY
         mOj0THP/zCyhYNZ6PYVI2fMPDMMONOtwPhyr3hNk7P6K+exGiNF6jasDfP8T1okGIwBb
         Ngdk0yLDDLH1rciD3kwLuim73iEEmtgXzQzNYfMbZ7Rx8dK6xGJefIi6h/AA4wSVDZNf
         ZzHoWUrLpWKAwr3Q+IPDV6EydvVuBOgwjGSvRcxqXrLBp6oEvD+ZDPfk2R6hPhcdv/KH
         Nnmw==
X-Gm-Message-State: AOAM531t8PcVPQfonju8BWLk4gGw0FlVptbrBXVMrzRapluzOb6Nakfn
	dYHAy9BuP3A+G3KRBn8DyxKiNlvRXzU=
X-Google-Smtp-Source: ABdhPJyD1Fx7LBxTURdowjLzD5c7Yqcp9ob1xo5BIIaa0fHPSwQ8ngkBhpXhhcH/7b+MIEJs3XVqjw==
X-Received: by 2002:a63:1009:0:b0:3fa:9996:386b with SMTP id f9-20020a631009000000b003fa9996386bmr31594847pgl.441.1653993061902;
        Tue, 31 May 2022 03:31:01 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net. [42.72.220.172])
        by smtp.gmail.com with ESMTPSA id c1-20020a63d501000000b003c14af50631sm10216519pgg.73.2022.05.31.03.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 03:31:01 -0700 (PDT)
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
Subject: [PATCH 11/14] dt-bindings: leds: mt6370: Add Mediatek mt6370 indicator documentation
Date: Tue, 31 May 2022 18:28:06 +0800
Message-Id: <20220531102809.11976-12-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531102809.11976-1-peterwu.pub@gmail.com>
References: <20220531102809.11976-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_052947_291207_45C30725 
X-CRM114-Status: GOOD (  11.65  )
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

Add Mediatek mt6370 indicator documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../leds/mediatek,mt6370-indicator.yaml       | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
new file mode 100644
index 000000000000..823be3add097
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/mediatek,mt6370-indicator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LED driver for MT6370 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Alice Chen <alice_chen@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  see Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
+  Add MT6370 LED driver include 4-channel RGB LED support Register/PWM/Breath Mode
+
+properties:
+  compatible:
+    const: mediatek,mt6370-indicator
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^(multi-)?led@[0-3]$":
+    description: |
+      Properties for a single LED.
+    $ref: common.yaml#
+    type: object
+
+    properties:
+      reg:
+        description: |
+          Index of the LED.
+        enum:
+          - 0 # LED output ISINK1
+          - 1 # LED output ISINK2
+          - 2 # LED output ISINK3
+          - 3 # LED output ISINK4
+
+      mediatek,soft-start:
+        description: |
+          soft start step control, support /0.5ms/1ms/1.5ms/2ms.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
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
