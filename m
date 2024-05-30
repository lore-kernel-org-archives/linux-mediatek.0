Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C04C25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 08:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojWQ0b2MWifneyP6SWllMlL0oJitBi3xbuigAJTyN5g=; b=A9bNFnkIeUniA+kXO0FHXKmNQ8
	WOinFHD+OW/9xARh3EqGlHnSO517uU4YwQh5UOGDbKFCBXVNxuLiJgbwnlC8W1H66WsZodisZ2055
	pGqjt/7217l1nfrw3mzoeNEvoIUU7IGnINM6yui4UgzphRrpoL+Rno3AFG31ag6BTNjcSzcrd4gUD
	Uri8LdYofOTBiWTkyFyPvvEo3xj6VSZo85/6Byj9d+yxEW/mP85u/kLBXMtL4Ty1ogPzEv/K4R56L
	ujRGVN1G6TE247CBoBxE536rX9u4iButm7DKRePCeuVduD+YliRXK4K6lBD/uu3B8sFQaLbWzZSk8
	jCeazKOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCbFz-00000006dn6-1J9T;
	Thu, 30 May 2024 08:35:31 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCbFt-00000006dk9-1ntq
	for linux-mediatek@lists.infradead.org;
	Thu, 30 May 2024 08:35:28 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1f44b42e9a6so5156525ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 30 May 2024 01:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717058124; x=1717662924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojWQ0b2MWifneyP6SWllMlL0oJitBi3xbuigAJTyN5g=;
        b=GcQ+y4Yj2qp+ueY7rOUalZS7PelFoLpktwn1wD7MNRg3rQih1u6Q67yWMRznKzvYzX
         FX4xoddCNWV3mWvHTAi9/ynM11vhY3WvokPnDwnbULBqxIq00u7W0WHVLGhv0grmOXij
         AlkZ4NZ9GHZ98ncGeOBlEF9vLB10OBFyMz7sU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717058124; x=1717662924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojWQ0b2MWifneyP6SWllMlL0oJitBi3xbuigAJTyN5g=;
        b=pMsBvMFBfBI+ILIZrm73OdYYgXeUTXuc7peJL2yKac0/MGNSwIa948IoYXYdmcT36n
         Lf91Zq7mNZ2krygbWIWH9ZB/Lnz5wrDJRZ4/PRR28CK8+GAVHFmjYqCqdhBTTJsKdDSQ
         DAMxaaTG62KpXs6LwK/J37U2sY+i/t/GiIX+SyLGj6rTmYUBoVbWbDdrGW86DXsrcfyX
         vi/q0MVsij0fK90J2yz6g64e0wERH0I9wS7R3XcSKEfwKdydP7bXNjspF0X426CL0E3m
         preM/aYb9pMtkVMY/rRHdWPOBi3mJZ2rECcE3dM8D6AdkL93gh2UYrcpK28FNH21dA1t
         Zz5w==
X-Forwarded-Encrypted: i=1; AJvYcCWmeVkWB/ZtMv3u1aNRfAhisdQOcm/zcCU0E+N9sBFFX2Kr6dzLSO6nFZsB4hl+22Ri202ZPo9Auj17cWYMuClLU7MJ2iQ3CSucxFvIGUqAVDYK
X-Gm-Message-State: AOJu0YwRuw/lFBFpEqlIC6g+zyyq5RndQJcGbbAX7FHXfVLqUAC8WCB+
	A/xTzTuGR0aPBBB25GjtCv7KX169R1EY/SkIOsZbTXyJ02X+iD4BNGn2IOZpvw==
X-Google-Smtp-Source: AGHT+IGtD/EP0lwVmYxNyzuz01IBLVY6csgHPTcXqWU5CemCG3sK1VS5I0qtjDvBKandh/VKDc1VCA==
X-Received: by 2002:a17:902:e810:b0:1e4:9c2f:d343 with SMTP id d9443c01a7336-1f6193fad6fmr15805455ad.7.1717058123772;
        Thu, 30 May 2024 01:35:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:65f0:63a9:90bb:50b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f617390fe7sm10950635ad.146.2024.05.30.01.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 01:35:23 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: clock: mediatek: Add mt8173 mfgtop
Date: Thu, 30 May 2024 16:35:00 +0800
Message-ID: <20240530083513.4135052-2-wenst@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240530083513.4135052-1-wenst@chromium.org>
References: <20240530083513.4135052-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_013526_843859_B6DE390E 
X-CRM114-Status: GOOD (  17.06  )
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

The MFG (GPU) block on the MT8173 has a small glue layer, named MFG_TOP
in the datasheet, that contains clock gates, some power sequence signal
delays, and other unknown registers that get toggled when the GPU is
powered on.

The clock gates are exposed as clocks provided by a clock controller,
while the power sequencing bits are exposed as one singular power domain.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../clock/mediatek,mt8173-mfgtop.yaml         | 71 +++++++++++++++++++
 include/dt-bindings/clock/mt8173-clk.h        |  7 ++
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
new file mode 100644
index 000000000000..03c3c1f8cf75
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/clock/mediatek,mt8173-mfgtop.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8173 MFG TOP controller
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MFG TOP glue layer controls various signals going to the MFG (GPU)
+  block on the MT8173.
+
+properties:
+  compatible:
+    const: mediatek,mt8173-mfgtop
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 4
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: sys
+      - const: mem
+      - const: core
+      - const: clk26m
+
+  power-domains:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - '#clock-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+        #include <dt-bindings/clock/mt8173-clk.h>
+        #include <dt-bindings/power/mt8173-power.h>
+
+        mfgtop: clock-controller@13fff000 {
+            compatible = "mediatek,mt8173-mfgtop";
+            reg = <0x13fff000 0x1000>;
+            clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>,
+                     <&topckgen CLK_TOP_MEM_MFG_IN_SEL>,
+                     <&topckgen CLK_TOP_MFG_SEL>,
+                     <&clk26m>;
+            clock-names = "sys", "mem", "core", "clk26m";
+            power-domains = <&spm MT8173_POWER_DOMAIN_MFG>;
+            #clock-cells = <1>;
+            #power-domain-cells = <0>;
+        };
diff --git a/include/dt-bindings/clock/mt8173-clk.h b/include/dt-bindings/clock/mt8173-clk.h
index 3d00c98b9654..89e982f771db 100644
--- a/include/dt-bindings/clock/mt8173-clk.h
+++ b/include/dt-bindings/clock/mt8173-clk.h
@@ -243,6 +243,13 @@
 #define CLK_IMG_FD			7
 #define CLK_IMG_NR_CLK			8
 
+/* MFG_SYS */
+
+#define CLK_MFG_AXI			0
+#define CLK_MFG_MEM			1
+#define CLK_MFG_G3D			2
+#define CLK_MFG_26M			3
+
 /* MM_SYS */
 
 #define CLK_MM_SMI_COMMON		1
-- 
2.45.1.288.g0e0cd299f1-goog


