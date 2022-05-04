Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88161C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHHoO7fyMXFXCq8dmadY3XfJnEoPU/AT+8B7JmRo8uE=; b=H67N8vd2oL+do1iPyftwxWMbvm
	J7zZ/5ROLuuKpgvlXsXFntGD5WW9LJa9OXRYkt+tLcmu7ekPLGRNpBp4pt/x7/p6US4/OSKjj5HcN
	aEWSlP30Cqns2Y/+rozjNVudOJSe00BM3G+W0n0Zm0lLoYF04k62fVKlkxrFo5pCxRBdzNpj5+OnE
	qqnMaMFIlnULV+LQfVhxbvpYKpbQa3ciJq/y2kcJuu3cbJbWKhPwmHUUp1nLzllRuQEIg7VNx2Jge
	JgslOunLeUGp/64JS+qqgN/4pUCYWJaclHOcxLV30vEqWykGYFQPMbcG+9t0QBK3lHjelplHXX34P
	8GbWIuCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmJFE-00C3Xk-FT; Wed, 04 May 2022 17:57:00 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmJF2-00C3UP-VE; Wed, 04 May 2022 17:56:50 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 606581C0BA5; Wed,  4 May 2022 19:56:47 +0200 (CEST)
Date: Wed, 4 May 2022 19:56:47 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Rob Herring <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Gene Chen <gene_chen@richtek.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: leds-mt6360: Drop redundant
 'unevaluateProperties'
Message-ID: <20220504175647.GE8725@duo.ucw.cz>
References: <20220426133508.1849580-1-robh@kernel.org>
 <YmmLldJcJ2tOOCO7@robh.at.kernel.org>
MIME-Version: 1.0
In-Reply-To: <YmmLldJcJ2tOOCO7@robh.at.kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_105649_192547_FB30542D 
X-CRM114-Status: GOOD (  14.77  )
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
Content-Type: multipart/mixed; boundary="===============5984803108047462939=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5984803108047462939==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2hMgfIw2X+zgXrFs"
Content-Disposition: inline


--2hMgfIw2X+zgXrFs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2022-04-27 13:29:41, Rob Herring wrote:
> On Tue, 26 Apr 2022 08:35:08 -0500, Rob Herring wrote:
> > The binding has both 'unevaluateProperties: false' and
> > 'additionalProperties: false' which is redundant. 'additionalProperties'
> > is the stricter of the two, so drop 'unevaluateProperties'.
> >=20
> > Fixes: e05cab34e417 ("dt-bindings: leds: Add bindings for MT6360 LED")
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/leds/leds-mt6360.yaml | 2 --
> >  1 file changed, 2 deletions(-)
> >=20
>=20
> Applied

Thank you!
							Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--2hMgfIw2X+zgXrFs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYnK+XwAKCRAw5/Bqldv6
8uKUAJ4mu8CeqxEjsLFjOzdUAjXUoBBgEQCgpeK3/QYfQACi2vQAk8BrArf+WJU=
=SuN2
-----END PGP SIGNATURE-----

--2hMgfIw2X+zgXrFs--


--===============5984803108047462939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5984803108047462939==--

