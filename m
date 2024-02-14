Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E27C4829D
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 06:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYKNeKCJBPMaI8CwH2vaV/FLvsnFOMIKN5WCojMYSS8=; b=tp07HEF60P64ZamNgtiABV70Yf
	AwaTR4JdMzSePGme2myaTzXug+JUdKB7K7ZjRoIUiJG4Ks/qOSdekd3pE3/yW+rvliegJ2UYvYC45
	BcMzAq0n+GznWuyY6b3+LX7MD9m0iWrozIe7BBSIsT431vELF4td023+VtsNW/4QsVPJiRydcyJVD
	EA4q690v0NRtsrHQzQcy8mYnnr8DOKTThweHXATrUt9+rstvPRf/cH9698WGtyQfeV5DJqXQEgBRG
	wDDdu9slrymjpLleOjHlhR1kOU8BUo95GQRAY5zPzEHocAxqh45jC7tmIItEOzXiSxrYAgXztw91I
	B8pHajRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra8WX-0000000Bvs4-1qV0;
	Wed, 14 Feb 2024 06:13:37 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra8WK-0000000Bvkf-18uJ;
	Wed, 14 Feb 2024 06:13:26 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5638447af3bso97153a12.2;
        Tue, 13 Feb 2024 22:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707891196; x=1708495996; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYKNeKCJBPMaI8CwH2vaV/FLvsnFOMIKN5WCojMYSS8=;
        b=PHF2qZBUix8CAIxo/31smDcPN+KkBtkOIMmUVKgR9GRtbpRYQWIDNDbCiQWXs/++bB
         qey7fOE+L5Jxf9gz2W8aRPShfRwGPEN6064IbHU4IC+AO37Hj4FIgj8VQm7bzcJOo1hV
         CYBZ4SVkvVI7UTpyIUGnkmWm9tZ7dUnuGol/0y0rHRC0eIMnGTl3VhRVDowpsHf/Dp/P
         C6KIfmC9zWZLQQ5N9JCXcRF5EEw5kZ4Ldz/jlhW/A3DLdYzeZRozPk1ydEB65A5kJ8GF
         AMmjamL+1blXOUUMA+Z8/2Zepa6UWzOFLNCwxH0bY3nvnC7I4X2vLi1gCXp6iSAcMoZn
         ftaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707891196; x=1708495996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYKNeKCJBPMaI8CwH2vaV/FLvsnFOMIKN5WCojMYSS8=;
        b=NEodTKRJC6zkXaSdUKOXr4U0OuT8rKipeua6KAMyq1pKT92KCQ4csst8eR+xbydK2K
         cOEDrRJK8PAwObkkQosZlPaA8jFnOwH5ijptOfvT5piC8E6UpaZaIYtQcCmslfAHmIv+
         hBY1EIuFQ07q+TdZZUFQGmEsfQyvrTzKV5o23KN0Cq2ZEVuR2J+UKMqTHOLxghRDKMRI
         1nFo4iE73bk5cp1C8MRvKRRQ5GsKIE3tp2389v2rBJHhYoBTFJLM7BtdCW034ThiHjOF
         5wLLjfxRK85Hczcj8vKKrtg8UvzdAnQxevLu8xNBCyjVinfGJ6fUYbzAUZ/p/JOGjLUK
         uYPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbwIxcQ3c18gmMfg7mWTXD3oUIR1rjc8NoocwPSoSctxKdGVYcWyU3UEqJz3VCRAyuMabgQG7zRPC3uozGbLBmeJIE1++nHVB4nc3d84y0Xf+Vvgv4xB877evvCMCJolAlV6sSk+PcBJc43B/+40heQ+uQ4GRL32Q=
X-Gm-Message-State: AOJu0YwbXS0JakqgqAXXYvnYmsJkMB+pIAG8UjmA4cxta0DS38CcFHBr
	AYppiy2kUGzA/ZKZUft4GNby5u7edvVf1aHchVLFawCkIewpn0pa
X-Google-Smtp-Source: AGHT+IE6U5eDyqPd4NxbI1MXNFUahg8cw2wNelK2ClmTzwpWQl+yo090cvZ4ToXaF74wBpzTBDLryw==
X-Received: by 2002:a17:906:3591:b0:a3d:3781:6edc with SMTP id o17-20020a170906359100b00a3d37816edcmr724594ejb.55.1707891195657;
        Tue, 13 Feb 2024 22:13:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUA6/cWH8rk10rbePU2FffSK6B1tnl0A12AHsAkeryQ1Y4NTIDw2VRh7L7h5OwCIh85kJItn1tkW8nDQKXdSaAbcfXAcISGoqlZSdZLcZsK9e3IecwolTfoQX+pnRLo/5WBtCCnZy1Hy1bQ6mN34z3QMZxtw+702PRaX2m42qgtZ6QIiOaHzeGAgtf+iUgn7Qi74P+C1Ol67bJJuc+n8oPXJMHkMH1rSmiJ98C961hlXzUp1daeUsX8V6idUE1zu/Hai1Zi3CzOT6EidnB7SbnXsAD8L2oFF9KFopnCA4oxVhbcMxRvHVW+6Ztx7SOzDhqVbNMiS5IWTk7rpVy4b4H5rfPb1H+TfJtkvzTa6lVxO3KSQM6ewbhED+imCe2tUggqbjBkMqdkFkxMVrMuljwGVsHKIRt/AnZq+09sSXdU9NuXO1TA8oeZXrkCwPPc9qQwsCL8M2yKOEG48J/yXUk0otyNZ1ubSeJW6Ewa4tmA+c3h61+wBBFstSebTyxik7fxbbixXpDsh4aL5JYZa+r80dvNpMp27iOcU76U9jYChvZB0gSa1E/v5MzmbZi1A8l2bOz5UrKktVpegMwwI/2wx+XaaMKv9GUd
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id ca23-20020a170906a3d700b00a3caccb8f66sm1980163ejb.44.2024.02.13.22.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 22:13:15 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V4 1/3] dt-bindings: clock: mediatek: convert hifsys to the json-schema clock
Date: Wed, 14 Feb 2024 07:12:31 +0100
Message-Id: <20240214061233.24645-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240214061233.24645-1-zajec5@gmail.com>
References: <20240214061233.24645-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_221324_379425_E794C00E 
X-CRM114-Status: GOOD (  16.20  )
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
3. Dropped "syscon" as it was incorrectly used
4. Adjusted "compatible" and "reg" in example

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/arm/mediatek/mediatek,hifsys.txt | 26 ----------
 .../clock/mediatek,mt2701-hifsys.yaml         | 50 +++++++++++++++++++
 2 files changed, 50 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml

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
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
new file mode 100644
index 000000000000..9e7c725093aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mediatek,mt2701-hifsys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek HIFSYS clock and reset controller
+
+description:
+  The MediaTek HIFSYS controller provides various clocks and reset outputs to
+  the system.
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt2701-hifsys
+          - mediatek,mt7622-hifsys
+      - items:
+          - enum:
+              - mediatek,mt7623-hifsys
+          - const: mediatek,mt2701-hifsys
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
+        compatible = "mediatek,mt2701-hifsys";
+        reg = <0x1a000000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
-- 
2.35.3


