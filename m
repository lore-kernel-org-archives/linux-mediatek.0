Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36F5C47DDF
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 09:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3P4SKIph2kaJ1P9uxNmooxsVTdL3TJ4ADsGzchIR86I=; b=x++37mRiA4fWvXh9DaGInF2o21
	1qx0gbKoSSK9oh+mF7btqkv/p3OOjeU2aKGcnHd9dI1UwJzDv5RiOzzg6N9LU6HtWILTlzppknLzQ
	NViZCbQC7L+RZ/BgabgS5ylIxchbpbxU7YniCWcVSeWP8uLJtqA1fR1/Aod6yNNSInYi8YI5bqRGH
	2O27DLlOPwvzLspVJZCJfVGljRrKx13954c7mok5G7Zxthlw29/u4dOEx9XvfJqwuX/16wM5fX5zR
	1yVmnl0J0as77FbR+Agl8wCivcpqsb4Sql6m51JzHE1t5PKttzUJyEKU6l63TycfPJNgF52UnXEdZ
	THvRFyVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZwE-002M2A-09;
	Wed, 24 Jan 2024 09:52:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZwC-002M0h-12;
	Wed, 24 Jan 2024 09:52:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=3P4SKIph2kaJ1P9uxNmooxsVTdL3TJ4ADsGzchIR86I=; b=TskO+5Mv+ybabIv4zUVsBgWah5
	CK/VmkZRbSLqjwZwXfpYDt1pzKBms6KNHIRzx4azUwVucSRRyRwxFrAJKLVrg5jPeTIXfb3/FdHxr
	gS2PizN1NdAKj4T9hSGuh14Z9Wb9Yeu3WMxlCH3M8WASfszs6o6Bj0itw6dw3+k8FPM+DdEbNdd3C
	EGgt8XP6m7qytVO/KtSmwpnIp5SqzTyIQ6XPe/+46+YTPi+nv97XK4sKiiQDmoECy16SSTkFJpL8N
	cHGaG12e8lYc9KaG/Nn0enq/6WgKiJw6IZWEX0ZANP6Ew54Uy61zQqDlFcHRM9LcBMRxq8OROl6Os
	MkKtnD4A==;
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSZw8-00000004Nu1-3Ues;
	Wed, 24 Jan 2024 09:52:51 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-55c932f7fcbso1668060a12.3;
        Wed, 24 Jan 2024 01:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706089966; x=1706694766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3P4SKIph2kaJ1P9uxNmooxsVTdL3TJ4ADsGzchIR86I=;
        b=mcDpzFM79ufOg3EGBQ1e13JJ90MPultrMpcaZ7/BmaMNdrIjVhG0s9E332SWZbBfSh
         no+SC2DATO85dEpfpUwaGXGyxI2PS6u/KfFF0fd875aCupeahL8Yduf7dnQHjtAw1mbz
         xiSqPCgrOWM/e87ntHaY2uBNODINE3hBEYwCb9Qhtbqn5F3SO3vzIVT8DfeF9KZ0tZ1h
         Cp8iAw2Zk7UtZgU9wpVQAYGGRDlK5a6POfKenRRya/WiNI0cH6iM1OXQmOOoOT3eHuxQ
         ap9CghYs8IkUnsuniWcon/aNs6zTgyT17x3ByO7ijmS8GUba2jvwAOJVqZ31Xx5AyhWt
         YwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706089966; x=1706694766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3P4SKIph2kaJ1P9uxNmooxsVTdL3TJ4ADsGzchIR86I=;
        b=I+FHtAsYuPXMiYFNNfvpMLpjk/YSqFBKscT4hpXGwd/Agd8h5e+DIrXWy0g7gs0EPF
         +uO4AaEjA0LQXlQ51NBJq7wsZSM0z84/RhzaxhY78r2J6TWgjqvy8FXmQQHzYpgPRf/O
         hIchMIUzu7fWlYdP/DyZFsEtxIaDCQJDunNZCdplXdF0V4uuBGwoSo7hWEBZtXVdpfaG
         sQsStrvvBUGRl31bc9Z+kCApgDi5u5YhuYbacjeAtNKFPP1BWpmmFNg/MjI9CtKG8uu6
         v6sPvt9N7SgCpuhHiIHLaV0VDEkffKZrhuhlJckyEzzD3R5GBd6TIx3Kfv6kHJyT5Ue3
         SJjw==
X-Gm-Message-State: AOJu0YzYz+9fMhr4qdERYTgJE29toZq5hCU4e/fvVfNIE/abRGao1Jkp
	nB76eYFbZi4JQGHn4OntHB0O8cLzamFCDy6DNIzFNe1Lv/EWeqvB
X-Google-Smtp-Source: AGHT+IF6irlAgTX/3kJ/yMSr7XD5tEf74ti0lx8fEEXP6sie7G0d9uw/OA9b8NTVqdOr0j9L59CNkQ==
X-Received: by 2002:a05:6402:344e:b0:55a:5d43:2ef4 with SMTP id l14-20020a056402344e00b0055a5d432ef4mr1595734edc.72.1706089966311;
        Wed, 24 Jan 2024 01:52:46 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id eg34-20020a05640228a200b0055c2404fbe4sm507410edb.69.2024.01.24.01.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 01:52:45 -0800 (PST)
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
Subject: [PATCH] dt-bindings: media: convert Mediatek consumer IR to the json-schema
Date: Wed, 24 Jan 2024 10:52:30 +0100
Message-Id: <20240124095230.25704-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_095249_038175_FE856ADA 
X-CRM114-Status: GOOD (  16.15  )
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
2. Added required #include-s and adjusted "reg" in example

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/media/mediatek,mt7622-cir.yaml   | 81 +++++++++++++++++++
 .../devicetree/bindings/media/mtk-cir.txt     | 28 -------
 2 files changed, 81 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/mtk-cir.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml b/Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml
new file mode 100644
index 000000000000..a2d0eed33292
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek consumer IR on-SoC controller
+
+maintainers:
+  - Sean Wang <sean.wang@mediatek.com>
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
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
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
+allOf:
+  - $ref: rc.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt7622-cir
+    then:
+      properties:
+        clocks:
+          minItems: 2
+
+        clock-names:
+          minItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt7623-cir
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          maxItems: 1
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
+        clocks = <&infracfg CLK_INFRA_IRRX>;
+        clock-names = "clk";
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


