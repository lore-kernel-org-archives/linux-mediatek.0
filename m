Return-Path: <SRS0=MFJx=4X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 865D8C10F00
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 07:42:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A6532187F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 07:42:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o/yAQlUt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A6532187F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BzISiOi7e7uSBE/3+/MH+Mpp4DXYURry8FeokJdT5M0=; b=o/yAQlUt2RL6OW
	MhpWJfmttXANoVrawEgSNkTlkp2Bw6UofnbsgexpURCxbu5xJbF9elzW9uAK59/Xmgo6zS3mbSTGI
	KM6zn87JgGcHynqpSXFYTnP4t3MNw6L8+1ZJ16bpP2jvKcVcKLorxcFdyunFykwowKp19e6zS8KDC
	fCclfVR4xGTkvNbycIX4OuDG9+8xRzbkBLuq9JBJpv8MuwhkWvIrA7hLEgg4j1h6BruLaFab0X3bO
	JSvQdjiGYccg7smdLu4sjAP9fWNBrUQHVbzvcdd1xQeK/Aw02j0TAspxkXQWK2UzoZxbd4jfVWqIp
	Fvbbg2/5fxoqGNu08hvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jA7cK-0000tn-D8; Fri, 06 Mar 2020 07:41:56 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jA7cD-0000mQ-Qs
 for linux-mediatek@lists.infradead.org; Fri, 06 Mar 2020 07:41:51 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1jA7c6-0000Vx-G3; Fri, 06 Mar 2020 08:41:42 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1jA7c4-0004F5-4R; Fri, 06 Mar 2020 08:41:40 +0100
Date: Fri, 6 Mar 2020 08:41:40 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Sam Shih <sam.shih@mediatek.com>
Subject: Re: [PATCH v2 1/1] pwm: mediatek: add longer period support
Message-ID: <20200306074140.6oyxk6cn7m4qg25f@pengutronix.de>
References: <1583230755-25986-1-git-send-email-sam.shih@mediatek.com>
 <1583230755-25986-2-git-send-email-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583230755-25986-2-git-send-email-sam.shih@mediatek.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_234149_873144_B47F2094 
X-CRM114-Status: GOOD (  20.52  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 03, 2020 at 06:19:15PM +0800, Sam Shih wrote:
> The pwm clock source could be divided by 1625 with PWM_CON
> BIT(3) setting in mediatek hardware.
> =

> This patch add support for longer pwm period configuration,
> which allowing blinking LEDs via pwm interface.
> =

> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> ---
>  drivers/pwm/pwm-mediatek.c | 34 ++++++++++++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
> index b94e0d09c300..c64ecff6c550 100644
> --- a/drivers/pwm/pwm-mediatek.c
> +++ b/drivers/pwm/pwm-mediatek.c
> @@ -121,8 +121,11 @@ static int pwm_mediatek_config(struct pwm_chip *chip=
, struct pwm_device *pwm,
>  			       int duty_ns, int period_ns)
>  {
>  	struct pwm_mediatek_chip *pc =3D to_pwm_mediatek_chip(chip);
> -	u32 clkdiv =3D 0, cnt_period, cnt_duty, reg_width =3D PWMDWIDTH,
> -	    reg_thres =3D PWMTHRES;
> +	/* The source clock is divided by 2^clkdiv or iff the clksel bit
> +	 * is set by (2^clkdiv*1625)
> +	 */

Please put the /* on it's own line. See
https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting

> +	u32 clkdiv =3D 0, clksel =3D 0, cnt_period, cnt_duty,
> +	    reg_width =3D PWMDWIDTH, reg_thres =3D PWMTHRES;
>  	u64 resolution;
>  	int ret;
>  =

> @@ -133,12 +136,30 @@ static int pwm_mediatek_config(struct pwm_chip *chi=
p, struct pwm_device *pwm,
>  =

>  	/* Using resolution in picosecond gets accuracy higher */
>  	resolution =3D (u64)NSEC_PER_SEC * 1000;
> +	/* Calculate resolution based on current clock frequency */
>  	do_div(resolution, clk_get_rate(pc->clk_pwms[pwm->hwpwm]));
> -
> +	/* Using resolution to calculate cnt_period which represents
> +	 * the effective range of the PWM period counter
> +	 */
>  	cnt_period =3D DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000, resolution);

The existing code is rather bad. A better approach to calulate
cnt_period (with a single division and higher accuracy):

	cnt_period =3D DIV_ROUND_CLOSEST_ULL((u64)period_ns * clk_get_rate(..), NS=
EC_PER_SEC);


>  	while (cnt_period > 8191) {
> +		/* Using clkdiv to reduce clock frequency and calculate
> +		 * new resolution based on new clock speed
> +		 */
>  		resolution *=3D 2;
>  		clkdiv++;
> +		if (clkdiv > PWM_CLK_DIV_MAX && !clksel) {
> +			/* Using clksel to divide the pwm source clock by
> +			 * an additional 1625, and recalculate new clkdiv
> +			 * and resolution
> +			 */
> +			clksel =3D 1;
> +			clkdiv =3D 0;
> +			resolution =3D (u64)NSEC_PER_SEC * 1000 * 1625;
> +			do_div(resolution,
> +				clk_get_rate(pc->clk_pwms[pwm->hwpwm]));
> +		}
> +		/* Calculate cnt_period based on resolution */
>  		cnt_period =3D DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000,
>  						   resolution);
>  	}
> @@ -158,8 +179,13 @@ static int pwm_mediatek_config(struct pwm_chip *chip=
, struct pwm_device *pwm,
>  		reg_thres =3D PWM45THRES_FIXUP;
>  	}
>  =

> +	/* Calculate cnt_duty based on resolution */
>  	cnt_duty =3D DIV_ROUND_CLOSEST_ULL((u64)duty_ns * 1000, resolution);

Using resolution as divisor is bad here, too, so the way to calculate
cnt_duty should be changed accordingly.

I think if the driver is simplified first, maybe even getting rid of the
while loop, your change will get considerably easier, too.

> -	pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | clkdiv);
> +	if (clksel)
> +		pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | BIT(3) |
> +				    clkdiv);
> +	else
> +		pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | clkdiv);
>  	pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period);
>  	pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty);

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
