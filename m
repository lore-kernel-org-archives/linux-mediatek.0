Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C14C3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 19:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSyz1UXloLsGQhTbwhmhx6SKNZwAnJjq8d5S3qsocC4=; b=EH2MwHxwG/Q3H/c7QHWA3+XZVI
	j9oUDbh+xLmsXYxfPQw+tjzgOY9fMlkOgG+EEgxm0tmIyxnaOS2678p8J8byQIrRW6kZlVEadzGt2
	PYph7fCu3dWWmdsA5JUJJjfq6Uh4KJRPK69QxeK6UImkWdIHtDybvoS1oDTeIWay9anplhf4V+ga7
	KQT6YwcoRpo4Pfcdrx8ssO6wMqdWccFjcUpI12ocTTW/asOHbpMA3t7AJt769cNpI5flY9LLIRC3B
	JfJVX5Y1JYttRwqMzzuERfXnnskueSZviiDReQdo5XpP7vQzCh1eC+vX3vSDw99nTRzl3jigFjT9V
	/n2P9XWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUWyJ-00000000V6A-3gcT;
	Thu, 18 Jul 2024 19:39:23 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUWyG-00000000V5E-0cCW
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jul 2024 19:39:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C8501CE1AB0;
	Thu, 18 Jul 2024 19:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F869C116B1;
	Thu, 18 Jul 2024 19:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721331556;
	bh=3Oxn/O8Cot8sA3M6dSYeBY2dym38XFOUgiLPyiITpck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lb0t5blWEsVxQMAAIsEkdkQ6FAA2H6U29yLkMKgjr09eRWHLM24YySj5Bx3vCEJs+
	 eXOdL6XI//huQ6VT+Zwuj1+oRJTzcuVRO+fivhhU3lQ4iXCU7KQYo6ZEE1B/hmiLCH
	 eE8+7vX8xtA6wxxCIWofG84Tzmwh4rdbjdqSly8dNDyGK38QB/pr/aLCFYUzNWjWDr
	 o9P6C2oUUcdxGFNI+AHWe++viIwEYhunvjegAbRzVg9tzwc6pVbS1GikxphiqUrr1V
	 AKXON1KB1sCUWx9scLQIV9J97zpmRgIwqBXmwCMpPFzQQZ9T+Jc1WIYZUd8mEYP36z
	 RiZqdP4BKvULg==
Date: Thu, 18 Jul 2024 21:39:12 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Fix forever loops in error handling
Message-ID: <ZplvYE1YDEUBTR4Q@lore-desk>
References: <693c433a-cf72-4938-a1aa-58af2ff89479@stanley.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k9Epfoq46wrPNTrg"
Content-Disposition: inline
In-Reply-To: <693c433a-cf72-4938-a1aa-58af2ff89479@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_123920_393886_163012F0 
X-CRM114-Status: GOOD (  14.95  )
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


--k9Epfoq46wrPNTrg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> These loops have ++ where -- was intended.  It would end up looping until
> the system died.

Hi Dan,

I have already posted a fix for it:
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=
=3D1f038d5897fe6b439039fc28420842abcc0d126b

Regards,
Lorenzo

>=20
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 =
SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/net/ethernet/mediatek/airoha_eth.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/eth=
ernet/mediatek/airoha_eth.c
> index 7967a92803c2..698835dc6da0 100644
> --- a/drivers/net/ethernet/mediatek/airoha_eth.c
> +++ b/drivers/net/ethernet/mediatek/airoha_eth.c
> @@ -977,7 +977,7 @@ static int airoha_set_gdm_ports(struct airoha_eth *et=
h, bool enable)
>  	return 0;
> =20
>  error:
> -	for (i--; i >=3D 0; i++)
> +	while (--i >=3D 0)
>  		airoha_set_gdm_port(eth, port_list[i], false);
> =20
>  	return err;
> @@ -2431,7 +2431,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *=
skb,
>  	return NETDEV_TX_OK;
> =20
>  error_unmap:
> -	for (i--; i >=3D 0; i++)
> +	while (--i >=3D 0)
>  		dma_unmap_single(dev->dev.parent, q->entry[i].dma_addr,
>  				 q->entry[i].dma_len, DMA_TO_DEVICE);
> =20
> --=20
> 2.43.0
>=20

--k9Epfoq46wrPNTrg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZplvYAAKCRA6cBh0uS2t
rNC8AP9GO+whLkH0wsxQawNmzPqkNemW01FJwDdnGMfvvu+DYAD+Pt57+Q7JdTKW
FfkVr1yCsZG5iaad7AAyQvlXrb7NmAw=
=RvDK
-----END PGP SIGNATURE-----

--k9Epfoq46wrPNTrg--

