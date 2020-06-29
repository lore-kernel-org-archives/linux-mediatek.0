Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B91C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 20:04:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7280320702
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 20:04:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n1VFgUwI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vjnS3xyY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7280320702
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H4x4g0Ey2lZRpkW9yO1IaabGlFuW4L1LO0X/NviH8wQ=; b=n1VFgUwIolk8legtTakj7AGoC
	pMyAHU4Q3K9wPYo49uOqJUPuhn9tqxgSoK4QsPSEsgxlT75cu7ofOFWZQ1MrJlXgbq6/YzjLqIZM/
	0DMpWO2esorn4Ta33dGEdus/e31E30MB5wkG4Tofz2T+ARSXeg2CX30bkSOja3OhzSvo63WfyanXg
	tmHJT80IKVW7qdwEpIGA+Og7EPpqpNhk2KKIe7YH/JAH9uEm1u0XUx24mFZq64aJqZd4JBLGgR1br
	KXPh7CK3NH4h8OVNNnstmDi31GIqpv/gxRShL3/4qInGa5AbotyORvqS69YBNg5niOf3hzrdes5WK
	QFeCYS36w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq00S-00029U-JU; Mon, 29 Jun 2020 20:03:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq00Q-0001uW-H7
 for linux-mediatek@merlin.infradead.org; Mon, 29 Jun 2020 20:03:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=q2J1/YiDODFfLzYaws6hKT7zdOHKeOjgGaBh1zmC+U4=; b=vjnS3xyYk3V8r3KLiXxeT3ZVMN
 u+KhuNWV1dOl75ZeNHVkzZwGHZ2LO8DPB9CBEszsG0mQbVXh9zk+4WWMSpV6phvfOXq2vM6ZmP6Cb
 eDpPTZ+7ff+kRuw0Frkn5pHoV2HzmfBRjzI2EphirniLb9eqvTkZQm0n+W3l7mmR2IV2T/CBi3Qvl
 JCG1x084RtoTRpcX1fwZlsdPYk4aOuLvF/kW/9C9ljlPTUdaeAczStCGZJf+LB6uwyCFVRIf0Cwmt
 cE2rMMCwd4/moPV9TTGQkbbrm6VRtoOSDVNr77mBy47T4iVKAbutgj0XDvD4ApvNVKKkUsRtdUs6A
 AogM8B4g==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpzkQ-0005IA-71
 for linux-mediatek@lists.infradead.org; Mon, 29 Jun 2020 19:47:24 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1jpzkK-0008PU-2x; Mon, 29 Jun 2020 21:47:16 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1jpzkJ-0005Sp-1p; Mon, 29 Jun 2020 21:47:15 +0200
Date: Mon, 29 Jun 2020 21:47:14 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/4] pwm: mediatek: Provide missing kerneldoc description
 for 'soc' arg
Message-ID: <20200629194714.ghbxzwoi3mtahqvz@pengutronix.de>
References: <20200629124752.1018358-1-lee.jones@linaro.org>
 <20200629124752.1018358-4-lee.jones@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200629124752.1018358-4-lee.jones@linaro.org>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200629_204722_519428_1FAA10EA 
X-CRM114-Status: GOOD (  19.33  )
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
 thierry.reding@gmail.com, linux-mediatek@lists.infradead.org,
 Zhi Mao <zhi.mao@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, John Crispin <blogic@openwrt.org>
Content-Type: multipart/mixed; boundary="===============4412114603989968344=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4412114603989968344==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7c7d6dluu6fljbvj"
Content-Disposition: inline


--7c7d6dluu6fljbvj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Lee,

On Mon, Jun 29, 2020 at 01:47:51PM +0100, Lee Jones wrote:
> Kerneldoc syntax is used, but not complete.
>=20
> Descriptions are required for all arguments.
>=20
> Fixes the following W=3D1 build warning:
>=20
>  drivers/pwm/pwm-mediatek.c:57: warning: Function parameter or member 'so=
c' not described in 'pwm_mediatek_chip'
>=20
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: John Crispin <blogic@openwrt.org>
> Cc: Zhi Mao <zhi.mao@mediatek.com>
> Cc: linux-pwm@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/pwm/pwm-mediatek.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
> index b94e0d09c300f..ab001ce55178e 100644
> --- a/drivers/pwm/pwm-mediatek.c
> +++ b/drivers/pwm/pwm-mediatek.c
> @@ -46,6 +46,7 @@ struct pwm_mediatek_of_data {
>   * @clk_main: the clock used by PWM core
>   * @clk_pwms: the clock used by each PWM channel
>   * @clk_freq: the fix clock frequency of legacy MIPS SoC
> + * @soc: pointer to chip's platform data
>   */
>  struct pwm_mediatek_chip {
>  	struct pwm_chip chip;

LGTM:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7c7d6dluu6fljbvj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl76RUAACgkQwfwUeK3K
7An+ngf+Jlga9AaJKTihcMBmxrJi1R1xaaZaF6OJdVgbcu6obgMcHv4WGJ0GPLcL
287z0rdXVRztAM0GZfSZwCY3E/+OIw9kn9OoUsj9qovBhDw1aUp2xNvHtZ9pZ+r2
BJJbdZgr8fshM6pEDGw/pWaDI427REXKOAyR1Fwwq6uYPCLpn4vIrwu0m/cIlv83
EDqGaa94CeJkzospKoh0ClsFcDnWKtM4psI2FHaum8knktvMyKpx8PzYIPTkzg4W
1UW7qItd+KkU8yDrURYnlOvdHb6PeeL9NaEBuw7+CTAK27ap3wiafzyUJlHSHbkA
WQD60Tq7dOh3eI7Er8VGNxImjFs/BQ==
=BMmT
-----END PGP SIGNATURE-----

--7c7d6dluu6fljbvj--


--===============4412114603989968344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4412114603989968344==--

