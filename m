Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA29C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Dec 2021 21:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5W1RblCcgiReqC7eEsGz+2qpDDUqFSfAERopAIusqZA=; b=HhWkULJEXIVxFagYxEBCoMQupP
	BD3rklEggBha25q24J3fW+dRq3+gO6EfxezUi0e1Fym1E7NeLIbd+ZWj9D/le8coxXfTnYfyi18TW
	6yMwsQnfyghKovkyBbI0DyEWqFAJ83JG0j6WK1kxZTBuz5uU1lCNdRVef8xC9YgeXYmRRxVv2PFou
	MZHDkBAc9TOjfqiews8drMi7tynPo29u3tgO4eK9Tp51zdZthx1wbkmyuh7UcJJzWjuONrClHiSH5
	+XjmyrdqgaOl6nJDcfgX9f1M19JT6Pu1lt2IG3iGA7doeCwFOVZt6kgG4VkYlA4lTFM0A6uGoWvKO
	ZVR2lKvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0W3V-00DVRX-SO; Thu, 23 Dec 2021 21:55:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0W3S-00DVQZ-VJ
 for linux-mediatek@lists.infradead.org; Thu, 23 Dec 2021 21:55:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9D77C61F9F;
 Thu, 23 Dec 2021 21:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55DC2C36AE5;
 Thu, 23 Dec 2021 21:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640296515;
 bh=NwAHAzWkVhpvKi7Wfo4ukOyedvley1Ug2shyJU22PxE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R4l0IR6/vk6KRJi9GuAANoW0zxStx14mfDpfZ3Z573X41EbwGPtHFS+GnrNh2uDCb
 6q8RasSkLwHY88sRcWgEQf865aZTeHCIF1II2nxIyfW/CCb3sl+GvCD5DfyimydK+5
 na+bVlqCD+MlfrkufuVbggCY4NE+RW7hIoLQ0tC2jfmoadwkDBwv0td2D+1N0Cl7UX
 aO9Vyql7QhiCFD0mkdy0FisKOiUdwJq38b2qm1n5E4F/goJURTZPph3ZzNSJn+GVuf
 zL6ufOTO7uJ63yTY4HHGiYz9bUcxvLC3HxeqZaYZ37HMLjcjefTuSyRoRbgkmRwJ/C
 KNxp5uzujsyRA==
Date: Thu, 23 Dec 2021 22:55:11 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Bo Jiao <bo.jiao@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 1/1] mt76: add mt7916 to set wlan_idx_hi
Message-ID: <YcTwP6Hu5VoTMHEq@lore-desk>
References: <cover.1640175865.git.Bo.Jiao@mediatek.com>
 <5b82d68ee7c879591e22da51bfdb4af2e5fad228.1640175865.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <5b82d68ee7c879591e22da51bfdb4af2e5fad228.1640175865.git.Bo.Jiao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_135519_127014_F0B853A8 
X-CRM114-Status: GOOD (  17.78  )
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
Content-Type: multipart/mixed; boundary="===============3367264577878881093=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3367264577878881093==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ceznv8vUbhznFNWi"
Content-Disposition: inline


--ceznv8vUbhznFNWi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Bo Jiao <Bo.Jiao@mediatek.com>
>=20
> since mt7916 support up to 544 wcid entries,
> add it to set wlan_idx_hi.
>=20
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76_connac.h     | 5 +++++
>  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/n=
et/wireless/mediatek/mt76/mt76_connac.h
> index e999d71..8701f04 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> @@ -110,6 +110,11 @@ static inline bool is_mt7915(struct mt76_dev *dev)
>  	return mt76_chip(dev) =3D=3D 0x7915;
>  }
> =20
> +static inline bool is_mt7916(struct mt76_dev *dev)
> +{
> +	return mt76_chip(dev) =3D=3D 0x7906;
> +}
> +
>  static inline u8 mt76_connac_chan_bw(struct cfg80211_chan_def *chandef)
>  {
>  	static const u8 width_to_bw[] =3D {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> index edad583..fc9a084 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> @@ -1464,7 +1464,7 @@ mt76_connac_mcu_get_wlan_idx(struct mt76_dev *dev, =
struct mt76_wcid *wcid,
>  {
>  	*wlan_idx_hi =3D 0;
> =20
> -	if (is_mt7921(dev) || is_mt7915(dev)) {
> +	if (is_mt7921(dev) || is_mt7915(dev) || is_mt7916(dev)) {
>  		*wlan_idx_lo =3D wcid ? to_wcid_lo(wcid->idx) : 0;
>  		*wlan_idx_hi =3D wcid ? to_wcid_hi(wcid->idx) : 0;

I guess I have already included the fix here:
https://patchwork.kernel.org/project/linux-wireless/patch/df4d462f1ef4cfc1a=
e4f6482051a28a10c78262b.1640260901.git.lorenzo@kernel.org/

Regards,
Lorenzo

>  	} else {
> --=20
> 2.18.0
>=20

--ceznv8vUbhznFNWi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYcTwPwAKCRA6cBh0uS2t
rCPcAQCr/p0C/RnsjkSJjTopA5nKQTY2CUKmdRS//yflEvUnAAD/YuuBNRLO4D0L
8Sidc+yynctBR6QF5F+dvJUo2sUTzQg=
=6Ahn
-----END PGP SIGNATURE-----

--ceznv8vUbhznFNWi--


--===============3367264577878881093==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3367264577878881093==--

