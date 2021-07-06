Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF6EC07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 09:38:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97B3E6199B
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 09:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97B3E6199B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UNEVwFyJlNrZFgtTImRNZ/GWhS+1nbiVLLaHTKI13BM=; b=x6A8FnUX4YAqo/
	MxRsDrB+DzZfa48AtU/RvYBVc14gk75LKmpfALeDCgrWtsbAFC4KSWI19nkZcQ9NrKM5xzye3dGDw
	Gbvf29jKOkAFLZeOACmnydh4uUQbF35vSo+vBSIzEps2SKHlNRZSHkn6XbWRADz6ffscRKE4nOBWy
	FFLls5LBFalj1anUD5mN5axHDwIBv6h6y7SY/sZtIJtoTBainZytuec0MbzKXBhiNq8+iuv+2pPHQ
	EJU8iOO4WNG919FC0f/S9/kGHiuMJqNcCIOEYG59gfaJaJ3pNYId1lFjBgKo6w9I6UN9ZAQEa75IX
	B3eORj9RYW1iIQmzDwRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0hXI-00AuIN-Rs; Tue, 06 Jul 2021 09:38:36 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0hXG-00AuHM-Bv
 for linux-mediatek@lists.infradead.org; Tue, 06 Jul 2021 09:38:36 +0000
Received: by mail-pf1-x42a.google.com with SMTP id y2so5823012pff.11
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Jul 2021 02:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yF9OMxS2c/2tokATGGfLkvP79xoaq/JM2vOaNahFcrY=;
 b=K/xCtGhsSAOAnYR7nSSV1bWrTUYHM9dWS2fvDAwR0MMVeP28fB2KkgtgnqkSeywRFu
 0eU7iezOAPPwFi+uYP8fMjxZJNhhZsyFnAcqdv9pYH8CI0ryXItb/KEVCYQedmk7sOzY
 yisRJyiOamke/HQTntFEz9Y7qsj8EKwJ8DfLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yF9OMxS2c/2tokATGGfLkvP79xoaq/JM2vOaNahFcrY=;
 b=WTcFlR3/Je66miD08hOdax7ElCwntgKw11HSpJL3CxDTkIcdQzNogMua4c+PLa0yyv
 3HEle/4lVa00eVXZEA7ak0cN/cet6I6quFFHElTPsHBNKpSf3RZ3P++IqkgmowxgEHXp
 yWXiRD9xSWnfv2sxV2uVO7nS2AeesYL2xQa2EV8y8VBwvNtW0xYcY0IR91vm4bE9XzR1
 sYTE+d2ECXy+bU5UpZOAI1jLypXebR+gt6pQsZe7wTkZTfqC+TW4BwE2pocqtn3nXwKj
 KC2gBxQzULfEamgNVCjWs+KQLhsG28LQLKzhxjk5x43v3UrLly5cJ4xMFysQE4hsUIik
 x19A==
X-Gm-Message-State: AOAM533XJwEn4a6KJVprRk5jVmBsdxGUNtWmLsRD5JJ3FcGigQoyCaCF
 PFSP9O1xoXsqstIJSK8g3TkPOobhlkZjc41RdmjOjg==
X-Google-Smtp-Source: ABdhPJymcCrNGCc0r7o3SY6VsAaA9EN5U5abtpl7YUfwb0OBhex7wh98FaICBfBIrhrVRx2hWrKi9mRnsUA3QbY35k0=
X-Received: by 2002:a62:e307:0:b029:321:98d5:ae46 with SMTP id
 g7-20020a62e3070000b029032198d5ae46mr5909502pfh.66.1625564311602; Tue, 06 Jul
 2021 02:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210630090710.1873559-1-kansho@chromium.org>
 <20210630180652.1.I88a52644e47e88b15f5db9841cb084dc53c5875c@changeid>
 <716ab7a7-937d-df88-8d3c-8d35df473b4e@gmail.com>
 <CAP3OrSLyoKNr7fMOx5sUtWi7PVQGuN-5w7k_0D2MhDUeXXmYCg@mail.gmail.com>
 <CAGXv+5FVf3hu5Y+aFazqBwAcvWMGkyqXB-2VVnskmMsYKj2_yA@mail.gmail.com>
In-Reply-To: <CAGXv+5FVf3hu5Y+aFazqBwAcvWMGkyqXB-2VVnskmMsYKj2_yA@mail.gmail.com>
From: Kansho Nishida <kansho@chromium.org>
Date: Tue, 6 Jul 2021 18:38:20 +0900
Message-ID: <CAP3OrSK_CVJO3s3YhO5e_m_k0z8h1GrrC8WMcRw1WD41nJk=XA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: mt8183: add audio node
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, 
 LKML <linux-kernel@vger.kernel.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>, 
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Shunli Wang <shunli.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
 Eddie Huang <eddie.huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_023834_473569_E86396DD 
X-CRM114-Status: GOOD (  27.43  )
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

Hi Chen,

On Mon, Jul 5, 2021 at 6:55 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> Hi,
>
> On Mon, Jul 5, 2021 at 5:40 PM Kansho Nishida <kansho@chromium.org> wrote:
> >
> > On Fri, Jul 2, 2021 at 3:20 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> > >
> > >
> > >
> > > On 30/06/2021 11:07, Kansho Nishida wrote:
> > > > Add afe (audio front end) device node to the MT8183 dtsi.
> > > >
> > > > Signed-off-by: Kansho Nishida <kansho@chromium.org>
> > > > ---
> > > >
> > > >  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 94 +++++++++++++++++++++++-
> > > >  1 file changed, 93 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > > > index f90df6439c08..b06acb8d6527 100644
> > > > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > > > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > > > @@ -1115,10 +1115,102 @@ usb_host: usb@11200000 {
> > > >                       };
> > > >               };
> > > >
> > > > -             audiosys: syscon@11220000 {
> > > > +             audiosys: clock-controller@11220000 {
> > >
> > > Why do you change it from sysecon to clock-controller?
> > >
> > > Regards,
> > > Matthias
> >
> > Hi Matthias,
> >
> > Thanks for the comments!
> > This should be "clock-controller" according to the binding description (*1).
> > Moreover, you suggested doing so even though it's a long time ago (*2).
>
> The address space really covers the whole audio subsystem though. The clock
> controls only span a few registers. In hindsight the clock controls shouldn't
> have been modelled separately, since they are only used internally within the
> audio subsystem.
>
> See https://lore.kernel.org/linux-mediatek/YOLKxrJin5kkwiIl@google.com/T/#u
> for issues I raised on the MT8195.
>
> Now we are probably not going to be able to fix this for existing bindings,
> so let's just get the node name right. It should probably be audio-controller
> or something close instead.

OK, let's use audio-controller instead. I'll submit the v3 patch.

Regards,
Kansho

>
>
> Regards
> ChenYu
>
>
> > *1) https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/mediatek/mediatek%2Caudsys.txt
> > *2) https://patchwork.kernel.org/project/linux-mediatek/patch/1559360354-22974-1-git-send-email-jiaxin.yu@mediatek.com/
> >
> > Regards,
> > Kansho
> >
> > >
> > > >                       compatible = "mediatek,mt8183-audiosys", "syscon";
> > > >                       reg = <0 0x11220000 0 0x1000>;
> > > >                       #clock-cells = <1>;
> > > > +                     afe: mt8183-afe-pcm {
> > > > +                             compatible = "mediatek,mt8183-audio";
> > > > +                             interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
> > > > +                             resets = <&watchdog MT8183_TOPRGU_AUDIO_SW_RST>;
> > > > +                             reset-names = "audiosys";
> > > > +                             power-domains =
> > > > +                                     <&spm MT8183_POWER_DOMAIN_AUDIO>;
> > > > +                             clocks = <&audiosys CLK_AUDIO_AFE>,
> > > > +                                      <&audiosys CLK_AUDIO_DAC>,
> > > > +                                      <&audiosys CLK_AUDIO_DAC_PREDIS>,
> > > > +                                      <&audiosys CLK_AUDIO_ADC>,
> > > > +                                      <&audiosys CLK_AUDIO_PDN_ADDA6_ADC>,
> > > > +                                      <&audiosys CLK_AUDIO_22M>,
> > > > +                                      <&audiosys CLK_AUDIO_24M>,
> > > > +                                      <&audiosys CLK_AUDIO_APLL_TUNER>,
> > > > +                                      <&audiosys CLK_AUDIO_APLL2_TUNER>,
> > > > +                                      <&audiosys CLK_AUDIO_I2S1>,
> > > > +                                      <&audiosys CLK_AUDIO_I2S2>,
> > > > +                                      <&audiosys CLK_AUDIO_I2S3>,
> > > > +                                      <&audiosys CLK_AUDIO_I2S4>,
> > > > +                                      <&audiosys CLK_AUDIO_TDM>,
> > > > +                                      <&audiosys CLK_AUDIO_TML>,
> > > > +                                      <&infracfg CLK_INFRA_AUDIO>,
> > > > +                                      <&infracfg CLK_INFRA_AUDIO_26M_BCLK>,
> > > > +                                      <&topckgen CLK_TOP_MUX_AUDIO>,
> > > > +                                      <&topckgen CLK_TOP_MUX_AUD_INTBUS>,
> > > > +                                      <&topckgen CLK_TOP_SYSPLL_D2_D4>,
> > > > +                                      <&topckgen CLK_TOP_MUX_AUD_1>,
> > > > +                                      <&topckgen CLK_TOP_APLL1_CK>,
> > > > +                                      <&topckgen CLK_TOP_MUX_AUD_2>,
> > > > +                                      <&topckgen CLK_TOP_APLL2_CK>,
> > > > +                                      <&topckgen CLK_TOP_MUX_AUD_ENG1>,
> > > > +                                      <&topckgen CLK_TOP_APLL1_D8>,
> > > > +                                      <&topckgen CLK_TOP_MUX_AUD_ENG2>,
> > > > +                                      <&topckgen CLK_TOP_APLL2_D8>,
> > > > +                                      <&topckgen CLK_TOP_MUX_APLL_I2S0>,
> > > > +                                      <&topckgen CLK_TOP_MUX_APLL_I2S1>,
> > > > +                                      <&topckgen CLK_TOP_MUX_APLL_I2S2>,
> > > > +                                      <&topckgen CLK_TOP_MUX_APLL_I2S3>,
> > > > +                                      <&topckgen CLK_TOP_MUX_APLL_I2S4>,
> > > > +                                      <&topckgen CLK_TOP_MUX_APLL_I2S5>,
> > > > +                                      <&topckgen CLK_TOP_APLL12_DIV0>,
> > > > +                                      <&topckgen CLK_TOP_APLL12_DIV1>,
> > > > +                                      <&topckgen CLK_TOP_APLL12_DIV2>,
> > > > +                                      <&topckgen CLK_TOP_APLL12_DIV3>,
> > > > +                                      <&topckgen CLK_TOP_APLL12_DIV4>,
> > > > +                                      <&topckgen CLK_TOP_APLL12_DIVB>,
> > > > +                                      /*<&topckgen CLK_TOP_APLL12_DIV5>,*/
> > > > +                                      <&clk26m>;
> > > > +                             clock-names = "aud_afe_clk",
> > > > +                                               "aud_dac_clk",
> > > > +                                               "aud_dac_predis_clk",
> > > > +                                               "aud_adc_clk",
> > > > +                                               "aud_adc_adda6_clk",
> > > > +                                               "aud_apll22m_clk",
> > > > +                                               "aud_apll24m_clk",
> > > > +                                               "aud_apll1_tuner_clk",
> > > > +                                               "aud_apll2_tuner_clk",
> > > > +                                               "aud_i2s1_bclk_sw",
> > > > +                                               "aud_i2s2_bclk_sw",
> > > > +                                               "aud_i2s3_bclk_sw",
> > > > +                                               "aud_i2s4_bclk_sw",
> > > > +                                               "aud_tdm_clk",
> > > > +                                               "aud_tml_clk",
> > > > +                                               "aud_infra_clk",
> > > > +                                               "mtkaif_26m_clk",
> > > > +                                               "top_mux_audio",
> > > > +                                               "top_mux_aud_intbus",
> > > > +                                               "top_syspll_d2_d4",
> > > > +                                               "top_mux_aud_1",
> > > > +                                               "top_apll1_ck",
> > > > +                                               "top_mux_aud_2",
> > > > +                                               "top_apll2_ck",
> > > > +                                               "top_mux_aud_eng1",
> > > > +                                               "top_apll1_d8",
> > > > +                                               "top_mux_aud_eng2",
> > > > +                                               "top_apll2_d8",
> > > > +                                               "top_i2s0_m_sel",
> > > > +                                               "top_i2s1_m_sel",
> > > > +                                               "top_i2s2_m_sel",
> > > > +                                               "top_i2s3_m_sel",
> > > > +                                               "top_i2s4_m_sel",
> > > > +                                               "top_i2s5_m_sel",
> > > > +                                               "top_apll12_div0",
> > > > +                                               "top_apll12_div1",
> > > > +                                               "top_apll12_div2",
> > > > +                                               "top_apll12_div3",
> > > > +                                               "top_apll12_div4",
> > > > +                                               "top_apll12_divb",
> > > > +                                               /*"top_apll12_div5",*/
> > > > +                                               "top_clk26m_clk";
> > > > +                     };
> > > >               };
> > > >
> > > >               mmc0: mmc@11230000 {
> > > >
> >
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
