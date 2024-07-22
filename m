Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1792FC3DA59
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jul 2024 06:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+3ze/IP2QrseHnlo80eunkZiTdbCzauDagUJ/lYngU=; b=diBygGUrLikGZy28BalZ9Ywbhj
	cSOyyH8rwlTEdZxgFfYwz9DoWeJ2OPGqfVTvQpTR8Q54nbDjZSaiStd0TB4jXFQOSskXfqh2DmNQo
	7noNvatd4eM86x9cV2I6ECEgUCX5PH6JJlkJYbaJYu4rj3PrZXdf3dO1YkZtheJp47RdX+6gbfbkS
	gIkg7Hu1/q9tlPptW6/GVheAFQimijwQwj3RL/fC75j8zCtSEe9w4uOciEfX0occZ2hTN5tL4haZL
	Olrs+ZQTGYPqoOSz8oxARvnzFVU/TEyAAAEwpYsmCX8z8HJ7GyGX9TGrEWCeSfWTwr/C/n6xS0WXc
	Vl0oCDbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVmxI-00000008b15-314x;
	Mon, 22 Jul 2024 06:55:32 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVmvY-00000008a9h-0czD
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Jul 2024 06:53:46 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5a3458bf7cfso2736362a12.0
        for <linux-mediatek@lists.infradead.org>; Sun, 21 Jul 2024 23:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721631222; x=1722236022; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u+3ze/IP2QrseHnlo80eunkZiTdbCzauDagUJ/lYngU=;
        b=caIa9eozgxSwuvin9oC/UEZDW41fgyFixZb8PGyYltl8Fo8MCEEKvmOAu+k3Cde6G/
         uJYKnt41GqGOr7O4gKbbpV7MbLnsbD0cPa4YHK27vPKjVcxKW/8sagr4i72qIN6QM79l
         v0ClKHaAvqs7fJSFA9EPm/Wagg4rRG0ar8ea4NWo2RgLrv/SOQUFCVK5ROd/Cl+X7Q8C
         q7l1j9tAahOCksv/uvtVMT4i+lCCemrmGnz2x6klGpproOe+2Y7nhVzKfciYD6xCIJhW
         HSQHhUZMWv9IANHNskawbNbENPxUaiVIWZVUqwAs5DJ+hFYtKC0z4qR5fspM+bD86KgJ
         sMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721631222; x=1722236022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+3ze/IP2QrseHnlo80eunkZiTdbCzauDagUJ/lYngU=;
        b=h2bFS2/yuMa90gYP62inmq+wJ0goL1/JyTmNWnEJnhwHvOR2cwqhmIEWHEFOcC/a1z
         m1ILrwe1VdpgKP0DX3DxkNA4qr4sVY5oChqKQF4sCMhUfTFR7WXUYEBQKiPnojCPvnjF
         dYCKyn42WRvvysjd9khw0CEWOKMPolo0w7wfopF5emElsY/dWOmsZHqH1vkDpnoBBakh
         9+YCWyXeTIEkZwlVYs2ApyRARzY4xMWmLVqUUhJs9oSXbWqoDn935x9B1vyZY+etzS3x
         F6nytiMehnRinwivfggOZSEBBEtRWFtgLK+vd/V8INCB78R3NgajShqjosGeYszV5Osh
         s00g==
X-Forwarded-Encrypted: i=1; AJvYcCVMsRJtCd7mXbP+eU4xo5TM3BRbIplwv5lnJ5gCbcjLhAG/CqQt2acstU5Sdv1c0NLsPv/aqlGNTLwnp+DnHvTQGBmjijtE7VvNFh1ij2orHsjY
X-Gm-Message-State: AOJu0Yzdw/ieVQjg6OVHP5m/YiLBo4QhuLh2ofvKWkRwuLsIjYwTEE/c
	qhR15xUIBu/geEXoQOFW5Iy0PymKb7mPXBrGliV0v1iYjGSHutIsU+VOFNPOOLxcc7CNRwB487u
	lPZs=
X-Google-Smtp-Source: AGHT+IFJymhhbtomjKgP2gDQkxgVKRlXBgHheppPAvjAkJL2snZBn5zWFyPNQaFdccjRosPDO5Nvtw==
X-Received: by 2002:a50:d699:0:b0:5a2:80f:f7c9 with SMTP id 4fb4d7f45d1cf-5a479970367mr3223477a12.2.1721631221950;
        Sun, 21 Jul 2024 23:53:41 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5a69c1f56a0sm1982126a12.64.2024.07.21.23.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 23:53:41 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 22 Jul 2024 08:53:32 +0200
Subject: [PATCH v7 03/16] dt-bindings: mfd: mediatek: Add codec property
 for MT6357 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v7-3-6518d953a141@baylibre.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
In-Reply-To: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1920; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=UIlaXrHC3JXqJmHxOl8jKxQMiudwmYCtEVWajCQIFbA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmngHwcvHRLjV9AcqoRaSL0Yq3rkWT8qbII8GiPHlR
 zhVMDb+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZp4B8AAKCRArRkmdfjHURZeBD/
 926K6vv60HlYRpqFEOI8Rwz/HhG/pQHXFSsTFR1tDqg19ttpvN7X4FeGuXGeLO3Mc4JFp0Ahn4vEsW
 1eL5yXsXgmfrvhpMzj8qts68wnEwk2CW+P8Bm8iW/OKVySOc5hirQmJW+ffaKrdOp8pyP4ZsBrpyho
 qAl9LhWp6stCrQcX2lY8GfgZ3yqsvV66Brh2ifPjGaC4m++c2Dh5gSe+Vx6Ki072ABSePEitfqdFrs
 oeS6PMqXv9C/swOSKY+5qaBD45/zThXsyOnBvpOUC8AEr4NWwr2UETodSaHSOuzHMfSsH8jOZlmmz7
 bA9hpJcXSttRsYL3v4F9D91lfa4xHKqkNS3Hs1mWZbS7Q5OGAPn+DstZvGjYOPHr6B09+SJXLE7Qoc
 2870Tqjt1bdFTjz/l4nMMeET3IXvzwGLI5/1fBlmWFql2AYwZnKhsUNexYhGPq5iax4We1cxnCjJNC
 7woyOHGJFTwHsiZZ2wFr+9draTok5hflT2TeOUKW74HBQwUz8Pf6n7LgsVNW3KZcQ7256dFL6b5BUZ
 F/1B11dezdLMqSVo3WmFOGQXx4tEG4lh/AXO60JCXrz7p4d4DfC6rY2LBzEhvVi4dTlHoskzwRHmDr
 mR/+dFiQa9OLoCvr12SnKK3MARcMhluKNqIm0yiZOuDAauFDTNrCDVf9mDJA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_235344_262652_A55128DD 
X-CRM114-Status: GOOD (  11.12  )
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
 .../devicetree/bindings/mfd/mediatek,mt6357.yaml    | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
index 37423c2e0fdf..b67fbe0e7a63 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -37,6 +37,24 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  mediatek,hp-pull-down:
+    description:
+      Earphone driver positive output stage short to
+      the audio reference ground.
+    type: boolean
+
+  mediatek,micbias0-microvolt:
+    description: Selects MIC Bias 0 output voltage.
+    enum: [1700000, 1800000, 1900000, 2000000,
+           2100000, 2500000, 2600000, 2700000]
+    default: 1700000
+
+  mediatek,micbias1-microvolt:
+    description: Selects MIC Bias 1 output voltage.
+    enum: [1700000, 1800000, 1900000, 2000000,
+           2100000, 2500000, 2600000, 2700000]
+    default: 1700000
+
   regulators:
     type: object
     $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml
@@ -83,6 +101,9 @@ examples:
             interrupt-controller;
             #interrupt-cells = <2>;
 
+            mediatek,micbias0-microvolt = <1700000>;
+            mediatek,micbias1-microvolt = <1700000>;
+
             regulators {
                 mt6357_vproc_reg: buck-vproc {
                     regulator-name = "vproc";

-- 
2.25.1


