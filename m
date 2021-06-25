Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991F5C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 17:52:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59AC561921
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 17:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59AC561921
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsT1wrdvO+sPoeKM7XCr8eDnm57Xv2u6QjujBJzYfRY=; b=bDxtMar6loLz79IWVHCoKSVacz
	W0y6QUKDfVsctN+dp+SDCQVBMTugatgya8Apac+KBG+MtpMFc2L9AOP/1VKnEVS3HURSC11M61ILp
	hqfp+a4OGeLm0N0akzCDzOMsqcC6Crd8cuiK17Ezqyn46R0Smd0Vbbdlen4SdEbIQ6JAl34JMTqPI
	iaURZxH+aP1pDsarGJ1bevLatWY10Ob6caplF89x4O21+xyiCUJtf6r/vPuUOBzoxdNkHjA2dtxW6
	EFDxejK5hR8jt0EwOnkpggrMf5sxKUzxL3HWnYd2JnIYX1qWTVUStt5AclkHlswEFH/17t+fOYneM
	PnhNQnug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwq0K-002XIu-E5; Fri, 25 Jun 2021 17:52:36 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwq07-002XFl-1P
 for linux-mediatek@lists.infradead.org; Fri, 25 Jun 2021 17:52:24 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lwq05-0006El-0N; Fri, 25 Jun 2021 19:52:21 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lwq03-0006cY-Ow; Fri, 25 Jun 2021 19:52:19 +0200
Date: Fri, 25 Jun 2021 19:52:19 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, cawa.cheng@mediatek.com,
 bibby.hsieh@mediatek.com, ck.hu@mediatek.com, stonea168@163.com,
 huijuan.xie@mediatek.com
Subject: Re: [PATCH v5 2/3] pwm: mtk_disp: implement atomic API .apply()
Message-ID: <20210625175219.ppeq4yloi76ud4jj@pengutronix.de>
References: <20210616085224.157318-1-jitao.shi@mediatek.com>
 <20210616085224.157318-3-jitao.shi@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20210616085224.157318-3-jitao.shi@mediatek.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_105223_111110_8286E710 
X-CRM114-Status: GOOD (  21.91  )
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
Content-Type: multipart/mixed; boundary="===============8903182069968659804=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8903182069968659804==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="agipn6zma3xjneoo"
Content-Disposition: inline


--agipn6zma3xjneoo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 16, 2021 at 04:52:23PM +0800, Jitao Shi wrote:
> Switch the driver to support the .apply() method.
>=20
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/pwm/pwm-mtk-disp.c | 69 ++++++++++----------------------------
>  1 file changed, 17 insertions(+), 52 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
> index 204d76beeb26..a4766e931b68 100644
> --- a/drivers/pwm/pwm-mtk-disp.c
> +++ b/drivers/pwm/pwm-mtk-disp.c
> @@ -67,14 +67,25 @@ static void mtk_disp_pwm_update_bits(struct mtk_disp_=
pwm *mdp, u32 offset,
>  	writel(value, address);
>  }
> =20
> -static int mtk_disp_pwm_config(struct pwm_chip *chip, struct pwm_device =
*pwm,
> -			       int duty_ns, int period_ns)
> +static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *=
pwm,
> +			      const struct pwm_state *state)
>  {
>  	struct mtk_disp_pwm *mdp =3D to_mtk_disp_pwm(chip);
>  	u32 clk_div, period, high_width, value;
>  	u64 div, rate;
>  	int err;
> =20

Here something like:

	if (state->polarity !=3D PWM_POLARITY_NORMAL)
		return -EINVAL;

is missing.

> +	if (!state->enabled) {
> +		mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
> +					 0x0);
> +		if (mdp->enabled) {
> +			clk_disable_unprepare(mdp->clk_mm);
> +			clk_disable_unprepare(mdp->clk_main);
> +		}
> +		mdp->enabled =3D false;
> +		return 0;
> +	}
> +
>  	if (!mdp->enabled) {
>  		err =3D clk_prepare_enable(mdp->clk_main);
>  		if (err < 0) {
> @@ -102,7 +113,7 @@ static int mtk_disp_pwm_config(struct pwm_chip *chip,=
 struct pwm_device *pwm,
>  	 * high_width =3D (PWM_CLK_RATE * duty_ns) / (10^9 * (clk_div + 1))
>  	 */
>  	rate =3D clk_get_rate(mdp->clk_main);
> -	clk_div =3D div_u64(rate * period_ns, NSEC_PER_SEC) >>
> +	clk_div =3D div_u64(rate * state->period, NSEC_PER_SEC) >>

This multiplication might overflow. But maybe it's sensible to address
this in a separate commit to keep things simple.

>  			  PWM_PERIOD_BIT_WIDTH;
>  	if (clk_div > PWM_CLKDIV_MAX) {
>  		if (!mdp->enabled) {
> @@ -112,11 +123,11 @@ static int mtk_disp_pwm_config(struct pwm_chip *chi=
p, struct pwm_device *pwm,
>  		return -EINVAL;
>  	}
>  	div =3D NSEC_PER_SEC * (clk_div + 1);
> -	period =3D div64_u64(rate * period_ns, div);
> +	period =3D div64_u64(rate * state->period, div);

ditto.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--agipn6zma3xjneoo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmDWF9AACgkQwfwUeK3K
7AkLdgf+It9rCnCg7lTfWTAMvXBrn6TdovPnzwlboNULBtNOkiBWAPZ/0K1as1nY
hAesg/ARX8rRR9okaFU8Pv9BQ6rQ7idmLE8x4NE5oLrkAuCfg+4Azpol3t3DA7q/
rOdSMIUsyIeZjI4TlJcA70lmTwf97hFeQtj23XzZ9S4U966uCdyp+9b+g8QD+B/4
GYqbJWcbWHr0+Wwra9tYluuvYB3XwXDFN6fCWgEm1rcqZ3SwDlJiKQoWaYUdWnhA
XXGUJ662Q/B5BzTSo6lj1vRYLYWRFL4KcelxiVWVnXLDesEXdCKnx4XUe8cuZuEn
PIrbO9/7N863rcPZn+qYpl8+QDlcXg==
=JXek
-----END PGP SIGNATURE-----

--agipn6zma3xjneoo--


--===============8903182069968659804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8903182069968659804==--

