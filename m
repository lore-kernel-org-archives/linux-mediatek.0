Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816DDC48260
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 09:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4g++qAu9s83QY5fsc9Ntl+9n0HBMe2GL63Zj+YO4cs=; b=yfjGD+vqZIueAyiBJnrTjn+Sk6
	QLObkHIii0yszBROhI0Dx5J5ihY/mJMoF/B70BfIT5HQPmMg/PVpy2kmzbHaBTeNGaZBdXCIQqjea
	IAfnOySthjT4Up2QnVse6yDyYNmn6rO23sH5pBMdZO1RzIFyfrklbd2izPABAY4vsPN7S5uB2cbhx
	/JHZQ3gJ47IR26ag5k/+7LyiU8i74sI8PUsMFhtV9i653jdWF+vzTLHQg51swaN+IgeKhd//DEUSX
	dfd01Z5ySEzXy3aAqsle6uXsHIi/OEF8sW+X+y3LJeFXtFfKGnlFUFU5zK3GKR4XRWmqXmXFf6pUj
	qwQVpxaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzuE-00000009o2R-0mmc;
	Mon, 19 Feb 2024 09:25:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzuA-00000009o1r-1Eb9;
	Mon, 19 Feb 2024 09:25:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4F489CE0E0E;
	Mon, 19 Feb 2024 09:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DBB4C433C7;
	Mon, 19 Feb 2024 09:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708334739;
	bh=TQgJ/dUEc4sWbXoGbmu4Gc1ioWBXLv4l0BknLPBgqHs=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=J8rTnnHg2jq4qSe9wkaheaQRnHYTStPOBliPhPlu9XMSyAH/7SWcw+hwCnAZQuBSp
	 pm85XhsSaDbD3Ax/bBjkrBzKoGoM97KCZVs+0q4D+rQpV9WLmtf6ALdW7f1weaxPWX
	 hUkEjEuIcTAbHDt0k5zo9PBiRn5YxkbIEq/aOHbAqSW2zcQ+CfhX2HiHZ6IrEozmnh
	 3rvO22UujnQ20i4N0rOlQYbTujhp3PfZSEJpQNk6QJco5j6aRrlcWtzj6n//wPkNP3
	 1FRCRfBoNY7g6cPGsxCE3z14MBM+xLVjYz/VIudpFQG2XclvUj+yxuHmgWviMY07UN
	 2r/5zPMQ89atw==
Content-Type: multipart/signed;
 boundary=03803a3ba4b4ec418cf5496082e438ace4bc390993da25f1c1c6651408c6;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Mon, 19 Feb 2024 10:25:31 +0100
Message-Id: <CZ8Y4DFQNLM9.3GIGATDIAXBR5@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm64: mediatek: add Kontron
 3.5"-SBC-i1200
Cc: <devicetree@vger.kernel.org>, "Sean Wang" <sean.wang@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>
X-Mailer: aerc 0.16.0
References: <20240219084456.1075445-1-mwalle@kernel.org>
 <72fffc25-33f0-4394-b7c1-8dbc2d23a4a4@linaro.org>
In-Reply-To: <72fffc25-33f0-4394-b7c1-8dbc2d23a4a4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_012542_711325_D306D6B8 
X-CRM114-Status: GOOD (  17.41  )
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

--03803a3ba4b4ec418cf5496082e438ace4bc390993da25f1c1c6651408c6
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Feb 19, 2024 at 10:06 AM CET, Krzysztof Kozlowski wrote:
> On 19/02/2024 09:44, Michael Walle wrote:
> > Add the compatible string for the Kontron 3.5"-SBC-i1200 single board
> > computer.
> >=20
> > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > ---
> > v2:
> >  - convert enum to const as there is only one specific board
> >=20
> >  Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docu=
mentation/devicetree/bindings/arm/mediatek.yaml
> > index 09f9ffd3ff7b..add167d8b8da 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > @@ -357,6 +357,11 @@ properties:
> >                - radxa,nio-12l
> >            - const: mediatek,mt8395
> >            - const: mediatek,mt8195
> > +      - description: Kontron 3.5"-SBC-i1200
> > +        items:
> > +          - const: kontron,3-5-sbc-i1200
>
> And then it should be part of earlier entry. Just take a look there in
> the file...

FWIW I did and all the entries with descriptions are by there own
(that's also true for fsl.yaml and sunxi.yaml).

mediatek.yaml seems to have both, either boards without description
like the "radxa,nio-12l" which you are probably referring to. Or
boards which has the same sub compatibles but still have individual
entries, like google,burnet, google,cozmo, google,damu.

Therefore, what is the rule of thumb here? Drop the description?
If so, why it it there in the first place?

-michael

--03803a3ba4b4ec418cf5496082e438ace4bc390993da25f1c1c6651408c6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIgEABYIADAWIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZdMeixIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQzcodo7VsRvus0wEA961xASC5sQxgLl7D2sdBs8vZGbpKm2xY
5IGGz3L8+T8A+gJrDnh9avI1bglxsEP4pVy4KSuErmUiYYw9/g58FPgO
=LoCQ
-----END PGP SIGNATURE-----

--03803a3ba4b4ec418cf5496082e438ace4bc390993da25f1c1c6651408c6--

