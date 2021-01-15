Return-Path: <SRS0=P2Ib=GS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A20C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 14:14:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD5D222248
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 14:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD5D222248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ly2QXz262zsRxIilOOczFEBEZPZKwNt5EoQHJ9mqQwE=; b=JQzy6iXZRRiBqVwXWHNsycxw2
	gz56dxeCB+sS3ZsouU5zKMT/43EOYbTuzBUFsLau/zftoEmL00NKMIIDhQqtpo5kRmv3+UEHf3MBn
	wrFfyhVDU7FgB9r10iwE98bHSpg8ZxyOqiT60eu9UcLunUkJ7re1tqkBOWGyZ9HQ+IWxOUPU280XO
	EdMC5cxaQz/XxNGtdRBTOr/lhWWhv3jE/+haq9d1QJJxAHZQD5UMxk+OXGon1gJHz7cHJK1+KBa2i
	Zl+JSM8o2P5G3QxmXnOzmK6eJvBpsQsn+iCfwEC6K8vbmm2PkV08PhY+Ge/L2SG7nx5EQepd4qc1H
	9K+KdulJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Pra-0005TF-DB; Fri, 15 Jan 2021 14:14:06 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0PrT-0005Oq-0e; Fri, 15 Jan 2021 14:14:01 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id CDECC580732;
 Fri, 15 Jan 2021 09:13:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 15 Jan 2021 09:13:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=tj2SxXoSa96FfDtLrh9IpSrjSWA
 c9uYGz+Dn9iyVoAo=; b=B7b719RQYKeJsatdvoMfftPaZ7yza1XeB2tdCt+EfXJ
 lyEobF8ynRrdN7pxtUoPCNN3dfilyUknC7aTjyaF4oJihyfecKY12lq6IgiU5Cz1
 Vra/Uwe7W13TjbG6KqN24oHHPrC1/88iYYfOg2wCPjrXLB0GDaNS3PDyATP1pXej
 5HHLRWc0r29gZRdE1uLJv6pc5aMOPi8ZjLC6JAnQxX87d99PTR+kZ/k9Z6nQNm9V
 x0WGFJchuLQni4XDfFsGtGRZ9mYyCjTdEq5nOBG8T+RIbswMnhUDy8bhLPUdPJvI
 Ni7wAgdzO3zMr5uZO/F7sboexu5D3QU0T8Ed3vI5MfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=tj2SxX
 oSa96FfDtLrh9IpSrjSWAc9uYGz+Dn9iyVoAo=; b=kkT3T4zeweqWXIX/CZ1B6z
 DqGsjahZcO/cZPAU9BLCMla6ymzdiSZ7ZJ35RgoZIA7tkknGLbm7K6HkmmyEtuM9
 m7U9NkEy3eA3CEOyqx8bRrsvRBhizLBqsv+hShK8YQ8uMeerxHTPnHWmrZT6W0es
 FCpGNCGdJWhmmOt1yxhfqpCXhhbQS7V+qp+UB1aKlqBuwhXYiNCI8VJ5DguNziG3
 sV4dimLDsXpkSnoUlQhIt7Z0//+muuUO0gvpOjviJZQXUhsCiK2Npriy+Aj61tE8
 4BgkQVmB0W+Y7dCtAftP+KRmtIM2szcqlPcQnNOYCpPvzfL+Flf5dJQZ2A0g6cMw
 ==
X-ME-Sender: <xms:H6MBYD0GSlkzCPJVYGpbR_ZNI06sWvUNPMDdZ6_eJm43rVMA2MrEXQ>
 <xme:H6MBYCGSUXTu3NWdcNYsemiQeKDPcqwh30OHx6Fp4t9vJ_J6k4zoRtURvSopDsY2K
 kZ4YOo4yGkimvhGq54>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddvgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IKMBYD420Ru-_AznpbGVzQ0jU5qBuPPsrrNPdOFYs-JrU-4D9wCSAQ>
 <xmx:IKMBYI0429guPeHHyjc0jgU-OS7U10edc0et5onZ_6Las_n_TZYJYQ>
 <xmx:IKMBYGGGZe6Wkc688GCwHAOskyhRtgv4uvUdI5qJ4DXevueC4Uhobw>
 <xmx:I6MBYFbypYhb5YdRA0eaNNYJaUXLGsvZhXSUB8usLISCNOSUVzP1ug>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 869AA1080059;
 Fri, 15 Jan 2021 09:13:51 -0500 (EST)
Date: Fri, 15 Jan 2021 15:13:49 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 02/10] drm: Rename plane atomic_check state names
Message-ID: <20210115141349.7oq5hwsj37qcpk5j@gilmour>
References: <20210115125703.1315064-1-maxime@cerno.tech>
 <20210115125703.1315064-2-maxime@cerno.tech>
 <221e5626-d97c-9d4e-07cc-e696c92ceb65@suse.de>
MIME-Version: 1.0
In-Reply-To: <221e5626-d97c-9d4e-07cc-e696c92ceb65@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_091359_405493_C498E22F 
X-CRM114-Status: GOOD (  15.84  )
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
 Gerd Hoffmann <kraxel@redhat.com>,
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
 Jernej Skrabec <jernej.skrabec@siol.net>, Rob Clark <robdclark@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jyri Sarha <jyri.sarha@iki.fi>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: multipart/mixed; boundary="===============7945096708455462525=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7945096708455462525==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pc7g53zcvckyysz5"
Content-Disposition: inline


--pc7g53zcvckyysz5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jan 15, 2021 at 02:46:36PM +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 15.01.21 um 13:56 schrieb Maxime Ripard:
> > diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ip=
uv3-plane.c
> > index 8a4235d9d9f1..2cb09e9d9306 100644
> > --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> > +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> > @@ -344,12 +344,12 @@ static const struct drm_plane_funcs ipu_plane_fun=
cs =3D {
> >   };
> >   static int ipu_plane_atomic_check(struct drm_plane *plane,
> > -				  struct drm_plane_state *state)
> > +				  struct drm_plane_state *new_state)
>=20
> It's not 'new_plane_state' ?

That function is using old_state for plane->state:

> >   {
> >   	struct drm_plane_state *old_state =3D plane->state;

Here ^

So it felt more natural to keep the convention in use in that driver

Maxime

--pc7g53zcvckyysz5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYAGjHQAKCRDj7w1vZxhR
xRyQAP9z6jgYoVLN5O08Gfa2bipU5kwBoAnOqoWm5tZt0atb8QEA9iY4poTgz6cv
u2lw2ErmnQLG6Rt10lvZcTmjIdOF5QI=
=AOj1
-----END PGP SIGNATURE-----

--pc7g53zcvckyysz5--


--===============7945096708455462525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7945096708455462525==--

