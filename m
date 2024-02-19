Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7618C48BC3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 09:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:To:From:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFJbGpP4MS81D/TX41odyg+p13PxL+4f27IPCSeIPzQ=; b=Qn2B84/XoVj5S5okN14fMd+F/r
	fVfNvXtD3FXDXrq/JiwEiuJI7suOAkKj+4R4F/uBCNEC+5aP/ctjAJtcg24FTe1+Oe/3vjMz8Ku4g
	aaVdXJdPfRqtXfJLgGat/mI8gD17kAAT2M3IO8gHA4w86xdSheBq2Sml+WsdtkfuNRCWWmFPFcOp1
	vFc+QuJzCyi6BSTjduIj9oWoKNwmnSHzrDLKTTq+SgWd0VvAPyQHujgaLx8SbKZ955RLVkAC6vuQc
	wFQR6btLCx06B4sotOeFa/+XsaDybwCYzxM/StlUIxtoQHBQFyTEgJFzKKspRLdmoiX5N2X3ayYJ6
	b5sgO+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc04z-00000009qaG-19b3;
	Mon, 19 Feb 2024 09:36:53 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc04g-00000009qPf-0To2;
	Mon, 19 Feb 2024 09:36:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 38C1ACE0F8B;
	Mon, 19 Feb 2024 09:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA76DC433F1;
	Mon, 19 Feb 2024 09:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708335391;
	bh=2JEkX46Vp/cBAVVvgsgHoF/zxvBsYbJKJ4rTHU/s2hk=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To:From;
	b=crbNLM/4l3WxOMO/z1NI5uM/uMSLp3JKrA1HesJ67bumXJ9OewEOn/oK7qGTbh/Cx
	 0MM5bHgbYQkGSbKzWTVhwTCMgD0EVbcfbjtXcG38PpFP+Jj/CQ4XFeGgcos2YTn08Q
	 xx7ZlwO0es5Pb936IJuNIXmLiqlMmgq8m/NoXFw0BhtowiQByycV0WreEjKwzfILek
	 5u3cVT4CLanHf1GdCmbYmTvdJcEjW5Kk1U0AutY8cz7O7dDQeUaVrLF1eegt+n7ilk
	 2ogtUwa2kqam0bgJT99sOLYI3e/7AYi6wbDRd6zSQFYvc7sVKVfnmcBfRUmpLLgDKl
	 xcyF5LzNi6Bsg==
Content-Type: multipart/signed;
 boundary=5b911bf665d2ea492c216b90f01b24b10ab08eb643d157bdd14da66d2129;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Mon, 19 Feb 2024 10:36:26 +0100
Message-Id: <CZ8YCQETS7LL.1BLJJZNCLV7DT@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm64: mediatek: add Kontron
 3.5"-SBC-i1200
Cc: <devicetree@vger.kernel.org>, "Sean Wang" <sean.wang@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
X-Mailer: aerc 0.16.0
References: <20240219084456.1075445-1-mwalle@kernel.org>
 <ed3530f0-227a-47f2-938c-28eba90dd6eb@collabora.com>
In-Reply-To: <ed3530f0-227a-47f2-938c-28eba90dd6eb@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_013634_547531_6FFB79F3 
X-CRM114-Status: GOOD (  19.85  )
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

--5b911bf665d2ea492c216b90f01b24b10ab08eb643d157bdd14da66d2129
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Feb 19, 2024 at 10:23 AM CET, AngeloGioacchino Del Regno wrote:
> Il 19/02/24 09:44, Michael Walle ha scritto:
> > Add the compatible string for the Kontron 3.5"-SBC-i1200 single board
> > computer.
> >=20
> > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > ---
> > v2:
> >   - convert enum to const as there is only one specific board
> >=20
> >   Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
> >   1 file changed, 5 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docu=
mentation/devicetree/bindings/arm/mediatek.yaml
> > index 09f9ffd3ff7b..add167d8b8da 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > @@ -357,6 +357,11 @@ properties:
> >                 - radxa,nio-12l
> >             - const: mediatek,mt8395
> >             - const: mediatek,mt8195
> > +      - description: Kontron 3.5"-SBC-i1200
> > +        items:
> > +          - const: kontron,3-5-sbc-i1200
> > +          - const: mediatek,mt8395
> > +          - const: mediatek,mt8195
> >         - items:
> >             - enum:
> >                 - mediatek,mt8516-pumpkin
>
> I understand that you took inspiration from the Google Chromebooks entrie=
s, but
> those are separated only because they've got "a bunch of revisions".
>

I don't really care about the description. It's just the way I've
done it in the past. And in this file, there is also google,burnet,
google,cozmo, google,damu, without any further revs.

> For machines that don't have a billion compatible strings, I would sugges=
t to
> add the compatible under a single big entry: like this, the binding is (i=
mo) a
> bit more readable .. and cleaner.
>
> Eventually, the machine name is in the devicetree so we're not losing any=
 kind
> of information anyway... :-)
>
>        - items:
>            - enum:
>                - kontron,3-5-sbc-i1200
>                - mediatek,mt8395-evk
>                - radxa,nio-12l
>            - const: mediatek,mt8395
>            - const: mediatek,mt8195

Ack. I'll give you some time to look at the actual DTS before
posting a new version.

-michael

--5b911bf665d2ea492c216b90f01b24b10ab08eb643d157bdd14da66d2129
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIgEABYIADAWIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZdMhGhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQzcodo7VsRvs3fgEAlFQCpxkpEfzEqfjyl3YucexQcUbd1+Lj
0DJqee5gUp0BAP0BDmrnoWc+fCp5T7L07BNNJRAC7wDWhSUbmgvyBvEF
=mwoc
-----END PGP SIGNATURE-----

--5b911bf665d2ea492c216b90f01b24b10ab08eb643d157bdd14da66d2129--

