Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EDBC00140
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 09:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAsfJ+1Mj231OgXM143U7NPHPGk8lg/9nj5rbtDQosU=; b=ETXQcLkTjHc50+694CEFAF8+Dz
	G7RZmOeo72sEco+hUXErGzqW04vHjgbSifr/AquzVUhNALCPVvA9j57EsCHj/0JbQ8eywpJ0nCLsl
	cPd/8g8qyR4jKRvYAfkEiutItE5DnZ4P4UKSMCqxLavKPtwKkyCo11TEpcL8SDzCF7yk/a/mok8A8
	5rkJFj9UTQQ+FMVR7F095p+5VlkODbcHEX+jFqTTTs2TKOdpuoE0f8507OMu06bb55qSJSnQB8wU3
	XZQEj49RFIaZ5R3f7DgW5VffXEr/uBJ4xPllZyv7nJ/WjMYaVUO7g/RQENBf7tB2g84P/Pco0Pkdf
	Kyx2KQmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNW6F-00DciI-0O; Mon, 15 Aug 2022 09:09:31 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNVzK-00DXCf-Gp; Mon, 15 Aug 2022 09:02:26 +0000
Received: by mail-pl1-x62f.google.com with SMTP id y1so5874015plb.2;
        Mon, 15 Aug 2022 02:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=jAsfJ+1Mj231OgXM143U7NPHPGk8lg/9nj5rbtDQosU=;
        b=WZ7JCEDfOCy3EQc5zn+wa2S43ThV6A5Z+pXUm6y6i/JVlAKwcpmswgci9bKG6Tto0s
         R1ATcrJysD9d/BYkcsdmTjMU5H9nBlu9VxBkly86fZF+5sJpeCDliZcdf+4+iWYDlXkM
         aUCwf7twuGPYRbkgqG0cHysxXNgC1ytMhfnlCGVzgcNgClELvHpR1w6ZBchctvbmu+jS
         6g+SuWzKgvUyNZ/klrYsx6R+BYTuSnvKMuIeQYRs+h2aIU1KA3unKUNEBJ/v5fRDIJ5s
         O8qXrbCZ9RiEUqx485ArryjaPy7bDd+4mQOQDsDQRAicC5W9Tljyw/aKLA6v9wkpTH12
         s9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=jAsfJ+1Mj231OgXM143U7NPHPGk8lg/9nj5rbtDQosU=;
        b=RzCZYcu2ezuB1hs/19IU4IRTgJnNK32yf1aw4l7ARNK8+i7/TyYyYx4VLoOLme1ZV7
         /xaRBDqlCuMOV31LsbtmESOKIEkFPybmQq56+XJXLuhyabMppavhzl143veg/hEUOssy
         x6nPfXfeAXpp6GgiKCtkb6qlGCnwTtQBi913r2xP5R2opXwXLd3H2QfyATbLFgA1OTJp
         8JK9Mk/axVew2n5rcIUrHozk9DdDNK8dr8ZbgYwii28/N1DLS5Kvyaf63OXUak9yyeOM
         tkHRnOY37rJvupQ3/haTtlbDNbkhLvmliOidfWfzhB4fZlX0mb7poQHVupf5q61Vn0Di
         w4gg==
X-Gm-Message-State: ACgBeo1Sc/ar5diIf5NWhD7UR7bvS/+px2DODkbSVDwxkHSg0mDlQvYg
	kzBnOgmjciBlwF7DLBZM0wA=
X-Google-Smtp-Source: AA6agR5dIpLJZek/MOUWkP2ReJX+eAO+AT8j8pByvCyU/tbsfvLHdxFvGlojO+1yfFH1nCHoON9fTQ==
X-Received: by 2002:a17:903:264f:b0:16f:8435:d9a8 with SMTP id je15-20020a170903264f00b0016f8435d9a8mr16300638plb.112.1660554138279;
        Mon, 15 Aug 2022 02:02:18 -0700 (PDT)
Received: from DESKTOP-IBN2BAQ.localdomain ([123.110.155.185])
        by smtp.gmail.com with ESMTPSA id a17-20020a656411000000b00412a708f38asm5491612pgv.35.2022.08.15.02.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 02:02:18 -0700 (PDT)
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
Subject: [RESEND v8 04/12] dt-bindings: leds: Add MediaTek MT6370 flashlight
Date: Mon, 15 Aug 2022 17:01:17 +0800
Message-Id: <20220815090125.27705-5-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815090125.27705-1-peterwu.pub@gmail.com>
References: <20220815090125.27705-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_020222_816464_25FB5D4C 
X-CRM114-Status: GOOD (  10.66  )
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

From: Alice Chen <alice_chen@richtek.com>

Add MediaTek MT6370 flashlight binding documentation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alice Chen <alice_chen@richtek.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../leds/mediatek,mt6370-flashlight.yaml      | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
new file mode 100644
index 000000000000..e9d02ed6a590
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
@@ -0,0 +1,41 @@
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
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        enum: [0, 1]
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.34.1


