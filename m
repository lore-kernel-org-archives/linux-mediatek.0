Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE31FC5321D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 10:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GX23CTxLleCl/uZPTwBTWCb7P91La520rSv3LChdMGA=; b=qPH3akrcbc5wwI1lEGnKw4iAzV
	3euNizXKSQxc7dw/MKyFaq5VlEZDUzTNFKcS8vdHnMsOPWb+ZFeG2TfOpnG9aFKqgy+52RAcDEMBb
	X1lbqcsD+95jbr/CWYsbz0LIkwI2LuA8T8R+DUXzlmMpovwMYafK1vN7JowLh5x3aTM3Nu0ZjvbsF
	r9JMoUeCJeh8JQx0BeeSRe6wHNAwoo/mEq8ngnFrwKgJuGN4TRIX+mdZKa+BExqaSMWCvNcVA6wsD
	RBKzNabuM3gyqDp57hCnPlD+E3kTlISzvLtc2ihkmnVh3Q5p2LWEWyJALvcHAV5YY8ybSgHoJlGlr
	pI+u3/ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siXAo-00000006yZ5-22dB;
	Mon, 26 Aug 2024 10:42:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siX9U-00000006y1q-2IiH;
	Mon, 26 Aug 2024 10:40:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 75BD5A42543;
	Mon, 26 Aug 2024 10:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF3BC51408;
	Mon, 26 Aug 2024 10:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724668847;
	bh=hid4EhDWclsotpH44zFZgrvb2Nus2dMpx95VfampcvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HEWld4+4f750dIuyASymEoKJ0pp0AijzkLKfwLXXu7WJde1lkxYcYUA3un7bRLh1i
	 Uo1wzlxcRk87MW/28f+bvpf3UdpZF8uglnCglqq8yny0UPhWD8fX77r+p5vDzNIqfc
	 tNVkYGBiDDc6JZkkM0Oz3OqHeieO+msyqHEc0IpyODAfKs2NjRpFQWvSYW/XgijHs+
	 LrprZxF3U8sYJUvLwHD/1D52U5C4DrF+NELp8zVzyjiGUbgyvhGMoLIJ2yRe1afZIe
	 wFBftp3iiXuIIyyGm1m2BZ8eU8aPplsIULx6YgWjZDePratF/GOSbZc/1YrK8zvKKe
	 GQ/7NfPl19inQ==
Date: Mon, 26 Aug 2024 12:40:44 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Liao Chen <liaochen4@huawei.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chris.snook@gmail.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, nbd@nbd.name, sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH -next 3/3] net: airoha: fix module autoloading
Message-ID: <ZsxbrCWR7VpElXoP@lore-desk>
References: <20240826091858.369910-1-liaochen4@huawei.com>
 <20240826091858.369910-4-liaochen4@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aOyroMajbWG5tUEk"
Content-Disposition: inline
In-Reply-To: <20240826091858.369910-4-liaochen4@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_034048_674628_F2A58935 
X-CRM114-Status: GOOD (  15.73  )
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


--aOyroMajbWG5tUEk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.
>=20
> Signed-off-by: Liao Chen <liaochen4@huawei.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/ethernet/mediatek/airoha_eth.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/eth=
ernet/mediatek/airoha_eth.c
> index 1c5b85a86df1..a80c1fae5c2d 100644
> --- a/drivers/net/ethernet/mediatek/airoha_eth.c
> +++ b/drivers/net/ethernet/mediatek/airoha_eth.c
> @@ -2715,6 +2715,7 @@ static const struct of_device_id of_airoha_match[] =
=3D {
>  	{ .compatible =3D "airoha,en7581-eth" },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, of_airoha_match);
> =20
>  static struct platform_driver airoha_driver =3D {
>  	.probe =3D airoha_probe,
> --=20
> 2.34.1
>=20

--aOyroMajbWG5tUEk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZsxbrAAKCRA6cBh0uS2t
rM9JAP9RdTUsfjVfhfHPNS54DnIiyA5FBDNG+N3GYffQKIdqXgD9Fr7UEcQEfivt
s2yyVa7F9pW7inNKrtSw0GxhbY/sHw4=
=8z2j
-----END PGP SIGNATURE-----

--aOyroMajbWG5tUEk--

