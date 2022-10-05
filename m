Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C49C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 17:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lscRy0kqbRlW0b48THWW28owt26qTsMSihJ3fUIxZUY=; b=Zbz/D8MQBAIze1EU/YXrMOd+XJ
	2aXWvUZqQNy3/yCKzvg5TIFoPmBlQjZ993vu1iKWUWlndgm/Kyg1oKgeiS7h+X8De/0dvsOdYMQK6
	aEG3u2eov2mrxPbAznfwBYACJ3a+Ai30dFSXlM5J57aY3nEH+3H//GAUghF/3Fno6XhVOTJYa6jin
	rNdqEr1ZqYHqHBUcfCHUrIptpJPV9NNhwutB5S7bz3tFtze3y+Z1loWdzjcPf3bhZisHl6Tyej0e8
	EonSe5b68QJCshRZ8115hefyZXbqij9bYx0LqdvXtShLImtxXCgOVDPBlgcmys8b/+HtNPr1IPZ6P
	tue/x8dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og8U8-00FU3L-9B; Wed, 05 Oct 2022 17:47:08 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og8Rf-00FS0g-2z; Wed, 05 Oct 2022 17:44:36 +0000
Received: by mail-wm1-x329.google.com with SMTP id ay7-20020a05600c1e0700b003b49861bf48so2291871wmb.0;
        Wed, 05 Oct 2022 10:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=lscRy0kqbRlW0b48THWW28owt26qTsMSihJ3fUIxZUY=;
        b=dm+FXTm1drjKBIiUiGynmy74M31d22PsWkd+Eu83ZoPu8ZyT/zo1s7uwX3m53cN6/T
         h4pmgjD8zha3UMqYnP2xMHsgap7DxXXKFitSNnMkZbb84+8wyBg+j4PiKKGKU8uzMx/d
         ZJN2luqYskmFZF5Y6qukVlddLUedg5iXfUu5w/WZbsxofJtPRl37EN4aytjN7zfThdsq
         yiVgzZPbqUZvJfqoerKpXDZ/yIwxvGx5Cd1qqYYO61P4d5jGpA0gqLY3m9YYvZ1vvqH+
         3x0wzDgpsmPnGFS/LwJ/Zo5XzMSp+hD6H4Wsn75m99d3ckIUHItMuDPYBSkQpXXRnnL+
         qZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lscRy0kqbRlW0b48THWW28owt26qTsMSihJ3fUIxZUY=;
        b=1I9VuJOVLN9YLC8wk6S2CULzMUVOoVuKh2ioLaS1CZH3mTLPkBaPYn2DhoeRkOL35b
         gUum5Y6WVl2MWfMluTYs6YA5sIvvnpgx4wy7IoYinN7SL1wdpkI4yN51AgieyaqsURDu
         ICw/IH867FGDI8lKJXnrQ/D7KLcKpR9AZvacg2IZGA6PF2+L8BEa4fjP8f8AGV17KhuT
         IrR5kaSbBKvbRYSvr/7NIOdaqePWbVPs1bMgdJLYPbmCTDSSAW2D+XhXcb4kYeoJYpV5
         38gSyTLz1xIWtUcpq4bg+Z6dVA0yBUQeEbfRV3YDbIqsRwD6lIEtUnWlVUv1AGVBkzq8
         2nZg==
X-Gm-Message-State: ACrzQf1U4GrNyNzcAIebDoE3dYbQ6CzWDk+yzO2vSstORL93czhiNvcY
	eBpvwtDUoa4XXdE0U5JeuhY=
X-Google-Smtp-Source: AMsMyM7gMSPRnGGLPn0s0Ie3NRI7zqPoUfmcoYLowNb9nsGA6Qb53YMUMBxB53k30LSRftmcFD4BJA==
X-Received: by 2002:a05:600c:3d13:b0:3b4:be25:9236 with SMTP id bh19-20020a05600c3d1300b003b4be259236mr452110wmb.65.1664991871613;
        Wed, 05 Oct 2022 10:44:31 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id c6-20020a5d4146000000b0022a403954c3sm16075491wrq.42.2022.10.05.10.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 10:44:31 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/10] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6735 pin controller bindings
Date: Wed,  5 Oct 2022 20:43:42 +0300
Message-Id: <20221005174343.24240-10-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221005174343.24240-1-y.oudjana@protonmail.com>
References: <20221005174343.24240-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_104435_173197_498D4850 
X-CRM114-Status: GOOD (  12.57  )
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

Add bindings for the pin controller found on MediaTek MT6735 and
MT6735M SoCs, including describing a method to manually specify
a pin and function in the pinmux property making defining bindings
for each pin/function combination unnecessary. The pin controllers
on those SoCs are generally identical, with the only difference
being the lack of MSDC2 pins (198-203) on MT6735M.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index f10d1d5543cb..66a0178caa8e 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -18,6 +18,8 @@ description:
 properties:
   compatible:
     enum:
+      - mediatek,mt6735-pinctrl
+      - mediatek,mt6735m-pinctrl
       - mediatek,mt6765-pinctrl
       - mediatek,mt6779-pinctrl
       - mediatek,mt6795-pinctrl
@@ -61,6 +63,29 @@ required:
 
 allOf:
   - $ref: "pinctrl.yaml#"
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt6735-pinctrl
+              - mediatek,mt6735m-pinctrl
+    then:
+      properties:
+        reg:
+          minItems: 8
+          maxItems: 8
+
+        reg-names:
+          items:
+            - const: gpio
+            - const: iocfg0
+            - const: iocfg1
+            - const: iocfg2
+            - const: iocfg3
+            - const: iocfg4
+            - const: iocfg5
+            - const: eint
   - if:
       properties:
         compatible:
@@ -185,6 +210,22 @@ patternProperties:
               }
             };
           };
+          The MTK_PIN_NO macro can also be used to select a pin and specify
+          a function index:
+          pincontroller {
+            /* Pin 19 set to function 0 (multifunction GPIO) */
+            gpio-pins {
+              pins {
+                pinmux = <(MTK_PIN_NO(19) | 0)>;
+              };
+            };
+            /* Pin 172 set to function 1 (primary function) */
+            msdc1-pins {
+              pins-cmd {
+                pinmux = <(MTK_PIN_NO(172) | 1)>;
+              };
+            };
+          };
         $ref: "pinmux-node.yaml"
 
         properties:
-- 
2.38.0


