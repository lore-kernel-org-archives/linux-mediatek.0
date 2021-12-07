Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D1DC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 20:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVb3MUiWBUwMrlwNmUXH/ChPiKOCAUAqhVwpNo6+YYg=; b=WBVR8+24ocqqMwFPSDxYvFbngj
	vSPpJuGGBBnxmeNBo7AebVrerzlrn1/m5iN4tqSnL/zrhkex9FK2NpttUWiUSmWjzduOF9hY1rhYs
	Y3hd2WcWshOtRul0bZQ9QRlvT2E/EO1O0YgjMQ6WfZ5hFzUdZNqD5IDhHQpFS5Eg9MH4bM3vu/YrU
	YjkHOl3iGlQDfTxbzy7I9vDCOHu+NO8j6dQevteAiOA6HFPAPA+0YfUQ8dFaO6JsymEBWztM8qQKU
	QCcuI2QLGkNmtniFMThUbyjSPKvLJbRFpXMaNAKzDLV/DbTOos2zYTGcC7DqGAN6BBq1DMAhPlI3x
	4RtSjoZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mugoZ-009zg9-TR; Tue, 07 Dec 2021 20:11:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mugoW-009zfZ-Gr
 for linux-mediatek@lists.infradead.org; Tue, 07 Dec 2021 20:11:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638907907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BAvBUkvmH9VOTtYCHaOSrjxTLzeaebF0DBD7drcydEg=;
 b=C4MuZxdtagHaWyhA8jWhBpvUFf+CJ3FgrsPSSS05FrDaNlPArl0WnTGvpFJnv7w5Ifgl+L
 QCaXKH3sEtaMMp6F/OS41Iuj8a9XWuKSmBWaIggiAyeo0SveGWj0UJBPpY2wgBN77Cvi85
 nJkcUCa+uY2Ad198AzP97gMxq9trMQk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-T5RthfyDNwCeTIKFLL6_Lw-1; Tue, 07 Dec 2021 15:11:45 -0500
X-MC-Unique: T5RthfyDNwCeTIKFLL6_Lw-1
Received: by mail-qv1-f71.google.com with SMTP id
 o3-20020a0562140e4300b0039a8ccca8efso893664qvc.7
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Dec 2021 12:11:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o5U0T8lId4u/qtnYkSF6w2VpgkSGsEJ9/j1FJIOBWI8=;
 b=a1KTdslyLI1Gz1E4Z3+yfV+fwdHb+ZJnGy+eQvJVofdHbNQMdaeGq+m8O7B+FRo9QT
 /5T2+eizcsiIWSMR9RubXhjEDskq0b89IciXgLkcsSeUESFLpqoFe4J1vYKwy7BdR8q5
 skvaCTYwDMpek/1XhP4sSWm2Aj2duf1qNxdVoHhiDhrFEXgroVdoemV3mJ/IvfSGtPeV
 r4EEupPZzLLIV5dpSH2OFp2rysacDmLEf2pRqJlUxCxcD2waFmT0qO5t1bTQK+nFnjn0
 /FGXwVFNRDRzVOIrbdD7FlKzOGsZIFz2mqqQKJdvM/wlO9wT9LyFCHkidRgAmiyhcggb
 A4yw==
X-Gm-Message-State: AOAM5308tn7pO2U7QPAqrf1bS3Ht7e15EKGxArXKHLy3cZauVQwPO0Am
 ZzuP2a+u0YdhEh/lKo3s0gZoSDzIRdc9hetUn05lI6lhivZR5WTZ18aiHcrkNeOTzezJs6GUQyA
 uaHtUv/uLa1ucoMvR1CPq+cOkZOQ12rJH
X-Received: by 2002:ac8:5a96:: with SMTP id c22mr2025531qtc.602.1638907905426; 
 Tue, 07 Dec 2021 12:11:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwG1pf4MzmjAPKtyQX3aPAClJ9qzTa7/zyMaT+QXwJJXzGjCmrGs3UJyfJTg+vIjTrnhF4fNw==
X-Received: by 2002:ac8:5a96:: with SMTP id c22mr2025501qtc.602.1638907905179; 
 Tue, 07 Dec 2021 12:11:45 -0800 (PST)
Received: from localhost (net-37-182-17-175.cust.vodafonedsl.it.
 [37.182.17.175])
 by smtp.gmail.com with ESMTPSA id t35sm530705qtc.83.2021.12.07.12.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 12:11:44 -0800 (PST)
Date: Tue, 7 Dec 2021 21:11:41 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Deren Wu <Deren.Wu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Soul Huang <Soul.Huang@mediatek.com>,
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
 Eric-SY Chang <Eric-SY.Chang@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>,
 CH Yeh <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>,
 Eric Liang <Eric.Liang@mediatek.com>,
 Stella Chang <Stella.Chang@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mt76: mt7921: fix network buffer leak by txs missing
Message-ID: <Ya+//bw09FMMwEh3@lore-desk>
References: <7f6efbd8e749b21bec2257c54b8258ebe89738fe.1638795555.git.deren.wu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <7f6efbd8e749b21bec2257c54b8258ebe89738fe.1638795555.git.deren.wu@mediatek.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_121148_663244_FF5CE9D9 
X-CRM114-Status: GOOD (  19.24  )
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
Content-Type: multipart/mixed; boundary="===============8378804616252273755=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============8378804616252273755==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HlBm58Dcb78sl8w9"
Content-Disposition: inline

--HlBm58Dcb78sl8w9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Deren Wu <deren.wu@mediatek.com>
>=20
> TXS in mt7921 may be forwared to tx_done event. Should try to catch
> TXS information in tx_done event as well.
>=20
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7921/mac.c   |  2 +-
>  .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 17 ++++++++++++
>  .../net/wireless/mediatek/mt76/mt7921/mcu.h   | 27 +++++++++++++++++++
>  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  1 +
>  4 files changed, 46 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mac.c
> index edf54b192f37..2514708e9ac8 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> @@ -1150,7 +1150,7 @@ mt7921_mac_add_txs_skb(struct mt7921_dev *dev, stru=
ct mt76_wcid *wcid, int pid,
>  =09return !!skb;
>  }
> =20
> -static void mt7921_mac_add_txs(struct mt7921_dev *dev, void *data)
> +void mt7921_mac_add_txs(struct mt7921_dev *dev, void *data)
>  {
>  =09struct mt7921_sta *msta =3D NULL;
>  =09struct mt76_wcid *wcid;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mcu.c
> index 1227d626e9d3..8f58af4e29c6 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -418,6 +418,20 @@ mt7921_mcu_low_power_event(struct mt7921_dev *dev, s=
truct sk_buff *skb)
>  =09trace_lp_event(dev, event->state);
>  }
> =20
> +static void
> +mt7921_mcu_tx_done_event(struct mt7921_dev *dev, struct sk_buff *skb)
> +{
> +=09struct mt7921_mcu_tx_done_event *event;
> +
> +=09skb_pull(skb, sizeof(struct mt7921_mcu_rxd));
> +=09event =3D (struct mt7921_mcu_tx_done_event *)skb->data;
> +
> +=09if (event->pid < MT_PACKET_ID_FIRST)
> +=09=09return;

I guess we do not need it since it is already checked in mt7921_mac_add_txs

> +
> +=09mt7921_mac_add_txs(dev, event->txs);
> +}
> +
>  static void
>  mt7921_mcu_rx_unsolicited_event(struct mt7921_dev *dev, struct sk_buff *=
skb)
>  {
> @@ -445,6 +459,9 @@ mt7921_mcu_rx_unsolicited_event(struct mt7921_dev *de=
v, struct sk_buff *skb)
>  =09case MCU_EVENT_LP_INFO:
>  =09=09mt7921_mcu_low_power_event(dev, skb);
>  =09=09break;
> +=09case MCU_EVENT_TX_DONE:
> +=09=09mt7921_mcu_tx_done_event(dev, skb);
> +=09=09break;
>  =09default:
>  =09=09break;
>  =09}
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mcu.h
> index edc0c73f8c01..821af6e8d99a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
> @@ -91,6 +91,33 @@ enum {
>  =09MCU_EVENT_COREDUMP =3D 0xf0,
>  };
> =20
> +struct mt7921_mcu_tx_done_event {
> +=09u8 pid;
> +=09u8 status;
> +=09u16 seq;
> +
> +=09u8 wlan_idx;
> +=09u8 tx_cnt;
> +=09u16 tx_rate;

can you please fix endianness of mt7921_mcu_tx_done_event?

Regards,
Lorenzo

> +
> +=09u8 flag;
> +=09u8 tid;
> +=09u8 rsp_rate;
> +=09u8 mcs;
> +
> +=09u8 bw;
> +=09u8 tx_pwr;
> +=09u8 reason;
> +=09u8 rsv0[1];
> +
> +=09u32 delay;
> +=09u32 timestamp;
> +=09u32 applied_flag;
> +=09u8 txs[28];
> +
> +=09u8 rsv1[32];
> +} __packed;
> +
>  /* ext event table */
>  enum {
>  =09MCU_EXT_EVENT_RATE_REPORT =3D 0x87,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers=
/net/wireless/mediatek/mt76/mt7921/mt7921.h
> index d6b823713ba3..96647801850a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> @@ -464,4 +464,5 @@ int mt7921s_tx_prepare_skb(struct mt76_dev *mdev, voi=
d *txwi_ptr,
>  =09=09=09   struct mt76_tx_info *tx_info);
>  void mt7921s_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue_en=
try *e);
>  bool mt7921s_tx_status_data(struct mt76_dev *mdev, u8 *update);
> +void mt7921_mac_add_txs(struct mt7921_dev *dev, void *data);
>  #endif
> --=20
> 2.18.0
>=20

--HlBm58Dcb78sl8w9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYa+//QAKCRA6cBh0uS2t
rKIBAQDUBQi44Haok7jXFgo4LaCViKs/FeRb/+crPO6nObM/yQEA0e4HK8uNLDIo
gsLYusdmg+Yxww4wl963+JMstITgngM=
=SGCg
-----END PGP SIGNATURE-----

--HlBm58Dcb78sl8w9--



--===============8378804616252273755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8378804616252273755==--


