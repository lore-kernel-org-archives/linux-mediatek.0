Return-Path: <SRS0=uG8S=M4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05091C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 06:45:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3A1960EC0
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 06:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B3A1960EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTrHvPINd/YR7Cug1zFBpSwC40P4E874iasKbFSQV3A=; b=BPKaeouhUtt8dU8dHDsFvhSXkV
	V31Quqwr1VpOM5ZlOP+rRtClRRH2xvjYXrUvFnejBXyboLLB/SP0gPwhzoCjTKo+6yXtNCOh1aQkQ
	r0kN3pt0u9QGil/P1SrDmBnMONL6iO4D+IjFL3oI+tI9+18ZX81rqLuFOCl3i7Re/yGr++9iUJh+x
	GZIlv0z7prjJTNUYtIgvATXmTuf5d2EWg+ZUi8pqR5kjGtnzkokxpelzK1gVOI17fGmiIiniC6nja
	MEvUy+RFpR7/4/PQ2At7Ult0PLsd82JoWji4MUZ8RepO94InlxJtTo9aAmKPWgsgIsjKNTM5ykD1c
	lg3dqBAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBX88-008GyI-N6; Thu, 05 Aug 2021 06:45:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBX86-008Gxt-A4
 for linux-mediatek@lists.infradead.org; Thu, 05 Aug 2021 06:45:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 732A560462;
 Thu,  5 Aug 2021 06:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628145921;
 bh=M/GfuYHTix3waNbmYdkOqyUu+CmAGKSMK3fHOxTlX/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mSk8kwFfPxB3/4i5tTCbGii6wWBfTkP/zDyKlOPfYNNEaNXKImhldAFc7aaAJ8Hua
 v5G6O9EtCixcmjPRNtirLNWEs8dEqgs8GvI6mOrnSPxlUgpGztMrFhdyo3kgIZRI8a
 373t0ofmaS8EPXv7PQ8zJUYhXtWjykcOcC+ItdJnIKIfvETw1CpSoGEQpI/QhiNBeT
 /W1DwWKRzY3FcS56uOhcAbtzTklWV5qSAoSNQ4v8vCuaFeC2XcAC7TwIA87k629EFA
 adU1Nka68PYgElq2/vS48RRjzXPefFdCt3uWuRGkf+BCEz0z2oxmnvA5j5J2fZKWBL
 3gn1KGJveR3og==
Date: Thu, 5 Aug 2021 08:45:17 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com,
 YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com,
 km.lin@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, jemele@google.com, yenlinlai@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] mt76: connac: add support maximum regulatory Tx power
Message-ID: <YQuI/Zf8vYjKx9LR@lore-desk>
References: <e05024275119c517a4eb7e39bf249640db68d07d.1628115504.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <e05024275119c517a4eb7e39bf249640db68d07d.1628115504.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_234522_431299_2C824D25 
X-CRM114-Status: GOOD (  19.61  )
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
Content-Type: multipart/mixed; boundary="===============7882768254350244094=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7882768254350244094==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hxDLajrAgiBDpkcF"
Content-Disposition: inline


--hxDLajrAgiBDpkcF
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
> v2: consider the power limit that can be allowed on mt7663
> ---
>  .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 43 ++++++++++++++++++-
>  1 file changed, 41 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index d71393b1c5e6..80987af03efe 100644
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
> +				if (is_mt7663(dev) && (power > 63 || power < -64))
> +					power =3D 63;

I guess now you are missing the value for mt7921. What I mean is something
similar to mt76_connac_mcu_build_sku()

int max_power =3D is_mt7921(dev) ? 127 : 63;

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

--hxDLajrAgiBDpkcF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYQuI+gAKCRA6cBh0uS2t
rPB9AQDCnVhsbNJDEIyRTl1ack1ChpXMCi7BwkMYperDcFN2VQEAiyEnXDp5pw9d
1qugK0mBeoZ1WsgtJNNJNvVbMZGsXQI=
=AOvU
-----END PGP SIGNATURE-----

--hxDLajrAgiBDpkcF--


--===============7882768254350244094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7882768254350244094==--

