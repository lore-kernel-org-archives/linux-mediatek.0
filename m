Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007CBC38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 15:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4N2PvASe0lDveH2nrSsLN3jw3tAnkKgsqkH381a4tLU=; b=pUXoeSNCiAfw8FIE0hw3XTc6VH
	8tbgGFJayWsomzTjSEGDuFZ53WzDvDRM8qUNa9of8rk5NpI4YGdCc35vieuWekpStZ68TJcH/ClhO
	mAp/6Wo+bdOeVP1ggNEQRLVno4NxwEdg8/puLePA2g69Zx/QgIin4W4gCbgs0gJgDSqbhdGBwl9e5
	v0lB2Qks7XBnw0o6cu7qsDf6oaht2JY+5phZ5DUqpm6sK5mj0auCWke3MviE/klX5UKPiJDGboF3l
	qwjnZ2lUVUyKy8TLk8uKWk48eOtBPS1j5YB3G713Idy171hWBD+vZTqiSbr+t9CW27W0tu7AQHWrr
	MPrFhYhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooRTw-000ahr-2u; Fri, 28 Oct 2022 15:41:16 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooROb-000YE7-SI; Fri, 28 Oct 2022 15:35:47 +0000
Received: by mail-ed1-x531.google.com with SMTP id i21so8389766edj.10;
        Fri, 28 Oct 2022 08:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4N2PvASe0lDveH2nrSsLN3jw3tAnkKgsqkH381a4tLU=;
        b=YCYYEiC6ZP0u0OCAGXedVuxkRgYPDu9JrKNJ3TTR/WwjOHNbafSepLvJeNIcSBEyuO
         zKzmtO+5U2a4cWnKqgO4tBXRLtKolBdmnaoYVylT9NCJT+GnJJMCQDiE1UQYpAq/b5qA
         urdvcoADDKNZW6dh03OetTZSKwiAT1FFErC7VglOK2UB9uqIHsy/StLyj5GKkC+YZGNa
         dzDAujfC1DozPQxnEevnc4KxI+TAausumwg2GMmbhx6di7pq7zEV5gxoE82WW7LfMZKY
         5KAbY3wA0HlQfZ/bBYelRzsBN1fBZQA5qcR0EBpaJXM9O44cLPqpKUMSUvA7OjA66+8o
         +x7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4N2PvASe0lDveH2nrSsLN3jw3tAnkKgsqkH381a4tLU=;
        b=dcZc5AXoQecBDxB1l1Q2rYA4rZKFyCfjE3obM4Nfg4X7JXnNdix3GfsGot392YVrOP
         o2BA1mO6HBCsJtaGwikOrCJ75mAsfasYqWmtNT+EhoC7OiiEz4k8/Fhf2RO7Ljf0yMhL
         wiz/wyH0J7zBN8zfHDkzK0ntYB4xp1bR1z5f9VOXtV+saIpzqN6mhUQdE8Po4OBrTU+L
         2UiwtibYAxbD2/93Pd8EShU4RZ34CTsINRifoOn3qAr133WuFrCh8oYsc7dVV47jjy9i
         9ZzJxoSbHAHrjZqN6cVq9YqijT2KD3T7h6dGnye+B/ZUbZxIJBdoQ3LKdswhWpt2bS3h
         BDIg==
X-Gm-Message-State: ACrzQf2FitHE3KIKL8uqzUWT2NB/iBMTRfjnxqAqV7bkC/erS7mZYDwz
	QVvhaLznFZ69Iu4f+C0moHY=
X-Google-Smtp-Source: AMsMyM5n9VDoT6WVu6zsbXMqR4Ju5Gh2lQ1W0e1X2+x2OHEoWP+piB6GCKAgLzHS2DwFFqNC4PHfnw==
X-Received: by 2002:a50:cc07:0:b0:453:4427:a918 with SMTP id m7-20020a50cc07000000b004534427a918mr2913edi.121.1666971343130;
        Fri, 28 Oct 2022 08:35:43 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id ds12-20020a0564021ccc00b00461aebb2fe2sm2830635edb.54.2022.10.28.08.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:35:42 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Andy Teng <andy.teng@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 11/13] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin controller
Date: Fri, 28 Oct 2022 18:35:03 +0300
Message-Id: <20221028153505.23741-12-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221028153505.23741-1-y.oudjana@protonmail.com>
References: <20221028153505.23741-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_083545_957886_7A05642B 
X-CRM114-Status: GOOD (  10.52  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

The MT6765 pin controller has had a driver for a while, but DT
bindings were never documented for it.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 6f2cffe50b11..88a4c4ef28e5 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -18,6 +18,7 @@ description:
 properties:
   compatible:
     enum:
+      - mediatek,mt6765-pinctrl
       - mediatek,mt6779-pinctrl
       - mediatek,mt6795-pinctrl
       - mediatek,mt6797-pinctrl
@@ -150,6 +151,41 @@ patternProperties:
 
 allOf:
   - $ref: "pinctrl.yaml#"
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt6765-pinctrl
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+
+        reg-names:
+          items:
+            - const: iocfg0
+            - const: iocfg1
+            - const: iocfg2
+            - const: iocfg3
+            - const: iocfg4
+            - const: iocfg5
+            - const: iocfg6
+            - const: iocfg7
+            - const: eint
+
+        interrupts:
+          items:
+            - description: EINT interrupt
+
+      patternProperties:
+        '-pins$':
+          patternProperties:
+            '^pins':
+              properties:
+                drive-strength:
+                  enum: [1, 2, 4, 16]
+
   - if:
       properties:
         compatible:
-- 
2.38.1


