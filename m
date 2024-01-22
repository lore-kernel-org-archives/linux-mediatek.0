Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CAFC4725D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 12:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WCsG1qVHqedwjqFrj900rKt8IpNXtxQ6hDjxWvk8LME=; b=DvVy8aiNU9zrYR7HpMX8Gg9x5r
	LFT2qJ4K6qvbYeY7rnrvl5piGmt9MCgONGStiL+2cOVxQVbu4uwg+z/ULS8fvbxQcxnqP4H+6jdtN
	1AgeRGeWljwaP8vcYs4i93W4oj/ClsqXz/CvUpqRpSj1Pz3kvE4Df8FN+rHygCsZ8s7v/G0F8Tqz1
	9CWmiNMnpnke8Y964F5DJSPViKwnRXWGI7KdHEZU/HDPi20dR29ojbgROOdaYrdTdEIvZVgMAaWiH
	LVQsahLYRCmo+IjkXljl8q6Wq64535hiapkWYubsvwZKrqLeoeYKhGyWVQYgzx2QXd3xCQmhY7l8A
	GYEa2oqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtkd-00CAe8-15;
	Mon, 22 Jan 2024 12:50:07 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtkX-00CAai-2c;
	Mon, 22 Jan 2024 12:50:04 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a26f73732c5so333582366b.3;
        Mon, 22 Jan 2024 04:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705927797; x=1706532597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WCsG1qVHqedwjqFrj900rKt8IpNXtxQ6hDjxWvk8LME=;
        b=nSN1g0AY+0JtWIy4LIszYZ874hyaegAV8BmgEkEX88XbBvFxO5uI/ho/cUzLjiDUSD
         LrkSwFTAJpmo63HtooR2GR0+jRnfs+0aND8AwP+r9BGTE8hGoZosNNd0p+7/gWpD9HK/
         JHguJ3UAWvc5Nmm9j7qCVt76LNpDitwcXkKO49sEREo+nN6dJ0Gg3n0dVC9v6FoXi6XV
         I8kXz8GEs60m1KO5c/2AuzEFEsHClKbmLrHEwfBp3uEzQYoO+sV8wx8U/Tim4x9u+oZH
         VSj/cnIkJw0u5WzjbOwuutTnJtHFe8/uEM+C2hPaMQrE0yU3nc0vFXy31wWjKnK/7UPE
         2wfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705927797; x=1706532597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCsG1qVHqedwjqFrj900rKt8IpNXtxQ6hDjxWvk8LME=;
        b=OQgsVDD+4QtWH7OkO/nkHjRxIs4pPAYkvnch5I6gsLAQKvgmIRm0rATc1kTMsBa0xu
         Mwdey5GCpOh+t66Q5rUcRI/fzkzPHsYY2OQuGynh9MgBy6y6mnRZvz2z+goWze2COCWp
         6XAKSjleMK1gcWUYalf10oLTjBYHzvsul6VZgvHThOvviJLa169JqRF0F3UDgvI2VSSA
         kTygxUrUwBnulfzHuFK5ES68daDwLyMo9zbs5ljidcOx+dW2VhZPklmpFwTk/NIwe3cu
         EUVTQbQTxQ7pj1vcfTGswGyOKXuosxtZIR7DfmTI3S8g0vUjpoOjmfioOu2QIyQwwdwm
         +itg==
X-Gm-Message-State: AOJu0YzgnQ1kBNZnnLuKWZPCAALdDK4tj7WzHmMoYF4+vflEHUJBcPY8
	oh2DOMA+fZzquzgA2OK+cVt2BZWFVY1LRuwIZ+jsECYO//DQre/G
X-Google-Smtp-Source: AGHT+IE5avahwyww21Ka3m0n0aKAE/n/woz1/5tmBlr1BHE2s3vfE8YTfgSRU/TVkOtb92hxNdpMQw==
X-Received: by 2002:a17:906:6a1f:b0:a30:721d:d21f with SMTP id qw31-20020a1709066a1f00b00a30721dd21fmr574844ejc.143.1705927796956;
        Mon, 22 Jan 2024 04:49:56 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id kw7-20020a170907770700b00a29dcbe1e72sm13250229ejc.56.2024.01.22.04.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 04:49:56 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Ran Bi <ran.bi@mediatek.com>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: rtc: convert MT2717 RTC to the json-schema
Date: Mon, 22 Jan 2024 13:49:49 +0100
Message-Id: <20240122124949.29577-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_045001_848426_FC9F9C4C 
X-CRM114-Status: GOOD (  14.59  )
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

From: Rafał Miłecki <rafal@milecki.pl>

This helps validating DTS files. Introduced changes:
1. Reworded title
2. Dropper redundant properties descriptions
3. Added required #include and adjusted "reg" in example

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/rtc/mediatek,mt2712-rtc.yaml     | 39 +++++++++++++++++++
 .../devicetree/bindings/rtc/rtc-mt2712.txt    | 14 -------
 2 files changed, 39 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt2712.txt

diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml b/Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml
new file mode 100644
index 000000000000..75624ddf6d4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/mediatek,mt2712-rtc.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/mediatek,mt2712-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT2712 on-SoC RTC
+
+allOf:
+  - $ref: rtc.yaml#
+
+maintainers:
+  - Ran Bi <ran.bi@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt2712-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    rtc@10011000 {
+        compatible = "mediatek,mt2712-rtc";
+        reg = <0x10011000 0x1000>;
+        interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_LOW>;
+    };
diff --git a/Documentation/devicetree/bindings/rtc/rtc-mt2712.txt b/Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
deleted file mode 100644
index c33d87e5e753..000000000000
--- a/Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-Device-Tree bindings for MediaTek SoC based RTC
-
-Required properties:
-- compatible	    : Should be "mediatek,mt2712-rtc" : for MT2712 SoC
-- reg 		    : Specifies base physical address and size of the registers;
-- interrupts	    : Should contain the interrupt for RTC alarm;
-
-Example:
-
-rtc: rtc@10011000 {
-	compatible = "mediatek,mt2712-rtc";
-	reg = <0 0x10011000 0 0x1000>;
-	interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_LOW>;
-};
-- 
2.35.3


