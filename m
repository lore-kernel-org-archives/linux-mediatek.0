Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC01CC27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 08:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgkvKqufEzVzA4mCCc5Izp084ePjsPRawcTM+KusyrY=; b=CnDIsC8XGu9nFulMuCCdPVek9Q
	aYJn22Z8TTHW5ov48mj7MH4fDV7hk20c3gZI0vnft1VmUDS7+x2W26QISiSRnqIwmJWJtYZ1xf4I9
	QZL05IwypaJQFlRdBj87I9RV4FabX0j5xQ6TLGkSBO8KYmldkeXJ3R/MtaH5RtTSwlpGm38Yns/zB
	P8+JeRGx+WLYcuRxQPav9jukv+mOUdeiZi96MYkuXtf3C/XS8Pj14FmMblm/1Clh5mGzWqnsukV1x
	asd1m5CaueUJbTFUZIxDSERe1bua7UcI7VcwAjZD5nB4lxt0qefFidtmaIvvgcdxY+t6nr+XAV0ZV
	0PSDf1AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKD3u-0000000480D-14dY;
	Thu, 20 Jun 2024 08:22:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKD3q-000000047zE-1IqB;
	Thu, 20 Jun 2024 08:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718871747; x=1750407747;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DgkvKqufEzVzA4mCCc5Izp084ePjsPRawcTM+KusyrY=;
  b=ikFIwTKOcsUhjln4RpNtNyqKbeY3wGC2R7IcFzeQj8avprb6jPGdM9Ta
   SA6g0TrRk4zOwObfozjoq5w2/KugAeUCUhSj9fwwLZr11DlzSrd3nZ0cf
   A6hRbJ7ou7KGwVFp0uv5h3Jw7yIN0ylot/WhQiRZoxraKIqvIU8Q10tk9
   XU7KTEp5ODkjcbkhYBSvaVDgP2BZzp5Kxuui1SvBiGKAir0LKQiKKUkAh
   Y7pgUE8cy5eXHjrHDTJcAUbQmIu1Oh4EScSDvD5Hgbdx9tRnGN1JbB6La
   tVHZ/T9dHa/nBSbmqnba/34BcFXvVndhQydbmylIdis9CjEjvPSKfN8h5
   g==;
X-CSE-ConnectionGUID: BfXzup/sSuCPo1L9vCsj6w==
X-CSE-MsgGUID: ecnZoOx/TbqPi03KL3ujjw==
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="asc'?scan'208";a="259148518"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Jun 2024 01:22:25 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 20 Jun 2024 01:22:24 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 20 Jun 2024 01:22:20 -0700
Date: Thu, 20 Jun 2024 09:22:02 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Conor Dooley <conor@kernel.org>, <krzk+dt@kernel.org>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>, <jassisinghbrar@gmail.com>,
	<garmin.chang@mediatek.com>, <houlong.wei@mediatek.com>,
	<Jason-ch.Chen@mediatek.com>, <amergnat@baylibre.com>,
	<Elvis.Wang@mediatek.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<kernel@collabora.com>
Subject: Re: [PATCH 3/3] dt-bindings: mailbox: mediatek: Avoid clock-names on
 MT8188 GCE
Message-ID: <20240620-district-bullring-c028e0183925@wendy>
References: <20240619085322.66716-1-angelogioacchino.delregno@collabora.com>
 <20240619085322.66716-3-angelogioacchino.delregno@collabora.com>
 <20240619-sleeve-citable-a3dc10e5cd4f@spud>
 <a7317981-8690-4d45-81b6-cc6a63c459e0@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vDd3+enh6BC9rJov"
Content-Disposition: inline
In-Reply-To: <a7317981-8690-4d45-81b6-cc6a63c459e0@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_012226_379358_9B61F745 
X-CRM114-Status: GOOD (  20.57  )
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

--vDd3+enh6BC9rJov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 10:01:18AM +0200, AngeloGioacchino Del Regno wrote:
> Il 19/06/24 19:49, Conor Dooley ha scritto:
> > On Wed, Jun 19, 2024 at 10:53:22AM +0200, AngeloGioacchino Del Regno wr=
ote:
> > > Add mediatek,mt8188-gce to the list of compatibles for which the
> > > clock-names property is not required.
> >=20
> > Because, I assume, it has some internal clock? Why do either of these
> > things have no clock? Doesn't the internal logic require one?
> >=20
>=20
> Because there's no gce0/gce1 clock, there's only an infracfg_AO clock tha=
t is
> for one GCE instance, hence there's no need to require clock-names.

clock-names, d'oh. I misread that completely yesterday.

> I can't remove the clock-names requirement from the older compatibles tho=
ugh,
> because the (sorry about this word) driver (eh..) gets the clock by name =
for
> the single GCE SoCs...
>=20
> ...and here comes a self-NACK for this commit, I have to fix the driver a=
nd
> then stop requiring clock-names on all compatibles, instead of having this
> ugly nonsense.

Is it not worth keeping the clock names, even if ugly or w/e, because
things have been done that way for a while?
Also, what does U-Boot do on these systems to get the clocks?

> Self-note: gce0/gce1 clocks lookup was implemented in the driver but never
> used and never added to the binding - luckily.
>=20
> Sorry Conor, I just acknowledged that there's a better way of doing that.
>=20
> Thank you for making me re-read this stuff, I'll send the proper changes
> later today, driver change + binding change in a separate series.
>=20
> As for the other two commits in this series, completely unrelated to GCE,
> those are still fine, and are fixing dtbs_check warnings.

--vDd3+enh6BC9rJov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnPmqgAKCRB4tDGHoIJi
0kReAP9+nHTN6lCNnpAg765nXa6b1QwdTBEFjAYmSXPq03sY+QEAtvDHFzs69uth
qgd15/M32kAL2PfmVibeGNuC6SuDsQA=
=4tAi
-----END PGP SIGNATURE-----

--vDd3+enh6BC9rJov--

