Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E974C44520
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 11:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWpd+DeC6GUGcC5xnH0y84cDRG939JqQXdR158A4ElA=; b=n2aUpFqoM5rBcTtahWet99mfec
	TxX8UR3Ro6stmyi3KuzeMXXbWnXRdXpVyBa9NRQHxI1TWMpum4tP6ZK3nNODBLATKbxTCI6C0K+Nv
	iQZ5Q0Tx7Ws3MuuLKpOvMaVQZdDMPn8txR3mc+ROlrQJcNRKsRHYUR2Ld1yEFfAbvkTixyMulksJG
	Hxok7LZuVsjRir8TONQOwACxrSQOIWCztNRPSdQb6l6PqX583Ni+P//Ry+oA3XYMYOA88HqqFFPm5
	7KwCTZRMjiLl4MJ2KN+0v+3hVmwCcSZzR30lKu2mqOfXs/OdYC18xf4gtBnhhnObPVUsFNMveKjcc
	fKQE77kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllva-00000006Ztb-2D2m;
	Mon, 20 Jul 2026 11:12:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllvZ-00000006ZtO-3l5q
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jul 2026 11:12:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A75840AE9;
	Mon, 20 Jul 2026 11:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9717B1F000E9;
	Mon, 20 Jul 2026 11:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784545973;
	bh=QWpd+DeC6GUGcC5xnH0y84cDRG939JqQXdR158A4ElA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oLchMXO/tq6thxzwrqZ9dMIfF8YfuNtT/LlXTQpygEtpaWmsd2TMVjpkOX4AyMW/l
	 2zNiLFbGe4xBqwjyhTLysbWtfeAD9P4josELC011UC9b+8i90aWGpurRKnKDxxdKAP
	 fhvGdDIW9tT7a26dPaI6MS4GFGmUUgfmCRg04AaSQCbW1IrCEa4ETPut1/sK1oSUUV
	 tMdgVmbsr/2EuZt2sLbSB9+suR8RtzvHm9p0IWtpOQlDjpXe7hwIeSqNv/xxjGI3zi
	 +y+VuX3RPKtAGQ03aYxrnPwHVSgrxzuW2OQi/0ykD0IgLNWkd5c3N41Wg6y5RPZxtZ
	 O4ay8JJeIZXzw==
Date: Mon, 20 Jul 2026 13:12:50 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Pan Chuang <panchuang@vivo.com>
Cc: Linus Walleij <linusw@kernel.org>,
	"moderated list:PIN CONTROLLER - AIROHA" <linux-mediatek@lists.infradead.org>,
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] pinctrl: airoha: Remove redundant dev_err()
Message-ID: <al4CsgKsPOjLbMOG@lore-desk>
References: <20260717105847.131359-1-panchuang@vivo.com>
 <20260717105847.131359-2-panchuang@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SXE91GLyrT1/fSSM"
Content-Disposition: inline
In-Reply-To: <20260717105847.131359-2-panchuang@vivo.com>
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

--SXE91GLyrT1/fSSM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
>=20
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/pinctrl/airoha/pinctrl-airoha.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 04b4424c688b..abfb018f207e 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2519,10 +2519,8 @@ static int airoha_pinctrl_add_gpiochip(struct airo=
ha_pinctrl *pinctrl,
> =20
>  	err =3D devm_request_irq(dev, irq, airoha_irq_handler, IRQF_SHARED,
>  				dev_name(dev), pinctrl);
> -	if (err) {
> -		dev_err(dev, "error requesting irq %d: %d\n", irq, err);
> +	if (err)
>  		return err;
> -	}
> =20
>  	return devm_gpiochip_add_data(dev, gc, pinctrl);
>  }
> --=20
> 2.34.1
>=20

--SXE91GLyrT1/fSSM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCal4CsgAKCRA6cBh0uS2t
rHN/AP9WOMMqAKBkonIPmZJjNZHnygVO1hiEz0O2OzJGOpC/rQD/VbXrG4odBVqc
+qAQn+JF55oPPslgw2SiHZTDmMgpDQs=
=0x8e
-----END PGP SIGNATURE-----

--SXE91GLyrT1/fSSM--

