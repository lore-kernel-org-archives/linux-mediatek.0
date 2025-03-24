Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6B1C28B30
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Mar 2025 02:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cu448PxEK6et1+zNw7r1sNBXlczvVSaKK/4PQCuOVpk=; b=pN5UrsBE02JnaoltKVGkwBs1iS
	hvw6iEqZL0NUPzt24pmAnja3C/47CEhl7PGXqRKaLk3U1z7pPgJ0xDZCwtdmRPRvX4qMwFhUMuCAW
	6JL5s5KzA/FQrArRMMcop02C/OVWP/Dr1Xi0SfMzulMZeAcKF+vVBwvvcHJ8htVknBxm1xu5Emggl
	ro5FPp+83cJpBqYpRANLn4TgUkh8RZAkiUAAZyUlysJj/pAiWlgg5UXb5gBgJwJf62QhgqVrNsBYH
	hYsKZLLEcZ9Djp9VdoqM1+tcnCK6k51rvFE0bqFVVyFYAlaDXRmR/QMB5y6hfuVSwPEBhcoXf+XRW
	ioZkp6/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twXDy-000000023MH-2UXq;
	Mon, 24 Mar 2025 02:07:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twXDw-000000023Ll-05Os
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Mar 2025 02:07:33 +0000
X-UUID: bbb8a916085411f0a1e849db4cc18d44-20250323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Cu448PxEK6et1+zNw7r1sNBXlczvVSaKK/4PQCuOVpk=;
	b=Qp3uFt2LZwjDbHNjpkTgL0IL2Hvu7bf7X6UXAswho/X9ZfOgx3zV2pjlT+hgLV18B9GTyU/lxIIv0++0qYgvtd903w2TJslbHJutghpOgFF4ubUKmRfCXgVXIIBGKdhumLQCh7qLYGp9PjiczmG2IjUQclkdtREsfdimXmELnAE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:a3db0989-d907-4a9b-a5d1-d236d333a420,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:f48f47b9-9b8c-4860-be67-5b80134d13d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bbb8a916085411f0a1e849db4cc18d44-20250323
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1359151210; Sun, 23 Mar 2025 19:07:26 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 24 Mar 2025 10:07:24 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Mon, 24 Mar 2025 10:07:24 +0800
Message-ID: <960af30b800baf02d51333a5bf52de93d2966e2a.camel@mediatek.com>
Subject: Re: [bug report] wifi: mt76: Check link_conf pointer in
 mt76_connac_mcu_sta_basic_tlv()
From: Shayne Chen <shayne.chen@mediatek.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Dan Carpenter
	<dan.carpenter@linaro.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Mon, 24 Mar 2025 10:07:24 +0800
In-Reply-To: <Z92T5j1zmlvG2ssG@lore-desk>
References: <868e456f-10db-4b0c-bb29-76e3c0d03cc8@stanley.mountain>
	 <Z92T5j1zmlvG2ssG@lore-desk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_190732_065370_1F73FDA9 
X-CRM114-Status: GOOD (  13.61  )
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

On Fri, 2025-03-21 at 17:29 +0100, Lorenzo Bianconi wrote:
> > Hello Shayne Chen,
> >=20
> > This is a semi-automatic email about new static checker warnings.
> >=20
> > Commit 9890624c1b39 ("wifi: mt76: Check link_conf pointer in
> > mt76_connac_mcu_sta_basic_tlv()") from Mar 11, 2025, leads to the
> > following Smatch complaint:
> >=20
> > =C2=A0=C2=A0=C2=A0 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c=
:394
> > mt76_connac_mcu_sta_basic_tlv()
> > =C2=A0=C2=A0=C2=A0 warn: variable dereferenced before check 'link_conf'=
 (see line
> > 376)
> >=20
> > drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > =C2=A0=C2=A0 375	{
> > =C2=A0=C2=A0 376		struct ieee80211_vif *vif =3D link_conf->vif;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^
>=20
> Reviewing the codebase, it seems to me it is safe to revert
> 9890624c1b39 since
> link_conf is always not NULL running mt76_connac_mcu_sta_basic_tlv().
> @Shayne Chen: agree?
>=20
link_conf won't be NULL in this function at the moment, but it could be
NULL after adding "MLO reconfiguration" support. So in our internal
tree, we directly pass struct ieee80211_vif to this function.

Both methods are fine to me, what do you think?

Regards,
Shayne

> Regards,
> Lorenzo
>=20
> > Dereferenced.
> >=20
> > =C2=A0=C2=A0 377		struct sta_rec_basic *basic;
> > =C2=A0=C2=A0 378		struct tlv *tlv;
> > =C2=A0=C2=A0 379		int conn_type;
> > =C2=A0=C2=A0 380=09
> > =C2=A0=C2=A0 381		tlv =3D mt76_connac_mcu_add_tlv(skb, STA_REC_BASIC,
> > sizeof(*basic));
> > =C2=A0=C2=A0 382=09
> > =C2=A0=C2=A0 383		basic =3D (struct sta_rec_basic *)tlv;
> > =C2=A0=C2=A0 384		basic->extra_info =3D cpu_to_le16(EXTRA_INFO_VER);
> > =C2=A0=C2=A0 385=09
> > =C2=A0=C2=A0 386		if (newly && conn_state !=3D CONN_STATE_DISCONNECT)
> > =C2=A0=C2=A0 387			basic->extra_info |=3D
> > cpu_to_le16(EXTRA_INFO_NEW);
> > =C2=A0=C2=A0 388		basic->conn_state =3D conn_state;
> > =C2=A0=C2=A0 389=09
> > =C2=A0=C2=A0 390		if (!link_sta) {
> > =C2=A0=C2=A0 391			basic->conn_type =3D
> > cpu_to_le32(CONNECTION_INFRA_BC);
> > =C2=A0=C2=A0 392=09
> > =C2=A0=C2=A0 393			if (vif->type =3D=3D NL80211_IFTYPE_STATION &&
> > =C2=A0=C2=A0 394			=C2=A0=C2=A0=C2=A0 link_conf &&
> > !is_zero_ether_addr(link_conf->bssid)) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ^^^^^^^^^
> > The patch adds a NULL dereference but it's too late.
> >=20
> > =C2=A0=C2=A0 395				memcpy(basic->peer_addr,
> > link_conf->bssid, ETH_ALEN);
> > =C2=A0=C2=A0 396				basic->aid =3D cpu_to_le16(vif-
> > >cfg.aid);
> >=20
> > regards,
> > dan carpenter
> >=20


