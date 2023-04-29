Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4087FC77B7C
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Apr 2023 11:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZE0h0DcEAJL5LiOpSMfb1J7VmBH1Sr5fwQ0949oyNo0=; b=4pZKnY3F+N6AI9StqtxiPeLFYI
	Jg7lSv2w9PV1wWbCQt4fBP9wkHnCHnBnBYB82C/Ez9Ha0Nf70lxjclHpntyBsO/nS/YQJDumCehR9
	dItUwbTwPRONiNr3LqMeTRC7ALKqQgG6S1vPezJ+44y9/QSSG47dzlT6ke7RH6f5NSeupEKcFvefS
	Y85X6g2X3nZBF5hWxsgmrg9QRWHyq5NuPmXIQwQu1eARD1HGTLVQ7ZHb6iW2syd9VRWXPCpOPffVN
	1/eTcx9LZOY2520k62/MSZ02bpecZmzoNVbW17WqV/5dhGKeo9jdzNlQBsYDc+aGljpHjTbomorHz
	pFc3FGNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psib4-00Cgyg-25;
	Sat, 29 Apr 2023 11:18:34 +0000
Received: from vulcan.natalenko.name ([104.207.131.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psib0-00CgxR-02
	for linux-mediatek@lists.infradead.org;
	Sat, 29 Apr 2023 11:18:32 +0000
Received: from spock.localnet (unknown [83.148.33.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vulcan.natalenko.name (Postfix) with ESMTPSA id 8ED0512E6B67;
	Sat, 29 Apr 2023 13:18:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
	s=dkim-20170712; t=1682767101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE0h0DcEAJL5LiOpSMfb1J7VmBH1Sr5fwQ0949oyNo0=;
	b=VMb1I8bNBOzACCD3JTYnUFS0mAJJTsOmmqHEoSH9J3EKqfrEgXhI8B8tbh1vHEyMR52tES
	JEXwDm3E8HmWC7ZrU0ssoI74IiqyCmFdji2iNMV1JBIkAVCNrgNTnY2vOpw/3v10gHQAkm
	AxLKxWPDWnK8rIXfuaeTk/NYZQTTUT8=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Felix Fietkau <nbd@nbd.name>, MeiChia Chiu <MeiChia.Chiu@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 MeiChia Chiu <MeiChia.Chiu@mediatek.com>,
 Money Wang <Money.Wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>
Subject: Re: [PATCH v2] wifi: mt76: mt7915: remove BW160 and BW80+80 support
Date: Sat, 29 Apr 2023 13:18:19 +0200
Message-ID: <2313900.mqelP9QxOF@natalenko.name>
In-Reply-To: <20230104090352.31938-1-MeiChia.Chiu@mediatek.com>
References: <20230104090352.31938-1-MeiChia.Chiu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_041830_524532_999FA0A3 
X-CRM114-Status: GOOD (  19.82  )
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

Hello.

On st=C5=99eda 4. ledna 2023 10:03:52 CEST MeiChia Chiu wrote:
> Remove BW160 and BW80+80 capability in mt7915.
>=20
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>
> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
> Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
> Signed-off-by: Money Wang<Money.Wang@mediatek.com>
> Signed-off-by: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
> ---
> v2: update commit message and title
> ---
>  .../net/wireless/mediatek/mt76/mt7915/init.c  | 38 +++++--------------
>  1 file changed, 9 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7915/init.c
> index 571c94835942..c72d673f02dd 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> @@ -38,8 +38,7 @@ static const struct ieee80211_iface_combination if_comb=
[] =3D {
>  				       BIT(NL80211_CHAN_WIDTH_20) |
>  				       BIT(NL80211_CHAN_WIDTH_40) |
>  				       BIT(NL80211_CHAN_WIDTH_80) |
> -				       BIT(NL80211_CHAN_WIDTH_160) |
> -				       BIT(NL80211_CHAN_WIDTH_80P80),
> +				       BIT(NL80211_CHAN_WIDTH_160),
>  	}
>  };
> =20
> @@ -394,11 +393,6 @@ mt7915_init_wiphy(struct mt7915_phy *phy)
>  			phy->mt76->sband_5g.sband.vht_cap.cap |=3D
>  				IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_7991 |
>  				IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK;
> -
> -			if (!dev->dbdc_support)
> -				phy->mt76->sband_5g.sband.vht_cap.cap |=3D
> -					IEEE80211_VHT_CAP_SHORT_GI_160 |
> -					IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ;
>  		} else {
>  			phy->mt76->sband_5g.sband.vht_cap.cap |=3D
>  				IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_11454 |
> @@ -834,13 +828,9 @@ mt7915_set_stream_he_txbf_caps(struct mt7915_phy *ph=
y,
>  	int sts =3D hweight8(phy->mt76->chainmask);
>  	u8 c, sts_160 =3D sts;
> =20
> -	/* Can do 1/2 of STS in 160Mhz mode for mt7915 */
> -	if (is_mt7915(&dev->mt76)) {
> -		if (!dev->dbdc_support)
> -			sts_160 /=3D 2;
> -		else
> -			sts_160 =3D 0;
> -	}
> +	/* mt7915 doesn't support bw160 */
> +	if (is_mt7915(&dev->mt76))
> +		sts_160 =3D 0;
> =20
>  #ifdef CONFIG_MAC80211_MESH
>  	if (vif =3D=3D NL80211_IFTYPE_MESH_POINT)
> @@ -894,9 +884,6 @@ mt7915_set_stream_he_txbf_caps(struct mt7915_phy *phy,
>  	elem->phy_cap_info[3] |=3D IEEE80211_HE_PHY_CAP3_SU_BEAMFORMER;
>  	elem->phy_cap_info[4] |=3D IEEE80211_HE_PHY_CAP4_MU_BEAMFORMER;
> =20
> -	/* num_snd_dim
> -	 * for mt7915, max supported sts is 2 for bw > 80MHz and 0 if dbdc
> -	 */
>  	c =3D FIELD_PREP(IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_UNDER_80M=
HZ_MASK,
>  		       sts - 1);
>  	if (sts_160)
> @@ -944,15 +931,10 @@ mt7915_init_he_caps(struct mt7915_phy *phy, enum nl=
80211_band band,
>  	int i, idx =3D 0, nss =3D hweight8(phy->mt76->antenna_mask);
>  	u16 mcs_map =3D 0;
>  	u16 mcs_map_160 =3D 0;
> -	u8 nss_160;
> +	u8 nss_160 =3D nss;
> =20
> -	if (!is_mt7915(&dev->mt76))
> -		nss_160 =3D nss;
> -	else if (!dev->dbdc_support)
> -		/* Can do 1/2 of NSS streams in 160Mhz mode for mt7915 */
> -		nss_160 =3D nss / 2;
> -	else
> -		/* Can't do 160MHz with mt7915 dbdc */
> +	/* Can't do 160MHz with mt7915 */
> +	if (is_mt7915(&dev->mt76))
>  		nss_160 =3D 0;
> =20
>  	for (i =3D 0; i < 8; i++) {
> @@ -1002,8 +984,7 @@ mt7915_init_he_caps(struct mt7915_phy *phy, enum nl8=
0211_band band,
>  		else if (nss_160)
>  			he_cap_elem->phy_cap_info[0] =3D
>  				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G |
> -				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G |
> -				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G;
> +				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G;
>  		else
>  			he_cap_elem->phy_cap_info[0] =3D
>  				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G;
> @@ -1075,12 +1056,11 @@ mt7915_init_he_caps(struct mt7915_phy *phy, enum =
nl80211_band band,
>  			break;
>  		}
> =20
> +		memset(he_mcs, 0, sizeof(*he_mcs));
>  		he_mcs->rx_mcs_80 =3D cpu_to_le16(mcs_map);
>  		he_mcs->tx_mcs_80 =3D cpu_to_le16(mcs_map);
>  		he_mcs->rx_mcs_160 =3D cpu_to_le16(mcs_map_160);
>  		he_mcs->tx_mcs_160 =3D cpu_to_le16(mcs_map_160);
> -		he_mcs->rx_mcs_80p80 =3D cpu_to_le16(mcs_map_160);
> -		he_mcs->tx_mcs_80p80 =3D cpu_to_le16(mcs_map_160);
> =20
>  		mt7915_set_stream_he_txbf_caps(phy, he_cap, i);

I was negatively surprised by this as I had `VHT160-80PLUS80` in my hostapd=
 config file, and the AP worked just fine, and stopped working after upgrad=
ing the machine to v6.3.

I do understand that the chip doesn't support 80+80, and my AP just works i=
n VHT160 mode, so replacing `VHT160-80PLUS80` with `VHT160` in the config f=
ixed the issue for me. Thanks for bringing BW160 back later in c2f73eacee3b.

But I do want to point out that the commit message should explain the reaso=
n for removal. Also, I'm one of those users of:

```
01:00.0 Unclassified device [0002]: MEDIATEK Corp. MT7915E 802.11ax PCI Exp=
ress Wireless Network Adapter
```

for whom BW160 works just fine.

Thanks.

=2D-=20
Oleksandr Natalenko (post-factum)



