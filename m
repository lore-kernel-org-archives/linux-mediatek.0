Return-Path: <SRS0=1cO+=GX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C124C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 14:57:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74ED923381
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 14:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74ED923381
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=neJDgvFqSpg8XooVf+3d5eyjyDdSTryIuLRz4VyFSPg=; b=B7fvw0xv3VHwdHEqjm6ywyrMz
	vQ147MrSo4RHqP8qgiEuEI9IAimIJLZwPd2vWmPz2KfNBaZFLNDQBti3STZ0G7lG/vPJgHpNh04Gt
	oNrXZ/spZCAJ/B/1E59QKvR2BtiyJeNx1BKpD4jmCbEYDM/MKcdPavIlK+akOtVkhpNjQ1ea9c/2m
	cXbbciMgKD43wwNCeYfjP7ZGGvRfvgDxhU+jc/jYOGXAAaDv5hZxEoTldPevsZgOHV02/IoNDv/Rg
	m1VCBPhxgdgtZ918+ukC9TS2RJ5EU7JnaMkAMWjVzCnl2J/+txR9KikSzIJrFTDvLa5A3MwQPWMa/
	fTTYM16+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Ev6-0001jU-V9; Wed, 20 Jan 2021 14:57:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2DtD-0004ot-BI; Wed, 20 Jan 2021 13:51:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sDxhL51Vhfp7bMJtc05jY3INv15IU8xKUsLjHr0xiOU=; b=vJdEETATxp3YRtk6aondiv8sV7
 l7PlfwUWlF5cknTj757w9bcr9dU0BkBYe+ItJv41Mq0tzjo+/2wsi4/uH1u1dUfQ9l7SX2h60vdTe
 NHtYpoh0YiZvWDNwDgPgBjR5crl6laBst/cmQ98A03rmID2Z6V1KGGgMoqai+fQcxZZ+pla+ha0uC
 IqOpB3rtJcXmlvaYaGDAje0s6EDGhR3q0Tx9IOaq3X9ePdJ1layAUDrtDu4pD7lxzofuANOCYDs7N
 Nm+9zHIP6Vagwi2lUp8dBIs6fu5SRu3gW3FGM0O0DT7BXdG6ThPMid2k+Kc9z+2ppCIH+/cvF4B10
 mzwNG2Pg==;
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1l2Dsn-00FkNI-N1; Wed, 20 Jan 2021 13:51:02 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 544A5580616;
 Wed, 20 Jan 2021 08:50:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 20 Jan 2021 08:50:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=sDxhL51Vhfp7bMJtc05jY3INv15
 IU8xKUsLjHr0xiOU=; b=e6RAvVNPXxx7n+xiZF1cUAYNfJs5LTR6PfLc0CImUdL
 LlXQ2amT0WEqGAlHTdvKd/rcGDF9tSdtsirQSEbuQ3kwVZPiCkw1rM45GLgnvgPm
 Z4AsvGXKTlP7JsOul0AAUpaxlPAIY0gsrLwL9MiYoYuMQ6L6TO3yzgXJyxnZRvp+
 jtbY428Tzk+iEi5DuF8gexjpBHwznO/my3ickth/O3fCvFWfKEcF6MqEAd4+26aI
 ltp/+9yq6CB5vfxYtjqmtlBszlAGV3LvzyYzkBIp/5m62bEJ7/gvtET2/W1vfPsg
 vY4oRDFmYVdvqYxQCwBv7aNKZ4xfO67HgJeBjDQpS+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=sDxhL5
 1Vhfp7bMJtc05jY3INv15IU8xKUsLjHr0xiOU=; b=LikqJHGPtkrNylI5xzansd
 wjJ/KJ/R7Dq22hms9Md8biwwcNcdgUs/TtLHDiHdLWd/KIyZNBRPQyEEuZqOAVQH
 Zq59rIAwtrVdT/8xqrz21GDUEkDYGNlS2+2VlDDnQMqXZW2egzoG0Z70QoZsOgpH
 Cv+G0h3ZqaTJuyO4BYEoteVvzAOlKtK1B98G73tE5c5NwbRRkCgLWGFAWw/fAa69
 zKxmdFUnM/ToyfHDRec9Q6ytEXmtIFW+kY42SZebw6yv+4kH64ts8JA31fa6TubI
 bDGw4zZCK5hUm4lShfikDy9nGwJ5aG1okt63wGVtgRstD+gcvL8O6zoqeehmfcBA
 ==
X-ME-Sender: <xms:IzUIYJyjBDk2-Ewegnc7Hq9GTD5alDyksFm78hquneKLxSpMAnTx1Q>
 <xme:IzUIYJTtvdXHIq0wdouB0Fd3H_6WXJmFuESX5TuHXHnInWmwdGIT1NvWqzSGAlwXW
 1oyxaEoJrSKjHXk9Us>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeejuddvhfekkefhtdegiefhledutdevtdfhkedtleefjefgleduhfetudevjeeh
 hfenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepledtrdekle
 drieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IzUIYDV4IfnGFU_2lyw5XqL3TvmYbBA4AR__TrkA3iaokM7PmfRegg>
 <xmx:IzUIYLg4_zBtXiAWqlVE93JYhTgicZgHFCMWYuPvMc-sOMKhU-l4IA>
 <xmx:IzUIYLA6hD-5ZjG_K5igYUbzbL45QJq6qsO7iotuwoTsiB2nPVOYfQ>
 <xmx:JzUIYFrYN58bP-OKW0NJDZug9puVlgOcLOhe106KSpR_QIyNqvm3rQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4410A24005A;
 Wed, 20 Jan 2021 08:50:27 -0500 (EST)
Date: Wed, 20 Jan 2021 14:50:26 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 10/10] drm: Use state helper instead of the plane state
 pointer
Message-ID: <20210120135026.np2ivojt5vnvyota@gilmour>
References: <20210115125703.1315064-1-maxime@cerno.tech>
 <20210115125703.1315064-10-maxime@cerno.tech>
 <YAIHFTYiry6ebUsY@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <YAIHFTYiry6ebUsY@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_135102_279540_1DB56C47 
X-CRM114-Status: GOOD (  28.41  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Stefan Agner <stefan@agner.ch>,
 Sandy Huang <hjc@rock-chips.com>, Paul Cercueil <paul@crapouillou.net>,
 linux-tegra@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Michal Simek <michal.simek@xilinx.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Marek Vasut <marex@denx.de>, Yannick Fertre <yannick.fertre@st.com>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-rockchip@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Roland Scheidegger <sroland@vmware.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-arm-msm@vger.kernel.org,
 Philippe Cornu <philippe.cornu@st.com>, Dave Airlie <airlied@redhat.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 virtualization@lists.linux-foundation.org, Hyun Kwon <hyun.kwon@xilinx.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen Feng <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-renesas-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-mediatek@lists.infradead.org,
 John Stultz <john.stultz@linaro.org>, dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Edmund Dea <edmund.j.dea@intel.com>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Melissa Wen <melissa.srw@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, freedreno@lists.freedesktop.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, linux-stm32@st-md-mailman.stormreply.com,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Vincent Abriou <vincent.abriou@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 spice-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Tian Tao <tiantao6@hisilicon.com>,
 Shawn Guo <shawnguo@kernel.org>, Brian Starkey <brian.starkey@arm.com>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: multipart/mixed; boundary="===============3852755250493856615=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3852755250493856615==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j7svqftvzagigb3f"
Content-Disposition: inline


--j7svqftvzagigb3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Fri, Jan 15, 2021 at 11:20:21PM +0200, Laurent Pinchart wrote:
> Hi Maxime,
>=20
> Thank you for the patch.
>=20
> On Fri, Jan 15, 2021 at 01:57:02PM +0100, Maxime Ripard wrote:
> > Many drivers reference the plane->state pointer in order to get the
> > current plane state in their atomic_update or atomic_disable hooks,
>=20
> Please don't use the word "current", it's ambiguous. Do you mean old
> state or new state ?

It's kind of the point I was trying to make: plane->state is the current
state of the plane, but it's definitely ambiguous and it's fairly easy
to be confused when working over several hooks.

> > which would be the new plane state in the global atomic state since
> > _swap_state happened when those hooks are run.
>=20
> Is this relevant ? drm_atomic_helper_swap_state() doesn't change the
> old_state and new_state pointers in drm_atomic_state as far as I can
> tell.

No, but it does change the plane->state pointer: before swap_state it's
the old state, after swap_state it's the new state

> > Use the drm_atomic_get_new_plane_state helper to get that state to make=
 it
> > more obvious.
> >=20
> > This was made using the coccinelle script below:
> >=20
> > @ plane_atomic_func @
> > identifier helpers;
> > identifier func;
> > @@
> >=20
> > (
> >  static const struct drm_plane_helper_funcs helpers =3D {
> >  	...,
> >  	.atomic_disable =3D func,
> > 	...,
> >  };
> > |
> >  static const struct drm_plane_helper_funcs helpers =3D {
> >  	...,
> >  	.atomic_update =3D func,
> > 	...,
> >  };
> > )
> >=20
> > @ adds_new_state @
> > identifier plane_atomic_func.func;
> > identifier plane, state;
> > identifier new_state;
> > @@
> >=20
> >  func(struct drm_plane *plane, struct drm_atomic_state *state)
> >  {
> >  	...
> > -	struct drm_plane_state *new_state =3D plane->state;
> > +	struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_state(=
state, plane);
> > 	...
> >  }
> >=20
> > @ include depends on adds_new_state @
> > @@
> >=20
> >  #include <drm/drm_atomic.h>
> >=20
> > @ no_include depends on !include && adds_new_state @
> > @@
> >=20
> > + #include <drm/drm_atomic.h>
> >   #include <drm/...>
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
>=20
> [snip]
>=20
> >  drivers/gpu/drm/omapdrm/omap_plane.c            | 6 ++++--
> >  drivers/gpu/drm/rcar-du/rcar_du_plane.c         | 3 ++-
> >  drivers/gpu/drm/rcar-du/rcar_du_vsp.c           | 3 ++-
> >  drivers/gpu/drm/xlnx/zynqmp_disp.c              | 3 ++-
>=20
> [snip]
>=20
> > diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/oma=
pdrm/omap_plane.c
> > index cd8cf7c786b5..021a94de84a1 100644
> > --- a/drivers/gpu/drm/omapdrm/omap_plane.c
> > +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
> > @@ -44,7 +44,8 @@ static void omap_plane_atomic_update(struct drm_plane=
 *plane,
> >  {
> >  	struct omap_drm_private *priv =3D plane->dev->dev_private;
> >  	struct omap_plane *omap_plane =3D to_omap_plane(plane);
> > -	struct drm_plane_state *new_state =3D plane->state;
>=20
> This seems to imply that you're interested in the new state.

Well, to be fair, the variable is only called "state" before this series
and it's one of the previous patch that renames it to new_state and
makes it a more obvious.

Otherwise, state =3D plane->state is fairly confusing and error-prone.
With that change you would make it really obvious

> > +	struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_state(=
state,
> > +									   plane);
>=20
> Does this really make things more obvious ?

I guess you're better at remembering this than I am then :)

The discussion on whether it's more obvious or not aside, accessing the
->state pointer directly has some culprits, see:

https://dri.freedesktop.org/docs/drm/gpu/todo.html#plumb-drm-atomic-state-a=
ll-over

Maxime

--j7svqftvzagigb3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYAg1IgAKCRDj7w1vZxhR
xW+rAQCaKXuyQvbRubp33hPCkdAY/LXaD+3TQwLv2j7AhTFUtAD/aLv/q1HqwcEO
ZfMJ4deD5+JElSu70qt5AOEI/9JMPAg=
=q+gU
-----END PGP SIGNATURE-----

--j7svqftvzagigb3f--


--===============3852755250493856615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3852755250493856615==--

