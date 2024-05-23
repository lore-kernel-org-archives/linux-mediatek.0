Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCA8C25B7E
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 08:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qi1a6qRL/sSf88RkAxOBKeEEBw29sLy7LzarlapS72s=; b=bd/gbu9LxPqsDFu/LyttxVjeay
	sUvIsmpoTtZHD03fX6egT8BZDqgDDuDHDT+yW8XEJER3x2PglWWVyGv1ZzfYIOB5G7+Y6q5B6DWR/
	YxEUdn2cwxM8O+8mrjDwiwR7wAGmsj5dcjpl+OXFEXirdUicDqYqoQGPQJ0t1GXDJYkVs7f4hSlSK
	ETyRHa/QY4lO/R/bLUvQ0DSGngg3PSlV9SApoJuuhHAMSJ5KZkn60c2b/Up92YL4Pnrfy4idP5OfY
	tEQb2uPPWrkZyDvhQdSrQZyD0QFzYVDjKvmKyBaK/+o1S4GOjh+BXe4UOMX7HKdiKuUyyppKTJVhy
	Du4UNDpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA44L-00000005YH4-2Sir;
	Thu, 23 May 2024 08:45:01 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA42U-00000005X7I-2dBz
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 08:43:19 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2e6792ea67fso90660631fa.1
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 01:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716453785; x=1717058585; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qi1a6qRL/sSf88RkAxOBKeEEBw29sLy7LzarlapS72s=;
        b=j003Sttm23flPp4AzAKMOFonTZx87v1VHE2FZSa4uX9PdfWgpzak5jDEcyLEpnJZFJ
         On2/11r2XnfJb8nQ5vkQXKIgqtvY8FZvwhHfVQtuDuPCORLaqDKssz1OI3mEN1EEJaul
         2KUGvGaV/isAb1jn0re5r35q5L9tEqVtvX+1T/aoJNPTBqmXATaRqmT6RDan6iMZEG+Y
         KLAc4BsYFwHnpAUDw4nftCoza9WK+0QaZYwS8ewu/reqxQVRXgbjdKrkF/jchBBbgNLP
         UMFHx93W2h274zFH5E9x/l98Gaex3RJnvafx5iTQ6qM+2cvvRmFLSs62Yy1Yyc7om6Yg
         Qe7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716453785; x=1717058585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qi1a6qRL/sSf88RkAxOBKeEEBw29sLy7LzarlapS72s=;
        b=tr5nr3SbMeUsVh95Zn0058yrrXXukoWhKTnHNrUaizp3iHI2+AF06zm1arVfQWA26l
         0hxxv4h03PQMOhoiQrFEQf5BTb6IL2EeDacnM9LH62lSDcZftxn2SYVOBX+84u1yXNgR
         kbkYvkrE3pbtQu8NlhrFrXyLXB7rJiIGiELxaOQ7gRMp9qTm+ZgQynYE4zaq/ToRjJJ0
         QamKwEBt6Cm55Zxqk+u6arm5vBZCbBdLFmy6iOxSoDzeMXfMlYwzUzQ7+hBZt973Jqx6
         h7sJ7f3AqwTY8HttSOKC3gLTLM8OcK4rvtBWJGXe4BnaYNY/tVZe6rhhbzydqeup0FGS
         DiGw==
X-Forwarded-Encrypted: i=1; AJvYcCU72vWTQPy56SZ1z/ed2qQ0V6xcEm6qliIOr7lVoeft1A80DCsYdy9ym68rcn/o0Zt0+CgXeq64PdJx8p4CZFhuO1fFj2PHYXybj9fE4HIZ/TV/
X-Gm-Message-State: AOJu0Yz9btBV+2HBG54DQOLWJ07z+msIgQ7wBFVAfQSSUE547oGB8Fow
	45beTZ54z2VupDXpZeCx3isrNbxp8ItcYHr0oTntvkjUTrELMeFXiOaobY22dhg=
X-Google-Smtp-Source: AGHT+IEC8A0HHPj75NGAeP//54dk/2jVLa5uX488Ev2piYWlbCHwXQw4FvShK6FEUUJOadzfj0zTTQ==
X-Received: by 2002:a2e:9e8e:0:b0:2dc:d2c5:ee9 with SMTP id 38308e7fff4ca-2e9495022d1mr25227941fa.2.1716453785194;
        Thu, 23 May 2024 01:43:05 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42100f3e03asm18556645e9.17.2024.05.23.01.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 01:43:04 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 10:42:44 +0200
Subject: [PATCH v5 15/16] arm64: dts: mediatek: add afe support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v5-15-e7e2569df481@baylibre.com>
References: <20240226-audio-i350-v5-0-e7e2569df481@baylibre.com>
In-Reply-To: <20240226-audio-i350-v5-0-e7e2569df481@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2357; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=t0tf5ggyvEv3KEhg9dzpup8fwcOHLyJsYbfkqMonRjM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTwGAc9/Ge7o5DXtFdzw8pFfAbUOoXwPsn9Na27uP
 1jtKDmiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk8BgAAKCRArRkmdfjHURVhgEA
 DGnMGpkKmQMoej6HMPV795SB24cmQfeb3v9qbkuOFXsVg8Aiu95kwy+f/ezJ1B8ILYuHC5OE9kmpgl
 9/fn0zECIn0xOivhVfxwvZZDULtsR80G4LXm2EuZZAXoC8GkdsnZCZ4PQ0IQ68eLfQ4N9rFP/pfqZR
 GrcimFwxFrH6Y9A2Pq3RAiTyNDpIf6qvTLHqelmm4fa2n67UozjZdWN1iZ9TXaVKijfEa1whxl1McJ
 2jDpItBbjUXfU3ZIfgXkBjNc999wZJWRGt/PpAcKRXB00Zly3TxA9FzV76WVH2a9WS3UW52K6hVBxU
 SVRZBNCdQFIofWoFJosPtcV3EhBuv1t9zQP+bpwR9WQtaYGASWQg+04m3/4smtR63vWWkkcfVICtal
 A/75ahpKxtnDr2+fS7Bj8ZlQiO3y1sJ0KQN2MTkLxR/BqXz8HlER3UReX8HHhCKXG3Qevs5RIlCX2Q
 zFiwXwesYCxfD+R3WXk6GLPuc0TvGDq2hlWPm4IgLLfryBat+/rcLJ1+7BdPukxFMlkYtbxnd4va6B
 ty79KRZeFeyLiyGv/jV+UTWiiXKWxzYSz2x/Q8i9dYRYTkhGlp8Gt3N5Ke0JKYRboFDteQmcBhJ0Dk
 reBFU0Cotj4ggjTE5PhVDafEpxHq4x+4w10YK0LE2kBafEaKYhpum9VarC0w==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_014306_872526_2C8CFFD1 
X-CRM114-Status: GOOD (  11.22  )
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


