Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71453E810AD
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 09:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q98uDEB8JdG8Rg0XglWISNc6dds1iBryKZg19ao3oMo=; b=KYAX1x9f2BZ8QAGFlzCE2Bzz8h
	HG+trRzEvtXFDUXf8ywUTt7rL4SBcHJNK3jmNKTsfR64vja2iHnhOSAHEaZH3A8lwdOUhc2k2UoqS
	xoJV09sp4OJxgx7XRiXb0ekpk34kFzMMtr+v/JU8j55Rhk6tiOZiiekd2LZrI/iXtAOWZlVaoePQ6
	is7ZW2MaNqhJoH571RkBpXEBbust9kyR1t9K0mfalfcuywGYXaD1wTgBzjXEvPUo5nuRDhQ/89D6O
	Ggb1mUWVj3TRePn3Nr1WEPZYfmyHAUmzvKBeMBwadQj1uNMCpdVJjljhC4Eq0hdJz0gzQuLFzvd7A
	07mePK9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlRAN-000WdY-1b;
	Wed, 27 Sep 2023 09:49:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlRAA-000WVz-32;
	Wed, 27 Sep 2023 09:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695808138; x=1727344138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oj/BIJaPlLOZ5a4Bm+3wRDEKMjmwS+415AzmToQmxko=;
  b=Z+q5y9viHWW/C7duUL5fUNU7Jz2o8YrAYWHtf3i/EWqF093xOenB6eAw
   s2e7AzgVRtnuFHUmv/bm7gIpHLlSajdlUzAsZc+D/pAism7t8FaBKKzwl
   GKaS9sz1f2iPrEgeULU0cgq75sRaBbhnCqfibYVh35pVfkQ2ABWSJwTpl
   UROUcbfTIa2dfjBlhKxtEBAiyrwiGMbsDCJMRscgo2L0d2iyZN29u6y/I
   a0IGhPrjB4n1/X+rd6V+b1I6kwcuFp2jpDwcZmwMowZ2rl7VBjRsXBVvh
   xeWBMkRG7gIumKeoxsnr+HTuLOsWSWGC4gAJNEannwqPKW1nU845Pm2MV
   w==;
X-CSE-ConnectionGUID: +8y/5vKTQAWpUgUoFVJWOw==
X-CSE-MsgGUID: FCeDeZE/SGCJlrPGv/SrHA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="asc'?scan'208";a="173847249"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Sep 2023 02:48:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 27 Sep 2023 02:48:03 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 27 Sep 2023 02:48:00 -0700
Date: Wed, 27 Sep 2023 10:47:42 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Moudy Ho =?utf-8?B?KOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
CC: "conor@kernel.org" <conor@kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, "airlied@gmail.com"
	<airlied@gmail.com>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 12/16] dt-bindings: display: mediatek: color: add
 compatible for MT8195
Message-ID: <20230927-crunching-prancing-36fe3eb79607@wendy>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-13-moudy.ho@mediatek.com>
 <20230922-zebra-modify-87ff23c70bb3@spud>
 <20230922-overhung-deception-e9b461ba0372@spud>
 <7c445195e17e15d5af5fcb30ae53f76c713e958b.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T9lGne2QQapOBRac"
Content-Disposition: inline
In-Reply-To: <7c445195e17e15d5af5fcb30ae53f76c713e958b.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_024859_052291_C6F06D3C 
X-CRM114-Status: GOOD (  27.08  )
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

--T9lGne2QQapOBRac
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 07:19:28AM +0000, Moudy Ho (=E4=BD=95=E5=AE=97=E5=
=8E=9F) wrote:
> On Fri, 2023-09-22 at 16:51 +0100, Conor Dooley wrote:
> > On Fri, Sep 22, 2023 at 04:49:14PM +0100, Conor Dooley wrote:
> > > On Fri, Sep 22, 2023 at 03:21:12PM +0800, Moudy Ho wrote:
> > > > Add a compatible string for the COLOR block in MediaTek MT8195
> > > > that
> > > > is controlled by MDP3.
> > > >=20
> > > > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > > > ---
> > > >  .../devicetree/bindings/display/mediatek/mediatek,color.yaml   =20
> > > >  | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >=20
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/display/mediatek/mediatek,col
> > > > or.yaml
> > > > b/Documentation/devicetree/bindings/display/mediatek/mediatek,col
> > > > or.yaml
> > > > index f21e44092043..b886ca0d89ea 100644
> > > > ---
> > > > a/Documentation/devicetree/bindings/display/mediatek/mediatek,col
> > > > or.yaml
> > > > +++
> > > > b/Documentation/devicetree/bindings/display/mediatek/mediatek,col
> > > > or.yaml
> > > > @@ -26,6 +26,7 @@ properties:
> > > >            - mediatek,mt2701-disp-color
> > > >            - mediatek,mt8167-disp-color
> > > >            - mediatek,mt8173-disp-color
> > > > +          - mediatek,mt8195-mdp3-color
> > >=20
> > > How come this one is a "mdp3" not a "disp"?
> >=20
> > I don't know what mdp3 means & googling gives me no answers. What's
> > the
> > "disp" one controlled by, since it isn't controlled by mdp3?
> >=20
>=20
> Hi Conor,
>=20
> Mediatek's Media Data Path ver.3 (MDP3) is associated with MMSYS and
> acts as an independent driver that operates between VDEC and DISP.
> By controlling multiple components, it carries out tasks like
> converting color formats, resizing, and applying specific Picture
> Quality (PQ) effects.
> The driver can be found at "driver/media/platform/mediatek/mdp3".
> Since the same hardware components are configured in both MDP3 and
> DISP, considering previous discussions, I attemped to integrate into a
> single binding, named after the controlling user.

I'm still kinda struggling to understand this. Do you mean that the
hardware can be controlled by either of the disp and mdp3 drivers, and
a compatible containing "disp" would use one driver, and one containing
"mdp3" would use another?


--T9lGne2QQapOBRac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRP6PgAKCRB4tDGHoIJi
0kh7AP9O7MKYjrnar798S6fbop9AWuqH31/FShl/0JtdCf2N/wD/R/G17q/VHosy
cmzXFHme+vk2cMO0cR0geJwglqggtQo=
=5FSm
-----END PGP SIGNATURE-----

--T9lGne2QQapOBRac--

