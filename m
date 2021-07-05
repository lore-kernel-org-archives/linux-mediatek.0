Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5521C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 09:55:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72BD961375
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 09:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72BD961375
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uLKyZ/UjxRiOUOECeSfuFM39hMVjofMfK3x6IMPyGJg=; b=2rxYfSmyZeK4r+
	z7eiI6WE3/BihnpZSXgDMIE1OWFlUY0WGEOpnHtG8NRY9ndm6jyA6v6ZCfFhtWpETO3sgRuZtFgJA
	VgbC37p+el7NOsKie0A2WaRXN6zBqYbRlsgKWXniIMgPbSnwoHuoWsFALr1NbJQnW1RybrT/Yqshl
	n4adi/9R2v0dRmFhWrC0ev7M+f4/5xFQvMmoeGABRSXvoS9FzWd1XtSRbtzpGGRwd0LxRih3sZlfC
	1qYvXfYQPH4LAbedFDVyBzJxe27gDqszUTj2LYAvh99UEvN9ynCuYNazVAiVFruWivX4vK+ko/RRQ
	iKkR39alHmmgoWYqegTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0LK3-008VCF-4j; Mon, 05 Jul 2021 09:55:27 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0LJp-008VAW-Gy
 for linux-mediatek@lists.infradead.org; Mon, 05 Jul 2021 09:55:15 +0000
Received: by mail-lj1-x235.google.com with SMTP id t30so3920325ljo.5
 for <linux-mediatek@lists.infradead.org>; Mon, 05 Jul 2021 02:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=76UHh0xd3/47lriNsZ56K8AIpOU4AXIgwxQmOqZVOu4=;
 b=Gur909yNfRrbSLYCj5TF7f3/2EDRhQ6gnhZdbubcP/OR83toGfoysivDTuXmGBIbJd
 WtGAWjpTPrkhBF0+pFEMzzlzEZzXfQlZRS3H+4s2aQwvo8AfoFG6jF6xPKR6PP+fsjnH
 aKwgpjD/6Jww1bAokjcLrlvJ1mg2HbSAec8do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=76UHh0xd3/47lriNsZ56K8AIpOU4AXIgwxQmOqZVOu4=;
 b=K5fR80iRnkyPp7aZK26Z8nAdn/3K9kjp7tKPg/Jy3PGHuAd9Ooq/Xbj18w2Swncro7
 sdqBgnDnaSNzyjnTMStvxXW3kHN7I3NNej5Qg9Ab1fwY2ql09iDYLLI90eElPxOLkACO
 zo1ReBpiofsd8raL/HPQ+ptwOEAgY8ysof9OmnaO1S9yTKK6iTUwIWz5WzQh/Xerhmjo
 qPmDWDc8fGwg44fXMVAN7yy3EfQciNQA6FV+vg38Gb4MD2NMKNcMA/QWdj7i0TJ/bTQM
 TTYlNLieal/EtAR0lUJvVN3y7xIeGFVxdwPLieYyNLi9DBemUtvF8WsVROBJGduQCQNK
 M3ww==
X-Gm-Message-State: AOAM533B6nYlITCafy9gQdcW7cfO0z4Bu39ndt92SmCL3ieG7jQMEL/R
 S27SQsoEOfy5WRDmx/26+R6Y9AK0M4aIAuupqHwPDw==
X-Google-Smtp-Source: ABdhPJyd+J7AADwR6pbVkPJj0QpvAzTSciPcJRxaXQx7VKleQjJCQk7Qi8C/Mv/1z/QFK8vAe5+pv0fE9PDIbsI+P4s=
X-Received: by 2002:a2e:5c42:: with SMTP id q63mr10340582ljb.23.1625478911337; 
 Mon, 05 Jul 2021 02:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210630090710.1873559-1-kansho@chromium.org>
 <20210630180652.1.I88a52644e47e88b15f5db9841cb084dc53c5875c@changeid>
 <716ab7a7-937d-df88-8d3c-8d35df473b4e@gmail.com>
 <CAP3OrSLyoKNr7fMOx5sUtWi7PVQGuN-5w7k_0D2MhDUeXXmYCg@mail.gmail.com>
In-Reply-To: <CAP3OrSLyoKNr7fMOx5sUtWi7PVQGuN-5w7k_0D2MhDUeXXmYCg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 5 Jul 2021 17:55:00 +0800
Message-ID: <CAGXv+5FVf3hu5Y+aFazqBwAcvWMGkyqXB-2VVnskmMsYKj2_yA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: mt8183: add audio node
To: Kansho Nishida <kansho@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, 
 LKML <linux-kernel@vger.kernel.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>, 
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Shunli Wang <shunli.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
 Eddie Huang <eddie.huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_025513_659750_4299F16C 
X-CRM114-Status: GOOD (  22.37  )
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

Hi,

On Mon, Jul 5, 2021 at 5:40 PM Kansho Nishida <kansho@chromium.org> wrote:
>
> On Fri, Jul 2, 2021 at 3:20 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> >
> >
> >
> > On 30/06/2021 11:07, Kansho Nishida wrote:
> > > Add afe (audio front end) device node to the MT8183 dtsi.
> > >
> > > Signed-off-by: Kansho Nishida <kansho@chromium.org>
> > > ---
> > >
> > >  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 94 +++++++++++++++++++++++-
> > >  1 file changed, 93 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > > index f90df6439c08..b06acb8d6527 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > > @@ -1115,10 +1115,102 @@ usb_host: usb@11200000 {
> > >                       };
> > >               };
> > >
> > > -             audiosys: syscon@11220000 {
> > > +             audiosys: clock-controller@11220000 {
> >
> > Why do you change it from sysecon to clock-controller?
> >
> > Regards,
> > Matthias
>
> Hi Matthias,
>
> Thanks for the comments!
> This should be "clock-controller" according to the binding description (*1).
> Moreover, you suggested doing so even though it's a long time ago (*2).

The address space really covers the whole audio subsystem though. The clock
controls only span a few registers. In hindsight the clock controls shouldn't
have been modelled separately, since they are only used internally within the
audio subsystem.

See https://lore.kernel.org/linux-mediatek/YOLKxrJin5kkwiIl@google.com/T/#u
for issues I raised on the MT8195.

Now we are probably not going to be able to fix this for existing bindings,
so let's just get the node name right. It should probably be audio-controller
or something close instead.


Regards
ChenYu


> *1) https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/mediatek/mediatek%2Caudsys.txt
> *2) https://patchwork.kernel.org/project/linux-mediatek/patch/1559360354-22974-1-git-send-email-jiaxin.yu@mediatek.com/
>
> Regards,
> Kansho
>
> >
> > >                       compatible = "mediatek,mt8183-audiosys", "syscon";
> > >                       reg = <0 0x11220000 0 0x1000>;
> > >                       #clock-cells = <1>;
> > > +                     afe: mt8183-afe-pcm {
> > > +                             compatible = "mediatek,mt8183-audio";
> > > +                             interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
> > > +                             resets = <&watchdog MT8183_TOPRGU_AUDIO_SW_RST>;
> > > +                             reset-names = "audiosys";
> > > +                             power-domains =
> > > +                                     <&spm MT8183_POWER_DOMAIN_AUDIO>;
> > > +                             clocks = <&audiosys CLK_AUDIO_AFE>,
> > > +                                      <&audiosys CLK_AUDIO_DAC>,
> > > +                                      <&audiosys CLK_AUDIO_DAC_PREDIS>,
> > > +                                      <&audiosys CLK_AUDIO_ADC>,
> > > +                                      <&audiosys CLK_AUDIO_PDN_ADDA6_ADC>,
> > > +                                      <&audiosys CLK_AUDIO_22M>,
> > > +                                      <&audiosys CLK_AUDIO_24M>,
> > > +                                      <&audiosys CLK_AUDIO_APLL_TUNER>,
> > > +                                      <&audiosys CLK_AUDIO_APLL2_TUNER>,
> > > +                                      <&audiosys CLK_AUDIO_I2S1>,
> > > +                                      <&audiosys CLK_AUDIO_I2S2>,
> > > +                                      <&audiosys CLK_AUDIO_I2S3>,
> > > +                                      <&audiosys CLK_AUDIO_I2S4>,
> > > +                                      <&audiosys CLK_AUDIO_TDM>,
> > > +                                      <&audiosys CLK_AUDIO_TML>,
> > > +                                      <&infracfg CLK_INFRA_AUDIO>,
> > > +                                      <&infracfg CLK_INFRA_AUDIO_26M_BCLK>,
> > > +                                      <&topckgen CLK_TOP_MUX_AUDIO>,
> > > +                                      <&topckgen CLK_TOP_MUX_AUD_INTBUS>,
> > > +                                      <&topckgen CLK_TOP_SYSPLL_D2_D4>,
> > > +                                      <&topckgen CLK_TOP_MUX_AUD_1>,
> > > +                                      <&topckgen CLK_TOP_APLL1_CK>,
> > > +                                      <&topckgen CLK_TOP_MUX_AUD_2>,
> > > +                                      <&topckgen CLK_TOP_APLL2_CK>,
> > > +                                      <&topckgen CLK_TOP_MUX_AUD_ENG1>,
> > > +                                      <&topckgen CLK_TOP_APLL1_D8>,
> > > +                                      <&topckgen CLK_TOP_MUX_AUD_ENG2>,
> > > +                                      <&topckgen CLK_TOP_APLL2_D8>,
> > > +                                      <&topckgen CLK_TOP_MUX_APLL_I2S0>,
> > > +                                      <&topckgen CLK_TOP_MUX_APLL_I2S1>,
> > > +                                      <&topckgen CLK_TOP_MUX_APLL_I2S2>,
> > > +                                      <&topckgen CLK_TOP_MUX_APLL_I2S3>,
> > > +                                      <&topckgen CLK_TOP_MUX_APLL_I2S4>,
> > > +                                      <&topckgen CLK_TOP_MUX_APLL_I2S5>,
> > > +                                      <&topckgen CLK_TOP_APLL12_DIV0>,
> > > +                                      <&topckgen CLK_TOP_APLL12_DIV1>,
> > > +                                      <&topckgen CLK_TOP_APLL12_DIV2>,
> > > +                                      <&topckgen CLK_TOP_APLL12_DIV3>,
> > > +                                      <&topckgen CLK_TOP_APLL12_DIV4>,
> > > +                                      <&topckgen CLK_TOP_APLL12_DIVB>,
> > > +                                      /*<&topckgen CLK_TOP_APLL12_DIV5>,*/
> > > +                                      <&clk26m>;
> > > +                             clock-names = "aud_afe_clk",
> > > +                                               "aud_dac_clk",
> > > +                                               "aud_dac_predis_clk",
> > > +                                               "aud_adc_clk",
> > > +                                               "aud_adc_adda6_clk",
> > > +                                               "aud_apll22m_clk",
> > > +                                               "aud_apll24m_clk",
> > > +                                               "aud_apll1_tuner_clk",
> > > +                                               "aud_apll2_tuner_clk",
> > > +                                               "aud_i2s1_bclk_sw",
> > > +                                               "aud_i2s2_bclk_sw",
> > > +                                               "aud_i2s3_bclk_sw",
> > > +                                               "aud_i2s4_bclk_sw",
> > > +                                               "aud_tdm_clk",
> > > +                                               "aud_tml_clk",
> > > +                                               "aud_infra_clk",
> > > +                                               "mtkaif_26m_clk",
> > > +                                               "top_mux_audio",
> > > +                                               "top_mux_aud_intbus",
> > > +                                               "top_syspll_d2_d4",
> > > +                                               "top_mux_aud_1",
> > > +                                               "top_apll1_ck",
> > > +                                               "top_mux_aud_2",
> > > +                                               "top_apll2_ck",
> > > +                                               "top_mux_aud_eng1",
> > > +                                               "top_apll1_d8",
> > > +                                               "top_mux_aud_eng2",
> > > +                                               "top_apll2_d8",
> > > +                                               "top_i2s0_m_sel",
> > > +                                               "top_i2s1_m_sel",
> > > +                                               "top_i2s2_m_sel",
> > > +                                               "top_i2s3_m_sel",
> > > +                                               "top_i2s4_m_sel",
> > > +                                               "top_i2s5_m_sel",
> > > +                                               "top_apll12_div0",
> > > +                                               "top_apll12_div1",
> > > +                                               "top_apll12_div2",
> > > +                                               "top_apll12_div3",
> > > +                                               "top_apll12_div4",
> > > +                                               "top_apll12_divb",
> > > +                                               /*"top_apll12_div5",*/
> > > +                                               "top_clk26m_clk";
> > > +                     };
> > >               };
> > >
> > >               mmc0: mmc@11230000 {
> > >
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
