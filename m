Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0A1CD129A
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 11:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vstY9Zznkfygwg0NsHtg7aqDXceNRwx7wPOtr1MNxN0=; b=wwqN9j/L3WtBTcKI4lThTsreQp
	k6zEbMRbzow5hn9X1EHdXZ9HkUJuzgsLZQgvEqbb2K3JaSvbtlvQXB6CMIl8MQ+5MH+fNlFSE5FOX
	5N65aTwa6HrQGLNlQZqTF2utIJj3Hc2FZSa9IaCBIoy4DmiMSkfXCUoqXjFdKYZoW9JGG7WLSQy0a
	uATA+NBzQNTCqzVgE6MEybgVy7m+Euq+z72uGJQA2tJBW4PHOmOgIQOJzUnehJTo2JdvvCoB0BtwF
	rp7Z6ROx+dufEyF1wqoetJZdjmxGUKxQNZrO4RcHvjLhVWoX0uqHA9rhoQe5RR6MkLi9NytElJD5M
	+srk96sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9TL-00000001cHz-2Vyj;
	Tue, 09 Apr 2024 11:17:03 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8U9-00000001NSm-2cX9
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 10:13:53 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-416920b1a2aso8985555e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 03:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657622; x=1713262422; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vstY9Zznkfygwg0NsHtg7aqDXceNRwx7wPOtr1MNxN0=;
        b=Dl/TZQNewwPKnFifr2QjD2bEw/hC/XscZE5MEwPdoo4DyrwyQ/gTTaVcsrlPb3VhNP
         FkpMN0jEXZ+1cW7PprYw5l27J8QBSSlSaeKSEsSSSOFjc47R886a0lD2i3zsuX+pmCf3
         iNycUwK2tygz9OjS1WrfM0R8PBIFpd82Op5Y3zduQn+IvMiZeE49v/x+FMIlBFI1wiij
         levJCIqBs36QWZzmzB9wO/1SWJ0NBfE2p/LcQolDbW3DupH+3A7d4PvFUqtMgmeGQ3MG
         JON0PXbYI2rtXKczOXfT3yCDKVOqjKkmmLHVpDQ8N4vU9VbFK7O/Hlyhx3hZ46QvKy5P
         Bzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712657622; x=1713262422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vstY9Zznkfygwg0NsHtg7aqDXceNRwx7wPOtr1MNxN0=;
        b=wJg9tdFa/GmmO5M7mM+UUObw9nCp6eQ7R1vY4eIpZxjHlZVQ/JUh6vHPtu9wzdeXSb
         vmh7KzdiM6+NgN9yDu67V9sulN3BILhu894/2MCUpYrFsHDHvmR1wXfbciToamTCySes
         SyOo5gGt+REBqSX5Tcuo0rpPjknTb13MBaMDtyB9dwa/f0dt16Fxjxmur5S6rMwtuoUS
         Pb12RgI+jmMyBStD7JjuGBt9bO93FY3ruYi5GgUYmcLyRVKxngWFCMSlvdgUgw5NMIKh
         +mCB1hHJ4Y7dJ7UkSp4RZS5cxVWjfigM+wXyLq4ivWkUxlYnELnjSRkNZt+UhmKZFn18
         KkCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW358xphnATXk8hWL/fRT4QE7WZ6AR2X0Eo2hKhAdqTR0Id5oELRW3lNWduFE22xxHP9Bo+1ufgJAFG79mcfN1bJjT7f3lsvLmvel+7J6t3aBT2
X-Gm-Message-State: AOJu0YyUTOyyy2kZhL+UMaCf2pOFpZVkaVwdw5jou4fmPQbuFRpIS7RG
	AgsRgMyf9fXyKGr4SCCbu4gIWqpaaOys4+jGZSNdpub1KKTTGzaNojSd+9uwOD0=
X-Google-Smtp-Source: AGHT+IHqrZDTpg9fb5GQH0DhI4jx2HY2qdWx0GVAnjcLi1UXF9vEhHArn9ciUPZ9dzVCo8vSXIPiog==
X-Received: by 2002:a05:600c:3509:b0:414:6a1b:819 with SMTP id h9-20020a05600c350900b004146a1b0819mr7911487wmq.13.1712657622311;
        Tue, 09 Apr 2024 03:13:42 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 03:13:41 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:22 +0200
Subject: [PATCH v2 01/18] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio
 afe document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v2-1-3043d483de0d@baylibre.com>
References: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
In-Reply-To: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTT1RZ83NnSZXFR+xtetcg3ocLkN87pn3rt8lvM
 Bw3SBMeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURU8cD/
 9+eYbJh7Z1C/HPcwCIRFa4iJqRud2TZmORRiL5znL6VLbAcmasJM5woFlHIBVSYTfVeRBojFBXQYVu
 KvPJokhiDYNFgPKkVxN4VssP/Ie4lZv/MuySDZWV1vYxpmASA8aAG7JTxxrI2HcBDZroWSEDqtefqc
 MNLvOY6UtAgII7YRXchKGhnNNkAt4FdkNS/i4Z/Whs6p8v49GGUscdm3rkJBmswDqiWF+zGWdTr8fg
 Ai36j4e8dnCaNGujXh4Zyh8mUfZccYvDlc8vGB5XLnh3MV1nXS6pExc1K6ef4HA9oonfv9YwbcT+B7
 H+Z8P+EXmPHzJ7huHtpZ2Ef4Ua6Bu3nt/paAJptBl/Jzc/iCG5yk+hD5JrCS+rYUznWJbfXsbikfiN
 zgOaX8vPMP4k2A8RJUH8uqa3lR3kEUWnzq3xWPPdoEpV5Z8lSBx1uOPh/m8mFSt9MJjRgpFT0POGOp
 mO+0W39uoIpKYhgmeF+BTOO+iCHAkeyVfTfw8Kr57K0JMlHL/BvT70N+C/waciP3FNR+kTZkZl/1Hg
 s77OelmvsvaxF/Jlwd7TRDjl143YApZO4wCThKelYcQxoeJJrvCbH5AGY0tBrK0Z6XbsSMg3tzvpOK
 zfNN7s6B6lj1WhLc1Gkr182cNsggrj1Fnd0dlmMdfqqdVrQ7MLN++zk1wyLg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_031349_799550_71D62B1F 
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


