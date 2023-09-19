Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B63CD54A7
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 08:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KExsgJqckzb0wLRxc6ZdrFImaIUD3hxI8m8cEiYwSM=; b=qt+i2Mdn33u/ykyv8YvRrLQfTO
	6iYx5ux25GHHHis32Jy7z9jWwnhVxdAd87u8Y+HFJUq1ylmQMSQK0A6xPTXiV227cGnu7QPMRrfLI
	ulurHFO6TBONximot4F36SordhnmTY6IZXQCUEZiBoMMYMca4SZRT77yzmT00/xLrgk3gJ42dLNNf
	fdSRqICUnsvDzilHHHjJmI8Nzz7lb1Byswb4XAlljBlb4NE5IA9KmacxTm+XHJ2T3hi+rWhV3BLoU
	l3Tbk07NYV4vuS0l8OVxM6zknjag/UKdawAh1ySs9KAT50g95WoYHpoIDmXOJDWuhkGxTWTsYlsQH
	pI2XV8HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiW1F-00HMGG-25;
	Tue, 19 Sep 2023 08:23:41 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiW1C-00HMFo-32
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 08:23:40 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiW18-0005EM-2u; Tue, 19 Sep 2023 10:23:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiW14-007PaD-3Q; Tue, 19 Sep 2023 10:23:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiW13-002vrk-Q6; Tue, 19 Sep 2023 10:23:29 +0200
Date: Tue, 19 Sep 2023 10:23:27 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH v2] usb: mtu3: Convert to platform remove callback
 returning void
Message-ID: <20230919082327.pe32kmjuiqdkorn7@pengutronix.de>
References: <20230914200251.919584-1-u.kleine-koenig@pengutronix.de>
 <3cdb8de0223327b820b5344945ce53c0555f4882.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dgisloszaa65nqhb"
Content-Disposition: inline
In-Reply-To: <3cdb8de0223327b820b5344945ce53c0555f4882.camel@mediatek.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_012338_975115_DB4263C5 
X-CRM114-Status: GOOD (  21.13  )
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


--dgisloszaa65nqhb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Sep 19, 2023 at 07:52:04AM +0000, Chunfeng Yun (=E4=BA=91=E6=98=A5=
=E5=B3=B0) wrote:
> On Thu, 2023-09-14 at 22:02 +0200, Uwe Kleine-K=C3=B6nig wrote:
> > @@ -469,8 +469,17 @@ static int mtu3_remove(struct platform_device
> > *pdev)
> >  ssusb_gadget_exit(ssusb);
> >  ssusb_host_exit(ssusb);
> >  break;
> > -default:
> > -return -EINVAL;
> > +case USB_DR_MODE_UNKNOWN:
> > +/*
> > + * This cannot happen because with dr_mode =3D=3D
> > + * USB_DR_MODE_UNKNOWN, .probe() doesn't succeed and so
> > + * .remove() wouldn't be called at all. However (little
> > + * surprising) the compiler isn't smart enough to see that, so
> > + * we explicitly have this case item to not make the compiler
> > + * wail about an unhandled enumeration value.
> > + */
> > +WARN_ON(1);
> > +break;
> How about changing as below:
>     defualt:
>        break;
> >  }

I think a warning is a good idea as today that case cannot happen
(unless I missed something) and if it still happened, you'd want to know
as the handling is insufficient then. And I also think that if the enum
usb_dr_mode should ever be expanded, this code location should be
revisited, so the explicit "case USB_DR_MODE_UNKNOWN" is better in my
opinion.

As you suggest this variant you seem to have some upside in mind, didn't
put it into your message though. Would you share your thoughts?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dgisloszaa65nqhb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUJWn8ACgkQj4D7WH0S
/k7KAAf6A/b5sNPF54k+Ma3oN7Fax1Z2w856jPyHME6jLc7u/AG9osjTHvunNeAA
EcI/eIN8DKaB/uxZefCKy9Ei9fV5E/1rnExa/4VwG2HMzTkGAbIK3hMxwKFm/fkt
BE0z61M6xMvxCj53r0SI/Zz6IlJtM1qsrzCEYJMyvsLafun/jUFHQS0mbYHtnts7
nor6AoG83yWWrc0vd0pfjV+QnjzYVl767H9ws1I5o+3Hlu/Nat6CfGs1a2ma8ArB
6p0tVnS1jiwzZY2R3TCOIFy2QKFJNb/vPSKvqy9MRrYrGZUIRPgDXWrkO7LLnac+
dFxjJfjs8z+QRCJpr51crY2sjjTKXQ==
=f/ok
-----END PGP SIGNATURE-----

--dgisloszaa65nqhb--

