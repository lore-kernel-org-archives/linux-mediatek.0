Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96D9CD6E4A
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2026 06:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDSxYnMPY0itqsVM4sIvyNaZq4A9tfxgOPqtLTGH890=; b=nXggjRfuHK+ColCsaKypjtHOAc
	QRkxMCMhL+ce8N937yMAI74H9TccWFb4NKQ31T+1lINg2bfs9tShfWM8De0mxFAuJeJpXfpzdnFp0
	yDKNcwlXzUILQ7JQOjDs3AbbRl8FUuYRML8NfRErUk7Hww6oDyQUSYbfzQGoXZoTHMVyWne6EaD0M
	BUSij/OdDaG+JUZ109I379NeKXSptC0bjxoqGyEmSOca2rvloK9ZjhXXX3fLejvCQbAoaXEsFNc9l
	A/t6NUw+1CsVs6/Nz2xzt8Sup9+WiVkaeaxTwLEB0MKiSPUsZEATL04zZZRG9Zv5INaIdQs09quMx
	fg+hNN/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIz8-0000000CPo5-3jje;
	Tue, 02 Jun 2026 06:52:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIz6-0000000CPnK-1kMu
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jun 2026 06:52:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A83CD43C45;
	Tue,  2 Jun 2026 06:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F199B1F00898;
	Tue,  2 Jun 2026 06:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780383139;
	bh=ZDSxYnMPY0itqsVM4sIvyNaZq4A9tfxgOPqtLTGH890=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K8IElk/hVgq6/2y9P/OGKrMAyBQ/0zQwylWD9vpg4553zitHz8Ps5Fv8mD9wzSvpS
	 xuTYJ6vQ1ZtD6Yn/RAOp3cFFnclPPFkZ0g412Q01VwUB9+YakZFBJTSV1XT6gsxMQd
	 0HmxjvIEvWavEt29wPCTHDtXddp8TmPSXIKcScI3h+JFDhq/Vl+6Kj2sRiYdfqXlv+
	 scMjuOgCQtsx0Op4M0BL8hrwFzeQDGcjmsYrto8fvuUaFTxxktpBsiN1MCvRTaIbtr
	 EAYNFzlxx+wOmYX+fjDfXlxVoAGs2yZ8TBlb8UD5sS5fft+kZQsKXW1xdaURtRdK/w
	 LmtjxWZABNmEw==
Date: Tue, 2 Jun 2026 08:52:15 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Florian Westphal <fw@strlen.de>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Felix Fietkau <nbd@nbd.name>, Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	intel-wired-lan@lists.osuosl.org
Subject: Re: Possible UaF bug in netdevice teardown path
Message-ID: <ah59n47KKkhZmt0o@lore-rh-laptop>
References: <ah1NJMrJ5rEkQlJG@strlen.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="576asHiwzTTmFSL0"
Content-Disposition: inline
In-Reply-To: <ah1NJMrJ5rEkQlJG@strlen.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_235220_512971_D16E9AEA 
X-CRM114-Status: GOOD (  16.15  )
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


--576asHiwzTTmFSL0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 01, Florian Westphal wrote:
> Another sashiko drive-by report. TL;DR, do you need to apply this
> pattern in your driver?
>=20
> -       metadata_dst_free(priv->md);
> +       dst_release(&priv->md->dst);
>=20
> Affects:
> drivers/net/ethernet/airoha/airoha_eth.c
> drivers/net/ethernet/intel/ice/ice_eswitch.c
> drivers/net/ethernet/mediatek/mtk_eth_soc.c
> drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec.c
>=20
> Long version:
> https://sashiko.dev/#/patchset/20260527135751.1031891-1-tristmd%40gmail.c=
om
>=20
> This isn't a bug introduced by this patch, but looking at this fix, do
> other callers of metadata_dst_free() suffer from the same use-after-free
> vulnerability?
> In drivers like ice_eswitch and mlx5 MACsec, a metadata_dst is allocated
> and references are taken on it via dst_hold() when packets are processed
> (for example, via skb_dst_set()).
> However, on their teardown paths, these drivers call metadata_dst_free(),
> which unconditionally frees the memory without checking the reference cou=
nt.
> If packets holding these references are queued (like in a netem qdisc)
> during teardown, does the memory get freed prematurely, causing a
> use-after-free when the networking stack eventually calls dst_release()
> on the dequeued packets?

Hi Florian,

For airoha_eth and mtk_eth_soc I think the issue is less severe since we
destroy the metadata after running unregister_netdev() (that executes
synchronize_net()), but I guess it is better to fix the problem. I will pos=
t a
fix for them.

Regards,
Lorenzo

--576asHiwzTTmFSL0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCah59nAAKCRA6cBh0uS2t
rBbkAP9n6TqudmP6+W+Gls0RKmbOrps5XTC2yBfclupisGuNKgEAzCrWI8aTjg0X
PL+C1WcMnx5qmRT8MuqbePPE7PitIQs=
=sBwZ
-----END PGP SIGNATURE-----

--576asHiwzTTmFSL0--

