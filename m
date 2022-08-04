Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB65C19F2B
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 08:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=orL6gaCTeXqLl3AC+BOQ1EisRhhAac9Y4lBqS21CORM=; b=fgQVd/t9E9aLhxSvMHSeQt1gxA
	Li74GA2mocB6+N9yQq9P3e3o2p4vvThvnSpCAhqRIS6doysNuSg8q8Krx0TLFzv4N6yPP6VmqLVTY
	UPg7S/WoF5fEvHY7s8Mn8wKIIEjsSERwtXHwE6amsXhSCYWqvwbuT4U/nfnFqDWiN7itpEb29Rgxw
	62sssz76RqOJIVvkUhcmRfy73LIqXFeniqOpRCFBgL2lCf8CTi1d7nLCk4AoYackpF5crCyMbh9XR
	ThafUJyXLpQyJsCv3cUHEWKwIOERGm6iRvOWNRT2tYT73QmWU4wZf3KIlVFqbeIurdqclZ1QjlZTq
	hqX3qh/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJW26-004NM3-Ii; Thu, 04 Aug 2022 08:16:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJW23-004NJx-Cl
	for linux-mediatek@lists.infradead.org; Thu, 04 Aug 2022 08:16:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4BDAFB824AA;
	Thu,  4 Aug 2022 08:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA01BC433D6;
	Thu,  4 Aug 2022 08:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659600996;
	bh=TgAmjiVkTrdSm/6pnCy/kBDPBm8BpNosKqAmgj2xAkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=izHp11RiDUxVAvYxKVVfQxEUN6795gsrZDGyRUVQJ2/UI3u2Zp0nQqalkKCjoUkfn
	 Ww3QHNifuyPVF/fz9uOuu20jYHfjtVQopNwjliju5SpGWMe6Pc6+AUSpCgmcWLVSxR
	 zn0FEwSFJS97LlNC1+w5f9Pb5V0Wb2o9mRaJk78X8Ln9opBRmdAmuKrZzT4Z3VzMAm
	 pQ5//lS9Hl0lHLFB67iUFhfUOmcQjvK21Pvza5QrUYfIxOxH2GNa2pvxD8WgwEtJ55
	 eA0IzJLqxQlSFos+dnG2E1LlpgK6fx0zSi1650lP6QaqQQwjLD6eyNMCKDC/cCnrOc
	 VtaMIqAymFP0Q==
Date: Thu, 4 Aug 2022 10:16:31 +0200
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
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mt76: mt7921: apply the previous MCU timeout
Message-ID: <YuuAX3aa/bmL5ZdM@localhost.localdomain>
References: <b0dfe8afc5cf88ab9a6d54c88fba4a29631c125a.1659571732.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t1gystbou+6iIMQK"
Content-Disposition: inline
In-Reply-To: <b0dfe8afc5cf88ab9a6d54c88fba4a29631c125a.1659571732.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_011639_630831_2C94B3FC 
X-CRM114-Status: GOOD (  18.11  )
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


--t1gystbou+6iIMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Apply back the previous MCU timeout that can trigger the chip reset to
> recover the fatal error in time.
>=20
> Fixes: 8fcd1fb7cbd5 ("mt76: move mt76_connac2_mcu_fill_message in
>  mt76_connac module")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
>  b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index 0afcadce87fc..da8223c515eb 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> @@ -3050,7 +3050,10 @@ int mt76_connac2_mcu_fill_message(struct mt76_dev
>  *dev, struct sk_buff *skb,
>  	u8 seq;
> =20
>  	/* TODO: make dynamic based on msg type */
> -	dev->mcu.timeout =3D 20 * HZ;
> +	if (is_mt7921(dev))
> +		dev->mcu.timeout =3D 3 * HZ;
> +	else
> +		dev->mcu.timeout =3D 20 * HZ;

Hi Sean,

I did not get the fix here since we are setting dev->mcu.timeout in
mt76_connac2_mcu_fill_message caller (e.g. mt7921s_mcu_send_message).
Am I missing something?

Regards,
Lorenzo

> =20
>  	seq =3D ++dev->mcu.msg_seq & 0xf;
>  	if (!seq)
> --=20
> 2.25.1
>=20

--t1gystbou+6iIMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYuuAXAAKCRA6cBh0uS2t
rGTHAP9ExebmolMqnxYqbtRdAAq10uHV8hUpGFllKQ066SKV7AD/aMllw/3B1LV5
D8K3fkvd/co6o2v+ZmTf/MmY3NymZAE=
=RqkO
-----END PGP SIGNATURE-----

--t1gystbou+6iIMQK--

