Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 805A8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 08:59:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 478836023D
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 08:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 478836023D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nCBEcmPGoUMOxKgWuDdH3zUreRKWWdbiDWJeGfsJTA=; b=1kvL6fzFas3Dfkw6vSatyjsfvx
	XzYgDJbtvSSb0nvC6DPi42IgroSbWfDFkYucJimPb/v3dY++XsgSlFYCrVMFDBUzPRzV6shrqMYfm
	lNXqFBesFhxMh4lPPoxvCFIKj0+y3I6vQEm3eUNshIt1OZ9gVNRQDeIK6T8PanR2ebsGx+6/PJ55h
	shihy6TGEiGB03T+8ZZGBGKI7I9QgdPxbk7adO/LAg6OHX/CECJsAl/SYtck8unHkJgO/f6+UVDw/
	VdYaMbmVupbK/Z2l5AkIq55Jmvg5L2d96u1Yfa9Wfl5Q7SwKV0Xw/9yqiBnK0yPs1knD3s5ghXslW
	UCMST63Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg1FX-007KYn-W3; Thu, 28 Oct 2021 08:59:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg1FV-007KYG-Be
 for linux-mediatek@lists.infradead.org; Thu, 28 Oct 2021 08:59:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8FF3A61056;
 Thu, 28 Oct 2021 08:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635411541;
 bh=8SOrFqh6ahUH4xgUJc5/8K1+D/mt3bVDVU4QkfArC4M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W7RNeFPOYC08QmFZKVNN+TPKZwZBa4YIYKr7P3z9y8hyRcmlmCMuXw5f2o7TlNgYD
 KIwqN4htm46Y2hPQQWYURLZHKQczbHpXuPt7ZDdyI9hn89sY7lsKuTN7y4WXcRorG6
 8VRprlOfc86uhjHlOdBvWwbxv/7FzdRdvqLa3sJ7gKF43zAqvCniZG2a39mneogEif
 FszGY261wJFBFJuFOYUJK+NOKAjH7r/jq0puFrSg/kYE2ggIPWab5hUXFu/7hSIyqC
 1cc93X9QsxKQxOJjeSe2fxtUQdRT2M/7C8jyrGV5K/vENy5PmXdA15MJYuZHMJdRa1
 Mt9fdK0re8HrQ==
Date: Thu, 28 Oct 2021 10:58:57 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Bo Jiao <bo.jiao@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 06/11] mt76: mt7915: enlarge wcid size to 544
Message-ID: <YXpmUTtEu4JrshpY@lore-desk>
References: <cover.1635323366.git.Bo.Jiao@mediatek.com>
 <c4c83998a000a6bbbfbbe9d9f179a73e8d6b4e25.1635323366.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <c4c83998a000a6bbbfbbe9d9f179a73e8d6b4e25.1635323366.git.Bo.Jiao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_015901_467205_3F24D798 
X-CRM114-Status: GOOD (  17.50  )
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
Content-Type: multipart/mixed; boundary="===============0850487234932287895=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0850487234932287895==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sIDnMYqbS7oJp422"
Content-Disposition: inline


--sIDnMYqbS7oJp422
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Bo Jiao <Bo.Jiao@mediatek.com>
>=20
> The mt7916 can support up to 544 wcid entries.
> This is an intermediate patch to add mt7916 support.
>=20
> Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
> Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
> Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76.h          | 2 +-
>  drivers/net/wireless/mediatek/mt76/mt7915/init.c   | 2 +-
>  drivers/net/wireless/mediatek/mt76/mt7915/mac.c    | 2 +-
>  drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h | 8 +++++++-
>  4 files changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wire=
less/mediatek/mt76/mt76.h
> index ce687d5..0f1197e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -225,7 +225,7 @@ enum mt76_wcid_flags {
>  	MT_WCID_FLAG_HDR_TRANS,
>  };
> =20
> -#define MT76_N_WCIDS 288
> +#define MT76_N_WCIDS 544

is this change ok with older chipset as well?

Regards,
Lorenzo

> =20
>  /* stored in ieee80211_tx_info::hw_queue */
>  #define MT_TX_HW_QUEUE_EXT_PHY		BIT(3)
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7915/init.c
> index 8d16c96..4dfa1c1 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> @@ -430,7 +430,7 @@ static void mt7915_mac_init(struct mt7915_dev *dev)
>  	/* enable hardware de-agg */
>  	mt76_set(dev, MT_MDP_DCR0, MT_MDP_DCR0_DAMSDU_EN);
> =20
> -	for (i =3D 0; i < MT7915_WTBL_SIZE; i++)
> +	for (i =3D 0; i < mt7915_wtbl_size(dev); i++)
>  		mt7915_mac_wtbl_update(dev, i,
>  				       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
>  	for (i =3D 0; i < 2; i++)
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/mac.c
> index ba39f3d..4212dbb 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> @@ -1492,7 +1492,7 @@ static void mt7915_mac_add_txs(struct mt7915_dev *d=
ev, void *data)
>  	if (pid < MT_PACKET_ID_FIRST)
>  		return;
> =20
> -	if (wcidx >=3D MT7915_WTBL_SIZE)
> +	if (wcidx >=3D mt7915_wtbl_size(dev))
>  		return;
> =20
>  	rcu_read_lock();
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers=
/net/wireless/mediatek/mt76/mt7915/mt7915.h
> index 3e2e900..e8fbe69 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
> @@ -12,7 +12,8 @@
>  #define MT7915_MAX_INTERFACES		19
>  #define MT7915_MAX_WMM_SETS		4
>  #define MT7915_WTBL_SIZE		288
> -#define MT7915_WTBL_RESERVED		(MT7915_WTBL_SIZE - 1)
> +#define MT7916_WTBL_SIZE		544
> +#define MT7915_WTBL_RESERVED		(mt7915_wtbl_size(dev) - 1)
>  #define MT7915_WTBL_STA			(MT7915_WTBL_RESERVED - \
>  					 MT7915_MAX_INTERFACES)
> =20
> @@ -477,6 +478,11 @@ static inline bool is_mt7915(struct mt76_dev *dev)
>  	return mt76_chip(dev) =3D=3D 0x7915;
>  }
> =20
> +static inline u16 mt7915_wtbl_size(struct mt7915_dev *dev)
> +{
> +	return is_mt7915(&dev->mt76) ? MT7915_WTBL_SIZE : MT7916_WTBL_SIZE;
> +}
> +
>  void mt7915_dual_hif_set_irq_mask(struct mt7915_dev *dev, bool write_reg,
>  				  u32 clear, u32 set);
> =20
> --=20
> 2.18.0
>=20

--sIDnMYqbS7oJp422
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYXpmUQAKCRA6cBh0uS2t
rAR1AP47ell8fA8Utj87vGHWWGWemeaRTTykOJAY+p3Jdh8AigEAnLiqLdKXug9r
uC6mC3H88NEu8dXRpNgNEWfYNN/oaAM=
=VBSX
-----END PGP SIGNATURE-----

--sIDnMYqbS7oJp422--


--===============0850487234932287895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0850487234932287895==--

