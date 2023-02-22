Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1D5C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 18:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93GncC/YMq/sLoJhUEjsPCJ56rRoBeF7sm8+y73s7Mk=; b=NtR/XL5lLa2hpX
	pPULnF9Zwy07RwMBp2/hjp3VQLloWWV7YnQzDBEnDQg8pGIZ6Yrjsb933HMqgVjt25cP96fYkEJ6C
	0zsQDYKvmgBi81sQfH5509YcwvOI2JhdNnEgLUBSm6K0sjA+zaqNazE0zYL//EXqzQ3Coox1XGGGg
	SyuKf80DbXPzuQyEhqGd3WBKeKU1lCSGzRnE62ne9170uI6T0qaL8/aFOfFYei8A5O7qrq83fNvGO
	T0gwv04Vns9rP8cXWH2trLjv6TUU9x4OJLNesW77y4H1lRpQFXf6QLc8jnn0zFxwWsUTisCuDo6I4
	qJ3siF+1JwZR13MFLRlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu5v-00DVtH-Vj; Wed, 22 Feb 2023 18:44:00 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu2S-00DTqB-9O; Wed, 22 Feb 2023 18:40:28 +0000
Received: by mail-wr1-x42b.google.com with SMTP id r7so8586795wrz.6;
        Wed, 22 Feb 2023 10:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93GncC/YMq/sLoJhUEjsPCJ56rRoBeF7sm8+y73s7Mk=;
        b=E+Vb5T8FT+Ye+67Qb+aNplspFmHXbtd5U08wTEttHwIwNpkiYDC8uD5NQSx/f/ZpjF
         Os7FrxTTU43Zrp7+2dvjzaLH+pm8N/PBaigLPTcEXubTqWPFoPtdDvC3maibU+2t1Fof
         Fu+Bh1plW8gl8lieS+ZhJjtNR94xLuyKtLJ+9xTTgrAmzr+tb2utmVMJ1jPnJ6p6NR+H
         yGWNnJEI8BZ5jNTqP7ETWO3fShvvgJ7N0W9zDWt3iWiniUUO9PjA+7k8SLmfyG4VXiaR
         454D6qbHzW6vIBUJ9oMgKrqwDvnNC/G/D21tMlDnBp+71Et5NfMRxGLtKPU/O2qarBey
         /PFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93GncC/YMq/sLoJhUEjsPCJ56rRoBeF7sm8+y73s7Mk=;
        b=RoVIYm5dVOF47eKiC2EwGoeVyugsD1A03QpJPt21VrvaxtSOfnSCK4e7zFMamNyd3D
         b7TLonqow10ZGCc/vqN3q6uMQmrzP9peNoMr9gUlJqdtGRUtPUIEi6X18JQNWK/rWFEp
         xWVawSWUet5hw89pia1jPcUhTG/t4bbl/hyAQr8010CbZycRVoB92/Zd77hGYrXlkk3X
         xpLZC/j8yOVEAYDA8vUOvXCRh5APkI3weT9TK1nOdpxEx8NA1Fb9cWnUpseSCIKeQPIy
         VQikryQDB6MQQ3u+58ljJysovrQ6PhB1qbs3W9q1k0/y2oKKOL6KU18tYSPzpfaf72X/
         8V2A==
X-Gm-Message-State: AO0yUKVP92IUw+qZ+yknzvCJixCrLn4KC4VxHTsYiDJatv9LjXaB+XDu
	RtjSn9v1Ws5wr5vMH98M2kY=
X-Google-Smtp-Source: AK7set+5TsQLLq8jvQah+3Ch7FDP4duQj6VzOpjRIUXYKG9wJPfXn9hnPOz+M9oBSvDU76T6n9ORQA==
X-Received: by 2002:a5d:67c8:0:b0:2c6:75be:f2d7 with SMTP id n8-20020a5d67c8000000b002c675bef2d7mr6843257wrw.51.1677091220529;
        Wed, 22 Feb 2023 10:40:20 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id l18-20020a5d4112000000b002c56179d39esm9372845wrp.44.2023.02.22.10.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 10:40:20 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [RFC PATCH 07/16] dt-bindings: pinctrl: ralink: add new compatible strings
Date: Wed, 22 Feb 2023 21:39:23 +0300
Message-Id: <20230222183932.33267-8-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230222183932.33267-1-arinc.unal@arinc9.com>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_104024_412502_DB631063 
X-CRM114-Status: GOOD (  10.72  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Add the ralink,rt2880-pinmux compatible string. It had been removed from
the driver which broke the ABI.

Add the mediatek compatible strings. Change the compatible string on the
examples with the mediatek compatible strings.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml | 7 +++++--
 .../devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml | 7 +++++--
 .../devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml | 7 +++++--
 .../devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml | 7 +++++--
 .../devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml | 7 +++++--
 5 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
index 1e63ea34146a..531b5f616c3d 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
@@ -17,7 +17,10 @@ description:
 
 properties:
   compatible:
-    const: ralink,mt7620-pinctrl
+    enum:
+      - mediatek,mt7620-pinctrl
+      - ralink,mt7620-pinctrl
+      - ralink,rt2880-pinmux
 
 patternProperties:
   '-pins$':
@@ -647,7 +650,7 @@ additionalProperties: false
 examples:
   - |
     pinctrl {
-      compatible = "ralink,mt7620-pinctrl";
+      compatible = "mediatek,mt7620-pinctrl";
 
       i2c_pins: i2c0-pins {
         pinmux {
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
index 1b1d37b981d9..74923ca35c81 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
@@ -17,7 +17,10 @@ description:
 
 properties:
   compatible:
-    const: ralink,mt7621-pinctrl
+    enum:
+      - mediatek,mt7621-pinctrl
+      - ralink,mt7621-pinctrl
+      - ralink,rt2880-pinmux
 
 patternProperties:
   '-pins$':
@@ -251,7 +254,7 @@ additionalProperties: false
 examples:
   - |
     pinctrl {
-      compatible = "ralink,mt7621-pinctrl";
+      compatible = "mediatek,mt7621-pinctrl";
 
       i2c_pins: i2c0-pins {
         pinmux {
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
index 7fd0df880a76..aceea6248614 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
@@ -17,7 +17,10 @@ description:
 
 properties:
   compatible:
-    const: ralink,rt2880-pinctrl
+    enum:
+      - mediatek,rt2880-pinctrl
+      - ralink,rt2880-pinctrl
+      - ralink,rt2880-pinmux
 
 patternProperties:
   '-pins$':
@@ -131,7 +134,7 @@ additionalProperties: false
 examples:
   - |
     pinctrl {
-      compatible = "ralink,rt2880-pinctrl";
+      compatible = "mediatek,rt2880-pinctrl";
 
       i2c_pins: i2c0-pins {
         pinmux {
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
index 4d66ca752a30..4c87fe201809 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
@@ -18,7 +18,10 @@ description:
 
 properties:
   compatible:
-    const: ralink,rt305x-pinctrl
+    enum:
+      - mediatek,rt305x-pinctrl
+      - ralink,rt305x-pinctrl
+      - ralink,rt2880-pinmux
 
 patternProperties:
   '-pins$':
@@ -264,7 +267,7 @@ additionalProperties: false
 examples:
   - |
     pinctrl {
-      compatible = "ralink,rt305x-pinctrl";
+      compatible = "mediatek,rt305x-pinctrl";
 
       i2c_pins: i2c0-pins {
         pinmux {
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml
index 008d93181aea..71049a2b2779 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml
@@ -17,7 +17,10 @@ description:
 
 properties:
   compatible:
-    const: ralink,rt3883-pinctrl
+    enum:
+      - mediatek,rt3883-pinctrl
+      - ralink,rt3883-pinctrl
+      - ralink,rt2880-pinmux
 
 patternProperties:
   '-pins$':
@@ -251,7 +254,7 @@ additionalProperties: false
 examples:
   - |
     pinctrl {
-      compatible = "ralink,rt3883-pinctrl";
+      compatible = "mediatek,rt3883-pinctrl";
 
       i2c_pins: i2c0-pins {
         pinmux {
-- 
2.37.2


