Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693C1C6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 09:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndXEHm6RuJkUPiVWgMkyhedP37xGL3caBYSF6Dk9DZg=; b=v8sKgURLC7/0cRYqgJ1cbViBww
	o/4RGn5EA0x/N/qbRrA/+P6XrdBgGykrtLqJOtIoiQz/LG0XPX63u/LDJuF7sXBrV3n7t0A7q8t3t
	Uxd+kvwaknL4jU8A7TAWqNlLHUyHhW8AutaMN4f7/pMjj1Xj0WD7cksJbGXYXOTEPEhB7jVPaU0Dw
	2f6ohkkuHLv7zD7v/ZY3F+MCsZth6pVZZ4rKiJHjrEbGyq/grtQLJLei8gqOSzacI8gSzV2MYjQQx
	MRslQhs+M9lahsu9YrisiNSeSog5Te5gZw+LRzh1oX7hZJv3l4Af8NfwxDROsdT4EuTNLJdwgb6YL
	fNYujKoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbelB-00527O-OQ; Mon, 13 Mar 2023 09:46:29 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbel3-00524z-7g
	for linux-mediatek@lists.infradead.org; Mon, 13 Mar 2023 09:46:23 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pbekf-0001xo-DD; Mon, 13 Mar 2023 10:45:57 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pbeke-003okY-2i; Mon, 13 Mar 2023 10:45:56 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pbekd-004Utn-Ao; Mon, 13 Mar 2023 10:45:55 +0100
Date: Mon, 13 Mar 2023 10:45:55 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 01/30] clk: mediatek: Make mtk_clk_simple_remove() return
 void
Message-ID: <20230313094555.5w36kjkybiukan5j@pengutronix.de>
References: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de>
 <20230312161512.2715500-2-u.kleine-koenig@pengutronix.de>
 <d0a2eb84-4420-8b6c-bd97-e58aa47be289@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nats3dcih3a6v62j"
Content-Disposition: inline
In-Reply-To: <d0a2eb84-4420-8b6c-bd97-e58aa47be289@collabora.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_024621_282380_29420FCA 
X-CRM114-Status: GOOD (  14.49  )
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


--nats3dcih3a6v62j
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Angelo,

On Mon, Mar 13, 2023 at 09:54:07AM +0100, AngeloGioacchino Del Regno wrote:
> Il 12/03/23 17:14, Uwe Kleine-K=F6nig ha scritto:
> > mtk_clk_simple_remove() returned zero unconditionally. Make it return no
> > value instead and convert the respective drivers to .remove_new.
> >=20
> > This makes the semantics in the callers of mtk_clk_simple_remove() clea=
rer
> > and prepares for the quest to make platform driver's remove function re=
turn
> > void.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Hello Uwe,
>=20
> since there's a big cleanup series that is well reviewed and that is touc=
hing
> practically all MediaTek clock drivers, can you please rebase this commit=
 over
> [1]?

I'll wait a bit until this series is in and then rebase and resend.
Thanks for letting me know.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--nats3dcih3a6v62j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQO8NAACgkQwfwUeK3K
7AlSiAf/USrTyLSCOBQ/pxTpNaDcBd1ckdBpfIm3VyM/+KK5lPesPql8tHCB5xbo
zwj78lmc3iBA2w5KuR8Hg3oxPVvXCysR/XmSBMizRzotJyts7D3zl/0geMWok5w8
uGeXfeWjsEvuWWEbYP87D6c2H3A+gT2xMC3Rj822nrOFbedND9UwK4FZAtMBrqm+
tYPONXJcv2lxQ8pcgpRRdZ6jfsT508k4EZ4o1lZPywn+72KwcrRX3shcCyd4k586
EnRNPqoDKmJZ44a/Bq86qh/BoTsqlqpv5DV1lKwIjHceR551lBS2hnIbT1O5FV6w
AE+mTyE2NCdTZpOO38xyNT6tKqouVA==
=fX9n
-----END PGP SIGNATURE-----

--nats3dcih3a6v62j--

