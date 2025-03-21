Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9D7C36000
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Mar 2025 16:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/8KTx1eeqEjjebui1d66i/bmflgBbIgoJl2daZ/Id0=; b=cM6cHtZVdT7qGmYJpExIQzN3r+
	lprsnHJhf5Wj0UhzPJb6KwMKyqZZiTGIJhE+h9/U+g4JnXPGj7ApxcUUEcMFx5YKAe0lacK5G31tq
	Qv/KmmKn+alwv61kAIW5+eYrmR3aPP5dT6jItBpD9R1hfRtNM4n680tcdGSJnBDjM7QsB1+FFZRJs
	5kOjv7VN6eoOif4fo6+f8qyTuz8uUZc44IVKPOW6EFj9rVRZBXDnbJaObk3FnNGHbseEsF9CiZYtX
	ACVQbuZSPQJFI9JT7MVI/oKfwuAPdkCHuincceKNWSIefRJbIP/u0KcfUuSI1jjRi23QwDu+Nn9o9
	P992xFuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfFU-0000000FVbK-0zMw;
	Fri, 21 Mar 2025 16:29:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfFR-0000000FVaK-30do
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Mar 2025 16:29:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1E7285C5CB6;
	Fri, 21 Mar 2025 16:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46CB4C4CEE3;
	Fri, 21 Mar 2025 16:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742574568;
	bh=lmEYXsRWnmbpUxKrOWgi5Or9TPBOQ6U6vJbfix6E+zo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UMN4SOVRtPkZTBpUD3jH+4zGB0ku7JHrFIT+vAQiL/Z4cOxXSTo9fj7afgLG+/9Jc
	 t7YZOYDkazbo6HeFzPx+9nPSuZgFAnZ9XNSa8Ii79r8wuQWtwQ6+D3hUkzPEVlkYSE
	 YVfJfnf5q95tqmpV6kQYJMQ05C8dMntDTyumnFexymmWVizlNU0tK0bdIJ6xp0668x
	 CXSZjgEN62WSJ6JghxbCfNWPuDvgAWzIc+fLj8QGVZWzOz3hsJlVvf/SOk3KoIeGC2
	 byU4XOms9w8mva5SKn7TMOXVYdr9+/YPlyftLyXU33VPqrqPUEDLkRT+uXhfGVucHc
	 Mway6Qx+BCg8Q==
Date: Fri, 21 Mar 2025 17:29:26 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [bug report] wifi: mt76: Check link_conf pointer in
 mt76_connac_mcu_sta_basic_tlv()
Message-ID: <Z92T5j1zmlvG2ssG@lore-desk>
References: <868e456f-10db-4b0c-bb29-76e3c0d03cc8@stanley.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hpR/nQwqSRiKRp01"
Content-Disposition: inline
In-Reply-To: <868e456f-10db-4b0c-bb29-76e3c0d03cc8@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_092929_810033_F88CCD9C 
X-CRM114-Status: GOOD (  10.38  )
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


--hpR/nQwqSRiKRp01
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hello Shayne Chen,
>=20
> This is a semi-automatic email about new static checker warnings.
>=20
> Commit 9890624c1b39 ("wifi: mt76: Check link_conf pointer in
> mt76_connac_mcu_sta_basic_tlv()") from Mar 11, 2025, leads to the
> following Smatch complaint:
>=20
>     drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c:394 mt76_connac_=
mcu_sta_basic_tlv()
>     warn: variable dereferenced before check 'link_conf' (see line 376)
>=20
> drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
>    375	{
>    376		struct ieee80211_vif *vif =3D link_conf->vif;
>                                             ^^^^^^^^^^^^^^

Reviewing the codebase, it seems to me it is safe to revert 9890624c1b39 si=
nce
link_conf is always not NULL running mt76_connac_mcu_sta_basic_tlv().
@Shayne Chen: agree?

Regards,
Lorenzo

> Dereferenced.
>=20
>    377		struct sta_rec_basic *basic;
>    378		struct tlv *tlv;
>    379		int conn_type;
>    380=09
>    381		tlv =3D mt76_connac_mcu_add_tlv(skb, STA_REC_BASIC, sizeof(*basic=
));
>    382=09
>    383		basic =3D (struct sta_rec_basic *)tlv;
>    384		basic->extra_info =3D cpu_to_le16(EXTRA_INFO_VER);
>    385=09
>    386		if (newly && conn_state !=3D CONN_STATE_DISCONNECT)
>    387			basic->extra_info |=3D cpu_to_le16(EXTRA_INFO_NEW);
>    388		basic->conn_state =3D conn_state;
>    389=09
>    390		if (!link_sta) {
>    391			basic->conn_type =3D cpu_to_le32(CONNECTION_INFRA_BC);
>    392=09
>    393			if (vif->type =3D=3D NL80211_IFTYPE_STATION &&
>    394			    link_conf && !is_zero_ether_addr(link_conf->bssid)) {
>                             ^^^^^^^^^
> The patch adds a NULL dereference but it's too late.
>=20
>    395				memcpy(basic->peer_addr, link_conf->bssid, ETH_ALEN);
>    396				basic->aid =3D cpu_to_le16(vif->cfg.aid);
>=20
> regards,
> dan carpenter
>=20

--hpR/nQwqSRiKRp01
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ92T5gAKCRA6cBh0uS2t
rLNgAP9tC4J+M4wDG8h4ZEDM1k/jkGmC7PNmQVy7a226Rx2iygD/fxXhKmQHoksW
nmYHScqg5z/lqKE600x6/UU/2F+y9gI=
=dwUL
-----END PGP SIGNATURE-----

--hpR/nQwqSRiKRp01--

