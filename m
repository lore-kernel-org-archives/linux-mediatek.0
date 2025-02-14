Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B92C02198
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2025 09:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21tqIdPM7MMDZGQ0+y3MH3C18hS595+a3Ckf07v6s8I=; b=sL14ehq8WksdRI5sC1exb0KnZ8
	OGI1O23ioJXZSQNUdW4fDe5T6jf9Q0NwytQz2c//zkybxtUgm5TdTXNkJ1rZI/vZ3LAvAiqii+82l
	rePK8bVKKGiHETUMdE1ZsH1myAzA+ojJU2PVBwR05ATKM0L8YWqAfkVfPWCs9UwjkWegrxg6E4b+0
	0EKNbZ3adojb4XN1iemNdj1KJSL3dZwyTiCBpfMdrHFgYBy3IPTH5qvQZ5Xiz4toBN45QeNjm3++N
	+1fIXRQVi/oSKEJhIhBeOytwTEg33niV7uu2sdI+5k0z1fJojP2gy/XlhiAGhHAS8HC2RvbNrlpCd
	93MVQ3rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tisIu-0000000ENsg-3z2f;
	Fri, 14 Feb 2025 09:48:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tisF4-0000000EN8w-3lDZ;
	Fri, 14 Feb 2025 09:44:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=21tqIdPM7MMDZGQ0+y3MH3C18hS595+a3Ckf07v6s8I=; b=JrcY/XRilv/uUzypMM6YdfMSYF
	gKmESuduTIXmtw4Ir1//AHOhUFAnRxxofjyhrwKKTthJhqx6M5Uj6plOEyvh5EJErkpn0wbQZX958
	xAdrd5lqiHaDJud+POwxQi3hXt9xI8OulV9NQRtP3wNUh17tgq2vGH9knJepBPANO6Q6gOQ6qRbiO
	DdC9mhoePJW9c7m/VjaJda/qR+kYyI8jS9+BO9iASrgslN0e+URoAMAYnL9aN5VvZs61WZ1jA0kNX
	btnwckiICgHGKH+mJyjnISJvbWuhfPGsA4XYWSwuA8bpVjYO+XNGyw0yq7AAiyvE60QgJB/5YQ9TG
	ccKQOuUw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tisF1-00000001DYb-3Q8K;
	Fri, 14 Feb 2025 09:44:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 334F5A42555;
	Fri, 14 Feb 2025 09:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C057C4CED1;
	Fri, 14 Feb 2025 09:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739526247;
	bh=euxH5xTB3npndNEOhGf9KR+p/1GlHm5dq8S6R5vtFvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QKgThIZQsDXvHi250nXVACftNulY+hDA56lG4gV0mWDqpQmEI/IeByxEkZ30VumCF
	 L+r2W1g/8OTElc/khx4mIaSFrKtauo7k7wzOS5jT9SBbtUlYjgOkI86coP9+s3NYwT
	 y3Pkf0q3FPGmXw9gDN2jBCwdfFjlwHIM6NMKxRNfAHvOj6MfdWa4J64sZrCZ+2mWp8
	 rvLAPOGA4lz6JczHmcz0aTOHczOZk73pBCHAN90DCEiXiuHnMIe8lrWw5JBzcFdPvS
	 NBKHdwztH01NncybK/yA9xE55/oALEeW+VtQObpTVt07tlkncpFvbP/wa1DsJj+6au
	 giWDWVolgoUpA==
Date: Fri, 14 Feb 2025 10:44:04 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Joel Stanley <joel@jms.id.au>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Alexey Brodkin <abrodkin@synopsys.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jonathan Corbet <corbet@lwn.net>, linux-aspeed@lists.ozlabs.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 11/12] drm/vc4: move to devm_platform_ioremap_resource()
 usage
Message-ID: <20250214-quixotic-fossa-of-art-b8bb9f@houat>
References: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
 <20250205-mem-cocci-newapi-v1-11-aebf2b0e2300@redhat.com>
 <20250206-hallowed-ultra-tiger-cfec8e@houat>
 <CAN9Xe3SpTG7r2UkN7_pH0uMXhU5u+dkWhaM9+w5VyOQZp9byNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="tmymxs4x7znmvcxa"
Content-Disposition: inline
In-Reply-To: <CAN9Xe3SpTG7r2UkN7_pH0uMXhU5u+dkWhaM9+w5VyOQZp9byNg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_094412_150736_7649A034 
X-CRM114-Status: GOOD (  26.63  )
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


--tmymxs4x7znmvcxa
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 11/12] drm/vc4: move to devm_platform_ioremap_resource()
 usage
MIME-Version: 1.0

On Tue, Feb 11, 2025 at 12:08:57PM -0500, Anusha Srivatsa wrote:
> On Thu, Feb 6, 2025 at 11:13=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
>=20
> > On Wed, Feb 05, 2025 at 03:08:07PM -0500, Anusha Srivatsa wrote:
> > > Replace platform_get_resource_byname + devm_ioremap_resource
> > > with just devm_platform_ioremap_resource()
> > >
> > > Used Coccinelle to do this change. SmPl patch:
> > > //rule s/(devm_)platform_get_resource_byname +
> > > //(devm_)ioremap/devm_platform_ioremap_resource.
> > > @rule_3@
> > > identifier res;
> > > expression ioremap;
> > > identifier pdev;
> > > constant mem;
> > > expression name;
> > > @@
> > > -struct resource *res;
> > > <+...
> > > -res =3D platform_get_resource_byname(pdev,mem,name);
> > > <...
> > > -if (!res) {
> > > -...
> > > -}
> > > ...>
> > > -ioremap =3D devm_ioremap(...);
> > > +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);
> > > ...+>
> > >
> > > v2: Change the SmPl patch to work on multiple occurences of
> > > the pattern. This also fixes the compilation error.
> > >
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Cc: Ma=C3=ADra Canal <mcanal@igalia.com>
> > > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 55
> > +++++++++++-------------------------------
> > >  1 file changed, 14 insertions(+), 41 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > index
> > 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..066f1246dab420ee889845b0c573d=
80ce7c88595
> > 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > @@ -2951,71 +2951,44 @@ static int vc5_hdmi_init_resources(struct
> > drm_device *drm,
> > >  {
> > >       struct platform_device *pdev =3D vc4_hdmi->pdev;
> > >       struct device *dev =3D &pdev->dev;
> > > -     struct resource *res;
> > >       int ret;
> > >
> > > -     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hdm=
i");
> > > -     if (!res)
> > > -             return -ENODEV;
> > > -
> > > -     vc4_hdmi->hdmicore_regs =3D devm_ioremap(dev, res->start,
> > > -                                            resource_size(res));
> > > +     vc4_hdmi->hdmicore_regs =3D
> > devm_platform_ioremap_resource_byname(pdev,
> > > +
> >  "hdmi");
> > >       if (!vc4_hdmi->hdmicore_regs)
> > >               return -ENOMEM;
> > >
> > > -     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hd"=
);
> > > -     if (!res)
> > > -             return -ENODEV;
> > > -
> > > -     vc4_hdmi->hd_regs =3D devm_ioremap(dev, res->start,
> > resource_size(res));
> > > +     vc4_hdmi->hd_regs =3D devm_platform_ioremap_resource_byname(pde=
v,
> > "hd");
> > >       if (!vc4_hdmi->hd_regs)
> > >               return -ENOMEM;
> >
> > I *think* that one is shared between both HDMI controllers on the
> > RaspberryPi4, so we can't claim them from both instances. We should add
> > a comment there to document that it's on purpose.
>
> How about vc4_hdmi->hdmicore_regs? It also has another instance
> vc4_hdmi_init_resources(). Looks like that also doesnt need any converting
> and shold be left as is.

No, each controller will have its own set of registers there, so it can
be converted.

Maxime

--tmymxs4x7znmvcxa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ68QXwAKCRAnX84Zoj2+
dnJFAX44qxSqH4/9r1lPWe6YsBKR9clH1sZQRZaWBdRICp0iE+/MJiNA/tJghQgy
Xb2262kBgMGvJFpuBmHvz9HJegWf00i39I2+ctkME/qrOcHQhoIwF07ezVrQyZOZ
z9Q+kadHOg==
=d/Gf
-----END PGP SIGNATURE-----

--tmymxs4x7znmvcxa--

