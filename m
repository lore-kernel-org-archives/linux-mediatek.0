Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF17CD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 13:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhS125P+ZQHHlpX+fCGmsJ3MAcYkFtKGP8FooRfGuHY=; b=Ug6IFweLWS2cb4fj1FWI5+wV7o
	d6v7j9NEQdjM9m6tT2UToWIDqBEPKOtPopLlsKrBL0Y8sMSM8ukYsOi9QdQXzgZ02BPEpjvrJmw88
	SjPR95rR2qw+9fMD07VNTKirBJmSE9wTX6nmSo6Y7mUVAi945hq/Bv/6+bDBDXjCL6Iq1aQhaC8Sv
	zuORTbslnNLj/1S7PNn4EkSZOeCTH5iuVnCL/WtHskrTL4PfgcZHA2qn37sGWeBBC4ALlKptThWrj
	7MMGfw86NKY4G3UU7b3V/Gpl5GhcJi9Oj1FDSe/BjMPbkjizsIZJSeEqRFe6RMggU7IGdyB2ENU18
	wtyOlSMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBmI-00000002Dot-3kW1;
	Tue, 09 Apr 2024 13:44:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBkO-00000002CWL-2Tup
	for linux-mediatek@bombadil.infradead.org;
	Tue, 09 Apr 2024 13:42:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=qhS125P+ZQHHlpX+fCGmsJ3MAcYkFtKGP8FooRfGuHY=; b=ZhNjOc+AWouuyk9FUDRxviqDba
	tn91FFIirn7LSJT9i1HJutWnGZ8D5sZZnb07FLWImb6HpRC/3AsblT1pDjO28Q4wqe8b++vUpuyXi
	6uwHGheqc7q3WPT3jA5Gdd2k5V16MA9noA2i4S2LDbR9Ehj0yCkZZHMaMHKlmcJc8qKdoAlrk/Y8u
	3mxZCZ60JvzUgVfgijV+zmgCaacvYuwkTRZ5OvIPGQTPtLFcG6S2+7ocebjdQwTve8SIiWtNgA4vt
	E34zInopB0YQstYQmRAQggOVBdKFnN8jyHFnU1m95anJRYCTvhoHs3FmGWksgZ/SOEOdkkjYenDCz
	Gi0Z7+wA==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBkJ-00000002E3L-0lt6
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 13:42:47 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-345522f7c32so817702f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 06:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712670159; x=1713274959; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhS125P+ZQHHlpX+fCGmsJ3MAcYkFtKGP8FooRfGuHY=;
        b=GOXcOAFjM9DCxsznWvNacYHGzXOm5tSipVTiQ1rvtbR7sE+1GpHEb0TU1LFh/QFf4P
         shIC8+tq9mE5CPPj347yWJrZ2B4EPOO7kREBTSxLESlxTKrBFOlkjcL706u9mN/B3v8Y
         SpeGczeahRE7sWommCcvHI+7ILk87JwaYiCXKHwyOCbNRduaTNNonP+cOFLpKjem9MSG
         3cu+vpoEyTIUSPBzCFvdCDRuzbQiSN98wwuvWMKwdXvZIDtBqMqR35i/wZi5zFMzsNOa
         shjzcn0HaPUDB8OZcs8MSPvfBZYePW2kWOnqRPeGS24KsHgzWUmRBgHmp1Cb6lD/8SwW
         smlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712670159; x=1713274959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhS125P+ZQHHlpX+fCGmsJ3MAcYkFtKGP8FooRfGuHY=;
        b=iMVoGvU6yiZnLsym3FWenpSFljvf/KCQhXaMRnwPNYVzJVQeNm1XEOab33En053HhY
         Px32HFpjsszc/3O4zy+90QCxEPr1nFl9jzFCcgmyW8saVo8Z9Os9a+LXDD5xLwy0opGU
         uDfgJCJ4fTmqM0dAAUTrZSJSb0Bo7GcVKkpyrb5Cb3AT0n806Amuxs41WQfx/xGQ4VmK
         wVB+M7t1aWYsltwAT9jSqssF6fhMfrYwWCZFHkb7YSopMfVhP7bErNzDN4H29oMT73gR
         xEu2mBLiYMYgfWwxOGuoFwYuKuio3t+Zx2JyuoiH00DNjasc/zDDlDF3tZgmHJHncEGS
         yH6g==
X-Forwarded-Encrypted: i=1; AJvYcCVOb0RSiH27iDaxMqqLmVSWPPbSKIYYCuNpHC119gZv3FBx1FkMAH/WnIUkGOoedrXZqTUdS2yfVgc4xpXuDoE6GWJ72iYShdjvEPcnH+HPYgFU
X-Gm-Message-State: AOJu0YzyNvHC4ACNLvNAKXSzqWICQEjs/KHm7gKL5IvJyldql3bs3RxB
	5P7pflBoyOUlWCaGKB4YbiPPF5gJsV74oNoqQLux5BqCqwpad2iD9XRuBsvAT/k=
X-Google-Smtp-Source: AGHT+IFT/jYxzX0p468amfP5nHBXtig4/DVxbRQhBUZKhrK9R/PHxxzjV5SIG2lyyGfyPgKh/QvY7g==
X-Received: by 2002:adf:e802:0:b0:33b:87fb:7106 with SMTP id o2-20020adfe802000000b0033b87fb7106mr8234539wrm.55.1712670158897;
        Tue, 09 Apr 2024 06:42:38 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j11-20020adff54b000000b003433bf6651dsm10753579wrp.75.2024.04.09.06.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 06:42:38 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 15:42:15 +0200
Subject: [PATCH v3 17/18] arm64: dts: mediatek: add afe support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v3-17-16bb2c974c55@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2480; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=OGw78hpGmJopJetuhUNzzTWlhmL6j3P+xSZHkHfTIPw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFUWs9eiR7ZWjiZTdx2007n+FBL0uclOGOm0NNV6o
 UmMlzmqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhVFrAAKCRArRkmdfjHURcNJEA
 Chxjlb3n+vLAZHqid/+3vD4M6xojFtFRmtMlb9M3yrCHnN8JVfMP+TGc3A9pRZ8iAiuVxTGH0Fc5EE
 iTKV5EcFxZvI2XNRHyFqw7wfe9AIDeSnQ4DAYMErxwACqtmh+kWARRdb12VCL3UZ0apiKLg9xOGAuD
 zqY4xkqyVORgH9vEUDvly8X5bI3HcUw+eGhQ9TsPMgcvKoWaaDh38u4Pg2Hp7ZA0o1Ic+znbXasD7J
 OOJfMrJgXZGkZSgqj57Lxg+JOy6Y4VGCYhQ1Ba/QYbECouEIGxzTTvAhboStntir320jN36L0JPfOd
 5EEGAZAkbRxN6OmUPgXJeNk84zN/zu+sO70shVEIRyS5eQiQrk9ADfuDu+3IorKfo5feipMhYTtUHf
 ykQs/ols7b7AogN3UGBJIQujcVGEGCQK85CaDcFgqy8fYwM4lw9y3D+ZL0gCpG8t4/SfX7Z62X45nN
 nktnf6cuF761LyJbDs/cw1KsqdkdAwurmQZvIiVisn39D/UNsmikAqDRlA0AB/DA+kXOb/0I7nlH91
 Eal2NiCwHeGP/evsHQx6Ma1Hrze+kXJxky2ouqnAjD/pOIG6cCD7KD0WLQ8ZpOACrPwCtxnzeFm2os
 SI/p8jCbTY7ISiOc77/bqm27NYWja6L0CwoKdXwfiJSN+RUH8OWW7XpeJ5tA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_144243_413024_53007F73 
X-CRM114-Status: GOOD (  10.87  )
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

Add audio front end support of MT8365 SoC.
Update the file header.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 46 +++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 24581f7410aa..0bb6f6388bb8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -1,10 +1,12 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
  * (C) 2018 MediaTek Inc.
- * Copyright (C) 2022 BayLibre SAS
- * Fabien Parent <fparent@baylibre.com>
- * Bernhard Rosenkränzer <bero@baylibre.com>
+ * Copyright (C) 2024 BayLibre SAS
+ * Authors: Fabien Parent <fparent@baylibre.com>
+ *	    Bernhard Rosenkränzer <bero@baylibre.com>
+ *	    Alexandre Mergnat <amergnat@baylibre.com>
  */
+
 #include <dt-bindings/clock/mediatek,mt8365-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -813,6 +815,44 @@ apu: syscon@19020000 {
 			reg = <0 0x19020000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		afe: audio-controller@11220000 {
+			compatible = "mediatek,mt8365-afe-pcm";
+			reg = <0 0x11220000 0 0x1000>;
+			#sound-dai-cells = <0>;
+			clocks = <&clk26m>,
+				 <&topckgen CLK_TOP_AUDIO_SEL>,
+				 <&topckgen CLK_TOP_AUD_I2S0_M>,
+				 <&topckgen CLK_TOP_AUD_I2S1_M>,
+				 <&topckgen CLK_TOP_AUD_I2S2_M>,
+				 <&topckgen CLK_TOP_AUD_I2S3_M>,
+				 <&topckgen CLK_TOP_AUD_ENGEN1_SEL>,
+				 <&topckgen CLK_TOP_AUD_ENGEN2_SEL>,
+				 <&topckgen CLK_TOP_AUD_1_SEL>,
+				 <&topckgen CLK_TOP_AUD_2_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S0_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S1_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S2_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S3_SEL>;
+			clock-names = "top_clk26m_clk",
+				      "top_audio_sel",
+				      "audio_i2s0_m",
+				      "audio_i2s1_m",
+				      "audio_i2s2_m",
+				      "audio_i2s3_m",
+				      "engen1",
+				      "engen2",
+				      "aud1",
+				      "aud2",
+				      "i2s0_m_sel",
+				      "i2s1_m_sel",
+				      "i2s2_m_sel",
+				      "i2s3_m_sel";
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_AUDIO>;
+			mediatek,topckgen = <&topckgen>;
+			status = "disabled";
+		};
 	};
 
 	timer {

-- 
2.25.1


