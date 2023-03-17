Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D982C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 21:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=imSdKESnCC1MBR2YzRMTFgBDDXfRknOlbZyCB5yh06c=; b=KBThCwSauEIzrM
	o00XpYN++SDabGmaRr4tjFzy8qJkjcc/pDDwnXWuVJvP+j7lofitwB9OhLFcdD7Hh8WgZSfZrMJeb
	srjlSweJF6MK8Tl8E/U30eEAeTB0K5qyT6VnwjZ/LOTCxJMzI0U3wD1bqkzZDSo+W3TcqHZhaBice
	wHQhkhiljcyCYlQ09MF5GI2+9v8c0yHOoCfAoYGu60P4sYYNBf3WrpyLu6Z891koaLY9Bwovwajhc
	CPhXObPISGefwR9iGo6lp8glhn+z/BwBNLgT1ryDnUzWJ42gX96JJdUPNNFHFExslASNLwQhG/PMT
	OZQoGAjnypotUvvyL2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHfQ-003SQc-1D;
	Fri, 17 Mar 2023 21:31:16 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHeo-003S1L-2Z;
	Fri, 17 Mar 2023 21:30:40 +0000
Received: by mail-ed1-x52e.google.com with SMTP id fd5so25399281edb.7;
        Fri, 17 Mar 2023 14:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679088634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imSdKESnCC1MBR2YzRMTFgBDDXfRknOlbZyCB5yh06c=;
        b=JpHfGble1mO+xcp/MJMztTDj9xhTtiLor+bYEdLI2j+CbiKfj6pQZajunr6s9uU9ud
         424aZrWQEiuUogLWsrw5kil7ZmeNWSuElQDYEFMwguMZs3/3auF6REcyjMSklXet3NHl
         bU4o8xEQCn3uXkOBxVLjSek+90M2CfqE7CWQZ8zuieX2lcrpU0mqWpB3IPR0et2ch0TW
         L55HOaHsPn+R8lQoEFI64bua6fYLJEk6jYpASKKQ19H/1WbEATMffqTal+IQDxMn1Ql9
         NHdskLK+huMK8f/opAunI1XLOsEGXXpGSGgSvea4UunYov3kOEAkgWL7Vy6Uan8zOxxM
         UO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679088634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imSdKESnCC1MBR2YzRMTFgBDDXfRknOlbZyCB5yh06c=;
        b=HUgMRqt78xRlyfkVICGTtQdQWznuC3HVta/9f3uAF5DF6AWN0U2ONdjmE5Y0H7weGn
         gtZbK3YPikeCdQ/1rVjoaiClLxygE0y7S1kJA8pXDz9PgEB884V3oxVWeHcwRnfZZZCR
         EywZdotDTZctfsciezsKrcs0RxZXmGrdn0lkEv4gcQXTsFRH9uS4tJWPBngkdBxRD++6
         wUDvfD6bOCPYE/iBpFfEaNd/tJ9CzJoUZDzkabn2ZRG2g5f2qMr/0PR3zzrK6IMUFaFY
         COptb+d/vQ6PQGFnECD0U+epJn6aLM817nrDAP2DRhNg6AYPbdmihaoAfBUB7rowQalo
         0odg==
X-Gm-Message-State: AO0yUKVbu9ragzcxAnOT3YX6Krp7kbe7xvy68jSfW2CWk03wgGad/HEW
	gCqb7lmdSMJxwQ7f8pFMC5w=
X-Google-Smtp-Source: AK7set82qp1rlYyl24drBNGiPpp0eT3ew+aSiuh+pteB/kV4CuKFvgRKtmCOw/3Y7DBorEs2QKSR+Q==
X-Received: by 2002:a17:906:4704:b0:84d:4e4f:1f85 with SMTP id y4-20020a170906470400b0084d4e4f1f85mr638914ejq.59.1679088634214;
        Fri, 17 Mar 2023 14:30:34 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id v19-20020a17090651d300b0092b86d41dbasm1404683ejk.114.2023.03.17.14.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 14:30:33 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 07/21] dt-bindings: pinctrl: ralink: drop quotes from referred schemas
Date: Sat, 18 Mar 2023 00:29:57 +0300
Message-Id: <20230317213011.13656-8-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230317213011.13656-1-arinc.unal@arinc9.com>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_143038_862911_AC9B909A 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, erkin.bozoglu@xeront.com, Rob Herring <robh@kernel.org>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Drop the quotes from the referred schemas.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml      | 2 +-
 .../devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml      | 2 +-
 .../devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml      | 2 +-
 .../devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml      | 2 +-
 .../devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml      | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
index b25e0db77cb3..cde6de77e228 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
@@ -636,7 +636,7 @@ patternProperties:
                   enum: [i2c, spi cs1, uart0]
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
index 60f6273930f5..fb8c5459ea93 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
@@ -240,7 +240,7 @@ patternProperties:
                   enum: [wdt]
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
index 4f3e0af7d18f..e51667316b2e 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
@@ -120,7 +120,7 @@ patternProperties:
                   enum: [pci]
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
index 9e45d851def6..8b1256af09c3 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
@@ -253,7 +253,7 @@ patternProperties:
                   enum: [spi_cs1]
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml
index 4bea19d4ad7b..adc4f42a175d 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml
@@ -240,7 +240,7 @@ patternProperties:
                   enum: [uartlite]
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
-- 
2.37.2


