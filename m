Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E00FC3271F
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 09:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHK/qxjThTBQx3yAiyF3Z2q8vhY+c5nKTIQAaD+D4oY=; b=ryImGj9zkDrlQ4h70zfFhCEOCN
	rLI2i8fZxeq5w90iizAUOI8Kt48iwiAczY+iSpJ9l8FUlLeBkLWLEBsmR9B/drYVpxBSJHnnk2Mh+
	Jb1R8ZZ4Iofcjh9LQBDHjj6JeAQAQU/ycedl8U/NbiceTF/tpRgl0KOhySzICIc1CEtWXqNO9DB7B
	bm2jtup7/ThsQbwNLel0a/o9bRPYZAjgxjEuKfmYa1sbFObghto2I77c4Lkz8pZZ8ZrYRZ3H7mAgm
	UM9aCOWj3tHt+rZEvWpq1rviVvFJ+vp2x1xLezHZkkTCNrwP1u/Qzte6g/8PSSKXeMmMdU0jZU8Eu
	iUll9DHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfhz-0000000FZpn-2HQt;
	Fri, 05 Jul 2024 09:58:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfcS-0000000FWbL-41at
	for linux-mediatek@bombadil.infradead.org;
	Fri, 05 Jul 2024 09:52:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xHK/qxjThTBQx3yAiyF3Z2q8vhY+c5nKTIQAaD+D4oY=; b=a+MhRR4x9+c5450hpfZsqNeGtL
	9rtfFtJbxrceLb0L/mYECuWaOaMrqhVopu/1vV6H0T30PpZvBQM90bbhOdrmhnlNw6Pdl4Fqof3Z2
	NxEjyR92VEQ8BCD2aYZ2cEGRsvd+00NLHXPuFDEH15Mf0Bg7wfk7ARNavYIv4CGenhhXQRcB5Gy99
	YpRF/Fq/LBb797pSXgXuOfX9xukWCAaaXHrLsCTamTt6RHw+ToVSeno9HteS7MxPaGWROkOahQDnF
	wpXVOkxSTAKTrEc5bYQGy2UImx1rlo7MwNo/vLCMmRZfKzuENbln2u/mmQG3K1b8KN6td9TbXW6t2
	ckzjqFwA==;
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfcJ-0000000AJWz-3NMV
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jul 2024 09:52:43 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-52ea34ffcdaso965565e87.1
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Jul 2024 02:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173152; x=1720777952; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHK/qxjThTBQx3yAiyF3Z2q8vhY+c5nKTIQAaD+D4oY=;
        b=NVeL6yge/Bt701bIaJ0crFMSRSwhnKRoSqZR2HDKmP8HQ0DsSd8VH5rYO7/qQkhV8w
         RTQKZOW5g4K8JP84xX+ovQe2C+elaDE/210IA3st0ILa+0YXHJwPA5BxP7CnvcrBA8cv
         Xw5xcSzo6Kkm5p29EUFjhTgQTALhVCPFlijEiRJv+bVXI5t5/LxIiQC2wupb98iu+quq
         JONuuNPegEgghWHzre8YtZSzh4cx5j9L67YC5QeQqh+ylbOT81Xo0InCBIFf5cckh063
         pzb+In+vv1XL5+kWg3/frMRosTc3O2dG0zksF5e+6BpbQojHMA4m4bhN7HxYS5xHs4BW
         wXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173152; x=1720777952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHK/qxjThTBQx3yAiyF3Z2q8vhY+c5nKTIQAaD+D4oY=;
        b=VKkQT8ihD2kQAVz45oS6hZwCs3nAK2BiAPjgpVdCtzUwG8U7m8HBs6MITAtobyjz7U
         G+qP9K/9aqn1YkndMSW+btX4dZaGDI4sb7YNxy4LZllG9qrtw9DS1aw6DIrw+GUHplKC
         dkVANUFCg16GpPYn8WkV+V2D5R00RhAG01AyGT1lmAoI/CmOCeZyEBASz3Xq/alFAQje
         ZxkHwXFXQZO47nKgc8knCL38SL6zBm4JJdUt8WjQXnYwDOOdgp0B76TxFk1AP8N0QLn+
         sOHB3a0TvIjyWSWe6rF4EoqClsNT59gVXVBcr0ELJIPvpBMHUK3A5BaBDaDd+4t2TLyn
         5PnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN6KHBXgDh8/wkwPRzk63dG8Q79jlIm5LMlZKbwtg+sHAbxBxBG2e70vWeQ6W0LHXZe02ZEbeKXN9p+QalyGa3x6SWjpgPsGgT+qt/sO0tD2Fd
X-Gm-Message-State: AOJu0YzVxccr02yaJqkWPpnyw4KplkG8XoZ9qyNsoDDvA8FesVTidOKb
	Os5/VM8Ed/jupKdntWP5V4+VAWYYfZh2vpjoiOn/l8QLx8UQAR59Y0qgNCB2FjM=
X-Google-Smtp-Source: AGHT+IEK1KKdTzbDztsnn+12R3zWG+9Jig/tlf9CjSDpwbnzRDyxiwqr84PK3eJ7qPGx/h4/oxG65w==
X-Received: by 2002:a19:f01a:0:b0:52c:df8c:72cc with SMTP id 2adb3069b0e04-52ea06bb625mr2380698e87.43.1720173152244;
        Fri, 05 Jul 2024 02:52:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:40 +0200
Subject: [PATCH RESEND 21/22] dt-bindings: thermal: simplify few bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-21-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5012;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XNyfNCGFScy9mZ8hCS/9iIypk5k0G+Ilo2PzHccYoHA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8I2NN3X7IIsqrtIAyFnYLzq5eiKU2FODdAu8
 m9zE/RImbaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCNgAKCRDBN2bmhouD
 11edEACVWgk06f6mBBoU7ppKmkICVWMkDHqhZC5XD4tsFEwEeWIGR3i9N/ehawoJlf81x4kZKoB
 m2+Ny3Lj0kk7pgw4g9zyXaGpdcoLuO6A9C+uH65ryVZIvClp65c3qVptOrtnlOWKSCI/cJwlo1X
 QE5WNsru4dj7xatBg774QL36pO4P5tsBDKEpges7jwlaDM1iKEC3TI935frpKvWRmS6b2JOTHOR
 njAs0ota2n81UZZcSj77goFxYTG+lGTG+2Agig6skKaZrMVvM3m9Dd3tEbYrIQPWSAaEXfRTYIT
 A/2y82Mf0UOlcYBMLrgcUds2Ntbx7vUOjExoOUsqbte8yyorWyu2OzYPc/zlkxSIq8gTj9knSHD
 /+wHokENvv7198RXplN30RIjc17e7n1RlWltCzPmeCB3zPwU2i1Y8DvDXGq5LnnxmeoT2E2MNlH
 PfH33sW0BEgVKI1gtXh2TIFX36/KFjQasf/Uitd6/5bRv/lXW0o8DmbyEhBBu1j6maxzKQe154y
 TsPoDS5ppoa4Z1JLQstMJzilHeQ2OPtUFmYr9EBqUYha4r92tpGW+XCBW8HpQc3iBr3Cx0/8ytk
 bjJaL5+cCMbFF8LF7lxgD4WSxwh7mz84dUgamDnNx4DT0txwejUAnJka/ck7TJ7n+iaYcQyN+bD
 RpN1eJkt201tlFg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_105238_691157_6E67CA5D 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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

Simplify few bindings which already reference thermal-sensor.yaml schema
by dropping unneeded requiring of '#thermal-sensor-cells' and dropping
assigned-clocks properties (core schema allows it if 'clocks' are
there).

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml          | 1 -
 Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml   | 1 -
 Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml        | 1 -
 Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml  | 1 -
 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml  | 1 -
 .../devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml         | 1 -
 Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml | 4 ----
 Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml   | 1 -
 8 files changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml b/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml
index 267a0f423504..32730211e15b 100644
--- a/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml
+++ b/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml
@@ -42,7 +42,6 @@ additionalProperties: false
 required:
   - compatible
   - reg
-  - "#thermal-sensor-cells"
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml b/Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml
index 2b6026d9fbcf..ddf0f20e5285 100644
--- a/Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml
@@ -34,7 +34,6 @@ required:
   - compatible
   - reg
   - clocks
-  - '#thermal-sensor-cells'
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml b/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml
index e02d04d4f71e..ceef318668bf 100644
--- a/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml
@@ -28,7 +28,6 @@ properties:
 
 required:
   - compatible
-  - '#thermal-sensor-cells'
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
index ca81c8afba79..79e691b08341 100644
--- a/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
@@ -38,7 +38,6 @@ required:
   - compatible
   - reg
   - interrupts
-  - '#thermal-sensor-cells'
 
 if:
   properties:
diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
index 331cf4e662e3..0259cd3ce9c5 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
@@ -99,7 +99,6 @@ required:
   - resets
   - nvmem-cells
   - nvmem-cell-names
-  - "#thermal-sensor-cells"
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
index b0237d236021..19bb1f324183 100644
--- a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
@@ -197,7 +197,6 @@ required:
   - clock-names
   - resets
   - reset-names
-  - "#thermal-sensor-cells"
 
 allOf:
   - $ref: thermal-sensor.yaml
diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
index 972d608ddf95..63a29a1f7fe6 100644
--- a/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
@@ -48,10 +48,6 @@ properties:
   "#thermal-sensor-cells":
     const: 1
 
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-  assigned-clocks: true
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml b/Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml
index 5f08b6e59b8a..30b22151aa82 100644
--- a/Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml
@@ -42,7 +42,6 @@ required:
   - compatible
   - reg
   - interrupts
-  - '#thermal-sensor-cells'
 
 additionalProperties: false
 

-- 
2.43.0


