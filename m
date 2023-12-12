Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16260C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 10:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdFVtthspv6JhHFoPzyADVI/yoEGDdTuhRjleKHBeu4=; b=o5G7HCwCA07TDUTVbce72zdbTM
	2Em5Gn5PeOfqRxKmWS4LbYyh7KxD3BGbN+fAJF2xsCeJXhPActLLcHxm2ToP3G6qKu5kW3P+rKG4R
	zfRhojCPzybrk5G1A0rHWSlq0M4xt9LTFBphhd/c8cg569yhL1NAg5//WshKpCLWe3SbC5OXVdAsh
	NusqVtjKXRw7CTI6l55x+58Y8d9i4f4nKow+WKSLRGZCU6v4XIw94SzxPMCmaRtaXewDEQwwH3Ssb
	6Wz9Z1q7iG+YcT2dWg+DK+EWbbl6JacindKsVjgtx97hPYUY4uCzzoUWv0vy+VWgzW5vVlu2xLBsW
	Ssy+6JvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCzYX-00BFl9-2P;
	Tue, 12 Dec 2023 10:00:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCzYV-00BFjM-1w
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Dec 2023 10:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1702375199; x=1733911199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/XHCHQ1cOABSnQ5Y23hkMwYc4oBP1AIUXdxlgJZl4j4=;
  b=eaDH8Mu7m9dPBXyz6vSuF65QwhoMsSKKwVL+ydReT11J6g+aWo3NULVq
   XCSqLZMTApvr+jeces58TC93yVOjvugpR6KMCsu1fVx4k3+ZLZNqj/Om4
   loJVqjoHA4kHXc9Y8FHMPYCg2PygYPLAy0xnhjbKKg2bYsp57razbDr2+
   D8+tYZwFf5OjsRgAHXT3VWS1OmcxDEgPZpUe3IVzsGZQT1GeD1CQjAqc4
   WLGd26V9PERT5EslvlDWn7aWpprDhDmR9dhdZVbDIbwX7RW/aRTXPVQhk
   O3ZLSsYjItkjzLzuKsXFMROjcbDL6XN1wR3WSrFqAMBgDW0AQ9gTDnxo2
   w==;
X-CSE-ConnectionGUID: h4hFsnD2SqepXzWWMykC7w==
X-CSE-MsgGUID: gn2WEGVeQ0m59fDN4TIUyg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="asc'?scan'208";a="180349572"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Dec 2023 02:59:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 02:59:54 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 12 Dec 2023 02:59:52 -0700
Date: Tue, 12 Dec 2023 09:59:21 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Rui Zhou <zhourui@huaqin.corp-partner.google.com>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>, <perex@perex.cz>,
	<trevor.wu@mediatek.com>, <allen-kh.cheng@mediatek.com>,
	<kuninori.morimoto.gx@renesas.com>, <linux-mediatek@lists.infradead.org>
Subject: Re: [v8 3/4] ASoC: mediatek: mt8188-mt6359: add es8326 support
Message-ID: <20231212-hazard-womankind-c723b94fa236@wendy>
References: <20231208070933.720324-1-zhourui@huaqin.corp-partner.google.com>
 <20231208070933.720324-4-zhourui@huaqin.corp-partner.google.com>
 <db3429e0-0173-4f13-bccb-78ac56ad4ed9@collabora.com>
 <CABRjgzvUz6BTSFHCMAGL6e3LWMyGfnJsJJ0j1M_CvBr9wMb49A@mail.gmail.com>
 <254e8913-7f42-4af0-af9b-ee32b4fccdc2@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1Z3sOnFI1NiMbD/k"
Content-Disposition: inline
In-Reply-To: <254e8913-7f42-4af0-af9b-ee32b4fccdc2@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_015959_699482_A76AC4D2 
X-CRM114-Status: GOOD (  12.82  )
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

--1Z3sOnFI1NiMbD/k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 10:38:20AM +0100, AngeloGioacchino Del Regno wrote:
> Il 12/12/23 05:04, Rui Zhou ha scritto:
> > Hi Angelo,
> > Because the TDM interface defined by mt8188_max98390_ops sets a fixed 4
> > slots, so if the current sound card only supports two amps, we need to =
skip
> > this setting.
> > By the way, do you think this comment is okay?
> > /*
> >   * The TDM protocol settings with fixed 4 slots are defined in
> >   * mt8188_max98390_ops. Two amps is I2S mode,
> >   * SOC and codec don't require TDM settings.
> > */
> > if (!(card_data->quirk & MAX98390_TWO_AMP)) {
> > dai_link->ops =3D &mt8188_max98390_ops;
> > }
>=20
> That's perfect. Waiting for v9.

And please make sure that that v9 goes to the devicetree mailing list
and whatever other lists have been omitted in this submission.

Cheers,
Conor.

--1Z3sOnFI1NiMbD/k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXgu7AAKCRB4tDGHoIJi
0gSYAQCwXq94eSpKDFfExYNIB8mFSRWm2FsMWKKEq0xW+KP8TQEA1JwIem+4GoIG
OVHBbud9YKrZ8+HVGs2x6D7ONvtQowE=
=i01n
-----END PGP SIGNATURE-----

--1Z3sOnFI1NiMbD/k--

