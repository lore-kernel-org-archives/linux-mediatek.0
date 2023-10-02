Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E29BE784B9
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 14:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RK4VpNJ4d29K/ZX6NZ9TyZOIAS37c7hyvNgmp5Azge4=; b=dVZXR++mXc7Fa9pBfZo6lztL8t
	vrbrbpi3fVBYczQlu7r5SItXHkN8aMH9+VfxsCecHNRRjTkaXrLhGpSYQmD81l1v1xnp0OHFMcmUO
	0eiKpmHAeqmt2SEvXTWTSZaOsqzxvLeobHlt1UbFWqOQsiPWWzh/GDeKX4YcjeQyGLElNZUyIsMYQ
	FoGHXBk8TpQ+SFK6Y4EiD9seFvCfdowuSu7hfZjZ4G/2Qw5HSHstJqkwEiHQkovf1w3cp3KKsQjz2
	NlzoXYEXVoCppfTMmE+q9TZ/ph0tHMziVCokN8UYFY6Udz5g4Dzmx6tjgaBPaKNHvYYUl1UoltKsa
	dKMzxZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKFS-00CunZ-2k;
	Mon, 02 Oct 2023 14:50:14 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKFP-00Cumv-0O
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Oct 2023 14:50:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnKFG-0006vn-V6; Mon, 02 Oct 2023 16:50:02 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnKFD-00AXvt-VV; Mon, 02 Oct 2023 16:49:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnKFD-007xLb-M9; Mon, 02 Oct 2023 16:49:59 +0200
Date: Mon, 2 Oct 2023 16:49:59 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH v2] usb: mtu3: Convert to platform remove callback
 returning void
Message-ID: <20231002144959.jc6wwfrvwd4cyu2l@pengutronix.de>
References: <20230914200251.919584-1-u.kleine-koenig@pengutronix.de>
 <2023100219-variety-genre-befe@gregkh>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qdwkgsz6chxs3e5y"
Content-Disposition: inline
In-Reply-To: <2023100219-variety-genre-befe@gregkh>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_075011_164725_F3AEA4D4 
X-CRM114-Status: GOOD (  19.26  )
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


--qdwkgsz6chxs3e5y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Greg,

On Mon, Oct 02, 2023 at 04:39:47PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Sep 14, 2023 at 10:02:51PM +0200, Uwe Kleine-K=F6nig wrote:
> > @@ -469,8 +469,17 @@ static int mtu3_remove(struct platform_device *pde=
v)
> >  		ssusb_gadget_exit(ssusb);
> >  		ssusb_host_exit(ssusb);
> >  		break;
> > -	default:
> > -		return -EINVAL;
> > +	case USB_DR_MODE_UNKNOWN:
> > +		/*
> > +		 * This cannot happen because with dr_mode =3D=3D
> > +		 * USB_DR_MODE_UNKNOWN, .probe() doesn't succeed and so
> > +		 * .remove() wouldn't be called at all. However (little
> > +		 * surprising) the compiler isn't smart enough to see that, so
> > +		 * we explicitly have this case item to not make the compiler
> > +		 * wail about an unhandled enumeration value.
> > +		 */
> > +		WARN_ON(1);
>=20
> Please don't add new WARN_ON() calls to the kernel, print out a big
> error message and return, don't reboot the machine.

Huh, printing out an loud error message was my intention. It's news to
me that WARN_ON() reboots the machine?! I thought BUG_ON() was the one
with the effects you describe that I shouldn't use.

I'll retest and assuming you're right, rework accordingly.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qdwkgsz6chxs3e5y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUa2JYACgkQj4D7WH0S
/k6yhQf8DEI9qtV/aE2bDaUfap1T6VCIOVmI4TUTMbDd9QRCSoOSJ6JF+8KcXPLa
cWPUfK0zSLB6xe0e11c3izgEZdwrXzWYxzWDO+HN6GH8NTDF4pZO5w7PApYLxM4B
R7xYSaKvmGx0UwHJp/5aGSKn8o/JzX1IHtr0otQJzWDjetTB53U67Kwnz4Y2Hiv6
c586Yfdyh0XRcTrfztxjM2VdZlXDRdl4iGEBs9oGj5S88K/Tq+Nkc3sJPzWWkOCQ
e0g7V5Tc+oOOecfjg5i46qr+6Fp/qYb9oG2nCuLSBgZVB+YZZRJrkZUQTcqPdl22
VH1ovN1PT2e0CcUaieYbtwMYTXeNYQ==
=bw9v
-----END PGP SIGNATURE-----

--qdwkgsz6chxs3e5y--

