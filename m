Return-Path: <SRS0=ODC1=66=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FF5C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2020 16:48:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74B78206D4
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2020 16:48:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mHVLiCUH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBLkylU4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74B78206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QmhThUu/lUKuGdxobsMNUaGuLA16ttm4qof0jSRm6B8=; b=mHVLiCUHpp/Vzq
	+70oyqNNZ2t18rdJ49JLZ0nBxgUfLlnrbidVg8UWrNW0kQIqB1QD6/o+lUTkMO29Jda0hJ/kRp3nk
	FKrG6oDWRm58Brzlw6Pq/9NA1YHchu5NRzKZWHOX+KbhxabFrkQ0dvdGDORMZkL3L5vGAGTMQMTDa
	xf6fJ9Qs2T2x9hnPXnRIZXOEZegB9DpLUi5fEfwpMQSgrKM5jnD5bErFCicSnx77a06AM0HOg+NRi
	vpy9iQF4rASDlxc7HlsDa9kGxNrqeVgcOcXrgNOGecLLs5DFlAlOrRVtuWcNoPUc2yLN4A+0DeQ6K
	f4bAJKSDw38Jq/sbkQig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZzyp-0002wW-Ds; Sat, 16 May 2020 16:48:07 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZzym-0002vx-I6
 for linux-mediatek@lists.infradead.org; Sat, 16 May 2020 16:48:06 +0000
Received: by mail-wr1-x442.google.com with SMTP id w7so6909433wre.13
 for <linux-mediatek@lists.infradead.org>; Sat, 16 May 2020 09:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vyXaylWwp5mEFmSN189+QjFX88zUbmb9Ujp8cd68l5Y=;
 b=nBLkylU4acI+q/wN6bpa7cEmYDgalK/iVBl7NqvN3WZOF2uS6TaFR838ZTY6a7ssBj
 79+QmbGwUKgboTNXZzwp6rRj42QW82yjO15v+iRI1mxl9xTHs+hzUDQeZTm9v5FCS6CS
 hLEnpjzy/aamfj0kYTvNF4NNbL+awQQmf4IbWnTmXK4pRR6rPcfaqs/Qoi96PFBWBGZk
 z/i+Xra75yKtBmGlVCQIIppbrJ67oJtZREi6Cl6SYE1DQELdM9/gDxCLWg2uvg9eylnn
 5iCXeoRKrdlAAzwe9fFGtcOIhAjWEhqXIt5443FT4XtFj51VZBpokNzN2Rn8lJId35sO
 +Qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vyXaylWwp5mEFmSN189+QjFX88zUbmb9Ujp8cd68l5Y=;
 b=Ho1OGY3xW/FKMcbporXcB55BjUqSG5m9nmiFirAjPQbfLVGZ7ecipn+xgAbrUrhEkb
 F4gzFb6LGsfxRfHLfrgaz4NapJDyVx2jADetRrj9n1+MbhUu0t0cCtUygUcU2NVmm0on
 nHjka6lWIqeFCmtBav1VYcSi/lYnN7ScSJ7NDCFvnltCBahBlfVVtU9tM/PHI0iCNdR9
 3UQsEgPItlOtwLTgQwwYH1Apj8xR6mWx8x6EF+/iN51T76LsX18yiUfS+XQo0smPaO50
 a5el8vHeJAhvwRTaQijx8mF148gAJNpeKqjM2HHH8IZMwG8C+4DxlOCfJvNyJD6J1S9G
 rkbQ==
X-Gm-Message-State: AOAM531acw7qV5pHjKT5Sq/qeUo8rt2UyUWChNGBSev5sK8vIv6iJz+s
 Xsd7K/bQ1Z3ueR/4hTQpK5wqdIRb
X-Google-Smtp-Source: ABdhPJxAHkB5NVhyTws34iIDX641b527nze1ZVPLU0bCTaOESNg+C3+wcFRaJKG4FlRmaoWoT46b4A==
X-Received: by 2002:adf:a1cb:: with SMTP id v11mr11214418wrv.39.1589647682657; 
 Sat, 16 May 2020 09:48:02 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.243])
 by smtp.gmail.com with ESMTPSA id x6sm8202288wrv.57.2020.05.16.09.48.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 May 2020 09:48:02 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: add audio node
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, robh+dt@kernel.org
References: <1559360354-22974-1-git-send-email-jiaxin.yu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <9720d589-4131-dc3e-0d7d-4751f136ca77@gmail.com>
Date: Sat, 16 May 2020 18:48:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1559360354-22974-1-git-send-email-jiaxin.yu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200516_094804_600465_B95E6391 
X-CRM114-Status: GOOD (  16.99  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: erin.lo@mediatek.com, eddie.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 01/06/2019 05:39, Jiaxin Yu wrote:
> Add audio note for MT8183.
> 

Please extend the commit message and the subject line. Subject line should
include at least mt8183.


> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
> Hi,
> 	This patch is based on 5.2-rc1 and these patches:
> 	https://patchwork.kernel.org/patch/10962375/
> 	https://patchwork.kernel.org/patch/10858941/
> 
> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 93 +++++++++++++++++++++++++++++++-
>  1 file changed, 91 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 75c4881..b48194f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -298,11 +298,100 @@
>  			clock-names = "baud", "bus";
>  			status = "disabled";
>  		};
> -
> -		audiosys: syscon@11220000 {
> +		audiosys: audiosys@11220000 {

Having a look at the binding descritpion it should be "clock-controller".

Regards,
Matthias

>  			compatible = "mediatek,mt8183-audiosys", "syscon";
>  			reg = <0 0x11220000 0 0x1000>;
>  			#clock-cells = <1>;
> +			afe: mt8183-afe-pcm {
> +				compatible = "mediatek,mt8183-audio";
> +				interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
> +				power-domains =
> +					<&scpsys MT8183_POWER_DOMAIN_AUDIO>;
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
>  		mfgcfg: syscon@13000000 {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
