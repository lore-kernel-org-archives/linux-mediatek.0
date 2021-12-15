Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B420FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 15:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nu45OQ7v6RA68CvkydRiFU/T9jUDl/54xkgogSjD3fw=; b=bbk705O5uJYQLoMXYYKb4wvlRM
	cbSmznFR0UrK9iB1Oc47SERt4bFQ4tQq0EX1AZD+i1ueW8yqmXJO5pbtljztITaM6tgxZdHwb6Yzm
	+i78QejGVGlrKs4Hg15zb3TawJNCBBUB7cn4OZeL4SdKs8rFOgJZCNjzscl3vJV4YfISHaY8yt4Gl
	cdjaYBvPNvCzBZRosZ+Wo+q6vAAZssf24xQIMbqs8hM3Tb3mIj+vLQ9VufrbkTJC21bEBNJ106DKU
	GRE0M0IDoo6pk6LDT7aCo4MFeEpuWoVewEeqNDK5okRRIyIIVXWk6Sh/PQJrD0JcxrSs2F8ZWY8Xi
	NymwQxCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxW0P-001Jf3-ME; Wed, 15 Dec 2021 15:15:45 +0000
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxVzw-001JQ0-Qq; Wed, 15 Dec 2021 15:15:18 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id B2BFB2B00280;
 Wed, 15 Dec 2021 10:15:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 15 Dec 2021 10:15:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=BgQfZ5cmTLEg6cfAdiBnNstLR/w
 6Eaqsba+2qCrgE3U=; b=UxyQrvNP5H9z8DjeJCSVCJSF4F7qx+Im+whlJrvye/O
 NQD/BQCjWSZVyhpynD4txgI8c8CUUs5kUjzCNoWQFaMzhRVQ2Z7ZviHJD3Keuj2f
 S+vGf5J8Gh/CpHjNTubKAqTEbWni2jHC9TSuj51YI6q8oryTHM3InILFRcXyfVPo
 Nnoyei3MheVDEFgELkWrQpXRz/FJMvrrWXG9LfDPydbRiNajuvW33BAmcE61FlEw
 qL9TAfhgoBLnHlEr5COe4r+TEnf0sJa+R69zGVsICnFMWbGpQ4khqfImIgTMKs1a
 RV8SkIh+QFZfO0da/ZZBtIDEZ6nvKWdWnMmWMgwzbGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=BgQfZ5
 cmTLEg6cfAdiBnNstLR/w6Eaqsba+2qCrgE3U=; b=aCe1LeTQ/muxoLZFqzGKYz
 y8UqxB/btSaJBsnA0/tnqWAkoap5TWK8Kjc1GczJL02Q/jMqwX/ZtngFs0BCZkmH
 9+AlwfSg5VLtZnkiHqgLTf9YhB25yF9tAJ1LVOFhEQF9m3tjQJdxjblVUWd4FCzN
 enhoWp9N+0M7jUxCSVir0QPatrdhkQ3toUDx704NJYsE+ScH0WjI2k1nIxj/qF/2
 wOPg9f3HDXqv5G7SZVeFZBpaX7Fx0L2aSUrQ3FfZ7iEwr2F10KjdVu8jSPs4f9Mf
 H4pvkoD5yeUbxUgjWbJE5Y+7g7FqgflZF0PMhbHfop3w4QajzCi+CMfxu5ffZE4Q
 ==
X-ME-Sender: <xms:fga6YewyMBRnbO9eOIO2AOEHn8IiCI4sjSF2D1ElgLjlUG6lJvGHsA>
 <xme:fga6YaTSy8et713HqV5php6RlZEp759Ss0zpSEf0BXXNpeiTbE74bIUG6mW_8Y8rK
 QFnA3Gc7dGZ2O93JTU>
X-ME-Received: <xmr:fga6YQVgmI8jtj16Jf-V2UuBNuhkegRPqHgcXNMI3Ztu-zGnPyX2qfqY6ce6_YG1FW0ielLeeyqC8VNczEGfTi5UO2Br-qI-QJu15BY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:fga6YUjMpClCRS2EOz-At3snRCjqdv6WdjzGOy2d6X1iYSqyyFTKAA>
 <xmx:fga6YQBvV8lkD0PCcF2rtee3UX6r8oGUzWEGDky5cZGaUHJ0ljz1pg>
 <xmx:fga6YVLf2hwARidBL946sLKtm73nqU4Yb50s_2En8I6IYdKGUSogmw>
 <xmx:fwa6Yc4PsujncKjBgPHfwsK96d0TdXCjruxJiNtCtWL2Ij_duAZeQa1Gkzw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 10:15:10 -0500 (EST)
Date: Wed, 15 Dec 2021 16:15:08 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 7/7] drm/mediatek: Add mt8195 DisplayPort driver
Message-ID: <20211215151508.hc7blhh7p3wrjili@houat>
References: <20211110130623.20553-1-granquet@baylibre.com>
 <20211110130623.20553-8-granquet@baylibre.com>
 <20211115101129.lyxxmb6i7paaonwi@gilmour>
 <CABnWg9tNPGZSi1RLqF5+Qs1GHtynyVoOzAyw+i9mPRYEoByk8g@mail.gmail.com>
 <20211116145112.xyoxzfll6exysnvt@gilmour>
 <CABnWg9uhuchdWyBeTacR6Cy0A9OHziUi051BQ5wsZVU0ajYjyA@mail.gmail.com>
 <20211125143034.tzikvlxxl6fdhsif@gilmour>
 <CABnWg9tcWdfPQwNtFhqVZxCriT848fy42VHoQZs3X2UmL4LYSA@mail.gmail.com>
 <20211213165422.54n3oh72tjcb3a67@houat>
 <CABnWg9uyoK0TkRZRJXstmtB4u2-UUCi-x_frosKhhQerNmFT=A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABnWg9uyoK0TkRZRJXstmtB4u2-UUCi-x_frosKhhQerNmFT=A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_071516_956827_D47F62AD 
X-CRM114-Status: GOOD (  50.64  )
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
Content-Type: multipart/mixed; boundary="===============6577857278178906025=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6577857278178906025==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ndkzk456decuxgne"
Content-Disposition: inline


--ndkzk456decuxgne
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 15, 2021 at 09:03:01AM -0600, Guillaume Ranquet wrote:
> Quoting Maxime Ripard (2021-12-13 17:54:22)
> > On Thu, Dec 02, 2021 at 06:48:12AM -0800, Guillaume Ranquet wrote:
> > > Hi,
> > >
> > > Quoting Maxime Ripard (2021-11-25 15:30:34)
> > > > On Wed, Nov 24, 2021 at 01:45:21PM +0000, Guillaume Ranquet wrote:
> > > > > Hi,
> > > > > Thanks for all your input, really appreciated.
> > > > >
> > > > > Quoting Maxime Ripard (2021-11-16 15:51:12)
> > > > > > Hi,
> > > > > >
> > > > > > On Mon, Nov 15, 2021 at 09:33:52AM -0500, Guillaume Ranquet wro=
te:
> > > > > > > Quoting Maxime Ripard (2021-11-15 11:11:29)
> > > > > > > > > The driver creates a child device for the phy. The child =
device will
> > > > > > > > > never exist without the parent being active. As they are =
sharing a
> > > > > > > > > register range, the parent passes a regmap pointer to the=
 child so that
> > > > > > > > > both can work with the same register range. The phy drive=
r sets device
> > > > > > > > > data that is read by the parent to get the phy device tha=
t can be used
> > > > > > > > > to control the phy properties.
> > > > > > > >
> > > > > > > > If the PHY is in the same register space than the DP contro=
ller, why do
> > > > > > > > you need a separate PHY driver in the first place?
> > > > > > >
> > > > > > > This has been asked by Chun-Kuang Hu in a previous revision o=
f the series:
> > > > > > >
> > > > > > > https://lore.kernel.org/linux-mediatek/CAAOTY_-+T-wRCH2yw2XSm=
=3DZbaBbqBQ4EqpU2P0TF90gAWQeRsg@mail.gmail.com/
> > > > > >
> > > > > > It's a bit of a circular argument though :)
> > > > > >
> > > > > > It's a separate phy driver because it needs to go through anoth=
er
> > > > > > maintainer's tree, but it needs to go through another maintaine=
r's tree
> > > > > > because it's a separate phy driver.
> > > > > >
> > > > > > It doesn't explain why it needs to be a separate phy driver? Wh=
y can't
> > > > > > the phy setup be done directly in the DP driver, if it's essent=
ially a
> > > > > > single device?
> > > > > >
> > > > > > That being said, usually what those kind of questions mean is t=
hat
> > > > > > you're missing a comment or something in the commit log to prov=
ide that
> > > > > > context in the first place, so it would be great to add that co=
ntext
> > > > > > here.
> > > > > >
> > > > > > And it will avoid the situation we're now in where multiple rev=
iewers
> > > > > > ask the same questions over and over again :)
> > > > > >
> > > > > At first I didn't understand your reply, then I realized I gave y=
ou
> > > > > the wrong link...
> > > > > my bad! I'm struggling a bit with mail reviews, but I'll get ther=
e eventually.
> > > > >
> > > > > The driver and phy were a single driver until v2 of this patch se=
ries
> > > > > and the phy setup
> > > > > was done directly in the driver (single driver, single C file).
> > > > > Here's the relevant link to the discussion between Chun-Kuang and=
 Markus
> > > > >
> > > > > https://lore.kernel.org/linux-mediatek/CAAOTY__cJMqcAieEraJ2sz4gi=
0Zs-aiNXz38_x7dPQea6HvYEg@mail.gmail.com/#t
> > > > >
> > > > > I'll try to find a way to make it clearer for v7.
> > > >
> > > > OK, it makes sense then :)
> > > >
> > > > There's something weird though: the devices definitely look like th=
ey're
> > > > in a separate register range, yet you mention a regmap to handle the
> > > > shared register range. That range doesn't seem described anywhere i=
n the
> > > > device tree though? What is it for?
> > >
> > > My understanding is that 0x1000 to 0x1fff controls the phy
> > > functionalities and 0x2000 to 0x4fff controls "non-phy"
> > > functionalities. And you are right, there's no description of that in
> > > the device tree whatsoever. The ranges are in the same actual device
> > > and thus it has been decided to not have dt-bindings for the phy
> > > device.
> >
> > Sure, that last part makes sense, but then I'm not sure why you don't
> > have the full register range in the device node you have in the DT?
> >
> > > The phy driver is a child of the DP driver that we register using
> > > platform_device_register_data() and we pass along the same regmap as
> > > the DP driver in its platform data.
> >
> > Especially if it's used by something, it should be described in the DT
> > somewhere.
> >
> > Maxime
>=20
>=20
> So, to make things crystal clear to a newbie (like me).
> Would you describe it like this:
> compatible =3D "mediatek,mt8195-dp-tx";
> reg =3D <0 0x1c501000 0 0x0fff>,
> 	<0 0x1c502000 0 0x2fff>;
>=20
> instead of the current description:
> compatible =3D "mediatek,mt8195-dp-tx";
> reg =3D <0 0x1c500000 0 0x8000>;
>=20
> I haven't checked what the rest of the 0x8000 range is used for though...

I'm confused, is that what you had before?

I recall you had a DTSI somewhere where you have two devices, and the
dp-tx device not having the phy range?

If the latter is what you have, and there's no overlapping ranges over
multiple nodes, then it's fine already.

Maxime

--ndkzk456decuxgne
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYboGfAAKCRDj7w1vZxhR
xd+NAQCzDSb3a8jsktzRpRmed41tbQPbdLx8RoZV1Z4ZIerXRQD5ASNI9HPxl3CG
VgiUX/PsaEGNJr3KNbNwBWiUDdLLbAc=
=GHKM
-----END PGP SIGNATURE-----

--ndkzk456decuxgne--


--===============6577857278178906025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6577857278178906025==--

