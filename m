Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8170CCD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 10:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGt34+sJLdk3MLx6big+T+CAqaWtPyYycofqseF0Aok=; b=MYT12VmvY10dzQrp0Qti2+MX1N
	Z5eMy+Fsuf0Yk14p889bPwHu01weJTPN1U/zMia0QhEZzCaquY5COgpU53SAEXzeT6UJh56Yybniy
	/DjiOhytG1sgcmZv5D1+jaA2Bdln9B2EofNo5pUFvgvBE38W92YVc5QSBbmDPZPPT8XlyImDj7T4g
	n7lknsZEs5PCkicSPU0qWD2NbdcPzCGQaNC3QyvBjPEoTjgCO1oI5jXbzLnLdCcT5Oxb8IYPJErky
	xJ3pYVs/T3k9VS5kFDwKPp9DJNkcjc9QhnOB0ZI/4t/u34urXOMjzvhYQ9a6dkhcow+g2SrH7Nlx8
	wXJTQD8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8U8-00000001NUx-2iX3;
	Tue, 09 Apr 2024 10:13:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8U5-00000001NT8-1QNr
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 10:13:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4169d7943c1so5965505e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 03:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657623; x=1713262423; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGt34+sJLdk3MLx6big+T+CAqaWtPyYycofqseF0Aok=;
        b=E8d1TwBITB1DyQetPutYMcAR3xoWbl8hDBknUiu0Mu/yBY1uwCOhSjK9dvza/QN9Iv
         r/1WsUDWjpyOIxRgRh91x7n/qK89OIecYcjuj019qgY141Nrb7334q5L05mIfEobI6Ww
         9EkvgfRyt6n6KdaXPwuh6AaQJdYoM8j6y1BpLItc/6+QfHfAZhM7SYzuhVdXCD3V7wLi
         lDskG+xeMSMQVrI0RDdmH8IrNgBO5i5+V+aVoAKTZxXlTGmbAuuZt2ACMQYIUBpMEzQj
         EuZMmUGuF3NsXbuimjtfd8v2U6z+o9Tcqp4OMdr/qhbg8roE1EnF8tTD3rU0+rONdXWw
         MwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712657623; x=1713262423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGt34+sJLdk3MLx6big+T+CAqaWtPyYycofqseF0Aok=;
        b=TyADNg8rmEXc8+cKp2qOB/42/9382BElZEsF8wqmFR3oC9qc3OOy57vPqiu7boy2Ci
         rixg9p+u+M5VA5L2AG/+sDEGqV6gHcrzSi+NUWyKBAHBiL2lY7iQ820Jwqa42Xlb540k
         PvEDbqeLSqh0LiZxVam8HIvBM5Yvy3HYr65LGa0YM1gsRD7Fy+pL93WK5jziY1iJujiu
         lpAR7AJHVOA89eAZT4gA+ciXeoOQW1SeVhuXZtVWPBGv/IsGxuzpbqJUVkWSg/2si0KC
         J9nzqrdUAm26EZggLZaJMqt6Q7I7jBfjySACR9gOa2COTmyy/eN+2VlKz1Hi6WKYFQhi
         YLxw==
X-Forwarded-Encrypted: i=1; AJvYcCW3jA7hocwz4E780rp8W890Qkw5nMw7Bi7VhAa/alOYkYzLjnYNZ10XNlJrNR+a+xNH3RE1wGAS/rGMCud+bA3cPQFRpeB+B0eMotTzU1d2YFBx
X-Gm-Message-State: AOJu0Yzc2Zoc5mk7WVVznwSnJI6UKYKU9mgsUcRoaFNCtDmGP+cjJ9YT
	SgKZ3wvhPz4vLhV840px0Vc9relSi69A71hx9WIYXwKjBvRq99xWM4m0ELF0HLQ=
X-Google-Smtp-Source: AGHT+IGzfaK4n2/g8axda9rEW09xuGb8tQgLRNvycpCGtQ33o2AX8GkVbCTGFTgBOJIHcyo7EAPzsg==
X-Received: by 2002:a05:600c:3592:b0:416:8152:8a70 with SMTP id p18-20020a05600c359200b0041681528a70mr2710612wmq.33.1712657623706;
        Tue, 09 Apr 2024 03:13:43 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 03:13:43 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:23 +0200
Subject: [PATCH v2 02/18] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add
 audio sound card document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v2-2-3043d483de0d@baylibre.com>
References: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
In-Reply-To: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTTZEodaz6gWD8MRUgu0ITSSraVYxIjQYi8MKb6
 nkjJEj+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURXk0D/
 4/ZJ3u2KfDNF648wt0JHA6iCjSPOuj6vLD588gTo+Re1qpqu68/joP8w3rhRELxW6/iHZ4xt/QFj8C
 oO+X6o8CASS6dbwjDvRmkR4BJ2/Ku0pnYzNrm2kshLM4OEV/b7fix7ed8oFLJUjubS6BiwPy3GJs60
 vu6anJhjf4YaUnISMBRimlkMamBn2UsSVJtwEuvVHaiovp553a9iKTHBIDeBXNkHDffAJzI1aL4tRn
 iUDVy96b4ShE8+MENftXo3FISeURWuizKpXkQ1bmd9yv3v+51HHQWpxHFchIeONrJrZ7k9Zep2WTG4
 UkS2JXJ55Ywr5w8Iltjkqq31cuicllUklzPCrDNBdlsoPdW3vykmolaDVPYK6sYc9/4eGkPGrPh3BU
 vaWjrfhqvUgiDDYI77J9ugPtdzZXrF38VpIAW9GgDqYEFh4P9gwVnoAq17S5JCEUaNGPRgdAPi32hw
 tqpTZfZ4GsC1trFbNq8ObvZg0RD0l2LrM2w25Xf+Vs+46aDVTOS7cL2fE9O1YQo4Sgrb3KxV+OBtCE
 HOZNSh3te3PjB3b2DSruFSi503sxBNQse4BHacJIli3TwHCCtcAcd0gz5kFogwXoOyqd2H1WffjR4S
 j0+fk+qLCPqeqeFydlpoWD+tYzmV2IaYX3dmPQ4E85uI8m9PSKEiJ/+9oENQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_031345_426270_273985B3 
X-CRM114-Status: GOOD (  14.41  )
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


