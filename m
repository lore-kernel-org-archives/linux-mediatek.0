Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF4CC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 16:19:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB49A61244
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 16:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB49A61244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ML4UT4lg0D6pE0i0gpcR88rb1xp+Mz/q8FlQUfqGU6E=; b=OjdXWFwOtGVw/jtpi74GkmsFPg
	xQriu+RrKZ7ye89IOCws16YzZ33PChfrYz/41IARkF+qBjTLpGfkaXSsENDQXTB6TpL37AqZTuZBJ
	CwWbqfrqhyzCoOJj0+bfkuRs8M8g+ssAatcT/3w5LE+BrR4J9ub32lqp/9CHoJB9uviR12SgjiiSW
	MKARv5uHeH7fb9B62Rsa32W7c2QpreLBtcSuAnkB758ph0XiziXc/prGMErF/65z52KLyUcPWZfK4
	yvOEYWjAUQb2nY33v8veHQ3B0/9gsVMEWwUJPuTY98Kr15TL5pkywspoAz3sWZsDP37eFvYGf0b70
	SjjLEz9g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljOuQ-004UfK-W1; Wed, 19 May 2021 16:18:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljOuO-004Uer-Is
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 16:18:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=llPfZ8AOPilzKmViev4XTbmhiuGiojY0tKb8nEMUYB4=; b=q7szZM2bwlzDUDzrPMtpFWNQSr
 Rjk9/ywHJnOgkmh0PCDqW+THpVgJW1VAwRjP9YG6fQpxcFEKNRhoxDCUfaaIC1bBTk1InZfT5lokj
 WvslQ6ZeaJOKJI6v3bvEZePODqezfFqNcyPSIZ5EjaWIrGOVi0TK4FMAvY2yDVpTjAYQ0wzZxgq8R
 AId0y2XsvWRyjQZFXTP2Psn27o5s+qeTGmKsFjHDJ0Y5G7WOS+ypMsyIWvWdHlQSqJHHN8QzzL0r+
 nsNlQBxGs7NUeGAx9kcCGWId0KvdeV6Q7Te5iQuOpdgZNUyZPxY+1PkbtfNlBl0RUPtkzvzeIYv5p
 vIK7lyDQ==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljOuL-00FcWn-4F
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 16:18:55 +0000
Received: by mail-wr1-x429.google.com with SMTP id a4so14683232wrr.2
 for <linux-mediatek@lists.infradead.org>; Wed, 19 May 2021 09:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=llPfZ8AOPilzKmViev4XTbmhiuGiojY0tKb8nEMUYB4=;
 b=YpumUkT2zhUhb1gcFON7vhnOA6X+5Sc0KNC5HjSjNRgyCNI122racDg6XFNc5l6psP
 G1TV099JaWISOPvAoo6zW4/kbkKFp7KMqc1WKIIRRB1lgp2AIUmW8kKHa5F65Zj0Su0x
 peumpe9ZTdBGm1CCLnpKK0jpgmMlHbROIf108f3gXbrEO5MxZR4kVnsNXyFusDdb3Gjh
 ZEzpZTUW1T7g23c9FbHRQwg0PyFj8FSB2u2aaKjmlhXtTqD5pAUmBfhr32A4WDZRJMQO
 pQs38URDfHtMqlVagVLQfPW1H//NtNp2LhulTCU27QoB7Ktdpiygp30XGBL5p3nMqA3/
 +6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=llPfZ8AOPilzKmViev4XTbmhiuGiojY0tKb8nEMUYB4=;
 b=stiw5HxM043BEKl2KPF8N6dcMs9y1htu0yyFXKoz7grTqAzlDj+HDsIaEn6JvbzuTK
 IKxLUsv+DJX+Zed9353cn/Arwp7HdGR6LDnKJpr4W0kNjjcDr8P19KaBF5jhO3P+S5NN
 RzoGcmb55/O5xa9yh0sdLrTLlmIH1v8hfFfas5SdieoU9WrK3LLB5PT/LDgWJvKic5c7
 /A2VoFcAPQba4e9slm2FR8spve2uyJCMQM/Dd2Sa0JgZhXW3wJufOzDPm2E+CEXIpn/r
 /Huf3qUv8OVw3TckIzWj4iuKjOXSiBpKfTiqVO6beNEOB8pC3z8gk/DPtIWgbMqA6UHT
 8STQ==
X-Gm-Message-State: AOAM533zOFQrMy+owiIjK1/ikFBZ/rIqOZVNk/CjuzLR+UOPzjEYmguQ
 OLhi4d9/PR4Hsy4Mfn15Efq4Dg==
X-Google-Smtp-Source: ABdhPJy53K9D1kmFCUpC/PIf+b5cYVmChTkcnu+yAIk6l/+kiu3PmLWiqS1kjyM5UzZgnnvapssAuA==
X-Received: by 2002:adf:f9ce:: with SMTP id w14mr15784947wrr.387.1621441130604; 
 Wed, 19 May 2021 09:18:50 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id m9sm5638547wmq.40.2021.05.19.09.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 09:18:50 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: arm: mediatek: mmsys: convert to YAML format
Date: Wed, 19 May 2021 18:18:44 +0200
Message-Id: <20210519161847.3747352-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_091853_212537_D0DA9982 
X-CRM114-Status: GOOD (  14.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert the mmsys bindings to the YAML format.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../bindings/arm/mediatek/mediatek,mmsys.txt  | 31 ----------
 .../bindings/arm/mediatek/mediatek,mmsys.yaml | 57 +++++++++++++++++++
 2 files changed, 57 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
deleted file mode 100644
index 78c50733985c..000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-Mediatek mmsys controller
-============================
-
-The Mediatek mmsys system controller provides clock control, routing control,
-and miscellaneous control in mmsys partition.
-
-Required Properties:
-
-- compatible: Should be one of:
-	- "mediatek,mt2701-mmsys", "syscon"
-	- "mediatek,mt2712-mmsys", "syscon"
-	- "mediatek,mt6765-mmsys", "syscon"
-	- "mediatek,mt6779-mmsys", "syscon"
-	- "mediatek,mt6797-mmsys", "syscon"
-	- "mediatek,mt7623-mmsys", "mediatek,mt2701-mmsys", "syscon"
-	- "mediatek,mt8167-mmsys", "syscon"
-	- "mediatek,mt8173-mmsys", "syscon"
-	- "mediatek,mt8183-mmsys", "syscon"
-- #clock-cells: Must be 1
-
-For the clock control, the mmsys controller uses the common clk binding from
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-The available clocks are defined in dt-bindings/clock/mt*-clk.h.
-
-Example:
-
-mmsys: syscon@14000000 {
-	compatible = "mediatek,mt8173-mmsys", "syscon";
-	reg = <0 0x14000000 0 0x1000>;
-	#clock-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
new file mode 100644
index 000000000000..a419da33e10b
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek mmsys controller
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description:
+  The MediaTek mmsys system controller provides clock control, routing control,
+  and miscellaneous control in mmsys partition.
+
+properties:
+  $nodename:
+    pattern: "^syscon@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt2701-mmsys
+              - mediatek,mt2712-mmsys
+              - mediatek,mt6765-mmsys
+              - mediatek,mt6779-mmsys
+              - mediatek,mt6797-mmsys
+              - mediatek,mt8167-mmsys
+              - mediatek,mt8173-mmsys
+              - mediatek,mt8183-mmsys
+          - const: syscon
+      - items:
+          - const: mediatek,mt7623-mmsys
+          - const: mediatek,mt2701-mmsys
+          - const: syscon
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    mmsys: syscon@14000000 {
+        compatible = "mediatek,mt8173-mmsys", "syscon";
+        reg = <0x14000000 0x1000>;
+        #clock-cells = <1>;
+    };
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
