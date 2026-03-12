Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76495FED2FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 10:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbkcZAsQVenBadu60EHqAxIAv/evaeWJ2SDcyDBK0ZY=; b=gdEPnpt+d+Mm6fEyEqCa+34f3V
	lyHMTW4Uad4OWJv9JmmShU6aVDI3KS8LuWvDh8U5FH1NdPT3cyLNxk8+nxt6A7jG0oj9RMR+ySymt
	FeAL3ZPjJprDlWdBZOxxCOaej6vWxl8kkhJzU4wuw4OIaoGv2FCUOfI7cTzvKDUuglls7hTON3Ih9
	E+DM2+bseFR9LFEfPFRgXFTQTq790CI7R2iIvOGnZw+gpnXJc+9tJ/a8rf7ZcVpMxEU7h/hkzpu5s
	A9i8jk1AIhTlTFG1qUNPYuJkvadYlMjOs6YNw/yLtMD3QRgUzjeBKHgxbfMfT3/lCm+CIXYhNPiXF
	akmBGcPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dVL-0000000Dt0u-1Hv6;
	Thu, 12 Mar 2026 10:42:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dVH-0000000Dt0X-2j6Q
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 10:42:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8969A40C2B;
	Thu, 12 Mar 2026 10:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E171AC4CEF7;
	Thu, 12 Mar 2026 10:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773312174;
	bh=XythYX4gT7H5OoNToAuaNhuR3mg0cAF7Ixe3wtnxTcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nSDk72xioRnWeo7OhjH9kfVPaHZE3kpvYUk6LY06P0HHEeVn96GGup6AoSRtYGWJJ
	 1nUqtU1CS7jJxOu3R78qGw8RHrvuUGbNEwuXrBKAlzcEIE1OSYo+pvrIGcwPoa8MaS
	 WMuXpvmcHiDfOHGvFjhdvfRyd1yibBVitbifecSgb6pTk4rEZJupQSm0hlNWoqzJy0
	 siUPkQh3yuLQwGn6IOdHGOKzggfa1o2JDLFrZNR6/5UeizNWYfiPhpqxHxaXBrvRx7
	 e7lXi8wK7LRqoTUBVIcJEokRI4/7/eVibdwAjo+5BcpR12SnHzhY7DcuJAfnaCceZf
	 M/zBgQ+cr652g==
Date: Thu, 12 Mar 2026 11:42:51 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: Re: [PATCH mt76 3/6] wifi: mt76: mt7996: update WFSYS reset flow for
 MT7990 chipsets
Message-ID: <abKYq0-OrV7-sE_i@lore-desk>
References: <20260312095724.2117448-1-shayne.chen@mediatek.com>
 <20260312095724.2117448-3-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FP1s9Lrv1CHcNv+X"
Content-Disposition: inline
In-Reply-To: <20260312095724.2117448-3-shayne.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_034255_800140_23B225D1 
X-CRM114-Status: GOOD (  15.71  )
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


--FP1s9Lrv1CHcNv+X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Peter Chiu <chui-hao.chiu@mediatek.com>
>=20
> Skip WFSYS reset during bootup for MT7990 chipsets; only reset if L0.5
> recovery is triggered.
> Without this fix, the following kernel error may occur:
> Internal error: synchronous external abort.

I guess we are missing a Fixes tag here.

Regards,
Lorenzo

>=20
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7996/init.c  | 29 +++++++++++++++++--
>  .../net/wireless/mediatek/mt76/mt7996/regs.h  |  8 +++++
>  2 files changed, 34 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7996/init.c
> index f3239f530aea..8dfb81eabc9a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
> @@ -791,11 +791,34 @@ static void mt7996_init_work(struct work_struct *wo=
rk)
> =20
>  void mt7996_wfsys_reset(struct mt7996_dev *dev)
>  {
> -	mt76_set(dev, MT_WF_SUBSYS_RST, 0x1);
> -	msleep(20);
> +	if (!is_mt7990(&dev->mt76)) {
> +		mt76_set(dev, MT_WF_SUBSYS_RST, 0x1);
> +		msleep(20);
> +
> +		mt76_clear(dev, MT_WF_SUBSYS_RST, 0x1);
> +		msleep(20);
> +
> +		return;
> +	}
> =20
> -	mt76_clear(dev, MT_WF_SUBSYS_RST, 0x1);
> +	if (!dev->recovery.hw_full_reset)
> +		return;
> +
> +	mt76_set(dev, MT_WF_SUBSYS_RST,
> +		 MT_WF_SUBSYS_RST_WHOLE_PATH_RST_REVERT |
> +		 MT_WF_SUBSYS_RST_BYPASS_WFDMA_SLP_PROT |
> +		 MT_WF_SUBSYS_RST_BYPASS_WFDMA2_SLP_PROT);
> +	mt76_rmw(dev, MT_WF_SUBSYS_RST,
> +		 MT_WF_SUBSYS_RST_WHOLE_PATH_RST_REVERT_CYCLE,
> +		 u32_encode_bits(0x20, MT_WF_SUBSYS_RST_WHOLE_PATH_RST_REVERT_CYCLE));
> +	mt76_clear(dev, MT_WF_L05_RST, MT_WF_L05_RST_WF_RST_MASK);
> +	mt76_set(dev, MT_WF_SUBSYS_RST, MT_WF_SUBSYS_RST_WHOLE_PATH_RST);
>  	msleep(20);
> +
> +	if (mt76_poll(dev, MT_WF_L05_RST, MT_WF_L05_RST_WF_RST_MASK, 0x1a, 1000=
))
> +		return;
> +
> +	dev_err(dev->mt76.dev, "wfsys reset fail\n");
>  }
> =20
>  static void mt7996_rro_hw_init_v3(struct mt7996_dev *dev)
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h b/drivers/n=
et/wireless/mediatek/mt76/mt7996/regs.h
> index 393faae2d52b..c6379933b6c3 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
> @@ -736,7 +736,15 @@ enum offs_rev {
>  #define MT_HW_REV				0x70010204
>  #define MT_HW_REV1				0x8a00
> =20
> +#define MT_WF_L05_RST				0x70028550
> +#define MT_WF_L05_RST_WF_RST_MASK		GENMASK(4, 0)
> +
>  #define MT_WF_SUBSYS_RST			0x70028600
> +#define MT_WF_SUBSYS_RST_WHOLE_PATH_RST		BIT(0)
> +#define MT_WF_SUBSYS_RST_WHOLE_PATH_RST_REVERT	BIT(5)
> +#define MT_WF_SUBSYS_RST_BYPASS_WFDMA_SLP_PROT	BIT(6)
> +#define MT_WF_SUBSYS_RST_BYPASS_WFDMA2_SLP_PROT	BIT(16)
> +#define MT_WF_SUBSYS_RST_WHOLE_PATH_RST_REVERT_CYCLE	GENMASK(15, 8)
> =20
>  /* PCIE MAC */
>  #define MT_PCIE_MAC_BASE			0x74030000
> --=20
> 2.51.0
>=20

--FP1s9Lrv1CHcNv+X
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCabKYqwAKCRA6cBh0uS2t
rLByAP4rQLda5B9RDQpzpqYXM3FYHvraDADlPAx27/reyQf0IwEAw1H/wMPBa4LD
SqFrwozMSZu+cFDnxrU5kEx9SopZRQA=
=897V
-----END PGP SIGNATURE-----

--FP1s9Lrv1CHcNv+X--

