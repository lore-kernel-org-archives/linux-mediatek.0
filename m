Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA7BCD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 10:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0Ft7gJMIMDuyFaMl73MCWCL0VnoY8SMUukXDjxNKP4=; b=poskrJROrMOzTeCJY1iVZjPhs+
	TsJDqX2Ahb2+RxqdxyK1BJIUmeOqF40rTZRrASeXs1TDOqQA1yWkQlGDvf07KjBdxUg4XWn3EzwfQ
	5MLTDg8/y/Qqqn3KZz6N0RvzTtxyt4OSX+1ZyNrF0vVIdiDsYK31u6BgVqaN7rCVKqD+FE5UGTXb0
	iSWG9gw9oKZwae+pBAqhekYyWdLSxJ646vMcrp9RrS9ViPa9zT3zWbBaFtRq55rtD37S8vy2GwKEi
	Ba1Ds5DH4Zam+B9sXu1MNQkwUOCvJxnFI4l1V+DDxkcbXR3KBoeNP2H3poJymna5brcYExGVF4J/S
	qR0ZIK5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8UC-00000001NZ5-3t0g;
	Tue, 09 Apr 2024 10:13:53 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8U6-00000001NU2-1hZ7
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 10:13:48 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-343d6b55c42so3701697f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 03:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657625; x=1713262425; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0Ft7gJMIMDuyFaMl73MCWCL0VnoY8SMUukXDjxNKP4=;
        b=SYFwrAg9rs7gsTRAMxXYrUD9+hQrscYFOGgdWMSK0AEr9P0QFbGUWWmu5duO1dj2IW
         43su84PidRCLuXyTqxwVU9aOe5Hka9mbI7bdSBRWQATxyR2jD4lXR4VyrcAXpXtqv7ib
         lTahsFuqiRFUKShxZ48xkxDbhOwmc4ueLQv1Te4xPF6nH9Cqk5tqb57uyusHT3FWPC1x
         0KxhUtLWU9TZc9IuYOsK5dYWUD+j0QvJYwUm9nZulWY57X5Panmy0UaYlkPEicJOPaEs
         WNXATzBcDT5OtbhOEgHaegbGXcfxSlzfP/vTOK5f5/UGK1fPGKzWRXsxeZpAPUN64QtI
         UENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712657625; x=1713262425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0Ft7gJMIMDuyFaMl73MCWCL0VnoY8SMUukXDjxNKP4=;
        b=u+DEpPRLLAAbYATEh5uMCXlBg+qyz6HuX7Df5+rdtwzwCfx8t3bqOFNvSmzHbxERIi
         rtKIBCUnN0EWFKTd9GyObthfEFf4jFgcoVaWxUBXdAh5q6qnV+zIHxRfKFi82snqD5wk
         qZ9qL+lD8fsCgwLdTbzR135tjBE24G8msHdncFxHE+NBW/fH2cwE7eh8t63ry1SBxgiS
         U78XKaYPeVKhKjo/ITEq9SFBIilp8JdD2hxTIo5LiV0zkm7AJX1DbZnuVLLpmvpMcagb
         V3qS3E7q49M7dtcwYECG5/r+XLouVmWE9tj2NJhqSNibmt7heDb9kNXmpGultpvdWhjv
         OuLA==
X-Forwarded-Encrypted: i=1; AJvYcCXh1igR9IfiJ0qXB2Y45J9CDi+MZwYv+Y/gqb3RCoH3H3/aP+mMGxJefSNE/9HmHEw9m6mqZ2G3tzhuyUi/bN3rkkDNEzrX74zMo73EveYUxPLF
X-Gm-Message-State: AOJu0Yxu7gVGjPmtJ5ZagTAmD/w+FfLjJunBSeyQWj3hNHy4hlkDPztS
	OVLEbMisQbkD+wMout3tPlCaump5YgR/oAiKaiuTbZcW4w8vldsjUHYLnXaX5q0=
X-Google-Smtp-Source: AGHT+IGK4AiPdoPdK/Nj8GgRRQnhRywKu0i7mdq9xkLbTZkIIeBqZ5HZnSAGrmuyoOY8FKcwZklQHQ==
X-Received: by 2002:adf:f390:0:b0:343:5cca:f7c7 with SMTP id m16-20020adff390000000b003435ccaf7c7mr9025258wro.41.1712657625053;
        Tue, 09 Apr 2024 03:13:45 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 03:13:44 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:24 +0200
Subject: [PATCH v2 03/18] dt-bindings: mfd: mediatek: Add codec property
 for MT6357 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v2-3-3043d483de0d@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=911; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=m2WMimLT+3s6slBofqVAvaqLkWzrgGp85vJbqpzM2J8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTTqCdhPMIFZWlG+RUcAbHEDXlIAWarybBpGWPD
 AT/xwJeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURQ0FD/
 421AUS7r15gqz0cDoSJUWf/NwqPKzmknIY7/gc2AzW6uV9A8lGiL5egEUbMbau1KaWDGym8HEA9db7
 bt7tplgEVwqLq6K5RR/JF9K6zebQp0T15i8ijlHrf51CJS35ez4zXxUOr+PLROVdryvRQLvplLazH9
 q7L7vJVYUTpedo+SJR/hMzHe9KJUk4dvZQeVWKEfwyLX0RBdXBXoTV4EfPr+6/XUvKdgC01ksee6ji
 bPWeUyBm8uUbEOT2wL88gbnACMBIsw8tWU6SY1HcDQopSUJ2pHhavISuUd6Lc4zw6gAo/tapvBqCRz
 Yfqy6/i2AR1JTEcEH3SszNFHYUNr3ygXClDnMaUUk6amncjDV3vrHzYOnX93+niYjEIteSh3e5Ht/N
 SOk0kI+N7lj7gwOzVskKLRyUcLdZK7EN2KWfk5rxFDLzl+tX4Iea/7wtMwCw2F7RCOaDnXQtod/Vlr
 NymwDc0vagUQE4BuHF3eQMFr88QYoVkBre/JUc3T2taGZ0Tc7UHAWDJkYktyTSORMuluCCZjljK9o0
 ClLwJMrSiPYIqf8wzBU3uTNoPM8z4CaHZC5e2UDUjfdLkzw8pvxwFuj6I0yLU+CUtuBBvj06SNDt0Q
 h7H9SK62oWBZy/PWQdW5/h4z1d06KaN7RgGcNsKWBrqyFCUwYRTSPS7KJEDw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_031346_511112_6C2516D9 
X-CRM114-Status: GOOD (  10.84  )
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

Add the audio codec sub-device. This sub-device is used to set required
and optional voltage properties between the codec and the board.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
index 37423c2e0fdf..7c6a4a587b5f 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -37,6 +37,11 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  codec:
+    type: object
+    $ref: /schemas/sound/mt6357.yaml
+    unevaluatedProperties: false
+
   regulators:
     type: object
     $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml

-- 
2.25.1


