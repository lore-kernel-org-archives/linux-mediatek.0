Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159D8C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Feb 2022 09:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBpMZMMgKs34DihUSTYqtf9mHWdhgwwLIRBYurOnNhk=; b=pfy2VwwH1/4kkScaPpnyk4+QKZ
	Ew0avgO4ZHykbJ/IzBJAu8bGFi9Dykfy0UuFk7niPi+vXzd2287XGwqJMNGQUh5I7VkaHA2aade5f
	wOsPKCj1h8tUw4s4bXn29mtsw4dJBfHPuS288wM6ErZhOL13eMwejp65L5e210Khbl8HlczBs5bdt
	+XKz+E/fJ5YCll6w3Ow9s2gsfb6fgnVJubUEBubNTZFIeu+3cJ3AD2AYgaxN3HljQ87SMlGUwu2R4
	yjXfzcwQYRCquGkDkMSAxuFdZzbmdxXCRAIQkv8YUXmuFRd10zySvb54qRAqrk/V/VDsaU4CluEIo
	/o1joeYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNta0-007pCZ-CZ; Sat, 26 Feb 2022 09:41:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNtZx-007pBi-Bj
 for linux-mediatek@lists.infradead.org; Sat, 26 Feb 2022 09:41:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 550D160FE5;
 Sat, 26 Feb 2022 09:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E476C340E8;
 Sat, 26 Feb 2022 09:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645868487;
 bh=tx4xIClhI9pVqQlAX4OiJzJbfs7O2RB96wmk5ufRnWw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qWR3GkQJXt7d2NP5jHigBUeDt1dBI8/CrEK3KVNFuah8wMLhm9wXxwmRV9Uxwfsr0
 JdN1lslG3ACr3qQhNNSueJfDRdvGZ05qfX2bgLRbj7GoM3e5lOICpPQj2VxWgNNBCv
 9QMy+288ZXLabIv2Po63wr+DVEPP3avhDqweNDbVo0t54PrivEUjRtptSJ70HaYYNk
 8e+VAelSKbaWF42Xd2QpAHWMFK4sgawuN2Ah1DVA/3+CbsmxQf4S4cohPBjAnKdJJq
 4SlUAgJ1pyCiB1fLp8QjS0TVFZocqKHF1r/nu4ZJfEiMyvXBeHGwzqrXryothoxse3
 RChClzpynFAuw==
Date: Sat, 26 Feb 2022 10:41:23 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com,
 YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Mark-YW.Chen@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com,
 jenhao.yang@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com,
 steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com,
 jemele@google.com, abhishekpandit@google.com, shawnku@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] mt76: mt7921: fix up the monitor mode
Message-ID: <Yhn1w5YF3d0NW7qE@lore-desk>
References: <c61deba952e23bcfa98e28778bc11af524ad2f1e.1645832790.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <c61deba952e23bcfa98e28778bc11af524ad2f1e.1645832790.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220226_014129_526985_D1456D7F 
X-CRM114-Status: GOOD (  22.39  )
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
Content-Type: multipart/mixed; boundary="===============7426088713340916415=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7426088713340916415==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zyMKXVW4MtbXm0SY"
Content-Disposition: inline


--zyMKXVW4MtbXm0SY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Properly set up the monitor mode the firmware can support to fix up
> RTS/CTS and beacon frames cannot be captured and forwarded to the host.
>=20
> Tested-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> v2: 1. add Tested-by tag
>     2. make mt76_connac_mcu_set_sniffer mt7921 specific
>     3. align the structure declartion
> ---
>  .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
>  .../net/wireless/mediatek/mt76/mt7921/main.c  | 23 +++++++-------
>  .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 30 +++++++++++++++++++
>  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 ++
>  4 files changed, 46 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> index 384c3eab1c8a..e5857d2cf78c 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> @@ -993,6 +993,7 @@ enum {
>  	MCU_UNI_CMD_SUSPEND =3D 0x05,
>  	MCU_UNI_CMD_OFFLOAD =3D 0x06,
>  	MCU_UNI_CMD_HIF_CTRL =3D 0x07,
> +	MCU_UNI_CMD_SNIFFER =3D 0x24,
>  };
> =20
>  enum {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/main.c
> index b6e836a4fad7..0f3c56530e66 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -479,6 +479,16 @@ mt7921_pm_interface_iter(void *priv, u8 *mac, struct=
 ieee80211_vif *vif)
>  	mt7921_mcu_set_beacon_filter(dev, vif, dev->pm.enable);
>  }
> =20
> +static void
> +mt7921_sniffer_interface_iter(void *priv, u8 *mac, struct ieee80211_vif =
*vif)
> +{
> +	struct mt7921_dev *dev =3D priv;
> +	struct ieee80211_hw *hw =3D mt76_hw(dev);
> +	bool enabled =3D !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
> +
> +	mt7921_mcu_set_sniffer(dev, vif, enabled);
> +}
> +
>  void mt7921_set_runtime_pm(struct mt7921_dev *dev)
>  {
>  	struct ieee80211_hw *hw =3D dev->mphy.hw;
> @@ -516,16 +526,9 @@ static int mt7921_config(struct ieee80211_hw *hw, u3=
2 changed)
>  	}
> =20
>  	if (changed & IEEE80211_CONF_CHANGE_MONITOR) {
> -		bool enabled =3D !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
> -
> -		if (!enabled)
> -			phy->rxfilter |=3D MT_WF_RFCR_DROP_OTHER_UC;
> -		else
> -			phy->rxfilter &=3D ~MT_WF_RFCR_DROP_OTHER_UC;

Hi Sean,

phy->rxfilter is used even in other codepath (e.g. mt7921_tm_set() or
mt7921_configure_filter()). I guess we should keep it updated here doing
something like:

		if (hw->conf.flags & IEEE80211_CONF_MONITOR)
			phy->rxfilter &=3D ~MT_WF_RFCR_DROP_OTHER_UC;
		else
			phy->rxfilter |=3D MT_WF_RFCR_DROP_OTHER_UC;

Agree?

Regards,
Lorenzo

> -
> -		mt76_rmw_field(dev, MT_DMA_DCR0(0), MT_DMA_DCR0_RXD_G5_EN,
> -			       enabled);
> -		mt76_wr(dev, MT_WF_RFCR(0), phy->rxfilter);
> +		ieee80211_iterate_active_interfaces(hw,
> +						    IEEE80211_IFACE_ITER_RESUME_ALL,
> +						    mt7921_sniffer_interface_iter, dev);
>  		mt7921_set_runtime_pm(dev);
>  	}
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mcu.c
> index 33a836825cca..ab790e5df863 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -1133,3 +1133,33 @@ int mt7921_get_txpwr_info(struct mt7921_dev *dev, =
struct mt7921_txpwr *txpwr)
> =20
>  	return 0;
>  }
> +
> +int mt7921_mcu_set_sniffer(struct mt7921_dev *dev, struct ieee80211_vif =
*vif,
> +			   bool enable)
> +{
> +	struct mt76_vif *mvif =3D (struct mt76_vif *)vif->drv_priv;
> +	struct {
> +		struct {
> +			u8 band_idx;
> +			u8 pad[3];
> +		} __packed hdr;
> +		struct sniffer_enable_tlv {
> +			__le16 tag;
> +			__le16 len;
> +			u8 enable;
> +			u8 pad[3];
> +		} __packed enable;
> +	} req =3D {
> +		.hdr =3D {
> +			.band_idx =3D mvif->band_idx,
> +		},
> +		.enable =3D {
> +			.tag =3D cpu_to_le16(0),
> +			.len =3D cpu_to_le16(sizeof(struct sniffer_enable_tlv)),
> +			.enable =3D enable,
> +		},
> +	};
> +
> +	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(SNIFFER), &req, sizeof=
(req),
> +				 true);
> +}
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers=
/net/wireless/mediatek/mt76/mt7921/mt7921.h
> index 9edc83f06139..9575d571b425 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> @@ -452,4 +452,6 @@ void mt7921s_tx_complete_skb(struct mt76_dev *mdev, s=
truct mt76_queue_entry *e);
>  bool mt7921s_tx_status_data(struct mt76_dev *mdev, u8 *update);
>  void mt7921_mac_add_txs(struct mt7921_dev *dev, void *data);
>  void mt7921_set_runtime_pm(struct mt7921_dev *dev);
> +int mt7921_mcu_set_sniffer(struct mt7921_dev *dev, struct ieee80211_vif =
*vif,
> +			   bool enable);
>  #endif
> --=20
> 2.25.1
>=20

--zyMKXVW4MtbXm0SY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYhn1wwAKCRA6cBh0uS2t
rCnAAP94z/LFOOeDRss4qYfAKouWAz6SFAyYxFNQsQDqOEeZgAEAiNelJUxCSyHA
oCAVQ+wAAMfURgFLecqubSC8UMw12AA=
=bT2S
-----END PGP SIGNATURE-----

--zyMKXVW4MtbXm0SY--


--===============7426088713340916415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7426088713340916415==--

