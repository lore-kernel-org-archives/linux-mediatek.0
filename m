Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8C5CCF2C4
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2026 05:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0GzEErIsg97OelPFAk/U2hm5FNFeQmobbehjAEKQNY=; b=rCJLr7n4cYSCcbVvEGDUOosOAq
	N0CYiMYt0qH28gyizKLjMHME4MTCQPuEhESVeiER81AR8Xmdeeb4c1e2OGIg98JI7mLxDvgEQGJWZ
	0TpKWPZzhAYgWj7VkzgWbSTzKpfQd1g72nuJgoSNyKNrI7Iusb6Rt5zom6uQRXp/dtALxnYsIs+90
	wGScmvmYiNMdeKa536SC+fATUTo3K9RzftRVVN7FGJRPtY2GafA31Tomhu3IRzQJIveteWYyDPCol
	rmTeRTkSwwnIF4JMSh/XnANxUZhIO51lJo98wuhs9fbX19Kl2ZTSL4K7+tJzXt8oNohoM/d91co0F
	+Q4l1nhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJrM-00000005ZdI-3ofl;
	Sun, 18 Oct 2026 05:55:04 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJrJ-00000005ZbH-2ASn
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Oct 2026 05:55:03 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso659631a91.2
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Oct 2026 22:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302901; x=1792907701; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R0GzEErIsg97OelPFAk/U2hm5FNFeQmobbehjAEKQNY=;
        b=iz+AcnoaXZSenjIeM3CDJ0qMVDfVYZ3l7nAssiaEqS0SphHvsY07Z7ui472JyB+wJn
         UfqGNmlf2Vzo6YvTKLIlJ6evgGr2igly2Id0AYpCkDJNkgJ38LWyzv9pH/99OHgGptaz
         pHLP11VkMGX+QBmGbHPezf/chjFzoKCiPvg9HurgwvIndsUWYZlLfYqDysmDwHgKqdAt
         vyEeADuEPrlzMdqFruHQbSTopQqzlittpJLMDxkXuVP2LZyNT22lTQMUWVQ631zZcRBD
         skL2Gi9T7/AFwFLWCmjuVlop/wlw104kgk1WfuQJabUS7RMse7INiXelb/rvgQoLw6v5
         0kTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302901; x=1792907701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R0GzEErIsg97OelPFAk/U2hm5FNFeQmobbehjAEKQNY=;
        b=Rug31lEt2ue6oGaledvnZBdOSivycfAvWuyHsz8WR/SvvT+4OkALbjyLqI6hpTW3s9
         UTf/drDaV0nDOyzyF4Pjsu3E5JA0y/pNWT2eBDShYJpvFtEFi6+7JYLvhPW9OhBn1mTu
         WQ0nvYtDEytYcwWlPkYriOfn6gGQfOWLtG71r+rMKAHeSNVMkUUyxfuBD408BfdsT0kC
         kc7zEu8yPkEJsd0InBPJy66FaHYfZFKJBcpr1Dkx3RB4vpqWQXZOrdp8puLBvxSsnr1d
         eDN8vwHDC+WZL33H9XmJNwG0+2A61V4o+J4lZwN8rH3JTyMTJNs6iJRf12y1+aSCaUD+
         s+BA==
X-Forwarded-Encrypted: i=1; AKwUvBwTa/vvQPyYyXoXb76jJZYejB4xa1ddMCBNRbnpjPduxJcpY0mUCEFFciQSM5ewgWpdcxjOtVX8IsdnuYQv/g==@lists.infradead.org
X-Gm-Message-State: AFq9FYJE+iPdmi3ZotSmFZHjsyV7gZ0pgTbeSp70jP0brCD7x4VfXeeC
	BiQ7tm6UonyYpEE1pSIBBNEVZ8REJkcYt/PzmNDThLXPrZHQHSjnCqBB
X-Gm-Gg: AYBFou1Eg9rIpLfIsMVS/m9GSvFq3u1+5GKYw4yri23g/aDEIaJVKguE7EUiUvJ/qXT
	OKVwl7Dl4n5cLdhCgjl3L5zCNr3pV9Morl3vCc5bClr2S3+I7c/uPoGEffT6Oy49chPjYlAX4Jg
	XIqvc5g+aVOPiMDxSUnSU27l5AE+F+xNqHG2Ol5xRGR8xTKN+ZgcAXXWno6A2DOfFQZpGNnc9JT
	ZA9Mc2Y5smHSEbPIyM5fEM/GbzHtT+UE+sP/KJkfUW66aYUGk3+C9CxCnFjf4v8N9skZOYfOdi5
	ktCfusE+d5qkzmc7K8YPWDDCiTX3thpcbP/11kK+ok34iEZLCYcpBFLEgPMeuumptfIX6MHdfCO
	oMra03xlyEFJ3AHdtH4in8iGR3pm8oTRjgmOr8ZxYFIE8MS4tTYkh39hlzs0lhz+NtEBea6+9Dw
	ZjSysfil6OTjmSh6fq+tWU2q0FhG9OL7zYMP+mxo/Id/izD/jd7ookC/haR1ebXL7iZuOuAt5hw
	dK034buh110KbVmDaktbrPF3VUKvwQUV7+unR5dB61rn0RNefrEhqmnxZOtXn/3TnnPYxe0Prj8
	9r+/X2We+NMaDWK9P5dMOJA7pOSzlwmm7WQHztBhZWph/Q==
X-Received: by 2002:a17:90a:10f:b0:3ad:1b31:92d8 with SMTP id 98e67ed59e1d1-3ad1b31933fmr591669a91.60.1792302900781;
        Sat, 17 Oct 2026 22:55:00 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:55:00 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:53:57 +1000
Subject: [PATCH v3 03/21] ASoC: dt-bindings: Add binding for Apple Silicon
 Mac audio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261018-macaudio-v3-3-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7168;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=SS0IiGxMzo2EMW6a+AaERracfk8R0/aaLFv1rffDov0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4rkvzrpT+3hikpd0XyeHaOQZWyEpE4t6hTOGb6VLj
 +VvPG7YMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOpWC4a/8oLvZRckda2Tv7r+9ooPjcFXLz7W43pwr/NTVlBt3cr5UxkZNn8vj/3
 7JHkNg4JizDzez8xF/XtiuyNyg/5McbkuaKnKDgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225501_582030_1B539ECD 
X-CRM114-Status: GOOD (  17.05  )
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
 .../bindings/sound/apple,macaudio.yaml   | 212 +++++++++++++++++++++++++
 1 file changed, 212 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/apple,macaudio.yaml b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
new file mode 100644
index 000000000000..af8e9686ba7b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
@@ -0,0 +1,212 @@
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
+              - apple,j456-macaudio
+              - apple,j473-macaudio
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
+              - apple,j457-macaudio
+          - const: apple,j456-macaudio
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
+  - '#address-cells'
+  - '#size-cells'
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
2.56.0


