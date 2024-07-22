Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161BDC3DA59
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jul 2024 06:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKdTgT3KsHBdg4+GhO78bEt6cew1IEq5DPVjepzwO8s=; b=bIbvW1NEDz6qHR8w0IZ5Bw7NrX
	CHnQ33KNUstPJVhtau9vR32+deFJ5bPNgCVJev1p13vrJhV/G6Jgm4pFFbaqVD98XYIMr8MbIm6cC
	qWOz1TQeLPfVkZCB7Z1MW6LJUXJr6WCHkpvdF0UwVDlZcbqw9Toy7mtrPuKEfPBl/xiUl9WhZSNom
	bTL4zt5K/UUNzvpbMQtJW7ryyMU4jOsyPzTAIxmBc2E5WmZzbCs3K4tiJ+Gs3TVEHSIzAbBZul6L0
	+qlpmx76jsOf/WwnLnqXwJ0U/LaZvA2H10r/8CkM2rq3TGLJjaV/HBms8k+70E2bECJG7lT+HN5Vo
	766J5t1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVn1N-00000008ceX-39zU;
	Mon, 22 Jul 2024 06:59:45 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVmw0-00000008aPy-0278
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Jul 2024 06:54:16 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5a1c49632deso3157591a12.2
        for <linux-mediatek@lists.infradead.org>; Sun, 21 Jul 2024 23:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721631250; x=1722236050; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKdTgT3KsHBdg4+GhO78bEt6cew1IEq5DPVjepzwO8s=;
        b=n+B8n08SYR5nNVDaI2M4WYz6kZ7EbQixbDcXIIXfP8q4arjYr1SPis9R4WP8rkm5ed
         UJ0tGi0CUE8uqpGrhPmzyHr1O5uj8K7LIL6p498hulZU7FbU0IdjsBP+EK3g6SmROPcc
         MEefGfBNOHHZFXfbuD7HcIpvUbZIyQptwn3zCMY3dZbV/bs2CmhqVR3bffsVSRjMWKkf
         br3ve8Yp/VHrCwj3x7OPVT4Knp5Iz0I5K9SIDvLcdvtoBUxVILYV9WoJVtEjkXzFQscP
         Tc0Nli2OhJ89IojeLP1/c66ycNa2It6II9UHrSSwc97TCbs+WPXjTEfr9lmXOZz0jgt2
         bGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721631250; x=1722236050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKdTgT3KsHBdg4+GhO78bEt6cew1IEq5DPVjepzwO8s=;
        b=KWCj9dmu0a90tDdOkDJlSlIdjl6Viz+pF7pl5RzeY5l6oD9A6avI/MrTKXOnv1cNLM
         P4a8pEMKphy+c1/si6dAsxxkuac30WZvo4izSgkEmQb6gFCYfgFYSkS4/asywld+BrmN
         G22R5DQNpom30eq0N9c4mLQjYNARJfjG1p3xmXwC69rLPlGJcUmJOIbWpVAjAwa7WIQM
         6hH584GM3mZZ8d8Hd2Mlb7lRImamz9V1YoyRqOIKgp6T8cQLmb0OR9ThMQg+0+IZxxa/
         Ou0jLCvemjKC1HAXaiHIwWGITxJvr5si1ej6c7/OVLHnbHBzC/uSSpj52v3LAwySvYvf
         heag==
X-Forwarded-Encrypted: i=1; AJvYcCWDPRRqJbUpjPkvH55swB1Bjq2L0WLLZc17+1w9skWYDC6spsee6/M2fD0CHdFHfmbBRbguio3G8Y/K4+1/CohXISOPfWajfIOTYZgw2d+zq1KX
X-Gm-Message-State: AOJu0YyOoS3Gzev+fy63DaevOka94Vq8HEgryMXweFf6jHXl+tjH/+ch
	uiHmKHnwwd7WGQkRsJxb6gfslJ+WY8PyM+uj0hVKB+mYVnx9127VFy2pCKkD+GnTX5D7QssU+Pv
	6NDg=
X-Google-Smtp-Source: AGHT+IGRHDZ6lSTNR+Vp8mSLIwOqZwh/cysql+g6CZ2J+sqcY5BXIe7wCvGbMFi/JpenhRewq7wJKA==
X-Received: by 2002:a50:ccdb:0:b0:5a1:b7a1:eac2 with SMTP id 4fb4d7f45d1cf-5a477695253mr4183158a12.4.1721631250729;
        Sun, 21 Jul 2024 23:54:10 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5a69c1f56a0sm1982126a12.64.2024.07.21.23.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 23:54:10 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 22 Jul 2024 08:53:44 +0200
Subject: [PATCH v7 15/16] arm64: dts: mediatek: add afe support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v7-15-6518d953a141@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2440; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=L/X5S7kQaZX7wsv4CHwCmLD31FcTik1b6cbELb3AlwY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmngHxE1HtH/8qPYOuuuGIA0Xv1sscguHP6j0t+Bmr
 r0dNh/uJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZp4B8QAKCRArRkmdfjHURZ2YD/
 wO7fnA1dxytSYvoi35ZwJmadZ/OrYFAc4n46a2FX+ViBQbtzaSE1yd/STWveNJ/kq4pIjHmKhktcup
 wixJB1hR/XsxpLr18Q7+vj7NyjU3Hn/I47JdWiYqqujwhurqImVEoLM1q07WD37uVmkwANLGNT5H1X
 BOergCnj81apnFS3jhVK9VpydIY68xCm/DK9fkPjpRNlqrv16JHr7IkWzFU/O9V7b1qd7rbdnAVscm
 +03WYA8IuWc5ThAzR5Vao5cgVLMJUxInueGiIZgRu4X7LX1mFjR0/0RjWMcBP5vjg+lf9Z/EnFuOGW
 NwlZ+OQPryGJmuYSZyM6nC34/ddFpwIi+TGrEy/3beIS1QPs2hYCRg+hzHLRMfh70ryrl7cG2SxsYb
 HMi2D9FLSVy631bzON1kmMLcF32y0S+75pwBgwHt9F8tolEr2rQLVnlZgiB5nPNueUdvbs7ybiEdjm
 7v/WvLnRQFxaEoxw7Sh73tDjbVPcRMrOweQA1dbOXhlefRfuE7vaOuphdq6KGr6FpK8kPD6NcCCIX5
 9CabJhJiRQyeeniYuaEjOi9XJA9y5TKA4/e1drZwLAqGgeP+mbIX8X32PdcJPMWHMH1a4LAL9DjxO8
 9JRSriB8/P3QJkS7IXbBFfQym0Wd4SU3K6zXMTiu8+FnpAdZUa3akY/2OnBQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_235412_235044_E367D832 
X-CRM114-Status: GOOD (  11.27  )
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
index 24581f7410aa..0051d5613bcb 100644
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
@@ -813,6 +815,43 @@ apu: syscon@19020000 {
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


