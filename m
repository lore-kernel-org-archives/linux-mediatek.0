Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D645C47258
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 08:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9YKyvRBtWfutykiie3fQAavhzcW2AS6pKksKHu05ys=; b=alQ5E6zXTJURvEh+hDqp1156tM
	/IObCse6ixfC7cxFsP4DPmNz4l06G+VjN8YwIzPDsS3lFRcsn7l29QDjWlvunch3T6vytBB3x8yOa
	iHyM9I3H0xrOjCyDVBFnu5vgFi6v0EVtaCcpI1VERA/lJOSF8qXsudyUqtmgkCgq1W3GZWDSV3RRf
	Iy1s1peEemYy3M5zSxHG9uGFQzEC3EYxFMH8LGHo53OxDSsFQicj6h1d+kzUdu39lODJWNjBHHtHZ
	nRhieNimq2iaDFqbX17bqVchYKeyVx0ZRzraVVM6khGdhXZQ7/eDH+zjfGzKq931I/0MUH59WU8GQ
	oRrmkOeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSC2f-00FWfO-0u;
	Tue, 23 Jan 2024 08:21:57 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSC2Z-00FWaW-0q;
	Tue, 23 Jan 2024 08:21:53 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-55c7540e02aso515968a12.3;
        Tue, 23 Jan 2024 00:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705998107; x=1706602907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9YKyvRBtWfutykiie3fQAavhzcW2AS6pKksKHu05ys=;
        b=kKCj+Swy3pMnN5ssh5ZBSr1XEctCFijguYSrHXhMdlK5kvA0VvU+h9X1BV+pOL4F7J
         MzAM3bqYgyOB9ihIItLMB+EKf+FTlRkht1RcC+fsinD20Zsq1QH65N8wJngSJDMbLpk4
         DiRI1FfgPMVm/ZvBI0RjFPot8e3o5u4eEapPGEivk4xGxouthGmmEa0js+fRvkQ7yXBk
         Whv7n9GL6SiKTy6vODyd/b60t7WAWv6q44Wb2q4hkpix3cRG7OnZ9K8nYFYzuV4LNW+3
         eYivrGz8hGed2zDxtAnOQw5EGed1MRmEFvZAwgNR3HKijt39FEhCGeO3wGA22HpLoq8s
         N5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705998107; x=1706602907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9YKyvRBtWfutykiie3fQAavhzcW2AS6pKksKHu05ys=;
        b=cQ7kMcgZ6ypMXXkURyW7QG+nwYz0MM9Xk1IIyk65WH1cgchvLvwlEYhiynhV7PZVou
         9sNyeAdifKbC2ie+Z+TDKN2m1VIyazKo3kR8cwzRyDcNsksB1DNZDH5Usu3arDvg0Dhr
         EXC8RIamKYqkjq/Mz47yY8U932MGZ3jp0X16C75ON+dDXpn8/9ZNHDgm9+7X93GIhJle
         PdyiIOQHxhHyVxkzENJzsj+j6DW5T4RqWjTGIoBDbz3BMAPfpUFclhxATUADBuStZps8
         FJ0TBWEULtPnGhwuhZjjoQaE/pDjw6x7mzGpdz4ccMm1zpi7adwNV/3SFS01g+pEifET
         B0Rg==
X-Gm-Message-State: AOJu0Yz5ysSdOeLCeYuRWw+1NAt9turbhUXQEoiDfb4PIWL33UOlVSbm
	1WnnIf8hXQHbfNq3O88vh7PhMEdZdeaKCIahZgLtTnDx2W7LBBWg
X-Google-Smtp-Source: AGHT+IFqBjCm38TDwMPz7ittv6kiKxIxDBv5sr4avSsf45RUj4/Dfsfek1x27WclHwGOxCYFnKSAiA==
X-Received: by 2002:a05:6402:290b:b0:55a:7191:b301 with SMTP id ee11-20020a056402290b00b0055a7191b301mr681287edb.48.1705998107113;
        Tue, 23 Jan 2024 00:21:47 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id u11-20020a056402110b00b00558aa40f914sm14810435edv.40.2024.01.23.00.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 00:21:46 -0800 (PST)
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
Subject: [PATCH 3/3] dt-bindings: arm: mediatek: convert SSUSBSYS to the json-schema
Date: Tue, 23 Jan 2024 09:21:00 +0100
Message-Id: <20240123082100.7334-4-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240123082100.7334-1-zajec5@gmail.com>
References: <20240123082100.7334-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_002151_301890_B2F1CAE7 
X-CRM114-Status: GOOD (  16.74  )
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
 .../mediatek/mediatek,mt7622-ssusbsys.yaml    | 47 +++++++++++++++++++
 .../arm/mediatek/mediatek,ssusbsys.txt        | 25 ----------
 2 files changed, 47 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-ssusbsys.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-ssusbsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-ssusbsys.yaml
new file mode 100644
index 000000000000..7a5343e4fcf4
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-ssusbsys.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-ssusbsys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek SSUSBSYS controller
+
+description:
+  The MediaTek SSUSBSYS controller provides various clocks to the system.
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt7622-ssusbsys
+          - mediatek,mt7629-ssusbsys
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
+    ssusbsys@1a000000 {
+        compatible = "mediatek,mt7622-ssusbsys", "syscon";
+        reg = <0x1a000000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt
deleted file mode 100644
index 7cb02c930613..000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-MediaTek SSUSBSYS controller
-============================
-
-The MediaTek SSUSBSYS controller provides various clocks to the system.
-
-Required Properties:
-
-- compatible: Should be:
-	- "mediatek,mt7622-ssusbsys", "syscon"
-	- "mediatek,mt7629-ssusbsys", "syscon"
-- #clock-cells: Must be 1
-- #reset-cells: Must be 1
-
-The SSUSBSYS controller uses the common clk binding from
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-The available clocks are defined in dt-bindings/clock/mt*-clk.h.
-
-Example:
-
-ssusbsys: ssusbsys@1a000000 {
-	compatible = "mediatek,mt7622-ssusbsys", "syscon";
-	reg = <0 0x1a000000 0 0x1000>;
-	#clock-cells = <1>;
-	#reset-cells = <1>;
-};
-- 
2.35.3


