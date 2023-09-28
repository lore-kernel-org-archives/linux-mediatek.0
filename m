Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F35E732EA
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 16:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gn6NBobN5SNSYU088cn+UnWuDrLahjgmhawcx/1b3Y0=; b=s0+hGKsUqbnRq0SJyjMpIcCqT+
	n4skjdI5sCuBIjSxrkG50TlJHgLsf8Jk11A/l172/EFcvSLUiblbhw9lQouhhqacI9JJC93N+1j3E
	8sDLI4/BUX3ZB1iCzw5eqIpN/yn5OqdrQ0wY8INQKbxwcxRsb1f7ckC8FyrrT07Pj++XxFYbfaKz7
	LQiI8mfZc16JMY0i/56rIVGTW+jdlurc6BhDPOTOzjmcARNHk2bhWg7ELXYW8P6OAxB+NVKmQIzwT
	zESPpTl7ZluXHLfv98QF6GuMKMWVOam+ctgUrjjjMjhs7R5rYJ+/atW1ntX1VuiIFbxry+54e7GZ1
	eoNelhlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qluCR-006CKF-1F;
	Thu, 28 Sep 2023 16:49:15 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qluCM-006CEq-1y;
	Thu, 28 Sep 2023 16:49:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 94126CE2235;
	Thu, 28 Sep 2023 16:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448EDC433C7;
	Thu, 28 Sep 2023 16:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695919747;
	bh=OeEEMzb0mAUmb+1aOokCsA6Qtj1woMg6PHCCVn3/JME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Db4BIMAEruuU/barRuapyi3/Do9/1bDem/5vK75erdBa4OOv0a1ayu8JhhwMhiB1B
	 b7FWDXnC9y2GsNVWgvvUIv6epHjo0s+2m9CpR4mOrH1GbZPa4NHYS8ThmE2VxxCI6V
	 tzuRfZSSWdkk2mAYTYjfGbTU46igF52qvkooGb36BaLRROU/HFmzbxWBpsvzILGUvY
	 pMJm89sxGOxi3ZnZu23ElsoQI3nkiUmhgeURqhYzRmP0giv7f9ZN/c7osFWg8g/gXK
	 TkguG9vvRACHovu32wesmkPf+mMsKyrABHaY39fy50sqyvNZxLaFoXjy7EbhFUESl2
	 nan2yXLQizmUQ==
Date: Thu, 28 Sep 2023 17:49:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Moudy Ho =?utf-8?B?KOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
Cc: "conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 12/16] dt-bindings: display: mediatek: color: add
 compatible for MT8195
Message-ID: <20230928-keep-attractor-1e7cd0df03b2@spud>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-13-moudy.ho@mediatek.com>
 <20230922-zebra-modify-87ff23c70bb3@spud>
 <20230922-overhung-deception-e9b461ba0372@spud>
 <7c445195e17e15d5af5fcb30ae53f76c713e958b.camel@mediatek.com>
 <20230927-crunching-prancing-36fe3eb79607@wendy>
 <825ac03b692043d48563620ad9542a4ee43211e7.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rL+dijxgtPL7w+1l"
Content-Disposition: inline
In-Reply-To: <825ac03b692043d48563620ad9542a4ee43211e7.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_094911_025626_94DA72ED 
X-CRM114-Status: GOOD (  38.92  )
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


--rL+dijxgtPL7w+1l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 02:52:23AM +0000, Moudy Ho (=E4=BD=95=E5=AE=97=E5=
=8E=9F) wrote:
> On Wed, 2023-09-27 at 10:47 +0100, Conor Dooley wrote:
> > On Wed, Sep 27, 2023 at 07:19:28AM +0000, Moudy Ho (=E4=BD=95=E5=AE=97=
=E5=8E=9F) wrote:
> > > On Fri, 2023-09-22 at 16:51 +0100, Conor Dooley wrote:
> > > > On Fri, Sep 22, 2023 at 04:49:14PM +0100, Conor Dooley wrote:
> > > > > On Fri, Sep 22, 2023 at 03:21:12PM +0800, Moudy Ho wrote:
> > > > > > Add a compatible string for the COLOR block in MediaTek
> > > > > > MT8195
> > > > > > that
> > > > > > is controlled by MDP3.
> > > > > >=20
> > > > > > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > > > > > ---
> > > > > >  .../devicetree/bindings/display/mediatek/mediatek,color.yaml
> > > > > >    =20
> > > > > >  | 1 +
> > > > > >  1 file changed, 1 insertion(+)
> > > > > >=20
> > > > > > diff --git
> > > > > > a/Documentation/devicetree/bindings/display/mediatek/mediatek
> > > > > > ,col
> > > > > > or.yaml
> > > > > > b/Documentation/devicetree/bindings/display/mediatek/mediatek
> > > > > > ,col
> > > > > > or.yaml
> > > > > > index f21e44092043..b886ca0d89ea 100644
> > > > > > ---
> > > > > > a/Documentation/devicetree/bindings/display/mediatek/mediatek
> > > > > > ,col
> > > > > > or.yaml
> > > > > > +++
> > > > > > b/Documentation/devicetree/bindings/display/mediatek/mediatek
> > > > > > ,col
> > > > > > or.yaml
> > > > > > @@ -26,6 +26,7 @@ properties:
> > > > > >            - mediatek,mt2701-disp-color
> > > > > >            - mediatek,mt8167-disp-color
> > > > > >            - mediatek,mt8173-disp-color
> > > > > > +          - mediatek,mt8195-mdp3-color
> > > > >=20
> > > > > How come this one is a "mdp3" not a "disp"?
> > > >=20
> > > > I don't know what mdp3 means & googling gives me no answers.
> > > > What's
> > > > the
> > > > "disp" one controlled by, since it isn't controlled by mdp3?
> > > >=20

> > > Mediatek's Media Data Path ver.3 (MDP3) is associated with MMSYS
> > > and
> > > acts as an independent driver that operates between VDEC and DISP.
> > > By controlling multiple components, it carries out tasks like
> > > converting color formats, resizing, and applying specific Picture
> > > Quality (PQ) effects.
> > > The driver can be found at "driver/media/platform/mediatek/mdp3".
> > > Since the same hardware components are configured in both MDP3 and
> > > DISP, considering previous discussions, I attemped to integrate
> > > into a
> > > single binding, named after the controlling user.
> >=20
> > I'm still kinda struggling to understand this. Do you mean that the
> > hardware can be controlled by either of the disp and mdp3 drivers,
> > and
> > a compatible containing "disp" would use one driver, and one
> > containing
> > "mdp3" would use another?
> >=20

> Sorry for any confusion caused by the software information. In the
> video pipeline, after decoding, the data flows sequentially through two
> subsystems: MDP and DISP. Each subsystems has multiple IPs, with some
> serving the same functionality as COLOR mentioned here. However, these
> IPs cannot be controlled by different subsystems. Therefore, I included
> the name of the subsystem after SoC to identify the configuration's
> location. Is this approach feasible?

I'll have to leave things to the likes of Laurent to comment here I
think. I don't understand this hardware well enough to have a useful
opinion. It would seem like a different part of the datapath is a
different device that should be documented separately, but I don't know
enough to say for sure, sorry.

--rL+dijxgtPL7w+1l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRWufQAKCRB4tDGHoIJi
0nsWAP9Z5+p8LVkSBzp2zIp0mJIEPuMJ/5L9jDuxGtzFI/iWtgEArrzswN8FG3pb
YVD0T3yCkqjyqOjvhOwzAdI5Kr9a5go=
=Rkco
-----END PGP SIGNATURE-----

--rL+dijxgtPL7w+1l--

