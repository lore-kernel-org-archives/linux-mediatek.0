Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A1CC4828C
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 13:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvtQsVUpv6mrbOusIihe550/VZAo/qI5LTEF9Sr+vYc=; b=TpxkwVcXBJB7cmX5V6tzSyQEF5
	BbWeiZMf4NB9Mupli7KdO4hE+CcVR2RZMhuK0Ipvif7pyd7hw0Wp6h9IiOKV5tCn2bfOP8mTyx+4Q
	TXgkDK6vFyziPA3lNzhoHsUETV97V8yQ07vSrCErHx3zQoFxQbiFxc9M11Xf20osTrd7zedvOW7Gj
	FLbZ2yiX3PtfZ5+NA5u0CONWutELOX1qvxDf9D94GuCqJcq/7ZWxBg2ZoajAlrE68ubUVvRDZGNFJ
	++3oby6gRg3hrkpOms5InMYSl3QnmcZCUt1bANu/8JEkmBZtaK5YM9pqZ6hT7qR4yVUvNnjnlZCym
	+4hbJKUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVXHD-000000087e3-11oE;
	Thu, 01 Feb 2024 13:38:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVWsF-00000007wzP-0fjF;
	Thu, 01 Feb 2024 13:13:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1706793179; x=1738329179;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qvtQsVUpv6mrbOusIihe550/VZAo/qI5LTEF9Sr+vYc=;
  b=RY/quQg4c46fDxogoYiVZta7DZjsNB//Zd4VBbv9jct10AxImRSC79R8
   oqsG/F+AteOYxhdf9SSMCTb9HAX1aC4n+2pKTing7YSlCu5brcBsxVSIn
   xsrkH+E0bg7/k7PiMY6jEDUZi3tCVc8kJsaqAIlSGasqUKYkRQc2u5mjs
   SOczBH44JxX8HN/eW2K8WHhFT0YPdd3zU/EjfsiMxvZmb2D+rxlVveE+G
   r9Zx6zeWXT6mS9Q6RSuj9Nb7kXZZo60XdIeVhoDz491uRdBaRG2nURe4t
   /bHzxJUXrfCGZzNf81UoOjNYjwmdSVsGUs7IZN9SazL1bXfQRzPN5ADlG
   w==;
X-CSE-ConnectionGUID: DojxIC2fROuGfno2oWJAig==
X-CSE-MsgGUID: UGxvDEb7R5C65tm/xwNFig==
X-IronPort-AV: E=Sophos;i="6.05,234,1701154800"; 
   d="asc'?scan'208";a="15617257"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Feb 2024 06:12:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 06:12:21 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 1 Feb 2024 06:12:18 -0700
Date: Thu, 1 Feb 2024 13:11:39 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Frank Wunderlich <frank-w@public-files.de>
CC: Conor Dooley <conor@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Frank Wunderlich
	<linux@fw-web.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Sam Shih <sam.shih@mediatek.com>, Daniel Golle
	<daniel@makrotopia.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: Aw: Re: [PATCH v3 1/2] dt-bindings: reset: mediatek: add MT7988
 reset IDs
Message-ID: <20240201-goes-passable-0ba841d36bc3@wendy>
References: <20240117184111.62371-1-linux@fw-web.de>
 <20240117184111.62371-2-linux@fw-web.de>
 <20240118-calcium-krypton-3c787b8d1912@spud>
 <trinity-afc4f48e-65e1-46ee-a78b-1d670cc0f310-1705615200900@3c-app-gmx-bap21>
 <43f946cc-07e1-48c5-9b31-40fc9bc93037@collabora.com>
 <20240119-dupe-obligate-707b3a01b356@spud>
 <0EA6A126-DDC0-4E9F-BEBC-FD018B08CA84@public-files.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7WXHEjVDjRcKaa45"
Content-Disposition: inline
In-Reply-To: <0EA6A126-DDC0-4E9F-BEBC-FD018B08CA84@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_051259_422945_E814B7C7 
X-CRM114-Status: GOOD (  24.47  )
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

--7WXHEjVDjRcKaa45
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 12:40:17PM +0100, Frank Wunderlich wrote:
> Am 19. Januar 2024 18:04:36 MEZ schrieb Conor Dooley <conor@kernel.org>:
> >On Fri, Jan 19, 2024 at 10:28:30AM +0100, AngeloGioacchino Del Regno wro=
te:
> >>
> >> The resets are organized on a per-reset-controller basis, so, the ETHW=
ARP
> >> reset controller's first reset is RST_SWITCH, the second one is RST_so=
mething_else,
> >> etc. while the first reset of the INFRA reset controller is PEXTP_MAC_=
SWRST.
> >>=20
> >> That's why ETHWARP has a reset index 0 and INFRA also starts at 0.
> >> I think that the numbering is good as it is, and having one driver sta=
rt at index 5
> >> while the other starts at index 12 would only overcomplicate registeri=
ng the resets
> >> in each driver, or waste bytes by making unnecessarily large arrays, f=
or (imo) no
> >> good reason.
> >>=20
> >> This is one header, but it should "in theory" be more than one... so w=
e would have
> >> one for each hardware block - but that'd make the reset directory over=
-crowded, as
> >> other MediaTek SoCs have got even more resets in even more hardware bl=
ocks than the
> >> MT7988. That'd be something like ~4 reset headers per SoC (and will in=
crease with
> >> newer ones)...
> >> ...and this is why we have one binding header for resets.
> >
> >That's okay. The commit message leaves me, who clearly isn't a mediatek
> >guy, with no information as to why these are not one contiguous set.
> >IMO being for different reset controllers entirely is fine.
> >
> >> On the topic of leaving space to allow grouping RST0/RST1: -> No. <-
> >> The indices have to start from zero and have to be sequential, with no=
 holes.
> >
> >Agreed.
>=20
> Hi,
>=20
> Just a friendly reminder.
>=20
> As far as i understood, Patches are fine so far and do not need any rewor=
k,right?

I suspect I was asking for a commit message that explains why these
numbers don't continue in sequence. With that,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> But i have not seen them picked up yet in linux-next.
> regards Frank

--7WXHEjVDjRcKaa45
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbuYiwAKCRB4tDGHoIJi
0pvVAP93MxxzBvNZvtpY9olFpk98CWj6rUSSZNqZsc6xps/yEAD+Kke0OXNnExQZ
iR3rlwQAtPweOolLZJS0LiATIRpshgQ=
=wI+F
-----END PGP SIGNATURE-----

--7WXHEjVDjRcKaa45--

