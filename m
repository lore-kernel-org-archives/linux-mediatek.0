Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D8FC67861
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 07:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGFDg2MTBH1lWhyP2c5sjz1mFhzd3Awu/cYfQ1pozd8=; b=lxWYoWWW9uvGqaFl1vBQjXx3zP
	gUm6+nfGz2vTzz1H/PrtDOnkSZyHGXmpGD3TQgq1MxnaYypv7F9IOH1sdISKUDmk4e6QD3VQ0XOz3
	ptb5ClKRW50BJqqK+/yVrco8HrQ7zJ3uXkNjrSYWDWdgVzDFicZ4+TQpED12cKWH1DaRd7BD+yARy
	mh7Abr0UqzeH3UltwVYzRLBa3ts0KYpdSTkAecA1znyrZoSVMAH1L8nAfsU0lWREB1GqRRyfC10jh
	gu3kO+f6Zm76V1gOxuNjR1xOqRnwSDdUHinTKd/DqV64OqAReChKXSS45682E64lRttVw2jnlrwP0
	oLu/aIRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtjs5-0000000Emvp-2aoh;
	Mon, 08 Apr 2024 07:56:53 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtjry-0000000Emrd-0e34
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Apr 2024 07:56:48 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rtjre-00084h-Af; Mon, 08 Apr 2024 09:56:26 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rtjrc-00B4MM-ED; Mon, 08 Apr 2024 09:56:24 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rtjrc-00G4LH-15;
	Mon, 08 Apr 2024 09:56:24 +0200
Date: Mon, 8 Apr 2024 09:56:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, jitao.shi@mediatek.com, 
	thierry.reding@gmail.com, miles.chen@mediatek.com, xinlei.lee@mediatek.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, wenst@chromium.org, 
	kernel@collabora.com
Subject: Re: [PATCH] dt-bindings: pwm: mediatek,pwm-disp: Document
 power-domains property
Message-ID: <govw33edknpv5oif4txex7b47nfqbpmc7qlytqqx6oetpm34db@vilvv2s4zzsy>
References: <20240404081808.92199-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ge6rl4smjg7jdvlz"
Content-Disposition: inline
In-Reply-To: <20240404081808.92199-1-angelogioacchino.delregno@collabora.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_005646_904780_790D1BDA 
X-CRM114-Status: GOOD (  11.92  )
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


--ge6rl4smjg7jdvlz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Apr 04, 2024 at 10:18:08AM +0200, AngeloGioacchino Del Regno wrote:
> Allow the power-domains property to the PWM_DISP block as on some SoCs
> this does need at most one power domain.
>=20
> Fixes: b09b179bac0a ("dt-bindings: pwm: Convert pwm-mtk-disp.txt to media=
tek,pwm-disp.yaml format")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E

While that is a fix I wouldn't consider this urgent enough to send it to
Linus before v6.9. However if another urgent fix comes in, I'll send it
along.

Best regards and thanks,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ge6rl4smjg7jdvlz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYToycACgkQj4D7WH0S
/k5ohwf5ASXu/S93rwTQinzP8fl/R7X0RAysJa4ItkB52IZclVPQ/keaeXAs7cWO
Tx8HlVM0euKtmVIobPXh7ZoyPqe/vhqedQYbMYCSrikuWsVCyErmhnW2Kn+89bKo
YIESDSv0O6EJEVWdcapR4sOzEblnIZJyqB3TYqrT7+eK3nHMHI7E+r318pKLeFoJ
5K/UWMZkTFYIqAJXk4fKG4j3ieuH+cDPCAMhOQRtqxQ6paMXpJgt71aJD4Y+Z4sw
BGHNPKiZTWDeaK7LH1LXFimMwAiZmMDMsf6CGQ6vY/pI6jKzqyUg1R96WTV07nf1
HMKKif/gTgd+D02BlOlrwbj9hUANmw==
=iE3d
-----END PGP SIGNATURE-----

--ge6rl4smjg7jdvlz--

