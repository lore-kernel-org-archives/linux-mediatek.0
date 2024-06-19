Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F39C2BB85
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 14:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFgfVYXqfttnG8T9cixZ5XkV74OKDwZYpy7meDYMP0M=; b=yExEYZ5vRJ/4XjOrV4tXWYyYEI
	qH7Dv6pgEHsULppQejIctc6dbfJ+AmwkfBAaTX8F7xx8SFN1INYlC2xI2YT+PHvlapL3e5mFCGJ0W
	LW/5sff3GfobnI5sLWmbgAD34U2SfTDZCWXb4GM8Faucukti6/nZHFSUVjQnfeigK2ogU/31ByiFT
	rTUH2w3Q3p2JRj4QsZVdtlZkewQghpiKeB45cT6d16x76w826lyP/bSjgOmIFQMazv50hl645lPPp
	kGqEDHAhHiWKkaz7LjSW1XnhvtrArKQoIXg7fig2IF3fnsu69RUSzadjDGUIektZKmuM0va/D+ruk
	0TMTZ8/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwaL-00000001d4c-1bU4;
	Wed, 19 Jun 2024 14:46:53 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwaF-00000001czl-3zhF
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Jun 2024 14:46:50 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a6fb696d2d8so76296566b.1
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jun 2024 07:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718808406; x=1719413206; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFgfVYXqfttnG8T9cixZ5XkV74OKDwZYpy7meDYMP0M=;
        b=q1XVYHMpBMIbHo+yY0GN5bZ6SjzPyHzYAE5cR8JFD/MT/7aIiWoItHhjMi+wOKbzw7
         rKenW5lIlvkdEIsI0IBugjuFPhzPtRJQEMiLwryBZ19Kjpsrtbgm8Z6rilsrLEFDIUc/
         Ex5vi667RahG+KWAY/GTL8nA/FyPc6h03IMDXM1Ur4GUf5p6QBsAcWqZClLPdftTBVL0
         53Ycs4wJDxQnUEJjd1fwTMdHmv1hCwTnqJL9rIVlulStt+B2QuI0mGDn1aCDxA7S05Gu
         4TSX9kojH5M3Vew8YDlK1Qhv++o4p0zyNHKbXq4C8wmVTZ2hsM4LA80RWE8SWySAF0z4
         F5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718808406; x=1719413206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFgfVYXqfttnG8T9cixZ5XkV74OKDwZYpy7meDYMP0M=;
        b=u5/aHxF9ZprBRDAcFPtpb6hWKR+uTOYxZ9EzR/FCP0aLLfM/E+Ae0QvML7RgC2g/wH
         TIAPEej+5pl56NDfDr/CC02Z6GE855Gre4NZhzuFWVMarEJ+n9h6gfDBgzB+tQ9p689p
         pDRVN2ZsKGmzUW2QdC25LVsolfkkql5M9ICbY9x8Xj3+kO5QZUQXb4C0XZzrb1TgpBUI
         PAAPo+M0vz8e8bFCEKd/5EhMjd1NTlVugAlpgWgSTwXKnBPqg+ixovR/4K9z/6Aabj9f
         VonQV85bZlUJHv/L/0mZ++kgrmlMb/JoKbhfpy0PrkcgITTJy1A1Ehrqw+le0Xn8nafe
         sNvA==
X-Forwarded-Encrypted: i=1; AJvYcCU9KgSl9gh2SAp+7GlF+ausHn80mtoiBtnfbMX78s3C53MFEviWgEj48w/ZPfalqscBoIsLsBBtI+UJodAFsoCI2wracmGvl/FCb0hIGLyl5/1u
X-Gm-Message-State: AOJu0YxjtVLusgGh1shh9/YqYHOP0KoU6Ectbm03vqCnvQzFKHn7hV07
	02akhklZFkwN9YqDDwmVXBMKBO7FhlLvXvFO4NvdFe0H4yPSdZGpNu7BpLhCx4s=
X-Google-Smtp-Source: AGHT+IFlaZlwOAJxvwmGRf/CHI//hdexatLRHUYloGcUFhB/gTLV0GxBWttIfjHk67IkaVFJHbCbYA==
X-Received: by 2002:a17:906:fe44:b0:a6f:96b0:ed2 with SMTP id a640c23a62f3a-a6fab61c269mr216418766b.30.1718808405661;
        Wed, 19 Jun 2024 07:46:45 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a6f56da32c3sm679787566b.13.2024.06.19.07.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:46:45 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 19 Jun 2024 16:46:37 +0200
Subject: [PATCH v6 01/16] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio
 afe document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v6-1-f754ec1a7634@baylibre.com>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
In-Reply-To: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4718; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=WVoFkdQ/0FpyCHJrAYCh9k+mXMPqgGmWwmumiaugOMk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmcu9QUHsOwR1bJHFMdLIjryojpYzpcuZSbISXYgl8
 SYBfAZuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZnLvUAAKCRArRkmdfjHURUrID/
 9nwPCJW1jcqVmPgquiw2YQ8njzzp8SPVmiUeuufiiDw/Tk8Du2byeJaJguZOdoQs60JE/Wc+/wKCe7
 Ka1pfPUyw35OviYERPr56uYQV0lHJWNdwIDxQMw4pGOLbUdBL3T4qJYwCNSRjeISDe+u8yrdc3glAR
 12h7Egy/BOUvPneoXtXq340WDj2BgbkfnXldrd5xN3zkMa+TUCemQAGlzPevaNycy1c9kDqbIMIhrt
 CWn64dc551ZO8gf1kUhD1E9+dk4kw5fbGdJz6WCIE86Qu/vkcORcgjE2gWvmRdP6UwckRbOC4VTIU4
 JS+NokjEEgreIsDieFd1X0CAvQmgsKH0+3ZzIJZjzfs2TG40KkaBRfHiM1ypvyK+qIG/7E3JX6cKf8
 On8iMw4sju8OjDCJrGmp7BITez5JXv6cpUThl5gjYkMcZZoOwmow8KONux3st3OkWTF2Uws0Lz7fhk
 XWSS0560I+m1mKg/WidUn3M4b55Z9nDgyFFDD6OvG38DQ86vllhRn/EO4c2CN/s3u7CcQ2DUtzhRfg
 WeKw6xz1COiSoAbmybWzUUCqqyxKfUdal7B6YHrjr5h1ndtrQE3Vb7PYIVt4c40kFdxNE7kiAoMfdy
 G1aEQv2g2o316vov85eMuZR3n8CFisufslmiNRLN1OL/baggGdYVe7N4Nd+Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_074648_041643_88BF1C74 
X-CRM114-Status: GOOD (  13.63  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


