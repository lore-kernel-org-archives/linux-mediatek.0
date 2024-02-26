Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F449C48BF6
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 14:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJrWsRR3ts/FqJ8eyXIf3fjxmrfS3S4Qmfe209Uxc5s=; b=4ZOIB+jN4uoKwFnSx3kcNaVdVH
	0Xl/MGpwd0Pv2Dy1btbc2Hrwyu1dJyv6MZF9q2ilnIZAoZg13QWTwLVNHo9f+qSwG0oxGBEq6jsxp
	SevHe/M3iSmR5zJbmT5aJElWLmhJNZUN6Y/CYC12IKeQyYZjclfn0uQr9R8evRGSibiAxru3u6OcB
	jm/l7kO7AviIHzqjL5uw2Tcr+hHGqQQ3TawNsfKhJrabrw7t7QiyNFcHCvcfXfL95VTGOSBDw07l0
	NVOQQw4oT/85YwqV77hu2URIAJ/Ofi24eb8HtrCyu1p1CbMFmE5342MlObY/M0w4xcG18RFC/8GuO
	MVkNdh7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebaX-00000000zSa-3pqe;
	Mon, 26 Feb 2024 14:04:13 +0000
Received: from mail-lj1-f170.google.com ([209.85.208.170])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebYc-00000000ySI-0bVW
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Feb 2024 14:02:32 +0000
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d23a22233fso30419181fa.2
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 06:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956130; x=1709560930; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJrWsRR3ts/FqJ8eyXIf3fjxmrfS3S4Qmfe209Uxc5s=;
        b=iXFDfXQqMhkCzMntrn6MNp1+HrOpSuybqM6QWWm/R6fzjoMOBxqn44wEHpEvKenBxq
         VQPFC/jrMsPE56JWs53qvowR82ooZootxjDs6Si6huQhr7Fbvg8OVo6j9SNsNfvcZJrk
         TLUZE/mEL8xx6Y0NYVFgH8Jydc14jP1Q+GV424fBspcT2/gMfwlrKA1B8GLGD2pdaHP6
         BBxxgHiDm5DMK/jjePQTiXhAxwLblQCqb8OZwi+E918wnXs05/cSoDxrOJAAXgaXlO6+
         Lp9O28sO8M4fVBGjVwe9uBBrCEabKLN3ldsfrP0VK+6CPEctpYTpXsWFmEGbkdlhm78j
         H5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708956130; x=1709560930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJrWsRR3ts/FqJ8eyXIf3fjxmrfS3S4Qmfe209Uxc5s=;
        b=j1PXDiwMwAZD7I6UUdad88cojGYPD9eqlMRWNsDajbnlhHNvW+EMnEDjRxOEnMk8AZ
         Ys29zukJFZjZNSSjD9P8OInORlLIGZtd9C8qAi2dJnZMjmLpLp8bYiYm8af7xP+ZxEnI
         3BlAMScofXA4b3omUa0BFnuIYmpBtSMSssfx+mwyNzye5BMCTr8vFVj/XO3pEqzBWCs0
         WKxJ9BDjLLO8u3nfIb74MgF0TI2hTr4mAYVWfAo2F82LLivDbZtUXZorfPM4EcVdPTYM
         SU0Ai2wlrpsULwb2u3bsrLlZq40hM0zKR3uWHGN8fvymdR2LCnPy1kekwZqeO2xJi0U6
         aVbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt9WCuYu1HdGdVpytgm22Lres6mYcbaIf7vMI/E6liWezsJIXfzGAiA8mtokpAtgJW4TKgnaqiFBVvJ71DOkWx7PCpNU5ZKYFsEx8Fu/YapWk9
X-Gm-Message-State: AOJu0YwE6yh/7T2awYGf55C6zBH4PAh+ScK+5kylpVZ4XMovrWYFr1G+
	LpGaZSIZ5sfvZmI+dF51PZlpNGfkUA1B4qNgK5VeUeS7rbd/7Cy4VjMWH3Vz4SY=
X-Google-Smtp-Source: AGHT+IHDZFe0UVmHW49F9REvA6iVNdf2dZuGdONwBfA2sUMFo7E6cmXdifUIZXkHWrSREuG4kPnzdg==
X-Received: by 2002:a2e:be87:0:b0:2d2:6200:e661 with SMTP id a7-20020a2ebe87000000b002d26200e661mr5150052ljr.51.1708956129400;
        Mon, 26 Feb 2024 06:02:09 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:02:08 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 26 Feb 2024 15:01:40 +0100
Subject: [PATCH 02/18] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add audio
 sound card document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v1-2-4fa1cea1667f@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3936; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=RB7Eb842OpfsNPEOj+50LxyJbOuZfxgXUF/IRPIlUPQ=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JncV4ua0Er/v7s+bW1PDrfmI/r/eo2np+/0blY8
 AicPQtaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3AAKCRArRkmdfjHURURJEA
 CStUBeJ8/Qq1vZrA9KzH/y9WMN4PUjkealopyiDxH2qcK9wceUHZ4XqZmjdR/w3HnZhoIEp7+nhb6t
 gNCBBTKKTYkEJeKnWFcOIzshxvUF3v880968wo+j6XkCJCNUVgU2uoGLi80iv9Cw4s+xAtGl68DE1t
 MKCtsl8/Z2h03HWmM4/D27mxa0Ynh5VWIwkSpSieqrWD/2CYW9gyq4Q4NltQlg1IVzkkMNdYaviq+R
 dE3BR6wwx45UfG1JocWbN4FjhgScINA5hy9LfRLLAGIeqX/xFbz3RetQ4jPMBrFhAUbqm6QXiXJ8HU
 BRV7RGXS8LjeCFo6Gb8TuYFpNd7aEJW4VZvf8KWmbW6Q08u5cLlhW05R4zSoUmkVd35n0ivv2mJbBW
 asIyHtP42GeCvbK1uQXZCcXp527nW5H4i6AZtE3r4m24MaQykrCkwyo/Xg5Azbk4scn4Z2U0jk1+jl
 0QvZ41IRAuHvwsnsYEqAyrdXpwiPzLlW1a6slshF0sMLqHd6x7n5I5PbzyQMUw3dnTz/iRHgEJhh1A
 hGZcPtokNWAOYXe2iajGauzr5KlUWa0Cyg650ze7IlYW3UyArh4ZQ60L19ovBJB1FWvYxIOyHXKm0b
 SaN/2bFaJirdgpXsM6Ux4tFyasECdxgDza7JsQDXacXggb49zGECpPRc/5ig==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_060214_457321_06E5F3C1 
X-CRM114-Status: GOOD (  14.57  )
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
 .../bindings/sound/mediatek,mt8365-mt6357.yaml     | 127 +++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
new file mode 100644
index 000000000000..f469611ec6b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8365-mt6357.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8365 sound card with MT6357 sound codec.
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+description:
+  This binding describes the MT8365 sound card.
+
+properties:
+  compatible:
+    const: mediatek,mt8365-mt6357
+
+  mediatek,hp-pull-down:
+    description:
+      Earphone driver positive output stage short to the
+      audio reference ground.
+      Default value is false.
+    type: boolean
+
+  mediatek,micbias0-microvolt:
+    description: |
+      Selects MIC Bias 0 output voltage.
+      [1.7v, 1.8v, 1.9v, 2.0v, 2.1v, 2.5v, 2.6v, 2.7v]
+    enum: [0, 1, 2, 3, 4, 5, 6, 7]
+
+  mediatek,micbias1-microvolt:
+    description: |
+      Selects MIC Bias 1 output voltage.
+      [1.7v, 1.8v, 1.9v, 2.0v, 2.1v, 2.5v, 2.6v, 2.7v]
+    enum: [0, 1, 2, 3, 4, 5, 6, 7]
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT8365 ASoC platform.
+
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: aud_default
+      - const: aud_dmic
+      - const: aud_miso_off
+      - const: aud_miso_on
+      - const: aud_mosi_off
+      - const: aud_mosi_on
+
+  vaud28-supply:
+    description:
+      2.8 volt supply for the audio codec
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
+          const: 2ND I2S BE
+
+      sound-dai:
+        maxItems: 1
+        description: phandle of the CPU DAI
+
+    additionalProperties: false
+
+    required:
+      - link-name
+      - sound-dai
+
+additionalProperties: false
+
+required:
+  - compatible
+  - mediatek,platform
+  - pinctrl-names
+  - vaud28-supply
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt8365-mt6357";
+        mediatek,platform = <&afe>;
+        pinctrl-names = "aud_default",
+            "aud_dmic",
+            "aud_miso_off",
+            "aud_miso_on",
+            "aud_mosi_off",
+            "aud_mosi_on";
+        pinctrl-0 = <&aud_default_pins>;
+        pinctrl-1 = <&aud_dmic_pins>;
+        pinctrl-2 = <&aud_miso_off_pins>;
+        pinctrl-3 = <&aud_miso_on_pins>;
+        pinctrl-4 = <&aud_mosi_off_pins>;
+        pinctrl-5 = <&aud_mosi_on_pins>;
+        vaud28-supply = <&mt6357_vaud28_reg>;
+
+        /* hdmi interface */
+        dai-link-0 {
+            sound-dai = <&afe>;
+            link-name = "2ND I2S BE";
+
+            codec {
+                sound-dai = <&it66121hdmitx>;
+            };
+        };
+    };

-- 
2.25.1


