Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC15C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 21:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flAbjS0MKNYDwwcM/rh77BOEVw+HY21Droe5wSfm77s=; b=TKYsqG2oQqU4pUlaAy2v3ea1Ct
	K8G2hME8LsoaoM3748JNTWrH/EovfRsvquG9Kf1AuYi6Iu1BBw0P/E/X43aUTL9IWjTsSiZyOLorf
	hPcVzKZj/WEvrMcuorqd9X1yf7/6dW1OdVySamDylMI0nLjE+KuxCbaecSztCnsASq4aWEOierVzT
	i20J/F1JJ7L7k0ViMQGHyZtVwnaxxV6D/57xgAKMZZ9za6Dq1nJA/8TJa4lEaF7o9np8swFGOLZA8
	5pjeaVc1JRUqGy+6IUTLQaCQjoZzeoXMcm6bovg2wULGFtqrAkAAqLCRHwwl5QHMz9D0kbNW2lF0m
	jxhtyxzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPAJ6-000fw3-Uy; Tue, 01 Mar 2022 21:45:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPAIt-000fsR-Rv; Tue, 01 Mar 2022 21:45:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 49E25B81B0F;
 Tue,  1 Mar 2022 21:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7968DC340EE;
 Tue,  1 Mar 2022 21:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646171105;
 bh=3uwjHBi4Kpijzi8jIbSYaOoMSYmXzyJTEeVMSIbESIA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=koZS6u1JYkyQ/AsymFmTevOBEDEPaaFBGL6bIbEiw+654IcjZt5RiF8dHOJISRbT/
 JFeksndmw6/gr35h37+vXWL3eYm92pB4aIsercuDesP+jF+/RmkXOJHDAyXHkg4yMK
 UfnXJzS7je8f7jq1gI/FLooe0RYJjB29hB/b8J9fcwPZZHFuuJ9IjYmeSJsxR8/GfB
 kEGrJF2ElSyM3+7jZGYMOqG77Dk5BwPnvW7l1KPdsBKbLJeEjGJAfKbUQNp1d8GNWh
 biDlTh2kCDPfqMrxpWQ6nucjhgujHZpMRDGdhVjOuPyIHv1GvAt8iV6lmYyzc7EFzu
 ubgflTWfhuiMQ==
Date: Tue, 1 Mar 2022 22:45:01 +0100
From: Wolfram Sang <wsa@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: qii.wang@mediatek.com, matthias.bgg@gmail.com,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH] i2c: busses: i2c-mt65xx: Simplify with clk-bulk
Message-ID: <Yh6T3RSfvcXCi4sb@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 qii.wang@mediatek.com, matthias.bgg@gmail.com,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20220118133358.111886-1-angelogioacchino.delregno@collabora.com>
 <8725a111-0ee2-8935-86b5-01c61774a628@collabora.com>
MIME-Version: 1.0
In-Reply-To: <8725a111-0ee2-8935-86b5-01c61774a628@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_134508_256350_B0B06E7C 
X-CRM114-Status: GOOD (  18.72  )
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
Content-Type: multipart/mixed; boundary="===============1867162086971304327=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1867162086971304327==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RuPdci4FI09i3u+P"
Content-Disposition: inline


--RuPdci4FI09i3u+P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2022 at 12:26:30PM +0100, AngeloGioacchino Del Regno wrote:
> Il 18/01/22 14:33, AngeloGioacchino Del Regno ha scritto:
> > Since depending on the SoC or specific bus functionality some clocks
> > may be optional, we cannot get the benefit of using devm_clk_bulk_get()
> > but, by migrating to clk-bulk, we are able to remove the custom functio=
ns
> > mtk_i2c_clock_enable() and mtk_i2c_clock_disable(), increasing common
> > APIs usage, hence (lightly) decreasing kernel footprint.
> >=20
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > ---
> >   drivers/i2c/busses/i2c-mt65xx.c | 127 +++++++++++++-------------------
> >   1 file changed, 51 insertions(+), 76 deletions(-)
> >=20
>=20
> Hello,
> this is a friendly ping to request review on this patch as to avoid forge=
tting it.
>=20
> Adding context, I have tested this patch on multiple (older/newer) MediaT=
ek
> platforms.

Qii Wang, what do you think about this patch?


--RuPdci4FI09i3u+P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIek90ACgkQFA3kzBSg
KbafGw/9GFenif8e7sf8WDjqoiTJ19bnc5EA2wFP1yuCOK3ITglAu9Yya8tTY/3J
phPYTkQlqYXpth6+AndEsBGv2g4sDb8T7MkcNCi6rZYper8oyS6Xro7qkprCvzqZ
Nj6ltSANZqjsmKsQGNQjiZtXYG+uYzXMKGzbuf4SF9tSJ1GiC43usBv7KKW3wZie
n9iP2Ii76q0nqJ5v44a2E1AIxQkyn1DQOotD4F+TFZEgpUSIIWctq2Ez3G6LpjjW
YtERdPi5nCNB90V55nn13ksUKLv5pertnc4elqEbsFT6ZOtYUvUDYOo1oA/5sLIP
rlLVSM2kZyRbomIPFW4n3AAX+Ag60eDc/VtBOj9rR2ZpRTe1GZCfCokk03/UIqiq
CeWAEJPQ3kd1eqY2Hp46uNUMgS/zt5Xuc7uKNqZmSs9KIs6NUKi5ydH6/9AW1hrV
f4xP9pm+CyZv+2/qrcMG3INfL4QRAmRgaVCIThN5n0Rapr7PELa+0bpnXND1a/AL
SkRJUIX8r5nOMbeKGBkccTBnHr+asXr7FqY2EjO9fdzCj9CY7HaP/QXTjYzHdOsT
Dnpz6clEeaUPmdG2zeNeS+nmjnWFpJhdQPt6Ac9CBJ6mGTXYH1tJR4C960YBQ5wF
Tm92kQCkYCQDQE90ftGoq5AZVseXlmnPKXYiAndBXkX/9TmlUTU=
=cpdN
-----END PGP SIGNATURE-----

--RuPdci4FI09i3u+P--


--===============1867162086971304327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1867162086971304327==--

