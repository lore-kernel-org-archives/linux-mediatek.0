Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA94C5DF81
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 07:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLH8tRvP03IrP0Igt+FPh0lRLfkhDDhlhqyfhLJ2ANY=; b=Sl8LNCALr6SH3zD304Py17Xi7N
	uyGjJZxelzjar8djVt5rJVweYOOyWEHLF5utY0NySusRQJzL0cWw20F/FO0e17+SiLn4g97thgPkw
	rhstFFcFaDwMtZJQYjHrOIgSMgiXwBeDL6FATEOBlvLxXsoP6kcYsBXNqYwRTMCyGLXEaefE7nWuy
	PO1RCClHuqnE+1bPO649vibYmYbbTNmsEdifAxWSi1BbIpBLHCFVREN75eH5iaIO/WRoJRhBVRkDN
	jTBNaz1eJQ6bUMbghXmUWQIHdSkq8mxqGIeAbIUdCETPB7Q+wDUDoEDU1NAZHaFLzSS7ogjyNYjtF
	8No4yZlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPQ2-0000000G9NA-15K6;
	Mon, 24 Aug 2026 07:48:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPQ0-0000000G9Mg-1Q4E;
	Mon, 24 Aug 2026 07:48:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DC49340B3D;
	Mon, 24 Aug 2026 07:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6ED1F000E9;
	Mon, 24 Aug 2026 07:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787557711;
	bh=aLH8tRvP03IrP0Igt+FPh0lRLfkhDDhlhqyfhLJ2ANY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oUszDA6I67oDMlfP337Q7h1nsBkLkyATHQ61hiZ5pvYO0BLqbVbxr/Txn8yNeSwA/
	 fN0kvtPsYpyjQ4WC5wDcey9si93RyOLIMfAqBdwfRDyJ5OBh2MF39CiJAeYBDyiRwL
	 aGYxPTPxLoAYQHgPtG+MkLUK3ZzL70vXYzSMd7Ingvzj/+7nY7V2zjj8tj6SeREGOX
	 850Hx32mJjrhpwEVj5TbkPnC2LSWhYd0taZEIv6nKbZ5C4bfsugszMTaRd4INceIrM
	 4NIEnlmxBs6LmsERp3PRxW/Mjudxf8C/Qx1cLGtstHtWDT4kVlwc8cNCo/Vs7/uOpZ
	 Q0uT416HcH0Tw==
Date: Mon, 24 Aug 2026 09:48:29 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Shiji Yang <yangshiji66@outlook.com>, netdev@vger.kernel.org,
	Rex Lu <rex.lu@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: ethernet: mtk_wed: increase WED v2 WDMA RESV_BUFF
 to 0x80
Message-ID: <aov3TTKBZ68yl50k@lore-desk>
References: <OSZPR01MB779537889255E2F606E47EABBCA52@OSZPR01MB7795.jpnprd01.prod.outlook.com>
 <20260821174121.326f3c49@kernel.org>
 <aoljUFw-rQTLDXg0@lore-qca>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xfwh0j0kadPQPpx8"
Content-Disposition: inline
In-Reply-To: <aoljUFw-rQTLDXg0@lore-qca>
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

--Xfwh0j0kadPQPpx8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Aug 21, Jakub Kicinski wrote:
> > On Wed, 19 Aug 2026 21:07:07 +0800 Shiji Yang wrote:
> > > Change WDMA RESV_BUFF from 0x40 to 0x80 to avoid CDM TX FIFO overflow.
> > > Without this patch mt7986 and mt7981 may have WDMA TX hang issue. This
> > > patch was pulled from mtk-openwrt-feeds GPL open source project.
> >=20
> > Lorenzo, could you TAL? (incl. Simon's suggestion of the Fixes tag)

I am wondering if this is necessary for v3 as well.
@Rex any input on it?

Regarding Fixes tag, I think cf26df8833cc is the right one.

Regards,
Lorenzo

>=20
> sure, I am AFK now, I will review it next week.
>=20
> Regards,
> Lorenzo



--Xfwh0j0kadPQPpx8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaov3TQAKCRA6cBh0uS2t
rGDMAP9twXBYSNOh5AC9jnFT39IOAhsK9ISHTnmOXo5O917ihQD+NA+Jb8/BDLYp
06R2nrCbXoWHc8+GmruoqP1fY3oEqwA=
=i5eV
-----END PGP SIGNATURE-----

--Xfwh0j0kadPQPpx8--

