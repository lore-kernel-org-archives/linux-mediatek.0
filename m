Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64A2E67A8A
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2026 07:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrsy6b9SwbROt6AJddMzN0hDw2Kh/TrZkPMtl9GwWtM=; b=DZ+Vp15HCcoE6E12x7kFs4bOQH
	Ccv7CwhIKu4AmPLosxtSHE7oY2lXH7K9tmG8+gc4h/bYKVoQR/mymhs2tPofGYHEEPfqVsBdStzu/
	tLySKNgo4vO82IiF2EiFPlD8gwCRP6TXGdfrewuiDqmtHf45z3eqy5pSjPK+Ex+tPkH7o1jjcV6Bi
	XfXlcFuWzRvg/bzVjTTKb/lW0VinTPiNIK8OaDpNbRzR8GbY3SKIbYCNy4txBqIlCe5GrJLtBTWRm
	FG39P0ICkXcDcLkEF22amA2FVPR1ZG3n29yLvs3VHpaZLWtxL1Flr1oQYAnz5Xj224TG8YFiVMgun
	fPF5TwXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKJT-0000000EhJo-0yjo;
	Tue, 03 Mar 2026 07:37:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKJR-0000000EhJi-2IEV
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Mar 2026 07:37:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BC4E600AE;
	Tue,  3 Mar 2026 07:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92F4C116C6;
	Tue,  3 Mar 2026 07:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772523420;
	bh=op77g5UoTjhxqzll2mmBdL5X9byfPcnF1cIIGUcim0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DDUEzGlHZ5t0GLu7tcbj4M/1q+uFQhoRNX5zFqfDC0Fs9FWCLq09dJyK0YXULz1fk
	 HBO957xKeXu62F+tFXRnY/XdoyZpQn/4TR9rUyZXVCuWKFxVmHqVr97GsptjigGvDg
	 UjMOOLL81ksYSXdFT7MpTQgLhOvkhWXKq4j6f4IU6xy4rdqMFvYXuxjakS7X7LS7xM
	 o2t1KeYT0aGMxE016lVVshPasyOvxPP2bbgsR+GbBk5dIZB4tVGCCEvRAIzHhSyyq+
	 2rmFts+i3htUV2PqQXzdD6h0RPCpW9rAXAaaKdcxS509UjSDDKlaKgXhvILCp0KUar
	 /UTAaMS0cAlaA==
Date: Tue, 3 Mar 2026 08:36:57 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Money Wang <Money.Wang@mediatek.com>,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mac80211: fix missing ieee80211_eml_params member
 initialization
Message-ID: <aaaPmbR0pVZLMX0t@lore-desk>
References: <20260303054725.471548-1-MeiChia.Chiu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VWJ8q/hmLoxOX88V"
Content-Disposition: inline
In-Reply-To: <20260303054725.471548-1-MeiChia.Chiu@mediatek.com>
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


--VWJ8q/hmLoxOX88V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The missing initialization causes driver to misinterpret the EML control =
bitmap,
> resulting in incorrect link bitmap handling.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Fixes: 0d95280a2d54e ("wifi: mac80211: Add eMLSR/eMLMR action frame parsi=
ng support")
> Signed-off-by: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
> ---
>  net/mac80211/eht.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/net/mac80211/eht.c b/net/mac80211/eht.c
> index 75096b2195d2..078e1e23d8d1 100644
> --- a/net/mac80211/eht.c
> +++ b/net/mac80211/eht.c
> @@ -154,6 +154,7 @@ void ieee80211_rx_eml_op_mode_notif(struct ieee80211_=
sub_if_data *sdata,
>  	u8 *ptr =3D mgmt->u.action.u.eml_omn.variable;
>  	struct ieee80211_eml_params eml_params =3D {
>  		.link_id =3D status->link_id,
> +		.control =3D control,
>  	};
>  	struct sta_info *sta;
>  	int opt_len =3D 0;
> --=20
> 2.45.2
>=20

--VWJ8q/hmLoxOX88V
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaaaPmQAKCRA6cBh0uS2t
rCTPAP0d8cwb5AdhkgMXSv9FAHdkExv2kH1NdvMDGeDFtMqpWQEA+DrDwiA4PpUl
CibOoC5VLbMzSPQ+HBVF2/qeQPM9bg8=
=c9Ib
-----END PGP SIGNATURE-----

--VWJ8q/hmLoxOX88V--

