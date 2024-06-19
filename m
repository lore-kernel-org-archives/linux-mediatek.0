Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C6DC2BB85
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 14:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bNfBdFp5mZ2kI3ADKPWjh4YaxvbI3ApUdRoUcOWyZQ=; b=L2HIvyXygYpuZjoniDTa6MirdI
	Tdz1q02i/uJrWXWcSCVINQuj81J1nOc9ap/cWqapa5B9DMTluYu77c/TjlCFOzVNPAFBSRdkVPX46
	NZvhL9PRUF5UnCunFb6nUdLEViwFfGHxjlgGNcqbmz3PvBX0LPkfhnmHe7Frlu3KHbdPOHXgA4Jlq
	j4MdUznag20H+GmezWHcGZwvwzn4M8rHtdQMtXKi4KeYnoNesQIlY8JrWsIFyiAorxaEpU7o5DGfv
	BzDXn/z4N2Ixaf+4SMwjspABfyjf7VOF3yIVXyMuHVl6C7ggkzsby6aOlA6wFzUYPfDg240UJDJRy
	ks76/dKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwaq-00000001dLM-2KdO;
	Wed, 19 Jun 2024 14:47:24 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwaJ-00000001d1w-2Ixj
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Jun 2024 14:46:53 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a6f8ebbd268so165457666b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jun 2024 07:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718808409; x=1719413209; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bNfBdFp5mZ2kI3ADKPWjh4YaxvbI3ApUdRoUcOWyZQ=;
        b=jG7Z8iU2y5+aP9DfDr0tzUEktCZ9rRv5n7oHLlYuRa4hv+i9xNCfcgm5faZiJICg7m
         aINrbWsAw2YoXiI4MUt4HJaog8ihQuqZhM1Z04CeYq+XLRcZCwhBX9FeQeR6rYb7AGZF
         Hp8vlq3LfUDhm103Y21Ho589dHJlJ7bN2r8IHGC8/ZI/TKTj4dfnujkvWmO5XLNhKW0c
         67kdk899K6Y9jIKNWSVn6fB5HgiNKBcSi5R47czeIDyBUkGEeQHLq7djvlOKtFa5n40a
         OhuIOQ8XIvReaEFBj+3lbDtFODn8aP2ALP5Zuoo15CqEjv6OtJ8TLHmkea33sQHpXoN0
         DoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718808409; x=1719413209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bNfBdFp5mZ2kI3ADKPWjh4YaxvbI3ApUdRoUcOWyZQ=;
        b=keaEc8XYJPDkRDyFx01Hn09cqGhz3HPFo8pgs5J2vzs38uaANRA9Tv7kWLlPZnqY9U
         I7yEvaA6ulA79dM+jkkzuLCu89Degh9HuKAKvq35QwP2YZeCdXF2ORi/sraVz2CuZX2i
         6WWxpFvRD84llYPy3ROcTRYVrPJV/ill+YYVQDoWQasKrPMdYIhQgWC7LkMioYDUIm62
         fu7yVeSlZLo8l+gQOiTIoyGFBdYKqHvBm9VmVW6qIStLEZ4NPFng/kFv4M09SDvvEor/
         6pJINATAYn4jdkAv75O/+I7l4t4gEmbTE2NV8FwmC5Zt5RJlO82XvG6kmPYpejaFRGgx
         M59g==
X-Forwarded-Encrypted: i=1; AJvYcCWa/4/xDMCVL3ejLFoA4JNf+P8sF16+q0cXAPPH1bCo1G0YpBOBkl4TBnI+g407JRHZ1b9LBJnVwhjcxAk+g4QwF7Z/RSJ4EZYAAsGXjSGG3R0d
X-Gm-Message-State: AOJu0YybBPkEEW/nNVlziMg8bwkMi2oZ2FYw+JqN0eWPcN+tr98zaoEy
	H1Ks63Pwr5oytqCM0I3F9gxic+e+L13VM1YVnuyTAt3FS8i2pw7MgaCpJH9lPK8=
X-Google-Smtp-Source: AGHT+IEqbkgHHSkr76X0mYyJBfUpPDdN9txmatsoq3rJQUzm/9BdsMES9B/PEOaOBd6jfIHg3AGJ/g==
X-Received: by 2002:a17:907:1887:b0:a6f:af29:8d60 with SMTP id a640c23a62f3a-a6faf299090mr113414466b.2.1718808409118;
        Wed, 19 Jun 2024 07:46:49 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a6f56da32c3sm679787566b.13.2024.06.19.07.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:46:48 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 19 Jun 2024 16:46:39 +0200
Subject: [PATCH v6 03/16] dt-bindings: mfd: mediatek: Add codec property
 for MT6357 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v6-3-f754ec1a7634@baylibre.com>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
In-Reply-To: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmcu9QI0i0OiF8VYohADgb8z89zwTIuHnJGPKpXLp4
 Qxcv4WqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZnLvUAAKCRArRkmdfjHURVjvD/
 47o1wFtO/MX9Mn1jUZZQNx3N0YH/5/OHi7NghWuFvjOuv8lbyavVmqO4XxRjg6FXgHm36BstV/oZGC
 9FwTaixQpKNpb/clIOQV9JdHIYNxrTLva64korNqz2oUrR1LTubS2zelRWDSvKOv22pXPdV3P36FuR
 NWQaB/IzxKR33NgNb1Jhm3RKmkozk1NOu924V20WIHg6NIAXnEXgM7ZJ1exJtFyXy2xre8YKLg5JYW
 mFSpJoOEDvmaAp+WnNu4uAx6Buw2diS0Og/6PHy9Y+E2Y0TsXD5to7mfw9mJ0/VLduchVm1B4qaGV6
 xhthu7ePjErq/3euvoslGHaSS7fj18hJgQozXdIS4fJsHlZEnCbK8loJTbceN0pk61F1mFf3v/218M
 MY6mgLtbZt3GWOMS32pyWUvZ2TO7OLlYMDmknXyJ9Ixk2raSlHDJr6NLmgYdMETXyrYci+hRcLrHqV
 s3+b32VUtjoJS5EeyteW4/YfEYKjMi8p8a5H1BswAYyApuSFGO8D1vB1ELkFy6WExEQq1Z4NOjN55+
 Wy0+TzDIhmBXiXM02y5bOC4OCu9GS1brAJ8apQNFKhDo+yydxwlfB49gxa+O1j7JWZIqKiCbk33Jzf
 CtZdlPYmWP8n/ZMTIRnBLo7jfgADK8r9FFrMsAIui/aDrKdOmJt9nj+mD19g==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_074651_676119_6D8CD65D 
X-CRM114-Status: GOOD (  11.76  )
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


