Return-Path: <SRS0=O6hk=3K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07503C2D0CE
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 15:11:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C344921569
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 15:11:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NoIvruZj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTOzTNuo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C344921569
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W4BInonOUofTOErg6Z/O5FdtLH/oT5ojLp1QFwB6jcs=; b=NoIvruZjUJKZsp9c0smTd8gbG
	lZ2Z922u9d7/cYdPnpKM2X6w0ZFPzRD4SWT2OuEu2INZVPD0AEhdnTkMFWjckZeNWEK93fQ5nu1Dq
	u+uZNKx6DPi6eIrJcs+CFha04xVTxKSwEng4PLApZboMqrQ4kISsQBjYsQHnQX+u/fxmCcdnXyzTa
	qhnoD2KGkBrJ5QW47bFajlj61kHuKbWlfIkuGLRMJ+++kOUluEqtXTfNE9QOGeGLLK/MRdlrNEkqE
	CZwqG/sN1r5iqaoHykr9WxKqcUu7rM7OdPWL6UqpiWYSRgU1Mccr6W+eIBaORvYYxxkiHLaRQnrMy
	v7PHO/okQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itvBY-0006yZ-EU; Tue, 21 Jan 2020 15:11:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itvBR-0006y5-P8
 for linux-mediatek@lists.infradead.org; Tue, 21 Jan 2020 15:11:19 +0000
Received: from localhost.localdomain (nat-pool-brq-t.redhat.com
 [213.175.37.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F138D21569;
 Tue, 21 Jan 2020 15:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579619472;
 bh=Nf+pOqPROw4DJFNsxg2rTIhXK+9kSGaNFWOCAAgGwRs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uTOzTNuoC9gXsOuBpvrdaxncYyI0qq6tdigf+tjUeUvao0KRe0tWrHgJom/FIEArX
 DqOArQbvPLiE+1PO68hjOLlvF/283x6LRxtbQIe82d1sHV/bbTTTfAQdAkaUHsTrIj
 7gMvez/MHpaFgGnRQvoa6qpU4YM+z+5qMYs3n+Qw=
Date: Tue, 21 Jan 2020 16:11:05 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH 1/7] mt76: mt7615: simplify mcu_set_bmc flow
Message-ID: <20200121151105.GA2396@localhost.localdomain>
References: <ae72dd289f8a26a2c0f42de1f940bb8b6d1f2c29.1579237414.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <ae72dd289f8a26a2c0f42de1f940bb8b6d1f2c29.1579237414.git.ryder.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_071113_864342_E2A570DC 
X-CRM114-Status: GOOD (  14.87  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Felix Fietkau <nbd@nbd.name>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: multipart/mixed; boundary="===============6618570953463109493=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6618570953463109493==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Move mcu_wtbl_bmc into mcu_set_sta_rec_bmc to simplify flow.
>=20
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7615/main.c  |  3 +-
>  .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 97 ++++++++-----------
>  .../wireless/mediatek/mt76/mt7615/mt7615.h    |  6 +-
>  3 files changed, 45 insertions(+), 61 deletions(-)
>=20

[...]

> -int mt7615_mcu_set_sta_rec_bmc(struct mt7615_dev *dev,
> -			       struct ieee80211_vif *vif, bool en)
> +int mt7615_mcu_set_bmc(struct mt7615_dev *dev,
> +		       struct ieee80211_vif *vif, bool en)
>  {
>  	struct mt7615_vif *mvif =3D (struct mt7615_vif *)vif->drv_priv;
>  	struct {
>  		struct sta_req_hdr hdr;
>  		struct sta_rec_basic basic;
> -	} req =3D {
> +		u8 buf[MT7615_WTBL_UPDATE_MAX_SIZE];
> +	} __packed req =3D {
>  		.hdr =3D {
>  			.bss_idx =3D mvif->idx,
>  			.wlan_idx =3D mvif->sta.wcid.idx,
> @@ -1109,8 +1059,18 @@ int mt7615_mcu_set_sta_rec_bmc(struct mt7615_dev *=
dev,
>  			.conn_type =3D cpu_to_le32(CONNECTION_INFRA_BC),
>  		},
>  	};
> +	struct wtbl_req_hdr *wtbl_hdr;
> +	struct wtbl_generic *wtbl_g;
> +	struct wtbl_rx *wtbl_rx;
> +	u8 *buf =3D req.buf;
> +
>  	eth_broadcast_addr(req.basic.peer_addr);
> =20
> +	wtbl_hdr =3D (struct wtbl_req_hdr *)buf;
> +	buf +=3D sizeof(*wtbl_hdr);
> +	wtbl_hdr->wlan_idx =3D mvif->sta.wcid.idx;
> +	wtbl_hdr->operation =3D WTBL_RESET_AND_SET;
> +
>  	if (en) {
>  		req.basic.conn_state =3D CONN_STATE_PORT_SECURE;
>  		req.basic.extra_info =3D cpu_to_le16(EXTRA_INFO_VER |
> @@ -1118,10 +1078,37 @@ int mt7615_mcu_set_sta_rec_bmc(struct mt7615_dev =
*dev,
>  	} else {
>  		req.basic.conn_state =3D CONN_STATE_DISCONNECT;
>  		req.basic.extra_info =3D cpu_to_le16(EXTRA_INFO_VER);
> +
> +		__mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_STA_REC_UPDATE,
> +				    &req, (u8 *)wtbl_hdr - (u8 *)&req, true);

we need to check the return value from __mt76_mcu_send_msg here.
Moreover, here (u8 *)wtbl_hdr - (u8 *)&req is
sizeof(struct sta_req_hdr) + sizeof(struct sta_rec_basic), right?
I guess it would be easier to understand if we explicit the length, what do=
 you think?

> +
> +		return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE,
> +					   (u8 *)wtbl_hdr, buf - (u8 *)wtbl_hdr,
> +					   true);
>  	}
> =20
> +	wtbl_g =3D (struct wtbl_generic *)buf;
> +	buf +=3D sizeof(*wtbl_g);
> +	wtbl_g->tag =3D cpu_to_le16(WTBL_GENERIC);
> +	wtbl_g->len =3D cpu_to_le16(sizeof(*wtbl_g));
> +	wtbl_g->muar_idx =3D 0xe;
> +	eth_broadcast_addr(wtbl_g->peer_addr);
> +
> +	wtbl_rx =3D (struct wtbl_rx *)buf;
> +	buf +=3D sizeof(*wtbl_rx);
> +	wtbl_rx->tag =3D cpu_to_le16(WTBL_RX);
> +	wtbl_rx->len =3D cpu_to_le16(sizeof(*wtbl_rx));
> +	wtbl_rx->rv =3D 1;
> +	wtbl_rx->rca1 =3D 1;
> +	wtbl_rx->rca2 =3D 1;
> +
> +	wtbl_hdr->tlv_num =3D cpu_to_le16(2);
> +
> +	__mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE,
> +			    (u8 *)wtbl_hdr, buf - (u8 *)wtbl_hdr, true);

we need to check the return value from __mt76_mcu_send_msg here
> +
>  	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_STA_REC_UPDATE,
> -				   &req, sizeof(req), true);
> +				   &req, (u8 *)wtbl_hdr - (u8 *)&req, true);

same here about the length.

Regards,
Lorenzo

>  }
> =20
>  int mt7615_mcu_set_sta_rec(struct mt7615_dev *dev, struct ieee80211_vif =
*vif,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers=
/net/wireless/mediatek/mt76/mt7615/mt7615.h
> index eaafae9cc279..84949256601f 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
> @@ -241,14 +241,12 @@ int mt7615_mcu_set_bss_info(struct mt7615_dev *dev,=
 struct ieee80211_vif *vif,
>  void mt7615_mac_set_rates(struct mt7615_phy *phy, struct mt7615_sta *sta,
>  			  struct ieee80211_tx_rate *probe_rate,
>  			  struct ieee80211_tx_rate *rates);
> -int mt7615_mcu_wtbl_bmc(struct mt7615_dev *dev, struct ieee80211_vif *vi=
f,
> -			bool enable);
>  int mt7615_mcu_add_wtbl(struct mt7615_dev *dev, struct ieee80211_vif *vi=
f,
>  			struct ieee80211_sta *sta);
>  int mt7615_mcu_del_wtbl(struct mt7615_dev *dev, struct ieee80211_sta *st=
a);
>  int mt7615_mcu_del_wtbl_all(struct mt7615_dev *dev);
> -int mt7615_mcu_set_sta_rec_bmc(struct mt7615_dev *dev,
> -			       struct ieee80211_vif *vif, bool en);
> +int mt7615_mcu_set_bmc(struct mt7615_dev *dev, struct ieee80211_vif *vif,
> +		       bool en);
>  int mt7615_mcu_set_sta_rec(struct mt7615_dev *dev, struct ieee80211_vif =
*vif,
>  			   struct ieee80211_sta *sta, bool en);
>  int mt7615_mcu_set_bcn(struct ieee80211_hw *hw, struct ieee80211_vif *vi=
f,
> --=20
> 2.18.0

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCXicUhwAKCRA6cBh0uS2t
rE0TAP99qoAH5LfpJ/A9pFDbcKQem+kh5Ku+cIQ/ULjuso4SMQD+NpQ7PXYVwOYl
zinnZjga5RmI9cLdqjMoms+G4H6cZAQ=
=4+yn
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--


--===============6618570953463109493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6618570953463109493==--

