Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36551C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 07:35:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0ED760E78
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 07:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0ED760E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+3zxlOBCcmazhoP5SaNH1BPVhwFyt1jXYtw03Wf7II=; b=T1Z/0sCBLgmvWJmmFT6KxM6xxH
	WwxRKVnAgLWGAAPaLU3AWIX2I7Hqcwa3jmNnYYbkI7hPUUhCDgl8/XEGyCR0EVxDABgiSUhs7EU4q
	Tb8cS+5cByAWZOxkGo0tcCGtIoBK2nVfzIjFl/OwHuIOKgoQgTLkUWcqztkcsarf2EIG9E56JQgbU
	mblkKqbpwmB+xW+PijCstEDxdJWUu/7b91OBkYez5Xu26ggM+0R8anVHJ2zjRxQop+QSWY9E4iCX2
	GV7O1QYxuP2phPJKTkA5vLv/LzCMmjWGAbSQMlteAkQSNr6Zqbbd6i7F0fYck940rsdsyiitKrb15
	C5mst07Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8e68-00HO0P-U3; Wed, 28 Jul 2021 07:35:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8e64-00HNzV-Vj
 for linux-mediatek@lists.infradead.org; Wed, 28 Jul 2021 07:35:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61FCF60F91;
 Wed, 28 Jul 2021 07:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627457719;
 bh=G0rWKfDaNY22lUY/PXw1Ue16UDla1YpF0to/w+YJYmA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C2X0/92gKczgOgV7pr5CmsjZMi1pWRCH+2iEAXHzB5YcT/OxKjWy8EgiDdyhVpXcQ
 jYCa2fBHumQM0TdDUWtF7VO07J9QfBT7jZWKO1S2sBC8F5hnlHcQxaZdV1QmroSj0c
 wrDFpAOtbrZLtOVi3Yw+sxYvc8bacaEVFvOfbJivpkjjQTJewgaTgF+wWDhNiUhOkx
 WMHbflBIV+x5jGazWuFktjoTmvHq5jGMikf2lPNaMnrULd5hdI+rJOyhTb1TLQBG9y
 zYgnnFnY8kuHcyHStsnS2yGhlCdUjvC8YEYntQ6FDIBsLSoyhTWH7S6L1rW+IoNv5e
 VRwSojRIAne1w==
Date: Wed, 28 Jul 2021 09:35:15 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com,
 YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com,
 km.lin@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, jemele@google.com, yenlinlai@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] mt76: connac: add support maximum regulatory Tx power
Message-ID: <YQEIs876ksTVjIl0@lore-desk>
References: <1627426757-14811-1-git-send-email-sean.wang@mediatek.com>
 <1627426757-14811-2-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1627426757-14811-2-git-send-email-sean.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_003521_100288_1FEB47CD 
X-CRM114-Status: GOOD (  19.47  )
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
Content-Type: multipart/mixed; boundary="===============1483824277503331092=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1483824277503331092==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HD5cfJbB7Qv0wneP"
Content-Disposition: inline


--HD5cfJbB7Qv0wneP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: YN Chen <YN.Chen@mediatek.com>
>=20
> Consider .max_reg_power in struct ieee80211_channel to limit the
> maximum power the wireless device allowed to transmit on the
> corresponding channel according to the regulatory domain.
>=20
> Co-developed-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: YN Chen <YN.Chen@mediatek.com>
> ---
>  .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 43 ++++++++++++++++++-
>  1 file changed, 41 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index d71393b1c5e6..84f42ce12626 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> @@ -1773,6 +1773,43 @@ static s8 mt76_connac_get_sar_power(struct mt76_ph=
y *phy,
>  	return target_power;
>  }
> =20
> +static s8 mt76_connac_get_ch_power(struct mt76_phy *phy,
> +				   struct ieee80211_channel *chan,
> +				   s8 target_power)
> +{
> +	struct mt76_dev *dev =3D phy->dev;

is it used?

> +	struct ieee80211_supported_band *sband;
> +	int i;
> +
> +	switch (chan->band) {
> +	case NL80211_BAND_2GHZ:
> +		sband =3D &phy->sband_2g.sband;
> +		break;
> +	case NL80211_BAND_5GHZ:
> +		sband =3D &phy->sband_5g.sband;
> +		break;
> +	default:
> +		return target_power;
> +	}
> +
> +	for (i =3D 0; i < sband->n_channels; i++) {
> +		struct ieee80211_channel *ch =3D &sband->channels[i];
> +
> +		if (ch->hw_value =3D=3D chan->hw_value) {
> +			if (!(ch->flags & IEEE80211_CHAN_DISABLED)) {
> +				int power =3D 2 * ch->max_reg_power;
> +
> +				if (power > 127 || power < -127)
> +					power =3D 127;

please correct me if I am wrong, but I guess the limit for mt7663 should be=
 63,
isn't it?

Regards,
Lorenzo

> +				target_power =3D min_t(s8, power, target_power);
> +			}
> +			break;
> +		}
> +	}
> +
> +	return target_power;
> +}
> +
>  static int
>  mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
>  				  enum nl80211_band band)
> @@ -1840,10 +1877,12 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy=
 *phy,
>  				.hw_value =3D ch_list[idx],
>  				.band =3D band,
>  			};
> -			s8 sar_power;
> +			s8 reg_power, sar_power;
> =20
> +			reg_power =3D mt76_connac_get_ch_power(phy, &chan,
> +							     tx_power);
>  			sar_power =3D mt76_connac_get_sar_power(phy, &chan,
> -							      tx_power);
> +							      reg_power);
> =20
>  			mt76_get_rate_power_limits(phy, &chan, &limits,
>  						   sar_power);
> --=20
> 2.25.1
>=20

--HD5cfJbB7Qv0wneP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYQEIsAAKCRA6cBh0uS2t
rOt8AP95ov/z4ReB4ZY7fTytbfpDFkXdZwnkFTj4ewwteOrG/gD9GGC/FkHM7ZVY
kUBejtiUfKraUVcityNQO/PMzF83Qwo=
=cRqC
-----END PGP SIGNATURE-----

--HD5cfJbB7Qv0wneP--


--===============1483824277503331092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1483824277503331092==--

