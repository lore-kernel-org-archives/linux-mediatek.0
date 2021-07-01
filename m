Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBFDC11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 18:21:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93A7D6141D
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 18:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93A7D6141D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=v4vYtihoRUagpypEra5KPaU5qTwEC4BDAv3ITjdEoU4=; b=vypgaoAd/qOqmgmh5f+IcheAeW
	OMKqBvgG62YZpTHFnbqlKTlai8iKYVitUFlZOVLoaA8/xB07qtXSvfd3NVNEaSCY1DqYdBITDiHfO
	MdTj+P6ZboieCergPveOh9DZ0Zy3zjlDIzP0pPG5igKNcamBKWEIYgLhZI1di1S9QKMtjpUitIqHx
	85OYFW/FJvqPeMtgCCX06scCFRMTbcKxwgwWB7yMg2mFkL8FIRTeE4qNc5nRVr3Gx3sKSJJiYARve
	r8Vlt5DWSBF1X44VVl1Jby9su35f/FW8TMuhZAmnoAK7SR+ivwelr/QSyfiQ9KfbrHeRdqq1gsLCL
	1DnOHV3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz1J7-000kN4-FD; Thu, 01 Jul 2021 18:21:01 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz1Iu-000kLL-Vp; Thu, 01 Jul 2021 18:20:50 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so4705571wmc.2; 
 Thu, 01 Jul 2021 11:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AMftSGfD02OUyEuz7LoC3Zz1MSCEdM4XzT0g1jVjTuU=;
 b=H4aGs5w3mukwLmaDwPl32T6m6Iv7EecgCY6XuCURcmT4Ae9zKM+BZL9oB2FXSMLOBF
 KguCwU0Fd87uoAf06f7KZAgo4kuSMomWYQGE5l2nwezHXkzwMla3Aa3cBvCtQyCLVp9c
 Z1Xw5USW2xJDP8qspegmOx7vtlsNS4RzvcQboIYJQMEeukZh/f06LjFTA4k53jpaogrB
 0lGIIKdvMkHG8jiQWVNJeosLhd2K7wX/5d8atCeReCzzgSCZrESiozbHVMIjK3tM6f4O
 NMR4CfiJ4RxmNX9oVR7OFaFLgz662zcBGPNIfkKJUxEhUr7EIoFZk/8cPxdObtOM9f+f
 DMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AMftSGfD02OUyEuz7LoC3Zz1MSCEdM4XzT0g1jVjTuU=;
 b=eEoTjsApSNd9Q1iIHM9+jgj5xjudQ2nwh0GawJvTtWpkADaMM3uCOMTtj7JDB3vz4q
 FNraKotq+WaFvCkRHpYCQGUgN632zVIq0VT2aqIwRhTMHZq0m9cwAVFvFmlKoWRnTDMT
 RNqBzvHZr0eiASZH/bggtP8xF9fMTN0XhtEImdfxnAMDLo3HTNEjl7s6U6CIbzetAXx6
 53O8m7NrfvSA+kWuQ9I+LjRixTudOM0JSiYkvDSTTZ81+QGJYl/38Dqp2NExTdWOhKD5
 Qxs84xNTI7RFJFLCM5myPwbC9ci4wzjML3H8BeSA+Lsc0coJqOT6rB0XmVvs2j/8dFSj
 GILA==
X-Gm-Message-State: AOAM532jjaqxaSBZt58uTQjw2iuOBSXPKIZ74nbRCx2hil2aqyfDzd9P
 XYKRrB9G9uAt2l01UJap3lo=
X-Google-Smtp-Source: ABdhPJz2R0JQQlC0/ugw4zGK6F1lSSMuS3dzMwOZgf97/e/+IhDofmyKSRkr2WBurRIYWcIzOC33vQ==
X-Received: by 2002:a05:600c:3652:: with SMTP id
 y18mr12166531wmq.63.1625163644676; 
 Thu, 01 Jul 2021 11:20:44 -0700 (PDT)
Received: from ziggy.stardust ([213.195.127.100])
 by smtp.gmail.com with ESMTPSA id r18sm854836wmh.23.2021.07.01.11.20.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 11:20:44 -0700 (PDT)
Subject: Re: [PATCH 1/2] arm64: dts: mt8183: add audio node
To: Kansho Nishida <kansho@chromium.org>
Cc: linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Shunli Wang <shunli.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Eddie Huang <eddie.huang@mediatek.com>
References: <20210630090710.1873559-1-kansho@chromium.org>
 <20210630180652.1.I88a52644e47e88b15f5db9841cb084dc53c5875c@changeid>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <716ab7a7-937d-df88-8d3c-8d35df473b4e@gmail.com>
Date: Thu, 1 Jul 2021 20:20:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210630180652.1.I88a52644e47e88b15f5db9841cb084dc53c5875c@changeid>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_112049_080950_DCF233E8 
X-CRM114-Status: GOOD (  16.53  )
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



On 30/06/2021 11:07, Kansho Nishida wrote:
> Add afe (audio front end) device node to the MT8183 dtsi.
> 
> Signed-off-by: Kansho Nishida <kansho@chromium.org>
> ---
> 
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 94 +++++++++++++++++++++++-
>  1 file changed, 93 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index f90df6439c08..b06acb8d6527 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1115,10 +1115,102 @@ usb_host: usb@11200000 {
>  			};
>  		};
>  
> -		audiosys: syscon@11220000 {
> +		audiosys: clock-controller@11220000 {

Why do you change it from sysecon to clock-controller?

Regards,
Matthias

>  			compatible = "mediatek,mt8183-audiosys", "syscon";
>  			reg = <0 0x11220000 0 0x1000>;
>  			#clock-cells = <1>;
> +			afe: mt8183-afe-pcm {
> +				compatible = "mediatek,mt8183-audio";
> +				interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
> +				resets = <&watchdog MT8183_TOPRGU_AUDIO_SW_RST>;
> +				reset-names = "audiosys";
> +				power-domains =
> +					<&spm MT8183_POWER_DOMAIN_AUDIO>;
> +				clocks = <&audiosys CLK_AUDIO_AFE>,
> +					 <&audiosys CLK_AUDIO_DAC>,
> +					 <&audiosys CLK_AUDIO_DAC_PREDIS>,
> +					 <&audiosys CLK_AUDIO_ADC>,
> +					 <&audiosys CLK_AUDIO_PDN_ADDA6_ADC>,
> +					 <&audiosys CLK_AUDIO_22M>,
> +					 <&audiosys CLK_AUDIO_24M>,
> +					 <&audiosys CLK_AUDIO_APLL_TUNER>,
> +					 <&audiosys CLK_AUDIO_APLL2_TUNER>,
> +					 <&audiosys CLK_AUDIO_I2S1>,
> +					 <&audiosys CLK_AUDIO_I2S2>,
> +					 <&audiosys CLK_AUDIO_I2S3>,
> +					 <&audiosys CLK_AUDIO_I2S4>,
> +					 <&audiosys CLK_AUDIO_TDM>,
> +					 <&audiosys CLK_AUDIO_TML>,
> +					 <&infracfg CLK_INFRA_AUDIO>,
> +					 <&infracfg CLK_INFRA_AUDIO_26M_BCLK>,
> +					 <&topckgen CLK_TOP_MUX_AUDIO>,
> +					 <&topckgen CLK_TOP_MUX_AUD_INTBUS>,
> +					 <&topckgen CLK_TOP_SYSPLL_D2_D4>,
> +					 <&topckgen CLK_TOP_MUX_AUD_1>,
> +					 <&topckgen CLK_TOP_APLL1_CK>,
> +					 <&topckgen CLK_TOP_MUX_AUD_2>,
> +					 <&topckgen CLK_TOP_APLL2_CK>,
> +					 <&topckgen CLK_TOP_MUX_AUD_ENG1>,
> +					 <&topckgen CLK_TOP_APLL1_D8>,
> +					 <&topckgen CLK_TOP_MUX_AUD_ENG2>,
> +					 <&topckgen CLK_TOP_APLL2_D8>,
> +					 <&topckgen CLK_TOP_MUX_APLL_I2S0>,
> +					 <&topckgen CLK_TOP_MUX_APLL_I2S1>,
> +					 <&topckgen CLK_TOP_MUX_APLL_I2S2>,
> +					 <&topckgen CLK_TOP_MUX_APLL_I2S3>,
> +					 <&topckgen CLK_TOP_MUX_APLL_I2S4>,
> +					 <&topckgen CLK_TOP_MUX_APLL_I2S5>,
> +					 <&topckgen CLK_TOP_APLL12_DIV0>,
> +					 <&topckgen CLK_TOP_APLL12_DIV1>,
> +					 <&topckgen CLK_TOP_APLL12_DIV2>,
> +					 <&topckgen CLK_TOP_APLL12_DIV3>,
> +					 <&topckgen CLK_TOP_APLL12_DIV4>,
> +					 <&topckgen CLK_TOP_APLL12_DIVB>,
> +					 /*<&topckgen CLK_TOP_APLL12_DIV5>,*/
> +					 <&clk26m>;
> +				clock-names = "aud_afe_clk",
> +						  "aud_dac_clk",
> +						  "aud_dac_predis_clk",
> +						  "aud_adc_clk",
> +						  "aud_adc_adda6_clk",
> +						  "aud_apll22m_clk",
> +						  "aud_apll24m_clk",
> +						  "aud_apll1_tuner_clk",
> +						  "aud_apll2_tuner_clk",
> +						  "aud_i2s1_bclk_sw",
> +						  "aud_i2s2_bclk_sw",
> +						  "aud_i2s3_bclk_sw",
> +						  "aud_i2s4_bclk_sw",
> +						  "aud_tdm_clk",
> +						  "aud_tml_clk",
> +						  "aud_infra_clk",
> +						  "mtkaif_26m_clk",
> +						  "top_mux_audio",
> +						  "top_mux_aud_intbus",
> +						  "top_syspll_d2_d4",
> +						  "top_mux_aud_1",
> +						  "top_apll1_ck",
> +						  "top_mux_aud_2",
> +						  "top_apll2_ck",
> +						  "top_mux_aud_eng1",
> +						  "top_apll1_d8",
> +						  "top_mux_aud_eng2",
> +						  "top_apll2_d8",
> +						  "top_i2s0_m_sel",
> +						  "top_i2s1_m_sel",
> +						  "top_i2s2_m_sel",
> +						  "top_i2s3_m_sel",
> +						  "top_i2s4_m_sel",
> +						  "top_i2s5_m_sel",
> +						  "top_apll12_div0",
> +						  "top_apll12_div1",
> +						  "top_apll12_div2",
> +						  "top_apll12_div3",
> +						  "top_apll12_div4",
> +						  "top_apll12_divb",
> +						  /*"top_apll12_div5",*/
> +						  "top_clk26m_clk";
> +			};
>  		};
>  
>  		mmc0: mmc@11230000 {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
