Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A26CD1296
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 13:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGt34+sJLdk3MLx6big+T+CAqaWtPyYycofqseF0Aok=; b=OeezkO3XeENPgwt+ssyz6oh5ol
	lSE4B8EYIfvYtZBN+vpnh2KQ9MzmeoG2F2+QVEdlgQ8XB3pIezcejBjCv/ww0tvI2DoJTRc1OnlkX
	19WjLmZ4XaZkY269KuSi5fg3B00zIZposTXGncuNYUfld+OrqtsTlqfeD5ytQpCm0TDmHVbojERLz
	Z/X2FvABEEkeGDpArubShLQ3bEm9q/KHqaWFiV5CfRN9XKkJZLNe3k4RfRvgUWvQz9pvaej0ov5y6
	bZ97fyggKWha2VPkGAgJYjT59vl+dsDFAl+x0IoqhkrrAYYkthbf2Ddt3lwcgb41tLfEnoot2Np13
	FRRH2rcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBkY-00000002Cdc-45YF;
	Tue, 09 Apr 2024 13:42:58 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBjp-00000002CDw-3zLU
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 13:42:25 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-34175878e3cso4092611f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 06:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712670129; x=1713274929; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGt34+sJLdk3MLx6big+T+CAqaWtPyYycofqseF0Aok=;
        b=aEOF/Sdwyup8SkVlgEOtSVq817cNM0XJczKllioxRJ49ur/bJGmV5AeX2ZD8dmbqHz
         eX90FphQqFPdvGXFGkXIS0Sua1YkTkl3SercTGAsXDIBvxgg510c0Jv6wJBTw2c+METr
         Kd8snyW312oBouw9nvlN5/Nx+LuBwXJuqIrCUURPPxRyI5Ujr4Jxp0CiJfya1346TsiI
         z384M4f7y4hKgv3690AkTD2SoN0MmEfAj9a9zHbpB0viNyezRy4VawjQ1gcISiD1W1i4
         8Y5L6mzdbtM2SP5BHBLCSDbRU07x0MmJKYFu6ufclOIelrJgLcORCaNJHJA5iQGmRgQr
         h/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712670129; x=1713274929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGt34+sJLdk3MLx6big+T+CAqaWtPyYycofqseF0Aok=;
        b=quOj3azsHxHye4iYqTHgBNAzXLt+e0dIiFk3qjfKAox+QKqcto0naNSewZYg4bJA0o
         XHUlguI8xYVGMvu4rnhs8XZtrzrB5sz9F49wOkUb71rG5VQjm6EjdBQfKZX5ZalWJFLb
         JSQFb6geuQaGRPK676r9n6Si074VgfhloXFjM95q4baZ/2RdIFcC9AVmzoRjqJQO6ItH
         p8snS2MH2QSh065CV6qsvo2nGQ/TPWWCjzfjSC3ATeyKWJxsRz1RqFaKR83vgh5Ww+Eo
         Z6XA/GV9EPXxKpnZAAjrM1gHgYBDR32QEKQ2rcYERQW3qf++yG4sn0qv8TJIIWCmUsBX
         4bAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEDD/dk+mnsqjmKj+YCzA2vc+AyPv+IxKG6zLJmOaB3cqUQ/LtljdzN+67Og4ZJTLf51xS7mOzYfjDzz7MvJX3HZv7eTfnKepUBjy+47AQQiHL
X-Gm-Message-State: AOJu0YzRsuut3bGLlgdyhBqf89J4+Vm05XzNYsx3GkfBQ2Z8AuX2aO1p
	SXbAedl8IWknxGPncRkhcJisP2LQczELZkpc0/GEmyuObe9DX8yj5UsKMwxz70Y=
X-Google-Smtp-Source: AGHT+IHs+PVJes9bcU5J+hkjaytIEisTo/t9yMkWk6trmZIfpsRZXqQx9bQrZmBp9veYPw3+BYfK+w==
X-Received: by 2002:adf:e802:0:b0:33d:fb3:9021 with SMTP id o2-20020adfe802000000b0033d0fb39021mr7947332wrm.54.1712670129306;
        Tue, 09 Apr 2024 06:42:09 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j11-20020adff54b000000b003433bf6651dsm10753579wrp.75.2024.04.09.06.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 06:42:08 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 15:42:00 +0200
Subject: [PATCH v3 02/18] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add
 audio sound card document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v3-2-16bb2c974c55@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3125; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=bcex9J3pUiKsSDmYMrLdaDcykBaj5YDYBra4ZvFBZJo=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFUWsk5RNDHaaRzybw5abcV5vneXW5vP8Vm6SQhmY
 0Md7TsaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhVFrAAKCRArRkmdfjHURR2zD/
 9KNc4raiGk9xEnimPxYM2FegfDoBhRKHwIpxu8KF1g1GPWr+l5FFDRfIHQfZXB8Ot+wawVk7PSSlaM
 4pyNeUkltjPieiUonFHchDVseFFwJpX0UDgw2+IfosUkM4NlPdhpb9FhGaO6TlOf9rUVhJ0c8klDTy
 O4N3ZFgDsVufRwZX3ENmrao8VNuxZWn26KM5bJRscJh+K5AGRszPfo/qCWNZXjbVaFPBDyLxo7luj4
 7JVdtsY/2RGmNPbrK9ohyDF7bzI54u5tHi2vn6cqYY79YQk9OkxgR+gzQhUKw9NkVoSzrsdUjqjflc
 6EGZnw1xfAuZUoDf/VypXBwRP45T0H584H4iU4aVO3VJUz1XHV+kM/5GBR8cvoaAbYDzaI0pt7m0AV
 kc7bUqhGcg8mEawUzz1n0Ru3A5ND6NbfD8URPAAxbrwxMGn5DJvI3cktuDutx9qdRWTNb4V07j+Cz3
 Dx2ReCOH3j9HlP0W55LVvhIKVmxwjE+hIdaHq04uyG5tldw5sjVyhJvUxk7GsBPar04VfUdvrx5hUh
 cYxVhmfbMvicDTADR0JXa1L+MyjsoLZMk/CR8nBfC41xK0a6gYVFeCgQCwLHVlme8O0niJDTfzI/VR
 ebzFyQyVU+mmBRXoMqA3Zu9x4j/f7ATZhcRXhMTZZQEouCyW6g8cAggL11CA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_064216_115754_D8CDA663 
X-CRM114-Status: GOOD (  14.40  )
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
 .../bindings/sound/mediatek,mt8365-mt6357.yaml     | 99 ++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
new file mode 100644
index 000000000000..831c5b4665b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
@@ -0,0 +1,99 @@
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
+        description:
+          This property corresponds to the name of the BE dai-link to which
+          we are going to update parameters in this node.
+        items:
+          const: 2ND_I2S_BE
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
+            link-name = "2ND_I2S_BE";
+            sound-dai = <&afe>;
+
+            codec {
+                sound-dai = <&it66121hdmitx>;
+            };
+        };
+    };

-- 
2.25.1


