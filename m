Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9864CF9C6B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 16:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMmc9Pvfh0Qe+zSFMEasXhI6QAGUsHTqkx6qlNa17Rk=; b=CGHt2hc198pjQwbxNcqjxzAqti
	Xe614I4aCj3/Qr+FgFdcxrRBa4xEzGLFTa+7cAhWUk1RtK3espeUTD/eFyToIPMDY7vf65WDR5KtZ
	0MCWdE/4BvomIs77POh8pAZHB7Zh9yWfTXQszgmhuMbpIyjQIEANtc+c8RLVPR06YpJs+0WcBEbkG
	28phSFto4EeRcgoqveKWHFWuOkCNyHH3QSE21vaVcsL5w1k2b896nHrN2WteApvu5Mm4jYJ0qxGQu
	qqlGa7BOZF5WDtL1pHVwn46Rgxxwh2qX+UbD1BoHHTnwR1fLmA9792LekGrVMpMm2e/EbqjHnOr5M
	nhT4giwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st7zB-00000002j9S-2WeL;
	Tue, 24 Sep 2024 16:01:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st7xz-00000002iw7-3mba;
	Tue, 24 Sep 2024 16:00:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E11475C57B0;
	Tue, 24 Sep 2024 16:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2AE1C4CEC4;
	Tue, 24 Sep 2024 16:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727193642;
	bh=RMVPLW4fWUk9yS+HMDAfSQbd+gQJXHQViB5tLV8d35M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GvK37+mp+LghOmr6eoGoJcX94ZEdvjXe7wWGvJCkmU96Jfz4t9wQAMCcHrj456VMu
	 CTvjH6AQSibawNgM6pXkiRUbDkbpb5OB2u6GHKkU3OdPWYRsMb7NsThJQgay3GxhP5
	 Oof/N2yNvyvOKMabXyy38g7l3rPmArWwRrHFImcMLmP34qUsZxYMlYO/z5HZ4P0Tlj
	 1ukf9n15+s9ktGDKRonsgiNiCoFNvXmAw7OCRlWWHp1KQxcofuJX8494GiYt5I/sbF
	 IQTyI/Kf+rr/XySGhmQGVFj6Xz+1gwU2CDrVff0GanXwhe+9jxkxPT92QrSGMZJLsG
	 hAPsxiBHsx+3w==
Date: Tue, 24 Sep 2024 17:00:34 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Macpaul Lin <macpaul.lin@mediatek.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Sen Chu <sen.chu@mediatek.com>,
	Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH 3/6] dt-bindings: display: mediatek: Fix clocks count
 constraint for new SoCs
Message-ID: <20240924-commute-collision-13ad39717d31@spud>
References: <20240924103156.13119-1-macpaul.lin@mediatek.com>
 <20240924103156.13119-3-macpaul.lin@mediatek.com>
 <ffc1900b-3921-48ca-a2b2-1b798c57e572@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sWezDfs+NRZqmEro"
Content-Disposition: inline
In-Reply-To: <ffc1900b-3921-48ca-a2b2-1b798c57e572@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_090044_100363_BF485F2F 
X-CRM114-Status: GOOD (  21.63  )
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


--sWezDfs+NRZqmEro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 01:42:01PM +0200, AngeloGioacchino Del Regno wrote:
> Il 24/09/24 12:31, Macpaul Lin ha scritto:
> > The display node in mt8195.dtsi was triggering a CHECK_DTBS error due
> > to an excessively long 'clocks' property:
> >    display@14f06000: clocks: [[31, 14], [31, 43], [31, 44]] is too long
> >=20
> > To resolve this issue, add "maxItems: 3" to the 'clocks' property in
> > the DT schema.
> >=20
> > Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each =
block to individual yaml")
> > Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> > ---
> >   .../devicetree/bindings/display/mediatek/mediatek,split.yaml     | 1 +
> >   1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediate=
k,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,=
split.yaml
> > index e4affc854f3d..42d2d483cc29 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split=
=2Eyaml
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split=
=2Eyaml
> > @@ -57,6 +57,7 @@ properties:
> >     clocks:
> >       items:
> >         - description: SPLIT Clock
>=20
> That's at least confusing (granted that it works) - either add a descript=
ion for
> each clock and then set `minItems: 1` (preferred), or remove this "SPLIT =
Clock"
> description and allow a maximum of 3 clocks.
>=20
> Removing the description can be done - IMO - because "SPLIT Clock" is, we=
ll,
> saying that the SPLIT block gets a SPLIT clock ... stating the obvious, a=
nyway.

Right, but what are the other two new clocks? Are they as obvious?
There's no clock-names here to give any more information as to what the
other clocks are supposed to be.

Kinda unrelated, but I think that "SPLIT Clock" probably isn't what the
name of the clock in the IP block is anyway, sounds more like the name
for it on the provider end..

--sWezDfs+NRZqmEro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvLiIgAKCRB4tDGHoIJi
0jIKAP9UDveIts01lao6hVilWP0TMQRAzvdTTL1WDikEbViR4AD/fS4SyEZ73ptb
5bNB6iILTufZlc7BaAK6cEiNDImPLAw=
=ms3M
-----END PGP SIGNATURE-----

--sWezDfs+NRZqmEro--

