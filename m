Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A711C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 14:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yPtTTX4qeIftg7cIn5r5szyXdNsr2XA0ovnSbctFlBI=; b=3Ayi7MbdoCqlHa
	OhL/g294xBhuMSF837migUfUoW+OxqduodxX67Rp1WuH7G4oO11ZUiaVpLl4OHBjD0zTx4QXqusv0
	eGfSkrbzbFfWt81loixWf7dNyQt4eN1+JitVLVnhsegBIoxk4exdiYp99q4VBYYMbWJwDSRePLkuW
	FIf79XpSDYo4g/zv1vhOAmArfunjLd4ky3Zk6VZjgABhvn/2M+kiE+2Yc/pNg+CebNFPGn2E0lRY9
	HBZl5Jaj8CYTHHZTBYJUFH7RHN2eAVEX98I6SmJSek5HXt6NNEY0e81Z/50Vh0pfBSTKLQDcJamJF
	viTxb9t/Cc3KFsLWXOYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXOiR-00GxKk-OZ; Thu, 24 Mar 2022 14:45:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXOiF-00GxIm-5d; Thu, 24 Mar 2022 14:45:20 +0000
Received: by mail-wm1-x335.google.com with SMTP id r64so2856293wmr.4;
 Thu, 24 Mar 2022 07:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=M/f8y/26l32WvTxIaHNU9NsW+ax20B3YgWzAaAZO6Mo=;
 b=UE4m2c67FnKibQK1QU98/UtSQNv3yQUQD3OZ4iuZTaCkDrnaL8cBSt4nB9yB/3YFet
 6LpI3mZBnPV/OBZrP3wleWoJLQbHlir64S7QeIjLF71/DtDLwDkNZgeRrVWTp9L89WJf
 kMViLRyhKx4+1AYaqwLDHEPislGseQm/ZzqJA4MIdCA+ChCp2+gOnL7EQx4kXNsgubrd
 z3AJWf+jaE+cqBOBSYb+ilBwqk3CHfRvoNDEeS+mTjENDFsjc6MMJEpkhjCTDl+CJn+x
 diIue72mp0ZbSBNN4JNyEJa9pge17td2txR9bz6+Nhxoz4Yhc2RZvZ8GsjQjjEYdWIIP
 GsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=M/f8y/26l32WvTxIaHNU9NsW+ax20B3YgWzAaAZO6Mo=;
 b=OTUHmNLH6cyMVvSAabJ3sxwkbc3Gd9alzor2gD5LZId9jMVHs8o8bsG7i5UtHH+VM2
 riFqdXc6b0EWSSwrebEWdqV+4JPOd34fwPdxc7Hqg175iQkBwrfLbqac2KBoKlTS/qhb
 PnD2VNliTS/aPKT6S21hogkYnqZCOUUplc7ZUNGQqXg4xYkjJo77kH7MeH9q8c6YEsT8
 RADNjQ4nVJRCWqEkdRCCHNGi/+TGo/eRNx0qorSIgp+V6Bwu3CcPxElMTQOVFy6PaSFG
 KjM/MX+0cu1SrEnesm0sHmSXi2I8j0XqFbQ1J6bndQ1dL26xqAq+HvwJPZKBNrMr84gU
 Mvbg==
X-Gm-Message-State: AOAM533XQIxI/QdkT2wKBYU+2REbYdxDdB2XnXfurTYNAPjHgTLLqWOf
 I2KaZnMme1vybG52C7JdVlY=
X-Google-Smtp-Source: ABdhPJwtm+jCnY1o081n9jxBevzG/xtKrtYGckQi6oRARJ8rLE7tnoVwr7G3c/GIJj01lcGz5pqfHA==
X-Received: by 2002:a7b:cd01:0:b0:38c:9142:2006 with SMTP id
 f1-20020a7bcd01000000b0038c91422006mr14718045wmj.4.1648133117227; 
 Thu, 24 Mar 2022 07:45:17 -0700 (PDT)
Received: from [192.168.0.32] ([137.101.87.65])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a7bcc0b000000b0037e0c362b6dsm2298003wmh.31.2022.03.24.07.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 07:45:16 -0700 (PDT)
Message-ID: <e4f414a6-2a18-1f46-d8c0-c070d63e5326@gmail.com>
Date: Thu, 24 Mar 2022 15:45:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-8-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 07/22] arm64: dts: mt8192: Add audio-related nodes
In-Reply-To: <20220318144534.17996-8-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_074519_283981_86926B98 
X-CRM114-Status: GOOD (  15.84  )
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



On 18/03/2022 15:45, Allen-KH Cheng wrote:
> Add audio-related nodes in audsys for mt8192 SoC.
>   - Move audsys node in ascending order.
>   - Increase the address range's length from 0x1000 to 0x2000.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 134 ++++++++++++++++++++++-
>   1 file changed, 128 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 6bc36a4076f4..40cf6dacca3e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -742,6 +742,134 @@
>   			status = "disabled";
>   		};
>   
> +		audsys: syscon@11210000 {
> +			compatible = "mediatek,mt8192-audsys", "syscon";
> +			reg = <0 0x11210000 0 0x2000>;
> +			#clock-cells = <1>;

New line here please.

> +			afe: mt8192-afe-pcm {
> +				compatible = "mediatek,mt8192-audio";
> +				interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH 0>;
> +				resets = <&watchdog 17>;
> +				reset-names = "audiosys";
> +				mediatek,apmixedsys = <&apmixedsys>;
> +				mediatek,infracfg = <&infracfg>;
> +				mediatek,topckgen = <&topckgen>;
> +				power-domains = <&spm MT8192_POWER_DOMAIN_AUDIO>;
> +				clocks = <&audsys CLK_AUD_AFE>,

There are many more clocks then in the bindings, can please fix that.

Regards,
Matthias

> +					 <&audsys CLK_AUD_DAC>,
> +					 <&audsys CLK_AUD_DAC_PREDIS>,
> +					 <&audsys CLK_AUD_ADC>,
> +					 <&audsys CLK_AUD_ADDA6_ADC>,
> +					 <&audsys CLK_AUD_22M>,
> +					 <&audsys CLK_AUD_24M>,
> +					 <&audsys CLK_AUD_APLL_TUNER>,
> +					 <&audsys CLK_AUD_APLL2_TUNER>,
> +					 <&audsys CLK_AUD_TDM>,
> +					 <&audsys CLK_AUD_TML>,
> +					 <&audsys CLK_AUD_NLE>,
> +					 <&audsys CLK_AUD_DAC_HIRES>,
> +					 <&audsys CLK_AUD_ADC_HIRES>,
> +					 <&audsys CLK_AUD_ADC_HIRES_TML>,
> +					 <&audsys CLK_AUD_ADDA6_ADC_HIRES>,
> +					 <&audsys CLK_AUD_3RD_DAC>,
> +					 <&audsys CLK_AUD_3RD_DAC_PREDIS>,
> +					 <&audsys CLK_AUD_3RD_DAC_TML>,
> +					 <&audsys CLK_AUD_3RD_DAC_HIRES>,
> +					 <&infracfg CLK_INFRA_AUDIO>,
> +					 <&infracfg CLK_INFRA_AUDIO_26M_B>,
> +					 <&topckgen CLK_TOP_AUDIO_SEL>,
> +					 <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
> +					 <&topckgen CLK_TOP_MAINPLL_D4_D4>,
> +					 <&topckgen CLK_TOP_AUD_1_SEL>,
> +					 <&topckgen CLK_TOP_APLL1>,
> +					 <&topckgen CLK_TOP_AUD_2_SEL>,
> +					 <&topckgen CLK_TOP_APLL2>,
> +					 <&topckgen CLK_TOP_AUD_ENGEN1_SEL>,
> +					 <&topckgen CLK_TOP_APLL1_D4>,
> +					 <&topckgen CLK_TOP_AUD_ENGEN2_SEL>,
> +					 <&topckgen CLK_TOP_APLL2_D4>,
> +					 <&topckgen CLK_TOP_APLL_I2S0_M_SEL>,
> +					 <&topckgen CLK_TOP_APLL_I2S1_M_SEL>,
> +					 <&topckgen CLK_TOP_APLL_I2S2_M_SEL>,
> +					 <&topckgen CLK_TOP_APLL_I2S3_M_SEL>,
> +					 <&topckgen CLK_TOP_APLL_I2S4_M_SEL>,
> +					 <&topckgen CLK_TOP_APLL_I2S5_M_SEL>,
> +					 <&topckgen CLK_TOP_APLL_I2S6_M_SEL>,
> +					 <&topckgen CLK_TOP_APLL_I2S7_M_SEL>,
> +					 <&topckgen CLK_TOP_APLL_I2S8_M_SEL>,
> +					 <&topckgen CLK_TOP_APLL_I2S9_M_SEL>,
> +					 <&topckgen CLK_TOP_APLL12_DIV0>,
> +					 <&topckgen CLK_TOP_APLL12_DIV1>,
> +					 <&topckgen CLK_TOP_APLL12_DIV2>,
> +					 <&topckgen CLK_TOP_APLL12_DIV3>,
> +					 <&topckgen CLK_TOP_APLL12_DIV4>,
> +					 <&topckgen CLK_TOP_APLL12_DIVB>,
> +					 <&topckgen CLK_TOP_APLL12_DIV5>,
> +					 <&topckgen CLK_TOP_APLL12_DIV6>,
> +					 <&topckgen CLK_TOP_APLL12_DIV7>,
> +					 <&topckgen CLK_TOP_APLL12_DIV8>,
> +					 <&topckgen CLK_TOP_APLL12_DIV9>,
> +					 <&topckgen CLK_TOP_AUDIO_H_SEL>,
> +					 <&clk26m>;
> +				clock-names = "aud_afe_clk",
> +					      "aud_dac_clk",
> +					      "aud_dac_predis_clk",
> +					      "aud_adc_clk",
> +					      "aud_adda6_adc_clk",
> +					      "aud_apll22m_clk",
> +					      "aud_apll24m_clk",
> +					      "aud_apll1_tuner_clk",
> +					      "aud_apll2_tuner_clk",
> +					      "aud_tdm_clk",
> +					      "aud_tml_clk",
> +					      "aud_nle",
> +					      "aud_dac_hires_clk",
> +					      "aud_adc_hires_clk",
> +					      "aud_adc_hires_tml",
> +					      "aud_adda6_adc_hires_clk",
> +					      "aud_3rd_dac_clk",
> +					      "aud_3rd_dac_predis_clk",
> +					      "aud_3rd_dac_tml",
> +					      "aud_3rd_dac_hires_clk",
> +					      "aud_infra_clk",
> +					      "aud_infra_26m_clk",
> +					      "top_mux_audio",
> +					      "top_mux_audio_int",
> +					      "top_mainpll_d4_d4",
> +					      "top_mux_aud_1",
> +					      "top_apll1_ck",
> +					      "top_mux_aud_2",
> +					      "top_apll2_ck",
> +					      "top_mux_aud_eng1",
> +					      "top_apll1_d4",
> +					      "top_mux_aud_eng2",
> +					      "top_apll2_d4",
> +					      "top_i2s0_m_sel",
> +					      "top_i2s1_m_sel",
> +					      "top_i2s2_m_sel",
> +					      "top_i2s3_m_sel",
> +					      "top_i2s4_m_sel",
> +					      "top_i2s5_m_sel",
> +					      "top_i2s6_m_sel",
> +					      "top_i2s7_m_sel",
> +					      "top_i2s8_m_sel",
> +					      "top_i2s9_m_sel",
> +					      "top_apll12_div0",
> +					      "top_apll12_div1",
> +					      "top_apll12_div2",
> +					      "top_apll12_div3",
> +					      "top_apll12_div4",
> +					      "top_apll12_divb",
> +					      "top_apll12_div5",
> +					      "top_apll12_div6",
> +					      "top_apll12_div7",
> +					      "top_apll12_div8",
> +					      "top_apll12_div9",
> +					      "top_mux_audio_h",
> +					      "top_clk26m_clk";
> +			};
> +		};
> +
>   		nor_flash: spi@11234000 {
>   			compatible = "mediatek,mt8192-nor";
>   			reg = <0 0x11234000 0 0xe0>;
> @@ -757,12 +885,6 @@
>   			status = "disable";
>   		};
>   
> -		audsys: clock-controller@11210000 {
> -			compatible = "mediatek,mt8192-audsys", "syscon";
> -			reg = <0 0x11210000 0 0x1000>;
> -			#clock-cells = <1>;
> -		};
> -
>   		i2c3: i2c@11cb0000 {
>   			compatible = "mediatek,mt8192-i2c";
>   			reg = <0 0x11cb0000 0 0x1000>,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
