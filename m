Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1380AC624DA
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 19:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=caCex+BmvEH7ghZImY6FVecBuOi80GskXDf2a1gswus=; b=PufpKDSLJkW5bKwOaH6uuc2rut
	pD0yRpVcW7C1myfAVL5cLWB5h3XrQ6ouSGeRjBWsWOfphhlQquvSIYZ3mxYIUbrrivf5Z5DuJNyY+
	tSifDnL5ndUI7ESfuB53rHGpkD6v3bE7gdU3+nHh2FdxY14E1DG8Z9nqAyX4Wy6a4YiH/eGpMYWul
	7Bt1NhKiReHvJ6qjyB8ICynFjCxc897+kniw3vyk+/HtPD042cO4b7FnGRf5Nsz2gW8EEFKAEaJ5L
	Loxg6O6hb7vcW7VyLBGBF4IxtWjC6xV96z2vvNv0bc8baaC/G+JWetG+gElVn9NKUgjgCBa6pAGaf
	m034fCKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qjJ-0000000Fixr-2S5M;
	Wed, 02 Sep 2026 19:34:41 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qj8-0000000Fis8-396O
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 19:34:40 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4843e9c5960so1475987f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 12:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377669; x=1788982469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=caCex+BmvEH7ghZImY6FVecBuOi80GskXDf2a1gswus=;
        b=VZnA17yIfWjFiCAd2D4QoQowfP+kL9N9CfDrTMLTEVO8UFiBZIWc/M3tDMtN/fMbHD
         gYPkNYdBUyUqMewuG/khUw8ZFluOEyoHC4GyFv5iw9y7BuWZwNp8yqEGCckPJtTgkLVG
         /qRhFbCTMqZC5sL6ivn7FC6AsfQkqVBbNRjWRejG4pF54xUHivHi7FySLqKAxrKbv+4B
         6C7qZh/cpjdZJZxKO5s2+4nZWYtBUpZO28vekXGvBRGZEEfDiGQeNv+kOzlcIScqbSQZ
         NOnBQEQcH6SfUNjSVQbeFu+Rnlj0aMikIPfXdHwCly0ejpZGfclxhhp/pt9BoytCJfOY
         g63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377669; x=1788982469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=caCex+BmvEH7ghZImY6FVecBuOi80GskXDf2a1gswus=;
        b=kw8xhnxTrtYBH2DSogcja2UoKTAhtPlWPle8yv5E3Zj5mjEYnH4nbOHaKbhPE72bMN
         cpUMqDsxcStUptnBFvT24JaXIJQnNdeN/jgh2Cq34jAbYEKUYX7+tqdN0wVtNjBsjzmF
         TFH8gPZ+GfC93CSlxzKhNqmDXFbowFY54dCYkr4t9KI+aDNpo5VZ/MvfW4fKno3eUMwK
         LtcEs+FGqn+mj91feyZC6oaGZBtpRaY7dUPuirMxFnC5BOnCWKFce/xCNgTWz8ZOuOfY
         LYJt9A7cme4sTX6bwPdivUA4rVTAYsAEphGN/2c6heqrD6Pp4Qbtz5pYYn3qmubKQEDu
         dxMw==
X-Gm-Message-State: AFuF++mKtZwtqhAa8cxIq67gzO3aSmmqqlLI3c+BEwiYP9pEkvH0tnSB
	074SK6uelTV/Dq4huzFGgl3pkATZpLjXFwxHth0F91RVarFwThkf/oKMLsW6Hx1u
X-Gm-Gg: AYBFou3Fm8SekueaDBEC3PgTIfHh0tNf8K8kKqPlbp1fEH2aYDyZdmwn8JBCz3EKa9j
	0Rz/mSZINtW+KwPEqntbzMLoPZ0iTZtpSSaqCjxc2y3ibZgPInxEgbj5+D7pSykjEcgQUVgfdiE
	hH+7soyCPt2ft/bTStXEShZu/gMGZxTGEmncFFBmEvMnMsOgy0MLhErmcZIzsOgGlAYNfVsgEL4
	eDVAOGxB/x75BXlXo4Is30NA+UP0eHn+jK9q7vwEeao8akUAaVD83+P9NEYt6WogA0lwytjc5Aa
	UXCiJnYTQxeohJ9GHJloLd1xCr6b4jjp+LKq9slQe+Nla+WjjnDlDrHm5NwOpSfZzasLCKukmzd
	1fxNAMsGSEhYwOonE8F6vWYtH5JQK+giI6IzJK4kqBUWQO6C5fRsVJRzXIuFNN4TFr5iutQJqEy
	xlUX5yPY+YEOR5MwtifGrhhpVISuFsqTnZcNKKCZKnecYr9tOTgFptuxaM
X-Received: by 2002:a05:6000:4819:b0:47f:e748:3ae3 with SMTP id ffacd0b85a97d-48488deedc7mr13797916f8f.3.1788377668785;
        Wed, 02 Sep 2026 12:34:28 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cdc37sm8889191f8f.34.2026.09.02.12.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:34:28 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
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
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Wed,  2 Sep 2026 21:25:37 +0200
Message-ID: <20260902193351.185771-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902193351.185771-1-l.scorcia@gmail.com>
References: <20260902193351.185771-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_123437_015266_DBBB9CEB 
X-CRM114-Status: GOOD (  15.20  )
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

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
Previous version of this patch had the PMIC device declared with a
fallback compatible to "mediatek,mt6323". Sashiko pointed out in [1]
that it would have been wrong as the fallback device is not really
compatible with the new PMIC.

Since the change is significant I have not included the Reviewed-by tag
that Krzysztof Kozlowski kindly provided in v9 of this patch, I hope
this is the right thing. I really want to get the bindings right as they
are harder to fix in later commits if the need arises.

[1] https://sashiko.dev/#/message/20260820125850.3B34D1F000E9%40smtp.kernel.org

 .../bindings/mfd/mediatek,mt6397.yaml         | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..06e93c545e3b 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -39,6 +39,7 @@ properties:
           - mediatek,mt6328
           - mediatek,mt6358
           - mediatek,mt6359
+          - mediatek,mt6392
           - mediatek,mt6397
       - items:
           - enum:
@@ -72,6 +73,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
@@ -99,6 +104,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
@@ -663,3 +669,69 @@ examples:
             compatible = "mediatek,mt6397-rtc";
         };
     };
+
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pmic {
+        compatible = "mediatek,mt6392";
+
+        interrupts-extended = <&pio 28 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        keys {
+          compatible = "mediatek,mt6392-keys";
+
+          key-power {
+            linux,keycodes = <KEY_POWER>;
+            wakeup-source;
+          };
+
+          key-home {
+            linux,keycodes = <KEY_HOME>;
+            wakeup-source;
+          };
+        };
+
+        pinctrl {
+          compatible = "mediatek,mt6392-pinctrl";
+
+          gpio-controller;
+          #gpio-cells = <2>;
+        };
+
+        regulators {
+          compatible = "mediatek,mt6392-regulator";
+
+          vproc {
+            regulator-allowed-modes = <0 1>;
+            regulator-initial-mode = <0>;
+            regulator-min-microvolt = < 700000>;
+            regulator-max-microvolt = <1350000>;
+            regulator-always-on;
+            regulator-boot-on;
+          };
+
+          // ...
+
+          vadc18 {
+            regulator-allowed-modes = <0 2>;
+            regulator-initial-mode = <0>;
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-boot-on;
+            regulator-always-on;
+          };
+
+          vefuse {
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <2000000>;
+          };
+        };
+
+        rtc {
+          compatible = "mediatek,mt6392-rtc", "mediatek,mt6323-rtc";
+        };
+    };
-- 
2.43.0


