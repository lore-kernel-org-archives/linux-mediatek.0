Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B1EF5A8C7
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2026 21:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PeDXgOZ2fJAOAlM2C3zm9hiJl6sDVNOXzlY1iVGrLts=; b=IMHx43Htp16W3YgAzNIz4jkGG8
	fF3TEAUHgvIaB1z0XgMTcqf5TluO56ZtCq/ZQOAEUszJrQKGy/bfzhW0gpG1KdzNOlTbh/EfTElOT
	P3UM4+sWzM2DeFuWMK+MGEi8dtB+8+Vg21kUdIjmn0yZw3Nw+cB9x1b4j79hhHF2AilsGNAYbfnd/
	DHCvN9gveSbhnt86kEIusYCL94cZDZDdP7uyImby6/fg236zfnjI/CFzivku19TlJ3SMQP+EFcMSC
	7Lg8t3mn28oL90jFmtJ32W+aaHW+EOTIizKCDvT5bfFlcjJlTIvVI/ZVpYK0lXF8zf30FbXQgi4TO
	rHHNoHjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwIG-00000007jiK-2s6f;
	Mon, 20 Apr 2026 21:36:36 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwIE-00000007jhY-1i8j
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Apr 2026 21:36:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso30261265e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Apr 2026 14:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776720992; x=1777325792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeDXgOZ2fJAOAlM2C3zm9hiJl6sDVNOXzlY1iVGrLts=;
        b=dlgQG9P6JEy8ks+Bbh2zXCnzV9wPvD61dQ58N0Cs983XeAeiSg+FNMG/yeSrrPAK+7
         eTsZeXaGaXHddcM0/tSCkfODn3bY5ffNv2pdnPo4JmVVhTfjp/ZudXMEBoMhc0UJMe3Z
         IN3eNo490FStOv+0gSgNcyQVYPxcmpEafSHO/9EKik553kkLz+zuPqH0IvSUWVEruGr8
         78hysJyTGXdUxTZIRurZw7/g7CfUCux5/76hhN0s5iT3XYJVYUzkCeVmc1xt6OzFHuq8
         A8k668rXRTtNzkLoKTmzVT+uuyu29LfQxiGc59ht+99eCPkfF1kAG0oU4Ft9KNuCowpt
         TgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720992; x=1777325792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PeDXgOZ2fJAOAlM2C3zm9hiJl6sDVNOXzlY1iVGrLts=;
        b=skP/Qym8uOeZCMP1LFG5+I6n7kEpY0srcD5fDx9SsJhxG9LUAv2P2nOyu4ELkFoZbc
         afrQnB1Dvonfohe3X3MWc+6HV27UcgTXS456zc9Oi2w0WD0SMkSLpOx7mcHoLh7cjDLC
         4O9K7TKoS1sfT5jic637nts7xGbbLFJSGr15hjN4NvCQdDyJFkhko0WJP5sRqi4+8WdU
         wooAURvs0MbMnbhJwamjO6LJ6+MQqbsTGPxaVuLCJykkbg4zBYU/tlU9zMnSjggQDtiQ
         plwgsMX7K5sojcnOkOrphokeAkYwOPDSrJbmVaUG2hdGa7dAm4p6217SWCSa8FYkVter
         xmSA==
X-Gm-Message-State: AOJu0YzKcPjtXpaPi6yfbQjN6IjhYjJaYIIPU1miy9BsKaWHkbAdXSEO
	LsFIi0nCwwSWL3n4aduso4y0juEumYC0G2YeDZ5Z0mi/llBjWW/T7GnX/Ch8Qby3
X-Gm-Gg: AeBDievTWZu699u85+JXB3P3aldf2QFUx/358TCyGARNkDKH9Ybjs27g6NTjM0Bt3+0
	VWi4AB9zEEFZocMJGGhIvplsbd79RzNj2pP+alNcJ5xHdpLMeB5Gs5o4BmEOMhBfQQEohbLl9U+
	szVnRwnXRUaeI0vt3mRQfAHX2cX1zTkydhdPfXkCzsjeRQSlqdym9kMG2lpVoA351S0doSi8GGI
	UktEaHJnhzSR7nbDfccQCJ8vC5bppy68HTpubE3DANzo3UT3QS40EDiHMNijE9W118p202Fmt03
	PbGiGwFMIl+fhHJHrZR53QVmiPQ4WB6HEuNTd8BtbbgV5B0NjQz20/77sRjDCCVWM7zQFdCu6AF
	xdNJc2m2Rzt/gwefJRDEDriNaKHwTNLPkMtMKGHe1lIXgtuhU/ax9XCTeT/0yUjUFIrwtW5YsUo
	GUBu/vuPnmSiZ4B3x6h040CYNNBRhbVw==
X-Received: by 2002:a05:600c:1907:b0:489:201c:dc46 with SMTP id 5b1f17b1804b1-489201cdf13mr58952175e9.12.1776720992169;
        Mon, 20 Apr 2026 14:36:32 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm289500355e9.12.2026.04.20.14.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 14:36:31 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Mon, 20 Apr 2026 22:30:00 +0100
Message-ID: <20260420213529.1645560-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420213529.1645560-1-l.scorcia@gmail.com>
References: <20260420213529.1645560-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_143634_454564_D99CFEBE 
X-CRM114-Status: GOOD (  11.14  )
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

From: Fabien Parent <parent.f@gmail.com>

Add the currently supported bindings for the MT6392 PMIC. Its MFD driver
does not use the compatible property to bind the regulator driver, so
don't mark it as required.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../bindings/mfd/mediatek,mt6397.yaml         | 27 ++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 05c121b0cb3d..2866e95e338b 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -40,6 +40,10 @@ properties:
           - mediatek,mt6358
           - mediatek,mt6359
           - mediatek,mt6397
+      - items:
+          - enum:
+              - mediatek,mt6392
+          - const: mediatek,mt6323
       - items:
           - enum:
               - mediatek,mt6366
@@ -68,6 +72,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6366-rtc
@@ -99,9 +107,6 @@ properties:
                   - mediatek,mt6366-regulator
               - const: mediatek,mt6358-regulator
 
-    required:
-      - compatible
-
   adc:
     type: object
     $ref: /schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
@@ -231,6 +236,22 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt6392
+    then:
+      properties:
+        regulators:
+          $ref: /schemas/regulator/mediatek,mt6392-regulator.yaml
+    else:
+      properties:
+        regulators:
+          required:
+            - compatible
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.43.0


