Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6359DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 18:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m3r+qlWpru2b4pLboz0ofFtNbN9ZhAjsjVkJl5ELq1g=; b=tEGfZvhr00Qv4a
	R9JZmf6t0JYU8wlNp5lES0TCSm94ahhHNMWcTq+MUX69aMHVHNyHKr78qTwa8xTsCxmwRxq1qnaN2
	2+c+B4sAoTo9WOU9v+uTFy8aP+v0bwDrpCc6iabRBbI+GnYhIZA3atiIp8msZPQNGo3zd9CHfQp5q
	WpdbeSejSTRdVdNhRZTFzixOMq1HGD8G0OSBK/x43HCHstwtF8bWnWAclA3CuWXj+FAWALg8ekTnJ
	jl8CVR14w2KasND9iui1vldMfVgwXyBjtcQrEcdC2GiCOPx7Aw/rOa0J0fWENyXuDdrfbn6L7LJxB
	rvXkbs2/JMSzkP6RnSMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngsLW-005Xop-5Q; Tue, 19 Apr 2022 18:13:02 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngsL2-005XSG-BN; Tue, 19 Apr 2022 18:12:35 +0000
Received: by mail-ed1-x52f.google.com with SMTP id t25so22342994edt.9;
 Tue, 19 Apr 2022 11:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nV/V/sSiQrpacLvnsxKcMtnuzTjfpOGiqmnW9+zsuXw=;
 b=C8+SnHSvi/3OxwkFOy+xJfV8PXdzA+KCAXh+TU+xF+OVvSe3RpJiOEznblvsAwOcDu
 zzMbQsNlM3oAsUgSoLBVDvUmfoNp1dyyisooBTR2VXMNLVgHfdyTg91VS5cNCwo7WI+N
 0TkETmBVk6LR4CKxNMGdlM6LhvbljypPM6xMlDXHkTN2WdA9cUKI0XG61aMFYB0KM7IG
 rhLmAVDM97ba+odgtNnPTTVsfpF0jN7qrSFmIYo+YI+Y1P5PbTwZtXjXz8XrEH3E7sfL
 lJx5kx102RHf8tb1oES2lAjcxOJufDCWHl3I0gtSLc6AQFxsP99brDfEq9tjmMzvMFi3
 KCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nV/V/sSiQrpacLvnsxKcMtnuzTjfpOGiqmnW9+zsuXw=;
 b=0CXqhnckta1tjruAOshKfmW+czfXBQdCi50mnUfB7z64CVupV7dbbU00WyKvmSQ5qm
 TvXpeslFUMw8F1fZCuEltLAPzbhGgJsTiwBcaV8RGQ1y8acQcxo33uc1cNqh+VOn5ym8
 PT5M7V8zYFhga15G91/mQ2AdsV70rHtvwaFthu3v0ky8RD/4KZ85qgN4tBaquZhn2dWf
 RIZuSmHRuC0r8dLLuJxe+agdAljdrxG1us+oYZq8QOGBXYxrEO3C3FgOKNwsMd13sfgq
 I3umEXiOylpM55M0W4BPqTioN9PJqF1fiAJ+JP5siKDvB34V2y98wdx6CBkQehVPRKE0
 Q7Og==
X-Gm-Message-State: AOAM532YwtFU9kuQZ+4DTJLPrKC+aGf4hiea+KHtz45WvOzw4zTe7Gaa
 6rGNwJZB4gY7NxemOtxLv4w=
X-Google-Smtp-Source: ABdhPJw5Qs3spIyZaNmqd45dxxwH/JvTxPVzOd6tS7esXoye+O3Ju9Qtxs1013fkuta7ZoX7sN1YbQ==
X-Received: by 2002:a05:6402:5cf:b0:41d:7aa7:152a with SMTP id
 n15-20020a05640205cf00b0041d7aa7152amr19365895edx.68.1650391948620; 
 Tue, 19 Apr 2022 11:12:28 -0700 (PDT)
Received: from localhost.localdomain ([212.102.35.230])
 by smtp.gmail.com with ESMTPSA id
 b20-20020a1709063f9400b006e12836e07fsm5930614ejj.154.2022.04.19.11.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 11:12:28 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sam Shih <sam.shih@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Ryder Lee <ryder.lee@kernel.org>,
 Yassine Oudjana <y.oudjana@protonmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: arm: mediatek: topckgen: Convert to DT schema
Date: Tue, 19 Apr 2022 22:09:37 +0400
Message-Id: <20220419180938.19397-2-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220419180938.19397-1-y.oudjana@protonmail.com>
References: <20220419180938.19397-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_111232_507790_163E1067 
X-CRM114-Status: GOOD (  17.20  )
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

Convert topckgen bindings to DT schema format. MT2701, MT7623 and
MT7629 device trees currently have the syscon compatible without
it being mentioned in the old DT bindings file which introduces
dtbs_check errors when converting to DT schema as-is, so
mediatek,mt2701-topckgen and mediatek,mt7629-topckgen are placed
in the last items list with the syscon compatible, and syscon is
added to the mediatek,mt7623-topckgen list.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../arm/mediatek/mediatek,topckgen.txt        | 35 -----------
 .../arm/mediatek/mediatek,topckgen.yaml       | 60 +++++++++++++++++++
 2 files changed, 60 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
deleted file mode 100644
index b82422bb717f..000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Mediatek topckgen controller
-============================
-
-The Mediatek topckgen controller provides various clocks to the system.
-
-Required Properties:
-
-- compatible: Should be one of:
-	- "mediatek,mt2701-topckgen"
-	- "mediatek,mt2712-topckgen", "syscon"
-	- "mediatek,mt6765-topckgen", "syscon"
-	- "mediatek,mt6779-topckgen", "syscon"
-	- "mediatek,mt6797-topckgen"
-	- "mediatek,mt7622-topckgen"
-	- "mediatek,mt7623-topckgen", "mediatek,mt2701-topckgen"
-	- "mediatek,mt7629-topckgen"
-	- "mediatek,mt7986-topckgen", "syscon"
-	- "mediatek,mt8135-topckgen"
-	- "mediatek,mt8167-topckgen", "syscon"
-	- "mediatek,mt8173-topckgen"
-	- "mediatek,mt8183-topckgen", "syscon"
-	- "mediatek,mt8516-topckgen"
-- #clock-cells: Must be 1
-
-The topckgen controller uses the common clk binding from
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-The available clocks are defined in dt-bindings/clock/mt*-clk.h.
-
-Example:
-
-topckgen: power-controller@10000000 {
-	compatible = "mediatek,mt8173-topckgen";
-	reg = <0 0x10000000 0 0x1000>;
-	#clock-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.yaml
new file mode 100644
index 000000000000..9ce9cf673cbc
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,topckgen.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek Top Clock Generator Controller
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description:
+  The Mediatek topckgen controller provides various clocks to the system.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt6797-topckgen
+              - mediatek,mt7622-topckgen
+              - mediatek,mt8135-topckgen
+              - mediatek,mt8173-topckgen
+              - mediatek,mt8516-topckgen
+      - items:
+          - const: mediatek,mt7623-topckgen
+          - const: mediatek,mt2701-topckgen
+          - const: syscon
+      - items:
+          - enum:
+              - mediatek,mt2701-topckgen
+              - mediatek,mt2712-topckgen
+              - mediatek,mt6765-topckgen
+              - mediatek,mt6779-topckgen
+              - mediatek,mt7629-topckgen
+              - mediatek,mt7986-topckgen
+              - mediatek,mt8167-topckgen
+              - mediatek,mt8183-topckgen
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
+    topckgen: clock-controller@10000000 {
+        compatible = "mediatek,mt8173-topckgen";
+        reg = <0x10000000 0x1000>;
+        #clock-cells = <1>;
+    };
-- 
2.35.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
