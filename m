Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F51C61CE8
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jun 2025 08:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dZevLz3MchUHKLeflzToo/+N7rtScyOYND88JFbOUY=; b=SLZUc4xkD20ZEwK0r5ldryn6AZ
	d06VYZxFzn7r4XwO2sdNWRreYcKAoYWwxE4TTlR3oLS/lp/oAJKj9rxbxvxFLiLed3m6GDSXITQax
	MNZYzS99t4FuRzDc3/rDLiv6a5s7Dav0OjSIDXgxoW6NmqNjJYt36lVtBmbk0DRPQbqmu7YJM1QvM
	CnV8xSjMg7rQSpbRDk6/35ZJCm8nS4RagvHfdl/KjKJucPQhe+TDIkMBH7oHFBXJfUXMIFa0dQOCv
	Qw8qUGtKI1/rFO5KfbMVon/5LPaMyH0+mZj8t2ZzpQo+O+yA0kRjY87waFbtBKRnC3P7bM2e0Ujnu
	WR2S534A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdH0-0000000CcLA-1Xt9;
	Thu, 12 Jun 2025 08:26:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcgr-0000000CVVp-0eqF
	for linux-mediatek@bombadil.infradead.org;
	Thu, 12 Jun 2025 07:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7dZevLz3MchUHKLeflzToo/+N7rtScyOYND88JFbOUY=; b=S8UYGOlLf5ANISsMTiZfYD1UwX
	rMFjqx+Vuv3x9tKsvGBJkZiboPtAKmaofXTvQibzGwFqx3C78IIrkyZ14ITjcgNQlzbGNkicEvDe5
	DQEnV9so8LQ8UrTOw7trNISMg5HR9qlP+YAP45U/0zJNjUuXjv/zVD2miMMA0yY3wki0vnXZ7YEer
	xRhcM2sJHzFFEL4Nt5bOaPzElXyKnqeLg1z5yib+Ro5e0tqVdvZmPPbHBikOsauA29kXl0sfh26Ib
	c0xDIGX6h05/+b7aSb13zPFxLq0K54IUqRjqNoNLZeKWIhLG8dW7y1KNvHPZCPVi1t5IVayB0Y/Ms
	zhNEJzBw==;
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcgo-00000002aHM-0aKl
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Jun 2025 07:49:36 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-2e8f7ca7ca3so358115fac.2
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Jun 2025 00:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714570; x=1750319370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dZevLz3MchUHKLeflzToo/+N7rtScyOYND88JFbOUY=;
        b=AElMbC565iqYME6vPU+CChrAQ+g0O/MVuFx4/g5ZDkWJ4sVGabtULpb0T5fKakpxBN
         31qsDgTCOi/eV7FfA8rnufSK+Q2aiqvaNnNhokk5p7vC5qUPV/cGxggzCh7H1X/bdlZU
         DZd5ukAoTl73tlAbSzmVDSZxleA0750M54iQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714570; x=1750319370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dZevLz3MchUHKLeflzToo/+N7rtScyOYND88JFbOUY=;
        b=quJs7bFhJ0K0TgPUfmlmtYazxKOVMKmJVOHcfCQp7SpV5SfX715jfS+Lg3cLu4Qa9c
         HKtHqQ6qh+4/TLeQTTR8ExRECBJ1NqWdvO3lQMDlSTD2BTIYe/UV3lW/sw/MO+0SlTWw
         OZhj55+tIeHO0ej06s9QKk6ifWbytvhmfszOuFBj/4THa2ehfaUNDdr8vdDZ/kUakcav
         CbVJ7jB+qa8bA06ao4wheoMzJvhF/kgxUINlaZdMad22c+GECWmGAbM78xJQZ0vh7z6U
         zX2lBJYnFQolPNpVxpIrpuI12pX6LDysC4Yok0kRPazU8OUaMU/UTdp8Y39BhAQx5RH9
         3kwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGV6qZWTuJ1fZyDr2z2B0bXVEYf4Vcvp7318bnHvGi8BEVnomOmO3nGk3IiRp0Gv0JDKzY3XJE14Son2v5Cg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+D8kbdBCOfoTnZ0CmwoV+Skr27w5hook5EFnleHyhkpdf+Tee
	APHw2TFngaake29XgrqSm6z7+vPJBf/CemuCL1fI1De1698unZOqUNGBGBuI06NwXynh+HlTvkq
	FMmo=
X-Gm-Gg: ASbGnctM+1pcuauCBH0JNgp/7Kom3pkc5UW28Pr2GG6XKF+hISsZgmoPnSrEVPJvcuv
	wrFN490dqeznBbwdYFq6XWtFPSHuqDNXSTcjQo0e2P+q2QsQalmVNLR6fQGrleHoaQOMhcQ9XV2
	HKfYZuNYfHfNoZsBi/Dzg7hKDJtGX4qLiCqWP6mmM5NvKl8ISDhXUqlJOEsCe1QT8PeGGg9gTQs
	MVphwTa1CRDO+bod+BxAc2qX1v0s9GzqbQI8b5VQWsXvrAYJ1BXKtf2totzVu4pk1W177qyTxlh
	4bDJXe0DzSINtjOH3akrJQroPeDbYK7SUXffS3c7q7HF/xYWuxYYC70ohHlUZ+xzW+lbw7Ssd8V
	g/WJntJF5rsgQTg==
X-Google-Smtp-Source: AGHT+IHec1zUXIa5nP38bZlEL08BVN/XVUdoN70CGx527A+qcXzcKljkY/6lP9dS1yxTSifW5ZVikg==
X-Received: by 2002:a17:902:ccc8:b0:234:e7aa:5d9b with SMTP id d9443c01a7336-2364d676a85mr32691565ad.23.1749714557205;
        Thu, 12 Jun 2025 00:49:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Trevor Wu <trevor.wu@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/9] ASoC: dt-bindings: Convert MT8173 AFE binding to dt-schema
Date: Thu, 12 Jun 2025 15:48:52 +0800
Message-ID: <20250612074901.4023253-2-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250612074901.4023253-1-wenst@chromium.org>
References: <20250612074901.4023253-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_084934_383749_2ECCF2CB 
X-CRM114-Status: GOOD (  14.73  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
2.50.0.rc1.591.g9c95f17f64-goog


