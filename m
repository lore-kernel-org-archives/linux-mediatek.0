Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F49C25B10
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 17:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4TU43dOQH6UMfjQS6G859NG2HaMeSGxyH5T3QTnjRnY=; b=D1o8Mo0WJ4RGe1BtlAd+hC+wAy
	y6je12bnOvobqVUhaEkNZXWhjXjhcL5jeD5wcKJ2yxhJhnlkmFZZkNzHZqxWs/YEBlPQCTEMJDRuy
	az7nE/cyCNDCTtdoWHCaQ80bK9qRV0eiJcqdFGkh96SVWYx8SeagYJloPINBkEQzwXk9zdFc374iE
	drVMPWIv83r6f+MTmfUlk8rBqDMVLxyEF9C24VRU/Wly5XEUNgtIcRmRZn82Q+aI8DWgaGihr0McX
	8SRXr3sVJBvDndQjJqzYJ9+X9GJy/Iw9Mr+xQBt0u3b3KH4SOaBURJChLQJGhDVoG1NNdM9nhwgaH
	opgpfr0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0PIL-0000000DR5N-1WN8;
	Fri, 26 Apr 2024 17:23:33 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0PHY-0000000DQW3-1DZy
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Apr 2024 17:22:49 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a55b93f5540so320683966b.1
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Apr 2024 10:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714152160; x=1714756960; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4TU43dOQH6UMfjQS6G859NG2HaMeSGxyH5T3QTnjRnY=;
        b=CNj+WJS1e2iiwIs7XMbiYbXNxC6euvKOrUvMhrGGmkLVyPRmXAtKknyH5gb9oV5y8g
         fNCwjXx/Kt9Te22k3l6UUfGNYWneUGoeN+LsA77Kli9mZGRZFMXFOKWSW5ZqVQ0g96r2
         ZE2mOtt7DYvM37L433n70eYXAz3GjCSTUF9YTsw+umOgGc3oX8/Ei+/0L0rhCZEEN+B7
         EqV2HU2T1d3AkqdudrX0qO8IdSC2PQgLkb+Y0/ivcxXqzfh4DmBuv5DD7tleIuDc4wZF
         FiZO+Dz787NEjy3WN4CssdH8DNBLJy4Qj/v9rndadhZ9UZMotH2WPl1LqXdae2p+i48p
         20pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714152160; x=1714756960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TU43dOQH6UMfjQS6G859NG2HaMeSGxyH5T3QTnjRnY=;
        b=RDF5ddPlasSUGMmDJVBF+rv3qt/3H3t7bcv9h86g27QNCDA5t3Fjl6iEu7d5NQ+vES
         dWhyHZkcPhfaitN+xI1V/RZk+/xKHGBgpFOzdYDeDviKymdqqFSUs9vnjvgWAhtj/aN5
         tNcWGzTT6V08s7V5PrmyYP1wB/74/dUCMhvY5BLHanIcyn0sJxmCOg1TpANmtHqG5STX
         9pEenPHRP0T+t7nhSK7DsvxSP82j378derOt87FlmR2DHB7OA4wuhwa3NE94TKRc2K/6
         u+y/cAeU2dFPsjVqfRJJsA572J1dtHu2i1t5SWy89GGbRCknnWVLUvD3slUiV/Z2f85H
         IXow==
X-Forwarded-Encrypted: i=1; AJvYcCXggNigZfpchWIeuIpv+T1MWsHXdrfFloY0txlCkGPOigtdKF5spPV+yvw4/S85xBoBwqnA0FHM3VIH3IFGecOzwLiruuNYMWrNGLsygwvwPe5a
X-Gm-Message-State: AOJu0Yxu4+XqSPBdYXCggsBx/9xteBQqfqUNgWeQ2p2j6K4bdcLDzV4+
	JF09dSRhFr7jtFwtZe8U9UMjOlTfMLvOBB3yfMYvbHnmWIM1I8M26swmdtFsxeA=
X-Google-Smtp-Source: AGHT+IHcBmX2GHh34oFPQvGPIaePMc8392KtBItCgcwB4NvhhucWlDZ3EAw/bb4ovkR1+MLNq0adww==
X-Received: by 2002:a17:906:c288:b0:a58:7283:f587 with SMTP id r8-20020a170906c28800b00a587283f587mr2140675ejz.33.1714152159933;
        Fri, 26 Apr 2024 10:22:39 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ot15-20020a170906cccf00b00a5239720044sm10763363ejb.8.2024.04.26.10.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 10:22:39 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 26 Apr 2024 19:22:31 +0200
Subject: [PATCH v4 02/16] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add
 audio sound card document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v4-2-082b22186d4c@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3263; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=RfcGWh4J4Ru+vCmoaCssck50D44laU1fHfw1FIxcYyA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmK+LaS/TeL9lgDhsOUZkB6fGKdDfM1W9MWsbPfEMi
 JmdJbfKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZivi2gAKCRArRkmdfjHURUymEA
 CNNp4DesNUeM0GUuDt/1G0pbD4jz4uHrL7JeY0bqC+GS59MxGwPSYDsmHoHACfSv4Auy7Mr6AI/lCZ
 eeXcrfAg3jGsLq5nDOLFW2YyqcKs2qvOvG9RpMGF1E/wmT67od51GEjhsbpTb36vjAi0fxcm3BKCm+
 DpW18Cq1LhI9Y9ZU66I3WaBcrXlVHRnkEIZeB5yop2GKPBii9g335yPsuoh22bIBH0raZGWiSiqAwd
 hKwCfsgHJtLO5wzTELCojIwEEn4N06TOk5GNSaihM875N7w1zaVYNte+wgcnALZJdRDXkbHL9aeQ19
 zJ8793FsDW8jCjldeIdQO2LKbFejGNT7FUSJU3pKTZUh0M9pQjxi/9mk3OeBTVdCy1+fiauYHLWcwl
 xDZzjUtyxaykzBuf3jD1/VWlOGLa2gj6Ks5F7CzvMRM58kzZIgqlxPEG0+3hlaHXLSguDTThAfAxdb
 /JzwzQRxVhd4RyTRjGlFjWaati4BOFMtSpzeTn4wWF8y0xig/3+US5yuIVRD3c73+AxRGQ1dWmsXH1
 nRIIcapVKL3KCjh+OlxcOV5kON4yPMVq0Dm2sPXnyhlWYq8I5oBQ8pM9zMSDrRXbSpiw0XvKYR73M3
 FnWVbmFMca+bUJ5NXumQ/E9Edev7275CsD60sYOS7BYPnfZ/wvs1w8kOqAzg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_102244_624374_72588564 
X-CRM114-Status: GOOD (  13.17  )
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

Add soundcard bindings for the MT8365 SoC with the MT6357 audio codec.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../bindings/sound/mediatek,mt8365-mt6357.yaml     | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
new file mode 100644
index 000000000000..f68883da1bb8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8365-mt6357.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8365 ASoC sound card
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8365-mt6357
+
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: dmic
+      - const: miso_off
+      - const: miso_on
+      - const: mosi_off
+      - const: mosi_on
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT8365 ASoC platform.
+
+patternProperties:
+  "^dai-link-[0-9]+$":
+    type: object
+    description:
+      Container for dai-link level properties and CODEC sub-nodes.
+
+    properties:
+      codec:
+        type: object
+        description: Holds subnode which indicates codec dai.
+
+        properties:
+          sound-dai:
+            maxItems: 1
+            description: phandle of the codec DAI
+
+        additionalProperties: false
+
+      link-name:
+        description: Indicates dai-link name and PCM stream name
+        enum:
+          - I2S_IN_BE
+          - I2S_OUT_BE
+          - PCM1_BE
+          - PDM1_BE
+          - PDM2_BE
+          - PDM3_BE
+          - PDM4_BE
+          - SPDIF_IN_BE
+          - SPDIF_OUT_BE
+          - TDM_IN_BE
+          - TDM_OUT_BE
+
+      sound-dai:
+        maxItems: 1
+        description: phandle of the CPU DAI
+
+    required:
+      - link-name
+      - sound-dai
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - pinctrl-names
+  - mediatek,platform
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt8365-mt6357";
+        pinctrl-names = "default",
+                        "dmic",
+                        "miso_off",
+                        "miso_on",
+                        "mosi_off",
+                        "mosi_on";
+        pinctrl-0 = <&aud_default_pins>;
+        pinctrl-1 = <&aud_dmic_pins>;
+        pinctrl-2 = <&aud_miso_off_pins>;
+        pinctrl-3 = <&aud_miso_on_pins>;
+        pinctrl-4 = <&aud_mosi_off_pins>;
+        pinctrl-5 = <&aud_mosi_on_pins>;
+        mediatek,platform = <&afe>;
+
+        /* hdmi interface */
+        dai-link-0 {
+            link-name = "I2S_OUT_BE";
+            sound-dai = <&afe>;
+
+            codec {
+                sound-dai = <&it66121hdmitx>;
+            };
+        };
+    };

-- 
2.25.1


