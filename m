Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBBFCD6E5D
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2026 10:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwnyOUcz5FBUq0T3U/kXkfVtKXtqDQbUmSU8IVzwYkg=; b=Bn/7fESrfWkwkeyFX0OHwUs/tj
	P4mKkgzae+GCqAZYuWHySPzRaiKEBDm40l7EmEH51ELvgACvsmx4/rqdVzyJOmCqb89K3epI6Df4g
	BphzGuFanw9CkAc44V1aah93v+hj8kit1yBK2Zx+424MEm3Ig67DkOMjrWhfY5MwcHLlhwxVVDxBc
	tgYJU0LfESyaVTZYBshAGBFlP65iASCz9Wkf9r5lKxWsknY6b/qOtbsTe2NZlnWL41qbRxzfp041u
	07idBi4GdBT26TTn1PPkiIopGs2oZa8eALw2ruGh/4u6FnJ2hiMzkA5ItTCY56tvmn7TExghjB6aJ
	6OrRy6Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVRcg-00000000TLh-0CQE;
	Fri, 05 Jun 2026 10:17:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVRcf-00000000TLa-0LJg
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jun 2026 10:17:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 80D0F42B5B;
	Fri,  5 Jun 2026 10:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1A21F00893;
	Fri,  5 Jun 2026 10:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780654672;
	bh=AwnyOUcz5FBUq0T3U/kXkfVtKXtqDQbUmSU8IVzwYkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JEk2MPYdXHjuvnK9VFBM9Pj4rtMN+Wc6zIp5g2XhwmIHJXq8aZBryU4g6hGVGnNat
	 A8/GSIXcmD6q0aww3pa+EIfMlOa9Oq6uYD/usLIcwMSonv3p/MpQ+gbjH+E2xf+nwR
	 kJdeRS9SfGANDeCFTcq3PtleJO4SCoWQngB4LDOPLQf9OgRePUilNeVHmHPAj69hZU
	 5gk05DeRhXGOsu1B+9EG3bfs6Uj6gksdcYZU+HZlRoEtrxA1BMXvWYpaecuwj0b5xq
	 OGvHMcTIKhhMps/0rn/ZkSEeoPZstm4GWsO13KSbl/c/MBRvVRYiO1fF8NvRBfOj1v
	 LMy9PZS3B/sPg==
Date: Fri, 5 Jun 2026 12:17:50 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Shayne Chen <shayne.chen@mediatek.com>
Subject: Re: [PATCH] wifi: mt76: fix potential tx_retries underflow
Message-ID: <aiKiTk32PW3_0pDg@lore-desk>
References: <20260605024222.3388222-1-ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ic/8nm7vBVUL+Ixi"
Content-Disposition: inline
In-Reply-To: <20260605024222.3388222-1-ryder.lee@mediatek.com>
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


--ic/8nm7vBVUL+Ixi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> When FIELD_GET returns 0 for the retry count, subtracting 1 causes
> an unsigned integer underflow, resulting in tx_retries becoming a
> very large value (0xFFFFFFFF for u32 or 255 for u8).
>=20
> Fix by checking if count is non-zero before subtracting 1.
>=20
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

I guess we need proper Fixes tags here. Moreover, if you split this patch
in three separated patches you will make life easier for guys that do
backports :)

> ---
>  drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 10 +++++-----
>  drivers/net/wireless/mediatek/mt76/mt7921/mac.c |  5 +++--
>  drivers/net/wireless/mediatek/mt76/mt7925/mac.c |  5 +++--
>  drivers/net/wireless/mediatek/mt76/mt7996/mac.c |  6 +++---
>  4 files changed, 14 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/mac.c
> index cec2c4208..334c19ab2 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> @@ -912,16 +912,16 @@ mt7915_mac_tx_free(struct mt7915_dev *dev, void *da=
ta, int len)
>  		}
> =20
>  		if (!mtk_wed_device_active(&mdev->mmio.wed) && wcid) {
> -			u32 tx_retries =3D 0, tx_failed =3D 0;
> +			u32 tx_retries =3D 0, tx_failed =3D 0, count;
> =20
>  			if (v3 && (info & MT_TX_FREE_MPDU_HEADER_V3)) {
> -				tx_retries =3D
> -					FIELD_GET(MT_TX_FREE_COUNT_V3, info) - 1;
> +				count =3D FIELD_GET(MT_TX_FREE_COUNT_V3, info);
> +				tx_retries =3D count ? count - 1 : 0;

nit: I think it is more readable if you use a int for tx_retries and do
something like:
				tx_retries =3D max_t(int, tx_retries, 0);

This is valid even for below chunks.

Regards,
Lorenzo

>  				tx_failed =3D tx_retries +
>  					!!FIELD_GET(MT_TX_FREE_STAT_V3, info);
>  			} else if (!v3 && (info & MT_TX_FREE_MPDU_HEADER)) {
> -				tx_retries =3D
> -					FIELD_GET(MT_TX_FREE_COUNT, info) - 1;
> +				count =3D FIELD_GET(MT_TX_FREE_COUNT, info);
> +				tx_retries =3D count ? count - 1 : 0;
>  				tx_failed =3D tx_retries +
>  					!!FIELD_GET(MT_TX_FREE_STAT, info);
>  			}
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mac.c
> index 03b4960db..668bfa195 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> @@ -530,8 +530,9 @@ static void mt7921_mac_tx_free(struct mt792x_dev *dev=
, void *data, int len)
>  		stat =3D FIELD_GET(MT_TX_FREE_STATUS, info);
> =20
>  		if (wcid) {
> -			wcid->stats.tx_retries +=3D
> -				FIELD_GET(MT_TX_FREE_COUNT, info) - 1;
> +			u32 count =3D FIELD_GET(MT_TX_FREE_COUNT, info);
> +
> +			wcid->stats.tx_retries +=3D count ? count - 1 : 0;
>  			wcid->stats.tx_failed +=3D !!stat;
>  		}
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/mac.c
> index c47bd812b..c56a9e530 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
> @@ -1141,8 +1141,9 @@ mt7925_mac_tx_free(struct mt792x_dev *dev, void *da=
ta, int len)
> =20
>  		if (info & MT_TXFREE_INFO_HEADER) {
>  			if (wcid) {
> -				wcid->stats.tx_retries +=3D
> -					FIELD_GET(MT_TXFREE_INFO_COUNT, info) - 1;
> +				u32 count =3D FIELD_GET(MT_TXFREE_INFO_COUNT, info);
> +
> +				wcid->stats.tx_retries +=3D count ? count - 1 : 0;
>  				wcid->stats.tx_failed +=3D
>  					!!FIELD_GET(MT_TXFREE_INFO_STAT, info);
>  			}
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mac.c
> index a59c14c8f..3fad977ba 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> @@ -1361,13 +1361,13 @@ mt7996_mac_tx_free(struct mt7996_dev *dev, void *=
data, int len)
>  				cur_info++;
>  			continue;
>  		} else if (info & MT_TXFREE_INFO_HEADER) {
> -			u32 tx_retries =3D 0, tx_failed =3D 0;
> +			u32 tx_retries =3D 0, tx_failed =3D 0, count;
> =20
>  			if (!wcid)
>  				continue;
> =20
> -			tx_retries =3D
> -				FIELD_GET(MT_TXFREE_INFO_COUNT, info) - 1;
> +			count =3D FIELD_GET(MT_TXFREE_INFO_COUNT, info);
> +			tx_retries =3D count ? count - 1 : 0;
>  			tx_failed =3D tx_retries +
>  				!!FIELD_GET(MT_TXFREE_INFO_STAT, info);
> =20
> --=20
> 2.45.2
>=20
>=20

--ic/8nm7vBVUL+Ixi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaiKiTgAKCRA6cBh0uS2t
rOZaAP9hR3f52SqEmn8nienu5aMDF9bJPs2/bD60VTSUL1gQRgEAtgycPcdkTBxW
wd3woNrHhswyJl95AcOeLBFqOUefTQY=
=3Kcw
-----END PGP SIGNATURE-----

--ic/8nm7vBVUL+Ixi--

