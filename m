Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE2EC27C77
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 07:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bNfBdFp5mZ2kI3ADKPWjh4YaxvbI3ApUdRoUcOWyZQ=; b=a8cNBtzmyHlHE5okKzhykR63G6
	BzpX3PSJ+3fQDnuQl8jQTHIVT4pZKeUphnF6UL41lX15jwjgj4Cw6fBEFyIGyFGWb+xe7gXV8/4pk
	RC1edYnEZE6pVmmTV7r4PZ+cfoGBSBtUDhu3m4v/4Oebq/tAPNTNaSAD+Okoo5L/MaN55bWIzacdZ
	E1+K4m4aI1GF6vHCWiIMpFmdCVzcyJkv17ZMS6h0M/UUKS0JcqLnBiOnSN7aDtRIy9H7C8X3q4I1M
	jCq/QCiSG5yJgdEroyCZPWzzHHTkYwlcxwm0tIDvHSpFqCZ9X/hGGvx2B5sos4LT49htsvafkyPZ7
	LsEGqPuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1MS-00000001mCi-423r;
	Fri, 14 Jun 2024 07:28:36 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1Lz-00000001lr1-0Lxn
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Jun 2024 07:28:09 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-35f27eed98aso1658233f8f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Jun 2024 00:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718350085; x=1718954885; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bNfBdFp5mZ2kI3ADKPWjh4YaxvbI3ApUdRoUcOWyZQ=;
        b=WSeeXwzlDJXo7KGNNOPsfZtPfl6QkszUhlAEBQ2P2aiRFcBr+6Icb3mS18isRTVlEH
         eUK8GOtUBWoDhCM1P8V2DzsJHbpcSHqIsD7cbM/c2z6EVuatVhgqcMe7iJCsQnL7StWw
         36HyTE+aO/NjAkfd0BNiNYCz8ZJwZHKSWuMHWGayivtpk0GoUsiVfbK63mDLwqCvuTpq
         us1sWoZwXYihQ1z4fy8A9KlK+kChy9mDqC+CNEb42PAfxnMGH4CLCL903QKKzKckyeQz
         n+5XbAZqK0b+V30iR9InYyn6soiKhH3Bs9Hd44vN5YyPOdqLXBGdj7qe9+8ohRPYVcEn
         rHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718350085; x=1718954885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bNfBdFp5mZ2kI3ADKPWjh4YaxvbI3ApUdRoUcOWyZQ=;
        b=h/IrodzouWG+qUxCMNsHZ1U+HBS25vqx3RZbGfeGCp4UgceeJ9NwT6FTYqBxZ704cs
         AxyxK2zxaVlxZxoQ0zIgqgpe/xYqSqd2u912iRgOhgRast4ngOAe4OgxuJWazJttD8a0
         j49sqibGY1m7OFCFxI+y8yD1vBjRPm1+ZZjziu99gdj0NqFxDL/aLHkeKhLo0tI/mox0
         yRiJ/5gSWVx7aliBDQQ2RL3nF+oQT2W8+7PEBSyhIzk0VtSfSuNW0GDw/FCQBCXybAKR
         frKdIYV0I/hy18rxqPl2JR/91c59SQSwxqxTrMOb6047mds6CFBpkxatb4Rl1RStFMMf
         HbqA==
X-Forwarded-Encrypted: i=1; AJvYcCX7tiUNxFLRZ820/5moTpeT1XmgliwK92mmind/c+77xQJKLVkzwcekw4uyYMjamff+HOOpavZnuC7xCK5eVryjRs+B45KBc2eq4HJsaFDdXlPM
X-Gm-Message-State: AOJu0Yxukn40uqG52niwdcAu881nMomqA1lR5Vg3SwRhYJjZ6X/Kh5G3
	hvujxTLRgzE1ghsAk6zGAJ1ZE9sMLkVf4JKs6PKaEfBmQEc8Qyd8G5hKOtPt+wE=
X-Google-Smtp-Source: AGHT+IEJND1fq1c0uKqBp70d1/dGzZI9xAGs92ktXXTGZKoDsZNDhRjzQbdqX2LqrYMoStDa7YrhlA==
X-Received: by 2002:a5d:69c4:0:b0:360:85d0:3c86 with SMTP id ffacd0b85a97d-36085d03d20mr176336f8f.6.1718350085366;
        Fri, 14 Jun 2024 00:28:05 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b2esm3535773f8f.101.2024.06.14.00.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:28:04 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 14 Jun 2024 09:27:46 +0200
Subject: [PATCH RESEND v5 03/16] dt-bindings: mfd: mediatek: Add codec
 property for MT6357 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-3-54827318b453@baylibre.com>
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
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2491; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=SWDpxVosRWcwhcp5w5dGFmY/1KI8cAMYk3ck/hCfKf0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBma/D+I/oKQQm6/M7ruRFFizPFoZBPidH22eCRZMP0
 T2UcWeOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZmvw/gAKCRArRkmdfjHURdZND/
 4ylZ5IPjy/OzFOUB5PNaiFxsROAj8BRd6HcqJlZ/2ZUC2mfkXuXbBugwiP1VFhFowX7vkMBEs+NHA5
 VXIIsNhRUhKOslkiex4Olf5lQLp5QC8SXUTK3mESQ4I05ZRkCeunC6AfovEfD1iBxTVVdRoFXWK1Pm
 9QPu8EOCgbTiYrdcCKvSVbQ5ptTP8gUJE3b+R7ZnCxpXjUYnm/1g9DueJdCyC8fkNLML9b3oRKimpC
 E8UDv4drqCLmiQoITi5kAzkyGGIMOQpvHmw4JEopQZw93Nr/HtQ9gyAUy49GlqeSQydzINPTXnRbn0
 //VyP+7paab5PWOpt+Mfw/LZxWLzX56r0q96ZUjCt3rsbv0UeBKDNQ1qLXWHJ9Ow3hfv7MV3E7/+6V
 w3RqXLQ5Vq5ePUAY0Zgt+DJexy37wmkm8cH7wseXvQ6Am4X+XErXOd27NazXPKa+t3PuwF8umW1SRz
 R8PiEHvn7pnhRqtKY20Ixabqz2aI1gBIePkL6+q3KdRgXf8AumZ0VQ/JwGMEe23sdtsxsF6oAK8wct
 ubSpR4kJDobcgaLpB+CA11yhBhwdIdNnuLbWzhnPEd0+bgftmcmch5tFsBW+JvnHblWC6GCDUZRcCi
 bv70RD0njpP+E9yRWCpE8nhql4GtPTc0J/f4GPTaEuhe6iso3d09S5tKtYaw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_002807_231646_CD8BD241 
X-CRM114-Status: GOOD (  11.16  )
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

Add the audio codec sub-device. This sub-device is used to set the
optional voltage values according to the hardware.
The properties are:
  - Setup of microphone bias voltage.
  - Setup of the speaker pin pull-down.

Also, add the audio power supply property which is dedicated for
the audio codec sub-device.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6357.yaml   | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
index 37423c2e0fdf..d95307393e75 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -37,6 +37,32 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  vaud28-supply:
+    description: 2.8 volt supply phandle for the audio codec
+
+  audio-codec:
+    type: object
+    properties:
+      mediatek,hp-pull-down:
+        description:
+          Earphone driver positive output stage short to
+          the audio reference ground.
+        type: boolean
+
+      mediatek,micbias0-microvolt:
+        description: Selects MIC Bias 0 output voltage.
+        enum: [1700000, 1800000, 1900000, 2000000,
+               2100000, 2500000, 2600000, 2700000]
+        default: 1700000
+
+      mediatek,micbias1-microvolt:
+        description: Selects MIC Bias 1 output voltage.
+        enum: [1700000, 1800000, 1900000, 2000000,
+               2100000, 2500000, 2600000, 2700000]
+        default: 1700000
+
+    unevaluatedProperties: false
+
   regulators:
     type: object
     $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml
@@ -67,6 +93,7 @@ properties:
 required:
   - compatible
   - regulators
+  - vaud28-supply
 
 additionalProperties: false
 
@@ -81,8 +108,14 @@ examples:
             interrupt-parent = <&pio>;
             interrupts = <145 IRQ_TYPE_LEVEL_HIGH>;
             interrupt-controller;
+            vaud28-supply = <&mt6357_vaud28_reg>;
             #interrupt-cells = <2>;
 
+            audio-codec {
+                mediatek,micbias0-microvolt = <1700000>;
+                mediatek,micbias1-microvolt = <1700000>;
+            };
+
             regulators {
                 mt6357_vproc_reg: buck-vproc {
                     regulator-name = "vproc";

-- 
2.25.1


