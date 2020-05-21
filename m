Return-Path: <SRS0=x8tw=7D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF79EC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 16:40:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A908D2072C
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 16:40:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IgJohcb2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PxuSU3uZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A908D2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bHzVQc2I1s0Pmn1qt6GoXXhunuKFht6uQbn2kWUTFVw=; b=IgJohcb2iI5XFJg2s8htFr0Mw
	E3SL58ndI0JEwu1KA9Rv0ym4Pua6nqvLpTtMh4uqt8tZtVJrj2KHwZ7vMOHFq/VXgO9ExD5qV01T/
	CuDPtfKqWirSKt9xOc3bRNz5AF2fv3oGdqE8iYXxSDVCHuAXV9USPcnNuhmkOjtT+nWKH1qD6dQEM
	9zWHsjlkIO9NWeDwNZdWLVrfHUw3ClzR8H+fUiQOH+6fmQH/Amk0wA46p8XlzpAlbnJUThbC8GKES
	Zzjf/Ge9oMbVLhvk9NtoVWRu3cqr6bLcyPR7pXzN1Ju2msEa18tjPNED9bNATMJ9N60GPn7SK2e7j
	grHEJBazg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jboF1-0005JM-EA; Thu, 21 May 2020 16:40:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jboEi-0002lo-PX; Thu, 21 May 2020 16:40:01 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C3B5D2072C;
 Thu, 21 May 2020 16:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590079200;
 bh=AfI9fmUuFN9xXeTYe0PWSZoP2kgFN0oEZnj47UWorQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PxuSU3uZYzpRLRdfe6Rz7HLoMY3bYg9op1wwP4N0PdBGZPEFoO/2RdlRUJkMufXCN
 k+uSn09pgwURuO7SDRb3U6qQ8aMF1Yb9d5sweGPvl86oLvc98dLElPyf6p82Wjnwr/
 do5Lo8UULK6bwoTOnwcV2rAUBlsuroCTbYwvqnMk=
Date: Thu, 21 May 2020 17:39:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v6 00/19] mtd: spi-nor: add xSPI Octal DTR support
Message-ID: <20200521163957.GG4770@sirena.org.uk>
References: <20200520163053.24357-1-p.yadav@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200520163053.24357-1-p.yadav@ti.com>
X-Cookie: Keep your laws off my body!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_094000_852959_5B0C03B2 
X-CRM114-Status: GOOD (  12.00  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sekhar Nori <nsekhar@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8620014251687056635=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8620014251687056635==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TdkiTnkLhLQllcMS"
Content-Disposition: inline


--TdkiTnkLhLQllcMS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2020 at 10:00:34PM +0530, Pratyush Yadav wrote:
> Hi,
>=20
> This series adds support for octal DTR flashes in the spi-nor framework,
> and then adds hooks for the Cypress Semper and Mircom Xcella flashes to
> allow running them in octal DTR mode. This series assumes that the flash
> is handed to the kernel in Legacy SPI mode.

Are people happy with the SPI bits of this from a MTD point of view?  I
don't have any concerns and could apply them on a branch even if more
revisions are needed for the MTD side.

--TdkiTnkLhLQllcMS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7Grt0ACgkQJNaLcl1U
h9D1OQgAhiDwTKnfU5U/brtlpuvixDO+Q0C2aTYod9BlC6/J0LiO/hDJeEvk37Pr
hAyYy3T36TEfkovmaLsQTTthWIkmvU+GhZhOmBUpGTPsINXBUDCM5oIV7D8k7axY
okkAhFALSCWJk9KSkaYyQAKXH1JdAAh+3kodj4zU+jGaa9NOpsjJmIapIQ+9/iTn
48Rn8Du87lLkYGQkA13k7sdi4sghM/8Nx3fvjPgEG9K65J+DE2nds2v5mrD0HPDx
G+4+54Z0N9/QT4ZVebUEb4fMuBRlB0tpMnaQhd/ll/VJ7XNppMBtKhlMeV7TUF/+
z9wWlZEKa3CYCCbQdluJq1GlHlhAIg==
=fkrh
-----END PGP SIGNATURE-----

--TdkiTnkLhLQllcMS--


--===============8620014251687056635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8620014251687056635==--

