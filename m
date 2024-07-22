Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AC6C3DA5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jul 2024 06:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+Cj7XwFFzAC2R+vJ+C1jfJoPbZ6EO8weZS6/aNxaN8=; b=PKRQRO7tlDhqpubBjA8FBQlOrx
	V2vJFdt3U+EvkFCWDbRjumCFMNnn8sk7EyD1X4247GiMalAkko0mXNjwap2WdjKDhUrKfPr4WtKry
	Y614cUvgpQuH49jVsp2xHUdSMaRkVFXxHlhx4BmJylm9Y6+JWSSy/Iux0OXw/Rten3OFxElAnWm8/
	vjkn7LDeryHH9Sh0FmFq6kTx8QeYomEpLWgAiXJCBn/kRnJevsFDJEBMdWVNixZbXynbBUPKZ+AL5
	TfDL7j6EUhetOduDGer8Kbm8w5bx6INn5vchMukGkcggtJcNAr1DHfAdd/Xb5bzrgV15iRvB204UV
	pJkigBYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVmwu-00000008asd-0IsQ;
	Mon, 22 Jul 2024 06:55:08 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVmvW-00000008a97-2QHZ
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Jul 2024 06:53:44 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5a1f9bc80e3so1285527a12.2
        for <linux-mediatek@lists.infradead.org>; Sun, 21 Jul 2024 23:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721631220; x=1722236020; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+Cj7XwFFzAC2R+vJ+C1jfJoPbZ6EO8weZS6/aNxaN8=;
        b=sdjddGVWDlCznWWeNvYbj0vdKR4NNOfo5dKrpOmOGGhp25o7zMfTUBjOf7w+Po2pI8
         tU6F8rWizsSuEturbDHuLOBkL0+MMC3eMe+ECpVhEXvd+62DnKZV1occ0DgnJ4pmmOXC
         lDxy6Ni4xxY+FK8SP7Tio9H5/f+ntEZ+EwtdOBC5MsbYwlmGOMEM+BwY2zqEyXaQG3oZ
         fwaNeNKOGFwbo90b9gjcSekoN2Xk2hRsI8DYkMoghVfGWLqmypglksfwQrcJ3wICl4NC
         ig+JqXfRkfs2nfvndyhvD3+axDs5rpOYWOqI/aUZy2dkecncSa3yVVvqFn4YgOLpt8Xb
         ivqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721631220; x=1722236020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+Cj7XwFFzAC2R+vJ+C1jfJoPbZ6EO8weZS6/aNxaN8=;
        b=OqwCqo77tnXu4EVfFDvzprv47MnYcaTB2BmI4mM5EQ7+uaLeNedd8yYnuvwOQNVYqw
         M1qHjL3V1/eI4tawR28+WLgF/ky9fuaQ/e2XVdUB7ySbDWFPrWdQFdryl3SzNTMW6uDE
         jdje0x/7LBdExS+nG7z8sOO1Bbe/uQ2G4CO29t36njp6ZXdqi+m4fHZP6DDuvr2k0U8J
         /1ZrBZpbg9E00TeWHu6mgDDe2eUc5QDwK2bIKQa2aLXz/h95Wv/SqjEtKLwct1KzBcJB
         8Tsw74dj9WDjQ0A/glEeDhi8tZz8PpfL4Z8h2usi9JZQtyf/bktXWU1LCHTWEtsNDUng
         fhIg==
X-Forwarded-Encrypted: i=1; AJvYcCVavqOxm7KfZ3IElCfEyr011mmXXZWG9bdkBBWWjW9rr1/4KreDv9Z61M0niLZsMPzDMl0aor8t6pW3ZUAO+VtBsMkJrH/4bNGmcAB7X0vNaa6P
X-Gm-Message-State: AOJu0YwtkUfkEtgR4+JpIMY6J/hWXomsdgKgq6KtLFCfHBct5sXw4iuc
	uu6lUYN/D2zbRHGhG4GLgEShl1DPOrw++UOfHCY3f0nnMpHtIbPH/VM6IUnk1nc=
X-Google-Smtp-Source: AGHT+IHUPUZEPf4MkuXpuZ1eBdP2F87Pg9/UOsRP7bwjnKX895Rnp97yYU72I9lpPkf7L+Ns9p//8A==
X-Received: by 2002:a05:6402:1d4c:b0:5a2:4558:d17c with SMTP id 4fb4d7f45d1cf-5a478b65d96mr5616343a12.4.1721631220529;
        Sun, 21 Jul 2024 23:53:40 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5a69c1f56a0sm1982126a12.64.2024.07.21.23.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 23:53:40 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 22 Jul 2024 08:53:31 +0200
Subject: [PATCH v7 02/16] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add
 audio sound card document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v7-2-6518d953a141@baylibre.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
In-Reply-To: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmngHwXd0xvDpLVp0CSV+q14Gvkt2Efi6arTJxAw3p
 IJGl4OGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZp4B8AAKCRArRkmdfjHURYIBD/
 4r2AhbZX+WCAyw7/UINA2YuXQ2ixUIY8ECPOeuc/Y10XhRSWTI4ohbrcxZEFA8E9j7J9NEoH8cwwzq
 6JlDHxqVGQp1k/Lh4ov9LLrknjvPU9uRFz3j3A/nEE5Ffm6eBQN2rFd4UdR6uZIm6WHYNmgFAg/TNl
 etNmpFgoBPJGaB2haSczJ1fsuyf4IvER2DehMRZxj6gtIq/bwdfffyyt9NGHwHHuZVTMlyrzH8D0YW
 kKp6ZL07eWqLFBe8SCubj4TqSPNWcA71GuXiFPA6GVeVpxcsFSDTnzTISdFj7X+LKUai+X4wo/iLQp
 yspBo/Ogo+ccwbKrIY035Wa8VTzrYE+/wEFHBr2PUxfYYuaj5C7Ze+VhWEFtRVjKp/MVe8FYQkFgRv
 lb+LT7D0xw7Ns3lUxJcOFNAMW+xf2o5UCF3XIH8VMWqoNSk1zhfeeN5JJznWlo9O0H23JodqdoMYHt
 cY+T6UjM8fc3vyCYVeZbpp2zOVESoMJnq3hNYxu1Ulhvu/9SkMnVUX+cpoBGWiQjIPME4QBPr6aion
 m1HrwlT1L67suGAkAupoMTqLWhP+fbmTjWwdpWxGlud0Z+gBIdYTudf93RpUr3LtjYEuw5o+F/XLe+
 y/Iftno3bvJeVhXlPr9a4Tw4sZPOSitH5nDK2vQjz3tJYCMKK2nRCRMNipPw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_235342_659622_06330069 
X-CRM114-Status: GOOD (  13.12  )
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


