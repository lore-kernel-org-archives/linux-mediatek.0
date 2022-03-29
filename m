Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AFFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 06:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AWYEk7UJ0EbXvIB9SGmN8MMJ+6Zin511Q6ppDtn6FcA=; b=uVmpSwGkEKkf9D
	aI/XmU40EeA1m+dVBTjdEkmn9lIS9xT1w7ojGfCpkZDIPOrs5Nq97M9QmiUIu+dvLiWftb61C33ON
	drF4vfWIgWNspZ3v74flXIONqLSrtbOH9ao6w9jl/jx14AI02oFjItaEBHiYqqisIXq3EzMdTyYlI
	vk4JDMwuph3R99GFFWW65dVkhFzEK+KHB2nZHHegRtEsLW2PueIqz3+z01SSEpQVPuNjBESQAEf/k
	tz9uzOffDB26p2/KM+qfsDOJQTMpdm2AKteIu2HL8hP6/TqYLMXKHtN3DXk2OCvIPHkFMprPVeZ95
	ogp4iBniynwizru9jAnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ5A2-00BBI1-40; Tue, 29 Mar 2022 06:16:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ59o-00BBF9-RA; Tue, 29 Mar 2022 06:16:47 +0000
X-UUID: 994591ef705c4f57902dd631da832557-20220328
X-UUID: 994591ef705c4f57902dd631da832557-20220328
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 45173035; Mon, 28 Mar 2022 23:16:38 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Mar 2022 23:15:57 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 29 Mar 2022 14:15:55 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Mar 2022 14:15:55 +0800
Message-ID: <95bc9e1024b0b5fd99c2e9421a3c3155f0fbd262.camel@mediatek.com>
Subject: Re: [PATCH v4 07/22] arm64: dts: mt8192: Add audio-related nodes
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Hui
 Liu <hui.liu@mediatek.com>
Date: Tue, 29 Mar 2022 14:15:55 +0800
In-Reply-To: <e4f414a6-2a18-1f46-d8c0-c070d63e5326@gmail.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-8-allen-kh.cheng@mediatek.com>
 <e4f414a6-2a18-1f46-d8c0-c070d63e5326@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_231644_925952_242D3CFC 
X-CRM114-Status: GOOD (  18.29  )
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

Hi Matthias,

On Thu, 2022-03-24 at 15:45 +0100, Matthias Brugger wrote:
> 
> On 18/03/2022 15:45, Allen-KH Cheng wrote:
> > Add audio-related nodes in audsys for mt8192 SoC.
> >   - Move audsys node in ascending order.
> >   - Increase the address range's length from 0x1000 to 0x2000.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 134
> > ++++++++++++++++++++++-
> >   1 file changed, 128 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index 6bc36a4076f4..40cf6dacca3e 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -742,6 +742,134 @@
> >   			status = "disabled";
> >   		};
> >   
> > +		audsys: syscon@11210000 {
> > +			compatible = "mediatek,mt8192-audsys",
> > "syscon";
> > +			reg = <0 0x11210000 0 0x2000>;
> > +			#clock-cells = <1>;
> 
> New line here please.
> 

ok.

> > +			afe: mt8192-afe-pcm {
> > +				compatible = "mediatek,mt8192-audio";
> > +				interrupts = <GIC_SPI 202
> > IRQ_TYPE_LEVEL_HIGH 0>;
> > +				resets = <&watchdog 17>;
> > +				reset-names = "audiosys";
> > +				mediatek,apmixedsys = <&apmixedsys>;
> > +				mediatek,infracfg = <&infracfg>;
> > +				mediatek,topckgen = <&topckgen>;
> > +				power-domains = <&spm
> > MT8192_POWER_DOMAIN_AUDIO>;
> > +				clocks = <&audsys CLK_AUD_AFE>,
> 
> There are many more clocks then in the bindings, can please fix that.
> 
> Regards,
> Matthias
> 

About those clock names, we will send anther patch for bindings
(mt8192-afe-pcm.yam).

Thanks,
Allen

> > +					 <&audsys CLK_AUD_DAC>,
> > +					 <&audsys CLK_AUD_DAC_PREDIS>,
> > +					 <&audsys CLK_AUD_ADC>,
> > +					 <&audsys CLK_AUD_ADDA6_ADC>,
> > +					 <&audsys CLK_AUD_22M>,
> > +					 <&audsys CLK_AUD_24M>,
> > +					 <&audsys CLK_AUD_APLL_TUNER>,
> > +					 <&audsys CLK_AUD_APLL2_TUNER>,
> > +					 <&audsys CLK_AUD_TDM>,
> > +					 <&audsys CLK_AUD_TML>,
> > +					 <&audsys CLK_AUD_NLE>,
> > +					 <&audsys CLK_AUD_DAC_HIRES>,
> > +					 <&audsys CLK_AUD_ADC_HIRES>,
> > +					 <&audsys
> > CLK_AUD_ADC_HIRES_TML>,
> > +					 <&audsys
> > CLK_AUD_ADDA6_ADC_HIRES>,
> > +					 <&audsys CLK_AUD_3RD_DAC>,
> > +					 <&audsys
> > CLK_AUD_3RD_DAC_PREDIS>,
> > +					 <&audsys CLK_AUD_3RD_DAC_TML>,
> > +					 <&audsys
> > CLK_AUD_3RD_DAC_HIRES>,
> > +					 <&infracfg CLK_INFRA_AUDIO>,
> > +					 <&infracfg
> > CLK_INFRA_AUDIO_26M_B>,
> > +					 <&topckgen CLK_TOP_AUDIO_SEL>,
> > +					 <&topckgen
> > CLK_TOP_AUD_INTBUS_SEL>,
> > +					 <&topckgen
> > CLK_TOP_MAINPLL_D4_D4>,
> > +					 <&topckgen CLK_TOP_AUD_1_SEL>,
> > +					 <&topckgen CLK_TOP_APLL1>,
> > +					 <&topckgen CLK_TOP_AUD_2_SEL>,
> > +					 <&topckgen CLK_TOP_APLL2>,
> > +					 <&topckgen
> > CLK_TOP_AUD_ENGEN1_SEL>,
> > +					 <&topckgen CLK_TOP_APLL1_D4>,
> > +					 <&topckgen
> > CLK_TOP_AUD_ENGEN2_SEL>,
> > +					 <&topckgen CLK_TOP_APLL2_D4>,
> > +					 <&topckgen
> > CLK_TOP_APLL_I2S0_M_SEL>,
> > +					 <&topckgen
> > CLK_TOP_APLL_I2S1_M_SEL>,
> > +					 <&topckgen
> > CLK_TOP_APLL_I2S2_M_SEL>,
> > +					 <&topckgen
> > CLK_TOP_APLL_I2S3_M_SEL>,
> > +					 <&topckgen
> > CLK_TOP_APLL_I2S4_M_SEL>,
> > +					 <&topckgen
> > CLK_TOP_APLL_I2S5_M_SEL>,
> > +					 <&topckgen
> > CLK_TOP_APLL_I2S6_M_SEL>,
> > +					 <&topckgen
> > CLK_TOP_APLL_I2S7_M_SEL>,
> > +					 <&topckgen
> > CLK_TOP_APLL_I2S8_M_SEL>,
> > +					 <&topckgen
> > CLK_TOP_APLL_I2S9_M_SEL>,
> > +					 <&topckgen
> > CLK_TOP_APLL12_DIV0>,
> > +					 <&topckgen
> > CLK_TOP_APLL12_DIV1>,
> > +					 <&topckgen
> > CLK_TOP_APLL12_DIV2>,
> > +					 <&topckgen
> > CLK_TOP_APLL12_DIV3>,
> > +					 <&topckgen
> > CLK_TOP_APLL12_DIV4>,
> > +					 <&topckgen
> > CLK_TOP_APLL12_DIVB>,
> > +					 <&topckgen
> > CLK_TOP_APLL12_DIV5>,
> > +					 <&topckgen
> > CLK_TOP_APLL12_DIV6>,
> > +					 <&topckgen
> > CLK_TOP_APLL12_DIV7>,
> > +					 <&topckgen
> > CLK_TOP_APLL12_DIV8>,
> > +					 <&topckgen
> > CLK_TOP_APLL12_DIV9>,
> > +					 <&topckgen
> > CLK_TOP_AUDIO_H_SEL>,
> > +					 <&clk26m>;
> > +				clock-names = "aud_afe_clk",
> > +					      "aud_dac_clk",
> > +					      "aud_dac_predis_clk",
> > +					      "aud_adc_clk",
> > +					      "aud_adda6_adc_clk",
> > +					      "aud_apll22m_clk",
> > +					      "aud_apll24m_clk",
> > +					      "aud_apll1_tuner_clk",
> > +					      "aud_apll2_tuner_clk",
> > +					      "aud_tdm_clk",
> > +					      "aud_tml_clk",
> > +					      "aud_nle",
> > +					      "aud_dac_hires_clk",
> > +					      "aud_adc_hires_clk",
> > +					      "aud_adc_hires_tml",
> > +					      "aud_adda6_adc_hires_clk"
> > ,
> > +					      "aud_3rd_dac_clk",
> > +					      "aud_3rd_dac_predis_clk",
> > +					      "aud_3rd_dac_tml",
> > +					      "aud_3rd_dac_hires_clk",
> > +					      "aud_infra_clk",
> > +					      "aud_infra_26m_clk",
> > +					      "top_mux_audio",
> > +					      "top_mux_audio_int",
> > +					      "top_mainpll_d4_d4",
> > +					      "top_mux_aud_1",
> > +					      "top_apll1_ck",
> > +					      "top_mux_aud_2",
> > +					      "top_apll2_ck",
> > +					      "top_mux_aud_eng1",
> > +					      "top_apll1_d4",
> > +					      "top_mux_aud_eng2",
> > +					      "top_apll2_d4",
> > +					      "top_i2s0_m_sel",
> > +					      "top_i2s1_m_sel",
> > +					      "top_i2s2_m_sel",
> > +					      "top_i2s3_m_sel",
> > +					      "top_i2s4_m_sel",
> > +					      "top_i2s5_m_sel",
> > +					      "top_i2s6_m_sel",
> > +					      "top_i2s7_m_sel",
> > +					      "top_i2s8_m_sel",
> > +					      "top_i2s9_m_sel",
> > +					      "top_apll12_div0",
> > +					      "top_apll12_div1",
> > +					      "top_apll12_div2",
> > +					      "top_apll12_div3",
> > +					      "top_apll12_div4",
> > +					      "top_apll12_divb",
> > +					      "top_apll12_div5",
> > +					      "top_apll12_div6",
> > +					      "top_apll12_div7",
> > +					      "top_apll12_div8",
> > +					      "top_apll12_div9",
> > +					      "top_mux_audio_h",
> > +					      "top_clk26m_clk";
> > +			};
> > +		};
> > +
> >   		nor_flash: spi@11234000 {
> >   			compatible = "mediatek,mt8192-nor";
> >   			reg = <0 0x11234000 0 0xe0>;
> > @@ -757,12 +885,6 @@
> >   			status = "disable";
> >   		};
> >   
> > -		audsys: clock-controller@11210000 {
> > -			compatible = "mediatek,mt8192-audsys",
> > "syscon";
> > -			reg = <0 0x11210000 0 0x1000>;
> > -			#clock-cells = <1>;
> > -		};
> > -
> >   		i2c3: i2c@11cb0000 {
> >   			compatible = "mediatek,mt8192-i2c";
> >   			reg = <0 0x11cb0000 0 0x1000>,


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
