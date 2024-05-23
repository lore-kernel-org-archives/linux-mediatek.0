Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D060C25B75
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 08:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wcqbhlzk69tSoPzbWxkhR+N5g5aDso2+zkY/xdikbcA=; b=TWQsEoO6bg6cY4qmIqTCxNBk0o
	C2YJ6T2OXEG0CnBcg/SYAs5oiujX4kYfn7N2DnR/dDyS3841iI6EJndqZZ02eczszCCvORsOH1O+s
	jrnjMBU6TUUDDEXZUIwNI/HtStSv/mLxw9S2y8M80DWIENsJLXBIYP6mq9YVoQxhMg1/NI9SxpjNz
	TGoeVYKggKvjoMzI0ExoJkISFAzIuNyrwu+tFXinUUMK+29IYDFocv9YF/wjc1L9CngI5SGbqkasb
	pP0aQH453m1eSvbAhI8WBsxJVTncvTk8g0jfkwm2+3YbGiMcX3qbylt7X+EiE9Idy9RHyOJxLIeLL
	tuLiAlcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA42Q-00000005X55-33Cy;
	Thu, 23 May 2024 08:43:02 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA42B-00000005WtP-1dgk
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 08:42:49 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2e1fa1f1d9bso102372531fa.0
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 01:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716453764; x=1717058564; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wcqbhlzk69tSoPzbWxkhR+N5g5aDso2+zkY/xdikbcA=;
        b=ovmagWB81h8zf9Iw1zQ4/fHLZQAO2LF5qgo8HE3dB8CB4NX4O3+vD9I+txKcPmFgvf
         SFbUZ2goHOzlmL1eDUpkxugz9/PAfRnrFnaNDN67fqMI+JpmwLgMuGXqcIMagCZgGLfU
         G2xA20+aQomwa5aTJLVPWWTZ9SaKNolyEl4wo1tk406Nk0LWvl0rZaEfrIps1605zDJ5
         gTfP6j1eou1hEyVIVoOwjpVKKVP/p624dTbYT1QLClMZcQL/YzSqJzOPp96MC3J/lnrS
         fDlQmF4eWVGfVVqHTx/f8b0eQ6RQ3HJWxP/wHcbDZSAyzFQufNYHppXVKyr1BtCPJmHd
         DlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716453764; x=1717058564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wcqbhlzk69tSoPzbWxkhR+N5g5aDso2+zkY/xdikbcA=;
        b=vPl+RmRZJ1UfUJQdq8aD+XhA4OAltQxZgH5WTyui7BIrf3p/fs3iox2Ka8xN03redV
         9C/NvH9q84HAZ0igVhhdh6NA7qy3/tPQU84Okqea24MI0YsvrQ5FeydMtRBMiUy5HwHZ
         8A9Ny+g9DiMQKqXJOox8fHIB5QQuMdnCOR31IjLhCR7aWO8l6E+qi2WL/TS220j7ClUx
         7lfTE6dOqU6Y//pbZ2/YAbju/IPIY5CikyeXb/M02KON5wMahP9L+tskSoj+15x63j/P
         CY+FylNpDUMmdkiNFdo4U1AtTnFMlwDw2u8tjXFSC31aw33ywL7BcOM4l3+q5dLcSroV
         t0ew==
X-Forwarded-Encrypted: i=1; AJvYcCV37CxAZ186iiWphQKKxpkefA7toEbOLM8rLzNWEDjY1d6KCekBQf0Tm1GWF/kZ+NLTOlFZmbtZhReoDfeQwYzOJ4s3a9RIWKtl9s9Ngg2Nagcq
X-Gm-Message-State: AOJu0YyW23DMlyFqQTGlt+lN3g18Vjkp7e8c+qKz//ZtN6ymdeibnAxK
	qBMjYVRAafmjTo0JgB5xwHnzmhLKNhT50WR1KZeGdIRNuFV73LiH+7kO8ci65K0=
X-Google-Smtp-Source: AGHT+IEF/TTFTiR8UOUieBnUMUsXefV3/YfLojRO+um6UtDO0dolyj55eyvbEErNS+I+XuekyqRGOA==
X-Received: by 2002:a2e:87d4:0:b0:2e6:cbe9:db03 with SMTP id 38308e7fff4ca-2e949467182mr33408181fa.19.1716453764511;
        Thu, 23 May 2024 01:42:44 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42100f3e03asm18556645e9.17.2024.05.23.01.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 01:42:44 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 10:42:31 +0200
Subject: [PATCH v5 02/16] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add
 audio sound card document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-2-e7e2569df481@baylibre.com>
References: <20240226-audio-i350-v5-0-e7e2569df481@baylibre.com>
In-Reply-To: <20240226-audio-i350-v5-0-e7e2569df481@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3330; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=cKEFvnur0r9wK70qRsiyMlYMUWCy0Z2MhPoP9t2s+R8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTwF/7MDnaVUkfVFGkCqmjiZZKFGhUKoPOo7uUr9J
 5+gLSCOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk8BfwAKCRArRkmdfjHURZB7EA
 DF+VAzrCNU4SA1jP5OoT93Ob2M6JWQsrtCMl6dfh99+00v8/WFqKoF9X2a9OMftw+B5WF/nfgK6ScX
 hAZEEGqYtytopg9fg6+pd6g1L8ddwHyheJG5Ld6DlXP4shdFhR33lqLI+x11mwPfdSwBkg1etvXcDd
 b6aaE4z5jQFm2imwg+OaSOjYcHNs7gDK7R1oIcGYCYYIlK7IzBlNsxCV1JoUu0rf1xF2/VIDsaNtO9
 pwHOVgRuVrMoVTuC23oavB7agQg5kwsEupJHCGU/2z5tbOYvazAtTNAzohmXWMe9Qa67o9wRbj50kJ
 fhu0gAbTwHIuN6tjJdHY/i51GaQa37McjR8SUHhQN0ngmpu+B1bcpC4Lgzf9y/ZFMtEDoPYxvuw68S
 FyAHIH1zOH9t/ACHjyCrIbtyOTJICgx6UjLiosvtanxQjLuOEly8wVDY0cn6UlrxIoCb58GNpdOuZo
 +EL30aDE5zxG/Pjor5LMj3+cYll7s4epePNLwyu0f8EUSHDxFHl/vgzNCjFXgsqUVnHBxUrdGnKhLO
 YHR1l2j+hBdaW2on0UCqngf1Jiu0DxVpi8B8hQgSOaT5v+8EwU19PZYpIomLjoFB6IjVSdEPASV3V1
 B9LiiPXM0xIHI1S1yWLl4/aYF5baP88XgARVIfPeHsty9idELtpALs/4HymA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_014247_519498_A804EED3 
X-CRM114-Status: GOOD (  12.95  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


