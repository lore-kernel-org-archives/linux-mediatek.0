Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6455C25B7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 08:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bNfBdFp5mZ2kI3ADKPWjh4YaxvbI3ApUdRoUcOWyZQ=; b=Bcb4gTipiI2TFKx6jpXRzunypj
	JUfXNamgR8Q/6vEUM5b6cc2khY/qco75jR8eT/Aq6AI5NYqxdqUCPwzBgwuLDGJ1AL7W0kVpp4jsu
	8i4h/RbWhnyUiuyIRwLF2TrG2Aoy3hfVFLjbAdXqOiXNfn9q4EgwTrDLPSwKIrHZZpF/P0cNSzZdL
	IRIjuTTmE6J1dxvfjboORRXINnOJ4TO06AduXr2R+XoWd7s7lGoVOnUd8tHScfuwE5GA1G9dxuYhZ
	RgnmZxgQEXnJ82mH7M8A/kKDYs+j6If1uz/lXNJS3msOQ4tc8KtpjlKo/fKUkq23qTW0gNQKtwmSn
	PFnSwkhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA42h-00000005XGZ-3P12;
	Thu, 23 May 2024 08:43:19 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA42D-00000005WuF-0RNc
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 08:42:51 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2e719bab882so57488971fa.3
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 01:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716453766; x=1717058566; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bNfBdFp5mZ2kI3ADKPWjh4YaxvbI3ApUdRoUcOWyZQ=;
        b=hpbptSv/IH6/Zqom2UtEZ4CEA8BPEGlDJxjmh1PTEmWLk7YR5DhL/T5uuctWfPfODZ
         h1rSeo+71tl7CI2ZDMHgfeKuHu0jUpqnHhYLX6Bzz7ik3CeLc6U5tH1PlUXgqwuNxBkJ
         f5yy5z1Chi/q4BezdBZtQ9A6Pu8u/u3uLJybU0cgYoWQVNHDiVR2EyIx9Fpf0walQx3i
         YWRBmHfU2GnngSpS8/hAY+nC/1xIWAeL8buXrw2szOjpipqLbFdouEYyf7ybftS9638k
         7L9RphQAq1MfjB4zcbBozO+e0waRQTgDim5QN7Q9wayYq9IoHT0Gt3UFmWxY4CI7INc0
         ISmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716453766; x=1717058566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bNfBdFp5mZ2kI3ADKPWjh4YaxvbI3ApUdRoUcOWyZQ=;
        b=sIVXvo6aZxaOIwdSANcyUxlho8T23LPYMTDnSfHO7S5sb/vM58c8dsD+TQ6ve+RGo8
         aPRKt4dqvydkKOrRRF4PVWob9CgttbaWrEnoGTkCYZ32/abC8XMsV+6f15+WO4/aUMry
         YhrAQchdOLQ03tGNaD06y1wFBne2tJtcjKswUzqvM8hVa5ygVPG2WXjRvrWaJ4trcgSY
         f/1lY7V+jwfezMTJ/d+jkLiDNM14Ab6jsX6QstuyVhURkM+msr+FBQkO8jJP6zosoxYP
         rbJ/cG7mCvWDs4FsnPJfmwj5GzPNlaBs9+Bd/YSLvfKmBxzI+OfrP5dsEzKvfeWOM2g6
         7dNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE1MVGkFQVJM227LkxaDozy4EL9glk8Rbka6QiwCZSkZ1EPBq+MU+1/yFcbyKFGJmXzeynOgxOOZzQ4xT8UbnbUEWuHywSIQIk08FcQdxHxVWd
X-Gm-Message-State: AOJu0YwQ/SKN0avY1isri5xZcwfwO1R8heLwK2mA/+Ag8aWE6yE2ew++
	wIw+ccpfZ1kYZkSjZ+926G581L0A7wvB5uAsH61BDitMcCMX4g3uUdsGaa2fcLQ=
X-Google-Smtp-Source: AGHT+IHNowzOZ3qZoho2kSi/7vJiotR/fYTKwFLPrVzz09lM6jstaU0wjaWz4fdm4OP8i9d1YJ82wg==
X-Received: by 2002:a2e:9858:0:b0:2e9:4c17:9c8e with SMTP id 38308e7fff4ca-2e94c17a021mr23112901fa.44.1716453766077;
        Thu, 23 May 2024 01:42:46 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42100f3e03asm18556645e9.17.2024.05.23.01.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 01:42:45 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 10:42:32 +0200
Subject: [PATCH v5 03/16] dt-bindings: mfd: mediatek: Add codec property
 for MT6357 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-3-e7e2569df481@baylibre.com>
References: <20240226-audio-i350-v5-0-e7e2569df481@baylibre.com>
In-Reply-To: <20240226-audio-i350-v5-0-e7e2569df481@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTwF/2jDLQ5TVCgT3uxzYK5mIuMk4pelcscFCox46
 O4PSEBOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk8BfwAKCRArRkmdfjHURYsvEA
 CmSN9uNEndT4vCn4eJmEUww7V0IRTwU4v0Mw+SaDo98QMKyZRC82P0ip9h0k1rl+Msvia+4zk4rAZy
 13Z91WE2oMA2cVHcf5SGoQ0ZXLHNoYcAUddHfGGfT8CZ2rViWDzWR6zArvkGvciCJ77pgHwIXdim7A
 huMZ6ooBhWPk4ailWcgwQhSkZSxM2M+odChO+8MwJ8HYJZNWsjP1qoha82hvRL7vmRoxRaIhq8nrG4
 /gUfb9KFRFNfOxHpFMfaMGtA0Pceqple5rLArZZuMapNcEeDDiCfgnIKnWiW5XSiXyQcoHFK+zBCni
 ZlGLrRngoBKrXUzJYnr/ms6XmMujszyAK69ZDqkuzVDx7fM0vFhbnqcr9dzniBXGS+dsokjar0ZtaS
 ozZxmNKs8mmIUMz9zBii6kNB8dcrdYJkJjYCqcxFV0OlIac0BzusXY3JlsdnfZMztuPgh8qw9OrUby
 96Hp/0PCCC41dSl4qGdK3tz1JkWZ1jKuiQIP6Oqt0fDPc4153wP3/+vM/avv8M86VMVcVAATtoKfu0
 1Yc1B1RlwhWEyFFWH3pZMBuSPol3pT8YncGUyPXggY8DPThSIFuIMNJ3Xye3ZqKsfukmHPDZw4/FyQ
 J/exVsb8byuoOAE/R+xKncX9afsOFLtbq77KM4eUdo0rjAHD3U8ucguSuRug==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_014249_609572_8511ACB2 
X-CRM114-Status: GOOD (  11.30  )
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


