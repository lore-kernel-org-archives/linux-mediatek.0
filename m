Return-Path: <SRS0=fv9r=HV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DAFDC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Feb 2021 15:13:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACA8F64E86
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Feb 2021 15:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACA8F64E86
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sZbuXQTbLpKA4It3V1rG9Q2z6F4U0ALIxWT6rLA+TgI=; b=gJkbCEz4u/RVnGQzj1xFJxBfW
	pOszpTHSfS3K3ZtuzVuQZJWG7t6t0Nep2W1zxEgUs3Zb852C/zOI8FpS9Stv/jwfNYrKMAs0UujTN
	naQlBx+640WEr2NC1ESCBnaZbn15am1FZj0NRgLfUu3lhNktLUUpL8RNauKMxJ8Ww/e1E/pbRef1/
	r18frM2xwsBnZ4eJDpQT8CFXek7jGMMFWx3XmR6WYlrfAXiM5Xqp8sUPV+hdiOqBy5+FmqjuqyUFD
	KUphG3kVkHvbAjuYvxvkY3Vqmnkh2lt94LvGrmcoPg8dJd8224Ou0PvOhzc+UpksVRPFlYRp6Caqw
	dqDcb8kUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lD7SX-0004KZ-Bx; Fri, 19 Feb 2021 15:12:45 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lD7SU-0004Jo-CF; Fri, 19 Feb 2021 15:12:43 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 93E225801D8;
 Fri, 19 Feb 2021 10:12:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 19 Feb 2021 10:12:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Emd+iGXCpjhCIuGJ6kINzMtdOjP
 Vb1dtj8cLvd3w9uQ=; b=NGfSf1xCTv59Q/62lzFrQUe3OfzHicY7PdlXFseZ+fo
 CXaps5k96MCo/y6dXa/ePCUiVr/+yd+bY0z6zZBYrTTK2YzzxM1J8iqD3y6W62cZ
 rXBdZ7f2+aX04uHfX4St/hRD2mvVDoQ+/wu5mb+Q5x907WZ9caEJ8KHfdT1nr2yD
 JLP64gaaabo7m5fSkBVWV9SDIr/uh0mJgEZZlhBIJuPlE67fksWmT4qsGXSXnPqG
 CKVo2kTnbLrkMB9P1EmlLJdgH0orL2bJxv6jphPeJpe+zESq+2OJKnDQBxs0UL06
 x/1RFeKzSAsBixLgniCd+pZnvp+IstVDQldHmokucVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Emd+iG
 XCpjhCIuGJ6kINzMtdOjPVb1dtj8cLvd3w9uQ=; b=YkCuJYja0uX4TkD2rzV21h
 g8ng0jTMGlNLgjp3ibUk89EXpzsGrxEJjWRxIIHh3CLNVbOWazk2yrYzBXJ23kBR
 4wFbAgUarW3c96/qt+aEbZfVXEvUxH9PdikMlzxmtt9xyHWiVQpqsVbo6jcEa6iJ
 S5ASjZRNk11V2LP36XYPaue+cGDQy5dTRhUanBnB/KPmSuAVAvVr8FxbpG1DM4QP
 EabMeDUOtfQ6sWdaKB/kFRqXUJOra2iCGagkBurhMfRmM3t0wgIxbfA3h4kbSzIy
 MuzVRTwFasgPMG+HDe+aFmQxFNJJYD06GCyMfq7EAN1LPbPmuQhzaHFugwqkspHQ
 ==
X-ME-Sender: <xms:ZtUvYPGywbwb_W_X_rHD8PzuY-T32APXk_hW92aAe8msQObxCrKUFQ>
 <xme:ZtUvYMXSX6H4Zazn71SMqbZfKo75Xu2WSlL0lAD23b9Owys2Pdmw7rhPL-VpNd91z
 4S9PFdrk7Wctr0bo40>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdejfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZtUvYBIUJuioxxraj3nflffP1AzbRkhnaIOVnlX3XwS9zmyHZ2byOg>
 <xmx:ZtUvYNEjum8w0L68Xo84cpFdfo-7BdSTnTSZf3vOsIFddzRi7AVUcg>
 <xmx:ZtUvYFXKXk3ywwLCh1ihNeDgTUlKEVDBbKVFdkJQ50WK-22UnG9MHg>
 <xmx:adUvYGbtXseOPET8eQPCaGa5NONIe4S195vIixBTbFd4se4gga4qQA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C72DF1080057;
 Fri, 19 Feb 2021 10:12:37 -0500 (EST)
Date: Fri, 19 Feb 2021 16:12:35 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 02/11] drm: Rename plane atomic_check state names
Message-ID: <20210219151235.dsv4mujqyrzndhsn@gilmour>
References: <20210219120032.260676-1-maxime@cerno.tech>
 <20210219120032.260676-2-maxime@cerno.tech>
 <51bb5aaf-f771-020b-9a48-77d8679de6a2@suse.de>
MIME-Version: 1.0
In-Reply-To: <51bb5aaf-f771-020b-9a48-77d8679de6a2@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210219_101242_569626_03A959F1 
X-CRM114-Status: GOOD (  16.75  )
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
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Xinliang Liu <xinliang.liu@linaro.org>, dri-devel@lists.freedesktop.org,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, NXP Linux Team <linux-imx@nxp.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Leo Li <sunpeng.li@amd.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Roland Scheidegger <sroland@vmware.com>, Inki Dae <inki.dae@samsung.com>,
 Sean Paul <sean@poorly.run>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Zack Rusin <zackr@vmware.com>, Gerd Hoffmann <kraxel@redhat.com>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Edmund Dea <edmund.j.dea@intel.com>, virtualization@lists.linux-foundation.org,
 Eric Anholt <eric@anholt.net>, Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>, Yannick Fertre <yannick.fertre@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Brian Starkey <brian.starkey@arm.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stefan Agner <stefan@agner.ch>,
 Melissa Wen <melissa.srw@gmail.com>, linux-tegra@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Fabio Estevam <festevam@gmail.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, amd-gfx@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Harry Wentland <harry.wentland@amd.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chen Feng <puck.chen@hisilicon.com>,
 Alison Wang <alison.wang@nxp.com>, spice-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomba@kernel.org>, Philippe Cornu <philippe.cornu@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Paul Cercueil <paul@crapouillou.net>,
 linux-renesas-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Russell King <linux@armlinux.org.uk>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, linux-mips@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jyri Sarha <jyri.sarha@iki.fi>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: multipart/mixed; boundary="===============6120536266507174174=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6120536266507174174==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x6inkztb7pnxs2gu"
Content-Disposition: inline


--x6inkztb7pnxs2gu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thanks for your review!

On Fri, Feb 19, 2021 at 03:49:22PM +0100, Thomas Zimmermann wrote:
> > diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ip=
uv3-plane.c
> > index 075508051b5f..1873a155bb26 100644
> > --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> > +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> > @@ -337,12 +337,12 @@ static const struct drm_plane_funcs ipu_plane_fun=
cs =3D {
> >   };
> >   static int ipu_plane_atomic_check(struct drm_plane *plane,
> > -				  struct drm_plane_state *state)
> > +				  struct drm_plane_state *new_state)
>=20
> This function uses a different naming convention then the others?
>=20
> >   {
> >   	struct drm_plane_state *old_state =3D plane->state;

So, the function already had a variable named old_state, so I was
actually trying to make the drivers consistent here: having one variable
with old_state and new_plane_state felt weird.

The heuristic is thus to use the convention of the driver if one exists
already, and if there's none pick new_plane_state.

It makes it indeed inconsistent across drivers, but it felt more natural
to be consistent within a single driver.

Maxime

--x6inkztb7pnxs2gu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYC/VYwAKCRDj7w1vZxhR
xXb7AP9dLYZ0ol4FnTyS9ndvGPPXpijdNPtrfZDs40BKL//eEgEA8HMiYKjgufNK
Zn4QIsaErGpt9UM9/IC6ZwJ7lvoIrQ0=
=ygPX
-----END PGP SIGNATURE-----

--x6inkztb7pnxs2gu--


--===============6120536266507174174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6120536266507174174==--

