Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8719DC77B7D
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 14:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KiQeWa9CRMZll6Ha+RHXC8tHM+2w1slDUMOaw+XfX4=; b=YHuEfHQIee+Fb3TuhAlelKkj9F
	1oJGfXyIYF3LIjNGRPxfCIKjJfSRcVIE/Rv+Wyf+xnW7+PpFsvZUk6RbnikDEjdVJZaNXk8/vBjDr
	6gyXcsvRcnMQvbjcoZPKTTGxaVJR1Qbc5zrcIVwsejt0RogWV8dttSdNOk7l1pSaRy4gAFEBHBxXB
	OsFuvhSPKaZ5PTxIkFo9Lpzx4CL4uMQuHy42UCTw2Khe2DQFsyAznOIZY1zdYhpeWroDgh69tgoTA
	EkA+E+ZUDqkRoYdKqzlNGF+hytOwJS6JARZzTB2m2K/4rPugyolmY6pB/4G/RU0aju0wah5XN6amQ
	4ybdgxgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyYoh-002LfD-2D;
	Mon, 15 May 2023 14:04:47 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyYoe-002LeJ-1S
	for linux-mediatek@lists.infradead.org;
	Mon, 15 May 2023 14:04:45 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pyYnm-0004LX-BA; Mon, 15 May 2023 16:03:50 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pyYnj-000Ne8-Ma; Mon, 15 May 2023 16:03:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pyYni-004iKq-Tk; Mon, 15 May 2023 16:03:46 +0200
Date: Mon, 15 May 2023 16:03:46 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shuijing Li <shuijing.li@mediatek.com>
Cc: thierry.reding@gmail.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	jitao.shi@mediatek.com
Subject: Re: [PATCH] pwm: mtk_disp: Fix the disable flow of disp_pwm
Message-ID: <20230515140346.bxeu6xewi6a446nd@pengutronix.de>
References: <20230515061845.10241-1-shuijing.li@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xy34fhkdf5yx4n7e"
Content-Disposition: inline
In-Reply-To: <20230515061845.10241-1-shuijing.li@mediatek.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_070444_515946_8A7C9D52 
X-CRM114-Status: GOOD (  22.22  )
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


--xy34fhkdf5yx4n7e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 02:18:45PM +0800, Shuijing Li wrote:
> There is a flow error in the original mtk_disp_pwm_apply() function.
> If this function is called when the clock is disabled, there will be a
> chance to operate the disp_pwm register, resulting in disp_pwm exception.
> Fix this accordingly.
>=20
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> ---
>  drivers/pwm/pwm-mtk-disp.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
> index 79e321e96f56..cb699fa9a5ae 100644
> --- a/drivers/pwm/pwm-mtk-disp.c
> +++ b/drivers/pwm/pwm-mtk-disp.c
> @@ -80,10 +80,9 @@ static int mtk_disp_pwm_apply(struct pwm_chip *chip, s=
truct pwm_device *pwm,
>  		return -EINVAL;
> =20
>  	if (!state->enabled) {
> -		mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
> -					 0x0);
> -
>  		if (mdp->enabled) {
> +			mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN,
> +						 mdp->data->enable_mask, 0x0);
>  			clk_disable_unprepare(mdp->clk_mm);
>  			clk_disable_unprepare(mdp->clk_main);

Instead of

	if (A) {
		if (B) {
			something();
		}
	}

you can make this

	if (A && B) {
		something();
	}

Otherwise looks ok.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--xy34fhkdf5yx4n7e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRiO8IACgkQj4D7WH0S
/k4QEAf+JHyksmF99O3MatxvWpRlUB1TuPVQTawSXYmRI+LWvxVsetJ2CF7tEnBF
diKT9cqjr4C9V1pV79GYZxRoRHlGA0AsgWnWusKtSX+4Dk4LWB4vfOSnTnQdHMjr
prAECcJ9nl4om3uzCTpq/yY4j+bZDw71NguLu6qomx7SLIROjCr7dKgC6mJaY8JF
oU7Bdj4LXRLFujZ9hJh1Rt4Sefmsvl59Mo30b938tom9Q1gpONm00k+ou/IY4nfc
fGus4rqaHyuoYE2dyWNdTW2saURDF82BArYXSGonBdDAVZpOpF8VfJRC/NHtiF55
MWFAgU85n/UCoRYhwpUaVnEDb8Q5JA==
=MHoD
-----END PGP SIGNATURE-----

--xy34fhkdf5yx4n7e--

