Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F3CC43219
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 11:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGBvDsZvz4SS5lSwvnc1CIkXz2KLisopDlJ3Cu1rcIY=; b=q5poW0MvXJvft4uQP5gvUzMsuP
	xfUbxSYIQirRB7JMurdZS3H/z32dWs7fDbjE430q0Klsijnjn1wA452H0+76ovyfU0NZ8PrUZ+QS6
	mkw93JvWu9D8Frr5hyQyVUjpYsdyZsWXH3HFQmYeIKeOpSR1r5vu8prc63IYwkmWmjsObGwJmOZ2R
	zQL0nhQ20YEZJYHWTTvKDh30GIoRbv2jjAxeFkIWTmHk9m9X0YLsMzClVuDz+15qtScJQ1tRjS8gI
	61tWs067geygrQDYaabbLZ46Q5x+XSHt61Kc6MLRDxsIVW79WDrwReh3Nl+f8mx21NoFbmOOwfIve
	/PWTiCPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzco-003gob-B4; Fri, 18 Nov 2022 11:33:38 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzbQ-003fzi-M4; Fri, 18 Nov 2022 11:32:14 +0000
Received: by mail-wr1-x42b.google.com with SMTP id i12so4947096wrb.0;
        Fri, 18 Nov 2022 03:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGBvDsZvz4SS5lSwvnc1CIkXz2KLisopDlJ3Cu1rcIY=;
        b=YP/gPDU3lcbMHuuY2uV6ZvvqPZGkkS4qVJJUzx3HIZlKhMDppFc+8vPlgQwDBUKjjK
         m8hel4EOVFOgB4hfHIaj8kqPYXQZzV6Wo8HyvdgEti4wHMLg/a+OpFrUmSRevai9gofv
         ICQR+B7gGLUCkLdPXzEosSFEYHRnou8J9VU+KdeHTPu6R7WC4pAHu9pXJL6EianYPBVh
         jqKq7yuY7C1o1rFJ0ja3lD/aV13Fx4X+mYmypAylu6fNnGNVKWgFeuQhnDQqF4ZvGgAi
         45y6MZoQ9yOVeDJHWKeT2lLbW9INChQnmwErfwDjpsUlpMlPPVoBseYg2GdpLgVV170A
         XS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGBvDsZvz4SS5lSwvnc1CIkXz2KLisopDlJ3Cu1rcIY=;
        b=QdbcnAUKM2haDsDd16VKBYSngggRKiLeDsIGsAjMPfujDMrXTz0tBtAGznCJuT9QsL
         fPHlh62nzjsjUEvXiQsaz8lTkGzRIk33Xc9JkATwfywz4amNGzF1xKI69UQfzTVfaRdG
         l+oa6QbbtJ3XyaYPerLQMBttoTBiJ1UVg4zfHpXqwiAx8GvdSKxdTn5fK7X/Iykm4hEJ
         BWNJryBl9Xme+5JRmE2TDofS99wSvoMT3r6BRuHb+++069G1FI+86df9Sv1Kl+KuVEZj
         ZYzTJea+99fnvlRF5dRZtTKoOewjJaYKoLWXwTzkErZXGq3g8eodO2LUtElm2zWaef7X
         iOdA==
X-Gm-Message-State: ANoB5pmYqmaCwAI6PqgwLXbdGfS4UcVb5xirt/d0XCz+6Vp5wfzcIlb1
	U31t32WDALyAp214FiQ/UXo=
X-Google-Smtp-Source: AA0mqf4hjaom4oDUOVYUd8J7wjeXechldZmbUMgyoa9JCnYpRDSa/3Lj1UIECEFQ7og93YshAWpfYQ==
X-Received: by 2002:a5d:6dc8:0:b0:236:53d3:5a48 with SMTP id d8-20020a5d6dc8000000b0023653d35a48mr4063565wrz.66.1668771128909;
        Fri, 18 Nov 2022 03:32:08 -0800 (PST)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id l24-20020a05600c1d1800b003cf878c4468sm9894817wms.5.2022.11.18.03.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 03:32:08 -0800 (PST)
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
Subject: [PATCH v5 5/7] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin controller
Date: Fri, 18 Nov 2022 14:30:26 +0300
Message-Id: <20221118113028.145348-6-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118113028.145348-1-y.oudjana@protonmail.com>
References: <20221118113028.145348-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_033212_753161_FC3B0A2F 
X-CRM114-Status: GOOD (  10.37  )
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
index f26584af5c8c..c2238a86b7fe 100644
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
@@ -59,6 +60,41 @@ required:
 
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


