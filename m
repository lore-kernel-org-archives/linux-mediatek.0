Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1783CCF9F8
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 10:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRF55jviY3YPI2S01ZVlPxUgMValLPqLCZEdSIOSirw=; b=WNYYrXmXApXWYtej8gmrzYHsT5
	NpM4MGowt7B8BqGmY95HTr1WXCBMpEDQxLvo+UTFBO1+hv7oNQW4aBUzPwqwcpNeVNchbmWJNCri8
	0BLpS3d59yJrnW9+UnDpD/jsK2rkxQC6uKh9Ng6bbRX9qzobNb2xVSwPrpr7Y52Xl03lh/CloTZ73
	BQe0c2c0Z/3IxJscdYk0oeVzF/WhTxJWJjeEAScDEhVHjHocOl3lSY7TzMVNdBXgH5p6flDOQ/W51
	jJfsWHK2f/B3C11unjIhpJpPdI2RO8WJ4LwL86VEpO+GKpwhjFLcRXReN7L4zZFdcgEpF0JspuWYv
	HiUENpPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGb1I-0000000DVDh-3L9Y;
	Wed, 05 Nov 2025 10:45:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGb1G-0000000DVDL-0nsO
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Nov 2025 10:45:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 658BF4372B;
	Wed,  5 Nov 2025 10:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E790BC4CEF8;
	Wed,  5 Nov 2025 10:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762339537;
	bh=XUxQkFzm2ntfKhAKsIXF1wgtxzoKKB7QpKNwXNOR/Pc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PQLu417kS68EBBg8JZ5dJhq9aQkfkD9JzLbFaV6K7wUGx5AKSCxGoYbegiiu24KbO
	 0sRJARx0voSfhR/zPY27my7V3BLgpYzJ0fvKLc3kM4RllM0ZC5XObtmJIXJE/Fa8nz
	 9wfoLbDoResYAUmgzVR4IWG7N9mia64L0t2SMXIY5OoMNVvQm1iVl5tL6TbIlKs6pP
	 nIhrygISomL/SNnIAgbjFgfAlzLGEDGBtg0et7U65nAeyILjDxh6BjREmSv6pOuCmA
	 dpbCn4oXnM/o+H0kmTPaOmUa53IXhEn+5KrYKZqwh12reulAm8WCGJScvC7j8a6nbE
	 iVso2FuQZ1CXg==
Date: Wed, 5 Nov 2025 11:45:35 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH mt76 11/12] wifi: mt76: mt7996: fix using wrong phy to
 start in mt7996_mac_restart()
Message-ID: <aQsqz00YLrpa3O7d@lore-desk>
References: <20251105093100.541408-1-shayne.chen@mediatek.com>
 <20251105093100.541408-11-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s5qeNP2oqWG8e4B/"
Content-Disposition: inline
In-Reply-To: <20251105093100.541408-11-shayne.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_024538_274948_4AD97C5A 
X-CRM114-Status: GOOD (  13.59  )
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


--s5qeNP2oqWG8e4B/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Pass the correct mt7996_phy to mt7996_run().
>=20
> Fixes: 0a5df0ec47f7 ("wifi: mt76: mt7996: remove redundant per-phy mac802=
11 calls during restart")
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mac.c
> index c1f2938d1f21..2c869f710193 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> @@ -2368,7 +2368,7 @@ mt7996_mac_restart(struct mt7996_dev *dev)
>  		if (!test_bit(MT76_STATE_RUNNING, &phy->mt76->state))
>  			continue;
> =20
> -		ret =3D mt7996_run(&dev->phy);
> +		ret =3D mt7996_run(phy);
>  		if (ret)
>  			goto out;
>  	}
> --=20
> 2.51.0
>=20

--s5qeNP2oqWG8e4B/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaQsqzwAKCRA6cBh0uS2t
rByDAP4uofMqJn2ESt9OTfVLD0eRuRjXZgQDi7W3g9D/LQUNywEAqar7wDUleGkP
uQjEdRU4xKhvJv9UUhJvzKJ0TEjHRAM=
=noBq
-----END PGP SIGNATURE-----

--s5qeNP2oqWG8e4B/--

