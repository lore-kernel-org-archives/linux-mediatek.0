Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5B9C4829A
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Feb 2024 17:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KekJC1nQnNUKzHqhC3/yV5Jh7xIuCEBLPhsUlnW/8bk=; b=cLy5BQrmhOCg2L8ZLSFH+i/JrV
	79PYUZ0XforxyyIuLXc/miZFRL5OS61kLxODglHSn3UdhJgVGN7QdArflM/cxp1M9G6q8m8Vna1IJ
	kzrN6XaJMEiNGkw1Ti5+KVtC4Jnc5cfiAoZxlq4R8Z6bqq4siRXrA86bTRLLcRF390OiWJDB4/52w
	HzEaHvK1gMvj1J+/111lkH5wJ5rDP8mzC+uvdOHezq7kjPTySOwkoFzbwG/BGD/XRgkpm9nSST/7E
	UPCbT0HMo8EQD8n5fu94LkuSHqZCkWUrQSqQiahw+yNYXmtTgHpLr5zf/BFt6668VwnUuslJp/6Lx
	u3hkKMBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYr4L-00000001rFI-2J7a;
	Sat, 10 Feb 2024 17:23:13 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYr4H-00000001rDu-2GDt
	for linux-mediatek@lists.infradead.org;
	Sat, 10 Feb 2024 17:23:11 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rYr3s-0003V7-AK; Sat, 10 Feb 2024 18:22:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rYr3n-005icH-Po; Sat, 10 Feb 2024 18:22:39 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rYr3n-002FSV-2F;
	Sat, 10 Feb 2024 18:22:39 +0100
Date: Sat, 10 Feb 2024 18:22:39 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Erick Archer <erick.archer@gmx.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
	Rob Herring <robh@kernel.org>, Li Zetao <lizetao1@huawei.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook <keescook@chromium.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: Prefer struct_size over open coded
 arithmetic
Message-ID: <vm3fk7wbqxjl3i6kmd3dv2ofeszjxrvi2n7cd3ohasgjpi4j4g@d3f6estk2xol>
References: <20240210161619.12656-1-erick.archer@gmx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="346zxj37n4z5j2px"
Content-Disposition: inline
In-Reply-To: <20240210161619.12656-1-erick.archer@gmx.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240210_092309_594031_EC337AB3 
X-CRM114-Status: GOOD (  16.25  )
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


--346zxj37n4z5j2px
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 10, 2024 at 05:16:19PM +0100, Erick Archer wrote:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1].
>=20
> As the "chip" variable is a pointer to "struct mtk_nfc_nand_chip" and
> this structure ends in a flexible array:
>=20
> struct mtk_nfc_nand_chip {
> 	[...]
> 	u8 sels[] __counted_by(nsels);
> };
>=20
> the preferred way in the kernel is to use the struct_size() helper to
> do the arithmetic instead of the argument "size + count * size" in the
> devm_kzalloc() function.
>=20
> This way, the code is more readable and more safer.

Unless you intend this non-English comparative: s/more safer/safer/

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--346zxj37n4z5j2px
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXHsN4ACgkQj4D7WH0S
/k7uhggAkjErCNtMO9Tgeku9UEu3BBrTsCG6cirem2RU9oGOT4pbrCjRb2KCGYfU
q+/lrPRkB6Tp8aLA3ljD5QZbmSN4UY7IFFRjTPhs2QeCfLX4USL2es+P4oCbd32u
gZqw7aoZgZ1Gb05G5gboHeun8K3eEQE8eWfj1hq4BetoLNdq53tlW/csK98ayxPA
JmPsBOXq5MHiGDSNqb1gp85oNS2F3D+F5YortaxkPr4F3L17MG9XDezixApG/nTw
Uz2+EdFzM6BJN1Zac6t3Z2/6IaYa+aHE+ugdYp5aQIZ2NqiFaTHL7c9UfO85Zsi7
1fYuhJr1sBGrZoWF8QnOgiJmoDAtPA==
=Sihr
-----END PGP SIGNATURE-----

--346zxj37n4z5j2px--

