Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663BC606A8A3
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 08:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wmdgIuPo;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X/LCPl55
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yXyM6hInDsEKLWc7KcDerii+PLDeTJXkz+ckDBd2y54=; b=wmdgIuPoZsGHCMtZr67IJJZdCe
	h5ygO+s/aLRfVG9LXAFK5NdGnbSptBSoV/oNjAr7PMeaMdwBXbjM4FuuFIWU7QLH4mEFPwFAAzHWT
	Mt+gDbkjoJfbaRig5rbJWhAq+ez/TtB1WnGcudOMGB51jQkKTsUBZem2xerv8USgEL+c41TZSWmId
	9F/KtP8Eh7cfPs3LAghXNm/Og/22RFUfp+Ktwo4xSOrbJ7p75N8SNERVl2cPlYIMTm2nWP6D1/l47
	qLKHVe/TZ92E5t4SeMiuP8pSi50Q6COL0nUvJ+fkLvn7e3eTtKMh1KcdNjAYSu0SRzOrTzQ6ZLbhA
	YsBYUlkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmtx-0000000C7kX-3The;
	Fri, 13 Nov 2026 08:44:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmtq-0000000C7iD-0kK8;
	Fri, 13 Nov 2026 08:44:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C08F62608;
	Fri, 13 Nov 2026 08:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03701F000C6;
	Fri, 13 Nov 2026 08:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794559485;
	bh=yXyM6hInDsEKLWc7KcDerii+PLDeTJXkz+ckDBd2y54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X/LCPl55qYD6SeFZ97GcEsZgUIkxJnRvc2a4PHzGkPZWmGaH3M2YdPhJI8nFCLr/J
	 xwYzT9UYmONMc7y4BcjJ78Ryfj7oQCwPIKricR7P0C1Eotbh+mmy1kWFdMQMMXCpat
	 hjorlMnB5+YnaTXovPQEXkGYXuaTUO/Mm2V+Iwwb5Plw0p7vV8uwaFRsEiHqwixd40
	 EwsjL1KPOvLBTJ2NKmV03gkz9FUz/Gi0Uecv7Q+git9Z5LpO3dgyTpTzn/rQvzduvk
	 NTO7VIEST6hPQPtL42ixv7cMCK+JSEvWmRKqtIYBsVGRZ4jryRQcKCJVBxGFT/wzS8
	 i9LwUVUmbHrXg==
Date: Fri, 13 Nov 2026 09:44:43 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: John Crispin <john@phrozen.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>, lei.dong@airoha.com,
	Linqi.zhang@airoha.com, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, Rajeev.kumar@airoha.com,
	upstream@airoha.com, Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2] clk: en7523: do not sleep in the EN7581 PCIe clock
 disable
Message-ID: <avbN-3nL6JNHozzz@lore-desk>
References: <20261112185329.1314427-1-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F4RPVZbwfNP5GRwu"
Content-Disposition: inline
In-Reply-To: <20261112185329.1314427-1-john@phrozen.org>
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

--F4RPVZbwfNP5GRwu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> en7581_pci_disable() is the .disable callback of the PCIe clock gate.
> The clock core calls .disable with the enable spinlock held and
> interrupts off, but the callback sleeps with usleep_range(). Every boot
> where no consumer holds the clock reports "BUG: scheduling while atomic"
> from clk_disable_unused(), and so does the unwind of a PCIe probe that
> finds no link.
>=20
> Drop the sleep. Commit 90d4e466c9ea ("PCI: mediatek-gen3: Move reset
> delay in mtk_pcie_en7581_power_up()") already moved the wait of the
> enable side into the PCIe driver, and nothing depends on a wait after
> the disable.
>=20
> Fixes: 66bc47326ce2 ("clk: en7523: Add EN7581 support")
> Signed-off-by: John Crispin <john@phrozen.org>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
> Changes in v2:
> - Drop "clk: en7523: add a reset operation". i2c-mt7621 now asserts
>   and deasserts the reset line instead (Philipp).
> - Link to v1: https://lore.kernel.org/r/20261111085650.632025-1-john@phro=
zen.org
>=20
>  drivers/clk/clk-en7523.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 24fdec2e6198..8f63482cbb7b 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -689,7 +689,6 @@ static void en7581_pci_disable(struct clk_hw *hw)
>  	mask =3D REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
>  	val =3D readl(np_base + REG_PCI_CONTROL);
>  	writel(val & ~mask, np_base + REG_PCI_CONTROL);
> -	usleep_range(1000, 2000);
>  }
> =20
>  static void en7523_register_clocks(struct device *dev, struct clk_hw_one=
cell_data *clk_data,
>=20
> base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
> --=20
> 2.34.1
>=20

--F4RPVZbwfNP5GRwu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavbN+wAKCRA6cBh0uS2t
rJtDAPwLVmxAglv0nHD3+CuXP6UA0RXL4MmaMltEsCU4oiQIsgD9FhTEPRAQ6ARI
lviULhURGR9ZX/xyrmm1dTiXdAaaVgc=
=ezYL
-----END PGP SIGNATURE-----

--F4RPVZbwfNP5GRwu--

