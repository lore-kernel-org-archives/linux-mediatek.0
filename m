Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FE2C27C7B
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 07:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRRchkIC57qyetE79hyrVGiSg7IXb/wKWZgHcEASk/8=; b=H9Q0E94LymCX4JbXlCYqAedP7D
	oyRA+M3Ywl+LqL8T3xoHja9D7sf9RnY+HwNXjJukduzKIykFwQdWcKU2TMmLJInzIgL6C3iUnzdrZ
	50tEQTD4EA0KsquE3FpCo8Rc0zUOHeJ8MGXFSaKuvy0XjBRjG3LI7MLL/q50Kj8VTSC7gKsNhq0fp
	2JLc4Z6J/I7sqfrMg42OtA4tuGfhSrvyh7rrgZ1kWRcZe1n/OBaoHx2K6uZwhhlqbkL/QZxrowz/T
	oREww3dYblOSCkkV4llnehY4pKnlb2lIbHKIiF/yaUqg8iCFj6SvsQohdfSNzQzSpQmyMkSra4TYc
	/mA4HnKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1M3-00000001lux-3BpP;
	Fri, 14 Jun 2024 07:28:11 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1Lx-00000001lpR-03nV
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Jun 2024 07:28:07 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-35f1cb7a40fso1675601f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Jun 2024 00:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718350082; x=1718954882; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRRchkIC57qyetE79hyrVGiSg7IXb/wKWZgHcEASk/8=;
        b=N4shbW180ka/ZyRVdxkoFfSloF4LrO94oh0ovVsTbYyux26chK18Y5qCn6NTJOcJkC
         35LpbP7e+8OwPP42CtMr38GkaIOX9Xmo5T8lgU9gmEK1H2F9NgQxvGipD66TjHvLY561
         zKoo74CK7DvxcNO3R646ioRxdK6gD58Pd5lfUiLSWIAUkGvgHsMpTOfr70vHSOo2FrN3
         TuRnE96GoStIX2SXz3/WeUD+kWzO50QfPGSldsgDsIpLyXNx4wlqWTKVJLdFZ4+EkOUB
         OV27Y6q7GZ7IGvOkkDKzC3600K7r5LkKOwcKOBR0ICuCehqJIsBKg3FhPdmdM9OObjtL
         gxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718350082; x=1718954882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRRchkIC57qyetE79hyrVGiSg7IXb/wKWZgHcEASk/8=;
        b=HaHXlDFCZgYNdCZcaLsamjf/9/pYPsF8BvZQMfi7/604xPk+rnAPTbWrgA/91jVCaN
         HTG5569i/XL7TAfg/XfsUrTc95fwTJCaxyOoGAZnsyyols5UB7Do5WdJzfWVQ+J5gPC7
         i80gJFKXmgDp6CulNC3bifS691mgfwSrhgwncCV0PpGcnXmpxwiTN8BLZX0zrM3vQPvp
         9iwAzdoEshIf+EwvX/nyRmo3ivDFOfukSulOJVJQuwOgfutgq8Y6TJvGd9QrkdhNS4Hr
         NumZsLTHN2WNpBJdK8kwtNwbNI0yShhAUkAg8qN/NTNo7lAXAb+qbFNsFfSFhl4Gxtw0
         Ae9g==
X-Forwarded-Encrypted: i=1; AJvYcCW9NeeF0xPkAM8TY7QCzySMzK3X0bnZkfqdy8+ydVg2iRYrQNF7WUCMsU29w+QneLqd7hQsHDpda9ygI18mCKZe5iFGOwdr92Hu7+MsEnvOThcY
X-Gm-Message-State: AOJu0YwihJFRT9BB6flfrmyItUVozUSFIxnO+CStKfXu4Ar4pWbL9IZf
	mIuNd8J8FoPGCjxwSsLJVrgJfA6/fFlTrP6ZLhB8e4h3At3CakHGFneg1v0cs0c=
X-Google-Smtp-Source: AGHT+IHQjcQoHjXlNLsKpWPr6mfqI+yT8cy4ddzNpJPAn64e9KFwbXVFkynWSZPbAcSrR/N0H6r0cw==
X-Received: by 2002:adf:fc82:0:b0:360:79d4:b098 with SMTP id ffacd0b85a97d-3607a76609emr1053423f8f.29.1718350082416;
        Fri, 14 Jun 2024 00:28:02 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b2esm3535773f8f.101.2024.06.14.00.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:28:01 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 14 Jun 2024 09:27:44 +0200
Subject: [PATCH RESEND v5 01/16] ASoC: dt-bindings: mediatek,mt8365-afe:
 Add audio afe document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-1-54827318b453@baylibre.com>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
In-Reply-To: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4635; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=wGHr7LXYjI0zdZuoQSWBZeA6hdla39Tj9ahiPZjJ+yQ=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBma/D+teoDf8J1wcv/7bJFtF7tuUz64CToYXRQnC6s
 1UNQx0WJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZmvw/gAKCRArRkmdfjHURSB6D/
 9rd52WnsoveOv2MK12j+IPradJM041eRc76MBEKty5aWjTxVHDzohmEPTJ/xT3SBxufuEbZ9rvrJnx
 XhSFitkx5+O3OlOEBno2HEvjUSZnFD0SC05Ks9gfNeZ3ugLtrJGteH39GPcJ63es8KG4aQpVim25cB
 CTLbWeLXZi99x6cxXYxp2HwUYNyddkJIPyKCl49u5nIGQTXFqHl/lw/BIjqRPZyvzLhIixGJWsnXnJ
 XngMUpiIl5X3SiESdH+Sd1CmPYZCZtpdj9PS5BCXO61Qte8ES0DPxfLYT+pMspK+EBZwosK/hZdew1
 s4EXTDRTIUvWVk+MBLybwbeHQJ4itgm8inPtIYVx1QN36q/eOFWhc1WVq+GXuuYQRoK0He7ekWC1Bk
 fHHiPaHu0LPT8Klkm6gY6IgrC78PXbKzaTXdcdfP5/qPyoDLeaR2XiVo6vImAi/lAMrQK8fW9374za
 EsCupuWgrqY6yUcgf4/4ZTwqDDXi24EFsfxYt1z9v8TEUcop0NMzn3RuPkIrFEOiRzaLcpgkboVsEx
 meuHXgpNgq3NGF+D/ypko8aQQCKmIY65iFNXZhbeMgsH1ZXAO6evA1HRMSlX4PEHGLw6b9odP1LlkA
 2GVUrbM5KYpL36kuamSVQWuWsfjPHcm1BP62x770/vwr7CIwzMsWJukAzrjg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_002805_134576_13109ABC 
X-CRM114-Status: GOOD (  13.11  )
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

Add MT8365 audio front-end bindings

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../bindings/sound/mediatek,mt8365-afe.yaml        | 130 +++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml
new file mode 100644
index 000000000000..45ad56d37234
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8365-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Audio Front End PCM controller for MT8365
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8365-afe-pcm
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: 26M clock
+      - description: mux for audio clock
+      - description: audio i2s0 mck
+      - description: audio i2s1 mck
+      - description: audio i2s2 mck
+      - description: audio i2s3 mck
+      - description: engen 1 clock
+      - description: engen 2 clock
+      - description: audio 1 clock
+      - description: audio 2 clock
+      - description: mux for i2s0
+      - description: mux for i2s1
+      - description: mux for i2s2
+      - description: mux for i2s3
+
+  clock-names:
+    items:
+      - const: top_clk26m_clk
+      - const: top_audio_sel
+      - const: audio_i2s0_m
+      - const: audio_i2s1_m
+      - const: audio_i2s2_m
+      - const: audio_i2s3_m
+      - const: engen1
+      - const: engen2
+      - const: aud1
+      - const: aud2
+      - const: i2s0_m_sel
+      - const: i2s1_m_sel
+      - const: i2s2_m_sel
+      - const: i2s3_m_sel
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  mediatek,dmic-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Indicates how many data pins are used to transmit two channels of PDM
+      signal. 1 means two wires, 0 means one wire. Default value is 0.
+    enum:
+      - 0 # one wire
+      - 1 # two wires
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mediatek,mt8365-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        audio-controller@11220000 {
+            compatible = "mediatek,mt8365-afe-pcm";
+            reg = <0 0x11220000 0 0x1000>;
+            #sound-dai-cells = <0>;
+            clocks = <&clk26m>,
+                     <&topckgen CLK_TOP_AUDIO_SEL>,
+                     <&topckgen CLK_TOP_AUD_I2S0_M>,
+                     <&topckgen CLK_TOP_AUD_I2S1_M>,
+                     <&topckgen CLK_TOP_AUD_I2S2_M>,
+                     <&topckgen CLK_TOP_AUD_I2S3_M>,
+                     <&topckgen CLK_TOP_AUD_ENGEN1_SEL>,
+                     <&topckgen CLK_TOP_AUD_ENGEN2_SEL>,
+                     <&topckgen CLK_TOP_AUD_1_SEL>,
+                     <&topckgen CLK_TOP_AUD_2_SEL>,
+                     <&topckgen CLK_TOP_APLL_I2S0_SEL>,
+                     <&topckgen CLK_TOP_APLL_I2S1_SEL>,
+                     <&topckgen CLK_TOP_APLL_I2S2_SEL>,
+                     <&topckgen CLK_TOP_APLL_I2S3_SEL>;
+            clock-names = "top_clk26m_clk",
+                          "top_audio_sel",
+                          "audio_i2s0_m",
+                          "audio_i2s1_m",
+                          "audio_i2s2_m",
+                          "audio_i2s3_m",
+                          "engen1",
+                          "engen2",
+                          "aud1",
+                          "aud2",
+                          "i2s0_m_sel",
+                          "i2s1_m_sel",
+                          "i2s2_m_sel",
+                          "i2s3_m_sel";
+            interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&spm MT8365_POWER_DOMAIN_AUDIO>;
+            mediatek,dmic-mode = <1>;
+        };
+    };
+
+...

-- 
2.25.1


