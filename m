Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCB5E776C7
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 21:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAb9Rl6mZ2mUGk/MsQB87kPN57x+9VPSzEONBzAVyi8=; b=E/AtTj/qnUuR0BfSXE+nAMqTTH
	m2nD89Mfge6zaJvgYxgyY2532VgsPBg6RfFtn5ZuyNnuyMGHqpzSVwzog11bLEfmAeNlZkek4TKM4
	jAtDgO1xh/s7Hlqo7V5+OEFQe0vyvQ1zLk3ZpStxp0UAi9k1Wcp31TEnnwCVbmm3C41rtmpPMnpZ+
	ccjhDRP7HftyFZUXrWXQxdsCEbQCqJBxDc+hWfAUeRsDmvAmpKLVtzEvc/2MK3oI/e+Dwm2cHYK3G
	RVLNswZU5vUe5Z8BJ/pcWRu+1kFrbtBuhAZL5+thBkeUAS4CRQv877VftI07eO2Tgb6fiNvkSTd/s
	S38NjMyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnQgA-00DPvp-15;
	Mon, 02 Oct 2023 21:42:14 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnQg6-00DPti-1x
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Oct 2023 21:42:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnQfw-00023R-MI; Mon, 02 Oct 2023 23:42:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnQfu-00Acl9-QP; Mon, 02 Oct 2023 23:41:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnQfu-008GRu-H5; Mon, 02 Oct 2023 23:41:58 +0200
Date: Mon, 2 Oct 2023 23:41:58 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH v2] usb: mtu3: Convert to platform remove callback
 returning void
Message-ID: <20231002214158.wvhals4ywezftepo@pengutronix.de>
References: <20230914200251.919584-1-u.kleine-koenig@pengutronix.de>
 <2023100219-variety-genre-befe@gregkh>
 <20231002144959.jc6wwfrvwd4cyu2l@pengutronix.de>
 <2023100253-amino-pencil-9a96@gregkh>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hg27zwbq4ewyulrd"
Content-Disposition: inline
In-Reply-To: <2023100253-amino-pencil-9a96@gregkh>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_144210_648545_B23CE15D 
X-CRM114-Status: GOOD (  26.44  )
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


--hg27zwbq4ewyulrd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Greg,

On Mon, Oct 02, 2023 at 04:53:05PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Oct 02, 2023 at 04:49:59PM +0200, Uwe Kleine-K=F6nig wrote:
> > On Mon, Oct 02, 2023 at 04:39:47PM +0200, Greg Kroah-Hartman wrote:
> > > On Thu, Sep 14, 2023 at 10:02:51PM +0200, Uwe Kleine-K=F6nig wrote:
> > > > @@ -469,8 +469,17 @@ static int mtu3_remove(struct platform_device =
*pdev)
> > > >  		ssusb_gadget_exit(ssusb);
> > > >  		ssusb_host_exit(ssusb);
> > > >  		break;
> > > > -	default:
> > > > -		return -EINVAL;
> > > > +	case USB_DR_MODE_UNKNOWN:
> > > > +		/*
> > > > +		 * This cannot happen because with dr_mode =3D=3D
> > > > +		 * USB_DR_MODE_UNKNOWN, .probe() doesn't succeed and so
> > > > +		 * .remove() wouldn't be called at all. However (little
> > > > +		 * surprising) the compiler isn't smart enough to see that, so
> > > > +		 * we explicitly have this case item to not make the compiler
> > > > +		 * wail about an unhandled enumeration value.
> > > > +		 */
> > > > +		WARN_ON(1);
> > >=20
> > > Please don't add new WARN_ON() calls to the kernel, print out a big
> > > error message and return, don't reboot the machine.
> >=20
> > Huh, printing out an loud error message was my intention. It's news to
> > me that WARN_ON() reboots the machine?! I thought BUG_ON() was the one
> > with the effects you describe that I shouldn't use.
>=20
> panic-on-warn is set for zillions[1] of Linux systems out there, so syste=
ms
> will reboot.

The people enabling panic-on-warn *ask* for a reboot if something
strange happens, right? If ssusb->dr_mode is USB_DR_MODE_UNKNOWN in
=2Eremove() but wasn't in .probe(), that's strange, right? If I don't
enable panic-on-warn, my system just emits a warning and then the driver
copes with what it has, right? Sounds to me as if WARN_ON does exactly
what is the right thing here.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--hg27zwbq4ewyulrd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUbOSUACgkQj4D7WH0S
/k73VAf/bYOpCEbYJH0iGNvkDefNZLTcSn9QJ7WebUaLIjOe6+f4f0djN+kP4vrg
OGSxlu57k6P1LmlUSBQRPM2lgiYhXdkYiPKy+hLwMFPHJZjjDvKg+ehYkMuJM8ak
DclcequZV219HDC2z687M6Xw13s4cyE2UGtMXjYzwKnPKDtXJ9d+puvjAhfZNOdu
UDRwgHuJ02J0SyQ3IdqgwH2E3ftI9zD2b0NEPscXdKvA5UHY/Hj1e79ogW74dmaO
Jqo7paa/IBXFEi9sB8bRi+E6K+D7Q1c6i7Ymu6FAla3PZirGhrv7Q/69718utVuT
xuKImDDI7RbiEu1LvGV4c9/PFlVcSQ==
=UXJW
-----END PGP SIGNATURE-----

--hg27zwbq4ewyulrd--

