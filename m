Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2CAC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 02:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGFeLYCtw0pQ4Vg1WxSYyEWBzkxCWkgNacW8i2OpJuo=; b=YfdKF34QJTLMXMUBgJqbWBOL5y
	23tC8Hwi47tSB7NlbZqN02qu4GcnWRjUcXR7TvbopT12UbVjUQLxtVXYAzWvVG5LQqgc3FhPmCD/c
	iHTEIOduLhtz+n0W0jlws4x82NX6EOIpaS4UOIiC4wFGUCH4PewYM4sm/mJGp9rDnJJms+HHU1qor
	U9f0Gm8RsPWlMqYuXgLv4wMMf1fsxgtpCybtOcpFsQ4xrT/3cx9Smeq1XBPzW2lx9ecjkvYlrnBq8
	hykte28KHAmEt0L0gfjpQj1/HovzAPtJQWm8Bd3vInNt4iC7GXtsMJc5TZaavEQVCCQE1ivvt3MHu
	TJKneHZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum8B-006zPv-S9; Tue, 15 Nov 2022 02:56:59 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum5x-006yJA-4A
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 02:54:42 +0000
Received: by mail-ej1-x62a.google.com with SMTP id n20so12323920ejh.0
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Nov 2022 18:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGFeLYCtw0pQ4Vg1WxSYyEWBzkxCWkgNacW8i2OpJuo=;
        b=eFCGkMLvHxR9VMBx62cHp0LyKbih0Hox3ctugbMQWX9AheY6hi9kUDPV16l1ngp8V/
         GXvdDM4QJYKCtH0hpZWF9X97elCxk/dJs+iTF5fCuTdfoQmyMZb6CG40b/ivwNYxUPHg
         hXlV0S0+MlGR4gtsKASrbJE1xJJ+lnkH6+/HLFzB2lmpQqknpCneVFlWUm9Ia2s4w308
         HwfTCUmmM5FfQKFOobaymjfs11RR8w3vLQ7JkCojWeYnGx0ZFUPh9HK9Z1UZ4vU3IaM+
         d0NcWKKL0b4y9lR7r60Mpny0WTigF9+7cmA0EzZclFgrc/eCPbKDgvl1uZZGPOuBa8n2
         eM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tGFeLYCtw0pQ4Vg1WxSYyEWBzkxCWkgNacW8i2OpJuo=;
        b=qKbFMls8L4j8b0YaS5ecixtfN2gexWZyK/BczPscnpqX9uVi/vy0nb7p5VsgXyRLr6
         vyi6DbINA3lVgTwyWubTJOtIrKO/vrBJkaHGMtd9YGJzGnVR/3Oiugw6tv/xDQUlmEdR
         8BslOZk3m4VzjIcIew9v5/R3/u51wNDbAkfLjJIKeimu9Kh3rWInxUt/X+wWk3tG3fua
         xpxBlt6ln6I0Eq8hM5AhkdQw1Xy2Efa0SCEkz0ZyNSfidoGppviywDykpm0/Ne2aZH0d
         Q9/nDi1zoNHFN+YUWX6I8+bjvMrxn0BX6LwBIIFReunE0rgIV0ehKKJh1+3t4L6g5wZG
         71Yg==
X-Gm-Message-State: ANoB5pkYRvFbpcqpCLmk7q1xWmjosbHyyj13GV1YLiM0AXjLE69ILoQ+
	RiCVn5VD6DSpDmuVYB7EI4ABW/bNksUfJBtr
X-Google-Smtp-Source: AA0mqf44R6leH9X8yl07swkhukNegilqS07Q6onZ4yJzwtMAvw+nsL9LazTWCSfy67gQyyhv+Ch9eQ==
X-Received: by 2002:a17:906:33da:b0:78d:b046:aaae with SMTP id w26-20020a17090633da00b0078db046aaaemr11872899eja.218.1668480880417;
        Mon, 14 Nov 2022 18:54:40 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709063d2900b0073d9a0d0cbcsm4861177ejf.72.2022.11.14.18.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 18:54:40 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v2 14/15] dt-bindings: thermal: mediatek: add documentation for MT8365 SoC
Date: Tue, 15 Nov 2022 03:54:20 +0100
Message-Id: <20221115025421.59847-15-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115025421.59847-1-bero@baylibre.com>
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_185441_204678_7DE4CC76 
X-CRM114-Status: UNSURE (   8.56  )
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

Add binding documentation for the Mediatek MT8365 SoC.

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 Documentation/devicetree/bindings/thermal/mediatek-thermal.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
index 5c7e7bdd029ab..d1b30733dfce3 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
@@ -15,6 +15,7 @@ Required properties:
   - "mediatek,mt7622-thermal" : For MT7622 SoC
   - "mediatek,mt8183-thermal" : For MT8183 family of SoCs
   - "mediatek,mt8516-thermal", "mediatek,mt2701-thermal : For MT8516 family of SoCs
+  - "mediatek,mt8365-thermal" : for MT8365 family of SoCs
 - reg: Address range of the thermal controller
 - interrupts: IRQ for the thermal controller
 - clocks, clock-names: Clocks needed for the thermal controller. required
-- 
2.38.1


