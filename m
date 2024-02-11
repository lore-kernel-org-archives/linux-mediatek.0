Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF13C4829B
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Feb 2024 21:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYKNeKCJBPMaI8CwH2vaV/FLvsnFOMIKN5WCojMYSS8=; b=cGwknEGiWcK5WrPUNFN7STS5LH
	0KO1cYZGsaqGIyWm9nYmCifP8okCp1I9qKbzn1Nd0IXTfwRaEEzTwUXSGWD8I96sFSK3UUrhuN8ME
	szM3+wNsEOHoePy2/shwNyGI67AdYdgoMU94Mvzrm5yuRvFnjCfhc64dLgZjBwKL1bfeiCWLL6AMR
	yct1b6DrkELFPP4NfovNZKOnNIlT4U/TlnEjWFATMP8FhBligdAAFWwDKGN5hRS5Cd/OUNuKnl7TS
	PgM0cwVSdo7SArIKnuUnTqsSOOG4FvvmkLrltTZm18KD2KE2CKXXIPw4TPl8gT7xcad7Z82H6cS8W
	GcocgUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZHYC-00000003M2v-1FW2;
	Sun, 11 Feb 2024 21:39:48 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZHY4-00000003Lya-2R8T;
	Sun, 11 Feb 2024 21:39:42 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-55c2cf644f3so3293875a12.1;
        Sun, 11 Feb 2024 13:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707687577; x=1708292377; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYKNeKCJBPMaI8CwH2vaV/FLvsnFOMIKN5WCojMYSS8=;
        b=O438dKDrfhcdDHVbr2FgXU7hXTp9QvHKhmFeiTfVmmqx9CYAaC5kaabG1Lsdd8beeO
         hciAP358ews8zKrb9uhXBrYH3wET3oKS4o7asITrPfNYyt0OdtBglSutRzKgAV6lT8OM
         0rZO4SSQ3+IesRHrIMIS4XJVxnCCIxueMfjtxMJKu00EPR8K3sYFpw3QB2c+HMqimJdb
         Bag1rabRd5UXiwQ8QyroL9PHzFKWQbQIeKjz36fk3YEravy56m1IPyc7oGB6iMeov8zl
         A0BISDE7XsH4Pd4wtM3UQ9ZKBOajo2YxsM5uFYwjux6FQDAZOnNKlfLWLTjR5HZ4WqC9
         6Bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707687577; x=1708292377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYKNeKCJBPMaI8CwH2vaV/FLvsnFOMIKN5WCojMYSS8=;
        b=DxwsaePdEO/mEuQmt6FQPMKEwLHS9ztbbfEbwhBQWCB2LoA8XSn2NH1/XFDnulZjNj
         1sYTtOYlDUIAVFxnSNPEiecilstC/vcJjHlOVsvpSCY6M/2eCZhhbgq3SX3OVjhCAAka
         nTAJaq7vmaPqqHnSCDHRMxlYrni21WkCCHXYlhK3flue3eqwiEy2TC0k0KAH0uPddyNr
         lXF4dkZ57FXCjA3d5LJwXXhNFVgD3t7clskQ69GVMvv6Rl9RSW1tGbaYo+IeW9LBbsle
         fUZHFWIi9El8zinfUsL4o+WhQ/ZfFVWzcfkEr0KWKEeBxC0dlqu4QDA5/khO3umm12d4
         ca+A==
X-Gm-Message-State: AOJu0Yzn/fzuBDUajXtvUO77L9uzpBHKRC5lMNTA9h/Jiy06fKAUz49H
	H5bwXua3KrQD+NxGUSbHVK6z0k5hVgeDchAGoUoOrT7Pz3VjMsch
X-Google-Smtp-Source: AGHT+IG/5cwW4J++14BxmVUMP/jSPxcWcunujb3X7L5lX5vr/5UVEMNdWGmYn/0HIs0mIWIGY28X5Q==
X-Received: by 2002:a17:906:6893:b0:a3c:1046:93dd with SMTP id n19-20020a170906689300b00a3c104693ddmr3728410ejr.31.1707687577017;
        Sun, 11 Feb 2024 13:39:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV6ocTTNt8sqAUamRUVDpcCivKEIApnJS8hWD/Vek4rtQxvvB44hZTXdvCDVGneRzKAADdJuCqiicf1wDB0O76lPYhakYcAGRMaXzguhihVMA+DxzBeJ6eKsX0WZgzvYTG2yYklqNZx4M2CwU255qCoZEDL8CTb4gsuGxBDdC2jC6sQbUlhua9RiEkt2r6YOZi+f7tiXNs9LcgZN5vODoYSFv+OGmgZ7wkOE1k9jfme5ziCDQcdpPcIlXtIWcL7v1OAIbXWAVPWBoxBmJSxsbmC0DA6bG16IdgBcuxkTNqrT5uyqYaR8M9fOjUHqrCo1xzTwLXcUGDBwXrsAQEqN5VMomFoVa+b3q3owS92waYqZPQJahBaleT6oBnXnw8kTuMZRQGRqAUHx6QAIDRGCs5WKiQTDQplBlgGh/UByLYCiULwwSJixEIPSrSvMQT6NE2urS4CV636u6grjsBq2Heg/G0sEIL6N7IQy0zn0Hn9XnKkaE/aDdQji9EUxz/vhN8AueevxJJvf+otcLFpuhVjw3skv7kZQ+M4YKavqxeR/DyAEQ==
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id ps6-20020a170906bf4600b00a3c66ac512asm1206344ejb.214.2024.02.11.13.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 13:39:36 -0800 (PST)
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
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V3 1/3] dt-bindings: arm: mediatek: convert HIFSYS to the json-schema clock
Date: Sun, 11 Feb 2024 22:39:23 +0100
Message-Id: <20240211213925.18348-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240211213925.18348-1-zajec5@gmail.com>
References: <20240211213925.18348-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_133940_649271_73386C47 
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


