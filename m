Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ECFEC07E99
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 09:40:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42137613CB
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 09:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42137613CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HskXC2oWW8AJsxbrj5tXTdda9QHEKJGvBtIH16IEuoQ=; b=EaU2BSUUBhqtYV
	+iSbGKeo8ciGRJsjEkQlvHJ9nfV5v6HIjrFtjS7hDwp0bbuX1iWeLjUBXoyhFI3lIwTu5Wu4cvXzS
	bEM4nyyXgJ/2g5Kr8trwHOYXECY7o1ZR+9qO3JANN8ECLX63/uT7yuMIwy/IiO7uQ4qUKZVbA4pF5
	W+PratRUJddhhDu6516RvvkvtMhDcrFOaLm5i2BHV3iVKEgd3Gkf/VPVyKyhJa7nscmBPCQM0n3d4
	Cs8K30W1ZekaqaYIciuok2JUk/EwsEnvpyxzeFIPlmj6eMJTntPE84+rv60vQ67XsB6TKfJbiJdqR
	zY/edAXeoCkTV8kAwYhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0L5T-008Sap-Ip; Mon, 05 Jul 2021 09:40:23 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0L5B-008STK-T9
 for linux-mediatek@lists.infradead.org; Mon, 05 Jul 2021 09:40:07 +0000
Received: by mail-pf1-x434.google.com with SMTP id q10so37785pfj.12
 for <linux-mediatek@lists.infradead.org>; Mon, 05 Jul 2021 02:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9NEgfDbLASj9u3BPxvvxZ1ejuTwiwGxydassBot+RfA=;
 b=ZTT+24SsIiUhwkeb67dSyuBKmhWy+p0YSpEeoGTVkBO3KEhZgxVzb1M0N+dmnQOuP+
 NplltYl4f/jGYlMzZsb15OP4tzy1A2OFmiFn6litXc8osD2m1f5nN4rgZ/MUBegoeZBg
 N3yb3yfrpYYpjnoMubFhC4naGQ547oMIKczz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9NEgfDbLASj9u3BPxvvxZ1ejuTwiwGxydassBot+RfA=;
 b=EZJdolHxD1RmbottgSHuhg3UG/4/yvw0uaalRUn8Id0Qb8pDTVndFtobiSiQNBAjiF
 JOlfp7WV+YkzuBxvrw/5Ss9+kqvXlKFkIRKZqyMpcIehqtW633CSPs6g3MIqXvzC+8nL
 leijau0ZYsCpsB4oHVaF8w2Uq5tkc7E9VTC06nwtRIJ0dePgzc4wcNK16hz4exGP4pgN
 sfcPvo77LbNIcXgWYC72kKhuDZtHZwnAiTn6Y4BO5hGZExIOvPeMvOXPrCRTmw0QQowU
 dowL386OCCqU9MSi6X/4svqR2y0rmZYsMFkpZGBJS7UzIyslPoyL6Ro5RzaMiEMEjXgm
 N+ug==
X-Gm-Message-State: AOAM533kWSY8twHgmtNXScVcxGEJ9hcH5ZlPSyf4gD/lxq++5Z6H3cSp
 lQuAJ9hrgWAb+j0Hr1J6pkAm+G7tPnhKziNdHesdGg==
X-Google-Smtp-Source: ABdhPJxehs17Gva3Z1PLinNDiwy6ZNwOYg8wG9gpLsrwSz4om20wFIio8AUK7w5i5rU5PDWp2naXrlLFq3lMCZFFA6U=
X-Received: by 2002:a63:e316:: with SMTP id f22mr14711550pgh.100.1625478003378; 
 Mon, 05 Jul 2021 02:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210630090710.1873559-1-kansho@chromium.org>
 <20210630180652.1.I88a52644e47e88b15f5db9841cb084dc53c5875c@changeid>
 <716ab7a7-937d-df88-8d3c-8d35df473b4e@gmail.com>
In-Reply-To: <716ab7a7-937d-df88-8d3c-8d35df473b4e@gmail.com>
From: Kansho Nishida <kansho@chromium.org>
Date: Mon, 5 Jul 2021 18:39:52 +0900
Message-ID: <CAP3OrSLyoKNr7fMOx5sUtWi7PVQGuN-5w7k_0D2MhDUeXXmYCg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: mt8183: add audio node
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 Jiaxin Yu <jiaxin.yu@mediatek.com>, devicetree@vger.kernel.org, 
 Rob Herring <robh+dt@kernel.org>, Shunli Wang <shunli.wang@mediatek.com>, 
 linux-arm-kernel@lists.infradead.org, Eddie Huang <eddie.huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_024005_977300_9EB371E8 
X-CRM114-Status: GOOD (  17.36  )
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

On Fri, Jul 2, 2021 at 3:20 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 30/06/2021 11:07, Kansho Nishida wrote:
> > Add afe (audio front end) device node to the MT8183 dtsi.
> >
> > Signed-off-by: Kansho Nishida <kansho@chromium.org>
> > ---
> >
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 94 +++++++++++++++++++++++-
> >  1 file changed, 93 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > index f90df6439c08..b06acb8d6527 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -1115,10 +1115,102 @@ usb_host: usb@11200000 {
> >                       };
> >               };
> >
> > -             audiosys: syscon@11220000 {
> > +             audiosys: clock-controller@11220000 {
>
> Why do you change it from sysecon to clock-controller?
>
> Regards,
> Matthias

Hi Matthias,

Thanks for the comments!
This should be "clock-controller" according to the binding description (*1).
Moreover, you suggested doing so even though it's a long time ago (*2).

*1) https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/mediatek/mediatek%2Caudsys.txt
*2) https://patchwork.kernel.org/project/linux-mediatek/patch/1559360354-22974-1-git-send-email-jiaxin.yu@mediatek.com/

Regards,
Kansho

>
> >                       compatible = "mediatek,mt8183-audiosys", "syscon";
> >                       reg = <0 0x11220000 0 0x1000>;
> >                       #clock-cells = <1>;
> > +                     afe: mt8183-afe-pcm {
> > +                             compatible = "mediatek,mt8183-audio";
> > +                             interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
> > +                             resets = <&watchdog MT8183_TOPRGU_AUDIO_SW_RST>;
> > +                             reset-names = "audiosys";
> > +                             power-domains =
> > +                                     <&spm MT8183_POWER_DOMAIN_AUDIO>;
> > +                             clocks = <&audiosys CLK_AUDIO_AFE>,
> > +                                      <&audiosys CLK_AUDIO_DAC>,
> > +                                      <&audiosys CLK_AUDIO_DAC_PREDIS>,
> > +                                      <&audiosys CLK_AUDIO_ADC>,
> > +                                      <&audiosys CLK_AUDIO_PDN_ADDA6_ADC>,
> > +                                      <&audiosys CLK_AUDIO_22M>,
> > +                                      <&audiosys CLK_AUDIO_24M>,
> > +                                      <&audiosys CLK_AUDIO_APLL_TUNER>,
> > +                                      <&audiosys CLK_AUDIO_APLL2_TUNER>,
> > +                                      <&audiosys CLK_AUDIO_I2S1>,
> > +                                      <&audiosys CLK_AUDIO_I2S2>,
> > +                                      <&audiosys CLK_AUDIO_I2S3>,
> > +                                      <&audiosys CLK_AUDIO_I2S4>,
> > +                                      <&audiosys CLK_AUDIO_TDM>,
> > +                                      <&audiosys CLK_AUDIO_TML>,
> > +                                      <&infracfg CLK_INFRA_AUDIO>,
> > +                                      <&infracfg CLK_INFRA_AUDIO_26M_BCLK>,
> > +                                      <&topckgen CLK_TOP_MUX_AUDIO>,
> > +                                      <&topckgen CLK_TOP_MUX_AUD_INTBUS>,
> > +                                      <&topckgen CLK_TOP_SYSPLL_D2_D4>,
> > +                                      <&topckgen CLK_TOP_MUX_AUD_1>,
> > +                                      <&topckgen CLK_TOP_APLL1_CK>,
> > +                                      <&topckgen CLK_TOP_MUX_AUD_2>,
> > +                                      <&topckgen CLK_TOP_APLL2_CK>,
> > +                                      <&topckgen CLK_TOP_MUX_AUD_ENG1>,
> > +                                      <&topckgen CLK_TOP_APLL1_D8>,
> > +                                      <&topckgen CLK_TOP_MUX_AUD_ENG2>,
> > +                                      <&topckgen CLK_TOP_APLL2_D8>,
> > +                                      <&topckgen CLK_TOP_MUX_APLL_I2S0>,
> > +                                      <&topckgen CLK_TOP_MUX_APLL_I2S1>,
> > +                                      <&topckgen CLK_TOP_MUX_APLL_I2S2>,
> > +                                      <&topckgen CLK_TOP_MUX_APLL_I2S3>,
> > +                                      <&topckgen CLK_TOP_MUX_APLL_I2S4>,
> > +                                      <&topckgen CLK_TOP_MUX_APLL_I2S5>,
> > +                                      <&topckgen CLK_TOP_APLL12_DIV0>,
> > +                                      <&topckgen CLK_TOP_APLL12_DIV1>,
> > +                                      <&topckgen CLK_TOP_APLL12_DIV2>,
> > +                                      <&topckgen CLK_TOP_APLL12_DIV3>,
> > +                                      <&topckgen CLK_TOP_APLL12_DIV4>,
> > +                                      <&topckgen CLK_TOP_APLL12_DIVB>,
> > +                                      /*<&topckgen CLK_TOP_APLL12_DIV5>,*/
> > +                                      <&clk26m>;
> > +                             clock-names = "aud_afe_clk",
> > +                                               "aud_dac_clk",
> > +                                               "aud_dac_predis_clk",
> > +                                               "aud_adc_clk",
> > +                                               "aud_adc_adda6_clk",
> > +                                               "aud_apll22m_clk",
> > +                                               "aud_apll24m_clk",
> > +                                               "aud_apll1_tuner_clk",
> > +                                               "aud_apll2_tuner_clk",
> > +                                               "aud_i2s1_bclk_sw",
> > +                                               "aud_i2s2_bclk_sw",
> > +                                               "aud_i2s3_bclk_sw",
> > +                                               "aud_i2s4_bclk_sw",
> > +                                               "aud_tdm_clk",
> > +                                               "aud_tml_clk",
> > +                                               "aud_infra_clk",
> > +                                               "mtkaif_26m_clk",
> > +                                               "top_mux_audio",
> > +                                               "top_mux_aud_intbus",
> > +                                               "top_syspll_d2_d4",
> > +                                               "top_mux_aud_1",
> > +                                               "top_apll1_ck",
> > +                                               "top_mux_aud_2",
> > +                                               "top_apll2_ck",
> > +                                               "top_mux_aud_eng1",
> > +                                               "top_apll1_d8",
> > +                                               "top_mux_aud_eng2",
> > +                                               "top_apll2_d8",
> > +                                               "top_i2s0_m_sel",
> > +                                               "top_i2s1_m_sel",
> > +                                               "top_i2s2_m_sel",
> > +                                               "top_i2s3_m_sel",
> > +                                               "top_i2s4_m_sel",
> > +                                               "top_i2s5_m_sel",
> > +                                               "top_apll12_div0",
> > +                                               "top_apll12_div1",
> > +                                               "top_apll12_div2",
> > +                                               "top_apll12_div3",
> > +                                               "top_apll12_div4",
> > +                                               "top_apll12_divb",
> > +                                               /*"top_apll12_div5",*/
> > +                                               "top_clk26m_clk";
> > +                     };
> >               };
> >
> >               mmc0: mmc@11230000 {
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
