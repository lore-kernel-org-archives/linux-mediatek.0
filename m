Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AE0606A323
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 14:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N4dMYBgK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GzLs4tLR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iLa7N/5PMxMIbw6XFiucfzTWFw0y9C0Nc4OXIPahQro=; b=N4dMYBgKnm2mNaeTa6k/AcvQnI
	OdtjJ/8DrW7lgrnR80yKA5SAEgmwyONqfR9hpYns12wpZHNjYCv8npIbK5tc1K7GmI/mfcN0KXbJu
	isooTEG9XXzUpsKTyfkmmai+vMsy1aQCMJqFNMWED1ypHiZLv8cEIGFDCM2IxNL8bQVL6eQ0LclmV
	aL5Yph2GrTPK4e2wmLyKz4XvwcOmtpyMomMKclT6X4sJvZHvzVX5zTJPmnGZEZdej97/bvQY9ffmV
	AVxfhweOd9sHyAPrfFps0Q2Pjn/5rJS/UUwXYS9DCzkrjUohN1QATEXsx1nvVyrj2Yik8YDLpiNfz
	fDLOiiwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWDK-0000000ALpu-0AdI;
	Thu, 12 Nov 2026 14:55:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWDI-0000000ALov-0bxg;
	Thu, 12 Nov 2026 14:55:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DC6160E48;
	Thu, 12 Nov 2026 14:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CEA81F00A06;
	Thu, 12 Nov 2026 14:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794495342;
	bh=iLa7N/5PMxMIbw6XFiucfzTWFw0y9C0Nc4OXIPahQro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GzLs4tLRWkvQljPBr0XQxiwfM4AxgnYEikGh3csILNyhnM0n0IkrRo61qSV2dWs4G
	 cL4WiDf3FOFYJhBrw8DVSGEixG4mr5m+me90OgEFDgcVhPzv89K6TGn6PWBOP3H/4E
	 TX7ys/l/hIgNph/+l+QuniM264HZNuvCIQTKERCtM5kT8Qc7iqr8lZr9c2qgQhiX5s
	 m/P/612FS8YTsIG/PDHHLLQ8pWWJNNcVeqO70wdSgAC3majxGdO7zBtgsrA0Eij1dx
	 3EXIxHQFMsddzLl3ndK7j0/vV2G0NRIf5EeojOnAaws80JRENaDyQ/g88j4n7PuoDp
	 vJ6XzZcQPArFQ==
Date: Thu, 12 Nov 2026 15:55:40 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Felix Fietkau <nbd@nbd.name>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: Fix potential PPE hash
 table leak
Message-ID: <avXTbE2C9I09b3rn@lore-desk>
References: <20261112-88a3a7ff32-net-mtk@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3P06uWmzQDZRbKO3"
Content-Disposition: inline
In-Reply-To: <20261112-88a3a7ff32-net-mtk@mail.sdu.edu.cn>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--3P06uWmzQDZRbKO3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The remove path does not destroy the PPE L2 flow hash tables. Their
> bucket tables are not device-managed and remain allocated when the PPE
> objects are released.
>=20
> Call mtk_ppe_deinit() after unregistering the netdevs and cancelling the
> driver work, as the probe error path already does.
>=20
> This issue was found by our static analysis tool under development.
>=20
> Fixes: 33fc42de3327 ("net: ethernet: mtk_eth_soc: support creating mac ad=
dress based offload entries")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/et=
hernet/mediatek/mtk_eth_soc.c
> index ad0fdc4133fb..08973b6f0711 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -5426,6 +5426,7 @@ static void mtk_remove(struct platform_device *pdev)
>  	netif_napi_del(&eth->rx_napi);
>  	mtk_cleanup(eth);
>  	free_netdev(eth->dummy_dev);
> +	mtk_ppe_deinit(eth);
>  	mtk_mdio_cleanup(eth);
>  }
> =20
>=20
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> --=20
> 2.43.0
>=20

--3P06uWmzQDZRbKO3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavXTbAAKCRA6cBh0uS2t
rJMnAQCxCJLxh3xXoIo6ffBg/WJ9QAMKv+murVMDfTXlkqfPEAEAkdkzVoUscK8l
cXq37j/SXZQW4sEx6Xa5a/dKpw8hBQ0=
=n1xX
-----END PGP SIGNATURE-----

--3P06uWmzQDZRbKO3--

