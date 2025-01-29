Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797D8C02192
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2025 16:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kncPR1x+HrgO/UNoa6XCUy62lvyXubVaayCMa0/G3/c=; b=qzugnbyT+tl9QVsqmnfODK+5bm
	Irk2svs16GniqdLPyQu8jWDpRIXJgdGwwdJqCK86Vjdkurdts1Ka7+PAf6O72vLhKPxE8nyQyJGH8
	B49L1NzyJjABGXTdeStoYYIYyuh5N9yQJNEHQVNvHr7WgQG8Meu9swiCQJ+UHQw9JoDeApo4ASeb1
	D1UgpGnVVmDZ92/W4LHOW7l6vMhj5XSypLaa5tRtaGBpikjMiE41rsBowt3wbE4jQxghdP4fweGN6
	MXRQ5aR4VkPyeIybpZn7Q9Tu6MkDpJFtjb8jbxrasZ5IjSP4+vvwciryZ6W0UhxXHq50PRwkxVN9Q
	gZiaVJ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdAxC-00000007OD3-1OPz;
	Wed, 29 Jan 2025 16:30:14 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdAx9-00000007OCQ-2nVl;
	Wed, 29 Jan 2025 16:30:12 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-385e0e224cbso4123909f8f.2;
        Wed, 29 Jan 2025 08:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738168210; x=1738773010; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kncPR1x+HrgO/UNoa6XCUy62lvyXubVaayCMa0/G3/c=;
        b=DIt1sDGPvLShPSIjS6yLuR/TDeNnredMjXNyBF0MGLhpvEFhYCXtvX3nOOXxz4mG2n
         XYGu/8LYUlf8dm2wBNs17I4qBT7OLdJxu1l+fOXUkDJ9suoLuT++4UdbOBrlKfnBarDS
         Ex1CHO+Df2lBqxmb+q9XBvR8uz5JZmycJXzwG0H3b0yKEAXlkU+tR/cP9uzOnqBVhPuW
         YH9P0Wt7yBt9TChODfzkO9gbZZimN+euOKkiPqHQKjYc9aunkki2mLSytQaIyZQt4eTc
         WlCaTH0vpZ9YVwZFlk7vE7Kcj2/D/TldXknGZBBR+PrDPCsyhdTtK602TaZbMlCQDueC
         T2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738168210; x=1738773010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kncPR1x+HrgO/UNoa6XCUy62lvyXubVaayCMa0/G3/c=;
        b=aWei8Pus5AL4sOvxiHm7MWEc0Bh3QlRpjYS4K4/f/7EzmPZCZTdNwaKdEaGqsPDxWL
         5Ai0O9yaSNVgvt7cAOK4qSB0mz3Rs+jFtl/M5T+fH28h+/AAxSoGvxesorlr1FtwX0jz
         d488ko/wXhRZPr9qyZT2lD6ihlUpOd6CiwYtgqd8rbnRqNP26XTt+Yar5ZfVGgaku8cg
         n00r3lAzwwGwKVYvEt1lZnw5HsNv9gpR04dnaJRHaL6uwxaeV0d1p/MVzylcPWg+0XfY
         W3lFUaOOI6XNKDXM7EmHmRq0YjDUvpZhkqacSrpr48foH805VA8QlF98Mt1guYtUKwSq
         oc7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJzUTKms97vkDKA0JB67Tk8bPkA8rBmDeo+psqx9RDqhJkHqq6ZIrB03JiBjJDWJCpbPOLcyFA9HfZvG+t3O4=@lists.infradead.org, AJvYcCVn1TOamLwEU3YZtOxC+gF9yihxf2pG5R1Nd4TmvDAmrXN6HJmN41vUpWrbD4wtuYnIyC04lDuHu51YG5Fdm6V3qQ==@lists.infradead.org, AJvYcCWDSKeLcCqW+n+bcWjDOptgQjB/onYCJte5cvW+Kurh0a+ECpxVCHgNDB26dXUjqYmKkbilgltD04lrgBic@lists.infradead.org, AJvYcCWQmwpEuUM/qOqCYdpn/CEMQcQvYHqLbJUKvow9Qtyw3YODu9ZasHHex3JUh15LAIJ0mDhnffjb68UiwPbWohU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyciCa5X2Bvb+V04pN8oBHi1HLPfxTyFELMzl6JDD4IpnQl3RnM
	tl2sobwUQxvBzZAMBjForqo+c1m3nkJEDsocYe3oqcuV5TsRTUr+
X-Gm-Gg: ASbGncuKM1v+DBsGaBkayTdMDJSohI06wIs+RD1uRJn2NGpuG4w49zQpzzH0/CqvofP
	Z2IderY+AaXRzp9X6/5w6Ul03ev+Nfmh1gTRAv6fLFfJuAEOtLA+VCZhh7xoTTZry5v1GjH58nI
	sI8ougax/vD6OSsekcyJaEpT7KO16OzQ3uzNcPBwkuolGWkOvHXXFT0L3kiwYOn4gwKpRQIAHhm
	HC/zbN31eIU7QWuNKoPJNf+ouZgTRwV9gMLXbjvp3xvFaRPRjS5EhgiQAgQ8BCKEmoUneE80gaF
	TsuQClq3QqWwWyfxh025Ya9kpI7gzJPrUzePBRHLCMRMx020NIwWgRWq8E98/ENQbhTLDmjbMd7
	Duw==
X-Google-Smtp-Source: AGHT+IFm5Jm3zy7mcGZVwWe1YgDmOIk+BMdUjzsviFL4g+X0VoNE5WMhP+abocamyyaYUsUSJGXvKA==
X-Received: by 2002:a05:6000:2ce:b0:38a:8e2e:9fcc with SMTP id ffacd0b85a97d-38c520b7692mr3030462f8f.45.1738168209834;
        Wed, 29 Jan 2025 08:30:09 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bb0besm17773109f8f.79.2025.01.29.08.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 08:30:08 -0800 (PST)
Date: Wed, 29 Jan 2025 17:30:05 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
	Anusha Srivatsa <asrivats@redhat.com>, Joel Stanley <joel@jms.id.au>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
	Xinwei Kong <kong.kongxinwei@hisilicon.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Alexey Brodkin <abrodkin@synopsys.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 14/14] Documentation: Update the todo
Message-ID: <54mqpk7elbn3y4o4w5skiwbx6kpkpbsg45l7tfzuphf6rzziej@laywqtj7tfpw>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-14-0d1609a29587@redhat.com>
 <a389f799-442e-45f3-8609-2eb2f0b7a825@suse.de>
 <li2awsqmdoye3u7n3gi2mrhbfxs77e3edjmsg5zclnyjinsnul@2bjkc5agyu5u>
 <2y3lwycrggmktamu3j3gj65uco7quvtu7tlc3724e4mpokhjz2@icedc3kervme>
 <4jn3dfea3eb5yuqobjwvbzfxhwatpvvhtpxbmt6npyrypkyruw@mgtmxignyvt5>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vlfdakvgoj7a5bm2"
Content-Disposition: inline
In-Reply-To: <4jn3dfea3eb5yuqobjwvbzfxhwatpvvhtpxbmt6npyrypkyruw@mgtmxignyvt5>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_083011_713881_3F8895F8 
X-CRM114-Status: GOOD (  30.11  )
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


--vlfdakvgoj7a5bm2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 14/14] Documentation: Update the todo
MIME-Version: 1.0

On Wed, Jan 29, 2025 at 04:28:49PM +0100, Maxime Ripard wrote:
> On Wed, Jan 29, 2025 at 03:41:32PM +0100, Thierry Reding wrote:
> > On Wed, Jan 29, 2025 at 03:31:50PM +0100, Maxime Ripard wrote:
> > > Hi Thomas,
> > >=20
> > > On Wed, Jan 29, 2025 at 02:06:15PM +0100, Thomas Zimmermann wrote:
> > > > Am 28.01.25 um 23:29 schrieb Anusha Srivatsa:
> > > > > Remove the TODO now that this series addresses
> > > > > the changes needed.
> > > >=20
> > > > While your series is fine, this TODO item is unrelated. It's about =
various
> > > > ancient fbdev drivers that do not reserve their memory regions corr=
ectly. So
> > > > please drop patch 14 form the series.
> > >=20
> > > Is it? Could we rephrase the entry then? I'm the one that suggested
> > > Anusha to work on this, and it's still not clear to me what it means
> > > exactly if it's not what she worked on :)
> >=20
> > The text in the TODO sounds pretty clear to me.
>=20
> The title is "Request memory regions in all drivers", and the first
> sentence is "Go through all drivers and add code to request the memory
> regions that the driver uses". It's definitely ambiguous if only fbdev
> drivers should be considered, even more so in the DRM documentation.
>=20
> > It says that not all drivers request the memory that they are going to
> > use, and suggests to add those missing calls.
>=20
> Right.
>=20
> > But all of the drivers in this series already do that
>=20
> Nope.
>=20
> > and the only change here is to convert them to use some of the newer
> > helpers.
>=20
> For some, yes. For others, it actually adds request_mem_region.

Ah... indeed. Well, on the face of it this looks like just another mass-
conversion to the devm_platform_ioremap_resource() helper, so that's
also confusing.

Maybe the right way to do this would be to split this into two series,
one that actually does what the TODO suggests (and maybe updates the
TODO to make it more obvious that after this only fbdev drivers are
left) and another series that does the helper conversion.

Thierry

--vlfdakvgoj7a5bm2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmeaV4kACgkQ3SOs138+
s6Fc5g//QZiZGAOOwS/HvsPWCl3EAnXTtEOaH4XXTZswARVZDGZdl3jYwiZim7x3
Odn69X6NAQl5pFytjbexpzii+zH/UQZVz5kndydjXtK/JWz5VeXlKUrxYKMU+GEM
+9dEecjXOqKAtLPF/QyA387/Xp6qIIsQDHM5/akoAifYOd3TbuCl4AqBU/LYuGt6
F86Eaa7n8kChb6BpZ3Km6NfzkhJhTIw9/VZXxp21Y9izQUZuHAVvyt3e2hLr9L9W
S0XFv1mPAYUcBAao+vvEF3kJvrnVXjXDZnjVPpiKuJe4e0l2aDMNW9TEr7are4m5
8JlrAMkbGTKEKzTQlHIgKuFJYcmTyvqs4KBrxmX1bEqm2gsRqnNXl/7yvbY+s/s5
QSM9otV5y60e0IZkmuJjoEklKJ8SmyPgbrnb04ua2KQXrRvnDO+BQSWerziVyz84
6RNfGTuacRhr5C2KlI7MdELGzweRPD6TA8Qa3k71gpCXKg9063+1aRanPLWbpwue
vIBmrFZZcJRMxftEjPMRJj7IcBvIZY12Zij2eu7fWDaeXujcre4Apg3rClGnYxOq
RT0DHxbnFi9msAWdCAFZTUiyzyFZ0Vq/op7JUugsAq/nYKK9lXSyOdVvLd1Ojgm5
CBtQAEdJXMKCwmB5yb7bRv2ag/y/oiQtUsnkgViwm1FTPUFD+gY=
=XiY9
-----END PGP SIGNATURE-----

--vlfdakvgoj7a5bm2--

