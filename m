Return-Path: <SRS0=AnEI=KU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66502C2B9F8
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 07:22:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BF4761417
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 07:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BF4761417
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qaA/TVjWfiZAYVj6d7iXWdH3H3oof1toElnBnOzEe9M=; b=p4CPZvnXeosCt+eJtY+vIjvh/f
	/HtshAwGZFmJuWN3yDE3zIjUjWEXBoYXHtOHOELif5ZFokGCzY5x+JN+faoCqBlhLkOs4LTReH4T1
	NKCGntMePbTvTGJyb9EUqwXPbtkgk/029VbbyPhFuL2asJa0goh25cSVM6bWNXS2sePYw0VB1165I
	fPUUxXU8f1pWXeGmB3tDngChg0oflk783pk3B8AU7MvslTPTC0IH/w/76Vc/56EaTK+7RzuV74OjV
	XxhU+CH458m7kIR39N869sZT0J9n0weH8pubv3MY+dBd4lsMF/F9iGPUzH5Tw0//Qf+k1/uPeJu9p
	n/ERLmZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llROL-003qwI-Ba; Tue, 25 May 2021 07:22:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llROG-003qsc-V2
 for linux-mediatek@lists.infradead.org; Tue, 25 May 2021 07:22:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4275461419;
 Tue, 25 May 2021 07:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621927331;
 bh=X7hgZHP/IBBoc9t1YcUOEAbT6M0Uir+oRFRiQUeix6Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cq+FNJi5YBLgGyjMxT8AHpJvhLl0fehcWkKL2hABwvB6aJn5MwcTzPouwq3hnxGkQ
 9b8XTKT2aYc2NaZkwqO0eAfzJeTqzaSeZySCrydE5MO6fmAIHRqqinJ7ZRZAUPacw9
 sLUC/q5l6aQ69QO5uyTSATJsvWMqEsksvQBf7zA3zI+l/DwxXPFfCvmnlhAMPvYiBp
 lNUUymO4d1hNZmqn9dkmQ5k/at/PSfo172UCyP9cyPLI69WixPw9HWYEKbnF1dCxYD
 PcHHHUg7qhwCNYZYN9JYORZHH8hYQ9SKmEsRLDGY9MdRsmozqjoFRM/Hu0r/6pjCEA
 OT6Ly/+NTU49A==
Date: Tue, 25 May 2021 09:22:06 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mt76: mt7915: use mt7915_mcu_get_txpower_sku() to get
 per-rate txpower
Message-ID: <YKylnox6YrOLgo7M@lore-desk>
References: <20210525043312.12623-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20210525043312.12623-1-shayne.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_002213_118319_29AC97B4 
X-CRM114-Status: GOOD (  19.83  )
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
Content-Type: multipart/mixed; boundary="===============3527878449878226342=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3527878449878226342==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VkN8laLagn6cSNMO"
Content-Disposition: inline


--VkN8laLagn6cSNMO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Get per-rate txpower with mcu command instead of frequently access tmac
> power registers from driver.

Hi Shayne,

just out of curiosity, what is the advantage of doing so?

Regards,
Lorenzo
>=20
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> ---
>  .../wireless/mediatek/mt76/mt7915/debugfs.c   | 48 ++++---------------
>  .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 35 +++++++++++++-
>  .../wireless/mediatek/mt76/mt7915/mt7915.h    |  3 ++
>  .../net/wireless/mediatek/mt76/mt7915/regs.h  |  5 --
>  4 files changed, 46 insertions(+), 45 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/driver=
s/net/wireless/mediatek/mt76/mt7915/debugfs.c
> index 6a8ddee..42a829d 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
> @@ -308,53 +308,23 @@ mt7915_puts_rate_txpower(struct seq_file *s, struct=
 mt7915_phy *phy)
>  		"RU484/SU40", "RU996/SU80", "RU2x996/SU160"
>  	};
>  	struct mt7915_dev *dev =3D dev_get_drvdata(s->private);
> -	bool ext_phy =3D phy !=3D &dev->phy;
> -	u32 reg_base;
> -	int i, idx =3D 0;
> +	s8 txpower[MT7915_SKU_RATE_NUM], *buf;
> +	int i;
> =20
>  	if (!phy)
>  		return;
> =20
> -	reg_base =3D MT_TMAC_FP0R0(ext_phy);
> -	seq_printf(s, "\nBand %d\n", ext_phy);
> +	seq_printf(s, "\nBand %d\n", phy !=3D &dev->phy);
> =20
> -	for (i =3D 0; i < ARRAY_SIZE(mt7915_sku_group_len); i++) {
> -		u8 cnt, mcs_num =3D mt7915_sku_group_len[i];
> -		s8 txpower[12];
> -		int j;
> +	mt7915_mcu_get_txpower_sku(phy, txpower, sizeof(txpower));
> +	for (i =3D 0, buf =3D txpower; i < ARRAY_SIZE(mt7915_sku_group_len); i+=
+) {
> +		u8 mcs_num =3D mt7915_sku_group_len[i];
> =20
> -		if (i =3D=3D SKU_HT_BW20 || i =3D=3D SKU_HT_BW40) {
> -			mcs_num =3D 8;
> -		} else if (i >=3D SKU_VHT_BW20 && i <=3D SKU_VHT_BW160) {
> +		if (i >=3D SKU_VHT_BW20 && i <=3D SKU_VHT_BW160)
>  			mcs_num =3D 10;
> -		} else if (i =3D=3D SKU_HE_RU26) {
> -			reg_base =3D MT_TMAC_FP0R18(ext_phy);
> -			idx =3D 0;
> -		}
> -
> -		for (j =3D 0, cnt =3D 0; j < DIV_ROUND_UP(mcs_num, 4); j++) {
> -			u32 val;
> -
> -			if (i =3D=3D SKU_VHT_BW160 && idx =3D=3D 60) {
> -				reg_base =3D MT_TMAC_FP0R15(ext_phy);
> -				idx =3D 0;
> -			}
> -
> -			val =3D mt76_rr(dev, reg_base + (idx / 4) * 4);
> -
> -			if (idx && idx % 4)
> -				val >>=3D (idx % 4) * 8;
> -
> -			while (val > 0 && cnt < mcs_num) {
> -				s8 pwr =3D FIELD_GET(MT_TMAC_FP_MASK, val);
> -
> -				txpower[cnt++] =3D pwr;
> -				val >>=3D 8;
> -				idx++;
> -			}
> -		}
> =20
> -		mt76_seq_puts_array(s, sku_group_name[i], txpower, mcs_num);
> +		mt76_seq_puts_array(s, sku_group_name[i], buf, mcs_num);
> +		buf +=3D mt7915_sku_group_len[i];
>  	}
>  }
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/mcu.c
> index dcf2d4d..52671cc 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> @@ -3514,7 +3514,6 @@ int mt7915_mcu_get_tx_rate(struct mt7915_dev *dev, =
u32 cmd, u16 wlan_idx)
> =20
>  int mt7915_mcu_set_txpower_sku(struct mt7915_phy *phy)
>  {
> -#define MT7915_SKU_RATE_NUM		161
>  	struct mt7915_dev *dev =3D phy->dev;
>  	struct mt76_phy *mphy =3D phy->mt76;
>  	struct ieee80211_hw *hw =3D mphy->hw;
> @@ -3564,6 +3563,40 @@ int mt7915_mcu_set_txpower_sku(struct mt7915_phy *=
phy)
>  				 sizeof(req), true);
>  }
> =20
> +int mt7915_mcu_get_txpower_sku(struct mt7915_phy *phy, s8 *txpower, int =
len)
> +{
> +#define RATE_POWER_INFO	2
> +	struct mt7915_dev *dev =3D phy->dev;
> +	bool ext_phy =3D phy !=3D &dev->phy;
> +	struct {
> +		u8 format_id;
> +		u8 category;
> +		u8 band;
> +		u8 _rsv;
> +	} __packed req =3D {
> +		.format_id =3D 7,
> +		.category =3D RATE_POWER_INFO,
> +		.band =3D ext_phy,
> +	};
> +	s8 res[MT7915_SKU_RATE_NUM][2];
> +	struct sk_buff *skb;
> +	int ret, i;
> +
> +	ret =3D mt76_mcu_send_and_get_msg(&dev->mt76,
> +					MCU_EXT_CMD(TX_POWER_FEATURE_CTRL),
> +					&req, sizeof(req), true, &skb);
> +	if (ret)
> +		return ret;
> +
> +	memcpy(res, skb->data + 4, sizeof(res));
> +	for (i =3D 0; i < len; i++)
> +		txpower[i] =3D res[i][ext_phy];
> +
> +	dev_kfree_skb(skb);
> +
> +	return 0;
> +}
> +
>  int mt7915_mcu_set_test_param(struct mt7915_dev *dev, u8 param, bool tes=
t_mode,
>  			      u8 en)
>  {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers=
/net/wireless/mediatek/mt76/mt7915/mt7915.h
> index c4bf8ed..1f7e57d 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
> @@ -38,6 +38,8 @@
>  #define MT7915_5G_RATE_DEFAULT		0x4b	/* OFDM 6M */
>  #define MT7915_2G_RATE_DEFAULT		0x0	/* CCK 1M */
> =20
> +#define MT7915_SKU_RATE_NUM		161
> +
>  struct mt7915_vif;
>  struct mt7915_sta;
>  struct mt7915_dfs_pulse;
> @@ -343,6 +345,7 @@ int mt7915_mcu_set_rts_thresh(struct mt7915_phy *phy,=
 u32 val);
>  int mt7915_mcu_set_pm(struct mt7915_dev *dev, int band, int enter);
>  int mt7915_mcu_set_sku_en(struct mt7915_phy *phy, bool enable);
>  int mt7915_mcu_set_txpower_sku(struct mt7915_phy *phy);
> +int mt7915_mcu_get_txpower_sku(struct mt7915_phy *phy, s8 *txpower, int =
len);
>  int mt7915_mcu_set_txbf_type(struct mt7915_dev *dev);
>  int mt7915_mcu_set_txbf_module(struct mt7915_dev *dev);
>  int mt7915_mcu_set_txbf_sounding(struct mt7915_dev *dev);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/n=
et/wireless/mediatek/mt76/mt7915/regs.h
> index 48e4b22..ee525e7 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
> @@ -82,11 +82,6 @@
>  #define MT_TMAC_CTCR0_INS_DDLMT_EN		BIT(17)
>  #define MT_TMAC_CTCR0_INS_DDLMT_VHT_SMPDU_EN	BIT(18)
> =20
> -#define MT_TMAC_FP0R0(_band)		MT_WF_TMAC(_band, 0x020)
> -#define MT_TMAC_FP0R15(_band)		MT_WF_TMAC(_band, 0x080)
> -#define MT_TMAC_FP0R18(_band)		MT_WF_TMAC(_band, 0x270)
> -#define MT_TMAC_FP_MASK			GENMASK(7, 0)
> -
>  #define MT_TMAC_TFCR0(_band)		MT_WF_TMAC(_band, 0x1e0)
> =20
>  #define MT_WF_DMA_BASE(_band)		((_band) ? 0xa1e00 : 0x21e00)
> --=20
> 2.18.0
>=20

--VkN8laLagn6cSNMO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYKylmgAKCRA6cBh0uS2t
rCKaAP0SkqEfaDBxrpNaKcpFuScYfBn2cpQH5nMB4mu/QdZoFgEA6+TBxrfqj7Bx
4GK0ooXE+Neg0YxczVun8PCd7UU/Wws=
=IDED
-----END PGP SIGNATURE-----

--VkN8laLagn6cSNMO--


--===============3527878449878226342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3527878449878226342==--

