Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E87FC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 14:49:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 072D960F25
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 14:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 072D960F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wTM9OUZjEzpBVmxRLwdgqKEOJRShlsub+yaQ1efNT2o=; b=iVETlA4UofbWwY7/K7ovX2RNPg
	5A6UMiXRXV+OSVUhQ+A5Lyph4MWlS4fzS6JlF+O2iBPWpqt040qNo51sXocQ5Cer5TeBEDb1n4Uep
	nDDPWb4mRpvdsZSKkQT8wCrgI8i++KxdxS3wzVD/xhpnUabifQ9kvPQyL4rLMqzXxQpQoS2In7WLY
	Zb7MEl19nZmMW4lD0FHaC6xD9cqCIYgFaqF3DxnBoNNK6uyq+Xy74wLjo7fA4+RyA2DiOc50/lN96
	InHbygycWAjazIu8sUBuRirLujLGtux0eAGbREqgJqmTXR64nh+GGuxj5cnaqNBy6r/bsXhmoIQa5
	oTs13OLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDT4R-004FWr-Ph; Tue, 10 Aug 2021 14:49:35 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDT4O-004FVo-Rj; Tue, 10 Aug 2021 14:49:34 +0000
Received: by mail-wr1-x435.google.com with SMTP id f5so10875246wrm.13;
 Tue, 10 Aug 2021 07:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qkLAa3qaTd+8nDqfmQYHkSkAUgc2KH2yxW7jHafFEGU=;
 b=C75iiIP8Jinw9T3dzyHeFsZhnT3b/VHrUjcreDn10v1lsE0miVUhACe1lClAq5tc5N
 1FlxOq9u7eTwlI8i8EBt7STg8ero3hdHZ3lSYi9h41aPQo24TJvf0rCihR20D7QpZQDo
 Y/MDjQuJ8faLOxOs5ASv+i6/DDj7y/SrWmOADCkR3XUt02UiYJyQnH0f5zJ/1w/4IO6Y
 uoY9I3Hi7FUB7oABb43pHRsjNDco4VWtPLMHwudTSbRozJYHM2HZ8uSk5zXUbSOtBgdP
 AIXDn/Q0lTeADtcjkUAX8pjLBe3CiLelEXySkplZulP4KelUCpG2LOkCTF4i9KF2u4F3
 rSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qkLAa3qaTd+8nDqfmQYHkSkAUgc2KH2yxW7jHafFEGU=;
 b=LOxBbsCWCB1jaP0sKLLRk/iap9GoPq7x0RLBUGOQkve4FaBslE8cg55gU+QS4mdOKH
 3VzyDqK3agvvf2Cr+Bmz9eUIdvOwUWOG7vEC00S0IboIxZrcZdsJxPeTlwFspTk5Hmt4
 qg9JWEVmbjQceSEgcoWTSyybVCdD+OaqUxyxpKFiqg7a6RXE5lByidNrTKrZ4z0OAZLz
 CCo5+jH3yMvDDe/pD05MLoKyQ3Uv4dPhb9eJTEc4G4JgeBt2EXqmEsmnnQw4DIsQmBK4
 Aq621fmzPLLQJADOnGo/myfDfzZBMmGyEJAdnPKJD3uSUTQDlQ9Z7r1vz//NZ4/kP2er
 gZHA==
X-Gm-Message-State: AOAM532n6ozDlrVRLRifwYyLQJoLtl56WoClumFymMxHwhEKNja5JkqL
 rxln07ZlnhLml5HSNz2HlMI=
X-Google-Smtp-Source: ABdhPJyGpIjjK7YDyXqguWBe5fWsAo8d3ezNZSAlt17FwtPkid466C2w4F3IrtUJvrAa8VWvNtZQrw==
X-Received: by 2002:a5d:6d0f:: with SMTP id e15mr4355140wrq.373.1628606970305; 
 Tue, 10 Aug 2021 07:49:30 -0700 (PDT)
Received: from ziggy.stardust ([207.188.163.204])
 by smtp.gmail.com with ESMTPSA id n30sm26883031wra.1.2021.08.10.07.49.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 07:49:29 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] arm64: dts: mt8183: add audio node
To: Kansho Nishida <kansho@chromium.org>
Cc: Shunli Wang <shunli.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Eddie Huang <eddie.huang@mediatek.com>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Chen-Yu Tsai <wenst@csie.org>
References: <20210706100136.1205047-1-kansho@chromium.org>
 <20210706190111.v3.1.I88a52644e47e88b15f5db9841cb084dc53c5875c@changeid>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <3db268d2-b662-8fd4-d6dd-0679fa010b71@gmail.com>
Date: Tue, 10 Aug 2021 16:49:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210706190111.v3.1.I88a52644e47e88b15f5db9841cb084dc53c5875c@changeid>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_074932_963456_82B606E2 
X-CRM114-Status: GOOD (  19.20  )
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



On 06/07/2021 12:01, Kansho Nishida wrote:
> Add afe (audio front end) device node to the MT8183 dtsi.
> 
> Signed-off-by: Kansho Nishida <kansho@chromium.org>

Now queued in v5.15-tmp/dts64

Please submit a patch to update the binding description. Maybe we should think
of merging the two binding descriptions into one (clock and audio part).

Regards,
Matthias

> ---
> 
> Changes in v3:
> - Use audio-controller as the audio node instead.
> 
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 94 +++++++++++++++++++++++-
>  1 file changed, 93 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index f90df6439c08..af895921700c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1115,10 +1115,102 @@ usb_host: usb@11200000 {
>  			};
>  		};
>  
> -		audiosys: syscon@11220000 {
> +		audiosys: audio-controller@11220000 {
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
