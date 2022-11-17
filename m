Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12181C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 11:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTFcGjN/LikVrD5j/7dvH6yY08jJVyoq70+yprHDGKU=; b=Cb5ELSZM8xZLTvaPacwk8y5DEa
	1ztIM7bdGd8i+htZaCC5XRn4t721HmNr7L4D9hCqKtWQtZHXjkTjwr5SMWrBL9uXlI3EpOaOmOW+H
	eJN/owpBzOma5z5CcAMD2l/QxxMpp3u8krsNruisZEe+ogEEQ1o8b8mZIKkeCSJFpGzsYudhb2l31
	/biM1jJEc6pqxWSkqAn4Ho0IsAXQvEHP+4PTjwwSroHCzivKEH2uPNyi3VNEu8ElZnNtN0YtgKSrq
	ff2BHQhJG2rBgCWC3XozOWfJK71TQPPS6qYWhPnA9n6Jq7h+cqWB/JMls9+NkOYa0mIQWCMcsx9Xu
	rnVUGPSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovdWm-00DYKP-Ns; Thu, 17 Nov 2022 11:57:56 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovdWV-00DXr2-5C
	for linux-mediatek@lists.infradead.org; Thu, 17 Nov 2022 11:57:40 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ovdWP-0007Uu-Oq; Thu, 17 Nov 2022 12:57:33 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ovdWN-004qBu-A0; Thu, 17 Nov 2022 12:57:32 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ovdWN-00HGdU-63; Thu, 17 Nov 2022 12:57:31 +0100
Date: Thu, 17 Nov 2022 12:57:31 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Daniel Golle <daniel@makrotopia.org>, linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Fabien Parent <fparent@baylibre.com>,
	Zhi Mao <zhi.mao@mediatek.com>, Sam Shih <sam.shih@mediatek.com>
Subject: Re: [PATCH] pwm: mediatek: always use bus clock for PWM on MT7622
Message-ID: <20221117115731.ryourz6nclatx4dw@pengutronix.de>
References: <Y1iF2slvSblf6bYK@makrotopia.org>
 <eb47aba9-e5d9-9f27-06ae-cf386b291b05@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="isvrtb75uwxrlbmv"
Content-Disposition: inline
In-Reply-To: <eb47aba9-e5d9-9f27-06ae-cf386b291b05@collabora.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_035739_209797_8054E888 
X-CRM114-Status: GOOD (  17.38  )
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


--isvrtb75uwxrlbmv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2022 at 10:39:31AM +0200, AngeloGioacchino Del Regno wrote:
> Il 26/10/22 02:56, Daniel Golle ha scritto:
> > According to MT7622 Reference Manual for Development Board v1.0 the PWM
> > unit found in the MT7622 SoC also comes with the PWM_CK_26M_SEL register
> > at offset 0x210 just like other modern MediaTek ARM64 SoCs.
> > And also MT7622 sets that register to 0x00000001 on reset which is
> > described as 'Select 26M fix CLK as BCLK' in the datasheet.
> > Hence set has_ck_26m_sel to true also for MT7622 which results in the
> > driver writing 0 to the PWM_CK_26M_SEL register which is described as
> > 'Select bus CLK as BCLK'.
> >=20
> > Fixes: 0c0ead76235db0 ("pwm: mediatek: Always use bus clock")
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--isvrtb75uwxrlbmv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmN2IagACgkQwfwUeK3K
7AkUEQgAkSTP01iZik0R1H9BlFL8PfBxuv4XRkY+HdOduJzVWMXaU21tFylYCFyU
vfuYv9V3+6Kz22JhpYi91wDxDLxWB+2f4NiSYyu/6s3HG41MX2h1rC93YIqprUKK
EheP4j6fd6w6sbyQHpEivOeX4rSKtub5FWmcRqxc+EY+GjV5eAXH48v+ree+sf4I
uX7PgS2LVDjjYVMc6Cszv7rUb6c5mE1Yulx0tc5wp5vZOVD+JTJIB8NNDPKdAvaF
6vNGTeXd86BnWCW+lPy905SPSTNTjdECc4o2Efctjuwrup630RUBuxY+sqoDmDTg
gviXeg2hK01EmcXzHJEvd/sHfhUZrA==
=VoOy
-----END PGP SIGNATURE-----

--isvrtb75uwxrlbmv--

