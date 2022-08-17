Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF5EC2BB41
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Aug 2022 07:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mcQVHj71tSV6pnHeTJ+6rYgGXSr0q1NE/aZXcNyhwEI=; b=wtkFNoV9tol39lLLRtxvxLCxij
	fZb3yStKGccl1keQauDiXk4KirjpFKHiHDncSp/hyEVuFoqP8lk76h/eWirtUFOuhiTidnk6i1Px8
	uPzBjdPNFVJ4vxxrBCvS2PSL2wtxpUdlVLFUpETVivFsIEBQjlBxGhwt4o9GB9IiCUMIGF9yxQ2L2
	FN4qGkrMUr+BL2YyPTcG88t4D1SO+5XebgHf1pgsYsa1UUoV7W7VhJe5amYR3RpTMdxzeecFgLQ4Q
	R5RopN6thjgOR6q8YZyFIzLuTPESkYV7Crv3tcV35ViDJexQYsAcNsf1ejBrvrR1Sm0u9qZCw+cBl
	hKeA8eNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oODIM-00Czzv-Vt; Wed, 17 Aug 2022 07:16:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oODIH-00Czu5-A6
	for linux-mediatek@lists.infradead.org; Wed, 17 Aug 2022 07:16:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 916B5611E4;
	Wed, 17 Aug 2022 07:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC2EC433D6;
	Wed, 17 Aug 2022 07:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660720608;
	bh=FNjxzBJcn3CYV/xVJ51Tq5PY0Ainm8ixx5B3ckFEkwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oXrPDL2dBHAPnAYVR1SN3o2dzq+y3gYQVJ+KdoSnqUaArIis40WUQrHsK969NR5Bt
	 gPnKaFZxWDH6Uwgx1DrG2TbkyS32mUwtVtnbY354EhO1H1P/s7q+8A5TjcaUnsLlea
	 nR3C8BzWOFbDt+gLOY1CnovXkyI32IDuRpHTEJ1OnbY8wy8Xkd15k7gOPIfR+NPfnC
	 R4Oo3RG0Gal3U7XCwqpiJsOq2cjMPkMorSroOQ1iEOqauFhMDYNVVoMUxDzKZzpMqM
	 x8q2B4wx4drI9ljLC1JckGpPC4neFTh8Ww9oYGFUkYdanIJUBi4C/DfXDIVfKn5+zQ
	 o3N14qhbMcJAg==
Date: Wed, 17 Aug 2022 09:16:44 +0200
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
Subject: Re: [PATCH 6/9] wifi: mt76: mt7921: drop ieee80211_[start,
 stop]_queues in driver
Message-ID: <YvyV3EBXL1TBQrc0@lore-desk>
References: <cover.1660606893.git.objelf@gmail.com>
 <44acac2a0c1ce4a5d554a24227f80c6ccb3af878.1660606893.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Imdezpl1z2VRY1Ks"
Content-Disposition: inline
In-Reply-To: <44acac2a0c1ce4a5d554a24227f80c6ccb3af878.1660606893.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_001649_466798_A350CCAE 
X-CRM114-Status: GOOD (  17.05  )
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


--Imdezpl1z2VRY1Ks
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> The firmware would be in charge of braking and continuing the traffic whi=
le
> the channel contexts are switching between different BSS and HW SCAN in t=
he
> background.
>=20
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mcu.c
> index 76c8afc00c24..05b625e02265 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -175,15 +175,13 @@ mt7921_mcu_connection_loss_event(struct mt7921_dev =
*dev, struct sk_buff *skb)
>  static void
>  mt7921_mcu_bss_event(struct mt7921_dev *dev, struct sk_buff *skb)
>  {
> -	struct mt76_phy *mphy =3D &dev->mt76.phy;
>  	struct mt76_connac_mcu_bss_event *event;
> =20
>  	skb_pull(skb, sizeof(struct mt76_connac2_mcu_rxd));
>  	event =3D (struct mt76_connac_mcu_bss_event *)skb->data;
> -	if (event->is_absent)
> -		ieee80211_stop_queues(mphy->hw);
> -	else
> -		ieee80211_wake_queues(mphy->hw);
> +
> +	dev_dbg(dev->mt76.dev, "BSS %d is %s\n", event->bss_idx,
> +		event->is_absent ? "Absent" : "Present");

do we really need this? I guess we can just drop mt7921_mcu_bss_event entir=
ely

Regards,
Lorenzo

>  }
> =20
>  static void
> --=20
> 2.25.1
>=20

--Imdezpl1z2VRY1Ks
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYvyV3AAKCRA6cBh0uS2t
rGbiAQCVTRg181gZRU2USMzy+MXhf31XRsa71hVB/N+lh8KdtwEA7qJyl2AFwuFP
PDEEZWrFjg269Fez6epcJ5Ih/WhlOwc=
=nXU9
-----END PGP SIGNATURE-----

--Imdezpl1z2VRY1Ks--

