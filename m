Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B06DC25B4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 17:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KqI1nNQW5kH3W8ISVat2rjJoiJJcS0iCZZ4mjcLfOkE=; b=oJGHt3uplbAhL4d/3EY+IIoB9/
	/byPxXi9ZW9uFY4irV7JkmXZbPzbMP17x1nJOWQD8QCDd0cr/1Z4YcdXCugljZdvXA0Hp9S9wZoHc
	oIaTAlv4UIeTbVl0ehpiIyoNeUFtVpGj69OnnQKD0Dpv3doCqtFd7WR8Y1ghWYMYW0nl+GU+XBVcQ
	WOxpOx/+BcYr9PeDdFA/azwh4KebWnIMFuA8KpsUV6221jgHzmwnrP3jLWMYFBPirYyRFwXJ/LNrt
	fjooyQ3a570NRxeG6U32vd6iBthRXNelvN1aQjj5jGJFvWHpMo1ipp1DcXkwqDRb8vlDoHYSXlIPQ
	2mdwkG9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quyoV-007xwe-1G;
	Mon, 23 Oct 2023 17:34:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quyoQ-007xte-1Y;
	Mon, 23 Oct 2023 17:34:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 73153CE24D1;
	Mon, 23 Oct 2023 17:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53682C433C8;
	Mon, 23 Oct 2023 17:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698082435;
	bh=4d7J4UL5e0se16HtXrPNAXciTYKxyup73uY3njGx/tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rZZYcrZyJe7SIkIBEcxXv8DLargOmDFor0R5Wg1c8Zs2qP2sif0SJRN+HZHm034L4
	 Lr1pKF0ELhpLw7AnligOfRSqM5x2uvu6g5tagdVErPVluMvtzB8Z8uJKpejBs4c9eo
	 t1uuS14rnGCayd0d1QqemTvTCNbLAMYp6sP2gn0RDWyiFXfO0ZlbvFGT6sQSTTUg3T
	 OjtjVGY24jdMkqjjDSsAys0wWMBfEG5+yekGSe1hhjzBq3mShOfM842L+GdUdanOjN
	 T9zczlElvAuF6/1AoTxzki1nTwWvAazefXVPPop4ZSQR5Ly8aGPlBGzM9Jc27SPr7y
	 0BGfwgRhc1vRw==
Date: Mon, 23 Oct 2023 18:33:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Xinlei Lee <xinlei.lee@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 02/18] dt-bindings: display: mediatek: ccorr: add binding
 for MT8365 SoC
Message-ID: <20231023-marrow-modified-fdeff0fea45a@spud>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-2-5c860ed5c33b@baylibre.com>
 <20231023-reshoot-liquefy-429aacb68694@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="thOqX6IfbyWP13q3"
Content-Disposition: inline
In-Reply-To: <20231023-reshoot-liquefy-429aacb68694@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_103358_862114_1E301B6B 
X-CRM114-Status: GOOD (  20.26  )
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


--thOqX6IfbyWP13q3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 06:31:45PM +0100, Conor Dooley wrote:
> On Mon, Oct 23, 2023 at 04:40:02PM +0200, Alexandre Mergnat wrote:
> > Display Color Correction for MT8365 is compatible with another SoC.
> > Then, add MT8365 binding along with MT8183 SoC.
>=20
> This commit message's first line is too vague & the second doesn't make
> sense. I suspect something as succinct as "Document the display colour
> correction on mt<foo>, which is compatible with that of the mt<bar>"
> does what you are looking for.
>=20
> I suspect this is going to apply to the rest of the series...

It does, as does the comment about s/binding/compatible/ I left on patch
1.


>=20
> Cheers,
> Conor.
>=20
>=20
> >=20
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > ---
> >  Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml=
 | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediate=
k,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ccorr.yaml
> > index 8c2a737237f2..9f8366763831 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr=
=2Eyaml
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr=
=2Eyaml
> > @@ -24,6 +24,9 @@ properties:
> >        - enum:
> >            - mediatek,mt8183-disp-ccorr
> >            - mediatek,mt8192-disp-ccorr
> > +      - items:
> > +          - const: mediatek,mt8365-disp-ccorr
> > +          - const: mediatek,mt8183-disp-ccorr
> >        - items:
> >            - enum:
> >                - mediatek,mt8186-disp-ccorr
> >=20
> > --=20
> > 2.25.1
> >=20



--thOqX6IfbyWP13q3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTaufAAKCRB4tDGHoIJi
0kKzAQDMUo1M62BZW0+LDaZBbv8k7iM/aEWPjra25PQw/lkNHAD+Krqai8nG55h2
m2Gi2YrEijqBX7inn96eMRSpD+rIfA8=
=RW59
-----END PGP SIGNATURE-----

--thOqX6IfbyWP13q3--

