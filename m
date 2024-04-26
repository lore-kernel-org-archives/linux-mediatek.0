Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4813FC41513
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 17:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5h1cKb9Wd4tygVd4523MaRapeEHkSuSBrFUYOzLXOs=; b=fidJn0syjNcIHvfbsbp50kC45s
	ZrBUPCptcfBrekIJMo9dkmpW5Xuw4iU9llmdHMHEIEYEk23ly37akq54GYLXURAcnrNqlSXiVspUH
	8eFwqpS0efI54tuR7YIllzw3SOLRL5d6c0TaO8gUG7+QvkcF3oNVRJm9znjk2frTXIKns6H0k4Cic
	eJKhUnFpRu1/ZzYtciKu5TVSnKHrbgtblZQp2hRsknqtf68afRX4oOlFhzW/0yCcfwJQOtq4AIqm2
	2V+udGplfUma/gaxUFwLoMiFMQJqedhfawsudQ5To7C4Ra/1hqxbEkOZNiisWXRNVErJrlAR0xiU6
	HsxFsVyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0PIK-0000000DR4p-3Hgc;
	Fri, 26 Apr 2024 17:23:32 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0PHY-0000000DQWp-1fXA
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Apr 2024 17:22:49 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a52223e004dso278911566b.2
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Apr 2024 10:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714152161; x=1714756961; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5h1cKb9Wd4tygVd4523MaRapeEHkSuSBrFUYOzLXOs=;
        b=kUGrXCzQYPfmkbybEY27TI1qkX8167IY8WCqkYjWybEk/kuDXqBpoogUbDUIQfsrIJ
         Zp8WxlzqbAUNVUakxEg2iz0qCNw4sZR5BRB7N8Oo1ma1a8qLBjws6ERSm2P+LDtaW0+b
         hrmRK4g/peZZ+89Ymvu4n22s1j26WS/+t8l3iLoP8egbjn5E7gy4NS88U+8WwHMQoNzT
         7gk+qHN4JXq970On2NcpKNbIS683S+a3sZusbC3FRg2heCgnETead1uKFgAAaEqVUMj7
         80ymePBMcWXtMm1GvodZgRKTNmoPY94om7983lYpDsLX/ySz6iextgXnk2eKeLIeEFc5
         +PRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714152161; x=1714756961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5h1cKb9Wd4tygVd4523MaRapeEHkSuSBrFUYOzLXOs=;
        b=fCRQia4Xc/hQeATghSuGHBCyx5OQNejzlWX2WRLFTCChRI/1D//vsNceL6rrS1xdYu
         cSHeYVLhaPFTm1mS5c5wFtzPGKs4hPu3cCmECsBauPc3DASz6ilTFpiDY1oDuBt3TJ/u
         Ftvn5+kmaV2X0Oda0YY5mQwrgUZomu7ovM1yUjvSxFEYtkW6GtAnRsUh+8OGa8jaFO5a
         SSQZKsUqbCAysVgBnUN6f0CicmpC6leLAqTfeqU5xkKONrUsuyw16TIhx8E4FuOFJFmu
         487jN5isexaKXK9w9hHzl7dtwl7zxMK5ERRdtGG7DQraL7aG0OKeN4+4l+bkTkMrjjgV
         vgog==
X-Forwarded-Encrypted: i=1; AJvYcCWKgOcj/syohmQ1nOoXOIIzMoPiYXhuDBJNAxtZni2Hp4S4FvKsJS683IzqQ0YebyifcIReD1FIUYdZ3CEC5iVei4fKtY5gbKkZ+RhNvlsvKNax
X-Gm-Message-State: AOJu0YwBMAfI1h7wRCnmNQCxNU7e710cztC/DJ+utEFN45dDN3CL8DYB
	Smb0VH8LCKfciALxS4hDS5NPyHLFG+EKIYvsRsI0G20my1YwzPq/mL4VIwJJFeE=
X-Google-Smtp-Source: AGHT+IEn/eMoitApgBUgg8pUEzJGdQivGCLI6Ph+rcC2EpA3138fG0ZSzfIhKnaXEIqhtSXOiOuDMg==
X-Received: by 2002:a17:906:dc91:b0:a52:2e08:207e with SMTP id cs17-20020a170906dc9100b00a522e08207emr3002872ejc.77.1714152161629;
        Fri, 26 Apr 2024 10:22:41 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ot15-20020a170906cccf00b00a5239720044sm10763363ejb.8.2024.04.26.10.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 10:22:41 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 26 Apr 2024 19:22:32 +0200
Subject: [PATCH v4 03/16] dt-bindings: mfd: mediatek: Add codec property
 for MT6357 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v4-3-082b22186d4c@baylibre.com>
References: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
In-Reply-To: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2270; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=hb4Sc+m6+KqrDRmnsqru9xwwm6vpFvEeTj8R76uZXcI=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmK+LaLpQM5c95jo6O7Mo+/ZZ15lOssjMuNjGmsrwq
 VNAKjCOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZivi2gAKCRArRkmdfjHURUkqD/
 9szNNvPScpI+ZPCLaKq2JhlSvxl7NubkybaxFDnbZZN5rZuWJjf3Io2EMZp7xgPg9qvwuCSnjf0O3t
 t6KJTT62Cv8K2HaAZEKUmTxf94dY9Mb/mpJm99n5WWjRIOt/aUxqpILst9spy3IDLNJZoX2wLyDUaG
 Ss8Uz+FKMTtzzZ8tK9/7ZXmGWjbHGLeUGXz34zmBWK5+rIuudOEwNNX/9xhxv77tVzD56pVjb7ubcl
 baF6fdn+n7IIQUccQVCnNHxAMrqCQuz4jzLWBYbhAD+EoIoe0y36ZCQwPsV2v5vDXwm92uhpAhic3X
 6oV/VYIluV6Ygg8FzWGuC08vXaJ5hASpczPT2S6ch3wLq4ExegtWFXHv79MIyW8N2griJ0/iSwCNZU
 2eeDx7Y3gqi/wHeQ5n8tIMIHIsVZsDRdIWXnT4VtYIpMyrbzj7QsETPB9zYm1xZgzxu/ElYmitgrtp
 ZoJMP9sj+fAVVZBWeucdazDEgK8G2IgL9s49TRsF+PXDGL1lePzQd5/9qynOZY1lUdzQxXqYgumIgd
 jwTnvGuoD9VvOwCwzYdLWm9d0YyigwuzHOxDI6Lk3CTQCcyc6kMBbNKEdnLW2PjT389M+pivjq9YYR
 l7TvJ7oZDeI74NRSKU4Az7sXeN0HebsBq8sfnBReTVZqRJGxs0bWpZWik0Tg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_102244_729798_2FF848E3 
X-CRM114-Status: GOOD (  11.08  )
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
and optional voltage needed according to the hardware.
The properties are:
  - phandle of the required power supply.
  - Setup of microphone bias voltage.
  - Setup of the speaker pin pull-down.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6357.yaml   | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
index 37423c2e0fdf..30234f13a810 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -37,6 +37,34 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  audio-codec:
+    type: object
+    properties:
+      vaud28-supply:
+        description: 2.8 volt supply phandle for the audio codec
+
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
+    required:
+      - vaud28-supply
+    unevaluatedProperties: false
+
   regulators:
     type: object
     $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml
@@ -83,6 +111,12 @@ examples:
             interrupt-controller;
             #interrupt-cells = <2>;
 
+            audio-codec {
+                mediatek,micbias0-microvolt = <1700000>;
+                mediatek,micbias1-microvolt = <1700000>;
+                vaud28-supply = <&mt6357_vaud28_reg>;
+            };
+
             regulators {
                 mt6357_vproc_reg: buck-vproc {
                     regulator-name = "vproc";

-- 
2.25.1


