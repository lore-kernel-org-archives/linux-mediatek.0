Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB86C48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 22:58:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D7C0610A2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 22:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D7C0610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d11TbnbTgXL0X7Lx3TWkL2z2KSZqKQ5Ws/pSwR88vbg=; b=S4qP/NauCJBxIxm+BGxtIz0dV/
	QQHq55Qo1A/mYcuZ7X+1GGNES4UtTNeRAp+P93ylh+KopQazh/OtHTpnveHO7MrxLwCyixLea9sx7
	cVXFIhPepUDVE2XAuYd1ORYVF07HHSzGiDlB/WBvksTNXFSU4KibxIFto5NSWmVC9+xaHSIT2yDm2
	yJ9BNnMREqS0bS41TT0Hkr78va5Y0sL+oalRQoQT9od1kn6fpFC+ZHf811RnPbElvo3qwgRTV69Ps
	WSMSSGCm73R2JA8vixLwe035NibN8zFmxy6dhG3yn4p7dPJbcPB0iL1TaDbGGndsV/dcZTahs8jIk
	hYbvW0nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltI0S-003jDP-IV; Tue, 15 Jun 2021 22:58:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltGip-003Cro-OX
 for linux-mediatek@lists.infradead.org; Tue, 15 Jun 2021 21:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623792944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h7hUrLwjwx/yQaUYuZol0PvQpdVLOMZTZJ3/efrVV2U=;
 b=JqbzuGP67fSo94oa6KW34Mj4OwI63l6Km0Vn24tzytnEiuHSdS1edLgXHuT8eaeDjAzmps
 CojlFeOxCCPhsh4GXnq3jXEOC9mME26VHT8p9E1R636Fb2AeZ/rj7BK9u1HxczSPEeq+6u
 pMkB2yepAfzDDtMXo+ebXxUkN2DcrD4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-HnKtxW3NON6kAyuLHhuVAg-1; Tue, 15 Jun 2021 17:35:41 -0400
X-MC-Unique: HnKtxW3NON6kAyuLHhuVAg-1
Received: by mail-ed1-f70.google.com with SMTP id
 z5-20020a05640235c5b0290393974bcf7eso14616006edc.2
 for <linux-mediatek@lists.infradead.org>; Tue, 15 Jun 2021 14:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9wuHb9IfYcLah8//k4SEZ+j3tQFnhifehV6A6sLGIeU=;
 b=ULlWba2JB0/a+EsdkQftEsXcRz/qTWiP8oEa+PuYTEelJaQRfVF6ItUkyT+yRbO5Md
 8e5XivzlzKeUM1jHF0EQwP0kgM3vfcw9PMfohKhTH9jWAT794D5PfG4sXbtxL3zEq5z7
 PrAfnN8JOpYkyIyUzS1P2RrJk1UAg2UOwp4v+lX79I9ua3ahDW1sjbRHElf9te+0AXYQ
 +TcUuDk+H5rmKypDnvIQGR75woC5dc3V3O1rgU2VNcjijrNAjMpBJZccMX2cc6bMY10x
 7zrpRaGixG6X0uVQCmp1JUpMNj/HBo45CErqptflN5JwvVeU2JM2nWvzw74S7zflGKGt
 LhDQ==
X-Gm-Message-State: AOAM532pe3YgYMTuJbEYzi8UgYSXrPIZXNV82w6FlZwNo83MYVvv9RW+
 rKzLUIVwBs/cCgPh3Z7dG4bEjJpG8ga0scsXlDmk4o/s0r+ywwWu5oOEfB5PudfgO3jN4iK5OM0
 65J2PDB3mPcB2jCfJaD3InfcDEcEPqz+Z
X-Received: by 2002:aa7:de18:: with SMTP id h24mr231013edv.23.1623792940212;
 Tue, 15 Jun 2021 14:35:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzT2P9jMqiw3WRG5vp744Zd1Y1P/0X7KxlcRSUkz5sesb2eX4H1Pe+BWQJLadvwkTkRjHvJ+w==
X-Received: by 2002:aa7:de18:: with SMTP id h24mr230995edv.23.1623792940026;
 Tue, 15 Jun 2021 14:35:40 -0700 (PDT)
Received: from localhost (net-130-25-105-72.cust.vodafonedsl.it.
 [130.25.105.72])
 by smtp.gmail.com with ESMTPSA id gz25sm129498ejb.0.2021.06.15.14.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 14:35:39 -0700 (PDT)
Date: Tue, 15 Jun 2021 23:35:36 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 ch.yeh@mediatek.com, posh.sun@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, jemele@google.com, yenlinlai@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mt76: mt7921: fix kernel warning when reset on vif is
 not sta
Message-ID: <YMkdKFpia2XqdqrX@lore-desk>
References: <f2fd5eab61a26c43d668cfc06d943f7bf514db36.1623792576.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <f2fd5eab61a26c43d668cfc06d943f7bf514db36.1623792576.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_143547_996287_028D2DE7 
X-CRM114-Status: GOOD (  14.83  )
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
Content-Type: multipart/mixed; boundary="===============6170939022700720993=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============6170939022700720993==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="foRc1a6SDuOUPmU+"
Content-Disposition: inline

--foRc1a6SDuOUPmU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> ieee80211_disconnect is only called for the staton mode.
>=20
> [  714.050429] WARNING: CPU: 1 PID: 382 at net/mac80211/mlme.c:2787
> ieee80211_disconnect+0x108/0x118 [mac80211]
> [  714.116704] Hardware name: MediaTek Asurada rev1 board (DT)
> [  714.122303] Workqueue: mt76 mt7921_mac_reset_work [mt7921e]
> [  714.127877] pstate: 20c00009 (nzCv daif +PAN +UAO)
> [  714.132761] pc : ieee80211_disconnect+0x108/0x118 [mac80211]
> [  714.138430] lr : mt7921_vif_connect_iter+0x28/0x54 [mt7921e]
> [  714.144083] sp : ffffffc0107cbbd0
> [  714.147394] x29: ffffffc0107cbbd0 x28: ffffffb26c9cb928
> [  714.152706] x27: ffffffb26c9cbd98 x26: 0000000000000000
> [  714.158017] x25: 0000000000000003 x24: ffffffb26c9c9c38
> [  714.163328] x23: ffffffb26c9c9c38 x22: ffffffb26c9c8860
> [  714.168639] x21: ffffffb23b940000 x20: ffffffb26c9c8860
> [  714.173950] x19: 0000000000000001 x18: 000000000000b67e
> [  714.179261] x17: 00000000064dd409 x16: ffffffd739cb28f0
> [  714.184571] x15: 0000000000000000 x14: 0000000000000227
> [  714.189881] x13: 0000000000000400 x12: ffffffd73a4eb060
> [  714.195191] x11: 0000000000000000 x10: 0000000000000000
> [  714.200502] x9 : ffffffd703a0a000 x8 : 0000000000000006
> [  714.205812] x7 : 2828282828282828 x6 : ffffffb200440396
> [  714.211122] x5 : 0000000000000000 x4 : 0000000000000004
> [  714.216432] x3 : 0000000000000000 x2 : ffffffb23b940c90
> [  714.221743] x1 : 0000000000000001 x0 : ffffffb23b940c90
> [  714.227054] Call trace:
> [  714.229594]  ieee80211_disconnect+0x108/0x118 [mac80211]
> [  714.234913]  mt7921_vif_connect_iter+0x28/0x54 [mt7921e]
> [  714.240313]  __iterate_interfaces+0xc4/0xdc [mac80211]
> [  714.245541]  ieee80211_iterate_interfaces+0x4c/0x68 [mac80211]
> [  714.251381]  mt7921_mac_reset_work+0x410/0x468 [mt7921e]
> [  714.256696]  process_one_work+0x208/0x3c8
> [  714.260706]  worker_thread+0x23c/0x3e8
> [  714.264456]  kthread+0x140/0x17c
> [  714.267685]  ret_from_fork+0x10/0x18
>=20
> Fixes: 0c1ce9884607 ("mt76: mt7921: add wifi reset support")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

I am fine with this patch but I guess you are not using an update tree sinc=
e
mt7921 supports just sta mode so far.

Regards,
Lorenzo

> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mac.c
> index fb4de73df701..0a2df295596a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> @@ -1269,7 +1269,8 @@ mt7921_vif_connect_iter(void *priv, u8 *mac,
>  =09struct mt7921_vif *mvif =3D (struct mt7921_vif *)vif->drv_priv;
>  =09struct mt7921_dev *dev =3D mvif->phy->dev;
> =20
> -=09ieee80211_disconnect(vif, true);
> +=09if (vif->type =3D=3D NL80211_IFTYPE_STATION)
> +=09=09ieee80211_disconnect(vif, true);
> =20
>  =09mt76_connac_mcu_uni_add_dev(&dev->mphy, vif, &mvif->sta.wcid, true);
>  =09mt7921_mcu_set_tx(dev, vif);
> --=20
> 2.25.1
>=20

--foRc1a6SDuOUPmU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYMkdJAAKCRA6cBh0uS2t
rPqYAP9ZpwqChdsNQ57Mv1s+QFWyR2OtH2EpUjIASWK0veAwwgEA5Psk9BM2z6oE
UIWN41JaCtI16amahQxEh8MV9LNvuAo=
=X5lS
-----END PGP SIGNATURE-----

--foRc1a6SDuOUPmU+--



--===============6170939022700720993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6170939022700720993==--


