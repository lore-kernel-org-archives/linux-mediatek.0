Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4557C38159
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 16:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ov5wqGbWe4h37M5QW4tQbi+7/3gsF/xkhbs/pkJrkfA=; b=CsA0Db4aalWrcf1CsrJbB4mxb2
	+yATL/kWpJhc6luJzTOJdLAvZnGlj3lpqsxytiRN+BOmliKmOOmupST4rWXGWnir5wldZFZiti9Bj
	so2e+67p16/ig5+O1lUysTDeNi7BjGDfKsmnWq4DE0FlmavNXhaqvZOKmqgEaUGZYoJ0BWVmFcw5B
	Ip9VPWxnWM52KLDN5Dt1frxIStD//pyDktHYcNl0d81ERvz5JMfnGEWUNlCjueA5ExTXQsV8a+dkh
	bt7wQcMaOq19r7o3IDZrxXVP3F96ev5j/bg9PZFwil3EqYrOqpQpXpYV8IobpkNI2OsMmajvWIAB8
	WanstiWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIB4D-001mgZ-T1; Wed, 18 Jan 2023 16:13:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIB4B-001mfK-48
	for linux-mediatek@lists.infradead.org; Wed, 18 Jan 2023 16:13:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A0398618B8;
	Wed, 18 Jan 2023 16:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3636C433D2;
	Wed, 18 Jan 2023 16:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674058413;
	bh=KzPKGXPnXYOt358vnWUhJJgGbXzewwE0wiwFyChRPAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pqlMuPUs1rSqgu9V7AoGGTaxHdzuQNDhYekVWF9R8U7qtKFMJ9BqCzqlBA4kmFw5T
	 aAn2jfssrzYOZxt2fQO8H9gcZJIT6b03YcaTaMNgQFZe1wB+4vEW9CN0m3iqqGhVC7
	 E2eARM0nFxAoaVtGIHQVE1tDGKotQWgYeS5O871R/JaAjs7yFm3WKyRoFHQBBWmy3u
	 0X6V5FDvHLuoKvpAkyRrVFTYsPoNgsgg3vKztgxrmA9nrxVDnN1ZRYVG2P0gkZpSbb
	 54qeDf/YpRlYN3HqPaQyrpEnpY3CA26GalJsFRhItkJpcJ2i2hAT+6MYl7UGLA64/f
	 xdmREhRau8QWQ==
Date: Wed, 18 Jan 2023 17:13:29 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 06/13] wifi: mt76: add EHT rate stats for ethtool
Message-ID: <Y8gaqTqI/un8dgZd@lore-desk>
References: <20230109165731.682-1-shayne.chen@mediatek.com>
 <20230109165731.682-7-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="17+pKBupczAMysgX"
Content-Disposition: inline
In-Reply-To: <20230109165731.682-7-shayne.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_081335_279943_ECF298FE 
X-CRM114-Status: GOOD (  18.58  )
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


--17+pKBupczAMysgX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Add support to get EHT rate stats from ethtool.
> This is the preliminary patch to add EHT support for mt7996.
>=20
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76.h        | 2 +-
>  drivers/net/wireless/mediatek/mt76/mt7996/main.c | 6 ++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wire=
less/mediatek/mt76/mt76.h
> index b3fd3abfdd9f..3d3c68b9e1cf 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -272,7 +272,7 @@ enum mt76_phy_type {
> =20
>  struct mt76_sta_stats {
>  	u64 tx_mode[__MT_PHY_TYPE_MAX];
> -	u64 tx_bw[4];		/* 20, 40, 80, 160 */
> +	u64 tx_bw[5];		/* 20, 40, 80, 160, 320 */

Hi Shayne,

I think this change will break mt7915 ethtool support. In particular it will
break tx_bw for loop in mt76_ethtool_worker().

Regards,
Lorenzo

>  	u64 tx_nss[4];		/* 1, 2, 3, 4 */
>  	u64 tx_mcs[16];		/* mcs idx */
>  	u64 tx_bytes;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7996/main.c
> index c423b052e4f4..9ea2e1198477 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> @@ -1084,10 +1084,14 @@ static const char mt7996_gstrings_stats[][ETH_GST=
RING_LEN] =3D {
>  	"v_tx_mode_he_ext_su",
>  	"v_tx_mode_he_tb",
>  	"v_tx_mode_he_mu",
> +	"v_tx_mode_eht_su",
> +	"v_tx_mode_eht_trig",
> +	"v_tx_mode_eht_mu",
>  	"v_tx_bw_20",
>  	"v_tx_bw_40",
>  	"v_tx_bw_80",
>  	"v_tx_bw_160",
> +	"v_tx_bw_320",
>  	"v_tx_mcs_0",
>  	"v_tx_mcs_1",
>  	"v_tx_mcs_2",
> @@ -1100,6 +1104,8 @@ static const char mt7996_gstrings_stats[][ETH_GSTRI=
NG_LEN] =3D {
>  	"v_tx_mcs_9",
>  	"v_tx_mcs_10",
>  	"v_tx_mcs_11",
> +	"v_tx_mcs_12",
> +	"v_tx_mcs_13",
>  };
> =20
>  #define MT7996_SSTATS_LEN ARRAY_SIZE(mt7996_gstrings_stats)
> --=20
> 2.25.1
>=20

--17+pKBupczAMysgX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY8gaqQAKCRA6cBh0uS2t
rCjbAP9gamsCGrHCI7lRONjPAy30luSazvHeHFDCzXXxtwIDygEA7kk0hRdlqvZe
feHpFAfzcmJZ+zzwlnA6XyJkvOhfAgo=
=bmhD
-----END PGP SIGNATURE-----

--17+pKBupczAMysgX--

