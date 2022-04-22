Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9C4C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 14:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6l9UywsY/TjN3oEiNHVnqfwNb34b2zKXZCJubmoFA8=; b=Gpmi+Ng1mJzWMD
	wJ2R0/kpAEZ1c2nauzBTBAjqE2rGU3zU99kUwgy6VpZwNkhL/rd8uD19X83Ou+lUbJJdvdgm4rvRu
	u+xDJthSG6BWnmzz7m6HGXCldBb2HoEpJuhe6oF/V7/blyyy2i2H/jLB91t2taRRidkVc9T+Y20wq
	aD32DBVINZvBZAVTSaXGCEV0THOor+Ha6KSnezeaHff+EN9U5GIpjFH9OmJKbwWRbl5IY9v4TQKN/
	G3kyqSzy3WXppBGmUuzPF4Utn2nI545y2K1yau13apgdje6nYH8cL+ei7db+ZnLhzlUDDVATsxtNy
	/IHRMh+ytZf4ZwtoTqYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhu3a-000l62-B5; Fri, 22 Apr 2022 14:14:46 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhu3M-000l1U-Ni; Fri, 22 Apr 2022 14:14:34 +0000
Received: by mail-wm1-x32a.google.com with SMTP id x3so5165455wmj.5;
 Fri, 22 Apr 2022 07:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Qr/0xq7JkvEGOL2jpks6S/YAZiRfs0hpQ9EKWnHgKuc=;
 b=M5bKdpx9khC6KQ6QuQnT8RrSdAABKVInmDk2FO8jr71ln0R1mjQ7ovraqZUcqQz4JL
 AQjjEni780wSaSMXQZtvrTaXXT8U0pmjAA0gd+1qXbyAH844QkR3pO7R9Z12pu/lpIEv
 ZBOR84dZgYum60jhQES42YEx8ZeBpeR/BKjB3NXFi2XOd3rht81bSeNDhCKnjbYv017e
 TVtPZ1b2RryYP0lebh6qzP8U0WW9Wmmqj32QMyQ/H5p1TqIAyxi4kby3TtbFUGKDdvdz
 yR59YCQ39TUk2KQLpDYTJYkNFJFf8CQ9kWzxfNzbosFgwrhawZEa0KmzRYJU4hRzLIL/
 Xa3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qr/0xq7JkvEGOL2jpks6S/YAZiRfs0hpQ9EKWnHgKuc=;
 b=7xLo5kvL2bVqeUcWtuV6g0JVjgiH7SC5MBncBD1xG1848x0XdfxEujMqA4M5grXcfA
 iHKng/iM0VG/ia2su2dKstJXEzDSiQGWaILuo3iDmEyj6MM9a3Y7VU78t6bhiLJeL/7P
 45axuggJUB2+Q8BvgPR7VPN9ZzqvYyrqlwVhLMkjtxDghuREtnjTW8oWmINn2SMeBls1
 eisWOa2SpMmDuOLH2sTw26s/vjLlOt7805DwvD44UrdAplaVgOsOm+9wgCsTpZlF6jzx
 TmTN7LDCKmOuyTPF14dVXGI+sGQYbxrGWU4gd/LNB22NwGma1GxFv5sfs/le2TnkUHUr
 VZ2Q==
X-Gm-Message-State: AOAM531Awa5AQfdYseyyhFDxSGO/1DYT9ox8ei/U3QfngxmZu6SO4w8D
 rQe2uxFP71BIYcQxdh3W3jc=
X-Google-Smtp-Source: ABdhPJygTsZkr1+Nb2cftFWfh857s0vRfekbCg2qVqBhhQJKsd9jHma4OY01RZrNfrWSob9PiGtxcw==
X-Received: by 2002:a7b:cb83:0:b0:37e:bc50:3c6b with SMTP id
 m3-20020a7bcb83000000b0037ebc503c6bmr13865542wmi.67.1650636869177; 
 Fri, 22 Apr 2022 07:14:29 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 q128-20020a1c4386000000b003915e19d47asm4632725wma.32.2022.04.22.07.14.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 07:14:28 -0700 (PDT)
Message-ID: <427dda20-7e9a-499b-02f3-7f42a157e0d6@gmail.com>
Date: Fri, 22 Apr 2022 16:14:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: mediatek: mt8192: complete clocks
 and clock-names
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>
References: <20220419025557.22262-1-allen-kh.cheng@mediatek.com>
 <20220419025557.22262-2-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220419025557.22262-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_071432_849490_85039BEB 
X-CRM114-Status: GOOD (  14.66  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 19/04/2022 04:55, Allen-KH Cheng wrote:
> From: Jiaxin Yu <jiaxin.yu@mediatek.com>
> 
> Complete all clocks and clock-names be used for mt8192 SoC into dt-bindings.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

You missed to add Mark to the list. This patch should go through his branch. I 
added him now to the thread.

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Regards,
Matthias

> ---
>   .../bindings/sound/mt8192-afe-pcm.yaml        | 165 +++++++++++++++++-
>   1 file changed, 157 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> index 7a25bc9b8060..1b6b22a5732e 100644
> --- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> @@ -39,20 +39,67 @@ properties:
>       maxItems: 1
>   
>     clocks:
> -    items:
> -      - description: AFE clock
> -      - description: ADDA DAC clock
> -      - description: ADDA DAC pre-distortion clock
> -      - description: audio infra sys clock
> -      - description: audio infra 26M clock
> +    minItems: 56
> +    maxItems: 56
>   
>     clock-names:
>       items:
>         - const: aud_afe_clk
>         - const: aud_dac_clk
>         - const: aud_dac_predis_clk
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
>         - const: aud_infra_clk
>         - const: aud_infra_26m_clk
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
>   required:
>     - compatible
> @@ -88,13 +135,115 @@ examples:
>           clocks = <&audsys CLK_AUD_AFE>,
>                    <&audsys CLK_AUD_DAC>,
>                    <&audsys CLK_AUD_DAC_PREDIS>,
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
>                    <&infracfg CLK_INFRA_AUDIO>,
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
>           clock-names = "aud_afe_clk",
>                         "aud_dac_clk",
>                         "aud_dac_predis_clk",
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
>                         "aud_infra_clk",
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
>       };
>   
>   ...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
