Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A7CC433FE
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Oct 2022 20:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHgsMKrQMgqvd8MMBYK2bOX1Y6kWV/lXdQIMGZQ1iRw=; b=dOqxS9aMFPyNVXgYfrK1REwOfI
	c9EK2P31mlBsuVH6ZRKOJXJZ3UM3RutseO/msKuAToRy2TKFQGZr9fIe7JRlqOZGdo65+bTrzt+4/
	AJJcRKLV1ibOfnOjBO9u1HiaSVXfu89sDUTphYdQbrzlEyWgOjPC1vjMTYbyShmUlyx+XK+E4QFI8
	tCTDI4G/LWveS9fkNvrUugAQBGS+hSqh7/RK4lD9PElyccB0rooWvfmuO5+R/igp8LL+MGZp/KaZB
	Kh6T4SJXemwTZbOQK4jJf5YJ++Eaey3nUQp6Ecy7GDV4LC3uXAy/E2eNLCbVgcNdrCIKvrNBvt+tv
	AYbR+PTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeizv-00FwPj-Iq; Sat, 01 Oct 2022 20:22:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeizs-00FwNL-Bf
	for linux-mediatek@lists.infradead.org; Sat, 01 Oct 2022 20:22:05 +0000
Received: from mercury (unknown [185.209.196.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E66096601FAF;
	Sat,  1 Oct 2022 21:22:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664655723;
	bh=wqFWOW/OyWDfoee9KFjfBFsXAcHmgvzKirLr3Qysz8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nmL4q3TM9ZtnL2r/8exv0bC7OZ8nfK+U8QCgs/1qtifBuFAjd2U2MgTw5Y1l/twLe
	 yx1w9lYcqC2biP6B/9sgXh+jTvdTdBzJIAclONxKaVaamKULSCr3BKtdkcWBamSZmp
	 70xnpfBvBdOmfW8DXvpWOnARB0fcn10gibrNHlP7ru274pSgvM2T9SPRUL+/q8E07f
	 02JZod4Tu8LbBS80pgxi00rqsieehhSLowvCBBwqVqVT0Tz5kTW81200GAgd8pmRx3
	 5x0JWpxavdl5j47rxzye1fIbvZNdL3N9A4FTLypd/gTUSjzyr8jpDp3Kcw8LhIsjf4
	 7HbhnjsdzTkYA==
Received: by mercury (Postfix, from userid 1000)
	id 9EF95106090C; Sat,  1 Oct 2022 22:22:00 +0200 (CEST)
Date: Sat, 1 Oct 2022 22:22:00 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	chiaen_wu@richtek.com
Subject: Re: [PATCH -next] power: supply: mt6370: Fix return value check in
 mt6370_chg_probe()
Message-ID: <20221001202200.2qhm2hy6lsv7iqxg@mercury.elektranox.org>
References: <20220921152915.1506767-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u47awkpqqf36v5rg"
Content-Disposition: inline
In-Reply-To: <20220921152915.1506767-1-yangyingliang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221001_132204_546250_DF1E47B7 
X-CRM114-Status: GOOD (  17.44  )
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


--u47awkpqqf36v5rg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 21, 2022 at 11:29:15PM +0800, Yang Yingliang wrote:
> If create_singlethread_workqueue() fails, it returns a null pointer,
> replace IS_ERR() check with NULL pointer check.
>=20
> Fixes: 233cb8a47d65 ("power: supply: mt6370: Add MediaTek MT6370 charger =
driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/power/supply/mt6370-charger.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/power/supply/mt6370-charger.c b/drivers/power/supply=
/mt6370-charger.c
> index 716cba259a7a..f27dae5043f5 100644
> --- a/drivers/power/supply/mt6370-charger.c
> +++ b/drivers/power/supply/mt6370-charger.c
> @@ -911,8 +911,8 @@ static int mt6370_chg_probe(struct platform_device *p=
dev)
>  	priv->attach =3D MT6370_ATTACH_STAT_DETACH;
> =20
>  	priv->wq =3D create_singlethread_workqueue(dev_name(priv->dev));
> -	if (IS_ERR(priv->wq))
> -		return dev_err_probe(dev, PTR_ERR(priv->wq),
> +	if (!priv->wq)
> +		return dev_err_probe(dev, -ENOMEM,
>  				     "Failed to create workqueue\n");
> =20
>  	ret =3D devm_add_action_or_reset(dev, mt6370_chg_destroy_wq, priv->wq);

Thanks, queued.

-- Sebastian

--u47awkpqqf36v5rg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmM4oWgACgkQ2O7X88g7
+prwkg/9H8t+w5BDB7ZR23wuGrZXIVllKKOvLNjCDjaRRfQ+lXyF7dJh7i5pc6Gu
5JdXoeUWbL3HxB/DRBQivZrZkkmiJ+4U7qLmRm9OXsyYZ+8MKlkDTbREpz2pKNzi
DB6KRMiYWssrSiOpKwx5Gs0HvCLFx3RD2R0ia6zMWOurNfnNYg/O855JNH4k01XT
5+nFMUFWxhKSO3rGr1SBaCcBohsN3itRp+7xMw5up3iOMA1Egkd6SciMZKAYBCRc
RuAW9cRrNEVtFLjXEyEg92RfWh+dxAtGuHQYMykdAyL+Zm8pUsR0X6OWoQROOdR+
mDMaW8G+oAQC0AuKNBHHgTtvkHx59iK6w42KWS64ehchMwR8FGVQncG6Rfd/oNiV
s1lqZVaXGkucPbglkEjbcVQm8kFJBFwsqUO1nPFU8gw/q+BjveIt+gnNHB+PnOaf
Xbi4ECLr1Q7Uq7DlRKBJqaTT7Yc4s/kyk7jWJFv9SgG2ZTgoErwX+7JDIpH/E3rF
FOQ92uGFDktQ3NArpmCpBIdwgBesln4PvUuVyarMRVgVDtu22kBDldjwgsl3/nE8
FXwpUEyiBPw8nwdzyGtKWlhqinXssW6M1vuGlktMrvWyFcavOGmmcvVr0TxuKLt0
sljzERUFWxQOPYI1zp4BP6i8Ln5wtyqOJxlHUsASs5szRvNzETw=
=ee/F
-----END PGP SIGNATURE-----

--u47awkpqqf36v5rg--

