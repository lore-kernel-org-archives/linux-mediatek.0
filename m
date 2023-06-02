Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DC0C7EE24
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jun 2023 17:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+42gaeJb2u3siSwF/hp03h+CLzRFqLsZJOmxuwOppE=; b=Z4e10cc+eKQYBGsONWaF28kGRS
	tSqT9vaM9zj21pe0qssFVdwDsCAhWKTpyDHARO0HD662s94zcN4xFTzPE9YdODN/C8FyIbCskhlUC
	j2a358E+HIYit/tIsKVXlGtFFdFIY/yJsTV3faodvZJDPEF8BVlxq8J0AthUq5+6PM/jT3siVCuUw
	xkyF3zHBUVR2Fz3w57Ol6clZS3DIyJiOHKW18I5yRAmPKvZcuwWKlXxgUvaoGLbgqaVrVypYCmujU
	0FDmpTpPtyZq0aP0nr1IQ4cjtUcC5Vc7Pwl3t1eXXXiMbwaEw2YXzGslTk9FRBEqz9SyJ6vgtCT6k
	oEVD6iXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q58zb-007a4o-2Q;
	Fri, 02 Jun 2023 17:55:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q58zY-007a35-28
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jun 2023 17:55:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C58E660DCB;
	Fri,  2 Jun 2023 17:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9BA2C433D2;
	Fri,  2 Jun 2023 17:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685728511;
	bh=wHywu+RF91fy7hmYuHvNUaDvXGEq/Uct5KanB8RILG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yjqx9fv9dYrvA/mX2DcMrrQvh1Ek+2ZA7mvCIAYvnL550HIRqIH22r0e+PxgieXev
	 EcJhJLXwanmOlqx8CEcsMyPSrfU91mJVYDwOwoT0tBWnJg6q+bE9YdRW3hQEkm48XO
	 ltfN9p1SdHmbmL8CJ0keYKfM/TbLh5DdX+b6SabluyEFpgaSTc9LamY7VMTptMNvM4
	 ZQABpnmrrU8AT47Pu8H9ZWRkz6tJl8OSsp1LK0+Tf2Ly8tY00Uzw18/+tfdfAkwBk7
	 Ml10uBndLpFH9doUqiyjv+6wTTmYPEM0+tjfv3akkli4Ms4LpWH4T6Gp1C+Gx8tWP+
	 OB+jA02Qb1tHw==
Date: Fri, 2 Jun 2023 19:55:07 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: Re: [PATCH 02/12] wifi: mt76: connac: add a setting bit for dsp
 firmware
Message-ID: <ZHos+yjBQRAx3gpA@lore-desk>
References: <20230602152108.26860-1-shayne.chen@mediatek.com>
 <20230602152108.26860-2-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aogP8xRthm0enbSl"
Content-Disposition: inline
In-Reply-To: <20230602152108.26860-2-shayne.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_105512_758884_C71DB982 
X-CRM114-Status: GOOD (  14.43  )
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


--aogP8xRthm0enbSl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Peter Chiu <chui-hao.chiu@mediatek.com>
>=20
> Add FW_START_WORKING_PDA_DSP for the indication of starting DSP
> firmware download.
>=20
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> index ca1ce97a6d2f..4a21c237ea6e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> @@ -22,6 +22,7 @@
> =20
>  #define FW_START_OVERRIDE		BIT(0)
>  #define FW_START_WORKING_PDA_CR4	BIT(2)
> +#define FW_START_WORKING_PDA_DSP	BIT(3)

I would say this patch can be merged with 3/12 where FW_START_WORKING_PDA_D=
SP
is actually used.

Regards,
Lorenzo

> =20
>  #define PATCH_SEC_NOT_SUPPORT		GENMASK(31, 0)
>  #define PATCH_SEC_TYPE_MASK		GENMASK(15, 0)
> --=20
> 2.39.2
>=20

--aogP8xRthm0enbSl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZHos+wAKCRA6cBh0uS2t
rNJhAQChExhBQeOGbdISgwlArNKKtp8KXZLWUinOxzzUZ/z08wEAtSTuDIDJAKPO
4nnt6W+k8BOJllWKLi/pbgaL1HQQmQI=
=jdxX
-----END PGP SIGNATURE-----

--aogP8xRthm0enbSl--

