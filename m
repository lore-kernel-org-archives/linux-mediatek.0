Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85813C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jan 2022 17:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzvoIZyX35rTC8WB73s90cYAZiGpld7W9UFrcu0KzZ8=; b=cE7YVq9gWxLRdAmcF4uT5R4VYd
	Sl5nT0SEYJQMYMqNqCqnZGE8NsKZTVopMSO5UafUCQc+yv4u8C16lGGroVgkhs77WS+E9/AMSvOel
	whCWVsnXtBwz9dAoGfVewLaXGYgaq9LadGPywWUnP7mAVXQVFAC5xfDbpwtAiKkVAbc8oLDkEE7YB
	hb57/rKX2OzXSbjOApCzGv9WnHiTBcDtGdF/Jriw/5b8AUfFc0pZuxWWAqnJUhs08TL8o790fqnSQ
	gTsciObzU0FX0FWPHvt7NYJYvMeuPPAVYb9DeipYU1IrIlSz8Bwsth6A+OAtCgE+483+3j7RTX4QE
	zcairiMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4RJc-009k1S-1z; Mon, 03 Jan 2022 17:40:12 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4RJ6-009js5-5t; Mon, 03 Jan 2022 17:39:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id DB79B1F42227
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641231576;
 bh=9l1MBhj87w2oaRpGKQi8FSzTUXDs8AF6OfoemMGXZdQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OdsEPLQaOg45KDfNYyUnd6+5KuBv5StpMedj71QXzFjpLn955GNf5/hrFGmx5jXDM
 h1Dwa0w08dxdqKd4GAzY0V+j7d4PfG5pKyz+dKSUyl2Un1xwj4aoH7o7Lrvxt1e8Z4
 i7Da4PK23/TRZOlzwCGX+U8Y3ivPX9MteR70Dqz42sIXwnW8jHr7oF/g9JbZGsqeJu
 iPgFugQjNgi5qccrKEhJ0acE/3QOu8ZF/LlBGoetG+wkVGjXQBRK4EMS14YKOZP0WZ
 LBRycLLQ2It3YParZ4Y3WyoJIREK6MPhXm5WcncA8Dkpr5w+wkJVxtSh44zaG4ONUl
 /E8iCHWHqAPcQ==
Received: by earth.universe (Postfix, from userid 1000)
 id 7A7363C0CB7; Mon,  3 Jan 2022 18:39:34 +0100 (CET)
Date: Mon, 3 Jan 2022 18:39:34 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: sean.wang@mediatek.com, matthias.bgg@gmail.com,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: mt6397: Check for null res pointer
Message-ID: <20220103173934.qupnu5gne2v2tpig@earth.universe>
References: <20211220083811.907261-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20211220083811.907261-1-jiasheng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_093940_438328_97E9998B 
X-CRM114-Status: GOOD (  18.22  )
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
Content-Type: multipart/mixed; boundary="===============1930506231696548723=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1930506231696548723==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ibsvhphyobg6wdwd"
Content-Disposition: inline


--ibsvhphyobg6wdwd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 20, 2021 at 04:38:11PM +0800, Jiasheng Jiang wrote:
> The return value of platform_get_resource() needs to be checked.
> To avoid use of error pointer in case that there is no suitable
> resource.
>=20
> Fixes: d28c74c10751 ("power: reset: add driver for mt6323 poweroff")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---

Thanks, I fixed the subject and queued the patch.

-- Sebastian

>  drivers/power/reset/mt6323-poweroff.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/power/reset/mt6323-poweroff.c b/drivers/power/reset/=
mt6323-poweroff.c
> index 0532803e6cbc..d90e76fcb938 100644
> --- a/drivers/power/reset/mt6323-poweroff.c
> +++ b/drivers/power/reset/mt6323-poweroff.c
> @@ -57,6 +57,9 @@ static int mt6323_pwrc_probe(struct platform_device *pd=
ev)
>  		return -ENOMEM;
> =20
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -EINVAL;
> +
>  	pwrc->base =3D res->start;
>  	pwrc->regmap =3D mt6397_chip->regmap;
>  	pwrc->dev =3D &pdev->dev;
> --=20
> 2.25.1
>=20

--ibsvhphyobg6wdwd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmHTNM8ACgkQ2O7X88g7
+pqX7Q//a7FhbfUdQUBPoNx8GliifDl9XPDkJE3hN4sm0flN5mrgDJ0to9G5CHIg
NiV0VHUIug7TKyXT1aJOMZkW0JFDQ0FK7PuBB/oWDl8VG1cFYtKJ2o/q//xyP6Bj
c83UUCQa2B2jwfVq+zlPmPbVMjXl796q74JL7tfcQQSzM8+CKCdxP/cCGYJctwfK
NhwPPnM0m9ho5VKobOkeHRvGkjAHSgI3EOcAWwOKcCvMaBqJzlhqbwuMf6nEARwt
Jr8L7+5EbPRCCzJPPshNB96AT15UayZHkkhCF8v/xWY+2T+EjjOh2Cdaz2uNc3jY
N8umF2drhl0lPHZotF3/cSJcHivedvl9a8XdFAVkwmWiOCzjDqxErpgJPayFpsHV
3saj0u4wEkFUssfnZqLvXnme9IHiBaH7+Jc5Ejbg85z8J4ejME6M1xllCe/718/n
Cv50/1j9FfFZKVl1G8cEzYu9GNddlMZejZaZVgHRYjrKuWE/j9dvpPQpVbOvZ3H+
e+d9Tz7P3iOGWzo7wrQuSp7f9H9HkM1D1T4lf502BJMcft9v6n5JYzcYcZsOmtzo
tx65r1KHiosLF/bj2W7SX4xU1Z1yjEmCPSlxFj3SlCEWwogc2qcOC3Fc4g/RDXWl
5iPY2cwVbwBBr6q32CdCoS4Rd7KLVH+9bgl0Cfoi5porimkZdlA=
=12QQ
-----END PGP SIGNATURE-----

--ibsvhphyobg6wdwd--


--===============1930506231696548723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1930506231696548723==--

