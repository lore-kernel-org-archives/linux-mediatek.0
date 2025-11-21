Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED9DCFA475
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Nov 2025 05:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+/E1TIhpDRo8RKAqJEHauT5WqKU3CX8xyLt8d/UFSM=; b=YUChBnWUlTCo4bB7MyzutXZDut
	wzMmytoOwr/YuykDd8wEiFDCWGsrYYXf5g92CDquNjUOz5bzAU0S3uL6Tb3PiI/m8TUN0ARY8p1Ro
	EoL7EpHwpi9Q/fjjPIW8OO8TZdoAeccst2oqh7tQ7FjtM4kF0IQ3hxqqo3MP2z/d1IXIpBfJ/wSfv
	5UWyHMtJNOIQ2YgsZvJ1LN0aOoT+YjWHvsgi/JbsnTznKKtgF0vBPrpi63zCp6Yzinhq4HuT42xT/
	2H7VguAf37WqzLEP0knXR380YkBhz9HSwwoLRvmeJBQ/LjMnPDIzBkLxfTGaxsrILX8XDNUNSLUUD
	g5kB4k9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJy2-00000007rUN-0g19;
	Fri, 21 Nov 2025 05:45:58 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJxy-00000007rQI-1xWi
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Nov 2025 05:45:55 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42b32900c8bso957733f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Nov 2025 21:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763703953; x=1764308753; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+/E1TIhpDRo8RKAqJEHauT5WqKU3CX8xyLt8d/UFSM=;
        b=fE55uIs6cni2uVf1C3u22yfvP0uvW2EaMAVFwqEjcgLyKKRXDNVbTabTvO8PGZ10wB
         A4PK4IjmXcRLlUdgNIETS3qMGyISzF5swI2QM+yMDRMPWm9vfmH7jgEPX1L7AmLG18C2
         dPW1l90RyqOAZU4hx6Th/chXQrPdk2mpp5l7+Q2KCcxwWoKXPWKOSnGIvyY0nTNKqc69
         VheXYTL631LysRsedpXNyvCwEzEytrxoPXtN+eTZFsSC+ghgk6UEUtI38B1xWac6H3yT
         GDqm3Ns06CgxSVgXKh5bzP8N/jI9WtT8S2SJHWknhL25+vrTVuRkkcPThugDrSUPx1Qk
         /qZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763703953; x=1764308753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3+/E1TIhpDRo8RKAqJEHauT5WqKU3CX8xyLt8d/UFSM=;
        b=CFY0IfoCaHbZefdIh75PejMT+/BWXgN4VZZW8w/2oo9/kaDLmaV+CNBZP/2lZkQc0r
         44SGhzKC77MIl3gCbulZHsyUL8VykZB9XbilMuKJVPLUdB0VkhQ/jSApZuLdcpgmxfR2
         D/3geTzRXgNfBw2zDN/NhyiC1zKZSFr16/YYHV2tgSFQjKe1lDMB7HMFRUeouSWWk3QN
         AOWqD5NfZyNK2lKBqF2hVab2JviyNX6FTgdAuPMdJ6tZ5dBQIAuoqCvBLk6A9veU17r2
         6txWXQGcKXJdZ6ya0PZ1dYaQ8CZuDq1dvNgdORhoLMNcuvy3JCJRFS/eRV9UTz9/6upk
         uoSA==
X-Forwarded-Encrypted: i=1; AJvYcCVHyp6JuADFcm/BRd2VCxiaXgKhjQAK73siOCsJnWR9XIxgddCBsVblr4iFzcRr4IZESYpnhNqgqA7ptvgJGg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5y5REagE7Ckn2C68qsktby9bUpFV6NGT1gdmFshu/BgeY9Bbp
	Rz9hdjheKqYaVbvDz1ORnftJqWnSNrf3/4naiEXnAIWrkC1OYTYi0PbD
X-Gm-Gg: ASbGncsiCYNdsi7oxPjqOoxDiGMNz5fdNIAema8hWxHYO8hf8aCb4Zed6RcKajIibkk
	FIMHnfGTjMD8VwcuwKqPV1tnMwojL1VBOKdqrnF+XoSnRoaL2GrGk3wjn548yd0w2VUMB9eYbQK
	D/k0CghZFGkbzQLpEr39V9sMZLeUHIW1B971DerNx5R1aNdHBDSd0b0km4IPRx+bV+K77NVfwfm
	7a8dAEJ2ekDu1kbqaVBiWQ9is8eKpNql0PflGBvZa+aLhCS1hLwuUB5U9cNOpZLYsA64WI9HYeD
	AsyodxtXaX57vwSGiO9fHp0dh/77s/+6OEbdIA0DOqkYgZfORDjm0ww6POw+kbdZVytj7rXqBqs
	Nv9ljlbDe8HhapB6NNNqHFoHhhYDJ5LDvG4/azHCTGx51vQThL1SXhoIN16VIBC8/AH/G7fxKCX
	Kbgtjd7VtIIvx7DwGvTPj2T21+0IItn+E8mE2PUw92
X-Google-Smtp-Source: AGHT+IFunXnBzaIJ7qrKtAE6gbgBrOFa4VRfMkp6LkyD/4SrkyXjB7CJEnJPFtNdz/EbfuiOOJHk4g==
X-Received: by 2002:a05:6000:22c9:b0:42b:3aee:429e with SMTP id ffacd0b85a97d-42cc1d62479mr735235f8f.56.1763703952714;
        Thu, 20 Nov 2025 21:45:52 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9190sm9239273f8f.33.2025.11.20.21.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 21:45:51 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	upstream@airoha.com
Subject: [PATCH v2 2/3] ASoC: dt-bindings: Add Airoha AN7581 AFE YAML
Date: Fri, 21 Nov 2025 06:45:00 +0100
Message-ID: <20251121054537.25796-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251121054537.25796-1-ansuelsmth@gmail.com>
References: <20251121054537.25796-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_214554_518880_EB3AB35F 
X-CRM114-Status: GOOD (  12.61  )
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

Add documentation for Airoha AN7581 AFE YAML schema.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-wm8960.yaml  | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
new file mode 100644
index 000000000000..ebeda0876280
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-wm8960.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 sound card with WM8960 codec
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+allOf:
+  - $ref: sound-card-common.yaml#
+
+properties:
+  compatible:
+    const: airoha,an7581-wm8960-sound
+
+  platform:
+    type: object
+    additionalProperties: false
+    properties:
+      sound-dai:
+        description: The phandle of AN7581 platform.
+        maxItems: 1
+    required:
+      - sound-dai
+
+  codec:
+    type: object
+    additionalProperties: false
+    properties:
+      sound-dai:
+        description: The phandle of wm8960 codec.
+        maxItems: 1
+    required:
+      - sound-dai
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - audio-routing
+  - platform
+  - codec
+
+examples:
+  - |
+    sound {
+        compatible = "airoha,an7581-wm8960-sound";
+        model = "an7581-wm8960";
+        audio-routing =
+            "Headphone", "HP_L",
+            "Headphone", "HP_R",
+            "LINPUT1", "AMIC",
+            "RINPUT1", "AMIC";
+
+        platform {
+            sound-dai = <&afe>;
+        };
+
+        codec {
+            sound-dai = <&wm8960>;
+        };
+    };
+
+...
-- 
2.51.0


