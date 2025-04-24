Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A184C369D8
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Apr 2025 13:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJlXUyXaSg5/APv08bqYlwg7ApzeLY4Yu8IAGzZsa6I=; b=EPUwcAGxtkFCv9EJhtq7odngsk
	raT+TFZmJB0GTYZ5XRqEcLjo7BuoPWKpM2w7lO4ydMnoXB7DbOr/kCZL5/8OdDAYv/FRRcvuq3xBT
	Ue0Rg+Z1MvIkwLt8ugS1u+zNymy1ual8M/Tvt7SwwPzD++9A3ZNF15PICSjVEiCBiIR6C5bLw/Pfh
	6DCTujqCNfAPAk87fz+a8Dx0IhLcduhXc8pCxYihbaTUC55V22CigF7cwR/meuwMcIJQGEQMxeaP/
	C//lX2O8jBO1FUjrogdyyjCPyDK0niV4m5Pk3LxoyGIJ517qHOz6mWYYdtNE/7b2kHrTqSnRywDlm
	EjzwrC3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7x02-0000000EGlL-3bra;
	Thu, 24 Apr 2025 13:52:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tlo-0000000DfRA-3oYT
	for linux-mediatek@bombadil.infradead.org;
	Thu, 24 Apr 2025 10:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=iJlXUyXaSg5/APv08bqYlwg7ApzeLY4Yu8IAGzZsa6I=; b=VMtbKuyKq/q6D/J/ZNrahMvCtE
	vVHs0HM8kC7E9863TfLpznCoY2H7aDsva5AuMuph9Dfra6RnhocTwLgN6jwkXvwAc8pv+HNMotyNq
	csaNsPFZVWp/JUsVyvrZQb1q+Ax6lvcVLSPKzsU0LYK/GRYn3HXeALArsgSP0twNpCCSCkjWAe1UP
	6rQMNi9bsDPCKmZa0GlChpaYtI8zi6TJs4F033rYpey5J/Y80WCe2oisWr7Gg1EFGRTpRN/xPHbzQ
	qnaQudCm0pes8+thwBpYk8pi8o401flZL1+6DcG24RvAofk1bB+gxRHIFNk6KMMGG0nBY7bK7/hMf
	rtU34tOQ==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7tlk-0000000BjU4-3L7D
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Apr 2025 10:25:27 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22da3b26532so7808945ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Apr 2025 03:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490323; x=1746095123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJlXUyXaSg5/APv08bqYlwg7ApzeLY4Yu8IAGzZsa6I=;
        b=KTusuxh12oOwncC/qouk4BYfBUSQJDGhZUifmWEwTVKd2Moq0Sg4FC9PkTM/pAQ7jg
         XZ+0/Z84g5JijpS3t5BpIL0njqfrRHqAZ6txwqdssnUj/meyp3OdauohuBw0LjbP3hzf
         e43uqs+2yTgXEV1uvWvWRofUcFzsaOir4mMn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490323; x=1746095123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJlXUyXaSg5/APv08bqYlwg7ApzeLY4Yu8IAGzZsa6I=;
        b=FlavxPhNFVauWdyXFjLBl1njFvVfFJW+AlQ/xGQ/+tmmB25VIUj3Ug3S58V4qvOFRI
         ag+cUAYCgrs+e8+siK0SXXnTHsT4BPmxUhWwg8g2etrgWvC9SrdEuHjBY++MA7umzeOl
         gck38P+3sy+8qBL3JhCA3JIb5LiY/OQzDmkAfz4q4Bo8f72S5X58Em//W/75piaqG7fH
         VUqTbAGgHwyrGXE8ffcQUj6z24wGUWwBH5x/6o30VvIlnz0LqtJga4BVx1jRKJF2+n+P
         pTdGGIwo+xK00MuvtT8wAQsNbyqUNI1+UmYJMBZ85kPvglKLknG9yEQyHVIsPNGPHm9B
         TqHw==
X-Forwarded-Encrypted: i=1; AJvYcCVT2qeJLyfF1NbcozSkhCKQylLLkymaCKvxrLpI9QtHC70k7uKF132DdMPjMpsIhlq7NEX95TUuMmPxlgCiPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyF1k8LeSxRPyPMI76MAR4n/2BtmvzjB7GHrld3DB+OnTtnsE14
	5IXII6vGN8ysLksQMQHxxOpxF9eCNmj//MK9CElgVj/OFoHzh/D6gxalEDuk5w==
X-Gm-Gg: ASbGnctamdyA7jPQwDfOi780s3QYk371pdlkoupqCo/4eeTqjhnuQ/qkxyvLGHa/xPd
	X1q2LtuQeL+Ye2A5pW1tcxCpCKuGv0WAGrBKWu0JR6/uARdiNBueOnEc97bqxw0rBvaOYhI8FIe
	F9rlf6NLdNEi7iPucR8WV+u3ohWXR91iWjVepHyrIbjZ8+OSLL8u1W/LXdzlVICmjSLV5dqiFRA
	mUjMT9lnXg+T3xhBXuGltxiuFhQiqgJBPaVsA2r5KS3J1FIapwX/VHay/M6i+OuX2YPuVtL/47b
	JS0uuNfp+XgwicsoVlJSUvabomQWXVNH7YiWqHQU4AeJnNFXjnxBca3AKA==
X-Google-Smtp-Source: AGHT+IHzoPXeAj/1Vo9RnY5qRxxsQ+IrUuZpo38gzMRReAUYEIPY7nVtqmt5PXAnUiSLOPEIxc+1ww==
X-Received: by 2002:a17:903:32c9:b0:224:216e:332f with SMTP id d9443c01a7336-22db3db1596mr29371075ad.48.1745490323281;
        Thu, 24 Apr 2025 03:25:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:22 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Trevor Wu <trevor.wu@mediatek.com>
Subject: [PATCH v2 01/13] ASoC: dt-bindings: Convert MT8173 AFE binding to dt-schema
Date: Thu, 24 Apr 2025 18:24:55 +0800
Message-ID: <20250424102509.1083185-2-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_112526_011972_5BC8F569 
X-CRM114-Status: GOOD (  14.75  )
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

Convert the MT8173 AFE (audio frontend) binding from text to dt-schema
in YAML. "clocks" is added to the list of required properties to match
"clock-names". And the example was slightly fixed up in style. Otherwise
everything is as before.

A contributer and maintainer for a recently added MediaTek audio binding
was chosen instead of the original submitter.

Cc: Trevor Wu <trevor.wu@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../sound/mediatek,mt8173-afe-pcm.yaml        | 87 +++++++++++++++++++
 .../devicetree/bindings/sound/mtk-afe-pcm.txt | 45 ----------
 2 files changed, 87 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mtk-afe-pcm.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
new file mode 100644
index 000000000000..a95215ba6361
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8173-afe-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek AFE PCM controller for MT8173
+
+maintainers:
+  - Trevor Wu <trevor.wu@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8173-afe-pcm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: audio infra sys clock
+      - description: audio top mux
+      - description: audio intbus mux
+      - description: apll1 clock
+      - description: apll2 clock
+      - description: i2s0 mclk mux
+      - description: i2s1 mclk mux
+      - description: i2s2 mclk mux
+      - description: i2s3 mclk mux
+      - description: i2s3 bclk mux
+
+  clock-names:
+    items:
+      - const: infra_sys_audio_clk
+      - const: top_pdn_audio
+      - const: top_pdn_aud_intbus
+      - const: bck0
+      - const: bck1
+      - const: i2s0_m
+      - const: i2s1_m
+      - const: i2s2_m
+      - const: i2s3_m
+      - const: i2s3_b
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mt8173-afe-pcm@11220000 {
+        compatible = "mediatek,mt8173-afe-pcm";
+        reg = <0x11220000 0x1000>;
+        interrupts = <GIC_SPI 134 IRQ_TYPE_EDGE_FALLING>;
+        clocks = <&infracfg CLK_INFRA_AUDIO>,
+                 <&topckgen CLK_TOP_AUDIO_SEL>,
+                 <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
+                 <&topckgen CLK_TOP_APLL1_DIV0>,
+                 <&topckgen CLK_TOP_APLL2_DIV0>,
+                 <&topckgen CLK_TOP_I2S0_M_SEL>,
+                 <&topckgen CLK_TOP_I2S1_M_SEL>,
+                 <&topckgen CLK_TOP_I2S2_M_SEL>,
+                 <&topckgen CLK_TOP_I2S3_M_SEL>,
+                 <&topckgen CLK_TOP_I2S3_B_SEL>;
+         clock-names = "infra_sys_audio_clk",
+                       "top_pdn_audio",
+                       "top_pdn_aud_intbus",
+                       "bck0",
+                       "bck1",
+                       "i2s0_m",
+                       "i2s1_m",
+                       "i2s2_m",
+                       "i2s3_m",
+                       "i2s3_b";
+    };
diff --git a/Documentation/devicetree/bindings/sound/mtk-afe-pcm.txt b/Documentation/devicetree/bindings/sound/mtk-afe-pcm.txt
deleted file mode 100644
index e302c7f43b95..000000000000
--- a/Documentation/devicetree/bindings/sound/mtk-afe-pcm.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-Mediatek AFE PCM controller
-
-Required properties:
-- compatible = "mediatek,mt8173-afe-pcm";
-- reg: register location and size
-- interrupts: Should contain AFE interrupt
-- clock-names: should have these clock names:
-		"infra_sys_audio_clk",
-		"top_pdn_audio",
-		"top_pdn_aud_intbus",
-		"bck0",
-		"bck1",
-		"i2s0_m",
-		"i2s1_m",
-		"i2s2_m",
-		"i2s3_m",
-		"i2s3_b";
-
-Example:
-
-	afe: mt8173-afe-pcm@11220000  {
-		compatible = "mediatek,mt8173-afe-pcm";
-		reg = <0 0x11220000 0 0x1000>;
-		interrupts = <GIC_SPI 134 IRQ_TYPE_EDGE_FALLING>;
-		clocks = <&infracfg INFRA_AUDIO>,
-			<&topckgen TOP_AUDIO_SEL>,
-			<&topckgen TOP_AUD_INTBUS_SEL>,
-			<&topckgen TOP_APLL1_DIV0>,
-			<&topckgen TOP_APLL2_DIV0>,
-			<&topckgen TOP_I2S0_M_CK_SEL>,
-			<&topckgen TOP_I2S1_M_CK_SEL>,
-			<&topckgen TOP_I2S2_M_CK_SEL>,
-			<&topckgen TOP_I2S3_M_CK_SEL>,
-			<&topckgen TOP_I2S3_B_CK_SEL>;
-		clock-names = "infra_sys_audio_clk",
-				"top_pdn_audio",
-				"top_pdn_aud_intbus",
-				"bck0",
-				"bck1",
-				"i2s0_m",
-				"i2s1_m",
-				"i2s2_m",
-				"i2s3_m",
-				"i2s3_b";
-	};
-- 
2.49.0.805.g082f7c87e0-goog


