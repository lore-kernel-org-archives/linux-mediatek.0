Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F169CD8CA8
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 08:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FA8Qkjbau8l6ahSUSntT4VYINgPbUIyT3mXo0SiPu8w=; b=T+PmeQ5QF3GFCHARxO07m1RZhY
	gy5mnABgbisauRYdABBN6DK5jREHA/CqY0dL6wwSTR0K6+Fey6wbrDCgWL3d8qJDk8IwC0RDA2fzx
	jSf0EyCiXnSYE5aO9fVLFFjZExX8G1lWdr3JtDrBXtD4ZAozGfIk6zixvFrxJIh3b2EKgBWQwepFt
	CQY3CEdmczabhDABmkVOhpGtJygCcS2o3xwHfkkuB2AIK73eiCQ19UThom1Z2dIIqHUMWZtQOBiU0
	uaE7zuheP9NCAzUqNMQv8ILSfV9Ca3TrgN7RlCaaO9iuz6fgM9eUWWpFkxV2A16j5Lt4WE5AR1hOd
	PE4EskLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJqe-0000000C5sB-0NrW;
	Sat, 13 Jun 2026 08:36:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJqc-0000000C5rd-1jHe;
	Sat, 13 Jun 2026 08:36:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9782341500;
	Sat, 13 Jun 2026 08:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16441F000E9;
	Sat, 13 Jun 2026 08:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781339769;
	bh=FA8Qkjbau8l6ahSUSntT4VYINgPbUIyT3mXo0SiPu8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dW3ZLxCxKWkp6dV+14xw66cXXHoGeXWWY/r4cIx3haGMztzrz6c+x5NWk3Rd+Fhl4
	 yGzOT9Eq3fe272TR8Jupukq6BzIgNoWhFdZULN4b4LpL7AT5eXLwk0FsGcq8xYeztl
	 +Q5CaoXRuimk7Vxl1gc4hyYIlVQ4dQqK3Ld6vymfNtAlrAxoeGZbnb6PS//aMPe1cl
	 yHO9fBhN81POwK6tEBri7BNdZBhaFW1hsXhD0FTUpgUuWefGYOSDx8TvwcSVyW6U9/
	 E62O8UmVJF0dYBJF2fVXLGbUWsyPCMdFWQsmjyUxKtGwU3Oi3zBtslRdYlyklccZw6
	 Fh/3mBbHNJlig==
Date: Sat, 13 Jun 2026 10:36:06 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: "Wayen.Yan" <win847@gmail.com>
Cc: netdev@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: airoha: Fix always-true condition in PPE1 queue
 reservation loop
Message-ID: <ai0Wdm6AYh5ZrRWa@lore-rh-laptop>
References: <6a2ca3de.ad59c0a6.147df9.2ac1@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H5AwCgcOCuAvnmQX"
Content-Disposition: inline
In-Reply-To: <6a2ca3de.ad59c0a6.147df9.2ac1@mx.google.com>
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


--H5AwCgcOCuAvnmQX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In airoha_fe_pse_ports_init(), the inner condition for PPE1 queue
> reservation is identical to the for-loop bound, making it always true
> and the else branch dead code:
>=20
>   for (q =3D 0; q < pse_port_num_queues[FE_PSE_PORT_PPE1]; q++) {
>       if (q < pse_port_num_queues[FE_PSE_PORT_PPE1])  /* always true */
>           set RSV_PAGES;
>       else
>           set 0;  /* unreachable */
>   }
>=20
> The intended behavior is to reserve pages only for the first half of
> the queues, matching the PPE2 implementation on line 334 which
> correctly uses the /2 divisor. Fix the PPE1 condition accordingly.
>=20
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 =
SoC")
> Signed-off-by: Wayen.Yan <win847@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 31cdb11..999f517 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -311,7 +311,7 @@ static void airoha_fe_pse_ports_init(struct airoha_et=
h *eth)
>  					 PSE_QUEUE_RSV_PAGES);
>  	/* PPE1 */
>  	for (q =3D 0; q < pse_port_num_queues[FE_PSE_PORT_PPE1]; q++) {
> -		if (q < pse_port_num_queues[FE_PSE_PORT_PPE1])
> +		if (q < pse_port_num_queues[FE_PSE_PORT_PPE1] / 2)
>  			airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_PPE1, q,
>  						 PSE_QUEUE_RSV_PAGES);
>  		else
> --=20
> 2.51.0
>=20
>=20

--H5AwCgcOCuAvnmQX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCai0WcgAKCRA6cBh0uS2t
rO7RAP9g7N1WhxG+uVhjrwSIALK1fOaWyiTfOWfqgjMFz2sJTgD/X/4yttNNe92V
RyqwwsP+NoHXVSlbjU6imIw7+hHDggM=
=AAmu
-----END PGP SIGNATURE-----

--H5AwCgcOCuAvnmQX--

