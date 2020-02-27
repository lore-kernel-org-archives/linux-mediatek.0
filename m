Return-Path: <SRS0=4wrq=4P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D243CC4BA24
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 10:10:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A49B924670
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 10:10:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gI2BOt6q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BakoIO05"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A49B924670
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ipIrfwECp01Q55JhTMMagYBqCvQoIU6Xtc8MuX4T3rg=; b=gI2BOt6qQiT3Af
	gSbgQ8Yw6FttU03Qj5I1z6wxUZybYTx/HvAiDWM7YTvhvZwv0xP+8nNMAfTaOLSYIcIRBM2ODwSxY
	NtbUZJFc18OaDFPiEMEahf7MpUzVW5+Oy4d25zHJeVBZJqMOP32CTcn5Vm9+gfrD03JIya7o6nmHD
	YKOXti/++X8veCdEJ6l6jvmMZA1iDEY5GjtwpZ0+8fF/VtUvMlaYN9lTpYntxT5gx6VfvFsu1n3Xd
	fryNkH7BkUPO4tL9Cw+vC9LNc4KLnWXrSnJS4iUFJJBT8r07pXLJEkk2XJNA+otT4GUbz8ZXnsm9l
	D+ysJezvNC3L5SCvApCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7G7H-0006hO-Rq; Thu, 27 Feb 2020 10:10:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7G7E-0006Wh-Pr; Thu, 27 Feb 2020 10:10:02 +0000
X-UUID: 1b03fa6e8a38465ca83dfa9628bcfdfb-20200227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=eLO7gTFF1vCEAIYROkM8MZuVGCM3sjjAWL8M+r6/05Y=; 
 b=BakoIO05e70F2zY4x9CluisQoeR2XSAUbzcWYoBfojDKRB1rabr2ND/3Fc3BDv/lMD4vRzT0evUdvNnSw44hiIW09QV1L/mWtF9KgXsXt6kEnc3NHimSorPXgazAkfYlCxf4yMFJ+Pp2FT2IrCe9OAS7dVxONIKUsyBrzLxNMj0=;
X-UUID: 1b03fa6e8a38465ca83dfa9628bcfdfb-20200227
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 94554355; Thu, 27 Feb 2020 02:09:54 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 27 Feb 2020 02:00:58 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 27 Feb 2020 17:59:00 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 27 Feb 2020 17:59:53 +0800
Message-ID: <1582797590.25607.10.camel@mtksdccf07>
Subject: Re: [PATCH 1/1] pwm: mediatek: add longer period support
From: Sam Shih <sam.shih@mediatek.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Thu, 27 Feb 2020 17:59:50 +0800
In-Reply-To: <20200227080450.rkvwfjx6vikn5ls3@pengutronix.de>
References: <1582789610-23133-1-git-send-email-sam.shih@mediatek.com>
 <1582789610-23133-2-git-send-email-sam.shih@mediatek.com>
 <20200227080450.rkvwfjx6vikn5ls3@pengutronix.de>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_021000_846692_483944C2 
X-CRM114-Status: GOOD (  26.28  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-02-27 at 09:04 +0100, Uwe Kleine-K=F6nig wrote:
On Thu, Feb 27, 2020 at 03:46:50PM +0800, Sam Shih wrote:
> > The pwm clock source could be divided by 1625 with PWM_CON
> > BIT(3) setting in mediatek hardware.
> > =

> > This patch add support for longer pwm period configuration,
> > which allowing blinking LEDs via pwm interface.
> > =

> > Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> > ---
> >  drivers/pwm/pwm-mediatek.c | 21 +++++++++++++++++----
> >  1 file changed, 17 insertions(+), 4 deletions(-)
> > =

> > diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
> > index b94e0d09c300..9af309bea01a 100644
> > --- a/drivers/pwm/pwm-mediatek.c
> > +++ b/drivers/pwm/pwm-mediatek.c
> > @@ -121,8 +121,8 @@ static int pwm_mediatek_config(struct pwm_chip
*chip, struct pwm_device *pwm,
> >  			       int duty_ns, int period_ns)
> >  {
> >  	struct pwm_mediatek_chip *pc =3D to_pwm_mediatek_chip(chip);
> > -	u32 clkdiv =3D 0, cnt_period, cnt_duty, reg_width =3D PWMDWIDTH,
> > -	    reg_thres =3D PWMTHRES;
> > +	u32 clkdiv =3D 0, clksel =3D 0, cnt_period, cnt_duty,
> > +	    reg_width =3D PWMDWIDTH, reg_thres =3D PWMTHRES;
> >  	u64 resolution;
> >  	int ret;
> >  =

> Adding some more context:
> =


+ /* The pwm source clock can be divided by 2^clkdiv. When the clksel  +
* bit is set to 1, The final clock output needs to be divided by an +  *
extra 1625.
+  */

Is this ok ?


> > @@ -139,11 +139,20 @@ static int pwm_mediatek_config(struct pwm_chip
*chip, struct pwm_device *pwm,
> > 	while (cnt_period > 8191) {
> >  		resolution *=3D 2;
> >  		clkdiv++;
> >  		cnt_period =3D DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000,
> >  						   resolution);
> > +		if (clkdiv > PWM_CLK_DIV_MAX && !clksel) {
> > +			clksel =3D 1;
> > +			clkdiv =3D 0;
> > +			resolution =3D (u64)NSEC_PER_SEC * 1000 * 1625;
> > +			do_div(resolution,
> > +				clk_get_rate(pc->clk_pwms[pwm->hwpwm]));
> > +			cnt_period =3D DIV_ROUND_CLOSEST_ULL(
> > +					(u64)period_ns * 1000, resolution);
> =

> The assignment is a repetition from just above the if. Maybe just put
it
> once after this if block?

The cnt_period represents the effective range of the PWM period counter,
when we need changing the pwm output period to a longer value at the
same clock frequency, we can setting a larger cnt_period, but the width
of the cnt_peroid register is 12 bits,
When the request period is too long, we need to divide the clock source
and then recalculate cnt_period outputs the correct waveform.
As mentioned above, when changing clkdiv, we need to recalculate
cnt_period immediately.

If the request period is very long (for example, LED blinking), clkdiv
may be insufficient. =

In this case, we will use clksel to divide the pwm source clock by an
additional 1625, and recalculate clkdiv and cnt_period.

I don't think we can just place assignments after the if block.

> =

> > +		}
> >  	}
> >  =

> > -	if (clkdiv > PWM_CLK_DIV_MAX) {
> > +	if (clkdiv > PWM_CLK_DIV_MAX && clksel) {
> =

> Is this change actually relevant? If the while loop that starts at
line
> 139 is never run (because cnt_period is <=3D 8191) clkdiv is zero and so
> the condition is false with and without "&& clksel". If however the
> while loop is entered and clkdiv becomes bigger than PWM_CLK_DIV_MAX
> clksel is 1 and the "&& clksel" doesn't make a difference, too.
> =


You are right, I will remove this.

> The code is hard to follow, I wonder if this could be cleaned up with
> some comments added that explain the hardware details enough to be
able
> to actually understand the code without having the hardware reference
> manual handy.
> =


Is it sufficient to add some context into comment like the response of
the second question?


> >  		pwm_mediatek_clk_disable(chip, pwm);
> >  		dev_err(chip->dev, "period %d not supported\n", period_ns);
> >  		return -EINVAL;
> > @@ -159,7 +168,11 @@ static int pwm_mediatek_config(struct pwm_chip
*chip, struct pwm_device *pwm,
> >  	}
> >  =

> >  	cnt_duty =3D DIV_ROUND_CLOSEST_ULL((u64)duty_ns * 1000, resolution);
> > -	pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | clkdiv);
> > +	if (clksel)
> > +		pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | BIT(3) |
> > +				    clkdiv);
> > +	else
> > +		pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | clkdiv);
> >  	pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period);
> >  	pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty);
> >  =

> > -- =

> > 2.17.1
> =

> Best regards
> Uwe
> =

>

Best Regards,
Sam
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
