Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031D0C54E41
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 14:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F62eeTl4P/lUv2qXfQTeyM9lbIH8G1u8VXxO64mOOAU=; b=hfYFbzDVtuwmJTY+4sBC1ih8CP
	QHrI2+euHP2/0nsnffigmdDMeJFdClJHpWFDR9HnYvvtNLT0V6dBGhLV547Zxrno/Rf7wIwwpOFQ1
	jcPCLPDzVyjCNGqA+CLy4keOzjVvniCeWYdvHcTOCAqZSOxMZn7xGrCsnsZW7ZQ/SJW2D0+7VBp+b
	OpZLunAJSVgXa1+1+2A3dVk6iPrGiPEnZqybQc0UNi3hXJXLWDy8ywEbSfrYPWT6GqagFGUFE04+C
	H1N/WpNnZoCEVzMfw5ij/lAdDyOehV3SWD1tIlXeyHo+9qFeixt/ZhfBNCbBl+FmcF47YMmatfaoJ
	zewAdAKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebcG-000000010Fd-0iq4;
	Mon, 26 Feb 2024 14:06:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebZ7-00000000yqI-2JKW
	for linux-mediatek@bombadil.infradead.org;
	Mon, 26 Feb 2024 14:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=F62eeTl4P/lUv2qXfQTeyM9lbIH8G1u8VXxO64mOOAU=; b=PzIGVpjyxijah0zAur1S6EO27Q
	xbIIUSrqM2DfNEX0Lbp0CN5egRpw2HWojtUCD0UwVEmDiPvFQqja0E9KQQCM/8FX3UoEVVnOnZkez
	5TbaBrfZM4aEFEGfgP0XDjN3X9+pdaHC/Bxvlb0zjLmle7ZamdxvSgKby5WXfj3Q1P17Z55sw/DKT
	tm+iEAMtpQP2VcOmtVEp0fCvbxW2ZjP39uqgTKP5podX0YAevCY38Yt4k26vGJHEqksxO36jsJtBA
	kB0nHzBnzohyTu/dpvYkoZtZy4eR5WcDJqen5E511qr6LzNumLQDGtWqg0W2xVJCQsH7hQItglQnq
	ODS1/vSg==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebYt-00000001Ec4-2fxE
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Feb 2024 14:02:43 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40fd72f7125so24912255e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 06:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956150; x=1709560950; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F62eeTl4P/lUv2qXfQTeyM9lbIH8G1u8VXxO64mOOAU=;
        b=Pg1LAQtJMRenEvrElo8ZwGqC7KI7GWEy+XIAYN6QvSygv6bh1z8986Xg2m+AqfGy9Y
         eGzfd7PZlZ7c/2jV/8O1CTX8D5ayFfi+vsGCTIeQCHqy9S8DXUUCSnApq6XaNio+Ztfk
         stc3EMoZOGB0qqUb/iNiyhBoksnPUI5H2TPDnoycrqix62rz2DyTXDxHpKPp1iZtKBIZ
         ezuBsOWrNlc+XqIA2jTSY/NaUwX9WoEGuyVYbvlfZZKnIzwGBMxwn2HNggXZcgi/0d/N
         eETFgB4ZzmRg9XCSx8dX2D0Tj9GVjeIV7qiNE1lGV11sg+RQYPGq1n3xiRqHIHcqvuEs
         FJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708956150; x=1709560950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F62eeTl4P/lUv2qXfQTeyM9lbIH8G1u8VXxO64mOOAU=;
        b=GUQFLlR18NhiBkVpT/bcoaBsX84PXS6VsvXMFIIhcWDa7RAkeCQzLhFuO6kxBFS2rL
         dibMbMXgdcdZJU1/xUkvuGb4akUb10FH9oEUHOd6t+z2Jl4IKklluf20sKEq5ASrDPvh
         MvjPeWEfcH4dMNxugtsGe1ufnHu1QdQgQTc1eOwfKMZiUPwnNw7JlyjKkozogEiRA4nn
         cR//28miIoW1GALrvHTDhcVwpDsugeuQXtAWNpxUQVNP/GO8M8gZCIk8LA/f4H0ah4/b
         KpBQMgsPFJJbDjZeJ0wYm5gJpXvEBgEjQltJLl8gyTbbNP7skyKmPgoiIX7XtPdvABqX
         uSow==
X-Forwarded-Encrypted: i=1; AJvYcCWUu2ihPYVO5l9hTnSGigIgvzzG1AZFYsQ9qwnXajYy4AK2hk0nb5L4EVl22gIcdDDOxBSNokrWPGfnfoPGTO2CIpXteNVxgXYD/WNvlPG0L65Q
X-Gm-Message-State: AOJu0YzRbjvZ7qeqQHH77BBCAfjRK1BrOEiN4SmLksdHYPHyXiOxDZuF
	V84yfzu5ByZt7kfyrYICUbHu54LctJFUomKlCu4PO4ZJ8KxGYSG4nj5rRLJ/TEA=
X-Google-Smtp-Source: AGHT+IHscKedkQ0b/ug4V8wD/SHcqJqmEUf1to81tnkJ5MmC7hJV2OxNQvlYaWfsvt7J++chxx9drQ==
X-Received: by 2002:a05:600c:4712:b0:412:a1c6:ecd with SMTP id v18-20020a05600c471200b00412a1c60ecdmr2618588wmo.30.1708956150455;
        Mon, 26 Feb 2024 06:02:30 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:02:29 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 26 Feb 2024 15:01:55 +0100
Subject: [PATCH 17/18] arm64: dts: mediatek: add afe support for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v1-17-4fa1cea1667f@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
In-Reply-To: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2516; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=xG6Nj+SE5fOs36aPHS6J8P8h9OIISvMcqRKMRAq4LYM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JndiuFBdHmvYSuhV3YrAB4ZgAGaQLk95FRZXpfT
 wtQhZmaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3QAKCRArRkmdfjHURXRbEA
 CB9zjhs3sNHEteUCvQ7PrQLUoBwpi65oTqrtSHIx+d2xsx9LuHXmpU/xqe38wf+OtnmZOOJXZzKrpY
 i0XGXZ/6LpLMRhDtX3j8bre7wiZCd7P/u4QlKd1wEe308TC58uug9S5heRGPAG1FkkBAeRjMY96U9t
 pUZ2vFGYevyYNZ3hhdImBX8Eiyxum8nLgcwRTvy1GKYk8x1tNBNpvcIj2mDXX5vzTmwzYBZDSBILkD
 48ugwynpcguHwd+liyeNx752fp//0e2p1mo5uvO3SgAVjaRCLtujqhfaU1PIpis7Bj2oWMuF2dIouh
 cKX1zee+YOUH2t4EzgOIU+EFVz0P4NTEaQJnm/cHhlDcM+iFsYFqjrWSmhUOOeutQ7/Zohp27vtSTV
 +k07l7G5eQJ/fWDCLNpr5Um3MUer6A0GPYc+oD/n1N1IwUTUfkqSVYpIjIWGbetyn1Kl5y0aqEDPpL
 a9XAD58F/z9THIwcEtj5QIg5QwlfyjjanLxk4UEJq4MLstDl7/N84yXPN5F+WGYnmsMldbGRbGh1aV
 ZXUdVCS6iGy4MG65GdrHOZvVANbQ+8AD/4Oyqm3g8qDxWqUvTcvZugmTVO+S3yPP6WU8lV0bvZ+IuK
 ovAQgS57irkAK2DYyA2a6OjucJzc4Bof15oIZvsaabiHCsMnhhLk60UlZPLQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_140232_086323_31FACFA2 
X-CRM114-Status: GOOD (  11.53  )
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
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 47 ++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 24581f7410aa..13cd1298832b 100644
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
@@ -813,6 +815,45 @@ apu: syscon@19020000 {
 			reg = <0 0x19020000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		afe: audio-controller@11220000 {
+			compatible = "mediatek,mt8365-afe-pcm";
+			reg = <0 0x11220000 0 0x1000>,
+			      <0 0x11221000 0 0xA000>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_AUDIO>;
+			mediatek,topckgen = <&topckgen>;
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
+			status = "disabled";
+		};
 	};
 
 	timer {

-- 
2.25.1


