Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5333DC54FB9
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Nov 2023 07:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ekqzVw0AluhAbw5EwOHdJCqXIaeM1bSeI8gYehr+0UA=; b=uKGdsy5Yj6CRs5J4NA/G+5vyAg
	orxGbd6eGgjQind71d6L5GNttpYyQMGSkM+59vkDTBapBOm9NnSr1X+ps02KnEdRDUStqWtXtpl4i
	HQnRwXkYXdrkE/exrgi/XsRs2WG4C9nZ4jcgzzMCKQQIbfNDpCC13b2pEShLDvcBW12SdZeTsgiOr
	GaZk9GxRyI+eyn4s4NFAIyemh1RSjdzGDWzgCsZVwccglcmoLiPDWdTS5ODKWW0jlU4tW6DXQz4Db
	zPd8bXXzzSuPfMw8oV4QrE7TOV5c2+gPx+sOG90D1OvfcV2UCyn6x5lRprfnxJ7OnpfDLSjS6Xdk1
	z+mzwu5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3tbi-005rqe-0A;
	Fri, 17 Nov 2023 07:49:42 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3tbe-005rpm-01;
	Fri, 17 Nov 2023 07:49:40 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9e5dd91b0acso227318566b.1;
        Thu, 16 Nov 2023 23:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700207374; x=1700812174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ekqzVw0AluhAbw5EwOHdJCqXIaeM1bSeI8gYehr+0UA=;
        b=anfDDMOwdGvtdQnDl6LS5Vh6eavSO0xScrI1avq2MxY01jKcClHvtjhCmHJmTAx2bz
         ZbCPLLU4fkqdBhru3uM0CQh3xEboqwmBlfv1Uudpmn3Awzu2K6UCtKpgEdOYKes4OYIZ
         vXtxUrpd9Ou/HMVTi4xbF6aYfK9fRscwMbh4Y92CQvyap++YnW/mSySpZ1Cr0Tc58XKW
         ZDiKzF4WdjX0fxdmpe3umSD8wLIPKpBAUaZ8X280bHAtnBrLUBnLHBFMtczLcEmEIZks
         On/IKSx8NdtVHc5Ofn7cjwLdf2d20yXWo6KXwoMs7AR/SFhc7aQWYxUdWqkKB9XXZDOq
         1L/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700207374; x=1700812174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekqzVw0AluhAbw5EwOHdJCqXIaeM1bSeI8gYehr+0UA=;
        b=j8UMWCuVlistkftMeaY6XOCVXb4AiT2gRF1ufalmxEhjf0FWd5Cvm5zCCL/2ayrSaQ
         s1rTCDZ95IolkJS7GzPfyYzEKid9zeLzcyCSc80OdHwK4sJwW6Ap7b/u4w+4l7AV3PoP
         R54n2e+IyxQ3AVZMmX2wq5bX1dAE/lAY/yYo0MioBBYpQWvdgVwot3DDXyPoEkKGbWY2
         PQeF9+0glLQ9qS6Qthb8KffAmeEam5PbUDx9CaXP7ed6oJPm2vIQq3acSJAPNtMTG/vW
         QuYrq2EY2xKGSCrjQmPsHMpEOUlJkBxHAEiZpvyWp61wnq3HOMmc7QTYBAhtwyOEznTU
         J56A==
X-Gm-Message-State: AOJu0YxWtUKIoa6vRdVnFjUJ5OvpjGIXzVtGdazMK2zTus9WrZ5GJJyg
	CWIv10MSw+o+i5658WAXE6bd7H4RBqU=
X-Google-Smtp-Source: AGHT+IGA5AQoMJzgH04pqMjo85i8zULwwVM6unUn6ySePGe9vL4l9ZXrwCTcAwMyAjq/y4Te9uFhIg==
X-Received: by 2002:a17:906:cb95:b0:9c7:5186:de1a with SMTP id mf21-20020a170906cb9500b009c75186de1amr15022357ejb.8.1700207373976;
        Thu, 16 Nov 2023 23:49:33 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id g24-20020a170906c19800b009a1b857e3a5sm505854ejz.54.2023.11.16.23.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 23:49:33 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Jianhui Zhao <zhaojh329@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	James Liao <jamesjj.liao@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: arm: mediatek: convert ethsys controller to the json-schema
Date: Fri, 17 Nov 2023 08:49:26 +0100
Message-Id: <20231117074926.10824-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_234938_044302_54EC5BFB 
X-CRM114-Status: GOOD (  16.57  )
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

This helps validating DTS files. The only introduced change was fixing
"reg" value in example (1 address cell + 1 size cell).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
For the record I was trying to simplify "compatible" syntax with
following but "oneOf" apparently can't be used as a single item.

items:
  - oneOf:
      - const: mediatek,mt2701-ethsys
      - const: mediatek,mt7622-ethsys
      - items:
          - const: mediatek,mt7623-ethsys
          - const: mediatek,mt2701-ethsys
      - const: mediatek,mt7629-ethsys
      - const: mediatek,mt7981-ethsys
      - const: mediatek,mt7986-ethsys
  - const: syscon

 .../bindings/arm/mediatek/mediatek,ethsys.txt | 29 ----------
 .../arm/mediatek/mediatek,ethsys.yaml         | 54 +++++++++++++++++++
 2 files changed, 54 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.yaml

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
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.yaml
new file mode 100644
index 000000000000..a85d7b632d12
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,ethsys.yaml#
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


