Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4159C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 11:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WU/IiR7cE8k8Ct2BKn6U4+LCrt9eTga1yn5tJ+jqm7I=; b=OgfqY/t9hVEQkdU3oVba2pwUey
	+1BPE5gWXQX5EpUjWpytHZR+IsjvuSXuGIbCfiO+bfHwYg7vL+KQURcSxxVxULJ6L1RVke2NMkG6W
	TIWu+i1/N1zh7xjs2vCSxOutnVMViX8Xzo+WD14tjwJ4Y9ANBNPb3IjDnmqcHXjUmRG2YGjwirq+h
	esjo8kqheWEXlVlbjHsg1sr5+aYWTsw5HivXderozEybhXJObzHGUY8+AALCyh15fqfgF0fxiLnA9
	OpqOaFbc8l+++2VEWUfgZV8Gx4FGWvxtu4TGbjKWE0AIuLfrRzbHJ0zQYwYmd3BMpQTtavk1ZGmA1
	Im+rEiig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzbf-003g7g-3s; Fri, 18 Nov 2022 11:32:27 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzbK-003fwe-GQ; Fri, 18 Nov 2022 11:32:07 +0000
Received: by mail-wr1-x42a.google.com with SMTP id y16so8781327wrt.12;
        Fri, 18 Nov 2022 03:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WU/IiR7cE8k8Ct2BKn6U4+LCrt9eTga1yn5tJ+jqm7I=;
        b=XZt1krBP4I4YMmZTtsRb8PoArBkkhRzClzELdbnB5ejdZ4NA34wczquYn/Vy7w8/vt
         m7s4uMTorTn88kQ5valu/42tKfvDAn2ifSk6rTUsKWtbOvJwRMjciFEBnMTqKefhuEhK
         YqFj0SKjt18qtN9zzgBzC/DFiUzzJy7ippC/u4qewlHoc4COmr6RkOaI8Y2RcqY9qlCy
         TK2MnZkY+3j6Mu/DCX7eBE5NG/nGnYp5vuotgBngn3oI18hPrEiErRv0XU+nvmBnfyyJ
         Kj5pbLSVu/KiGi4Xx34qb/9JMie3B3akZZDitKYW3Tdri7VutjJa5CwTYT4dlupJtw85
         5+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WU/IiR7cE8k8Ct2BKn6U4+LCrt9eTga1yn5tJ+jqm7I=;
        b=jcik2ijH/50+usjPQ7Zd2dxgXPfJSKfAXaxiGoic8Fz08BXkiKt14JnA0QhEgDTCoi
         1f/xzLPflNKFg2QkF15K2V4ojca1QxqWBE4ho9yPHgrjeqiJ5Ire6hC8OqegPgEpXtYZ
         hbfqahM043kHFp8LHiIwB/sIR83lF9atEiU2t5mnPvHduZibmq/UiolvXv9aco32FrDA
         Cb0KyuGRVLj0r/a6soe56QtXOgk4lmdQApbdlEUplM8DVPrb3RYT/WNLsXRH0wkDL7zF
         WayKYbNmBySYe7J5oWCyr3ADvi8NmEidDmiMq9e7Tj+6dkiC4BkB43TcbaKhIpDZgqgY
         qL8g==
X-Gm-Message-State: ANoB5pka70kxfu2Kq3HEk4Q76RnFckOvyE2H0qalwEZ3mtebofa7y61i
	9jYelAySFF4tIuwPIbjvDiU=
X-Google-Smtp-Source: AA0mqf58I23NR4/4SbZugVPX22dvJKHqj02BlJmyoF4W6patuvX4oUKC+TZI5TXiGQgbCePFhMYy4w==
X-Received: by 2002:adf:ce04:0:b0:241:7277:95dc with SMTP id p4-20020adfce04000000b00241727795dcmr3917637wrn.620.1668771121020;
        Fri, 18 Nov 2022 03:32:01 -0800 (PST)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id l24-20020a05600c1d1800b003cf878c4468sm9894817wms.5.2022.11.18.03.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 03:32:00 -0800 (PST)
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
Subject: [PATCH v5 2/7] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnode and property descriptions
Date: Fri, 18 Nov 2022 14:30:23 +0300
Message-Id: <20221118113028.145348-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118113028.145348-1-y.oudjana@protonmail.com>
References: <20221118113028.145348-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_033206_586184_E6427766 
X-CRM114-Status: GOOD (  11.66  )
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

Change "subnodes" to "subnode" in subnode description for better grammatical
accuracy, capitalize pinmux description, wrap all descriptions at 80 characters,
and remove literal style indicators from descriptions that don't need their new
lines preserved.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index d6231d11e949..9d481311cc6b 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -118,11 +118,12 @@ patternProperties:
     patternProperties:
       '^pins':
         type: object
-        description: |
-          A pinctrl node should contain at least one subnodes representing the
+        description:
+          A pinctrl node should contain at least one subnode representing the
           pinctrl groups available on the machine. Each subnode will list the
-          pins it needs, and how they should be configured, with regard to muxer
-          configuration, pullups, drive strength, input enable/disable and input schmitt.
+          pins it needs, and how they should be configured, with regard to
+          muxer configuration, pullups, drive strength, input enable/disable
+          and input schmitt.
         allOf:
           - $ref: pinmux-node.yaml
           - $ref: pincfg-node.yaml
@@ -130,9 +131,9 @@ patternProperties:
         properties:
           pinmux:
             description:
-              integer array, represents gpio pin number and mux setting.
-              Supported pin number and mux varies for different SoCs, and are defined
-              as macros in boot/dts/<soc>-pinfunc.h directly.
+              Integer array, represents gpio pin number and mux setting.
+              Supported pin number and mux varies for different SoCs, and are
+              defined as macros in boot/dts/<soc>-pinfunc.h directly.
 
           bias-disable: true
 
@@ -141,7 +142,7 @@ patternProperties:
               - type: boolean
               - enum: [100, 101, 102, 103]
                 description: Pull up PUPD/R0/R1 type define value.
-            description: |
+            description:
               For normal pull up type, it is not necessary to specify R1R0
               values; When pull up type is PUPD/R0/R1, adding R1R0 defines
               will set different resistance values.
@@ -151,7 +152,7 @@ patternProperties:
               - type: boolean
               - enum: [100, 101, 102, 103]
                 description: Pull down PUPD/R0/R1 type define value.
-            description: |
+            description:
               For normal pull down type, it is not necessary to specify R1R0
               values; When pull down type is PUPD/R0/R1, adding R1R0 defines
               will set different resistance values.
-- 
2.38.1


