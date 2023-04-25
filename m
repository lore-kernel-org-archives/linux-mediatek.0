Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D966C6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 09:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhHAX0VlICT6SJ2yIjYuGBSOLHy5fvpP1/I8XUa+avA=; b=plR6t6BuP0f9FF/hS4wJ289NJZ
	M1sNVM6LPfw27BJ1NajsuvP60CmtTH3kmyagLAB1ArDGz31IaVf/37jWI5I2DOHEfqts4pyPwZHnI
	fNmvoXZJWDrAbURdhFDieyy4q5BICWk9Wh0ZW9ZifqNqP6XgRnpJ5wRpLJHYPctU0silbePyPvJ3D
	1UNDKSYTXQidAk3mX747WWU5aTecnmmNaM6BB4+BnqFMDPwItyDqMCJ6H3Q7WA+YpOmt5oDhySQ+B
	vEqC79pjR0Gfv+qpuvnioS7s1li7bdaIO8K+4QWnnLQ7DyFISWQ6JoND0A1ez2796JanaNaROaSTZ
	pa9D4Hrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prElu-000cjS-2W;
	Tue, 25 Apr 2023 09:15:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prElr-000cih-2q
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Apr 2023 09:15:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682414134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NhHAX0VlICT6SJ2yIjYuGBSOLHy5fvpP1/I8XUa+avA=;
	b=g2kedOmTBmuRUyrKAUidaMK4fK7iu0+Dwwm1fkSNF+Xr7qAxjgJO5lYadB9WbVrxWKj7DV
	oTtn8T8lYjfjDwzMpsqiFF0zXbTuotA3XooYRUIBdfR/4Etz4ZP1qbe/R4ijmZ+wgamraW
	eW/24evtSFBlVEMg321HRQzks9c3+Gc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-ngx97Fa1P3aBEtlmr5sUnA-1; Tue, 25 Apr 2023 05:15:30 -0400
X-MC-Unique: ngx97Fa1P3aBEtlmr5sUnA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-2f96ecfb40cso1968203f8f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Apr 2023 02:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682414129; x=1685006129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhHAX0VlICT6SJ2yIjYuGBSOLHy5fvpP1/I8XUa+avA=;
        b=GCnWHfMnwN15rTmpIgA+L8fGXQj/XPrm1dLelh48mp5eLLRBs6ETqPTgeFps5fBifX
         m+d+nTmGXH+Gak4ruE2H0m4rRbesbQjK7p17ZvTD4uvYE8jPRvMSmwduOO3L9dFgLyd1
         /2HV2D/OxIdmbeThrXkoo3YbMP1Xz+yKRwVwO6x0D1x9hJyp1E8PXt7i2hWKsC2NSZu2
         QcvuJqc8NGHXDHHjKndSgawQMiXXJSOA6Cbp71Yot8P3oAM/MxRSyCR09MlpBqoXqve0
         XT6ytErZD89h2LhrAheBi/wh3uoBSx4zZi/dFrwrmmOmC67Ogv2ZTTn8/5TsvCDBxya2
         QV2Q==
X-Gm-Message-State: AAQBX9f41r16WaECMnGtYOj5f5bh7tVJeMsVLkplgz4LZe3qR8FkdGdI
	ysfpc0jIB3y7RI1mhO9Ldb00k3qpSeASPuakE6tA01hAbIgSIStj3ZZD5925RqaDYTAZvaoZ882
	uoUfvTQ6wXpFTgsLvZwJG/0/bUMUGFGMm
X-Received: by 2002:adf:fa85:0:b0:2fa:6929:eb81 with SMTP id h5-20020adffa85000000b002fa6929eb81mr10610041wrr.31.1682414129233;
        Tue, 25 Apr 2023 02:15:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yzo8tilXa86cYLLhoIWmR3SPkVzVPAP1fY+v3Z4ulVIYXIN2Qw3dZu+twfdymURcj0zUBW+A==
X-Received: by 2002:adf:fa85:0:b0:2fa:6929:eb81 with SMTP id h5-20020adffa85000000b002fa6929eb81mr10610024wrr.31.1682414128925;
        Tue, 25 Apr 2023 02:15:28 -0700 (PDT)
Received: from localhost (net-130-25-106-149.cust.vodafonedsl.it. [130.25.106.149])
        by smtp.gmail.com with ESMTPSA id u15-20020a5d468f000000b002f5fbc6ffb2sm12621195wrq.23.2023.04.25.02.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 02:15:28 -0700 (PDT)
Date: Tue, 25 Apr 2023 11:15:26 +0200
From: "lorenzo.bianconi@redhat.com" <lorenzo.bianconi@redhat.com>
To: Ryder Lee <Ryder.Lee@mediatek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	Shayne Chen =?utf-8?B?KOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>,
	"nbd@nbd.name" <nbd@nbd.name>,
	Evelyn Tsai =?utf-8?B?KOiUoeePiumIuik=?= <Evelyn.Tsai@mediatek.com>,
	Chui-hao Chiu =?utf-8?B?KOmCseWegua1qSk=?= <Chui-hao.Chiu@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 1/2] wifi: mt76: mt7915: rework tx bytes/packets when WED
 is active
Message-ID: <ZEeaLiG458e3oDSU@lore-desk>
References: <d9466e4641a7db661058896f4ccd4bba4a9cdb3b.1682411744.git.ryder.lee@mediatek.com>
 <ZEeUF8T8gmjGIk5e@lore-desk>
 <00f1427faabd54d260aca8d083c1dd4e190d4c75.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nfYNmmsp/Ll5LRBs"
Content-Disposition: inline
In-Reply-To: <00f1427faabd54d260aca8d083c1dd4e190d4c75.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_021535_993242_A00D092C 
X-CRM114-Status: GOOD (  28.75  )
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


--nfYNmmsp/Ll5LRBs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, 2023-04-25 at 10:49 +0200, Lorenzo Bianconi wrote:
> > > From: Peter Chiu <chui-hao.chiu@mediatek.com>
> > >=20
> > > 1. Mixed tx_byte calculation - need to handle both (non)binding
> > > packets
> > >    when WED is enabled.
> > > 2. PPDU based TxS can only reports MPDU counts whereas mac80211
> > > requires
> > >    MSDU unit(NL80211_STA_INFO_TX_PACKETS).
> > >=20
> > > To solve above issues - switch to use TxS reporting for all tx_byte
> > > when
> > > WED is active and get MSDU Tx counts from WA statistic.
> >=20
> > It seems to me we are doining multiple logic tasks in this patch. Can
> > you
> > please split them on multiple patches?
> >=20
>=20
> OK.
> > >=20
> > > Note that mt7915 WA firmware only counts tx_packet for WED path, so
> > > driver needs to take care of host path.
> > >=20
> > > Fixes: 43eaa3689507 ("wifi: mt76: add PPDU based TxS support for
> > > WED device")
> > > Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
> > > Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> > > Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> > > ---
> > >  drivers/net/wireless/mediatek/mt76/mt76.h     |  2 +-
> > >  .../wireless/mediatek/mt76/mt76_connac_mac.c  |  8 +-
> > >  .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
> > >  .../net/wireless/mediatek/mt76/mt7915/init.c  |  6 ++
> > >  .../net/wireless/mediatek/mt76/mt7915/main.c  |  6 +-
> > >  .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 74
> > > +++++++++++++++++--
> > >  .../net/wireless/mediatek/mt76/mt7915/mmio.c  | 30 +-------
> > >  .../wireless/mediatek/mt76/mt7915/mt7915.h    |  1 +
> > >  drivers/net/wireless/mediatek/mt76/tx.c       |  6 ++
> > >  9 files changed, 91 insertions(+), 43 deletions(-)
> > >=20
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h
> > > b/drivers/net/wireless/mediatek/mt76/mt76.h
> > > index 6b07b8fafec2..0e9f4197213a 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> > > @@ -277,7 +277,7 @@ struct mt76_sta_stats {
> > >  	u64 tx_mcs[16];		/* mcs idx */
> > >  	u64 tx_bytes;
> > >  	/* WED TX */
> > > -	u32 tx_packets;
> > > +	u32 tx_packets;		/* unit: MSDU */
> > >  	u32 tx_retries;
> > >  	u32 tx_failed;
> > >  	/* WED RX */
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
> > > b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
> > > index d39a3cc5e381..84985a989293 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
> > > @@ -521,9 +521,9 @@ void mt76_connac2_mac_write_txwi(struct
> > > mt76_dev *dev, __le32 *txwi,
> > >  		q_idx =3D wmm_idx * MT76_CONNAC_MAX_WMM_SETS +
> > >  			mt76_connac_lmac_mapping(skb_get_queue_mapping(
> > > skb));
> > > =20
> > > -		/* counting non-offloading skbs */
> > > -		wcid->stats.tx_bytes +=3D skb->len;
> > > -		wcid->stats.tx_packets++;
> > > +		/* mt7915 WA only counts WED path */
> > > +		if (mtk_wed_device_active(&dev->mmio.wed) &&
> > > is_mt7915(dev))
> > > +			wcid->stats.tx_packets++;
> >=20
> > I think this will crash mt7921 usb/sdio drivers. It is enough to swap
> > the conditions since mt7915 supports mmio only mode.
> >=20
>=20
> OK.
> > >  	}
> > > =20
> > >  	val =3D FIELD_PREP(MT_TXD0_TX_BYTES, skb->len + sz_txd) |
> > > @@ -610,8 +610,6 @@ bool mt76_connac2_mac_fill_txs(struct mt76_dev
> > > *dev, struct mt76_wcid *wcid,
> > >  		stats->tx_bytes +=3D
> > >  			le32_get_bits(txs_data[5],
> > > MT_TXS5_MPDU_TX_BYTE) -
> > >  			le32_get_bits(txs_data[7],
> > > MT_TXS7_MPDU_RETRY_BYTE);
> > > -		stats->tx_packets +=3D
> > > -			le32_get_bits(txs_data[5],
> > > MT_TXS5_MPDU_TX_CNT);
> >=20
> > I think this will break accounting for mt7921, right?
> >=20
>=20
> Why? I don't think mt7921 supports WED. It should not go into this
> chunk.

ack, right. mt7921 just supports MT_TXS0_TXS_FORMAT <=3D 1.

Regards,
Lorenzo

>=20
> > Regards,
> > Lorenzo
> >=20

--nfYNmmsp/Ll5LRBs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZEeaLgAKCRA6cBh0uS2t
rFGYAP9IiPY1yQ6QJctiXOnHmoBcJ81dGHaJgTOdhiyn3bjuKQD/T62wZHe3pav0
poWV+P4MDCr0svPp379tG3ZKkPb7zgE=
=svYu
-----END PGP SIGNATURE-----

--nfYNmmsp/Ll5LRBs--


