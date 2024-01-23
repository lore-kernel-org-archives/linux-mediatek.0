Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD4AC47DDC
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 08:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhtLzN2peOVLFpsd1om60a/LkFzwt1x9izkXcUJXVvE=; b=yfEAAFNiRDKDX2DfovvEnnDdHs
	hvVGUXHDLhpFw3SWYUH5Tc53vBRPt8W8OW6RiUaInhriLGlrGC5gnbCS0kntTT1J9OiNBRSyuUl3W
	T8ZilXe2B04cluyjrWAfhdUgGz8j2dHQHEo//q0BrGwvmgbycqBbLnSH+gfZjdf7rQz9UcoxPwESR
	1w8zbamwRfAygpml3mximWuCgfto6EoAAwfuVPF54i0fo4rcdzvfijBGkS4xVh+L7KjHyh2jwHNAR
	6zZAuHwH2QrZTA+ymCRRvG2lInqXAwSVthnOKJhJ/u+Q7YpX/qfnuWGb9h+/c+ZkuvkHFEDbDl9GO
	nEyhYWMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSC2e-00FWec-12;
	Tue, 23 Jan 2024 08:21:56 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSC2W-00FWZL-0F;
	Tue, 23 Jan 2024 08:21:51 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-55a9008c185so4436640a12.1;
        Tue, 23 Jan 2024 00:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705998103; x=1706602903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhtLzN2peOVLFpsd1om60a/LkFzwt1x9izkXcUJXVvE=;
        b=HnW1rNytkfdJUsVBqIXw1Z6iyS6UAutZlwXVjg9aKkYShgVmQJSPoskHnxMrTxdZ3f
         r+7Ip6RqFW/n7lASgNzDkiZ/bGiXHWaVRHKlBp21WW1u9R0cgT9F5x3pjGCYQ5M4dx5X
         7HFGWgLrZL6i/CIJ3Yn0fV4+mnqZOmMX2jJq0V6TvPKHbvcu2gofl3UIp41nACeg/G6b
         ri6fO28+YrKpj6X1REKH7ggQL/P28yOpBe7Z3gcWhtA7zA1uG/8gZ+tize8qV6xR1C5W
         yl8T3P3qhdf6P5+RDkqpnfTud0nCrfG5FM1odxinYQFpfj+v5pcnErRIuwvUu+epNjKJ
         1sWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705998103; x=1706602903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhtLzN2peOVLFpsd1om60a/LkFzwt1x9izkXcUJXVvE=;
        b=uOoh5FxVF4aBipkBg2r63sc+VmnWgffESZSpxUsZS+n53qCMRbpxf+zVge5yjDz2kD
         JAqwiPt4VG2a1SS4tMYf9Z7iVRlYiR5xiHynWq1gSfQg2RNkADqIKKefagPG5BSvkq7s
         /zCClLXGbIp6h9knfYfuMGTuZRvP2l3HlJo1DLCyBEKx5Y5Fn9bd8Wlm8q6plF4Op46+
         Md4owHApiy7Fgv/COgtOCspdZvtGS4cHySbTPOG/AFplYig1UYLz6uYFNvWcCA1uQvc1
         yEqVyazi3JvYXcSXisKTPv2rV3pAh8EAC2HbxL75FIfygZWVnGGwlp84+f/8ULQNE3CG
         kx9w==
X-Gm-Message-State: AOJu0YxQnBTNJ1e503YG0YJT6rpFfKPFZGiTl/OSY2ZUtWKQAMxBkl/D
	LGQqvXHgCUXnQG4WADt2c3xd/oM3zWd2CKuIkBkhhssSAEeaBkcC
X-Google-Smtp-Source: AGHT+IFeT+fo7zdhLsWc7f2e9OUeawo1w/aO0aT4blSPx9Q4BKgzyaYapF2Et1MrqUvz7urpg1k9LA==
X-Received: by 2002:a05:6402:268f:b0:55c:828e:4bfa with SMTP id w15-20020a056402268f00b0055c828e4bfamr715282edd.12.1705998103286;
        Tue, 23 Jan 2024 00:21:43 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id u11-20020a056402110b00b00558aa40f914sm14810435edv.40.2024.01.23.00.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 00:21:42 -0800 (PST)
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
Subject: [PATCH 1/3] dt-bindings: arm: mediatek: convert hifsys to the json-schema
Date: Tue, 23 Jan 2024 09:20:58 +0100
Message-Id: <20240123082100.7334-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240123082100.7334-1-zajec5@gmail.com>
References: <20240123082100.7334-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_002148_112559_6FD9611E 
X-CRM114-Status: GOOD (  16.43  )
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
2. Documented "#reset-cells" property
3. Adjusted "reg" in example

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/arm/mediatek/mediatek,hifsys.txt | 26 ---------
 .../arm/mediatek/mediatek,mt2701-hifsys.yaml  | 54 +++++++++++++++++++
 2 files changed, 54 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt2701-hifsys.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
deleted file mode 100644
index 323905af82c3..000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Mediatek hifsys controller
-============================
-
-The Mediatek hifsys controller provides various clocks and reset
-outputs to the system.
-
-Required Properties:
-
-- compatible: Should be:
-	- "mediatek,mt2701-hifsys", "syscon"
-	- "mediatek,mt7622-hifsys", "syscon"
-	- "mediatek,mt7623-hifsys", "mediatek,mt2701-hifsys", "syscon"
-- #clock-cells: Must be 1
-
-The hifsys controller uses the common clk binding from
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-The available clocks are defined in dt-bindings/clock/mt*-clk.h.
-
-Example:
-
-hifsys: clock-controller@1a000000 {
-	compatible = "mediatek,mt2701-hifsys", "syscon";
-	reg = <0 0x1a000000 0 0x1000>;
-	#clock-cells = <1>;
-	#reset-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt2701-hifsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt2701-hifsys.yaml
new file mode 100644
index 000000000000..7c7b7b7b1142
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt2701-hifsys.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt2701-hifsys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek hifsys controller
+
+description:
+  The Mediatek hifsys controller provides various clocks and reset outputs to
+  the system.
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt2701-hifsys
+          - const: syscon
+      - items:
+          - enum:
+              - mediatek,mt7623-hifsys
+          - const: mediatek,mt2701-hifsys
+          - const: syscon
+      - items:
+          - const: mediatek,mt7622-hifsys
+          - const: syscon
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
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@1a000000 {
+        compatible = "mediatek,mt2701-hifsys", "syscon";
+        reg = <0x1a000000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
-- 
2.35.3


