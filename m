Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E967C54E41
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 15:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytleufDfW156KK594Ruui+vLo5tX3ovRIKKvPCU4Yc8=; b=Zk4OyhZmvcUD0BXhpF+XuDcJ5e
	DxDfUOqaxiDlZXFIeLdvrfXQAIQznOc0utaAbhQ5Yc3e4es5skZ44zJkNj0IfnBkLLwucZYZsTITP
	4oxr2ChK+IRTddw6uYkeOD4BZr53rmazo/zp2osDt1ZxSV8BtEIVC1UiW1kgd6zsparQ/9A4+mnqW
	5ZTJxB53Lzl6ceznlzk1DyHJjcTb6e//6NA/p1UyLQdn/ZJ56x8/rwfeB3mTJGSmtpPBewzDPVy7X
	9dIGL4hUVbZTRMIAaVMF+6TAOvkqzpSOKG0c7dLQA/+ci3Bzhelt276gO/sVUomuiX9wssdHSFTAf
	LiuaArZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reciR-00000001N88-2QQz;
	Mon, 26 Feb 2024 15:16:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebYm-00000000ybZ-1HXT
	for linux-mediatek@bombadil.infradead.org;
	Mon, 26 Feb 2024 14:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ytleufDfW156KK594Ruui+vLo5tX3ovRIKKvPCU4Yc8=; b=Qj7v9v3PmAbMTbBvGed3quRsHY
	c29i0co3bG/lyVPROS6/9n82+nvr+wD1Zqh+RFI2kMsEkATgED7bULEAJgngahqZrW/l6L+x9AVVU
	c8Ac4D+ZD4xzs9voIJVQzbQbc7VkYb9+/irX8V9gSPYho6YHRJgOsxuExeHdl9/ZFGeBhQUKR3Ydp
	Mc0RyARElFrujQlWcy5zDP+YjUTei+WH1ye/WCpVckgLn0fzVrThG2L5F8kUY9n5AXiPIxv/unEMt
	k03DSiObarnR8tL/mSQmXTC4rMNCB3vhDu09oVsgyih/sYsB7bHt/CHKnwAoZdfGq7wMLNLIT6nmL
	d/z0s/uQ==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebYZ-00000001ETY-2lsM
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Feb 2024 14:02:21 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-412a9457b2eso1809865e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 06:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956128; x=1709560928; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytleufDfW156KK594Ruui+vLo5tX3ovRIKKvPCU4Yc8=;
        b=LNsAwVfbFtn24s4PGE8viqc1/Z3Wnk/IbRp/0bbcwNsnjTyHNDGrOXvTAizMYfrYoK
         7Q0tTbg0DEolY0Mkhf17X9C1EIJ2tt1AmBk2SKvoITM3kS4P2Ew7f+0BRPEA7NcBo2/C
         lTF7pvxCcACD4NuFN1hgYy3A+2jtSuVwOeLPfLmqgLsF8jSSTTMmWmEWSodS1SvkJB/Z
         RArMoi48wDXs2YeaLETCzukXG0fC1zfcbGzZNEFWv3eAnlsye01aad1trzTQcCRgE1Lf
         qY6ppR5u7dRcrtG1aYqbk9k+KmJ6TVQncGkM7X3NIW2/q+b4UE624B+OcKuHdvp4rBJo
         rShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708956128; x=1709560928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytleufDfW156KK594Ruui+vLo5tX3ovRIKKvPCU4Yc8=;
        b=fL9my6Eo3CnZfgy/v0YpqUxs6c8Z+JqZNal+JCPADehFg4Nl/e4hGHfweJkKMuqjF6
         WV9LGHOpDCAOgKFyl4r+BJg8iZerp2pUG7sEWfXPcFBmLR3CV/rXQ8lS80ZflvMQbr5b
         kxaeICuhfJ3x88zaOkrU/is2LBpZACA52bS9dth3MWX81bVlfvRhjAyw8A6CcDpD87bn
         hTRkE4ZFETcBTdljCMcKUau8Ioe46xEnRUmiRFiIJlYIrRQyilUQRVJcGh0Y7Qf/aNVR
         IjKnw/Vii6uhcdFnT39QnE81UQssTfH/k/Dyx65YecQZdhnfynPVJpy4PsdfkXCAcXTV
         fYaA==
X-Forwarded-Encrypted: i=1; AJvYcCVZk4FiJ4MxYiLwkHVSTytM+rvZ5+/VXALs9vB9MmYCgQ4HmoWBelCBo0ixt0RYWcnvnDs+di9xftRR/LIhdLUbLnISB5hfRofH3CkcrPrTrQL8
X-Gm-Message-State: AOJu0YxxwvvtCSDrPh9NVRGtz8WDoTPz1uKOYTzVrg7MoeYyXrNnPU/w
	XHtI2wTV9WocPxMwkbyIgCbd6egB331E5y95W7RqRqNPvgTXClv48DtnblZ23mI=
X-Google-Smtp-Source: AGHT+IFKQGufEHWXBUu9F0HZgi/6g4V1k8Axa81ufjmly7iPNiTWJ446aEOcRP2RTw2v1K+EZMJ4Lg==
X-Received: by 2002:a05:600c:4f46:b0:412:9434:fa38 with SMTP id m6-20020a05600c4f4600b004129434fa38mr5678803wmq.7.1708956127984;
        Mon, 26 Feb 2024 06:02:07 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:02:07 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 26 Feb 2024 15:01:39 +0100
Subject: [PATCH 01/18] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio
 afe document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v1-1-4fa1cea1667f@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
In-Reply-To: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5536; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=0kCH2S+hyKAqspnQK264eeLgQIfJopJ1XswPK6oxmVg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JncMTn7Pva3qSLlaPLg/cPnluAh0ub2unqFS4aw
 o/sUWTKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3AAKCRArRkmdfjHURSduEA
 CPJ+/cDO21Vbv6JavXGbRfwQV42UFIsvpm9Tzg2PmE+GXSHwFoKdkB1mOZZFCDgbG2dW3Xs2HZhJiR
 +iI8NDm41ZA+2C0KIcd7qH6JsZ7N/fuBCRpf8tXC3TfjEbJ15U8mM4PRosdsFFtaKBHG2qWantz4bW
 ZFnck6avImi7OjOmwaaAnmsyPuLk9W2w1y320VyqsMzidfwFvedimCwQj03Tif9DfJXwuoXd8gqg4h
 Nk1RyfaW6Ha8n7NJW6T8GowjEqfTtJr2UxhBxQYE4z9lk2s8/wB3Wp4ZwA+UQv2V/B4WLYq6BlKeh5
 I71FsGrbbU3I37US9rMAqv6ADDBfHeHcfRA32w0RyeUFR4l/TaWyMDJtbCRTCz4lYS6ni3EDwN72jq
 G4wubcsZi4uJiFK/3syTEeZKj11NrJyb6EGo6j9jhSU9eor4bTbq+jS4LyITxulj3/pIS8xSclGoN+
 ALOfjFYcEVuBNpMyfWQOfQaKCchoceUQUym53JxkCHrmfhcpyIjXG+GcY5BWFq9j1wTuH0s30EzSli
 DZS89EOLdXA42pQ9DZkFE3/DSlHiMaF+Lg/Jl48BnPgVIXRRHrCYvWaUqlax6BpcEAy5CpScngO1ut
 3kmJ6PyADi5zVLfxqJWYEI8F9O8YvyzaTjvPbjClBHZ5mK2eW53ia46Wzgfw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_140212_610182_6AA43959 
X-CRM114-Status: GOOD (  15.40  )
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

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../bindings/sound/mediatek,mt8365-afe.yaml        | 164 +++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml
new file mode 100644
index 000000000000..1d7eb2532ad2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml
@@ -0,0 +1,164 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8365-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek AFE PCM controller for MT8365
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8365-afe-pcm
+
+  reg:
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  mediatek,topckgen:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the mediatek topckgen controller
+
+  power-domains:
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
+  mediatek,i2s-shared-clock:
+    description:
+      i2s modules can share the same external clock pin.
+      If this property is not present the clock mode is separrate.
+    type: boolean
+
+  mediatek,dmic-iir-on:
+    description:
+      Boolean which specifies whether the DMIC IIR is enabled.
+      If this property is not present the IIR is disabled.
+    type: boolean
+
+  mediatek,dmic-irr-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Selects stop band of IIR DC-removal filter.
+      0 = Software programmable custom coeff loaded by the driver.
+      1 = 5Hz if 48KHz mode.
+      2 = 10Hz if 48KHz mode.
+      3 = 25Hz if 48KHz mode.
+      4 = 50Hz if 48KHz mode.
+      5 = 65Hz if 48KHz mode.
+    enum:
+      - 0
+      - 1
+      - 2
+      - 3
+      - 4
+      - 5
+
+  mediatek,dmic-two-wire-mode:
+    description:
+      Boolean which turns on digital microphone for two wire mode.
+      If this property is not present the two wire mode is disabled.
+    type: boolean
+
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - mediatek,topckgen
+  - clocks
+  - clock-names
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
+        afe@11220000 {
+            compatible = "mediatek,mt8365-afe-pcm";
+            reg = <0 0x11220000 0 0x1000>,
+                  <0 0x11221000 0 0xA000>;
+            interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&spm MT8365_POWER_DOMAIN_AUDIO>;
+            mediatek,topckgen = <&topckgen>;
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
+        };
+    };
+
+...

-- 
2.25.1


