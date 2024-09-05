Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55788CD4F5B
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 09:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwBZdTpyVXBSQS4XVblNW9FdhaJgE98Fp4i6BiAgiH0=; b=gexssT67ToS4PT/fPfR0zFvCio
	6qmVAw6Bli0CHtdcUD50ETGZIG++PY/PWXpzE6Ph2OnTSD/DLQppsElOMPK3liiDwyvtQopEX9nWd
	y9RtH9ww/P9na2yok+JIaHzSetlBaj7ipoZe1kca/EkEAcxnxFT/9KC4JVeFgwDpVAnDALzbW6s/i
	KjtQK4IOabWUQQEW6kxSk1dYb3cSlejlQxVTZR19V57zg8YD+vkYTuQ/W4KcBMx4NfkMQCvkMEscD
	8asiwZvkuCcYMTwpkSZE8z1w8CdUc9+qBwxTpFM3BbQWzetXU7w/v3uXcK84WF2di3ZsJZGeB3Rcf
	4oMO/+aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm8Xv-00000007i0x-3i5N;
	Thu, 05 Sep 2024 09:12:55 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm8Sq-00000007gje-2Klv
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Sep 2024 09:07:42 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-53343bf5eddso553648e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Sep 2024 02:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725527258; x=1726132058; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hwBZdTpyVXBSQS4XVblNW9FdhaJgE98Fp4i6BiAgiH0=;
        b=BfYJrLEWRvvwu2u8iij4v0lJc9p5MV5Iphg6PbRl9qFS/3Tx5Uoc73L0zeFHL9+ydv
         RCod6GKPRAszjOPwZh5t76Q4v/WmN6OB7XA+I39ocPYTakYQVwI2EmN/J8FY6JF5ePB7
         JK63In7/YBYbksScd87f+oKuzvOx0a6i1B/LRUJimOO48wJnQl9wz2URqW/BgemJ2g7/
         FsyZAfpOtttow9SEMfZ2GtVFiONsY94kXsR2Mw+F0VMSiT/vwIFKHc6kDV0997Qkjoyu
         VrgY0Hx4jFyyDZtVLAiJ0nppGdHxhbyuXJjxFzj3uJmFgb8oGJi7uakMZBfY44SfFNQO
         ymhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725527258; x=1726132058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwBZdTpyVXBSQS4XVblNW9FdhaJgE98Fp4i6BiAgiH0=;
        b=eJjFm7WL9zsVPe7Wlm0RtyM1m8iEBfdHTanY9my7lsnExnf8zN8Wj9b5PTpDJga7wd
         YJBoYI/fVdRX1SybrxcRIn0slRaTGt7MrHQMK9GEPa3wELRhJVXrfSZxEFTrdMb7vXb0
         oIRHS14HMJ/a53QmtpoUYykAcYZ83uDgz5ourW1On+Yj9wuUt7qHypE29N+SfVwX/TZ3
         kft1fd6iV9u+E1H6z4vtviBAPY4dQUVh9G6SXMATbpBQT8jnOArUXgRuzXsuIKql8H05
         CYVqVHRlJkzwhf8iccn4Ge0083lwXetLIJuuHqPXUUV5eg8P1TG1H2lMnqtsaL/SI2uK
         VP4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9OY0hAapML5dpyIkjWJqP08ItLT+XjgBVTzlQFpDGTKQ2WON3MtsCeIoomBKDF42tfnrFvSK66ScndtRx0w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw50T6pZp0ZgdLPgKdT57zsASWJl/UJe5PFG0QAgwp/5aFxS397
	VLpVIFGiximv3j4MdCKhV2j5OtxuAHfbk4WYoOvGYERv/Lbei70k2fr/JQGrsCo=
X-Google-Smtp-Source: AGHT+IF7aieJvZ8HE8YrbzaTZ0UEWnmZPAe12UaGqRXV9bW7BmaC7FDWdzRWuEtOWguAaMgKm3ZiVA==
X-Received: by 2002:a05:6512:138e:b0:52e:9b15:1c60 with SMTP id 2adb3069b0e04-53546ba9d09mr12417584e87.48.1725527257841;
        Thu, 05 Sep 2024 02:07:37 -0700 (PDT)
Received: from [127.0.1.1] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-535406e5549sm2554188e87.0.2024.09.05.02.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 02:07:37 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 05 Sep 2024 11:07:01 +0200
Subject: [PATCH v8 4/5] arm64: dts: mediatek: add afe support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v8-4-e80a57d026ce@baylibre.com>
References: <20240226-audio-i350-v8-0-e80a57d026ce@baylibre.com>
In-Reply-To: <20240226-audio-i350-v8-0-e80a57d026ce@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2440; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=9lwjGAo/eulIDZolvaj7IvijeNRCw0bV1DWR4muCdTU=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBm2XTOynFXcIpNO/bFp0nwJbFFUoDl8Wxr5YnClGyk
 bbgNlV2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZtl0zgAKCRArRkmdfjHURUcjEA
 CCcne5XQQBcdrQ57wgg1j9rcUE1gnwrSKYOhA5xbFT9R91zByRb2NLPm6dxzECpG1/qeDATa2IpbqX
 1clMLiwTUsYnlt6tLwUqvYBzXi1nW9XaEqyBK/P0Wu2ySLD+Oz0u9IHtd0QauZTZo7U039Gnv0lkp1
 Gy76QeEtjCGdfz8iiv+PQB/8J6TIx+Wb18wymnlnK8MWaCrO6lRZZzrDAh7wR45Y9cbOBgkIifEGia
 SvWG2aKA1CmS15fkryiR0cyW07BSKjl5gnTVx/niPATf4RfpwNDd2ykQqSufX2umMw5CcinpLmR6tY
 Z+u1CQmPdncXTd0pQ2evFDNfhyZ6FjaHJ6b2EKR/3h3LFr6cv4HrR9/XkuMIO9gSuJlt9MvNgMUaVR
 CfX5mOY4OgB2iCW7NRWv0ARZmzMHffR1/tmVTFtY4sNUiuJJSLoDvK9YUQL9QIDDfDTwBKbM9+ap3U
 k6usMPc47B85X100vyxtrwi94nJeH3LuvArhy/oB//ugi3J6ttBuRfrQ9Y75x9kbzPnQ7AyVa05+bc
 Mz6Bf2RsmC2/SW5yQvgYioNdkSKInbxj1/JzcYPHSiLb/RkUFnPCG65Z2hbvTVAIQm3i1tuQx68GJJ
 5SRioEf+J3M7lqIUGrLLK+kQypR/NwUTbp4PAQYKlJ5LGf9Fs649MbrR7+tg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_020740_635912_4D927A05 
X-CRM114-Status: GOOD (  10.78  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 43 ++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index eb449bfa8803..9c91fe8ea0f9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -2,9 +2,11 @@
 /*
  * (C) 2018 MediaTek Inc.
  * Copyright (C) 2022 BayLibre SAS
- * Fabien Parent <fparent@baylibre.com>
- * Bernhard Rosenkränzer <bero@baylibre.com>
+ * Authors: Fabien Parent <fparent@baylibre.com>
+ *	    Bernhard Rosenkränzer <bero@baylibre.com>
+ *	    Alexandre Mergnat <amergnat@baylibre.com>
  */
+
 #include <dt-bindings/clock/mediatek,mt8365-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -812,6 +814,43 @@ apu: syscon@19020000 {
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
+			status = "disabled";
+		};
 	};
 
 	timer {

-- 
2.25.1


