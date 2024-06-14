Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8705C27C6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 07:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wcqbhlzk69tSoPzbWxkhR+N5g5aDso2+zkY/xdikbcA=; b=CfwfRi0i4MvyXkrCvhQwPqvjQz
	4x4hwP9bC0HmbAsAyNx7W9Awk+kMgkecwnHfBcbuMG4pqpF1UDwVQJ4BBipw7TZB0ZtqgU7NZcXJ2
	864oq0jjz+uj38DbK3LYr4WhbD8U/xdPCmUx1nM8NE8Z3j5rZ1brSJ0khUYP1dGJAFn5sKcwpHw3a
	OSix1jVkG8vYCLc9U62Bk/GRuHcECi7qiYRClUYTXYpZlhJVxtSNglBe9UPq0AsSE1OdPGdeejb4q
	TBhEx1sLhK9+savivUZuKayYkQP1ZF0iNFc9arrjIUtQ2jM1IfIdQ/DQopU4UoFKCtdD5JXyipzXi
	AC2gsO+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1MJ-00000001m6M-0n2s;
	Fri, 14 Jun 2024 07:28:27 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1Lx-00000001lpX-3PNm
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Jun 2024 07:28:08 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-35f2266edd8so1405960f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Jun 2024 00:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718350084; x=1718954884; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wcqbhlzk69tSoPzbWxkhR+N5g5aDso2+zkY/xdikbcA=;
        b=T6x2BIrtI+w7gBFN57aWsCTURpPgKobfsWOBdqGlqz6wgoPAIpT9mLv/1U9fAad4Qw
         clkUyEWWQyxxwMIhTDR2Iuk+bE1JleUQYBKa4Hzz45gZSMicE1B3JDTWXvsqRFweDGDq
         ck4/aY84uxW8FHpwUndy9x1eduYe8x0co93p/iXkP+7IvD/0br5djl1qNutHDrTeGMKV
         IIw8CA+qPXLO0okjjPIfe2DefAdA8jWEXw2Gud/R8WxDJhs6sG/kud0WTJQJnzYXy0PP
         tXMtUH/dwMmViXNj/Udn/HB/vtk8iJN6f/Gr8lORuBWQqsKFPDJaCo8HbcI2hTNINRPv
         ysfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718350084; x=1718954884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wcqbhlzk69tSoPzbWxkhR+N5g5aDso2+zkY/xdikbcA=;
        b=dGOkTm1RfO+9qegjnNsDNiARM76GoZVxUZ7BBQ4/NSKjy1nwe+RJGgHuN34TmyVkRG
         kt4GmzSwEE0aPNNemUSruWmniulBhjt4wOv7nYhf7seTOLtrPz+G7ZyIQd+s+4cnG7/q
         QAxq3rmrvdcxzG77lx3rpPmrVeT6QtPnZ+MyKXlg4KzWcHM7kI+dHprAAmKf/lljiz0M
         F2cbz+AfToGusDwF+LIY8kO9KkilGJXtum7RXaMSJGTFjvLg9BqtJRn/aoUV8YXgKf65
         X0ySshhBVPdOTbgoFY0QQ0i7XXD16Ek8kbQSyoKyHEtboKwyRjuPbFFn9Lkm4VPVyH5O
         KrVA==
X-Forwarded-Encrypted: i=1; AJvYcCW1ZTIpw4BNQXgASdNtJGWVpzYtFMQ09JdOuh0yzLkmCC647nn+UuYVRQsZBbk6AnoGKd8+oc39hJJ/cz4pHCy8qAu4s3hsB2b1+2RP86IuJnIh
X-Gm-Message-State: AOJu0Yzy6N66xAM7nTgjIjZnndZc7Uz9v0iZB7avBs1FibzYDNQLGThD
	DpzTPFnbbsc6aUPnMc1tkX5j6zABfvvcmlnwZYOJ/qEcBW+PhgecJratr0KXiFM=
X-Google-Smtp-Source: AGHT+IFqz1dgy+EkZ2nWMXlLo0facR7vF/K3mVFSrIkL1XoCW4xdx2J4FdrSp/oL4Wg+mDoijesP2g==
X-Received: by 2002:a5d:4d43:0:b0:360:85cd:15d2 with SMTP id ffacd0b85a97d-36085cd16f1mr192260f8f.10.1718350083878;
        Fri, 14 Jun 2024 00:28:03 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b2esm3535773f8f.101.2024.06.14.00.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:28:03 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 14 Jun 2024 09:27:45 +0200
Subject: [PATCH RESEND v5 02/16] ASoC: dt-bindings: mediatek,mt8365-mt6357:
 Add audio sound card document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-2-54827318b453@baylibre.com>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
In-Reply-To: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBma/D+nYv/EDAhy7H3m6RJwWmdHTceswfrWziDe14m
 yVtbhD6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZmvw/gAKCRArRkmdfjHURYXjD/
 9Ieu4k836F7MKBxZp/GH6IhoeeM1ScLClCw98D55FAjs2uE++c4tkQxd7j8s6vCf7baH4Lx7C7yUBB
 +kvTzZsC/KUmj+U7LgNfIfFOrAgbRGeV9Zfi//swaATwAP2rg19KQHp0M/tAe8OYnXQrozYM2lcjsy
 rC0bOMFXSB020FkuEj6dzf97RlMhUZDrVK0a9KOLHlFyGfc2I+ZkNskoJr0c/i3T1UYGOhHc20euTF
 pMterSUcfV7Z1XsktI3FXVH98tUZe+vPQoYZiAWZ/MHSn/L4k6tIkZvmVAI4PaUv+rFpZWO/NI+Vxi
 tVccXoWKqyghEwH7h4mLxj1SisXk47uuUYuEcDUWHWEYxX61mqNXYS7W1bPm5qDcch6o0E5enT2iEe
 PJAKH79/zsAD5J8R+p0ZS8y4rNy9H8bdUInH3C5Fk959FAQyy1384QjeBPcIAzHSCpkmB/jMrsKs8H
 MMMjmvsKCu6qL/0BCAUKAS925rHQam8jkUMS5QN/KC1Ab9l9EQLlRsMntR3hf+n8Maxg1k+ih1Njzp
 7LNoVRnCYdbejWyCt2PtnGeCgNV0QxgmKRUF8NucRFlmhRgk0eJfSMGvjZjeCoj1nQK+7ZgT6ND66I
 qGm4dfthK4dlv6jg0+IgPREH/Xgc0YYQzLjdZ2BR1MxwANdORr+6obyk/a8w==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_002805_921283_C952C98A 
X-CRM114-Status: GOOD (  12.82  )
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


