Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DA6CCA473
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 08:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgS7G4WIdtnDmnSkp0zPUYEdHiMILkNEz0hCi5Dlu7Y=; b=Jb1YqIo9SqjxoMXS/y7iob++zl
	qKudgVCGTYSUEQ+Hr39PfISdx07OWQ5uYwNb8rQD7WPULIp7Lo1aOZiqdMGO+1s58z3dWKSo3feDb
	/D3kmN+TWw0CToJ8hh1+rLMqPfR0BpCdZRbLxeq67TEGyzoz+izUYot6BUfdSWF8pe2x0LzD9poOJ
	9HTuJTl+s3RNUbbumxnoJ+4MqGoShcTKwEg+9MnpRoDfVr1R8eszTY9oXtqpTkPyGFh4CsVxhTxwx
	LeA4JZxhp2idOpQAp0K/pHs3WgVXMjvrcjEZI9kNzOC2iOzKEx4bMsAb34vtdrjKzus2haKHuXBLy
	r92rTfvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtBB-006dk2-B3; Mon, 25 Jul 2022 08:11:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtB5-006dc2-PT
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 08:11:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 64C4361191;
	Mon, 25 Jul 2022 08:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42975C341C6;
	Mon, 25 Jul 2022 08:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658736658;
	bh=k8xhLHCz3oUMcRpGF3e9jxuqOsueg5bn21ox6JISRtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ERkoQNPTMPtjz3i79YEcC/+QEV8zRPz+8wYNeH/HzdwVBMtO/zlvbLTm5r7t3f9e6
	 dAI1eduWKLraH+2FI0+9amVCPTkTD0XWi0pqwgM3YRFhUn/lw8Iw6/T5nMHccj4L46
	 1LaslxUtAywpmDYW/i9se2SRyJWAARRygJLRFwSMgU3dJXod3qyo7fEUQyc0iOXpZj
	 0xe9OOJ4EiiaO7IjwykYMxvhajwUbC/aBzxA2YembsyM4sHQy0FbHZdZ6Nss6UjBlx
	 /n1NNYXde4HvxE2C4qntKNh4OeevB2iaNgRvAmUNjF3CvZQsSdZYEr5ARdU5xBjfSr
	 yL8UgzakZeyLw==
Date: Mon, 25 Jul 2022 10:10:55 +0200
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
Subject: Re: [PATCH 2/2] mt76: mt7921: add mt7921_mutex_acquire at
 mt7921_sta_set_decap_offload
Message-ID: <Yt5QDwm7FNPxj2CM@lore-desk>
References: <acb86f6ecd2f446e4102a2ef2e7a9c0003ae8b46.1658641200.git.objelf@gmail.com>
 <02ef9b9464024d2375caf598ae7c6b1e8e8e20de.1658641200.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T2kgB8bWfD2P6HT/"
Content-Disposition: inline
In-Reply-To: <02ef9b9464024d2375caf598ae7c6b1e8e8e20de.1658641200.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_011059_924637_2D9CA22E 
X-CRM114-Status: GOOD (  15.87  )
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


--T2kgB8bWfD2P6HT/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Add mt7921_mutex_acquire at mt7921_[start, stop]_ap to fix the race
> with the context holding dev->muxtex and the driver might access the
> device in low power state.
>=20
> Fixes: 24299fc869f7 ("mt76: mt7921: enable rx header traslation offload")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/main.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/main.c
> index 7a4a3ed1817e..0d1b17e439dc 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -1404,6 +1404,8 @@ static void mt7921_sta_set_decap_offload(struct iee=
e80211_hw *hw,
>  	struct mt7921_sta *msta =3D (struct mt7921_sta *)sta->drv_priv;
>  	struct mt7921_dev *dev =3D mt7921_hw_dev(hw);
> =20
> +	mt7921_mutex_acquire(dev);
> +
>  	if (enabled)
>  		set_bit(MT_WCID_FLAG_HDR_TRANS, &msta->wcid.flags);
>  	else
> @@ -1411,6 +1413,8 @@ static void mt7921_sta_set_decap_offload(struct iee=
e80211_hw *hw,
> =20
>  	mt76_connac_mcu_sta_update_hdr_trans(&dev->mt76, vif, &msta->wcid,
>  					     MCU_UNI_CMD(STA_REC_UPDATE));
> +
> +	mt7921_mutex_release(dev);
>  }
> =20
>  #if IS_ENABLED(CONFIG_IPV6)
> --=20
> 2.25.1
>=20

--T2kgB8bWfD2P6HT/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYt5QDgAKCRA6cBh0uS2t
rKDLAQDJSgEuAPWrrbsgIEDAYgBeimgvB7ya5R5qpINHW7/l4AEA1NTpWRg/Etb2
WZQokgeN6fjZjd37BcXID/UgyUe3bgs=
=wWb+
-----END PGP SIGNATURE-----

--T2kgB8bWfD2P6HT/--

