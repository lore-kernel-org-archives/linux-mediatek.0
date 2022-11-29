Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D607C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 02:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1wkbH4Fwaa8TmYZ/6/PrOawCFc3B7G23QtdfVs16J4=; b=VVqlTHXqci+cJRQFLPupuApS0r
	7BIJmuEAIQS/d4sGculBbOkKN/tkdPRN7UkNwjKOSjjET+ocMAbKr+WCRrraiwja7ce9fqlCA1Hf2
	tr9E/W1v3L+w8J9HM8D+jEx3KDB+9zYAzV3/lD6r3SeQWhLd5lxNWE2aqC/cPsTScKL1oBbs8bQc/
	zu5YY4f+sFTHzXTocRl4lCRHQ5eiGXS5q+A4hgXH9aU4wITB6v5hSS8/bef/bviypDPq9gk8S6qYm
	WJKMR/x9uOvocCHhOTJX4tSvKr6i7cqf0SuxV8tZuOF2Rve8ru6HK88sCO0HoA+eN6APFeDPVOdJS
	ze52imsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozqSA-005KQ9-2x; Tue, 29 Nov 2022 02:34:34 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozqRl-005KBj-PG
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 02:34:11 +0000
Received: by mail-ej1-x62e.google.com with SMTP id ho10so30549009ejc.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Nov 2022 18:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1wkbH4Fwaa8TmYZ/6/PrOawCFc3B7G23QtdfVs16J4=;
        b=XBccz8PXofY6f+tvbfXJrE132NfvQoLMkwiFtRpevRN5WX0sRKgnZiT9zFFG5hQghR
         4tOp9yBdOYbBkBz2fmgfp1fMHhVyHIQuwO2sH7bRmY282S9LxuRzgXhgVujROSqykY3N
         7whmBNi8M8RWGzTcgVwQoqew0uq7O8ll+LStP/zaHkDNt1YrKiGLbub4Kclu/imI8z8/
         OzjGID039MbTWBFAoR9VyqRuPis4qjyNfmPt7CopqM6UQTzs8hMXP4WGL50gvkz1r7nr
         QMrZFup1DAxMS8peRNEkpnhYZyEqhlA5XIcJlnUocIcNHIlI7+NjmG2UqzRG2M4TVZg2
         Tzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1wkbH4Fwaa8TmYZ/6/PrOawCFc3B7G23QtdfVs16J4=;
        b=tG06HKhQSO0YGI2+ODc4ny6AQYpryQ5ez6CzhxJ/6CxcKWi9kRNoxbA6z7rjeRhlXG
         9D4cRg0eVeTfXfSyG74X1eJKd9Ty6OttKdiK31m30CjtDu08WsNMgZSsvN1N+UuAad4w
         WdydN+AiDUR0TgLX0QF6DlYzVSxnAEcrbisC2L+lNvVNYSolwnuVciFfbQLyWUCCsoAk
         4mPbRHJya/ZUGVzAN5G8s0ffbw8utowFWxDjNns57WqboF00ORYHhggYA+K362sQEj2U
         YMOL32eZpO9N3zHkafV1qyIPyi3FcwoYNZxwKPzkrThYeC62RD0HFjGefQCxX05NLY51
         hm+Q==
X-Gm-Message-State: ANoB5pmgc/IwXxccDoCYXabsvNVZOUauO5sMZx1g90aOFPdA+n6CMoX/
	ljspcRL6qqtVU/rhQJsOICgmQg==
X-Google-Smtp-Source: AA0mqf49fk527w7g9GqZ/PawNHpaqWh+mthJxsBRUu/tjzjEI2+aP48+dmF5anMP67j4bdYS7fcWYw==
X-Received: by 2002:a17:906:1445:b0:7a1:6786:444f with SMTP id q5-20020a170906144500b007a16786444fmr29233592ejc.409.1669689246257;
        Mon, 28 Nov 2022 18:34:06 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id a4-20020aa7d744000000b004615f7495e0sm5733817eds.8.2022.11.28.18.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 18:34:05 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	krzysztof.kozlowski@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com,
	linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org
Subject: [PATCH v3 3/7] dt-bindings: pinctrl: mediatek,mt65xx: Deprecate pins-are-numbered
Date: Tue, 29 Nov 2022 03:33:57 +0100
Message-Id: <20221129023401.278780-4-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129023401.278780-1-bero@baylibre.com>
References: <20221129023401.278780-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_183409_883489_373A74FC 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

Make pins-are-numbered optional and deprecate it

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index 33b5f79e741ab..1b44335b1e947 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -31,7 +31,8 @@ properties:
   pins-are-numbered:
     $ref: /schemas/types.yaml#/definitions/flag
     description: |
-      Specify the subnodes are using numbered pinmux to specify pins.
+      Specify the subnodes are using numbered pinmux to specify pins. (UNUSED)
+    deprecated: true
 
   gpio-controller: true
 
@@ -62,7 +63,6 @@ properties:
 
 required:
   - compatible
-  - pins-are-numbered
   - gpio-controller
   - "#gpio-cells"
 
@@ -150,7 +150,6 @@ examples:
           compatible = "mediatek,mt8135-pinctrl";
           reg = <0 0x1000B000 0 0x1000>;
           mediatek,pctl-regmap = <&syscfg_pctl_a>, <&syscfg_pctl_b>;
-          pins-are-numbered;
           gpio-controller;
           #gpio-cells = <2>;
           interrupt-controller;
-- 
2.38.1


