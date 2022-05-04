Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF4DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 20:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOjM5erfxZGt1CYwu8VSFpzv0Go0W6f6a+rnstf1WtE=; b=NeLbw/u1TR0fQw2Ow4PgDTva8v
	bbrDXsdlGzMFL1iYkzp8IAwUXkP59I5QKm6UDZEpXrmGPzKrpmwB1M4nlaV8Ekp4HuiF03x9Ojicd
	IK7XZ9sc8XaIQWhdevH/IqCsPwqRVJi5Mhup2D2JZ1+rdMytIz/L9koRCfSX7WK8PTl3lrQBjNEfC
	bG0fpbS6y9rkU4ImJaDVP9SbaU6U+oE8UyIMW6bbrHcQvcPLshz1M4Txrz/R+NbhMxOnYOZSoaMTR
	1Ynl02HvIpol8P7jhJkgDBn6XHhAPd6X7yvWbhxcpSIJCnghr7cA9LZUChq8FhVAKP0yLnY2uT95x
	JpwwOrRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmLUC-00CWVZ-BM; Wed, 04 May 2022 20:20:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmLTx-00CWSl-7r; Wed, 04 May 2022 20:20:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3A095B82833;
 Wed,  4 May 2022 20:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67909C385A5;
 Wed,  4 May 2022 20:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651695617;
 bh=geFDPzJVs0HcYSkqypzjcAX2q1cZeSSqsEdLgxt9m4c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vAssURayg6u+1d5DYrK98zrlfYG4mss9BlIK5WGwuqi/GOKAILD1wDfdEScQcGDUc
 tEe+a3NLWvGXj4q/+WoPWIedr+uk0b8vIsAcerK5Cpw9CTrbgbpHfJZT9DUj4QfkFP
 lM3nOL+rHKLsgam8M+WE+iYBQM06EARaFd4IGdqacXARLIzVhsmOecIUjj/0QM+FYU
 xzGZwKTcupqTKkEe4Wcm9rWrh5zTpZKihIa9XSpcuXhSkFlCAZENRFgMiVWzbjVKRL
 XBllzpeZ/9ag9XzVbmHJqEF5yijYgZknxOx32i9n60Im/pTck9vwMU2ikIl/9oGP0d
 aPO8Z4Q6/Bfzw==
Date: Wed, 4 May 2022 22:20:13 +0200
From: Wolfram Sang <wsa@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: qii.wang@mediatek.com, matthias.bgg@gmail.com,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 nfraprado@collabora.com, kernel@collabora.com
Subject: Re: [PATCH v2] i2c: mediatek: Optimize master_xfer() and avoid
 circular locking
Message-ID: <YnLf/QdSIm0/B+me@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 qii.wang@mediatek.com, matthias.bgg@gmail.com,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 nfraprado@collabora.com, kernel@collabora.com
References: <20220411132107.136369-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20220411132107.136369-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_132021_611280_C71691A2 
X-CRM114-Status: GOOD (  20.16  )
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
Content-Type: multipart/mixed; boundary="===============0440944130132329218=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0440944130132329218==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+Ffh0zQ3V8hTbmod"
Content-Disposition: inline


--+Ffh0zQ3V8hTbmod
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2022 at 03:21:07PM +0200, AngeloGioacchino Del Regno wrote:
> Especially (but not only) during probe, it may happen that multiple
> devices are communicating via i2c (or multiple i2c busses) and
> sometimes while others are probing asynchronously.
> For example, a Cr50 TPM may be filling entropy (or userspace may be
> reading random data) while the rt5682 (i2c) codec driver reads/sets
> some registers, like while getting/setting a clock's rate, which
> happens both during probe and during system operation.
>=20
> In this driver, the mtk_i2c_transfer() function (which is the i2c
> .master_xfer() callback) was granularly managing the clocks by
> performing a clk_bulk_prepare_enable() to start them and its inverse.
> This is not only creating possible circular locking dependencies in
> the some cases (like former explanation), but it's also suboptimal,
> as clk_core prepare/unprepare operations are using mutex locking,
> which creates a bit of unwanted overhead (for example, i2c trackpads
> will call master_xfer() every few milliseconds!).
>=20
> With this commit, we avoid both the circular locking and additional
> overhead by changing how we handle the clocks in this driver:
> - Prepare the clocks during probe (and PM resume)
> - Enable/disable clocks in mtk_i2c_transfer()
> - Unprepare the clocks only for driver removal (and PM suspend)
>=20
> For the sake of providing a full explanation: during probe, the
> clocks are not only prepared but also enabled, as this is needed
> for some hardware initialization but, after that, we are disabling
> but not unpreparing them, leaving an expected state for the
> aforementioned clock handling strategy.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Applied to for-next, thanks!


--+Ffh0zQ3V8hTbmod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJy3/0ACgkQFA3kzBSg
KbZSgg/+OcspNsB71GsrUFefU76o8S9qJdpJSijNT4pBMxh0uuNqFyyyPDrbC34S
5MJ1viEhDqP3FCzLH5UUnf9Jy5DAVUuaPKXJAbJy/LMHyCiDK7eMZFur4gDbyXdH
w9IcR+CGYSoBonwTGjigl2EbihwVCPSx83a1Qp2Apxz0gmeZpvphiGjACjCsotZG
rWrU7kQsFObAiRncEvyL5frJu1uVNYbQlguUr/u67Ntn2mcNSWuttxLOenZQyYZE
ppRBD4wQh6xK77orTjI1H7qgiUvr8lnw0ftgcUqP+RlOxUX6/gBEOchKX1gVHPkD
VLOhkY/j3D6eNedBBtdVAGYI4zpQe3gk2+ywT2u+S7+Cibj4NKjQCvQj6cXENNhY
+arC6eYbfZaghRbetcJQKKA4ekYa87ahQji095sVNikrhrdheusuPjiGA7ZMfx/O
er7cXUN0ImrPaCIiS+uDD3AlMAwXSnVXTI+3N6PmPOKue3e34H4QEKfozAWGUg4X
nRbR0l4IqjL18nvQEIEj7kFkQ67ZaJr3Th2Fksk3Es2Rhu98ktuNlsrMvILOvBZe
Y33YKB/sFySOvJ2hL0y5gqbL4TTeXh7crLCc+9lvpYlCGn5VtsgpB2lAqw/cHi8j
L7ooc0q+PcfPhJgnKfFby0ytn8Q/3kJK3N3xPJyPxMz6s6Agrs0=
=Znzh
-----END PGP SIGNATURE-----

--+Ffh0zQ3V8hTbmod--


--===============0440944130132329218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0440944130132329218==--

