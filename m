Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD14C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 14:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKdTgT3KsHBdg4+GhO78bEt6cew1IEq5DPVjepzwO8s=; b=x/BH2sQ4TOcUIHjNjS6RkayC0E
	Vx8NWsFFdU24JpkIwgvB1/bKTSwx/Min7RCXngzzNcRX7QvmzdcEUx9GgEPKP6/MxvllWSd0RUQQd
	oNRGv3y3uYcHx93Ac2WvXFY+UmEck3/6J6cArtwjR3w54PhsPmM89GbqbX/BOr2IPmZe310q3twDi
	UtR6Xefv65H+lbJ39ZgWwMLiOBsUHPuEfTM3RIKhOgoi1t81dWMiBsDKzbXyTU6Y+Ev8buSa8Hk3B
	mf9ALa0bpbsjh4Axuqz4x5z+xBz1PLMRxpE4dIHBzKzZVLH0lzxilhOdWYH+6on6ORK14d1QU4dbs
	08q+q4jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwbS-00000001dmn-1Gjv;
	Wed, 19 Jun 2024 14:48:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwaj-00000001dH2-0Dqo
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Jun 2024 14:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xKdTgT3KsHBdg4+GhO78bEt6cew1IEq5DPVjepzwO8s=; b=X97rHLOrDkp5Pn+taLFa5kztj9
	3biNvnHmEPNg4UZSAO8yuKW9lXdn8YKe7Rj8U3gqJ7xkscyTEuy7UeTQvbvrnvmyFQAsit12mxX4H
	fnwtnEbUDx2lPp9UABOKnyz9upgpuqqijBzWEmAJ9GOn6ZOqvwOcRO070Mp05Tlhpv0wcAv06MbGe
	s+JSigHcksjdZRWh9DHhUW0FZNEfaWjFjA8LGdI+c0IOWrDVGkSEtSegERg9A5C543G0I+n7+PPJc
	9iquZj1vq3eKwBosepvvsxPKzH1Rgrw96M2jdoUjE0XIlvDtD7OPLn9vul/jSxlPcSPxtb53YQw89
	xU3jECQg==;
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwaf-00000007MrX-0rql
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Jun 2024 14:47:15 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a62ef52e837so865109366b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jun 2024 07:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718808431; x=1719413231; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKdTgT3KsHBdg4+GhO78bEt6cew1IEq5DPVjepzwO8s=;
        b=KGsWrzlyjBRAMb3658r6hmlt4pqfgvHxCmnNIGmkz1kvFvsh9OqINSGrbLH+Nk8M6q
         g3Qy/zRAS1opCbVoASy750nkYUqv/d1SNwc5XEAo+DFtlbstShtZShw99sdzORgLkvPF
         S5+ruD1AH2svSr9c4U9U8yr5Z+r3W+ZCtMHUs98sZyo2y78GrbK97WMDUh81jTfMufaR
         k2HNhj5YxcP6SIpiZDxUytVIMkE1WMNoBh3XG56lmY8z9qRwhZZEZDWNIXtPeg/B0jEa
         H85++Pidt4neADGeFubWC4kZscCU61+QxN/ZoikHFB+6Im984KLRPU/VHnvfAdJ44Crr
         qXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718808431; x=1719413231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKdTgT3KsHBdg4+GhO78bEt6cew1IEq5DPVjepzwO8s=;
        b=cJoh6dAVc2R4M+8ShgoPi8CnSWyNWaT5vpuOz/0lWCMlQUk6Htt4R6nJhFsif1hTlU
         Iv0hQsFkVEAV4WUEMUvVsUXe4s7H/NyPkHKemFCEem+BAc1tHh/krZtjCqzB/eEsHJy1
         4uN0sihsYc34DHsTW3Bb4HlPgUkxDyH1Tswqpo3h8wLiTytE/l3jG2MBM6s1NzeT2S5o
         PMqu3Bmj7d5RuaAj2m20pdE9sDuSHDS5HVWi5ukGvLUDzf6Cge+uNgE6W4L7g26QoIIU
         AYRtbbvH/P9c8UT6FEUQVbMzKL1mQjszXqyuJBnXrXbbUXI0R18vYielvV7nr/N48gK5
         sScw==
X-Forwarded-Encrypted: i=1; AJvYcCWnMghbeVkLXUHfn5+7m1HBaFaR96aSTx+rAcoGCmCXyUB8EXf6m2+i318hp+RrxSs+g4TtrE/KLLHv5tc0VaFm8hkRqZ+bLDID/Wi2DuLWhaEs
X-Gm-Message-State: AOJu0Yz9c7UdNHsbHUD5Ae9sDqCb1tPVlSGHyrzODediQJ2xTOEceTM/
	x4Lx6TDTHamanHw9I8xSHUrn3EhqtvZo4ENALr5JFq85qUrVQT+RMkS1YuhRvZc=
X-Google-Smtp-Source: AGHT+IGCnG2pTThkiqXcOingw3RqWOz7QhNzIa0SDzL44Gp2GhFVFafYQMJmYo6Mrn8IERzv8AqDuw==
X-Received: by 2002:a17:906:d83:b0:a65:7643:3849 with SMTP id a640c23a62f3a-a6fab7d6be4mr159683266b.73.1718808431514;
        Wed, 19 Jun 2024 07:47:11 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a6f56da32c3sm679787566b.13.2024.06.19.07.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:47:11 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 19 Jun 2024 16:46:51 +0200
Subject: [PATCH v6 15/16] arm64: dts: mediatek: add afe support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v6-15-f754ec1a7634@baylibre.com>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
In-Reply-To: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmcu9RsrsWB/A8n6NS3M+CUIPC+mnw1CAbYx2HRgfv
 OENvgSeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZnLvUQAKCRArRkmdfjHURaw8EA
 CwGU/+3mpi2Q0d7lCiclbZACS5EVpIo5IgyXdSHKCpRs+IiYvjKxgWgF/DnPc62N7OGq9430yeOgGw
 h5PYZvPfVYyOecw8V8eFqsQiEsM8TvNr3PNEAuUkhyuR2sHHMr1+cFVV85CWvBr8VzSKjZxvGAmD+U
 poWAWbKgQTAk4UIfRs00WeveAZH7lfauSf6mMlpehCSxod4uioKGnTiPe5wB8b9yH2M7b61HolsxfG
 J1a1+W0W3hMcglFE2qtKyV5HRpX0o4adOCf8HRN+nC4/GXAeFDd9b1l3vMQyCazPJk5iLBVzFcWpgk
 MbjoDMwfm4FLePT3kZcUF009fClCG6GRuTGOuCRF9WyPf1nP/xqQ7WZD5X87D0vPBE+8vgQHjDoHjD
 RrtfDTdCP0+hYoPgL/T3v8sZRSxrz6hKLc+dX3N64SR1Ymv/q/rVHUofaj99w5AhG8TiTT7ouZnOCX
 WyH0iurf7yuoiRc2fHGAcBLLAT8+1ZaCqLW75z7H+boYKXwIDhXoeP0LQjwg+ZXMzi6FmHwQy/vr91
 kPBEmog0hNFXqGQg1pDWW8BQNtnGpK26p2Mh55weXm4UZ27qkLtuVMZhpEKIbngPdsIOURwnAxOoQz
 v7SL2Hk16lcpt3XFLcRPGclHZtuCBw3WTbFycbXVtYnVp8TzF7oCjMCpaizQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_154713_791745_4FC42571 
X-CRM114-Status: GOOD (  11.45  )
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


