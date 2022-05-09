Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F859C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 18:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gjwHkcu5nl0SjH4bWuxxaHLGKDY3IFef1vNIXH3hXI=; b=t42ziTchtpyoGjHnsSRSbQ6B7d
	TQ4Dk9/njP5xI2mcvA1qNiavvfB3tjt5e6XCRkAVeaTU44Bv0eC6u63atWHRT8ieKP6kUeyfMPepo
	FSqi7cE0+ij5TPiVbrikkY4JRZWYVM050wp+cIcmb0JoR5xm7pXm0gomkNn36GJvTDwCmk9/81lIz
	qHqfXU+BW8neXCjJGXA+WWroVEWo0INI1s7HodcKoOlFPRoQKKWd6lXDeSx5cu2QFhUx9WKkRm+H2
	TaDA/gV9mGRnDCx5nAVdxn4vlrjnP1zg1bFFUGXUJp4UtwcLrzzFOVcN30nv+BKCPRtzf8TXIu7jY
	8Ueh+GYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no7vl-00Fnry-DG; Mon, 09 May 2022 18:16:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no7vZ-00Fnqh-SG; Mon, 09 May 2022 18:16:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 21370615EF;
 Mon,  9 May 2022 18:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B63DC385B2;
 Mon,  9 May 2022 18:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652120171;
 bh=fityjqx3LAPgs6j3Ab+RUFq57LrBU7RECIxpxYVKf7A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JFGu9zPByEWxEeLaLwZAOINXLVIUCBbJaslnR53O9GQPouETdtWGpGVcBhp6qezf6
 U8ow/sPecgR/+KSxLwLaGpJIYv/yoH4gt9n8w5RgibLvq3FQswUuie8l6F07YmGkk1
 /XLZHlEqU6zkhqQ1z8Gma7eCZw7hE4Y2V6YuD4OLI9uggbweCU5TLBLr/z1s0JGOqG
 ZTWT/I8eFw7AmqV4mT3mwKA6cVuKCv37Zo6Ul/zaBuiT7zkNEYYrVGQx4odDr2DB6i
 b9ddTb/r2eFavRJ4OXNELb59dhgU21QSzi0UvequrCT3cdt5JVqn/XpAwc/jWm0p26
 GRGGjZZTH4TNw==
Date: Mon, 9 May 2022 19:16:06 +0100
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernelci-results@groups.io, bot@kernelci.org, gtucker@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: next/pending-fixes bisection: baseline.login on mt8173-elm-hana
Message-ID: <YnlaZgJfGASYwO8Y@sirena.org.uk>
References: <62793d83.1c69fb81.71b96.033e@mx.google.com>
 <YnlBAoZTJ6WbM394@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <YnlBAoZTJ6WbM394@sirena.org.uk>
X-Cookie: Do not apply to broken skin.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_111613_985830_F1436A63 
X-CRM114-Status: GOOD (  14.13  )
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
Content-Type: multipart/mixed; boundary="===============7102691740715827721=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7102691740715827721==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lqwda+yZWhdsDg4f"
Content-Disposition: inline


--Lqwda+yZWhdsDg4f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 09, 2022 at 05:27:51PM +0100, Mark Brown wrote:
> On Mon, May 09, 2022 at 09:12:51AM -0700, KernelCI bot wrote:
>=20
> The KernelCI bisection bot found a boot regression on mt8173-elm-hana
> which bisected to 6f81fdded0d02 ("serial: 8250_mtk: Make sure to select
> the right FEATURE_SEL").  With the patch the output terminates at:

There was also a similar report on mt8183-kukui-jacuzzi-juniper-sku16.

--Lqwda+yZWhdsDg4f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ5WmUACgkQJNaLcl1U
h9BEsQf7BsIqfG+ZeTzFwFvRnTzgzhjZoANmgE0Yqr9ZAj7cW0QJLFmm73HrG4g9
e7Xz3NpznH7ymkVkOHOqtRIZm5ZvaetcbFe9JBUQUdH8rluaa7FVHHAHYH16q66M
Y2SyeVl1TDCbvTSP5B1LQZO01cRhEFhe1tLvUj8DnuH8R0H9rzk4OTeSCK3vQFyA
MKLHQyvKd+q7WqfYHOcz7Ni/LDOe4NJyRXuVBBUqpriE53naLMq1DERUIBVOs4Kk
VhKChrQWLZ5XXhjw3y4Hv6Hq10f3YdBGNr1xt8/g+iTy5ACCrZ3GYpUJGbmA7vui
+iIt0EV6rKpz7PmrSG72jFDTcbL/1Q==
=n5eN
-----END PGP SIGNATURE-----

--Lqwda+yZWhdsDg4f--


--===============7102691740715827721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7102691740715827721==--

