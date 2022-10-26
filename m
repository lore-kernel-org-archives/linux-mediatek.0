Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194EFC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 10:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RsHl2fMrf0h5frTsVlwVHMPwhQYfDiPhfWVBMTKgHWU=; b=Hq1N3Sj+ulUCLn3vLexir5DlC8
	w3MOK/dGkHVQLC3VbjGAfrKwIaBnwViDTarmgXsUWtPBPVJ8UsgFZVuB7/KRZehdnuhbt/H3BI/Sq
	iIL5gzMNX46yqTGkn/uFI/sVrEXqBGb02D5IM3htEUh6qtDnvN0XjZXPTdMFaxtbZmfL3SO7pdiCp
	y5Z2GBvgq6Z1eV/SmDgvri5ExMQ1sTdmhno2s1XNwWevT50sT3enhnWivgRappcnpw9AkYeC7PQ35
	CH9WU/rD0/LVPH/KsEUiWI44suYo1MxTZdDK7eQrMdCyh+u4HaamjzhpYRAaEj9mP9b8nluVvkN73
	KiV918YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ondD9-008suy-70; Wed, 26 Oct 2022 10:00:35 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ondD5-008suR-7X; Wed, 26 Oct 2022 10:00:33 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1ondCv-0005BQ-Sg; Wed, 26 Oct 2022 12:00:22 +0200
Date: Wed, 26 Oct 2022 11:00:18 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Sam Shih <sam.shih@mediatek.com>
Cc: linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/2] pwm: mediatek: Add support for MT7986
Message-ID: <Y1kFMmkavtBc4BnV@makrotopia.org>
References: <Y1K5ym1EL8kwzQEt@makrotopia.org>
 <b5ab84b4d595713588f1d8a68a1585ca3ae5521e.camel@mediatek.com>
 <Y1fPLzwUz/E9C3I1@makrotopia.org>
 <df08d62655e57d00ab5596bc90a4c40c332cee6b.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df08d62655e57d00ab5596bc90a4c40c332cee6b.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_030031_291180_53A6B809 
X-CRM114-Status: GOOD (  49.58  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 26, 2022 at 02:17:06PM +0800, Sam Shih wrote:
> On Tue, 2022-10-25 at 12:57 +0100, Daniel Golle wrote:
> > On Tue, Oct 25, 2022 at 02:35:43PM +0800, Sam Shih wrote:
> > > Hi Daniel:
> > > 
> > > On Fri, 2022-10-21 at 16:24 +0100, Daniel Golle wrote:
> > > > Add support for PWM on MT7986 which has 2 PWM channels, one of
> > > > them
> > > > is
> > > > typically used for a temperature controlled fan.
> > > > 
> > > > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > > > ---
> > > >  drivers/pwm/pwm-mediatek.c | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > > 
> > > > diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-
> > > > mediatek.c
> > > > index 6901a44dc428de..2219cba033e348 100644
> > > > --- a/drivers/pwm/pwm-mediatek.c
> > > > +++ b/drivers/pwm/pwm-mediatek.c
> > > > @@ -329,6 +329,12 @@ static const struct pwm_mediatek_of_data
> > > > mt8365_pwm_data = {
> > > >  	.has_ck_26m_sel = true,
> > > >  };
> > > >  
> > > > +static const struct pwm_mediatek_of_data mt7986_pwm_data = {
> > > > +	.num_pwms = 2,
> > > > +	.pwm45_fixup = false,
> > > > +	.has_ck_26m_sel = true,
> > > 
> > > For MT7986 SoC, I think the value of "has_ck_26m_sel" should be
> > > 'false'
> > 
> > That's a bit surprising, please explain why.
> > 
> 
> The clock tree of MT7981/MT7986 PWM BCLK is as bellow:
> PLL --> topckgen fix-factors --> TOP_PWM_SEL (topckgen clock mux) -->
> --
> > CLK_INFRA_PWM_BSEL (infra clock mux) --> PWM BCLK (gate)
> 
> We do have the clock multiplexer to select the source clock for PWM_BCLK
> https://github.com/torvalds/linux/blob/master/drivers/clk/mediatek/clk-mt7986-infracfg.c#L63
> 
> In my knowledge, the pwm hardware of MT7981/MT7986 SoC should ignore
> this register directtly, but we still keep the register for backword
> compatibility.
> 
> In fact, the MT7986 SoC is also working whether 'has_ck_26m_sel' is
> 'true' or 'false'.
> 
> Going back to the definition of 'has_ck_26m_sel', if it means
> "PWM_CK_26M_SEL" register exists or not, we should use 'true', but if
> it means clock from 26M clock or BUS clock, we should use 'false'

It means 'write 0 to PWM_CK_26M_SEL to make sure PWM BCLK is selected'.
If the register isn't used at all on MT7986 (despite being mentioned in
the datasheet) or the value written there never has any effect then
there is no need to do this and has_ck_26m_sel can be false.

> 
> > Reading the commit adding .has_ck_26m_sel field:
> > > commit 0c0ead76235db0bcfaab83f04db546995449d002
> > > Author: Fabien Parent <fparent@baylibre.com>
> > > Date:   Mon Oct 19 16:07:02 2020 +0200
> > > 
> > > pwm: mediatek: Always use bus clock
> > > 
> > > The MediaTek PWM IP can sometimes use the 26 MHz source clock to
> > > generate the PWM signal, but the driver currently assumes that we
> > > always
> > > use the PWM bus clock to generate the PWM signal.
> > > 
> > > This commit modifies the PWM driver in order to force the PWM IP to
> > > always use the bus clock as source clock.
> > > 
> > > I do not have the datasheet of all the MediaTek SoC, so I don't
> > > know if
> > > the register to choose the source clock is present in all the SoCs
> > > or
> > > only in subset. As a consequence I made this change optional by
> > > using a
> > > platform data paremeter to says whether this register is supported
> > > or
> > > not. On all the SoCs I don't have the datasheet (MT2712, MT7622,
> > > MT7623,
> > > MT7628, MT7629) I kept the behavior to be the same as before this
> > > change.
> > > 
> > > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > > Signed-off-by: Thierry Reding <thierry.reding@gmail.com>
> > 
> > From MT7986 datasheet:
> > > 0x10048210 PWM_CK_26M_SEL PWM BCLK Selection
> > > Reset value 0x00000001
> > > Description
> > > 0: Select bus CLK as BCLK
> > > 1: Select 26M fix CLK as BCLK
> > So after reset, the 26M clock is selected by default.
> > 
> > In pwm-mediatek.c I read:
> > > #define PWM_CK_26M_SEL          0x210
> > > ...
> > >         /* Make sure we use the bus clock and not the 26MHz clock
> > > */
> > >         if (pc->soc->has_ck_26m_sel)
> > >                 writel(0, pc->regs + PWM_CK_26M_SEL);
> > 
> > So this PWM_CK_26M_SEL register does exist on MT7986 and has the
> > same address as expected by the driver ($PWM_BASE + 0x210).
> > The default value selected after reset (0x00000001) matches the
> > problem and solution described in the commit description
> > "pwm: mediatek: Always use bus clock".
> > 
> > Sidenode: I've tried with both, .has_ck_26m_sel = true as well as
> > .has_ck_26m_sel = false. Both do work, but the behavior is slightly
> > different, again matching the commit description above.
> 
> What is the difference between the two?
> 
> I tried to config the pwm ch0 period=1000000 and duty=500000,
> Modify PWM_CK_26M_SEL, and measure the output waveform, the waveform
> keep the same.

Maybe something else already sets the PWM_CK_26M_SEL register to 0
before Linux starts (e.g. U-Boot)?

