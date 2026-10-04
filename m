Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB067CA5FE6
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2026 06:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ND6Xn9LGPIbgdWx9zVUU2I1uYz7XDZMstUVT6Q27OyU=; b=iVu7RJBoQNUz+4NasobDtehqLY
	XujIjluWLScMBZa9iHsvMWSlrC+evXJU9/YZvZbdu6Rd3YEuC1qqAosaPBAJ61S/naAgZmLOnH76e
	eimXKO3RvXdZSHXUhd/OzOAV+41Mz1/HaZAOoo0FuFU9bqqmWvGWr05UeE6tkhOJo5mmP3GucA0FO
	dAHvkJVze5qgHSTyKakS1oUlMcF/+eKfEgWvCQeLcg09oWQs2vp6gDkiDSpKa+i7ZZt4eHx2uYta+
	seEsNoKKjfeFx/3Pi1sUyah32jSGuQjFvseH568NfATqHZ8taMtk13XdhKOcfo6uqNwTTK28VWSn9
	rlAr09Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLg-0000000ENa2-2xcY;
	Sun, 04 Oct 2026 06:05:24 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLY-0000000ENVj-2OHB
	for linux-mediatek@lists.infradead.org;
	Sun, 04 Oct 2026 06:05:23 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccafb751so270464a91.2
        for <linux-mediatek@lists.infradead.org>; Sat, 03 Oct 2026 23:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093916; x=1791698716; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ND6Xn9LGPIbgdWx9zVUU2I1uYz7XDZMstUVT6Q27OyU=;
        b=L6iYVDNy1S+fhNIcoGFppgvHYDdVZukn+UE50wzlsHFSKmuQOrwB8nA/v5hS6TKaF8
         iQmyZvV0kJqSjJQMdZj7/qJli6N/WaoEK9fmc6tVE0SxDsi+FkyjmhwQjJrWJppgLC/u
         NfhrClhxsax1cc/yDkjNADGf/icWkEUf8wRlYA8vBG28XEt7Rt9TSXXaRNw7y6ANx+lI
         TDKjF9zsUFqc0H+QCl9cEL77FZTfI72Lfy07CsuX4UVgyUUoRxB3dHDrNQ8cVwmM15im
         FOSGylT8uX2j4ZzRpiy9+ndkkFeCw4IkXDtfOgnuoI9IGDhpkdLuypUmiaodfBR/FMPW
         WyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093916; x=1791698716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ND6Xn9LGPIbgdWx9zVUU2I1uYz7XDZMstUVT6Q27OyU=;
        b=V9vdhNNOxUrx9yfgjhNdwDgWuDHGKMmYcSGjo1ybVMjaFCb7y9Sed9XY7Y7fLyvH0m
         IEa1F+eo7Hx+J33nygZ5cqm4hzsT3z1adZsTrCdH9/P94zdntBuzGsm03w5cbtIFaMex
         Ax1fhFYZOfh2CNdDfCCu3ctThfKoYRtdeOxeSycoqZ5V62Aw/ExoZL7g+/cd5rassWyg
         ifVzASbNal+gyPwXM7g7/G4LVPb/zl8WHh29+8vpYlnUhB/sel9xbVNTLUiSkS0tD0p6
         2kGxzsptqfI49hyqc5afdnKAOIP4Nho8rsRBB5vQJR8g/UkXyX3yieeSQHnftXJzFgQw
         +bkg==
X-Forwarded-Encrypted: i=1; AKwUvBzB//cWmP6/M6znFwWHqq9AT/2UyjAh3AS8Y33+JeogTC/fifmoOLPQa8EWIGzgkBlq8oDRnMCOS7kFChVImQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKv6QdoOTp33VNrZPxQufIZUFcUolelb2avs42fPAcsv6iV+IAa
	gUj9WNcNRUD6lVtv1mrE+M5Yqf0XFZsoc1rrj/VQDpGku7pvqsDTSjww
X-Gm-Gg: AYBFou0E/WPycA+oDkYyiDhHtmt6LBhCG/29rapU8fVoKABoJ/BY+3hD5xovAKZQ7ia
	2pcrGUOVdcLYUFLywyzisdgRNDvebo14mNltQi6huWAlxExSmlFvlDw6ILbSdEIy5GlJtxIloBb
	nlWKZXmZn/ZmsJI7LB5Ot86zDt3oKfsE3qrKsIHI/4CbgnBc7Mx5on/mBcwQZc1AKF8I/x1STUG
	VfERHje9FHDW2/fWEqA/grZ88xmi+AAq6TatNs9Uu7Qsw14OPPACuBkpHjKRHZdDrbXL+CMlEAC
	uTRvPud8Tf4Ie+vTnizKkQF4tnjeOu1LUpUmR3LQGXwOd9gkbqH23oV19vgG9/u5o+mUL8CHoFS
	uthasY4KgezQ/UEcXXf3qQv+5hrAjI36CLi/QsXhpMqMOImo7TGysP2fOmsDWx50XK7KP6E24WP
	uQrQN0sDcE+Ye4Or9ZYn1H5xLd/Wc0vo9qaFfJvk7YBh6nvyMeL169qZbtZympKxDe4jH4jciSg
	I4NaKmuUPeL8SuAlyDqGQ5vNgInEN7I7DNemB+j3j+NRr5q9IA4PthL+PHL5HBI6xpj8Owd+acg
	bI8/WhmbkD1ldROr6nPdMwKka24piI/g8RS+J6uP5oHzLHM=
X-Received: by 2002:a17:90b:2812:b0:3a4:cbaf:f152 with SMTP id 98e67ed59e1d1-3a6cec2fb6emr2736881a91.33.1791093915710;
        Sat, 03 Oct 2026 23:05:15 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:15 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:32 +1000
Subject: [PATCH v2 05/21] ASoC: dt-bindings: Add binding for Apple Silicon
 Mac audio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261004-macaudio-v2-5-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7056;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=edwYXBTQUN1BJwuH/myONPpbVVDVKxKBlGn6cvmdYcM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+T8n6S05ssjt3VXeH/5abN0rD7X8l3TwfnwMveNC
 nZTjyX/6pjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEx1wlNGhib72Y9aU6bFiwarVGz6cGLlmgUJu3PeybAcaEmz/zF56yFGhvPLv85
 urNso86dFdsvVpArpA09jsy7Lmf68f8T2CUMzJwMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230517_710478_34371560 
X-CRM114-Status: GOOD (  17.09  )
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

From: Martin Povišer <povik+lin@cutebit.org>

Add a binding for the primary audio subsystem found on Apple Silicon
Macs. This binding integrates the codecs and SoC I2S peripheral
used for driving the headset jack and speaker arrays on all Apple
Silicon Macs. The internal microphones on this platform are
connected to a distinct coprocessor and are not part of this
"main" audio subsystem.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Co-developed-by: James Calligeros <jcalligeros99@gmail.com>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/apple,macaudio.yaml   | 210 +++++++++++++++++++++++++
 1 file changed, 210 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/apple,macaudio.yaml b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
new file mode 100644
index 000000000000..c0a04fab82d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
@@ -0,0 +1,210 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/apple,macaudio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sound peripheral integration for Apple Silicon Macs
+
+description:
+  The speakers and headphone jack on Apple Silicon Macs are
+  part of an integrated audio subsystem comprising of Apple's
+  I2S peripheral (MCA) and a series of codecs. The machines
+  have a wide variety of topologies ranging from a simple
+  mono speaker in the desktops to complex stereo arrays with
+  dual-opposed woofers and tweeters all driven by their own
+  mono amplifiers. This arrangement can be expressed as a
+  set of DAI links, where the MCA ports each codec is connected
+  to are represented by the CPU side of the link.
+
+maintainers:
+  - James Calligeros <jcalligeros99@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - apple,j180-macaudio
+              - apple,j274-macaudio
+              - apple,j293-macaudio
+              - apple,j313-macaudio
+              - apple,j314-macaudio
+              - apple,j316-macaudio
+              - apple,j375-macaudio
+              - apple,j413-macaudio
+              - apple,j415-macaudio
+              - apple,j473-macaudio
+              - apple,j456-macaudio
+              - apple,j457-macaudio
+      - items:
+          - enum:
+              - apple,j493-macaudio
+          - const: apple,j293-macaudio
+      - items:
+          - enum:
+              - apple,j414-macaudio
+              - apple,j504-macaudio
+              - apple,j514-macaudio
+          - const: apple,j314-macaudio
+      - items:
+          - enum:
+              - apple,j416-macaudio
+              - apple,j516-macaudio
+          - const: apple,j316-macaudio
+      - items:
+          - enum:
+              - apple,j475-macaudio
+              - apple,j575-macaudio
+          - const: apple,j375-macaudio
+      - items:
+          - enum:
+              - apple,j613-macaudio
+          - const: apple,j413-macaudio
+      - items:
+          - enum:
+              - apple,j615-macaudio
+          - const: apple,j415-macaudio
+      - items:
+          - enum:
+              - apple,j474-macaudio
+          - const: apple,j473-macaudio
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  model:
+    description:
+      Model name for presentation to users
+    $ref: /schemas/types.yaml#/definitions/string
+
+patternProperties:
+  "^dai-link(@[0-9a-f]+)?$":
+    description: |
+      Node for each sound peripheral such as the speaker array, headphones jack,
+      or microphone.
+    type: object
+    $ref: tdm-slot.yaml#
+
+    additionalProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+
+      link-name:
+        description: Name for the peripheral
+        enum: [ Headphone Jack, Speaker, Speakers ]
+        $ref: /schemas/types.yaml#/definitions/string
+
+      codec:
+        type: object
+
+        additionalProperties: false
+
+        properties:
+          sound-dai:
+            minItems: 1
+            maxItems: 8
+            description: |
+              DAI list with the CODEC-side DAIs connected to the above CPU-side
+              DAIs and involved in this sound peripheral.
+
+              The list is in left/right order if applicable. If there are more
+              than one CPU-side DAIs (there can be two), the CODECs must be
+              listed first those connected to the first CPU, then those
+              connected to the second.
+
+              In addition, on some machines with many speaker codecs, the CODECs
+              are listed in this fixed order:
+
+              Four speakers: Left Front, Left Rear, Right Front, Right Rear
+              Six speakers: Left Woofer 1, Left Tweeter, Left Woofer 2,
+                            Right Woofer 1, Right Tweeter, Right Woofer 2
+
+        required:
+          - sound-dai
+
+      cpu:
+        type: object
+
+        additionalProperties: false
+
+        properties:
+          sound-dai:
+            minItems: 1
+            maxItems: 2
+            description: |
+              DAI list with CPU-side I2S ports involved in this peripheral.
+
+        required:
+          - sound-dai
+
+    patternProperties:
+      "^dai-tdm-idle-mode-[0-9]$":
+        $ref: tdm-slot.yaml#/properties/dai-tdm-idle-mode
+
+      "^dai-tdm-slot-tx-idle-mask-[0-9]$":
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Idle slot mask. A bit being set to 1 indicates
+          that the corresponding TDM slot is inactive/idle.
+
+    required:
+      - reg
+      - codec
+      - cpu
+
+required:
+  - compatible
+  - model
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+      compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+      model = "MacBook Pro J416";
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      dai-link@0 {
+        reg = <0>;
+        link-name = "Speakers";
+
+        dai-tdm-idle-mode-0 = "zero";
+        dai-tdm-idle-mode-3 = "zero";
+        dai-tdm-slot-tx-idle-mask-0 = <0xf0f0f0>;
+        dai-tdm-slot-tx-idle-mask-3 = <0x0f0f0f>;
+
+        codec {
+          sound-dai = <&speaker_left_woof1>,
+                      <&speaker_left_tweet>,
+                      <&speaker_left_woof2>,
+                      <&speaker_right_woof1>,
+                      <&speaker_right_tweet>,
+                      <&speaker_right_woof2>;
+        };
+
+        cpu {
+          sound-dai = <&mca 0>, <&mca 1>;
+        };
+      };
+
+      dai-link@1 {
+        reg = <1>;
+        link-name = "Headphone Jack";
+
+        codec {
+          sound-dai = <&jack_codec>;
+        };
+
+        cpu {
+          sound-dai = <&mca 2>;
+        };
+      };
+    };

-- 
2.55.0


