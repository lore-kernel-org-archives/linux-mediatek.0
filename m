Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F9FC64E8A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 11:41:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4F3420758
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 11:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4F3420758
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XxrehwzRxeAFlvEz8/rEyTDZ3XObL9ND8UDL9+uGysc=; b=1VV73ylJOyOE4KDEL9A/SyQbQ
	fSlnqGRz52VlPyD4FBdQh/Z7u6y60NhSYCZalKyhL/9GwHRFeyfRwmAQ9XylQaig74JJhENxbMF/8
	a/z3uEqB9Rmz3rd1g5AePSGVW68m21gXGbM25lqGA8DsdV/gD7GRUYhUna75+2FiKv8vzvGWp/RWC
	lue/f7jkuc05qsqS5jy6uWCZ3EoOSfonmKgNCkmx3oizIBmAY5HQ1xYPzwtiFARFy9I7XgGI3tk/v
	VJsmaXn0BcotDKdi4ap5UPX1YH9SfQu4EAOuQ2ys4QckOSNR+v3eOkCzmFx8ZewoumL+owBH5aLO9
	zv2chN9qg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkmyi-0004ZA-PT; Thu, 03 Dec 2020 11:40:52 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkmye-0004Y5-Cs; Thu, 03 Dec 2020 11:40:49 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 65C661C0B9E; Thu,  3 Dec 2020 12:40:44 +0100 (CET)
Date: Thu, 3 Dec 2020 12:40:44 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v11 3/5] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT
 definitions
Message-ID: <20201203114044.GA9061@duo.ucw.cz>
References: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606906011-25633-4-git-send-email-gene.chen.richtek@gmail.com>
 <20201202122329.GA30929@duo.ucw.cz>
 <CAE+NS34D8a6Udt7ZZ0=U7oqm5POtihKvD3WjD_sAADamqQ=1AQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE+NS34D8a6Udt7ZZ0=U7oqm5POtihKvD3WjD_sAADamqQ=1AQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_064048_600330_EF0C1F9D 
X-CRM114-Status: GOOD (  15.55  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, cy_huang@richtek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, shufan_lee@richtek.com,
 Wilma.Wu@mediatek.com, Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Dan Murphy <dmurphy@ti.com>
Content-Type: multipart/mixed; boundary="===============8957654524232380029=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8957654524232380029==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > +++ b/include/dt-bindings/leds/common.h
> > > @@ -78,6 +78,7 @@
> > >  #define LED_FUNCTION_INDICATOR "indicator"
> > >  #define LED_FUNCTION_LAN "lan"
> > >  #define LED_FUNCTION_MAIL "mail"
> > > +#define LED_FUNCTION_MOONLIGHT "moonlight"
> >
> > There's "torch" function that should be used for this. I guess comment
> > should be added with explanation what exactly that is and how should
> > the LED be named.
> >
>=20
> According to mail, 11/25 "Re: [PATCH v7 2/5] dt-bindings: leds: Add
> LED_COLOR_ID_MOONLIGHT definitions",
> The Moonlight LED is LED which maximum current more than torch, but
> less than flash. Such as front camera fill light.
> I think our channel is moonlight, not torch.
> I will add this description to comment.
> We can't exactly define moonlight current level, because every vendor
> has their own specification.

So... what is the timelimit on moonlight?

But if it is used for camera illumination, I believe it should be
simply called flash.

Best regards,

								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX8jOvAAKCRAw5/Bqldv6
8pj3AJ9cRVAbTOCXxcUiV3mbTJXFFTKK3QCgpfgXoggeGNEUdtl5msUvdmWnkSA=
=gXOZ
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--


--===============8957654524232380029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8957654524232380029==--

