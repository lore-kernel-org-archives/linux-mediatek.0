Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D87FC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 17:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I46Ibjxmnn5yy081gSXZ9cudlQC/VlKWW3WhTJhSrbw=; b=oQDPhrPt434nuiqSz+yEN5zcsz
	Fru/BxFrNl2txn2toPB+fgNFFaPJ6J8nmX9Jwsl8kdxpFPj1Gqjat0qr5pf1YQFw+fTBJV50k9Nqy
	DOF2doUlXCevXF8TM0xV0gus4hEY86kV1YG7Dk/IUADnlCEKWnyOyVM0cIgKM2wougGOFWEQOqjLd
	Wtm/DrkMifecpYJtUKc/NHYIhgM+gn6BIs1QKE+R8e33NNU/jDrMbbQHST+QASEMltvXTqZfjbkGG
	bLBpsV2b0m5BE+zDTCnrKBehTpLjzJVzRiFV4jfsnktb55XlcJYfKjMH9i1+lZyeA2d3Ar9tCA/8Q
	CH137TLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0PI9-0000000DQxw-3x8o;
	Fri, 26 Apr 2024 17:23:21 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0PHY-0000000DQVO-1BKQ
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Apr 2024 17:22:48 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a55b3d57277so302189466b.2
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Apr 2024 10:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714152158; x=1714756958; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I46Ibjxmnn5yy081gSXZ9cudlQC/VlKWW3WhTJhSrbw=;
        b=ARLmXLITXsU/Z8lPfEeaJglI4f0QCl5tNRhwXqNhUtsa5HCYcjMHIX3A+Or09HC/uF
         ViM7HC2nqm2gzxePPUNImUjtDi/jJjMfUhWmb14TLBb0mhM1vLhX3g8fweVtYxMFKIpj
         MiYLx5TybzSvJEzKQUJl77wCj7JGMGyNmhmN0hgBvILiZwlBWDaPsx+1jUjMCnAiiRmq
         VZAt11Fpp2i47beqzzIY1J+7uH8lTRYOG1VFiyvb7gN4e1jFy56o+0A3j2fo95jwhBkv
         0KZRWLFbzVtqdJB7GW/dP5zBO3xGr+PuoWzKONEuH9nX5KE0IDLtnCWvu/ZH1d77gFBN
         YZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714152158; x=1714756958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I46Ibjxmnn5yy081gSXZ9cudlQC/VlKWW3WhTJhSrbw=;
        b=Ag1hXCRokEKfU9BzfNp69CKS9yIQIxsuV+7uoBCPuP7QaeUkqRrooJ1yAwar2UXp7N
         R3A0c4u23ncLygeSIjKWLcrPJj6uMq4l86k1WQCLLkpkyfzrXTONQ36GTylRREclKdH1
         uyfbh74gAQvAc7gmCA/oJhhhh1hpuzi/p1i1RM/wdd4xKEvZgooNOaCqDs3PxgfAqUaK
         EGhn0bk5DBHtFU3okIpLXp/0CEI8m+3ZTPu/odSd9/ba/Y67OKPAg+fAH+zAjoB6CUhp
         pgGzp+M97CPx5cCmuzjpn+Ap0KfxOjGwNElogwkHQGvIm5rBCI+Uz/Wyb0FAQy1wTyEx
         74UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCwaXd+WpPziqx6fkaPeHe4QowHiFP81MwqByNi4741F0eg7xyQESFxJdk9dUVPxfHIOYOaV42Z+flTVWv3o6WWVNPMSpEKa2bqB3F+mLVnTZZ
X-Gm-Message-State: AOJu0YwSOSgYPFp8amqDgUB529iyPIReE8tvUcUZrSFWimc+brKnAOcz
	SmC/CKmmYtOyERqfLjVf6Skplq0KDo3AwUBzOpnnDEpF4GSQ80PUY4g2TI6qnVE=
X-Google-Smtp-Source: AGHT+IGUaKJ2bisa2YXm3HzCKI+QdDP+ZC4VvfOSJA6Lakp7bBabcfb0LXePJJPgP2PFAKWrz8G/yA==
X-Received: by 2002:a17:906:6899:b0:a58:dcc3:f4b0 with SMTP id n25-20020a170906689900b00a58dcc3f4b0mr580280ejr.61.1714152158342;
        Fri, 26 Apr 2024 10:22:38 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ot15-20020a170906cccf00b00a5239720044sm10763363ejb.8.2024.04.26.10.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 10:22:37 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 26 Apr 2024 19:22:30 +0200
Subject: [PATCH v4 01/16] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio
 afe document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v4-1-082b22186d4c@baylibre.com>
References: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
In-Reply-To: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
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
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4568; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=XK/yaNy7n8mlOsrCzgcSHm0w5LeFndFZXd+EBLOo2Z0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmK+LaW9P90pKeXd7l0uFbxmJvFZ+dwyCWlzTbC45l
 x0lgcF6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZivi2gAKCRArRkmdfjHURVvVD/
 4jEt2v5XKDN/IjGKFFuvIq6pNGahsS7ZaCjB/2lN8OHrRy2UjymVNP3DyzTCvPidzuU8W70lRgMc9C
 yzaalBkExgjofRIrsj68u/deILcEPJPdsTDI/zvxVa5gJwniDWdvbQI1nt+2nP+OsNDm4Z+0LHkHrh
 DJxwDRXbVfajNT99ZCUGvU/pwvv4NYQjzbZFOlSpcwqJpaQ6dA19Q1GtjVBF/UYBgM7tilY6qMpshZ
 NqnoNktnCWyjP7o3wiq0HEAuxdf497NnfUtm6L7vEO9hPmfVCShMlbUGGiK/m99rVcbhlsksRRgAV1
 i+lrUcB6gVXT1ZEuJTRvZWmSr8Fs5YnAZHJyHysRsGrOAjSZWTv53rfUDs4e9H7XxOiGEcaLx8uiEB
 xQBsREGu8uiffWcapfGZuP3ex17ptsLSqgTMgXfFCakTPXK2XciSh4AwUMMgbAgqQeVgQstL0bv+Dp
 1/QOs47jAwCSHx6BUb4xXxdjGZyMRoPaWzf8rmNgzd2hs4pH6kYyE7sqEpAHqYfnFZS/vTn/158G1H
 W/AZhb9UmDgrAxwrFbCGwtz781w2XI32H5tdVpG2KJPmv6v2tmk2hnLU7+Ah8WWfIZiUqWT9DyLvth
 RqBSA+8CCZIew6/xjw6F+xmAWJsbojdBIh86RPIYlZBr/Vp/ufiri5OU3y6Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_102244_563185_CFBEC2F2 
X-CRM114-Status: GOOD (  13.15  )
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


