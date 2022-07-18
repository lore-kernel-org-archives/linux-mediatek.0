Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B929EC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 22:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5P2L0WLevPL4mEs+mahKfKvJT3Ds4cVYwiT4kd7ZdY=; b=SvzZIubNC4jKi4UfSuA8mA04J9
	DX+uGoy8+b3UtbZsQ+aRWhzAKFVja+IUuvAacfR1jEgKU3yjkzMAvTXWt+pXqyEvi8rSnFfCV35mI
	4ltOv0YUZZ6DOFpyx31IBw7mt3DWo57JnXQzP5b1bBD/L7QOmlHDxw8dAiXqrNWHVAnA2bT4cqOGv
	tETv24OjSC1dyUJr4zTuV5A79BgKwS9tz+tLHnQAU9rsk/r1vWuniAcJDNn9R1dTvEfEzVy7RCmQm
	itMTHsmcN6Qjb5xHJwoAJENzOvd0WcX7jCJrB+21U8G/8F+Bb2dczuKP/LdKBf5YdspAY7+jTx2Ud
	yOKVdsfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDYyd-001y7L-9c; Mon, 18 Jul 2022 22:12:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDYyb-001y3k-1v
	for linux-mediatek@lists.infradead.org; Mon, 18 Jul 2022 22:12:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8A32C61537;
	Mon, 18 Jul 2022 22:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFFDC341C0;
	Mon, 18 Jul 2022 22:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658182347;
	bh=xuEBZAMFlkeQ8csFA8rfMNdciRkANyRKQIQb5OMD2Y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LVE584MiBk4opyD8B3ila+raoI7hvHfL4nItCc4ZqkDGSp/wB+ofxbkwx6j4uptrK
	 NWSxG9pP6AgDh+8qnkmE13nrQhmcghQeXJeHTQt4tVf5jVVCA9MjL5j/nTKPyjJDLl
	 1cIr9ajUqKH10K0qVzBReYY2buRJX1/xps3XlD56fcHrdLyOmXhbYvWgOs7iyaGCPO
	 2kb4Zlel+QzVqFWScH9ikalvbtCdgJJten/SfPKXMz/dt2j0Ur/6HlqzAJ4f4ffrhj
	 r9KOG3gm3kBRh36I0MQpZZLZPuRRpMRTzTcuVfRozXyedfUaLgApGlZRMjUF2AIlBa
	 0TtIP/kK+r1qg==
Date: Tue, 19 Jul 2022 00:12:24 +0200
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
Subject: Re: [PATCH 4/4] mt76: mt7921u: remove unnecessary MT76_STATE_SUSPEND
Message-ID: <YtXayNzRHEQ2ut2l@lore-desk>
References: <a1437e413116364ac9f3b777c7922ca0728ddc0d.1658176701.git.sean.wang@kernel.org>
 <2938c18e2a14e26de293adcf68cd851ca0a7474a.1658176701.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MetnIjz+5ZCpraq0"
Content-Disposition: inline
In-Reply-To: <2938c18e2a14e26de293adcf68cd851ca0a7474a.1658176701.git.sean.wang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_151229_159874_1AE915C5 
X-CRM114-Status: GOOD (  14.63  )
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


--MetnIjz+5ZCpraq0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> remove unnecessary MT76_STATE_SUSPEND manipulation to be consistent
> with the mt7921[e, s] driver.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/usb.c | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/usb.c
> index 124d62c0dfa4..a8ea03d4f990 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
> @@ -313,8 +313,6 @@ static int mt7921u_suspend(struct usb_interface *intf=
, pm_message_t state)
>  	mt76u_stop_rx(&dev->mt76);
>  	mt76u_stop_tx(&dev->mt76);
> =20
> -	set_bit(MT76_STATE_SUSPEND, &dev->mphy.state);
> -
>  	return 0;
> =20
>  failed:
> @@ -354,8 +352,6 @@ static int mt7921u_resume(struct usb_interface *intf)
>  			goto failed;
>  	}
> =20
> -	clear_bit(MT76_STATE_SUSPEND, &dev->mphy.state);
> -
>  	err =3D mt76u_resume_rx(&dev->mt76);
>  	if (err < 0)
>  		goto failed;
> --=20
> 2.25.1
>=20

--MetnIjz+5ZCpraq0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYtXayAAKCRA6cBh0uS2t
rBb9AQCLIcE0D+bIK36JveSLI9KH5D89zJ9ktnGQHzlWY7WWvwEAvnNqDBIKVlIU
NKfbokH7KQK55UAEAMMV0LK7XKddjwQ=
=X1MV
-----END PGP SIGNATURE-----

--MetnIjz+5ZCpraq0--

