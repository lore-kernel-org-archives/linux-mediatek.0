Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8E1C072A2
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Nov 2023 21:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W5AoIs+Bdzh/tLCRglqGhx6SkCLVORYxH3ooAEqDulU=; b=VEQRFdyTTZEtBaNSHn1PkMcpvk
	EPjZnSOAZcwgREU8/XSMaGvgRmCEaJLozK1yYq2f6lkVUA7R94S0F3fWAwdLu2D/VBc2UQ7fr7j5L
	7xllkr918XaN7l7f4UvtMu0cooRjVPCuTs1hiYkBsbJUXh8Hnmlhnc03PmFGUmIQne2mR//XjWLkC
	HGF4JNvHH5BeIidXzA5tBFBxyQYPJ9px+EftuH7e+4PHEhQpzVyO41TD8eE2GQX5A/ZfzC64V3wUh
	aRqNMPOAhEWpGNkeCmH+GhAMbk2cK+/eF66w1kMhH3MwmqpA610rNN0Sxe9ylpGpTlMwvmeuWH0gw
	HQc1vqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4pHY-00AhAN-25;
	Sun, 19 Nov 2023 21:24:44 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4pHT-00Ah7F-2A;
	Sun, 19 Nov 2023 21:24:41 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-548696eac92so2040181a12.3;
        Sun, 19 Nov 2023 13:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700429066; x=1701033866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W5AoIs+Bdzh/tLCRglqGhx6SkCLVORYxH3ooAEqDulU=;
        b=jva7DR/xTLjadLIAg++Qb7PtAiKw7UbFx3sBoGZEreJ4/RgNykBaXz+FEWiq/9fhwA
         ELFsCgEW20GTgNn3VziPsdkxRB5lC4PgCL5AyQmqkn7sViCO9Bh3MTzKSaF0j6Xsi/dW
         2J8WKPsGu/ZIIcg/l+ka6+m8WzpBgaM2KmE6qNaRQHRJihbey18pRjWgxo9dkhUUVl9e
         CUf/ZPBWAn7ZIzBTzpKG/VAn8T18P60xbsJBWkGgh+RpNN3rZtDbZhNZQDYAYi8JK2AJ
         JbPDosF+rPFr3FM2OEYepRVKtIOaIeNEDZc8gkRpcRElMKx9W3kIkzxGieIP08VrVOkD
         0JIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700429066; x=1701033866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5AoIs+Bdzh/tLCRglqGhx6SkCLVORYxH3ooAEqDulU=;
        b=NseE/wrkyBPEgBzX+RTcHfQT3y2aJc0EyQ4AFVczmOwUDQhGBhu36zExqfZfC1NUkC
         8mZXUpQFxsfam6xln8p8rNHzTnxrsPE4C0Q5tZg7dYO0SIJT4utouVokYRiJivC6/cA+
         2VEq1mNDVBRlrDw9nqdk20Xdvuw4qJ58g5leT8e3Z39j3KgqJqwKSC6Xca+oZlTk2syK
         gwbvbeis2+IJEQGsR3MKM1L3MEg57MbkwaGZpFAntlN20xt2/aaMgbDWmAnBLDF0eZlc
         B3OR0OduC8O+SOjPl9Y4AEkAQOmKXpzIeDrurtV88aaf4DndqUKBoR8pPLL1zhzh54Az
         wMTg==
X-Gm-Message-State: AOJu0YwyK1QtrNLylKlyzNf79CK8GNf419C3wiwHy97AGk/n6CoSx1Xq
	JrBbH+nrY6BdVbNXbvx8umI=
X-Google-Smtp-Source: AGHT+IFajiBloEjzAJqHhZtom0mUOzVwl1XuhnJGi5vMvt9BGAY/DoINKNGYdo4x5DnyARNgwq8GLQ==
X-Received: by 2002:a17:906:c03:b0:9e2:bbc4:16cb with SMTP id s3-20020a1709060c0300b009e2bbc416cbmr4094055ejf.49.1700429066271;
        Sun, 19 Nov 2023 13:24:26 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id u19-20020a1709063b9300b009e5db336137sm3193340ejf.196.2023.11.19.13.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 13:24:25 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	James Liao <jamesjj.liao@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH V2] dt-bindings: arm: mediatek: move ethsys controller & convert to DT schema
Date: Sun, 19 Nov 2023 22:24:16 +0100
Message-Id: <20231119212416.2682-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_132439_730500_19D3B437 
X-CRM114-Status: GOOD (  16.32  )
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

DT schema helps validating DTS files. Binding was moved to clock/ as
this hardware is a clock provider. Example required a small fix for
"reg" value (1 address cell + 1 size cell).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Reviewed-by: Rob Herring <robh@kernel.org>
---
V2: Move binding to clock/ dir and document that in commit body

 .../bindings/arm/mediatek/mediatek,ethsys.txt | 29 ----------
 .../bindings/clock/mediatek,ethsys.yaml       | 54 +++++++++++++++++++
 2 files changed, 54 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
deleted file mode 100644
index eccd4b706a78..000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-Mediatek ethsys controller
-============================
-
-The Mediatek ethsys controller provides various clocks to the system.
-
-Required Properties:
-
-- compatible: Should be:
-	- "mediatek,mt2701-ethsys", "syscon"
-	- "mediatek,mt7622-ethsys", "syscon"
-	- "mediatek,mt7623-ethsys", "mediatek,mt2701-ethsys", "syscon"
-	- "mediatek,mt7629-ethsys", "syscon"
-	- "mediatek,mt7981-ethsys", "syscon"
-	- "mediatek,mt7986-ethsys", "syscon"
-- #clock-cells: Must be 1
-- #reset-cells: Must be 1
-
-The ethsys controller uses the common clk binding from
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-The available clocks are defined in dt-bindings/clock/mt*-clk.h.
-
-Example:
-
-ethsys: clock-controller@1b000000 {
-	compatible = "mediatek,mt2701-ethsys", "syscon";
-	reg = <0 0x1b000000 0 0x1000>;
-	#clock-cells = <1>;
-	#reset-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml
new file mode 100644
index 000000000000..94d42c864777
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mediatek,ethsys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek ethsys controller
+
+description:
+  The available clocks are defined in dt-bindings/clock/mt*-clk.h.
+
+maintainers:
+  - James Liao <jamesjj.liao@mediatek.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt2701-ethsys
+              - mediatek,mt7622-ethsys
+              - mediatek,mt7629-ethsys
+              - mediatek,mt7981-ethsys
+              - mediatek,mt7986-ethsys
+          - const: syscon
+      - items:
+          - const: mediatek,mt7623-ethsys
+          - const: mediatek,mt2701-ethsys
+          - const: syscon
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
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
+    clock-controller@1b000000 {
+        compatible = "mediatek,mt2701-ethsys", "syscon";
+        reg = <0x1b000000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
-- 
2.35.3


