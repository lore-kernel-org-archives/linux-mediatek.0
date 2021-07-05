Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA8AC07E99
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 09:15:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACD71613CB
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 09:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACD71613CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2QFroLnkW/MoTmIspRvvivnG7+Kxb4vlZWP1SQ18Nss=; b=bNYsgdMwLSUXFb
	TLY5YSiSTcX72FruZiQtJnEGF4TWTxZ8UlfgYd9Fjoc1/5aHPKkV+irK+j991NVC5zi0cW4trLfga
	Lbw0Px3aT+9tA1JfAx49CzpKL0rp7sGUj9xhbHLO0LZHZEq2ZodLd2UeIvSZAcFLo0E+CHShgdwTH
	8SQ+ijQSfdkbpXdvT9nzfo1TPMQFVmSt8LLFIeJ97Q8tHlvc1xBHFAXpzvXvGUDPheoks0/sOO46v
	cDyKrfoPOFiJCmX1mEJ0GkU7uePRQQfL2qcEAvm8KxTl9b54na+LJ2f9szlX6aYgUuPdM3APr4MR7
	j2a6c7pcJX9SI1WrlS5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0KhX-008O5B-TX; Mon, 05 Jul 2021 09:15:39 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0KhN-008O1H-OX
 for linux-mediatek@lists.infradead.org; Mon, 05 Jul 2021 09:15:31 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 cs1-20020a17090af501b0290170856e1a8aso14443695pjb.3
 for <linux-mediatek@lists.infradead.org>; Mon, 05 Jul 2021 02:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=69UkCOWHSMmakFavbClBD5LGETqvVrLFh8SBxi0UCyc=;
 b=kG2Kn1SNthgjjFuqDS/vlYrvSG+KdUH3d+S0dWJNzb5SiVUcg/QS4NH/vT85U5EB5m
 wKMOAJytwGz5y1KpaMv2I13/YxOekUV3eOYmov049z4H5RTJbxqrddSyPERKW48+0cCS
 1DAMHriEiuCu6ejyPGjSN5wK26FWSAzlIvk2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=69UkCOWHSMmakFavbClBD5LGETqvVrLFh8SBxi0UCyc=;
 b=N7WZlVXarVK48rUnrrMjq89PLm/Wjzef7X+hH2OhY6HV6DKpDIqyhFH9p+tJgDPEhd
 fqtBpyEOl5p7wvW8AUOQT/k7eMH/HoPbFI/j9kQFy8mKuTgqQfHXnbRojOKjmZCYdh2L
 WJjYyU/klCBP5yICtozrNGMRSXlabhca9ShVQJIOYUxj6qrnG6vXIWj21z8788KiQFEH
 RZgOiE9hHGpLSJ6Yqi2hQL3OJ2BziikczV6HijfnZZGSWjAAcvNturezELr9OzEq7M+4
 9RPLEG5n3J8CUjdh19QZ3eUkU6fDz7Dpf8hAfiEEiF0uRhmmvVd2MEW+Tkzvs1xTE0Wz
 Yl9g==
X-Gm-Message-State: AOAM531YNLsYV5iKV3re/JFQjTNkspw01ld4IVPxc+LG7RyK9wNAl7Mz
 giDmzZ7q7GANRe/JH8MScsgTKA==
X-Google-Smtp-Source: ABdhPJyYN9I5E0K1lmQDLJPBVyCj9l12Ho1RfQ9GcuksyXiVAxdmi0yC3Xzy7ps3R20/5Do52wqEWQ==
X-Received: by 2002:a17:902:cecb:b029:128:e535:89f2 with SMTP id
 d11-20020a170902cecbb0290128e53589f2mr11748651plg.51.1625476529351; 
 Mon, 05 Jul 2021 02:15:29 -0700 (PDT)
Received: from kansho.tok.corp.google.com
 ([2401:fa00:8f:203:cdc4:4be8:5ce4:df43])
 by smtp.gmail.com with ESMTPSA id 9sm12245176pfv.42.2021.07.05.02.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 02:15:29 -0700 (PDT)
From: Kansho Nishida <kansho@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Shunli Wang <shunli.wang@mediatek.com>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Kansho Nishida <kansho@chromium.org>
Subject: [PATCH v2 1/2] arm64: dts: mt8183: add audio node
Date: Mon,  5 Jul 2021 18:15:13 +0900
Message-Id: <20210705181443.v2.1.I88a52644e47e88b15f5db9841cb084dc53c5875c@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210705091514.912355-1-kansho@chromium.org>
References: <20210705091514.912355-1-kansho@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_021529_852785_F850FF36 
X-CRM114-Status: GOOD (  10.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add afe (audio front end) device node to the MT8183 dtsi.

Signed-off-by: Kansho Nishida <kansho@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 94 +++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index f90df6439c08..b06acb8d6527 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1115,10 +1115,102 @@ usb_host: usb@11200000 {
 			};
 		};
 
-		audiosys: syscon@11220000 {
+		audiosys: clock-controller@11220000 {
 			compatible = "mediatek,mt8183-audiosys", "syscon";
 			reg = <0 0x11220000 0 0x1000>;
 			#clock-cells = <1>;
+			afe: mt8183-afe-pcm {
+				compatible = "mediatek,mt8183-audio";
+				interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
+				resets = <&watchdog MT8183_TOPRGU_AUDIO_SW_RST>;
+				reset-names = "audiosys";
+				power-domains =
+					<&spm MT8183_POWER_DOMAIN_AUDIO>;
+				clocks = <&audiosys CLK_AUDIO_AFE>,
+					 <&audiosys CLK_AUDIO_DAC>,
+					 <&audiosys CLK_AUDIO_DAC_PREDIS>,
+					 <&audiosys CLK_AUDIO_ADC>,
+					 <&audiosys CLK_AUDIO_PDN_ADDA6_ADC>,
+					 <&audiosys CLK_AUDIO_22M>,
+					 <&audiosys CLK_AUDIO_24M>,
+					 <&audiosys CLK_AUDIO_APLL_TUNER>,
+					 <&audiosys CLK_AUDIO_APLL2_TUNER>,
+					 <&audiosys CLK_AUDIO_I2S1>,
+					 <&audiosys CLK_AUDIO_I2S2>,
+					 <&audiosys CLK_AUDIO_I2S3>,
+					 <&audiosys CLK_AUDIO_I2S4>,
+					 <&audiosys CLK_AUDIO_TDM>,
+					 <&audiosys CLK_AUDIO_TML>,
+					 <&infracfg CLK_INFRA_AUDIO>,
+					 <&infracfg CLK_INFRA_AUDIO_26M_BCLK>,
+					 <&topckgen CLK_TOP_MUX_AUDIO>,
+					 <&topckgen CLK_TOP_MUX_AUD_INTBUS>,
+					 <&topckgen CLK_TOP_SYSPLL_D2_D4>,
+					 <&topckgen CLK_TOP_MUX_AUD_1>,
+					 <&topckgen CLK_TOP_APLL1_CK>,
+					 <&topckgen CLK_TOP_MUX_AUD_2>,
+					 <&topckgen CLK_TOP_APLL2_CK>,
+					 <&topckgen CLK_TOP_MUX_AUD_ENG1>,
+					 <&topckgen CLK_TOP_APLL1_D8>,
+					 <&topckgen CLK_TOP_MUX_AUD_ENG2>,
+					 <&topckgen CLK_TOP_APLL2_D8>,
+					 <&topckgen CLK_TOP_MUX_APLL_I2S0>,
+					 <&topckgen CLK_TOP_MUX_APLL_I2S1>,
+					 <&topckgen CLK_TOP_MUX_APLL_I2S2>,
+					 <&topckgen CLK_TOP_MUX_APLL_I2S3>,
+					 <&topckgen CLK_TOP_MUX_APLL_I2S4>,
+					 <&topckgen CLK_TOP_MUX_APLL_I2S5>,
+					 <&topckgen CLK_TOP_APLL12_DIV0>,
+					 <&topckgen CLK_TOP_APLL12_DIV1>,
+					 <&topckgen CLK_TOP_APLL12_DIV2>,
+					 <&topckgen CLK_TOP_APLL12_DIV3>,
+					 <&topckgen CLK_TOP_APLL12_DIV4>,
+					 <&topckgen CLK_TOP_APLL12_DIVB>,
+					 /*<&topckgen CLK_TOP_APLL12_DIV5>,*/
+					 <&clk26m>;
+				clock-names = "aud_afe_clk",
+						  "aud_dac_clk",
+						  "aud_dac_predis_clk",
+						  "aud_adc_clk",
+						  "aud_adc_adda6_clk",
+						  "aud_apll22m_clk",
+						  "aud_apll24m_clk",
+						  "aud_apll1_tuner_clk",
+						  "aud_apll2_tuner_clk",
+						  "aud_i2s1_bclk_sw",
+						  "aud_i2s2_bclk_sw",
+						  "aud_i2s3_bclk_sw",
+						  "aud_i2s4_bclk_sw",
+						  "aud_tdm_clk",
+						  "aud_tml_clk",
+						  "aud_infra_clk",
+						  "mtkaif_26m_clk",
+						  "top_mux_audio",
+						  "top_mux_aud_intbus",
+						  "top_syspll_d2_d4",
+						  "top_mux_aud_1",
+						  "top_apll1_ck",
+						  "top_mux_aud_2",
+						  "top_apll2_ck",
+						  "top_mux_aud_eng1",
+						  "top_apll1_d8",
+						  "top_mux_aud_eng2",
+						  "top_apll2_d8",
+						  "top_i2s0_m_sel",
+						  "top_i2s1_m_sel",
+						  "top_i2s2_m_sel",
+						  "top_i2s3_m_sel",
+						  "top_i2s4_m_sel",
+						  "top_i2s5_m_sel",
+						  "top_apll12_div0",
+						  "top_apll12_div1",
+						  "top_apll12_div2",
+						  "top_apll12_div3",
+						  "top_apll12_div4",
+						  "top_apll12_divb",
+						  /*"top_apll12_div5",*/
+						  "top_clk26m_clk";
+			};
 		};
 
 		mmc0: mmc@11230000 {
-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
