Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6F8C54F53
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2026 09:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0T75/EutYIQThS/ZfnwY3OlWCqIaGeaNzqSXOb58pGA=; b=G/ASWXEL7N/VaHIqUoRHBegmoi
	nzWl4TMreMlGMlHK9iOa+4FbuZZluJf7Tsmb15qNbt8d4GLykxO66ysowe5Dzkx6C78GowjnpWCri
	T8AT6YIaMo4KAwN/bQJyTGZVtIZRrU7g9Ga2w5Y9QrX6/Ac0xS6e8aIQ0RRMuf8NRw0HRdbcS4vZb
	gYnGrhMSwGzCgO8UhPWNuplURzdi93Rddpbs16755XcqvnBDPvbXn8lwuxcBi4uEgQnVHQwVN/EHy
	iljZ8sx7o7GUaAEPCB77gdStoJU/cwwr84xgRjp2l520AUSysp5XfV8zHOlyvYXmQP6wOR1kAOvwn
	dDK7es6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodxF-00000004mw7-3zgV;
	Tue, 28 Jul 2026 09:18:29 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodx8-00000004mrw-1VGs
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Jul 2026 09:18:23 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2caf228a910so27636835ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2026 02:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785230301; x=1785835101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0T75/EutYIQThS/ZfnwY3OlWCqIaGeaNzqSXOb58pGA=;
        b=MulGHsHitJqe9JpTWoCj49Rj144UZYgS8fNub8XIDBef5kg2ue0BWeTKLe++RvuFV+
         r4RMP/aZXZqlg7Xzie4B4FsRYpWzO9cX2a1G8F3XmrUHkMEV3MrkYsW2hnWZbcCEFhpj
         Uu3oz/+hYgr0q6HnmKS6d95wR41rKk3BKsGSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230301; x=1785835101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0T75/EutYIQThS/ZfnwY3OlWCqIaGeaNzqSXOb58pGA=;
        b=O78++BtHtTmbtpeRuWn4rLfol6cW8OttpuesC+6qXg5TH70RLd1o/6EI4Kd9k1PFSP
         HNMXMT9Dpg3xishHWzklv/5EttryPD6OzK9TtP/16KMUDvoXVxNN/dv0l5nYnwVfC6za
         Vaa7r6rfATf+vBLEKZYoo4AyEOK/CIIRRHP+Qpvxv3iI66EwgI8MN3mof4f6Ne7VkGPb
         /zdKyfJP4SkZDU7qxgQ1yXp6IZcxQJtM3MjcW6UQ3nbynG5WDq2qtPcu/xStjb0ejqtk
         N3dHkq2RWbaUSF19BPNsYM5IVd1X9y2aQCuoCGLd1uGJfCt4ldPN8xcmi5p6qIqzuBpT
         gOQA==
X-Forwarded-Encrypted: i=1; AHgh+RqXC/BkM5SX0w2Y9hA2fK1opAg2sxXy+Le+pgrcIRYCM4Fuudjx1vqwrLwNV1E5E5vTNHMRJjkhAxm762MZoA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs0ov6xCWKQaBif+2wOFRrxTzoMEujflAZAqDwKdcpLFbuGPOM
	JRJ44truvufBC2IBuKhI7JojUILJ3VCbpC+RzZxVyl8IBbnl6WUx09yqDep1Tv/FcQ==
X-Gm-Gg: AR+sD12BMTI+yJKviiw0WTq1hCfQt1Xiay0eP5QDdn8ynCZxu/KG1JIOBJ4sGBOyT4V
	qu2H7rhlmUjGXC+VKsxjQKbO9ZVG9VWw8NcT8ukM6Ym6czBwGdBwg8KxTnuB3eKlJG0cG8FveB5
	irZE+0mYbjdxwglsLDSy5yzYCQ8GAWQEXTV63BU0MMaZ8KIaBvrSwYCMg09sR9/ktmU5NUs/4sS
	2kE+nwBiRADw7FyAZfKCrV7bANt+QylS2oU4/30MHZm51105ObTwuvdyj6wxLMO6SonbMt06bgF
	Y8MaJlPl4wWVZ4j12ozfx6ZZovnrOOP2ILVPDyUnqM1wJHX0BqEJzDPKzEcuewpp4PW1HTrt3eD
	Cu/6fL3BWd2P9ZI0/ec+BUMdM5kzCjNRfBgkfVXvLL6p3G4G2UpWt3FY/b5rdzfcNL0rZk9Kdhf
	/OU3Pkkxl3k1JzrgM7Hxom0wgkP/Vr086ISVRGVDCJqYw/X40qUginXkgDNNlsGkLWd8MR9Q==
X-Received: by 2002:a17:903:fb0:b0:2ca:e565:7b15 with SMTP id d9443c01a7336-2d015c91d62mr18424095ad.10.1785230301466;
        Tue, 28 Jul 2026 02:18:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:c85f:b2bb:a077:d544])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81dcc1sm48616965ad.84.2026.07.28.02.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:18:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/5] dt-bindings: clock: mediatek: Add mt8173 mfgtop
Date: Tue, 28 Jul 2026 17:17:59 +0800
Message-ID: <20260728091804.382753-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260728091804.382753-1-wenst@chromium.org>
References: <20260728091804.382753-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_021822_418152_99DBD834 
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

The MFG (GPU) block on the MT8173 has a small glue layer, named MFG_TOP
in the datasheet, that contains clock gates, some power sequence signal
delays, and other unknown registers that get toggled when the GPU is
powered on.

The clock gates are exposed as clocks provided by a clock controller,
while the power sequencing bits are exposed as one singular power domain.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../clock/mediatek,mt8173-mfgtop.yaml         | 70 +++++++++++++++++++
 include/dt-bindings/clock/mt8173-clk.h        |  7 ++
 2 files changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
new file mode 100644
index 000000000000..03db1ee9e594
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
@@ -0,0 +1,70 @@
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
+        clock-controller@13fff000 {
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
2.55.0.229.g6434b31f56-goog


