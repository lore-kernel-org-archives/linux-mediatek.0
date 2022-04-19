Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31455C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 18:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=47rZhsKgxoHa8sGd3anP5VIdFbam0UR0IIquJ87Fdq8=; b=4JSE1kZex8bL9a
	mt4R437y9JqgjjEWtrqFJtm2tikd0zBlBOswS0BYZsphIMTzmdLh4AFTziaXmbVDBvgdewxZaoFkc
	fzkMA13QiDgb6xg99pIdsKYdAkITzsPM5EFfOrHs77Vm/ndl54HV+4jrdgKUkkBHcYW/1z5zzsWhN
	ICN127fCK3DViLPAWyoD9C8txq+t/NJOLbpbFlUlfOcHhE1bFE09J8ojTjmyv1ANmjJLNtpgdfn04
	0TtrDGG/rrlGnZFaSYzM5BTP5W3DtU7v675CYoBKvhGUCqBcO1jZfP9NcUZjJ4SsJVa6ScvPvtRQP
	xBESFCOSCQP13t4Bdt9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngsMr-005YfY-Li; Tue, 19 Apr 2022 18:14:25 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngsLC-005XX0-Lg; Tue, 19 Apr 2022 18:12:47 +0000
Received: by mail-ej1-x632.google.com with SMTP id s18so34689566ejr.0;
 Tue, 19 Apr 2022 11:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZhelTs57qB8l8snfqOh3tsOfdXgjXxOg3YxbLx/o20g=;
 b=KMjlgvdZbFgtrDUD5sGre35l5IsjYq/4lFCHGa5O4f6vUnz8Z879bU2B9iknQi29hc
 zQoZsHYeuBBHKqoc0JXikAHQUVjXoTHRHeVaeqoBXFcZMJAYgs2bVl6SqIDbvA/K0/jq
 hH9V1AOPG1FXqLhQV4VslfQmc7Igc0rhuOa+x7u1cBI5T1BHiZe54e2IONJ3pIa0U1dt
 2c9JQyviwNIY6SI01uSrEtgXVupQjNTqWVT3n0bMuCzwS5KkZ2aReqSxwypKY9j+fKRN
 RI/4N0IOUFf3SGn592yRrR16+grUd+49M2m2y962EHNY+sC8RxQjiK1qw2nli57m02FE
 q+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZhelTs57qB8l8snfqOh3tsOfdXgjXxOg3YxbLx/o20g=;
 b=aXhlN0EOQIySdjj9fqmGbF4Q6tWu4tekgdKB32oR8FPjgqFjMrWaYPmDDxfECKviDZ
 SOjVHHmTeZR0U9DanDggw6h0GwG0uDON3kGtutQlDJ4zdgxU25Kq9WZQtST5Oh7bMFwN
 mOQTvDNDQmbVSOhU3/PpMrNnae6ymkyxyUUbAu7BFeqAbpf5+wabmjvBKEpv/0vCYCkB
 aKAmeKwovlrZX1VvLVQFAtsOa7cMCSLNCOanAiWQJiVsuNLksa5bACIgss3DRwJEnZ/J
 F1SuiLWeFPVBrbiDC4m6D9kaw82aJjFUvO/6WTG1nj2ncaRBdt65rrdhL26xro5t7u2g
 mCzA==
X-Gm-Message-State: AOAM531yWYWtko6xuZwrw+mzezFRD4t1gvMhP9IYdWRK3spEQ8qtETCc
 gvmlC7QzOxnzCla6kDQ1hVE=
X-Google-Smtp-Source: ABdhPJyeIZRBjgA3MKX+mlJppPwTSIKZXJss/g8U03EN6uX9wqh5+ibHjB3tWGPq+OFnSu3HfGR4tA==
X-Received: by 2002:a17:907:2d08:b0:6e8:8e58:f70e with SMTP id
 gs8-20020a1709072d0800b006e88e58f70emr15434200ejc.301.1650391955354; 
 Tue, 19 Apr 2022 11:12:35 -0700 (PDT)
Received: from localhost.localdomain ([212.102.35.230])
 by smtp.gmail.com with ESMTPSA id
 b20-20020a1709063f9400b006e12836e07fsm5930614ejj.154.2022.04.19.11.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 11:12:35 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sam Shih <sam.shih@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Ryder Lee <ryder.lee@kernel.org>,
 Yassine Oudjana <y.oudjana@protonmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: arm: mediatek: apmixedsys: Convert to DT
 schema
Date: Tue, 19 Apr 2022 22:09:38 +0400
Message-Id: <20220419180938.19397-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220419180938.19397-1-y.oudjana@protonmail.com>
References: <20220419180938.19397-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_111242_836612_7F50AC5F 
X-CRM114-Status: GOOD (  17.43  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Convert apmixedsys bindings to DT schema format. MT2701, MT7623 and
MT7629 device trees currently have the syscon compatible without
it being mentioned in the old DT bindings file which introduces
dtbs_check errors when converting to DT schema as-is, so
mediatek,mt2701-apmixedsys and mediatek,mt7629-apmixedsys are placed
in the last items list with the syscon compatible, and syscon is
added to the mediatek,mt7623-apmixedsys list.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../arm/mediatek/mediatek,apmixedsys.txt      | 35 -----------
 .../arm/mediatek/mediatek,apmixedsys.yaml     | 60 +++++++++++++++++++
 2 files changed, 60 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
deleted file mode 100644
index 3fa755866528..000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Mediatek apmixedsys controller
-==============================
-
-The Mediatek apmixedsys controller provides the PLLs to the system.
-
-Required Properties:
-
-- compatible: Should be one of:
-	- "mediatek,mt2701-apmixedsys"
-	- "mediatek,mt2712-apmixedsys", "syscon"
-	- "mediatek,mt6765-apmixedsys", "syscon"
-	- "mediatek,mt6779-apmixedsys", "syscon"
-	- "mediatek,mt6797-apmixedsys"
-	- "mediatek,mt7622-apmixedsys"
-	- "mediatek,mt7623-apmixedsys", "mediatek,mt2701-apmixedsys"
-	- "mediatek,mt7629-apmixedsys"
-	- "mediatek,mt7986-apmixedsys"
-	- "mediatek,mt8135-apmixedsys"
-	- "mediatek,mt8167-apmixedsys", "syscon"
-	- "mediatek,mt8173-apmixedsys"
-	- "mediatek,mt8183-apmixedsys", "syscon"
-	- "mediatek,mt8516-apmixedsys"
-- #clock-cells: Must be 1
-
-The apmixedsys controller uses the common clk binding from
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-The available clocks are defined in dt-bindings/clock/mt*-clk.h.
-
-Example:
-
-apmixedsys: clock-controller@10209000 {
-	compatible = "mediatek,mt8173-apmixedsys";
-	reg = <0 0x10209000 0 0x1000>;
-	#clock-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.yaml
new file mode 100644
index 000000000000..fc967fdc8aec
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,apmixedsys.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek AP Mixedsys Controller
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description:
+  The Mediatek apmixedsys controller provides PLLs to the system.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt6797-apmixedsys
+              - mediatek,mt7622-apmixedsys
+              - mediatek,mt7986-apmixedsys
+              - mediatek,mt8135-apmixedsys
+              - mediatek,mt8173-apmixedsys
+              - mediatek,mt8516-apmixedsys
+      - items:
+          - const: mediatek,mt7623-apmixedsys
+          - const: mediatek,mt2701-apmixedsys
+          - const: syscon
+      - items:
+          - enum:
+              - mediatek,mt2701-apmixedsys
+              - mediatek,mt2712-apmixedsys
+              - mediatek,mt6765-apmixedsys
+              - mediatek,mt6779-apmixedsys
+              - mediatek,mt7629-apmixedsys
+              - mediatek,mt8167-apmixedsys
+              - mediatek,mt8183-apmixedsys
+          - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    apmixedsys: clock-controller@10209000 {
+        compatible = "mediatek,mt8173-apmixedsys";
+        reg = <0x10209000 0x1000>;
+        #clock-cells = <1>;
+    };
-- 
2.35.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
