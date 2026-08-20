Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F9FC5DF87
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2026 12:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IxgyMnm2Ery9SpdEpzGlw+pytPm84L4YPgJiijvQrI=; b=t9FMoLK7caaa5s9zMaw0FR0fJc
	hX+blX9K3Csp85y9BE5yAgDdA446pWFiT6H8NByGxZaOyBDblZwunYW0NIzhaPkw54RamrJpUWnJo
	0hTHP+TGC4MBkxrXAYQofsLzsPoGib2vhMvumksNGTQpBzLExVZ5OaCEEXqSw/ASqMoOV5EJ+nLd0
	mFsLW4YhmTIwS55aXg8brOm/ldHCLpIAf5HD2G0MhJvstr+2qcbVzS4R2ooF8pseey+i1e7AcxwCw
	eQwB+Rd2gD0zGZZDyNdIt0Xib3P8EBvimCLbJCD+RRNiyQvdtoA9HA6hGpeXRfd17pdTUElfGlLgn
	+7yoZ3ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1qF-0000000BWwF-2NG2;
	Thu, 20 Aug 2026 12:25:58 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1qC-0000000BWuO-25eq
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Aug 2026 12:25:53 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47fd4531020so1355889f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2026 05:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787228751; x=1787833551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8IxgyMnm2Ery9SpdEpzGlw+pytPm84L4YPgJiijvQrI=;
        b=d6tMsmHak5Wzfozdf9+zlTyt+8NuGAXTurNZCz/yY/qfudF4es9KPbtmx3Bzyx29fx
         +oxTCtCAq3xlajoBUOkeGYOj6ExAriA51FZgW+Km8jrN1aeol+21chKULou/DZ7PNYxz
         Mal9+r6jDsMAuOV9g+QbqnVav+JVsKgbErLNHKVtpfymvnekTvYlU846J5rJwdopkv+Z
         XSi8GnAqWMU7Vk5CikGAvJlr9mYrDrOee+sb1CHqI3PCl1DrkeuH5YlR1lCUHahlMNJn
         IH5gawyYwDMI0tvzEmCVTmZZc1VfFCTA3jNov1sFmvBTH6axs9C0FhtaXrGX3kchGFU1
         zYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228751; x=1787833551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8IxgyMnm2Ery9SpdEpzGlw+pytPm84L4YPgJiijvQrI=;
        b=NA9TobDIPRU5JZjAl/zFZVKX+r+aVgU+s2/K/QGAISEz4/iT+qsSq4KkYOfXO9PRfR
         EJmrCp8hlcn5/3vqmwfa3vjQA11GTE2JmSlsrSG2hjhSyKTH0mfPvpX/LskY/cjzKb/k
         zE0R2r8Tksv3d0ghg19qi+lvElOqi5/ets1Yxwzs4ImsC50Ujpc5zKs2qiIrvu1ol0qe
         ioMxNlxkJQVxb1d1VeGoMXEL5L9kKvS+zD/WH/GLgd6KabdlcaZ8qH9Rawelwd4XKHoO
         kr0FS/tJsxLGEGxD6R3zscvOpBWpd6qOh/QMDVatw7BA2uPba9y4phl8nRmgj/wOqEsw
         C6Lg==
X-Gm-Message-State: AOJu0YysmTUiEHBMt0a7UMQP+j+QTpTplGxdk8rmS+AIv090jZ2EZpgb
	5EPbrtHOxVOItWwcjIBvy6/U24fxAhs63ku76DrPR8yBOVQKHZLVrxekko9ZT8Mm
X-Gm-Gg: AR+sD13yWHGZ+5Ms3ZyqElNJeqkxj1d6Wh9AL0ftSNK4mBMyxMs169iXlxNXgc/j3xH
	SL9ROU15uaVyTRmQ7RxtS8eX3C0XTMclWf+I526MLyCgJ6Zk+80aWxdreXf/wbTazsI8VzBVU2N
	Y+c5fsKlKI6e2pgHecZy0p6K7yaen68lEYuRKNLv4N2rhWIte+4BYmUoUQCw6/OSI71asVCWLQD
	2ZITNzSSRZf7IkARZ2yyTaqrRjthedf84IZ9QgoH5fU9yuqyk13/hC4AspZP+6QaX/im+qilVqD
	dfHuD2i+QWbxREiJx0VSxDtdPcusr1+7o51RMNsruYAk878n461wzm03TxOrdCiZ9MT4fogxgEx
	TdX0QbayC4iCgkuemTeZsmcSz0U5pIYP9h6V1BYOzT0OK7c/DSiYa1XlgEQAb4AH8bTwrPYKns+
	3cv339zVQUTcrRJ3go/eN5+C0xjHblJ9Xx2ye0HWUjIFiewOyevATG2w==
X-Received: by 2002:a05:600c:5288:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-499aa1ea46dmr243508505e9.13.1787228750345;
        Thu, 20 Aug 2026 05:25:50 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499ab2a8b34sm170494645e9.8.2026.08.20.05.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:25:49 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Julien Massot <julien.massot@collabora.com>,
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
Subject: [PATCH v9 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Thu, 20 Aug 2026 14:19:59 +0200
Message-ID: <20260820122242.120039-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820122242.120039-1-l.scorcia@gmail.com>
References: <20260820122242.120039-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_052552_581257_63D9EC03 
X-CRM114-Status: GOOD (  10.62  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


