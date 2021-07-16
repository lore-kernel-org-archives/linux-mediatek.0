Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05247C12002
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 13:49:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEB32613F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 13:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEB32613F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UU8x6lx30KwmarlQmACQK5J/HUHz9FHxE4BNCdhycX4=; b=0d7grbS+Rz9ldphVUk+5HpA0Yo
	SI52xH4ai6KGrAUBHxcwZwZI7Bz1tbfdRIy0Vk8PfroHNrTBQMTj9lluAw71zLVCqxkGecWN8ulWp
	rIX6bBPGSX9cW+uxyf64qqL/fT0L0jfmpJ+uOYTw9RYhnI+POt5wcm2txdeFE/zPcSGV/eVVwk2JV
	MjhU1PDfdN8HbvDbQooO8yQP2L1Wnmj0N93cwgoja4vbzXkmGVbmWTYlKDhb0iO8r3dGocZ/0vSvY
	Uh1QRj6PtA78WWmLxmnFAiTVSo+2+hFj8vv2xbAzwWE82/BQPTZfK95d0SLCjGq/7SA9xbPpqP3dG
	V5V+9wNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4OD7-004X39-0i; Fri, 16 Jul 2021 13:49:01 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4OCu-004X0x-9E; Fri, 16 Jul 2021 13:48:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 5F3BA1F42328
Received: by earth.universe (Postfix, from userid 1000)
 id 1B33C3C0C97; Fri, 16 Jul 2021 15:48:43 +0200 (CEST)
Date: Fri, 16 Jul 2021 15:48:43 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Gene Chen <gene.chen.richtek@gmail.com>
Cc: "Vaittinen, Matti" <matti.vaittinen@fi.rohmeurope.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree <devicetree@vger.kernel.org>, inux-pm@vger.kernel.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
 shufan_lee@richtek.com, ChiYuan Huang <cy_huang@richtek.com>,
 benjamin.chao@mediatek.com
Subject: Re: [PATCH v5 3/3] power: supply: mt6360_charger: add MT6360 charger
 support
Message-ID: <20210716134843.w7cl7ekkm3dm6pu5@earth.universe>
References: <20210528081300.64759-1-gene.chen.richtek@gmail.com>
 <20210528081300.64759-4-gene.chen.richtek@gmail.com>
 <62cdd2d18839e16686f35f0cf08080e2cb3b1768.camel@fi.rohmeurope.com>
 <CAE+NS36WuNkQYn8_UvsZaU5Equ9YH+Ya=c_j3cLNhuFnHT_J-g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE+NS36WuNkQYn8_UvsZaU5Equ9YH+Ya=c_j3cLNhuFnHT_J-g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_064848_483109_4AACBFDC 
X-CRM114-Status: GOOD (  15.55  )
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
Content-Type: multipart/mixed; boundary="===============1679499180249331600=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1679499180249331600==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pohkpagvdzmtywuv"
Content-Disposition: inline


--pohkpagvdzmtywuv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 31, 2021 at 11:39:50AM +0800, Gene Chen wrote:
> > > +static int mt6360_charger_remove(struct platform_device *pdev)
> > > +{
> > > +     struct mt6360_chg_info *mci =3D platform_get_drvdata(pdev);
> > > +
> > > +     cancel_work_sync(&mci->chrdet_work);
> > > +
> > > +     return 0;
> > > +}
> >
> > Just as a note, devm_work_autocancel() should hopefully be included at
> > next cycle. Then you might be able to drop the .remove().
>=20
> ACK, I will replace it, thanks.

> > FWIW:
> > Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Did I miss a newer revision?

-- Sebastian

--pohkpagvdzmtywuv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmDxjjMACgkQ2O7X88g7
+ppTGQ/+KQXLPxlOLzYDzYM0l9Zir5lSyErWq9qNFYx2jYwWoF9CmsimzVIE79rV
N/PpiJrNBHYkuarViJpXEE6pYB3HQmZG9WptsZjO41/LZKUZzHHhc/rKLOb3qY2B
3KuNMq81o2aPQaxtH6xwEfNN/Y/3HSk7s6XJOckHAsr9Cot501tgyj8PKnQDGsmd
Gd5rfg/q5o6Sgd/f5pUQNt2SwOq9EdVEYNp+C5/v7wboyMK5dFy88Sr9KiU633Jo
x/7gSnDhAhSl4/izOgx9ESRC6sUnuAoBHDuiLm8QZq3nVRLOFhLZgsp2gpDuARBo
l1gGM2wIDa1mKEC6r5YRikaG3eJMqI01ds2i8r9b73X6gH5zhXo7qN/QJWlTeVdg
2LRkmzb/smxpDZczoDPEKZRkk976waecF9b3v1F1fOs7dMXSdP7cOdYUHIJXk7LB
TfbQ6nJL/I9pgOtP/E70N9aQ7vBUyiboy+B3h8GuIHMFkTYvrPeqwxSBvTYoNQI3
DIRmYOtzPELVvbfzNNCLXdpij24aVk2duDWYdhhgNp277gnJKoLLu3Ft07ptpyKT
RatfO50uBCy8+I5VJ624nQ+8WTBAYWquXaTUHu238/hgpXDnDhb5303qtCPtONq4
ZpZ+5hR3ZurhDjee/blJYsxpw1Ts4oMzx9PwodEaa+QAGroHudI=
=RwZv
-----END PGP SIGNATURE-----

--pohkpagvdzmtywuv--


--===============1679499180249331600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1679499180249331600==--

