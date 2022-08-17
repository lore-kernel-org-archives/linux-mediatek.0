Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D36EC25B08
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Aug 2022 07:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KAvjaKg+jtZOkBzc8KMcLoI64Zke64KXPcAraS5aV0=; b=t/Gnymd6/9StZIlAZlWWeNwb8J
	3RqSEjtoIvDGGbXlGrQLUKfaRAD+nj1SwL0HC/ZhdhcgGRUkdrrZvLbSqkcfnN+vsK3rfz4bQl1HQ
	0LzKPaOLl6ZRIJ7suNNxEE+nY2ojjpTpevL/IuK0RFUxzgOfzZ7afFCAuBzCLSs/OR5Sz8e3c8sqy
	HB9QoaRtrM9xVg6yjRaz9Ff031EwxGyAiwhc1wbalFeoMCgvJdTEhAEMlFtS9ybPxslUQjqdnOcmR
	wTGeyteUfLOsjwD0DlHTOLjD4jhMKyrm5HphDJgBK1uzVOmGxsIh+rmzUQN0TYpn+abiJKA8K2s/E
	p3onahFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oODHL-00CyhA-Rz; Wed, 17 Aug 2022 07:15:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oODHI-00CyaA-IH
	for linux-mediatek@lists.infradead.org; Wed, 17 Aug 2022 07:15:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F384E611E2;
	Wed, 17 Aug 2022 07:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC20C433D6;
	Wed, 17 Aug 2022 07:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660720547;
	bh=kUeje6ndYuhgNs+8vKzDETDexRxUhCASk08Esoi4VMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JwJ1SttOrG6Po9bSrHRJyco9EpwyNPHNqNi0mqdPeuzZEvtbRTLvT6z212U9UVCZR
	 VewhNsfsdVIbwQN5SlOInWhXiH+pF5CRkzRvtZc9pD3VSqyED1QcXkhnPA8cYNpCBC
	 /K5PQI6kniQQhP3xTuisFCualKACvIYecGjf9QB+jflOdH0St0MWZEwNZ6xuCFK9jj
	 G6oUlLowOS2QXYtwSqltaLjAoqe/JVcNoKct5gLbw+xFA52kqNjtlHfpe6mLyVC8RJ
	 bc+38+NLQCPpqdME2tvtHwSNlOhSSYV/rgCLrymtpZu8qrJpdt9FNSvOMBAKjS9pB/
	 t9JN48X6AiUKw==
Date: Wed, 17 Aug 2022 09:15:43 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com,
	YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
	Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com,
	km.lin@mediatek.com, jenhao.yang@mediatek.com,
	robin.chiu@mediatek.com, Eddie.Chen@mediatek.com,
	ch.yeh@mediatek.com, posh.sun@mediatek.com, ted.huang@mediatek.com,
	Stella.Chang@mediatek.com, Tom.Chou@mediatek.com,
	steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com,
	kuabhs@google.com, druth@google.com, abhishekpandit@google.com,
	shawnku@google.com, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Quan Zhou <quan.zhou@mediatek.com>,
	Kaikai Hu <kaikai.hu@mediatek.com>
Subject: Re: [PATCH 5/9] wifi: mt76: mt7921: add unified ROC cmd/event support
Message-ID: <YvyVn439t0z/Yzfy@lore-desk>
References: <cover.1660606893.git.objelf@gmail.com>
 <31abc0972859270b619b098bdcd02d4b8d5fdaa0.1660606893.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uK4OiO01CDmCqjHs"
Content-Disposition: inline
In-Reply-To: <31abc0972859270b619b098bdcd02d4b8d5fdaa0.1660606893.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_001548_724414_918633CA 
X-CRM114-Status: GOOD (  23.75  )
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


--uK4OiO01CDmCqjHs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 16, Sean Wang wrote:
> From: Quan Zhou <quan.zhou@mediatek.com>
>=20
> Add unified ROC cmd/event which is only supported by the newer fw.
>=20
> Co-developed-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Co-developed-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> Co-developed-by: Kaikai Hu <kaikai.hu@mediatek.com>
> Signed-off-by: Kaikai Hu <kaikai.hu@mediatek.com>
> Signed-off-by: Quan Zhou <quan.zhou@mediatek.com>
> ---
>  .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  10 +-
>  .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 119 ++++++++++++++++++
>  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  19 +++
>  3 files changed, 147 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> index 1fcc3e8c5380..f3c1e1dc574a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> @@ -114,11 +114,15 @@ struct mt76_connac2_mcu_rxd {
> =20
>  	u8 eid;
>  	u8 seq;
> -	u8 rsv[2];
> +	u8 option;
> +	u8 __rsv;
> +

nit: remove new line here and use 'u8 rsv' to be consistent with the rest of
the code.

> =20
>  	u8 ext_eid;
>  	u8 rsv1[2];
>  	u8 s2d_index;
> +
> +	u8 tlv[0];
>  };
> =20
>  struct mt76_connac2_patch_hdr {
> @@ -938,6 +942,9 @@ enum {
>  	DEV_INFO_MAX_NUM
>  };
> =20
> +#define MCU_UNI_CMD_EVENT                       BIT(1)
> +#define MCU_UNI_CMD_UNSOLICITED_EVENT           BIT(2)
> +
>  /* event table */
>  enum {
>  	MCU_EVENT_TARGET_ADDRESS_LEN =3D 0x01,
> @@ -1144,6 +1151,7 @@ enum {
>  	MCU_UNI_CMD_OFFLOAD =3D 0x06,
>  	MCU_UNI_CMD_HIF_CTRL =3D 0x07,
>  	MCU_UNI_CMD_SNIFFER =3D 0x24,
> +	MCU_UNI_CMD_ROC =3D 0x27,
>  };
> =20
>  enum {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mcu.c
> index da12d0ae0835..76c8afc00c24 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -275,6 +275,23 @@ mt7921_mcu_rx_unsolicited_event(struct mt7921_dev *d=
ev, struct sk_buff *skb)
>  	dev_kfree_skb(skb);
>  }
> =20
> +static void
> +mt7921_mcu_uni_rx_unsolicited_event(struct mt7921_dev *dev,
> +				    struct sk_buff *skb)
> +{
> +	struct mt76_connac2_mcu_rxd *rxd;
> +
> +	rxd =3D (struct mt76_connac2_mcu_rxd *)skb->data;
> +
> +	switch (rxd->eid) {
> +	case MCU_UNI_EVENT_ROC:
> +		break;
> +	default:
> +		break;
> +	}
> +	dev_kfree_skb(skb);
> +}
> +
>  void mt7921_mcu_rx_event(struct mt7921_dev *dev, struct sk_buff *skb)
>  {
>  	struct mt76_connac2_mcu_rxd *rxd;
> @@ -284,6 +301,11 @@ void mt7921_mcu_rx_event(struct mt7921_dev *dev, str=
uct sk_buff *skb)
> =20
>  	rxd =3D (struct mt76_connac2_mcu_rxd *)skb->data;
> =20
> +	if (rxd->option & MCU_UNI_CMD_UNSOLICITED_EVENT) {
> +		mt7921_mcu_uni_rx_unsolicited_event(dev, skb);
> +		return;
> +	}
> +
>  	if (rxd->eid =3D=3D 0x6) {
>  		mt76_mcu_rx_event(&dev->mt76, skb);
>  		return;
> @@ -521,6 +543,103 @@ int mt7921_mcu_set_tx(struct mt7921_dev *dev, struc=
t ieee80211_vif *vif)
>  				 &req_mu, sizeof(req_mu), false);
>  }
> =20
> +int mt7921_mcu_set_roc(struct mt7921_phy *phy, struct mt7921_vif *vif,
> +		       struct ieee80211_channel *chan, int duration,
> +		       enum mt7921_roc_req type, u8 token_id)
> +{
> +	int center_ch =3D ieee80211_frequency_to_channel(chan->center_freq);
> +	struct mt7921_dev *dev =3D phy->dev;
> +	struct {
> +		struct {
> +			u8 rsv[4];
> +		} __packed hdr;
> +		struct roc_acquire_tlv {
> +			__le16 tag;
> +			__le16 len;
> +			u8 bss_idx;
> +			u8 tokenid;
> +			u8 control_channel;
> +			u8 sco;
> +			u8 band;
> +			u8 bw;
> +			u8 center_chan;
> +			u8 center_chan2;
> +			u8 bw_from_ap;
> +			u8 center_chan_from_ap;
> +			u8 center_chan2_from_ap;
> +			u8 reqtype;
> +			__le32 maxinterval;
> +			u8 dbdcband;
> +			u8 rsv[3];
> +		} __packed roc;
> +	} __packed req =3D {
> +		.roc =3D {
> +			.tag =3D cpu_to_le16(UNI_ROC_ACQUIRE),
> +			.len =3D cpu_to_le16(sizeof(struct roc_acquire_tlv)),
> +			.tokenid =3D token_id,
> +			.reqtype =3D type,
> +			.maxinterval =3D cpu_to_le32(duration),
> +			.bss_idx =3D vif->mt76.idx,
> +			.control_channel =3D chan->hw_value,
> +			.bw =3D CMD_CBW_20MHZ,
> +			.bw_from_ap =3D CMD_CBW_20MHZ,
> +			.center_chan =3D center_ch,
> +			.center_chan_from_ap =3D center_ch,
> +			.dbdcband =3D 0xff, /* auto */
> +		},
> +	};
> +
> +	if (chan->hw_value < center_ch)
> +		req.roc.sco =3D 1; /* SCA */
> +	else if (chan->hw_value > center_ch)
> +		req.roc.sco =3D 3; /* SCB */
> +
> +	switch (chan->band) {
> +	case NL80211_BAND_6GHZ:
> +		req.roc.band =3D 3;
> +		break;
> +	case NL80211_BAND_5GHZ:
> +		req.roc.band =3D 2;
> +		break;
> +	default:
> +		req.roc.band =3D 1;
> +		break;
> +	}
> +
> +	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(ROC),
> +				 &req, sizeof(req), false);
> +}
> +
> +int mt7921_mcu_abort_roc(struct mt7921_phy *phy, struct mt7921_vif *vif,
> +			 u8 token_id)
> +{
> +	struct mt7921_dev *dev =3D phy->dev;
> +	struct {
> +		struct {
> +			u8 rsv[4];
> +		} __packed hdr;
> +		struct roc_abort_tlv {
> +			__le16 tag;
> +			__le16 len;
> +			u8 bss_idx;
> +			u8 tokenid;
> +			u8 dbdcband;
> +			u8 rsv[5];
> +		} __packed abort;
> +	} __packed req =3D {
> +		.abort =3D {
> +			.tag =3D cpu_to_le16(UNI_ROC_ABORT),
> +			.len =3D cpu_to_le16(sizeof(struct roc_abort_tlv)),
> +			.tokenid =3D token_id,
> +			.bss_idx =3D vif->mt76.idx,
> +			.dbdcband =3D 0xff, /* auto*/
> +		},
> +	};
> +
> +	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(ROC),
> +				 &req, sizeof(req), false);
> +}
> +
>  int mt7921_mcu_set_chan_info(struct mt7921_phy *phy, int cmd)
>  {
>  	struct mt7921_dev *dev =3D phy->dev;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers=
/net/wireless/mediatek/mt76/mt7921/mt7921.h
> index c161031ac62a..c9044d546e94 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> @@ -51,6 +51,20 @@
>  #define MT7921_SDIO_HDR_TX_BYTES	GENMASK(15, 0)
>  #define MT7921_SDIO_HDR_PKT_TYPE	GENMASK(17, 16)
> =20
> +#define MCU_UNI_EVENT_ROC  0x27
> +
> +enum {
> +	UNI_ROC_ACQUIRE,
> +	UNI_ROC_ABORT,
> +	UNI_ROC_NUM
> +};
> +
> +enum mt7921_roc_req {
> +	MT7921_ROC_REQ_JOIN,
> +	MT7921_ROC_REQ_ROC,
> +	MT7921_ROC_REQ_NUM
> +};
> +
>  enum mt7921_sdio_pkt_type {
>  	MT7921_SDIO_TXD,
>  	MT7921_SDIO_DATA,
> @@ -479,4 +493,9 @@ mt7921_init_acpi_sar_power(struct mt7921_phy *phy, bo=
ol set_default)
>  #endif
>  int mt7921_set_tx_sar_pwr(struct ieee80211_hw *hw,
>  			  const struct cfg80211_sar_specs *sar);
> +int mt7921_mcu_set_roc(struct mt7921_phy *phy, struct mt7921_vif *vif,
> +		       struct ieee80211_channel *chan, int duration,
> +		       enum mt7921_roc_req type, u8 token_id);
> +int mt7921_mcu_abort_roc(struct mt7921_phy *phy, struct mt7921_vif *vif,
> +			 u8 token_id);
>  #endif
> --=20
> 2.25.1
>=20

--uK4OiO01CDmCqjHs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYvyVnwAKCRA6cBh0uS2t
rCuhAP9MsTzYfGjqlqavFbHGgjzm+qAo9Z4UpzALA1DaHl6HuQD/aDJvSv4gVNE1
ELcID2s3yX6DxjNXb3ekzu5Ivn/L/QM=
=eDiS
-----END PGP SIGNATURE-----

--uK4OiO01CDmCqjHs--

