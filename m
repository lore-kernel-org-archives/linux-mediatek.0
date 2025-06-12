Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D17C71136
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jun 2025 08:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYQyoxfiAVqopjQvGW02GMsvVlG13E9Tz7Vl2Ymi3WE=; b=XXGikB2N1AFytPlDgEPGQ79ZnZ
	XzJMi9x8Oj2uMxr7eEnpY4CQaQBl1grXjqfyvfrbbrk4Y7mBRq6MYShn07Coyb7V1u3nww6RRDSWw
	gXe9hPR5295v6eFHX8/6N/TD9SSuemnzxASmp6AsgBdPSx8XEX9aFDQ8BpZI7wVSeoI2aq9c2Ri/6
	pxmrVw8WsobzQohoWQmuiayhclBwJRQUugxTohbTHtNW7GgmO2BRBTfhMe+M6EMyy5sGsGFiHFBdF
	4noSzcxURmSuLNOtNus8eVTPZ7t5JFqdPZPlpdWZ8tbMhzPkSz4gdrBmC9DFTtXO4l4qIMb+xxX4N
	6NholBrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPd8e-0000000Camk-1gU0;
	Thu, 12 Jun 2025 08:18:20 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcga-0000000CVP3-4BVa
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Jun 2025 07:49:22 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2360ff7ac1bso5086065ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Jun 2025 00:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714560; x=1750319360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYQyoxfiAVqopjQvGW02GMsvVlG13E9Tz7Vl2Ymi3WE=;
        b=iFD398+4bC9CKLCv3cunN1nEwZEZRjt7VkyLWEoCj7qVAD/FdOiD9UABTWAfk3JaKh
         kO7ZFWTzYN+LbE0XTPZx04gIBvh63hOpEgPl9gXqKrl0urkheMheO0eDWanZlhxcJdOS
         EOAf6GtfOs0HsBb0bPUsEyuHXSzRkNzfeLB5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714560; x=1750319360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYQyoxfiAVqopjQvGW02GMsvVlG13E9Tz7Vl2Ymi3WE=;
        b=e/QdoagRMhQJNum/WALwkeXn84VUknDOK/PNtaPIujM1qthTem3f363ZhpCxcPCRiY
         1qbaZAsUJUS1ZiBX/pN0v3NlViA313SZ354p77mmVyuHajXgBY+NCuLf0uYegA/MOhMZ
         lq/Gd/IK2d6VveqO8wllI1XrJAWiNUgVLgI+Di7aFSON50kHgEJJBvS0PUm8IKww8pCX
         vm4hZHERaKR7QCq8nfJhW4pzyiFX/FbMSiC+okTm4w65QpmxZs4797CRiwoWWqVgPn/S
         h6Hl4VPuKemZfj0P8fmqZfl15GyzMo3+TGjCB7JbtJvGb+wmV2sGb0exVNGzrepOPRv4
         nS0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmbX4q3S15GyUL4wjjarIOLIUOkQEIDOMxZlAd77he/VHNwpOFY29wPUIE8EyVMGwZjevcm6tC+ubE6n9bIw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/24QXgi6opcllaxoyIoSoPqR7ziHV01cNOUCwqji3qJlEkN/g
	FB0VMw+KuXz4zBwT1KhhcZNaeio/dokUImWJ0BBpUKj58eA4E2z0EU0LanFtzslzGA==
X-Gm-Gg: ASbGncsvDjKUWkRYDsdOqzQdd3eFpDBVcxEC2+6mM2EMtCdESyXewr6hArdsbOyEXNF
	HHv2Ft0JnXRfdIc1Q6aB/lxn8r9wzyfvdNJFPTd8TFBuItngMCyfoVzWD1BgdPBNB9Rtc24Khkh
	tqomB0w0Klezrm7cv3HGaA7FBv37y1m+p/SKls5TQ7tED4vo7AwyM4CKYKEKcMPAqRE2Z6IQB5d
	z/zpSa7An1tOPR8UKvFRoK3oZff/oj9UgZWgwcvHfFx/3Jd09mIFnjX6BJEQL6fxgW8GllCWDy9
	9AmrQZ/qq7t/CLsiHm3ipQ1kKfj74vHi2Urgq8cfCCOPIlvCW7uZjcmEoBZLhWflTDhjiB73h7o
	6gK4=
X-Google-Smtp-Source: AGHT+IFaK/aSeTPU1FVSUiJwy75RRBlflMYnV4oLKYPHyMqt0+SId2lcqzKkgBqwPYhNLtKoxyy+Ag==
X-Received: by 2002:a17:902:d60d:b0:223:4537:65b1 with SMTP id d9443c01a7336-23641b28de4mr102187465ad.36.1749714560273;
        Thu, 12 Jun 2025 00:49:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:19 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/9] ASoC: dt-bindings: mt8173-afe-pcm: Add power domain
Date: Thu, 12 Jun 2025 15:48:53 +0800
Message-ID: <20250612074901.4023253-3-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250612074901.4023253-1-wenst@chromium.org>
References: <20250612074901.4023253-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_004921_033693_6D978C20 
X-CRM114-Status: UNSURE (   9.37  )
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

The audio subsystem sits under a controllable power domain.

Add it to the binding.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
index a95215ba6361..666408d32f5c 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
@@ -45,12 +45,16 @@ properties:
       - const: i2s3_m
       - const: i2s3_b
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
   - interrupts
   - clocks
   - clock-names
+  - power-domains
 
 additionalProperties: false
 
@@ -59,11 +63,13 @@ examples:
     #include <dt-bindings/clock/mt8173-clk.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     mt8173-afe-pcm@11220000 {
         compatible = "mediatek,mt8173-afe-pcm";
         reg = <0x11220000 0x1000>;
         interrupts = <GIC_SPI 134 IRQ_TYPE_EDGE_FALLING>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_AUDIO>;
         clocks = <&infracfg CLK_INFRA_AUDIO>,
                  <&topckgen CLK_TOP_AUDIO_SEL>,
                  <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
-- 
2.50.0.rc1.591.g9c95f17f64-goog


