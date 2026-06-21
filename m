Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28840CD98F0
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Jun 2026 08:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FtRNx41kTzSfvca25trEUrc2fj2TZslpJ/VXb0q1qg=; b=M50pS6oOwP5zaxioWQzKjMLqXA
	mgYP0gdPg6xXtdeLFGzZkVLJaih87+RV8uCEV2Qqi+5MGBQ0Ef5jX8LWA+ulcqxK8KZCG7WUNzux6
	ZznZs8wX9gxSXuSgoXXkvTlbCzaPO17abChlXOz2hKqe7VAfrxvHxGvk570jA1XUAW+xNQ1BqsoF+
	evj06XNzP0/UrxsvhxzjCgHpjfT+mb8Ve5MM+6gTLpZ5DUARNKwaCLvvaOQ0ffjkoUkhDLI5NXeK9
	hlIx+818FTd6wYHfr7w37dbgeOSNDeBNz8d3wTGcYJiN6MoRpkbld7PghVjjWQmxal8rIXGcJYkmX
	jWXLdRQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbDMd-00000003pZa-0fGk;
	Sun, 21 Jun 2026 08:17:11 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbDMa-00000003pYO-3Uxe
	for linux-mediatek@lists.infradead.org;
	Sun, 21 Jun 2026 08:17:09 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49249072f03so5068225e9.0
        for <linux-mediatek@lists.infradead.org>; Sun, 21 Jun 2026 01:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782029827; x=1782634627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FtRNx41kTzSfvca25trEUrc2fj2TZslpJ/VXb0q1qg=;
        b=Ufll5E88wR8fMpoC5cwUCPDqQL/LNy75fLh/vDFGMuPzqhTHGRX2uDHU3CS4kJFIUq
         mxfq6gav9l1rvFmJSo/JR4AtfB6ElS2de+onHLa0MFFZfiYIXsH8QglHiLeUSjZhDY0h
         PvB4QzxSTRfa/+eBT5L5DGMXDygxoLejzMIfn4+Pmrvoc2DYiAl6ssJODCaqs5CKWZ4s
         x7JODMfYaRYvoKBGisY0i2njvPA27gHCm16b8WwDe35KtF56CxvnPR9vwZ8Ja+ja56iO
         JuyIds43qFqRQVYU4oZJlMr7n5CacWyrbmsn+yS/hp5zZFW8x0L3p+CXmDh07iDmo19B
         xDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782029827; x=1782634627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6FtRNx41kTzSfvca25trEUrc2fj2TZslpJ/VXb0q1qg=;
        b=K73ZtCfw+WEAKv4LWS8Eiz3iVsr+4ToLrY5uYHbdLyZfh+XWd8Nk1zXebzz5fEwMT2
         ial4WgBvVM+hbIjS/OGZZhYEhpqioSK5XIVal2ro3VP0fyrl3mDZ/1cQyaD4WT88IqHy
         uUb86DKRiv4AJ7BooEZsVBNYDOnP1SrYJe/0XTEPsblZMQ24DGk44jsV4j2fszUA0R6l
         jGINcmiLtdk4Dnsy8o2kYKDFYuvARKgic1DdSP0sEH/IV7RfyU/28aSsZ1qx7nDxkAza
         myqET2qnZB5uFlGsB4wC+DM3eGgmEynedGNgJfD4+Cmldqcp0R/y0dAFW4LJ3XEB5XEZ
         Zvhg==
X-Gm-Message-State: AOJu0Ywa3tIx+ucvfe/OH5JxppbfEfJZyAEOL20mheJaItHxb6I6V3co
	Mipvtcw0KtvjHhe9YEAf4sCKjLOdZclPovvXfwK2RZvJ33Pj/cwHHjWP8jzI1FXl
X-Gm-Gg: AfdE7clGRudbKdNYCEoX2Tq/QuuR38yLRHbRtfk5HQ4VedSGV3YlZOebsPwAqHqpLaa
	XHyGgOmUcWMdMYPY0oXPk7uIDabgC9j9Ya02fuOajg8F8GP0s/E4WLC1rwkVq0oMyJG0pZqF4kH
	4bBbwQiu5YOCQzRx/4+G3VyaFlI2O08y37mRo/EF8aGgBu7SMhDO/fAbAy395SHtKcrIAXOV58r
	/3/1Jxyji2v2LjzdypoWvgHo0H4kCGz+y0PDo9KNXoZip4bBOIoiyQVNr3ix2BJAIxAa2jMUbL8
	Ldn0urWPbxms7JSiCdPJD1L2kfmbHmakqhHe5I5Mlyk4NwfTP07djD0VS2Cp5SvryCpnmEIGawi
	uMaaIalUhJLFXatmzj2KDTy2sgNLnms0DM1iOZrE8vWA7bB/zXzoDfjDBDv5SBmvnxIdMAs9rQC
	jnftj8jg==
X-Received: by 2002:a05:600c:468c:b0:492:3c7e:57aa with SMTP id 5b1f17b1804b1-4923eeb494emr165616195e9.0.1782029826761;
        Sun, 21 Jun 2026 01:17:06 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fe7b9e5sm194100445e9.10.2026.06.21.01.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 01:17:05 -0700 (PDT)
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
	Val Packett <val@packett.cool>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v9 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Sun, 21 Jun 2026 10:13:26 +0200
Message-ID: <20260621081634.467858-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260621081634.467858-1-l.scorcia@gmail.com>
References: <20260621081634.467858-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_011708_900623_E4434660 
X-CRM114-Status: UNSURE (   9.90  )
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

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../bindings/mfd/mediatek,mt6397.yaml         | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..fd4b41bd3716 100644
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
@@ -72,6 +76,10 @@ properties:
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
@@ -99,6 +107,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
@@ -663,3 +672,69 @@ examples:
             compatible = "mediatek,mt6397-rtc";
         };
     };
+
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pmic {
+        compatible = "mediatek,mt6392", "mediatek,mt6323";
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


