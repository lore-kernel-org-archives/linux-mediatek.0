Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309EEC35FFC
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Mar 2025 13:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGj5ru/buKxHnbG4P2Ey4/kWQiecWUhInHR/8cdM730=; b=BMDa1q5lla2I4zn3hmKptbegga
	DYXcnmRG6yGfjaJKrjJlpBJvnG+xUNO0mIOt+4nXYr2bdjmEAigPcLcp57vk2ReM6n8J7t9wdZkko
	uHgOpBbMoEkkbg5zXye5Rziat4M9bc1OOAzh4WGC7E6pMNsT0g/ZbYWu6D0QNFUWewaWeGi+uJfaM
	uMyeCkr6tWi+p+O8So+VS0SLYCY72r80t51xRVGgdAFe3XLEhgQQJC+O/m/QDPb4d1JYo7eDXX2ql
	cBsmqXu/vNDuOlIlXsFjYQonGt0Cbm0DdQJmIkdFxRYqYmj8GSEw1oTTviNZVrc/XjG9ZNEyQnXDT
	FS1Y4jZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4jN-00000006764-0fs8;
	Tue, 25 Mar 2025 13:54:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4aX-000000064pS-2hit
	for linux-mediatek@bombadil.infradead.org;
	Tue, 25 Mar 2025 13:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yGj5ru/buKxHnbG4P2Ey4/kWQiecWUhInHR/8cdM730=; b=pVroLDzZhefV2R8HVKgghc9Gdb
	OmjcDuvne4Fk2CWT8KwdO9+iHpu1cj8Y2fF6VzzNAEeuPXYOkATWP2rVfhU6ALmC91Mbesfj+11+T
	HScxrVaPl6KJuI++TjKNXv2St4iG6Nj2D5gjvDUyqbNme9BtiuhF8OKqAPGeMGFGECiO/aC1g/iqV
	OA7YRytKRTEMEX3xkYD77wBT5knd5Lsrz6Vj0B4S+C/N8l0b2nNA92tmdJRY+5EBjKImNn1RZF6yf
	TOVTh24tmN6ZeIWsH5fIMyiyz0qpPWh31qDZmkwKamNd46cDXL0+HceIpb1MeHFWt/jlcujP08DU6
	4FTWv78A==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx4aT-00000005TbY-1syH
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Mar 2025 13:45:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D7DFF43AFD;
	Tue, 25 Mar 2025 13:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 705E3C4CEED;
	Tue, 25 Mar 2025 13:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742910297;
	bh=ZIRDBVEUAGIljq0aPjGWp621DHonEetHh7ohc2xczug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WegDjGZ9qzX+poXATaDPIlEn+NVbEPRBHjMy9ZsePHAMDsgFqhLzhNW4SUdF27l5I
	 Cusj7b0Bt2x/ibPyAJzSsOhnFC4GY41QLTl+LnE69V9FRNOzG0egDBLXvmI6vj7NrX
	 oOZwkzrG4D7oa49v/fSw0uMoF5/BZhs7hAQeKjwnqud92rGeUJj46pUCigfjEmH4YQ
	 R8a+Da/YIauYgkyOT62IEfvSxUwFO17MJciNFh8sd2skFlA7qGNh68tBw+cKiQ3PSY
	 dVpYZqyVxlnncyv1YMyvefMC+Vt9CgnKaum5DjVzi4E6y5t2ZRK0YgtJWdwOzeH1bt
	 sGPCwScJjlMwg==
Date: Tue, 25 Mar 2025 14:44:51 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [bug report] wifi: mt76: Check link_conf pointer in
 mt76_connac_mcu_sta_basic_tlv()
Message-ID: <Z-KzU800Z54V0AHS@lore-rh-laptop>
References: <868e456f-10db-4b0c-bb29-76e3c0d03cc8@stanley.mountain>
 <Z92T5j1zmlvG2ssG@lore-desk>
 <960af30b800baf02d51333a5bf52de93d2966e2a.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cFx5hHH7a4dMTqZJ"
Content-Disposition: inline
In-Reply-To: <960af30b800baf02d51333a5bf52de93d2966e2a.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_134501_871810_161342EF 
X-CRM114-Status: GOOD (  18.70  )
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


--cFx5hHH7a4dMTqZJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 24, Shayne Chen wrote:
> On Fri, 2025-03-21 at 17:29 +0100, Lorenzo Bianconi wrote:
> > > Hello Shayne Chen,
> > >=20
> > > This is a semi-automatic email about new static checker warnings.
> > >=20
> > > Commit 9890624c1b39 ("wifi: mt76: Check link_conf pointer in
> > > mt76_connac_mcu_sta_basic_tlv()") from Mar 11, 2025, leads to the
> > > following Smatch complaint:
> > >=20
> > > =A0=A0=A0 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c:394
> > > mt76_connac_mcu_sta_basic_tlv()
> > > =A0=A0=A0 warn: variable dereferenced before check 'link_conf' (see l=
ine
> > > 376)
> > >=20
> > > drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > > =A0=A0 375	{
> > > =A0=A0 376		struct ieee80211_vif *vif =3D link_conf->vif;
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^^^^^^^^^^^^^^
> >=20
> > Reviewing the codebase, it seems to me it is safe to revert
> > 9890624c1b39 since
> > link_conf is always not NULL running mt76_connac_mcu_sta_basic_tlv().
> > @Shayne Chen: agree?
> >=20
> link_conf won't be NULL in this function at the moment, but it could be
> NULL after adding "MLO reconfiguration" support. So in our internal
> tree, we directly pass struct ieee80211_vif to this function.

ack, but at the moment in mt76_connac_mcu_sta_basic_tlv() assumes link_conf=
 is
not NULL since we dereference it to get vif pointer.

>=20
> Both methods are fine to me, what do you think?

I would prefer the revert for the moment and modify the signature when it is
necessary.

Regards,
Lorenzo

>=20
> Regards,
> Shayne
>=20
> > Regards,
> > Lorenzo
> >=20
> > > Dereferenced.
> > >=20
> > > =A0=A0 377		struct sta_rec_basic *basic;
> > > =A0=A0 378		struct tlv *tlv;
> > > =A0=A0 379		int conn_type;
> > > =A0=A0 380=09
> > > =A0=A0 381		tlv =3D mt76_connac_mcu_add_tlv(skb, STA_REC_BASIC,
> > > sizeof(*basic));
> > > =A0=A0 382=09
> > > =A0=A0 383		basic =3D (struct sta_rec_basic *)tlv;
> > > =A0=A0 384		basic->extra_info =3D cpu_to_le16(EXTRA_INFO_VER);
> > > =A0=A0 385=09
> > > =A0=A0 386		if (newly && conn_state !=3D CONN_STATE_DISCONNECT)
> > > =A0=A0 387			basic->extra_info |=3D
> > > cpu_to_le16(EXTRA_INFO_NEW);
> > > =A0=A0 388		basic->conn_state =3D conn_state;
> > > =A0=A0 389=09
> > > =A0=A0 390		if (!link_sta) {
> > > =A0=A0 391			basic->conn_type =3D
> > > cpu_to_le32(CONNECTION_INFRA_BC);
> > > =A0=A0 392=09
> > > =A0=A0 393			if (vif->type =3D=3D NL80211_IFTYPE_STATION &&
> > > =A0=A0 394			=A0=A0=A0 link_conf &&
> > > !is_zero_ether_addr(link_conf->bssid)) {
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 ^^^^^^^^^
> > > The patch adds a NULL dereference but it's too late.
> > >=20
> > > =A0=A0 395				memcpy(basic->peer_addr,
> > > link_conf->bssid, ETH_ALEN);
> > > =A0=A0 396				basic->aid =3D cpu_to_le16(vif-
> > > >cfg.aid);
> > >=20
> > > regards,
> > > dan carpenter
> > >=20
>=20

--cFx5hHH7a4dMTqZJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ+KzUAAKCRA6cBh0uS2t
rF2wAP40z1Ue/HXLiGDlI1mFYq4wDsaZpo9bk8gxKvEB+mNqcAD/SFH3klxi6wWf
6yyieSY52LJZ697WCVTb2RCtp7r9eAI=
=p0NB
-----END PGP SIGNATURE-----

--cFx5hHH7a4dMTqZJ--

