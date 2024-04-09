Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0483CD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 13:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vstY9Zznkfygwg0NsHtg7aqDXceNRwx7wPOtr1MNxN0=; b=qmu1+tODV+/eqMgJICmyEzGKtH
	K6llb4yq6EsRM+8rh6MkUaLvkuwzIXpOFwC+faONstWviKLhbQArgyVxdoc+ADGhBLMACPlgAzYz2
	3QkJmtZ/Y37/6e9Lx///S59LglDIKtc3E800tst44Vn/l+c3BWo6OoresfazHtsoqmCzQAhkSuhON
	WosUqCVemG0seuAC4vpcQT6LYXKKsbRkvRNpt6Cc2SliDp/WIm0FsBvO65qLHYZVV8qqlkSLplDJD
	dlZPRWVdE4EYbjPYiXI9Sm3dBOrGP1y+7ar5RXauu22Y3/aBZDV+smwBO7QWG1EkOJsnNdK3Jqiki
	+R0/MkFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBkS-00000002CZ5-0jHN;
	Tue, 09 Apr 2024 13:42:52 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBjm-00000002CDU-29G8
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 13:42:23 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-416b7f372b3so1993835e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 06:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712670128; x=1713274928; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vstY9Zznkfygwg0NsHtg7aqDXceNRwx7wPOtr1MNxN0=;
        b=muzapRpgFCFm1aRneDZ3X/aC4dGS9G1jGTYEnBg6OE0+2IMOcDVJ64C4SqZEwuVsct
         HSaZedoDI0Q8XDFbB4zzm9uxLDHvqQtJnETWYktRbzUDi4wBkSiFprmqs0NihF1WX3I0
         z6KqSKKPvHOrSd5QQMBjIMmhePufVzAlxya38EqL6+uupfsODepbDIrw/Tzu6kD4Uyih
         3jOmcldzNwiwbpooq0pAcmrzKtGl1j3txj5HWI00NImBNxeF1VivvrmWEHnmdqJ75/mF
         //SOu8ko6UdA2Y6ldbn9FqIzlyv+qIjPTBbmcjydUpRCn4wbblkq7W0snWaidEyktCg0
         3MDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712670128; x=1713274928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vstY9Zznkfygwg0NsHtg7aqDXceNRwx7wPOtr1MNxN0=;
        b=sD5N0v/hpvSu4uC1wRV0o5KGf6dgsIFLh4oSzeKP/iJrR1MXo+k5+9gs7MNZfS0soK
         ZotYEm+pTNIBtJ7B3keLSDlulAupIq+VIQ7CKuxRoLjg4buuwsUABoFRiX0B9Onpj2CY
         AZP9gzzjU8yU4hXP5gAtTtyqrXRgXCUEmHcMX6swlh5CFTgLAdE2ItZIN2sLlKpu9z5e
         9JXI1eB18xbi3nZXs7MbqRNhRPggq30As5I23QvTOgj240MRZoKNz4pbPAi3rCl0JxXd
         NaGr92X550BEypLHhLRH4p+p7jAAtbopCTLHhehEuRwgFYcvIyi+faGfIedj5pTpI/TZ
         XTFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmg8DV1zUTpXZDGVhhLNUwdAExkAon+caZEd5y73TEazIvDdKDMBtyY6O9Oe1IAXvDvgw7gLFdeOGcBw6e/jiqVZYAFd51HzdQOhjvDPfBRr/n
X-Gm-Message-State: AOJu0Yzn6UpSJ/+kYjGFaqw6Yn5tX8xJm27OTYMjcWZVOtUo5Afs1zKh
	WUG10diVEUzAYhBQRaVdDmNISCoHuMGj/De0dlO/3YRgDap3k1Qt+JLrNUTySac=
X-Google-Smtp-Source: AGHT+IHDIJ/STOp155krHtuE6+R0qF0kV5jQ+r5gMYDmIqloJaNtYXtutH8Pj9jQumpFd65gnSsycA==
X-Received: by 2002:adf:f843:0:b0:346:41a8:2b56 with SMTP id d3-20020adff843000000b0034641a82b56mr703358wrq.29.1712670127888;
        Tue, 09 Apr 2024 06:42:07 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j11-20020adff54b000000b003433bf6651dsm10753579wrp.75.2024.04.09.06.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 06:42:07 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 15:41:59 +0200
Subject: [PATCH v3 01/18] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio
 afe document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v3-1-16bb2c974c55@baylibre.com>
References: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
In-Reply-To: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
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
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4760; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=6yP2PSTtW/6RtQgKkMZffCd+b5diqb9RzbFiRrSwUQ0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFUWssOQfHcGy+MdWILs/5t3ARO+pL7f5RsuE6THH
 ynPq6KCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhVFrAAKCRArRkmdfjHURX31D/
 99MawtD6kIzixa97HmAbQ/o7rccbyNMGoGu2FufywgtCqwAd9oNQXEjcyeatFyhzjPgMudIh14fVFz
 4LAkH8w1Gq+ZgBk1Gmc7ACALgx8OztnpNaqrtS/tQr82aOE8wS0iOWs3urIgelSMdnoZzrbNM55wkE
 PGUwPMvuNZgFK4CrgFmc6JgUbXOh/FYj8jAXouFJ6qpiNQJmTn+62GLHEUeigYf0NrsiRLzHWTwgaR
 kYdZWTUR/v8F2Ds7My3plKNVch1hGD7Ds9edD8ZcQDi1X0ojL6bC+FnUz5oONzHmOrtOG6lpe5gRZ6
 Xxq1bGwU6PmGnNuZcXzvmawj6mrDYkpP8fqtzAL7k6JHNYFOdHuEXfdV5RFxEtP4JpfUwkoYxJovhY
 iAeyNoGWHM9qEQQLMrBAWkyaUrXXCSwpSJsI1rMTBZwGJBWQJUh9ZpZ/OoH3qIcwwSSYiXtjHiE5SP
 e0UZPCQQfqVz9b84E8lWPROnJWCO9wi5qHKWnLgop4j9N0oUtGb3TQjCjh4DszMfcNLbEtz1FdhM7K
 3w7N24mXoOI6yEivuV6ISE0Uga096weNcygq/V+uiymo+DyGKludezTqHxVzkifkyFUKUr/K0w5W54
 F+IFVx2vpZubDRDsCR2bgDdTjYqnGdR1YzI5EmLJ/1dmMdCXdpSh5EOU8zlA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_064216_086933_12B770A4 
X-CRM114-Status: GOOD (  13.78  )
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
 .../bindings/sound/mediatek,mt8365-afe.yaml        | 136 +++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml
new file mode 100644
index 000000000000..d0759898b9c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml
@@ -0,0 +1,136 @@
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
+  mediatek,topckgen:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the mediatek topckgen controller
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - mediatek,topckgen
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
+            mediatek,topckgen = <&topckgen>;
+        };
+    };
+
+...

-- 
2.25.1


