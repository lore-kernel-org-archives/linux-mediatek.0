Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB91606A329
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 07:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=krrA4gDP;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqfzrJVp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VV91sp0zgzAnNndz8lEyYpW2VQkodDRsnrajblY9z1s=; b=krrA4gDPbzt1Zx
	QD5kyPqVd6jbOLsFbDu2pWA4RzWtCxoJ2sFozOA16qfkTO/IzuWrrvPgv1GL9cAfFlEGGCDV58YCW
	oN2WLTuNo/R67p0nDgPiJEG4bA0inO6ydFsDrJYjOHjUQLz9JKBv3r0GUXnuB2gzWQydK3K8B6lq0
	9h3QeQAPfHrK+G9lKpci4vIqtkHhv9Av6tIuvFfD5t4WYwhFRhqLH52fXP8kxX77XO08aa2lPOGSW
	Lzn6A1qGx+zWSlyRaK1JAi8gMnvng1j2WQtuAcf5IGEFUGSuvYB0Jj66SE0PFDTelKx5etAXaY60Q
	9g4S2Se3wB/opBjY50kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98T-00000001LsB-2ve4;
	Tue, 03 Nov 2026 07:40:49 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98P-00000001Lmj-24an
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 07:40:48 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso25809a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 23:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691645; x=1794296445; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VV91sp0zgzAnNndz8lEyYpW2VQkodDRsnrajblY9z1s=;
        b=hqfzrJVph7tZBZ80vTdjtXHHBqHJtB8AuFIyXimijIr7gmsKzlJipawhG96cz6LJSw
         jt71/3ApaP6P4qjBwfY3UIKG4oeAdmMT1CARaTqhdkiKyGH0jT3JHhFDY9nCdjy1yGGe
         BkYj/5ZLYxDJlOuiuU/vc0ilsOIwsvAQ9s4fZysyo9byN7xAbEA8hXi2ShFOTr//yS0V
         +ls5eQbO1E6OiA+dtOohNBrOs59nSwL3jQVbvFSqyhpsRu6yelne1isH6o8K4DhwmShc
         JwPvsvzajbFTaf28l7VVo3+lMIKaMBYoOcNyIoMtqvKkzepa27hX43h6Uokz2IVO+ajx
         fP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691645; x=1794296445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VV91sp0zgzAnNndz8lEyYpW2VQkodDRsnrajblY9z1s=;
        b=rAG4AFSeCaEI7P0ut+P9mdS/Hf/1nRY4WLbga2kpWN5ZlOP+AuzFrC49o7UsRGGmLU
         NZLgEfjuxi2hBkkOPl6x0Pi0jwGUz4oWIcbyKINqyTr7qI8qa3+p8FfFC+jTc2B958Fx
         cVHRT/TA7zVmPpSyJ8T2WgJuLKQKFkbrQYGKeh1b2dwdHm7ObQ5eVkUtKfflN6CM14De
         AN0ozxePkMHLwZ2hOjXlMHB2z0cceuHcHQf9+lJPA/vFyNbnpcfpx/k3DAp38pFe5c2g
         2ZBfF7xYwOZngpzBBDPr7Og0wpGm50GRHpTfZNVYfpdDXniXOn8+qC/waMlkQwi8XcHw
         a7dA==
X-Forwarded-Encrypted: i=1; AKwUvBzOEo76QOlXHRMvAIqHLma/7NmTsLwfns9wwuqDOj59JjNYZeWWRwIgGbhRiAPWNnVUGXR1P7jTVLmaubPunA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9m6TY0Auvc5ElJBdKMMt+8iciELnnl5heRwKjk+B8VT8SQKbQd
	2jsLvi7pfbunuRS5zKmdPVEPPxzeZdbvww+xmBvlQOEn7cwGwU4h+OJK
X-Gm-Gg: AYBFou1Ei3Edrf3ombEk0/lgML5AZkVtvdnv3lTUASRix7StBAjXAJDUbAxli7T6i0L
	ZubMWWyxNyWKbxaI7bf6uxQ/IJH8WMuXavN6qLFgxWGuYbPvLKuD0tqGs/5Ha9xHUwH61tHyae9
	Ggcf3TJdFk2J5HA53obSgAAMuCkYwbjhedB6Eph3q7NXwiNF5s8numkpxXQapfEGf2fnMgK5BHO
	C/uo/T2Q3zvTPc2pF6mqSlZn/vDo24nm341T8SCqgfJj+E06HkmHqhdF6Nh/6dkrdS9cr6HZfS2
	OfEQhLiKYxmhkq6j6VqJUTKDhr+Ue6afQt3OoRlLGPCRLbtm2JYlbsN3pRw27eN6ihSnDCQ5QIQ
	o+cVpVjqCAnZjXFgoN6wge9p2AIxUxlQINssHiEWgyFgqTTMfDa1mVN+69gVEcJC4Gjnx8G25tu
	qsioFbg3O1DHm2mdnKtJBA3La4X/cRQ8Y4SSSCJKR+AxHxAoqjJVBbeScL5CL2995Z7UjfgaAhS
	JIcubdm6Vrsu/Jyn2jHJ+nwVU58HrWt26pbkGFReabkCajj4Mgp36jjgiah/IloFgpniBNSW9eI
	xhtcQ/MEKkhYVKbxr8J4WgYv9dDIMWbV3gFEAq4sIwl6NxZB9FbbJmlv9dIyc98J5TIy/7HOv/r
	uN/uvT7pZ1BBczfiX6+RI65sipJT1e+yft1cVIWDCH7LC8+leLM7rxO9Jf7bRns8LyTlU9yCUKE
	cOwZo=
X-Received: by 2002:a17:90a:e7cf:b0:3ac:9a54:e3ce with SMTP id 98e67ed59e1d1-3ae8986e718mr10689427a91.63.1793691644616;
        Mon, 02 Nov 2026 23:40:44 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:44 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:52 +1000
Subject: [PATCH v4 04/22] ASoC: dt-bindings: Add binding for Apple Silicon
 Mac audio
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-macaudio-v4-4-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6733;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=q6cZjCz9R++Ba7lkffXrC5JosZFNf04Vy9Rd1123Uys=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/usmxdxzhdZvNmS70e5/1RxxwvHDTkPndTUn2iz
 dTIEv8JHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKleEszw369Bo9xKgbn9AUfmUx9e8xcLJE4bb5K+/OLMi3PdO9y+azIyTPryTHz
 tkXnx6kdq9HTaPS9t+bA42k7a7+b+nyInzQ/1cgEA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234045_786220_3784C4EC 
X-CRM114-Status: GOOD (  17.38  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
 .../devicetree/bindings/sound/apple,macaudio.yaml  | 195 +++++++++++++++++++++
 1 file changed, 195 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/apple,macaudio.yaml b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
new file mode 100644
index 000000000000..7a97ce5bb7a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
@@ -0,0 +1,195 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/apple,macaudio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sound peripheral integration for Apple Silicon Macs
+
+description:
+  The speakers and headphone jack on Apple Silicon Macs are part of an
+  integrated audio subsystem comprising of Apple's I2S peripheral (MCA) and a
+  series of codecs. The machines have a wide variety of topologies ranging
+  from a simple mono speaker in the desktops to complex stereo arrays with
+  dual-opposed woofers and tweeters all driven by their own mono amplifiers.
+  This arrangement can be expressed as a set of DAI links, where the MCA ports
+  each codec is connected to are represented by the CPU side of the link.
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
+  "^([a-z]+-)?dai-link$":
+    description: Node for each sound peripheral such as the speaker array,
+      headphones jack, or microphone.
+    type: object
+    $ref: tdm-slot.yaml#
+    unevaluatedProperties: false
+
+    properties:
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
+    required:
+      - link-name
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
+      headphone-dai-link {
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
+
+      speaker-dai-link {
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
+    };

-- 
2.56.0


