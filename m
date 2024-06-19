Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718A0C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+Cj7XwFFzAC2R+vJ+C1jfJoPbZ6EO8weZS6/aNxaN8=; b=2sX4aCDrLO13AmagXT2XFMsSQH
	ZmtyukbAUzECfep66BlI7ufmxwii8jFbg8dTwGSaMPUhIEO/0YffEHYZhH3OjdaBQyX9tRzQ/gpKj
	rzaEBXoLU6dlFouLTVvL+OUhed96Laf/g/amUylrT9rA7LNhPh5x8blItqlzkjdEeoe/XDOxm+U5e
	rRJs+UsB+YlJdSQwaD1TR4559Z13H7M5kppcArFa3y645VJ5e4BNK0r6GfnPwo5e0W4IQ9IlpVBCJ
	dmi3+x4ETEFHnZ+mWicw6Gd8FpwuQ1fwqeq75aCg+jXnbu4v31eqKah3TUcSIB2JqOnIaCEznJAza
	aneUM01A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJxWv-00000001t3x-2Vkr;
	Wed, 19 Jun 2024 15:47:25 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwaH-00000001d0v-2nZ3
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Jun 2024 14:46:52 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-57cb9a370ddso7700066a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jun 2024 07:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718808407; x=1719413207; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+Cj7XwFFzAC2R+vJ+C1jfJoPbZ6EO8weZS6/aNxaN8=;
        b=Lg8gBos5iicVbgxLxzaCdX1ApIk6VWGPyoB15792GpfJ9Kppr8MHs1e6+EhyuexeXF
         slvWwljEpSqb9HTtCbaog1IdUj8+6iiSs5C9Y/ejmXwYyVJ6yqhSJEip/UMpOoKS61RC
         nM5344Ql0jL/Fw9lf9M6TdTbtBsDtOXeOlumgeEcLbTKzvFp8Nz6FhS1AGXxwE06NbSV
         Z+GKo2MxcNIYNPH9yBwBHNO8JcvpqC6Rl2dqpafiuv18f6EvA7HZTon34YFkJry3HIxK
         RBnvJckMn6g/YieyXKpLZCe/73RGxEyqHTYp0pSJQjTiJbxAJd42U6k8pKdeKpdGY26r
         nJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718808407; x=1719413207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+Cj7XwFFzAC2R+vJ+C1jfJoPbZ6EO8weZS6/aNxaN8=;
        b=Gk0QU+m99jgwhcLOQhlLP4Y7vGOd9ThS53tzorXEBg1kZ32B4iCTovf9HGIwjozuz/
         hWDkEJpJGvzaIB/9t0TApg18kMsUqLhew1eK992f4hTW3Ayd50biMUJqx59kwRgq/l5V
         IRCqks10Lqt9j27zQ+jZcPSmnw+DDe6FJyRyQERbfwCx/Cf/CsyAPOS6CImGxQDqXex1
         zQBtxzBX8g9ApIUbpIM2arGNP1GGSlMhZUIN/uUUuVghH45UGHiDna6MF4dR7dU6zNU0
         jOq9MZf2+1/xa0+xwy4uO4U1gbI53Re3g/HbpSWRw/TUUM4FE4TQXP5+FYiG9QqU3FgL
         fIVg==
X-Forwarded-Encrypted: i=1; AJvYcCVqzG7VDwykFpemIQRL4bJYqBVxlN1czwNZjHxY03/QH7F3iT3cOnb9PFgECDJ/aNuOc/+NJgz+iQlIIVImoHbsK9lkNKG8JmXnxhPzTNSxo2eQ
X-Gm-Message-State: AOJu0YzYlnQVjV5v7Q/6EHLXsjdBcGRex21vzBq7uHHXMD8ejkc2Uk8R
	vK5+HZdF34q8yM37BSGCkIgqpTQsMOmUZ2WD5yt6N3YeKk1E2pguJM4TxyeVsow=
X-Google-Smtp-Source: AGHT+IHcCmx7Ff8tzRoEcvYhXCGLLgXDhdg9nu2xhwYLgjSrSDM8l07iQA9nCSrJZspZpj+ivPtIBQ==
X-Received: by 2002:a17:907:d30e:b0:a6f:ad2c:af7 with SMTP id a640c23a62f3a-a6fad2c0b2emr133975466b.2.1718808407460;
        Wed, 19 Jun 2024 07:46:47 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a6f56da32c3sm679787566b.13.2024.06.19.07.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:46:47 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 19 Jun 2024 16:46:38 +0200
Subject: [PATCH v6 02/16] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add
 audio sound card document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v6-2-f754ec1a7634@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3413; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=7RiTz7/DbEcpnGh40/G/GiZJyYiXWSGAGW7k/Ludygk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmcu9Q9mYV/1gwD0pQWXgPg9ZCCRvxvauWGrJdzOCY
 y5vA3fmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZnLvUAAKCRArRkmdfjHURQSnD/
 94gbG0RfwOzk2vV/DQ2Mi4eaIlctK9Ci7QgWmylYBzMF0+zC2iwidba/XQrrgwSFmDuZURHpT1BIy7
 LVH98riHY/GqlWi5W8wX6Q3k+gleAi2QZMN3rX/M6kNVJo+mIqHHmAZih60nlBO/tE0ger7D99TRIL
 jiv9Ne2ogeBTfazyPGE+O4EsAXtV8Jd9k7zK3dnIfj8hu/10Ws8d+74N+Ju9KLSi7q+utZjrWMkrk4
 5LilLfcR9V+9ISirGv7VGX43Gc1bRm4F0+p8mdIrroIc0bYgph+zCEQkaApbofS9m2aAnGvBwwPfCa
 i+JvY69OA3yXVlyRpRb9s3LJnbm6F4sGVNLTZAGp26LC57lUo9VGOU98K+POtbebxtFE1iD6yp/dMs
 X2YIRBBtUvtJuGv6C2jmHa888JFy4oqgd3JTztsw2+PyIie/u/alyC5jDrfqCdjHwtuBnamjyVjCu9
 /YkcZ+9PqDIim1RpYWZ0SDA586Qs+CPPfRQuxfgbKa5EjR8HryaL6FpFL+lRkpuYGUVuGYGJaV51yF
 U6I4XwRqeZlsQpuV7B2GD8Zh+o0O9gBBDKwB0Qgeb+92mAaYR+H62ZUIZNIP08xqjIlq7YDSbcNJL3
 ZdsSeT5KhRcVCmEtIR4AB+MzztsprHemSgHEuXmkW1QESmP44XupmymOCpkQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_074649_850500_D7012B77 
X-CRM114-Status: GOOD (  13.25  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../bindings/sound/mediatek,mt8365-mt6357.yaml     | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
new file mode 100644
index 000000000000..ff9ebb63a05f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8365-mt6357.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8365 ASoC sound card
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


