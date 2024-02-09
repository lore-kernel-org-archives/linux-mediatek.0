Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C94C4829C
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Feb 2024 08:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4j7w0tByNWeRjldXgrdGngLfYLub5epQdu5N9wCAKVU=; b=TbJEaCGhaMFACfP72MB+sPOBUS
	M77ukuSjL/0eq7oLhjJBmH7E62qe2SacTOC0IPwDtVhMn6XvrCrxI+20GnVUXddfeiegqq5NaDJsj
	WiIBHT92m2/L5pIFojrI+X+vw9+pnNuXdLdocvSkkvRoT4tnRSMr//hw7gPLJeHt9ed3sk/o2n7rD
	305Usi5uxWM24mPJaDdIYDf3fLGtZ2BKPoJSeUlbL8gyr73adcKzitMYxLVHXjZlhYoubAJ9cpOQZ
	tvI7zeSZE+Snd1LYAUJoZRb7olvmWwD9QPG1q67QbLsecJqDeBTr7xxuRsH/HiocRZgC/5gocZdbx
	rs4HMQfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYMgP-0000000GW4S-3uvf;
	Fri, 09 Feb 2024 08:56:29 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYMgM-0000000GW1u-0aeI;
	Fri, 09 Feb 2024 08:56:27 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-55a035669d5so1028707a12.2;
        Fri, 09 Feb 2024 00:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707468982; x=1708073782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4j7w0tByNWeRjldXgrdGngLfYLub5epQdu5N9wCAKVU=;
        b=KVllYmZBP8Y+nzOqsVtOvkUUS+C+OB0pu/5X9KFFBllevLsrL1lR0a13Et9Aafxtov
         8iN0kB81dCsqLMljheQOAMSxQ1LVqSGgqgwcTx+TEdou1s97F944Ye005fu0dbonGwhP
         dGSr4dHxX82GrtqpyK9HMyaMuSopby16O7pu+QAfM6HpHZi9zX6f71GiKU3LN9lHxjjt
         GSer+4TH5RjM6ryXLgnONOXa0iK5bPW3emA3pVLE4nCCtXBcV+gmiPDgB0VWr/OTUeU9
         qp3YKgZc5OJKnLE1KbKs5eBpWwjR4KHVSrvABejRnmDt6lJOJJtf10ZWu6TTjQxk94Zu
         Dlxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707468982; x=1708073782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4j7w0tByNWeRjldXgrdGngLfYLub5epQdu5N9wCAKVU=;
        b=ikC0R+rikZOYAl0FlIKzDnXyLJxK7UKgai4tPIVH1OzG650kr7gK5PCN5k7/0tjvGY
         RYVWTS+f31NmCDLQqNqhSnncRK9ipEuC0SqQnxHEBmUi3gTKZPGYWb9qKYMq/36rNqiE
         PenqZPd1mgcvB4QjKpGFEEmLKPOCaOeUr8N8t2aiXAjmkD4YhBydJ5tbq7MefwWBZFUj
         Cd2YRdRt+txtG1xeU/eFMQe4IGVA7i8o7o5A/acYJ9W0LcQQU50yll+ENhNfREABO2fi
         wmkcePyiXb+aaOjtemmsNU6+7Jdgtzpb9Qh6AaY5ptAnPPf6Zy7DXAcUciMGBv//UxP1
         n7Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWRhQV6fAVQIMhUeke/4XL/b2Fy2/GTfnZ3W3WUWbu6zVWcU7dUbfa6p/C058beBMHIPjLvkxi75oNwric6UxcBNawoDaAc3lWW4vvLbKis1iO0tghvrME1yBYNm9pz+stMonCjVbE/jd2nQgOrEdhq03170wh7Vgg=
X-Gm-Message-State: AOJu0YykPdlU7m2PHnaOtAA1JSJ3Cu8h+b4E65Of1l4YyUNXfMEK1Fuv
	tACNb7jWlzoQNDAYGL5AZyugAZ1eKJ5Y+xGDTzJPo4taKrU4YVdE
X-Google-Smtp-Source: AGHT+IHgUuPQ7ASwNg4AZLYzCfolnE+XedYQpKiuByHC3g0qdKp7WqfDRZQlga0+sRblJhvvfXBs2g==
X-Received: by 2002:a05:6402:1812:b0:55f:fc07:baea with SMTP id g18-20020a056402181200b0055ffc07baeamr794710edy.4.1707468981739;
        Fri, 09 Feb 2024 00:56:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVbqSBHGNmgdBRpDUYcZC699RCw2D4Xv3BMZi05Dp2S2QFd8qqK4tk8EkwSUREvszkQ8OyCP5ik4Q6h90Bu1fnb/q7eJxHvTj1/4YikS+rUxBPMjyUPb2+J9iLUtnB/Z4gVZKRAzS41peNFg7FKyd40G94aq20a00ZQ6/NRsY5hkCmmzwom7klWckUuQzGLLY3n8oVOYHE7F5CI51KnBcpjcLoJqjwtibGAawrpSh+v7gA+Y1EzPuN2rvuhCNpuZApaSiyBGI2V+5fb7Kj7tI7rBbuTG43+fFSgF36eAb+mJsqb5uHEIBFqlAxp3K+Cae/7TvA2AcqRT7VbTxLO8lekl/zMWMUv7st1aPph5zBoy5YHPdmZL1SU3hUc+/hJkMNQ67sHWVNo+V/E0NgjF1RtVYEzUs8x1xLbYsOwFWnjIPfvWtMxpDafQImls6+5BASvAk4aq8dyxFpQdjJgAi9NEACeCe4LzOcHd//KKyE=
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id ay2-20020a056402202200b005611fc0cc11sm583618edb.43.2024.02.09.00.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 00:56:21 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2] dt-bindings: media: convert Mediatek consumer IR to the json-schema
Date: Fri,  9 Feb 2024 09:56:16 +0100
Message-Id: <20240209085616.1062-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_005626_212330_5F0A7078 
X-CRM114-Status: GOOD (  16.44  )
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
2. Made "bus" clock required on MT7623 as well
3. Added required #include-s and adjusted "reg" & clocks in example

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Extended "IR" in title
    Made "bus" required at MT7623 needs it as well
    Updated example

Thanks AngeloGioacchino!

 .../bindings/media/mediatek,mt7622-cir.yaml   | 55 +++++++++++++++++++
 .../devicetree/bindings/media/mtk-cir.txt     | 28 ----------
 2 files changed, 55 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/mtk-cir.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml b/Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml
new file mode 100644
index 000000000000..c01210e053f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Consumer Infrared Receiver on-SoC Controller
+
+maintainers:
+  - Sean Wang <sean.wang@mediatek.com>
+
+allOf:
+  - $ref: rc.yaml#
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt7622-cir
+      - mediatek,mt7623-cir
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: clk
+      - const: bus
+
+required:
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt2701-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ir@10013000 {
+        compatible = "mediatek,mt7623-cir";
+        reg = <0x10013000 0x1000>;
+        interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
+        clocks = <&infracfg CLK_INFRA_IRRX>, <&topckgen CLK_TOP_AXI_SEL>;
+        clock-names = "clk", "bus";
+        linux,rc-map-name = "rc-rc6-mce";
+    };
diff --git a/Documentation/devicetree/bindings/media/mtk-cir.txt b/Documentation/devicetree/bindings/media/mtk-cir.txt
deleted file mode 100644
index 5e18087ce11f..000000000000
--- a/Documentation/devicetree/bindings/media/mtk-cir.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Device-Tree bindings for Mediatek consumer IR controller
-found in Mediatek SoC family
-
-Required properties:
-- compatible	    : Should be
-			"mediatek,mt7623-cir": for MT7623 SoC
-			"mediatek,mt7622-cir": for MT7622 SoC
-- clocks	    : list of clock specifiers, corresponding to
-		      entries in clock-names property;
-- clock-names	    : should contain
-			- "clk" entries: for MT7623 SoC
-			- "clk", "bus" entries: for MT7622 SoC
-- interrupts	    : should contain IR IRQ number;
-- reg		    : should contain IO map address for IR.
-
-Optional properties:
-- linux,rc-map-name : see rc.txt file in the same directory.
-
-Example:
-
-cir: cir@10013000 {
-	compatible = "mediatek,mt7623-cir";
-	reg = <0 0x10013000 0 0x1000>;
-	interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
-	clocks = <&infracfg CLK_INFRA_IRRX>;
-	clock-names = "clk";
-	linux,rc-map-name = "rc-rc6-mce";
-};
-- 
2.35.3


