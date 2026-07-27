Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5490C53219
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 09:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eiS2cO5E4x0Awi3aXHlbjiWygQvLxKx4fGNRAdhWDNQ=; b=GoD/aTRdT4/I0NaGJHjkw41/mH
	kmz/FmvT4WvcE7N+weSodBqrl2fORZbbLdx+MZET1RYoBKoqUobnVr3Oygedui2xXEh3S6QnFFESg
	3rDZvp5uK/2vMFukmt1AErCDq4LXckVqL61EppN1qDSNYvwjCzs38Euu7ZHC8AdDDjyaGRyrEz4KR
	9vtwpPSix8RTZJzDXFNu7uXPppo03ieAkRe/0Mw2P0kDHjd4FoQq2I1wo6Eonkqhd8PLi2ExD70zz
	v6Rh2hBZfD5LvGxrOkXB2GPc9FMtsJk+ZnpoTrMCoi6RIJFgzu8umeyHHfa3ZWsYcuXhJFwa/Bmka
	pDw4MFfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHRu-00000002It2-230C;
	Mon, 27 Jul 2026 09:16:38 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHRn-00000002Ios-14CK
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 09:16:32 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so1691828a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 02:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785143790; x=1785748590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eiS2cO5E4x0Awi3aXHlbjiWygQvLxKx4fGNRAdhWDNQ=;
        b=QoPj4lTRnQuuWJ3E/0s6a6xSxwloOKglFaa7Sry4KYqINTd+zPOrInaVUbkdnRlopJ
         SLjZR+QHdlnk5uLBDnvWgo9a6CboXMVEAEyCd3VsskjYVaDhC7xLpgYBcTJGcOws3itx
         rpj9EgM7vA3ezFYgUyKr1P2zOxlZmhPIXe2LQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785143790; x=1785748590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eiS2cO5E4x0Awi3aXHlbjiWygQvLxKx4fGNRAdhWDNQ=;
        b=cFYirve3QUPKGtHXAoJY9/LkNazEWdsVpCNxd64+33Yz5BBzjGP6OoAKiOjvKNlxiU
         OqX9wKkpbpK4bz+vYDWxgQAp5ixW19xeuYTi6T2E8gVTpR4i9J24hbAIEi4yigu/8hdw
         lYk4o5jlsANDuKutTVz0slw1WlZeuWMbFNrVAL+SdCqdiAqk35+kl5wy9kYqVV6O3Tiy
         dn4WM87jYz5vrlR/uugmeYn/gzxYR7IVD5Mi7HjpCOuvA1K3G8ey1LTTd30Uu5tlWxLa
         4Z6uaDU7RR7580VlkVFmHp4Si+wKApDNDgUwaK1Y0q8aPD+eQWxwMNgkKlVQAOfvIK+0
         8Rwg==
X-Forwarded-Encrypted: i=1; AHgh+RrsfMxUccuwI4HpOg8cuZvbqgv5jWWp7eVCH+AP1O5wdzkaz/anmui2Mde8ajXQa6vZO6b3BizAM1CTzZXKJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzuDpN63n4LBwD0FMFv4U7QAl2xhb89/UcBkBb5ctwGdHCJ12y
	8pk9QkkyGjo9riPGErnPM/ipNmORCr0MkNm40c8Y2B8F9oJaoZnpCVCym1l0i6CubQ==
X-Gm-Gg: AR+sD11UcqA3t7i1dm4hZIpzTOyBYhh61OKcbSQRo6oZi5c1ZDZuhvmUPgV9BdLRLcF
	HWDycsOSnBIeK8pe9xQAkaLMEWGpIqx9wC6ZrDznBLsU7DnG/EimQ4lIQoeNSpwfjKMCXlqSdrF
	e04jZpYzSXTqXwQ51wuhwSJtusnR1wkG9aW/IwURA1n0Q/WOfifEGamWdEQZ01S+pgacp6DNVW8
	eOqZe+kYnEUwOkexYeVxc8gBcDRQYlOmvMTxZRGce/qdterovYkLtu5JHh9QLhU4zkdl3glXCyc
	+vt0BMuiP0Shj6hDnX6aXb8R3ngO2bzKV2Dr+ByfifxbKrFY0+6C5n//48NGKBXSQJi/fel1k4p
	QDIE7xVqnc6UrzWOKuET43vdwmU45ZMuzsN94LLOadNXkBZkYG7deNcl9glXaEhD7h0I5MHZ2fq
	LFPffmqdAfuULN7jlCBbb7KW4tFfM0SI/Fkw3EmEUk/A7Tb6u0c3pZwR09EQ==
X-Received: by 2002:a05:6a21:1644:b0:3bf:8de9:c64e with SMTP id adf61e73a8af0-3c67eecb1fbmr6693314637.2.1785143790405;
        Mon, 27 Jul 2026 02:16:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:440:c713:a2b0:6f14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb662329fsm2870049a12.9.2026.07.27.02.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:16:29 -0700 (PDT)
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
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v3 1/5] dt-bindings: clock: mediatek: Add mt8173 mfgtop
Date: Mon, 27 Jul 2026 17:15:50 +0800
Message-ID: <20260727091555.1023910-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260727091555.1023910-1-wenst@chromium.org>
References: <20260727091555.1023910-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_021631_301134_FBF4BCF1 
X-CRM114-Status: GOOD (  16.56  )
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


