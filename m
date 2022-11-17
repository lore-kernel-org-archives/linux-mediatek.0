Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5105FC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 14:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6vcCZOOf8jcUqD9cs2pOvm0c4ktWa055O7dWGfWcJ8=; b=T7VHddiXKfSzCi1ZODd+Jco68x
	lQsQ6LHpATW5BEe0kjT1SeB3iiVLmmEMM+2NsEHE0oRuc3HO8bnRo4WB3GDkA7daL8nfjn2RTVm8J
	ccX/jTCh7GM7OBE+hYbrjBdEdnfSIb9VUzJPbHS8KeHcm3h2AhiyPYNKWDFDBVttNlnLivHwxyTXj
	u8+SnmUFnjxHQUb/hi7H0SC7170QpdZshlRc/Gc1v1MleuS8b02qYKgRke6cNvEyQhpM6SwOVmad1
	fgO/nq7WKpAjrNsFlsltG1NP26asVHzHQZJKcL+AAyoSOXb66XywI1ns2Z57qiNYMXWW+dTE5+r/U
	octY1GVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovfpT-00EnTc-VG; Thu, 17 Nov 2022 14:25:23 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovfoh-00En9S-96; Thu, 17 Nov 2022 14:24:38 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1ovfoW-0004mp-6f; Thu, 17 Nov 2022 15:24:24 +0100
Date: Thu, 17 Nov 2022 14:23:02 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Sam Shih <sam.shih@mediatek.com>, linux-pwm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/2] pwm: mediatek: Add support for MT7986
Message-ID: <Y3ZDxqLT3YdLzTiU@makrotopia.org>
References: <Y1K5ym1EL8kwzQEt@makrotopia.org>
 <b5ab84b4d595713588f1d8a68a1585ca3ae5521e.camel@mediatek.com>
 <20221117115624.t2kbwscxvkvffo7x@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221117115624.t2kbwscxvkvffo7x@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_062435_374776_62452F31 
X-CRM114-Status: GOOD (  28.19  )
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

On Thu, Nov 17, 2022 at 12:56:24PM +0100, Uwe Kleine-König wrote:
> On Tue, Oct 25, 2022 at 02:35:43PM +0800, Sam Shih wrote:
> > Hi Daniel:
> > 
> > On Fri, 2022-10-21 at 16:24 +0100, Daniel Golle wrote:
> > > Add support for PWM on MT7986 which has 2 PWM channels, one of them
> > > is
> > > typically used for a temperature controlled fan.
> > > 
> > > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > > ---
> > >  drivers/pwm/pwm-mediatek.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
> > > index 6901a44dc428de..2219cba033e348 100644
> > > --- a/drivers/pwm/pwm-mediatek.c
> > > +++ b/drivers/pwm/pwm-mediatek.c
> > > @@ -329,6 +329,12 @@ static const struct pwm_mediatek_of_data
> > > mt8365_pwm_data = {
> > >  	.has_ck_26m_sel = true,
> > >  };
> > >  
> > > +static const struct pwm_mediatek_of_data mt7986_pwm_data = {
> > > +	.num_pwms = 2,
> > > +	.pwm45_fixup = false,
> > > +	.has_ck_26m_sel = true,
> > 
> > For MT7986 SoC, I think the value of "has_ck_26m_sel" should be 'false' 
> 
> The status of the discussion isn't clear to me. You didn't visibly agree
> which value is right now. Will there be a v2 of this patch? Or is it
> expected to be picked up as is.

The patch has been tested thoroughly and works well as-is.
The CK_26M_SEL register does exist on MT7986 and, at least according to
the datasheet[1], is set to the wrong value (selecting 26M clock) on
reset (but probably then already set to 0 to select the bus clock, e.g.
by the bootloader). So in the worst case, this is a no-op.

[1]: MT7986 Reference Manual, version 1.0 released 2022-05-29, page 428
     available at https://wiki.banana-pi.org/Banana_Pi_BPI-R3#Documents

> 
> From my side (i.e. not having checked the hw details just judging with
> the PWM hat on) the patch is fine.
> 
> Best regards
> Uwe
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |

/

