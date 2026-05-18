Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEC9CD4F52
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2026 12:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OqW0PFlff4DAzM3bBRqLlWWYQdvHN/3mLINZX0r2CY=; b=nvlTw6dvvxplkibELY0xOs1rVE
	SsznFwo9TV0h6fiTI1/VFUaEbXlG2KI0GTEFJCdAcmVHY8LyAr9f+7oadFEc7zLXv72uPCbDPNPWi
	lmJDtwwxzfGpKEcrsh7OB7/3NGfNkYxbxftzuP6Y0x2h0eZ5fJIHgjo6OP0AnF2rATLUv0T0UBe7e
	qpIH9JqIsqNLGMFKbbAilkOS7/8NOdfkkLm+o57RqABX4kF7CUQ2TpvYGFRQpPxjERdZ7w44W6V4m
	RtYro65RfvB/3Ea/tl2ctM9Dxj5MXWqWPJ8GKPuP/1fT5dyV3awWQ6WZZN5dR5zrAOZg8CNdLcEC6
	jvEW0g8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOx7s-0000000Fdoz-00mK;
	Mon, 18 May 2026 12:31:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOx7r-0000000Fdoi-0QcB
	for linux-mediatek@bombadil.infradead.org;
	Mon, 18 May 2026 12:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/OqW0PFlff4DAzM3bBRqLlWWYQdvHN/3mLINZX0r2CY=; b=bqNcD8ZYwiqB5A3ivWhp+9vli/
	x+p3mgnpJsecHqL9em8JpJ3lVhe4qku4RP4ChzpxRRvBsUC1SYPrUEB39WcKEEmtdiTDkCFnskx0F
	W5OrLDW/1x2wn00kzDYppbrl0ySvtxtUJqYEvQQYx7WoX0HDmrZI222jdAAMbm5H/dXzVPg5QP3c4
	K6arPhI/nh2cBmIhm4pWae++el55VWGQdnExLQxf8EZywyURzl3FVSh1+zwyEgrxVJuZcbzbTTVtc
	/YCsNZjzA/Kj+wuNvUHj5FujkCimjtd7kMRpNJHuwpC3kvNTMhC51GOXxNeA+LP59lz9Po19A65Vz
	YOIGzKHg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOx7n-0000000B8nI-372J
	for linux-mediatek@lists.infradead.org;
	Mon, 18 May 2026 12:31:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5309944280;
	Mon, 18 May 2026 12:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5ED4C2BCF6;
	Mon, 18 May 2026 12:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779107467;
	bh=m07W1s/IuDdUfINCVtXHnkSwedXnpSOYDhP4PdcOAos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5pZHm2OzFgAD7P7m8X7gcnm4OOnlV4uVr1O+9Jx0La9i+8oQuQZKa20Ps9nwGbla
	 n6ZZm+pC6/jH65V5ndiQ/1+9r6THlkd2E6+FSfV2Qa5f04BfU9i+LiYFHqChUIl9NK
	 MA8zTsQ19LMQYA3HzYhO1IzEB80XhvNA21akpGV+19FpVHhaxRcHPitzIi/2Dqddkr
	 g7+TKsgxEgtk/0vc9v6NDy+1lXfYBEDMcg1CB+IsggG4MN/4ntobXbRKJlVyQjIUXX
	 eBlRge4SK7HdDb2nhfhErDUgIpJ+3VnvCTGnqMhCcg0ziPGLIlFz36DgHX/lztKbX7
	 wXpHqo0h1mDIQ==
Date: Mon, 18 May 2026 14:31:04 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Cheng Hao Luo <roychl666@gmail.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
	Shayne Chen <shayne.chen@mediatek.com>,
	Roy Luo <roy-ch.luo@mediatek.com>
Subject: Re: [PATCH] wifi: mt76: mt7996: avoid memset overwriting
 tx_info->control.flags
Message-ID: <agsGiHKH6ly1afaf@lore-desk>
References: <5ecac6a9b7d29526e8438dea105b58f5487c93aa.1778521232.git.ryder.lee@mediatek.com>
 <agdJ1EtZjjWh2R1h@lore-desk>
 <CAHoxojJX2BRRTLMuM_QcJqMMmshxS4EAwrB1VjU3rsZ+0k2PAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9gATnpVnUl0KDMgx"
Content-Disposition: inline
In-Reply-To: <CAHoxojJX2BRRTLMuM_QcJqMMmshxS4EAwrB1VjU3rsZ+0k2PAg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_133112_598092_69267C29 
X-CRM114-Status: GOOD (  14.57  )
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


--9gATnpVnUl0KDMgx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 15, Cheng Hao Luo wrote:
> > struct ieee80211_tx_info {
> >         u32                        flags;                /*     0     4=
 */
> >         u32                        band:3;               /*     4: 0  4=
 */
> >         u32                        status_data_idr:1;    /*     4: 3  4=
 */
> >         u32                        status_data:13;       /*     4: 4  4=
 */
> >         u32                        hw_queue:4;           /*     4:17  4=
 */
> >         u32                        tx_time_est:10;       /*     4:21  4=
 */
> >
> >         /* XXX 1 bit hole, try to pack */
> >
> >         union {
> >                 struct {
> >                         union {
> >                                 struct {
> >                                         struct ieee80211_tx_rate rates[=
4]; /*     8    12 */
> >                                         s8     rts_cts_rate_idx; /*    =
20     1 */
> >                                         u8     use_rts:1; /*    21: 0  =
1 */
> >                                         u8     use_cts_prot:1; /*    21=
: 1  1 */
> >                                         u8     short_preamble:1; /*    =
21: 2  1 */
> >                                         u8     skip_table:1; /*    21: =
3  1 */
> >                                         u8     antennas:2; /*    21: 4 =
 1 */
> >                                 };                       /*     8    14=
 */
> >                                 long unsigned int jiffies; /*     8    =
 8 */
> >                         };                               /*     8    16=
 */
> >                         struct ieee80211_vif * vif;      /*    24     8=
 */
> >                         struct ieee80211_key_conf * hw_key; /*    32   =
  8 */
> >                         u32        flags;                /*    40     4=
 */
> >                         codel_time_t enqueue_time;       /*    44     4=
 */
> >                 } control;                               /*     8    40=
 */
> >                 struct {
> >                         u64        cookie;               /*     8     8=
 */
> >                 } ack;                                   /*     8     8=
 */
> >                 struct {
> >                         struct ieee80211_tx_rate rates[4]; /*     8    =
12 */
> >                         s32        ack_signal;           /*    20     4=
 */
> >                         u8         ampdu_ack_len;        /*    24     1=
 */
> >                         u8         ampdu_len;            /*    25     1=
 */
> >                         u8         antenna;              /*    26     1=
 */
> >                         u8         pad;                  /*    27     1=
 */
> >                         u16        tx_time;              /*    28     2=
 */
> >                         u8         flags;                /*    30     1=
 */
> >                         u8         pad2;                 /*    31     1=
 */
> >                         void *     status_driver_data[2]; /*    32    1=
6 */
> >                 } status;                                /*     8    40=
 */
> >                 struct {
> >                         struct ieee80211_tx_rate driver_rates[4]; /*   =
  8    12 */
> >                         u8         pad[4];               /*    20     4=
 */
> >                         void *     rate_driver_data[3];  /*    24    24=
 */
> >                 };                                       /*     8    40=
 */
> >                 void *             driver_data[5];       /*     8    40=
 */
> >         };                                               /*     8    40=
 */
> >
> >         /* size: 48, cachelines: 1, members: 7 */
> >         /* sum members: 44 */
> >         /* sum bitfield members: 31 bits, bit holes: 1, sum bit holes: =
1 bits */
> >         /* last cacheline: 48 bytes */
> > };
> >
> > According to pahole, the size of the control inner union is actually 16=
 bytes
> > since the compiler adds 2 bytes of padding. Since mt76_tx_status_skb_ad=
d()
> > meset to 0 just mt76_tx_cb size (that is 16 bytes) I can't see how
> > control.flags is overwritten. Am I missing something?
> >
> > struct mt76_tx_cb {
> >         long unsigned int          jiffies;              /*     0     8=
 */
> >         u16                        wcid;                 /*     8     2=
 */
> >         u8                         pktid;                /*    10     1=
 */
> >         u8                         flags;                /*    11     1=
 */
> >
> >         /* size: 16, cachelines: 1, members: 4 */
> >         /* padding: 4 */
> >         /* last cacheline: 16 bytes */
> > };
>=20
> Hi Lorenzo,
>=20
> The mt76_tx_cb is placed at status.status_driver_data (offset 32).
> It overlaps with hw_key, flags and enqueue_time in the control union.
>=20
> static inline struct mt76_tx_cb *mt76_tx_skb_cb(struct sk_buff *skb)
> {
> BUILD_BUG_ON(sizeof(struct mt76_tx_cb) >
>     sizeof(IEEE80211_SKB_CB(skb)->status.status_driver_data));
> return ((void *)IEEE80211_SKB_CB(skb)->status.status_driver_data);
> }

Hi Roy,

I still do not understand since mt76_tx_status_skb_add() sets to 0 just siz=
eof
of mt76_tx_cb, that according to pahole is 16 bytes, so it can't overwrite
hw_key pointer (whose offset respect to the beginning of the control struct=
 is
24, 32 - 8).

Regards,
Lorenzo

>=20
> Regards,
> Roy Luo

--9gATnpVnUl0KDMgx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCagsGiAAKCRA6cBh0uS2t
rP8qAQDen40n2jOyttCRZP/6p99yO/f15imfyLqutyAyZHcI5gEAmo3YTyaI8B2A
Y1ZUjTx974vEx3I2UtSnHHo/h5zwIAE=
=yxB8
-----END PGP SIGNATURE-----

--9gATnpVnUl0KDMgx--

