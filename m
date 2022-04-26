Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0165C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 20:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=62FFvxyPfl7zrI+71a5dQfUP3KwjYVxsWKInQ1AJWVY=; b=zjQxR3ugnWfEJ7
	GVMezWJMxZVbKzOXHXl00J8W4y3yMbuNCJ0ZbSs/MDEf8hvhtldDsyuGTnAvJSxS/5GklRN0Bgocb
	xj/0rTLTVDBqmhTk5+j7XV5OcHJTs6NASz6FWU8EyVD1ydyN9+kfVP1Seh7gIS7De3KnJTFOtVttX
	pWCh0l2aQ5Fq9FMySoXIrio4kUUF8orZ98BdxpTtBxhjlaWErFluKicw0ofr3AsfDl/8eAD0X/rdz
	LlXit04Ba7Bep9vYJ5lbk0R05tY3ZSRjdu2LgYY1WdbhY+UNVaLrd48WiEtE59QDKKtwnZkwxeskx
	m7tjtuqQsSoK/sM+3xxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njRav-00G584-0G; Tue, 26 Apr 2022 20:15:33 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njRai-00G51Z-BN; Tue, 26 Apr 2022 20:15:22 +0000
Received: by mail-oi1-f181.google.com with SMTP id e4so21982500oif.2;
 Tue, 26 Apr 2022 13:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X4D4FA3jMbNSOVGYIrOuVGyIIySWxqxWkkBOU3AjQRE=;
 b=gKjlOX+MNOA9jUymfAlQyp9hjitECebv9EayUDj0doFwmc/Q266iUDXvmKI4anOhyE
 7qJzR90q5ljlUPG7J/3z9oRC0hwHkYkoo4GVKw4J3/FB6aDu83g7v908c3MJO+pMgCtR
 XrX1cW+Ru9O1tjFzVgfOwHt5YbuQXr5qKPMN6aZLCjkTT/TDt1VzNH0EOBoGke5P/Veh
 baTWGHoq9EUtNj2/VDtno9s6iPNnNe8gajFT7wWttQwh8Uga3SNQbXXD94WYAr0HxHsu
 tQqXfvE76XijUEys2lPDGGxePSsvUBHdPBgDH1YRdcI9C8zt308vKMFp3lL5bdfx1sDA
 DQlA==
X-Gm-Message-State: AOAM533B6c2l7NlO0jZA7omrarLc3t4qTUswgrqrDhD0jSmP2eWpLMQY
 U43KVWycnf75z9CYgl843A==
X-Google-Smtp-Source: ABdhPJxQsiU7TXwKBypyr1tR6ffaX0ownpf1Ny/g7n3+2m1MyWGud+Y/0ExcJTEv9n8w1aDgraAX0w==
X-Received: by 2002:aca:1117:0:b0:322:4189:8959 with SMTP id
 23-20020aca1117000000b0032241898959mr15357841oir.254.1651004116888; 
 Tue, 26 Apr 2022 13:15:16 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 v22-20020a056870e49600b000d6c86ea98dsm1184568oag.1.2022.04.26.13.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 13:15:16 -0700 (PDT)
Received: (nullmailer pid 2463555 invoked by uid 1000);
 Tue, 26 Apr 2022 20:15:15 -0000
Date: Tue, 26 Apr 2022 15:15:15 -0500
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
 Ryder Lee <ryder.lee@kernel.org>, Hui Liu <hui.liu@mediatek.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: mediatek: mt8192: complete clocks
 and clock-names
Message-ID: <YmhS0yh/KqYqKshj@robh.at.kernel.org>
References: <20220419025557.22262-1-allen-kh.cheng@mediatek.com>
 <20220419025557.22262-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220419025557.22262-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_131520_463660_DB54A986 
X-CRM114-Status: GOOD (  15.54  )
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

On Tue, Apr 19, 2022 at 10:55:56AM +0800, Allen-KH Cheng wrote:
> From: Jiaxin Yu <jiaxin.yu@mediatek.com>
> 
> Complete all clocks and clock-names be used for mt8192 SoC into dt-bindings.

Not a compatible change breaking the ABI. Please explain why if that's 
intentional.

> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  .../bindings/sound/mt8192-afe-pcm.yaml        | 165 +++++++++++++++++-
>  1 file changed, 157 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> index 7a25bc9b8060..1b6b22a5732e 100644
> --- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> @@ -39,20 +39,67 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    items:
> -      - description: AFE clock
> -      - description: ADDA DAC clock
> -      - description: ADDA DAC pre-distortion clock
> -      - description: audio infra sys clock
> -      - description: audio infra 26M clock
> +    minItems: 56
> +    maxItems: 56
>  
>    clock-names:
>      items:
>        - const: aud_afe_clk
>        - const: aud_dac_clk
>        - const: aud_dac_predis_clk
> +      - const: aud_adc_clk
> +      - const: aud_adda6_adc_clk
> +      - const: aud_apll22m_clk
> +      - const: aud_apll24m_clk
> +      - const: aud_apll1_tuner_clk
> +      - const: aud_apll2_tuner_clk
> +      - const: aud_tdm_clk
> +      - const: aud_tml_clk
> +      - const: aud_nle
> +      - const: aud_dac_hires_clk
> +      - const: aud_adc_hires_clk
> +      - const: aud_adc_hires_tml
> +      - const: aud_adda6_adc_hires_clk
> +      - const: aud_3rd_dac_clk
> +      - const: aud_3rd_dac_predis_clk
> +      - const: aud_3rd_dac_tml
> +      - const: aud_3rd_dac_hires_clk
>        - const: aud_infra_clk
>        - const: aud_infra_26m_clk
> +      - const: top_mux_audio
> +      - const: top_mux_audio_int
> +      - const: top_mainpll_d4_d4
> +      - const: top_mux_aud_1
> +      - const: top_apll1_ck
> +      - const: top_mux_aud_2
> +      - const: top_apll2_ck
> +      - const: top_mux_aud_eng1
> +      - const: top_apll1_d4
> +      - const: top_mux_aud_eng2
> +      - const: top_apll2_d4
> +      - const: top_i2s0_m_sel
> +      - const: top_i2s1_m_sel
> +      - const: top_i2s2_m_sel
> +      - const: top_i2s3_m_sel
> +      - const: top_i2s4_m_sel
> +      - const: top_i2s5_m_sel
> +      - const: top_i2s6_m_sel
> +      - const: top_i2s7_m_sel
> +      - const: top_i2s8_m_sel
> +      - const: top_i2s9_m_sel
> +      - const: top_apll12_div0
> +      - const: top_apll12_div1
> +      - const: top_apll12_div2
> +      - const: top_apll12_div3
> +      - const: top_apll12_div4
> +      - const: top_apll12_divb
> +      - const: top_apll12_div5
> +      - const: top_apll12_div6
> +      - const: top_apll12_div7
> +      - const: top_apll12_div8
> +      - const: top_apll12_div9
> +      - const: top_mux_audio_h
> +      - const: top_clk26m_clk
>  
>  required:
>    - compatible
> @@ -88,13 +135,115 @@ examples:
>          clocks = <&audsys CLK_AUD_AFE>,
>                   <&audsys CLK_AUD_DAC>,
>                   <&audsys CLK_AUD_DAC_PREDIS>,
> +                 <&audsys CLK_AUD_ADC>,
> +                 <&audsys CLK_AUD_ADDA6_ADC>,
> +                 <&audsys CLK_AUD_22M>,
> +                 <&audsys CLK_AUD_24M>,
> +                 <&audsys CLK_AUD_APLL_TUNER>,
> +                 <&audsys CLK_AUD_APLL2_TUNER>,
> +                 <&audsys CLK_AUD_TDM>,
> +                 <&audsys CLK_AUD_TML>,
> +                 <&audsys CLK_AUD_NLE>,
> +                 <&audsys CLK_AUD_DAC_HIRES>,
> +                 <&audsys CLK_AUD_ADC_HIRES>,
> +                 <&audsys CLK_AUD_ADC_HIRES_TML>,
> +                 <&audsys CLK_AUD_ADDA6_ADC_HIRES>,
> +                 <&audsys CLK_AUD_3RD_DAC>,
> +                 <&audsys CLK_AUD_3RD_DAC_PREDIS>,
> +                 <&audsys CLK_AUD_3RD_DAC_TML>,
> +                 <&audsys CLK_AUD_3RD_DAC_HIRES>,
>                   <&infracfg CLK_INFRA_AUDIO>,
> -                 <&infracfg CLK_INFRA_AUDIO_26M_B>;
> +                 <&infracfg CLK_INFRA_AUDIO_26M_B>,
> +                 <&topckgen CLK_TOP_AUDIO_SEL>,
> +                 <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
> +                 <&topckgen CLK_TOP_MAINPLL_D4_D4>,
> +                 <&topckgen CLK_TOP_AUD_1_SEL>,
> +                 <&topckgen CLK_TOP_APLL1>,
> +                 <&topckgen CLK_TOP_AUD_2_SEL>,
> +                 <&topckgen CLK_TOP_APLL2>,
> +                 <&topckgen CLK_TOP_AUD_ENGEN1_SEL>,
> +                 <&topckgen CLK_TOP_APLL1_D4>,
> +                 <&topckgen CLK_TOP_AUD_ENGEN2_SEL>,
> +                 <&topckgen CLK_TOP_APLL2_D4>,
> +                 <&topckgen CLK_TOP_APLL_I2S0_M_SEL>,
> +                 <&topckgen CLK_TOP_APLL_I2S1_M_SEL>,
> +                 <&topckgen CLK_TOP_APLL_I2S2_M_SEL>,
> +                 <&topckgen CLK_TOP_APLL_I2S3_M_SEL>,
> +                 <&topckgen CLK_TOP_APLL_I2S4_M_SEL>,
> +                 <&topckgen CLK_TOP_APLL_I2S5_M_SEL>,
> +                 <&topckgen CLK_TOP_APLL_I2S6_M_SEL>,
> +                 <&topckgen CLK_TOP_APLL_I2S7_M_SEL>,
> +                 <&topckgen CLK_TOP_APLL_I2S8_M_SEL>,
> +                 <&topckgen CLK_TOP_APLL_I2S9_M_SEL>,
> +                 <&topckgen CLK_TOP_APLL12_DIV0>,
> +                 <&topckgen CLK_TOP_APLL12_DIV1>,
> +                 <&topckgen CLK_TOP_APLL12_DIV2>,
> +                 <&topckgen CLK_TOP_APLL12_DIV3>,
> +                 <&topckgen CLK_TOP_APLL12_DIV4>,
> +                 <&topckgen CLK_TOP_APLL12_DIVB>,
> +                 <&topckgen CLK_TOP_APLL12_DIV5>,
> +                 <&topckgen CLK_TOP_APLL12_DIV6>,
> +                 <&topckgen CLK_TOP_APLL12_DIV7>,
> +                 <&topckgen CLK_TOP_APLL12_DIV8>,
> +                 <&topckgen CLK_TOP_APLL12_DIV9>,
> +                 <&topckgen CLK_TOP_AUDIO_H_SEL>,
> +                 <&clk26m>;
>          clock-names = "aud_afe_clk",
>                        "aud_dac_clk",
>                        "aud_dac_predis_clk",
> +                      "aud_adc_clk",
> +                      "aud_adda6_adc_clk",
> +                      "aud_apll22m_clk",
> +                      "aud_apll24m_clk",
> +                      "aud_apll1_tuner_clk",
> +                      "aud_apll2_tuner_clk",
> +                      "aud_tdm_clk",
> +                      "aud_tml_clk",
> +                      "aud_nle",
> +                      "aud_dac_hires_clk",
> +                      "aud_adc_hires_clk",
> +                      "aud_adc_hires_tml",
> +                      "aud_adda6_adc_hires_clk",
> +                      "aud_3rd_dac_clk",
> +                      "aud_3rd_dac_predis_clk",
> +                      "aud_3rd_dac_tml",
> +                      "aud_3rd_dac_hires_clk",
>                        "aud_infra_clk",
> -                      "aud_infra_26m_clk";
> +                      "aud_infra_26m_clk",
> +                      "top_mux_audio",
> +                      "top_mux_audio_int",
> +                      "top_mainpll_d4_d4",
> +                      "top_mux_aud_1",
> +                      "top_apll1_ck",
> +                      "top_mux_aud_2",
> +                      "top_apll2_ck",
> +                      "top_mux_aud_eng1",
> +                      "top_apll1_d4",
> +                      "top_mux_aud_eng2",
> +                      "top_apll2_d4",
> +                      "top_i2s0_m_sel",
> +                      "top_i2s1_m_sel",
> +                      "top_i2s2_m_sel",
> +                      "top_i2s3_m_sel",
> +                      "top_i2s4_m_sel",
> +                      "top_i2s5_m_sel",
> +                      "top_i2s6_m_sel",
> +                      "top_i2s7_m_sel",
> +                      "top_i2s8_m_sel",
> +                      "top_i2s9_m_sel",
> +                      "top_apll12_div0",
> +                      "top_apll12_div1",
> +                      "top_apll12_div2",
> +                      "top_apll12_div3",
> +                      "top_apll12_div4",
> +                      "top_apll12_divb",
> +                      "top_apll12_div5",
> +                      "top_apll12_div6",
> +                      "top_apll12_div7",
> +                      "top_apll12_div8",
> +                      "top_apll12_div9",
> +                      "top_mux_audio_h",
> +                      "top_clk26m_clk";
>      };
>  
>  ...
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
