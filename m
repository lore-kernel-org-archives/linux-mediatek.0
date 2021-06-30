Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37084C11F68
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 09:08:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0AAE61D06
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 09:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0AAE61D06
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S0LaQqvuRKYS418975EFTryDRGAJWXggk3o9dLBk2yg=; b=bTEd/wNRj2ZaLo
	TaUfJXd/p12IEJt4O1CdUdRaLj0+44SJiVyM3J3UauO7dxvBER59a+Rpj1oFg9D2o5GsjoOdNItyi
	9tH+XU/LB29896T7vmv+5UxFyUkgX+okTG2442fMBsYA06Fv5MJ0jAtgk6ytTNB5aEywES/mPR543
	HgJC1rowZWYULv5Xb5+xhYg+cC0/10t+ZC+VJAtS6Meminkt9JCgrmef2Ed5UWTTpJ6gEH5oTiAOq
	CiDQO+jALZ9zxT4dZhUJ+VWtJV5FJjpIHOFOS1bh8YZtGIby7gEA8gBLS67W508tXtkZBR4skXnQL
	3w3yb4Sk78Ypl96Q/R9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyWCU-00DQW8-CD; Wed, 30 Jun 2021 09:08:06 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyWCA-00DQR3-Gk
 for linux-mediatek@lists.infradead.org; Wed, 30 Jun 2021 09:07:48 +0000
Received: by mail-pl1-x629.google.com with SMTP id h1so1103338plt.1
 for <linux-mediatek@lists.infradead.org>; Wed, 30 Jun 2021 02:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aQys5GN12uaIYBNi21P0NZEt05b9TZCM+O/CfFHqU3k=;
 b=eIfMHCtucigfsZNd1tGYT/ysBGjdw//6B6CRg1FDLNNtBUUa53kJWEqZxbPSTK7gOP
 xwj2f6Yu7JckIPxYJ9KuMZMVStoLP05ilQjgtaI2MjF33nETga0IGydbxUXz0/X/etmb
 zLgkoTsQ0t5bxWEj1L4kJrHMDbxWToESPKXSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aQys5GN12uaIYBNi21P0NZEt05b9TZCM+O/CfFHqU3k=;
 b=lvGJvAlabitLywTOJgS8J6ys7x+dzNphxyAuI9bOBEUUUO4u6pjkg28uZMdQaLkKQb
 1jhuY+nzlYtrdCHjcm2xR/J1x5HI1MYHMn61GWd5++sD01oPzB3ig9XFN3Oft5c6wgJg
 kRrZCqUssUHJqqQdkvz6yvRjLBNfu1EwVl8s+lKB0GczWVnrbhezEKdCalt/6n2ZtoAR
 Wolzeob1sfH5xkDVQgUKMPhwYi3PI5FvRTZjMiM38PTNAuMFqPW3j3wKuoBBAUQXdEqA
 lxUVTUaZNMHcjAOBl/VmMbILs6Cfa+CI7aCvZza6qsZM1ki3WUzP4h5pl5ZtoQUX35vL
 y+zg==
X-Gm-Message-State: AOAM533RuSxkHTMd6cbgUwyS49aCP+PLiqjKkqvPCjGm8XnapJhQRlHz
 AZmEueWs3QDL9IKiNJjCrFc7CQ==
X-Google-Smtp-Source: ABdhPJzFKQULQHVOig6m/gDmzm3vQNmqxw1Bj+LY4s0VrRayx7cM/qMWfaUB5uUO+oA/Do5fcqT+5g==
X-Received: by 2002:a17:90a:2d8c:: with SMTP id
 p12mr17129717pjd.41.1625044065559; 
 Wed, 30 Jun 2021 02:07:45 -0700 (PDT)
Received: from kansho.tok.corp.google.com
 ([2401:fa00:8f:203:fc06:b3f6:f016:8299])
 by smtp.gmail.com with ESMTPSA id 73sm20822239pfy.83.2021.06.30.02.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 02:07:45 -0700 (PDT)
From: Kansho Nishida <kansho@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Shunli Wang <shunli.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org,
 Eddie Huang <eddie.huang@mediatek.com>,
 Kansho Nishida <kansho@chromium.org>
Subject: [PATCH 1/2] arm64: dts: mt8183: add audio node
Date: Wed, 30 Jun 2021 18:07:09 +0900
Message-Id: <20210630180652.1.I88a52644e47e88b15f5db9841cb084dc53c5875c@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210630090710.1873559-1-kansho@chromium.org>
References: <20210630090710.1873559-1-kansho@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_020746_650113_A6945453 
X-CRM114-Status: GOOD (  10.04  )
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
