Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E39CD129A
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 13:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0Ft7gJMIMDuyFaMl73MCWCL0VnoY8SMUukXDjxNKP4=; b=b2JwpHU/D2Y5F/PtVH8cA6+br+
	kxX76JxUUK+zQdUeL3aZTMVwyg/nM+OEDPVqO27mdSNCio3qZHVklZJk0AwJjk7TCkTvV0HImNgqN
	GspDeMYo2p2KQ/wD7FSNbVhoX9TwV4D0h5Hu+szUxPZh03Zw1tAZtUzCqWfaPUgUTfjViFjriTHFu
	FPu5dvYwToIkf8S9Orbquu26wIHqa+D56CwkkMgRm0C1fPzLBpyURparFXmzWpUiHIcbxJl+v14kk
	rNzWfocpmYii94LF0vYeiOEYIDJkBcMPMRjdsFF2EnIa3nRCNhh3g8pE279lGr6LnnajURQXOr9vE
	MOAovdmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBkS-00000002CZU-3TRP;
	Tue, 09 Apr 2024 13:42:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBk0-00000002CL9-1Ok7
	for linux-mediatek@bombadil.infradead.org;
	Tue, 09 Apr 2024 13:42:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Y0Ft7gJMIMDuyFaMl73MCWCL0VnoY8SMUukXDjxNKP4=; b=XlF/HLz8TIKav673hM9KzyJUaR
	yVjZoxAtMcuAoShKColnS3G17llN3BIvzUIezp7mIOPSctN13ccHnA7EbsqU/JAE+Gu6eEE9kcyFr
	kWEJHP3j4DgWkM845344kvzVK/yfsEhyvi6C8Btu3PGFBQAyTCZb1CAfXc0B9y0TRAuoxH08/U14X
	A87tSdYGCn5LvN2C5SmJWZkI248CBw+skLEvhJbgGVKoT5aRh2ly2Lie3UCfltsBUuqnJIsJ7hoVI
	4vrl2q15gfK/Ga9nxQtYEhojSyPHwhh6/FFJZKyojd4DCzINgq7B+EcJgPaBs+mJHZqfMNObaGxva
	8LFdQRQg==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBjw-00000007d7L-3DYZ
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 13:42:23 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-343e70dd405so3648486f8f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 06:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712670139; x=1713274939; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0Ft7gJMIMDuyFaMl73MCWCL0VnoY8SMUukXDjxNKP4=;
        b=oF8S0DAR5np/B47x50Dw2gAaHgVI1Id/C8NKdFyB7vRnm4EhWMnRwN/9Wi3DnrVZTL
         +veyi+bpPKrfNEvigBrzA5xc4Bkt/zOUltUmVUbFIaYBlIFcaCanUDgTNUv3/KlI3ajL
         Xccvnjv4wB1RpkkfizxWWTKx74DGsnSfem7lmKRD0wlyAJjbB9YFEk/1Y568+ca1ib5E
         WELM68XzwPpE+hC1qfwTTcxvWpmApY+ubxH2G30uSbqIkWXkNPl1C4DHZLWJGDhM6qAz
         tXvSqjPm8PqGHhR4yrHL6UN4cEJ/Xi40v+nhIBbT7jWB8X5z9yBzOghIqeSVGSvbc+yQ
         NTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712670139; x=1713274939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0Ft7gJMIMDuyFaMl73MCWCL0VnoY8SMUukXDjxNKP4=;
        b=ZWnxSyh4CcTPf64nBXaYkeOoXjx8lNXZm6jvWhMjcLDl6HEyu0bkE0haDU5t7quYV4
         +N+xEGXu2Ft91cCzZh424o0+o8fTWqfI99gfUQgTdbQiRNA+xdaFHpy7ZL8C2SWutbME
         95HYTrQ7vlHaTSqFZaojDjNhZLzEpQpxuI2fZHqEiJ1Renot2NmSHYe10gsnd3AE6sI3
         gBn6gPJVGo42bqR683os6fEyB7XslGlTGyx14GIUOj/uiWAd7mM0ifrxAwsW5zrjqRab
         U2+JoCVSRsoFFIqtNtB8IIE5iLIFubsSwYLK9Xl6c65vjakFWiXjoyHEwq+rXo4WQ85e
         /zWg==
X-Forwarded-Encrypted: i=1; AJvYcCVXV5KtS1bZmZ2N6BQZYI/GGSZE8oNlcEij27p+PwmUYo1v4vSfhIB4VGkukKrJy/3U7LeyTgl8gIKUJ9FA/CydsdcqaUNdah+tq87RfKhG9LwD
X-Gm-Message-State: AOJu0YxmkgBcjD52MLrPSyV/tBzgw3Zaebjt5fCZE6MTLhU0gcE8umvp
	Kn5Iq/kpH6iXcPcxcRxafYCu3VsHVDJmyKDmkpx12chlFTkJsrGSSDnpyKIuygM=
X-Google-Smtp-Source: AGHT+IEO0wu4NhRlj59yyEV3/AmudxVPjh9KDi9m6m9X4AWTWkIq0osDU5hnpCv1QD3F0qnVyktM/g==
X-Received: by 2002:adf:f9cc:0:b0:343:7653:ad14 with SMTP id w12-20020adff9cc000000b003437653ad14mr10377159wrr.30.1712670138963;
        Tue, 09 Apr 2024 06:42:18 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j11-20020adff54b000000b003433bf6651dsm10753579wrp.75.2024.04.09.06.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 06:42:11 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 15:42:02 +0200
Subject: [PATCH v3 04/18] dt-bindings: mfd: mediatek: Add codec property
 for MT6357 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v3-4-16bb2c974c55@baylibre.com>
References: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
In-Reply-To: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFUWsRoFsr/DA4OKUp6SCQXm0l4J9aRtbh8NLZQ8P
 JwTHbUuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhVFrAAKCRArRkmdfjHURUZvD/
 9L7gHOb1wNabYP63KJqzi8jizhVvuiuiQPEK7NZvxd0C+wEsOeuTHX+nF/MU9Qk5SOGCdoDILbVkyV
 4sblV6X1GDcBf2s2btcFIy8kOPJjSimOkcZn+ZYQsMPb6BpIup9mqH/F+gpjYZrvO10y2JVZcUb+iY
 iY5X7ialXOkPq1Psb76YIbdWNdDmyPgMLX60Jmi92DsdYPPordwZc5ml8/9c8rU37ewaz5GZSqv/ip
 4TTbrVMtWICYnQwgWRoyHlvLPFRYsxVA0dvkGbxwe11XtbVDYTml02QQ8yQOIzMmoEULYbAZTi7ELH
 UQfSW3e0kY+bZ/CoEYdKyWK6xHRP4Dic4Hjsj7EPcqh+LlydBoS+ukyjMpjB7qIn6O9Z57aYe37Lki
 R470tUPlZ6vtTMXaoAruJ0maHXUYk1K+QBMoV7sQkjst/VBoIAKaVZo4QAXurGxilT5VgUQBI/xeSp
 KUKC8GPJnaFwhR1c33hM2N14+7kWxQK0ZF9/23TrbmamSFzS8SUK1tYDMc23f2uy78M2OIbxyq6VIM
 AmbD8c7JeDXYfnj8+LP5d32wzMc5Ve9D+n4DDglS773s3Cnw/7a3h3aiRcUxc3V/qGjiGwimgfn5r1
 iMGWksRTViZID1Tl4JLT7t+kohfXrKPal994r21FwQbGJh28dkUA/Lnp4S3Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_144221_026796_5ADAE9BA 
X-CRM114-Status: GOOD (  10.68  )
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


