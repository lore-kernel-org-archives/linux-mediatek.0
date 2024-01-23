Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E74C47258
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 08:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0AEjAgTGGFMtUqCGTJO2UhVRa/rSiFP8yyo/+7uwmo=; b=MKeUnlhZq7QpFAr/0Vmg8XwsI1
	fx5g7OnTHT8qYO7F8NQRNqfH9F0kX+SBPOWXxDXHXSKPEmiuDyvvj+RjiPykLCVd3gn4XrO8THId1
	VxEee996sTlKMr/VhjVgdhTlCaXegZ7sAZPDA4lvHJndRD0u/1oBelCZmqdfi7R6IecudvzDDjzZO
	TaVo5HEViQHPToDMgO3OzWKMVL3uS/UkCCRqjqVvWTI5Xq1Ig4E1+4STqHX6gyno6QRuwyykK/od8
	eVdXqhWsqJLLetKHql95zgtCiEJp9pZ/Bqam1hBHBiPbGSvGDmKvEzMMgKpWv8Djns9YWWpTw9SnD
	3dGPXsrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSC2d-00FWdu-11;
	Tue, 23 Jan 2024 08:21:55 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSC2V-00FWa8-2k;
	Tue, 23 Jan 2024 08:21:49 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-55817a12ad8so4424380a12.2;
        Tue, 23 Jan 2024 00:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705998105; x=1706602905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0AEjAgTGGFMtUqCGTJO2UhVRa/rSiFP8yyo/+7uwmo=;
        b=X+serWny+Lk7kUig6FO2rbQA/4FgXEEcVWEXOgXmaYCUKg2bTBLo3IvrAntMSqz6BH
         YSuLA40Y4QAVio0/Vqhd3fIPi5919QaVh8s68sz0Dtaz2mYk7gBYzde6WOULTr2YNlKr
         SCSSdOZlmebmOxFSaaBDXW+xfJGrOYVG03hofXQ1++/mrgpujOjxrdTl2Cmg6lqtdXCl
         06TGp+wJ+JZXNc9WsyxJk0pAc8+GpXihs2dBGQtaZOz6kfG4KslfnV5MP+ziSWdNdWsI
         oB5z7IUb8BuWG/rB72J9FvhWag9fKjgpCmwmabjzcAmnqMUlRlM/ry2XwTYjnXezEnxr
         /spA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705998105; x=1706602905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0AEjAgTGGFMtUqCGTJO2UhVRa/rSiFP8yyo/+7uwmo=;
        b=te+LszCggN1t5DD7pP6MRcU6AsN3OFo47Lh9PYs6RGZz2m9TVEdWaBVpTbQlH0355l
         VekdDRmv8LPf/MiXh/fXvMeKmavvxtj3mCOj3UP3RG7DbWKJbGMqV5gL2yn+vJiNEUSK
         7VIHwHrvXDNK5Dh45w9ybpvpS7en/zvL90wLhnGcYNQyCafcDhdpdcaGxs8MLpKhHm8g
         l4JpZji+flZT0HIJZ245eJ0/tX47YoOhYtOB6EDOAcfz6dToXy6Xg4ylEgqhaFRgcolt
         awSM8QT41xPoLrv4X7596aFjoIAYutaX/yPq4lAX4nHMCtlpLpq3T/Dnkt6IT86nA32z
         2UHQ==
X-Gm-Message-State: AOJu0YwVrNJ+L/kfX9Jj49jHhJxCV/L3Oh8rl7cWnDj9Lto8Tq28lgd3
	lbTbmwSw25GxGSlt15bSKQHrUjBD7hVZBXWLjwgU1klyHWAgpclk
X-Google-Smtp-Source: AGHT+IFqyvfBHcMnmtge3pmJlzokQ72yrfVfJpGffdlahMNIUJ7oKdfR2E7/e4UDrY5ANyfC8Q3ESA==
X-Received: by 2002:a05:6402:40cd:b0:55c:876c:ca06 with SMTP id z13-20020a05640240cd00b0055c876cca06mr298074edb.29.1705998105575;
        Tue, 23 Jan 2024 00:21:45 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id u11-20020a056402110b00b00558aa40f914sm14810435edv.40.2024.01.23.00.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 00:21:45 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/3] dt-bindings: arm: mediatek: convert PCIESYS to the json-schema
Date: Tue, 23 Jan 2024 09:20:59 +0100
Message-Id: <20240123082100.7334-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240123082100.7334-1-zajec5@gmail.com>
References: <20240123082100.7334-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_002147_886724_17B54EE9 
X-CRM114-Status: GOOD (  16.84  )
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
1. Documented "reg" property
2. Adjusted "reg" in example

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../arm/mediatek/mediatek,mt7622-pciesys.yaml | 47 +++++++++++++++++++
 .../arm/mediatek/mediatek,pciesys.txt         | 25 ----------
 2 files changed, 47 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pciesys.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pciesys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pciesys.yaml
new file mode 100644
index 000000000000..7340a2512402
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pciesys.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-pciesys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek PCIESYS controller
+
+description:
+  The MediaTek PCIESYS controller provides various clocks to the system.
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt7622-pciesys
+          - mediatek,mt7629-pciesys
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+    description: The available clocks are defined in dt-bindings/clock/mt*-clk.h
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - reg
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    pciesys@1a100800 {
+        compatible = "mediatek,mt7622-pciesys", "syscon";
+        reg = <0x1a100800 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt
deleted file mode 100644
index d179a61536f4..000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-MediaTek PCIESYS controller
-============================
-
-The MediaTek PCIESYS controller provides various clocks to the system.
-
-Required Properties:
-
-- compatible: Should be:
-	- "mediatek,mt7622-pciesys", "syscon"
-	- "mediatek,mt7629-pciesys", "syscon"
-- #clock-cells: Must be 1
-- #reset-cells: Must be 1
-
-The PCIESYS controller uses the common clk binding from
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-The available clocks are defined in dt-bindings/clock/mt*-clk.h.
-
-Example:
-
-pciesys: pciesys@1a100800 {
-	compatible = "mediatek,mt7622-pciesys", "syscon";
-	reg = <0 0x1a100800 0 0x1000>;
-	#clock-cells = <1>;
-	#reset-cells = <1>;
-};
-- 
2.35.3


