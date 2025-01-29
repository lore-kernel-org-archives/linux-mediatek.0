Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40D4C02193
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2025 15:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bok9TVvjjQCymMYvMKlNAI5VH8lxZtesRpd8zGC0hcI=; b=soK5ihxKoif+ABBRPFR8zbo6H5
	hg6P98l47yObQN+tuwfiBHwb/6ZTCzINB/tb61UWDc3jUO8yLeRM6sZZ+jGtJ+4D3KjVNW2mB/XT6
	94fDG5ffP2iHwZTFsFoDYJKVNOE2DHU3sNPdK2uHRhWnTDzwIka3BL4dBYx2ItTyhOlzy1wJ7Tad9
	pTlDMhPTabjFPs6HjnCvpA9N7jONnmOo0cconBO+sVS94jNfcQeK690tLsyqclgA7DaPnk5lBmUeS
	oNbBZKipavpLRbgppwqQk2nXLdaAdogHCPKnUlK6o17w884uF1SknbSghfN2PKhw8zpLYaQLtWsHu
	ykEtIOvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdA0y-00000007FYQ-4AWk;
	Wed, 29 Jan 2025 15:30:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td9zq-00000007FGc-2XY4;
	Wed, 29 Jan 2025 15:28:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 70E7EA4148F;
	Wed, 29 Jan 2025 15:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DB6C4CED1;
	Wed, 29 Jan 2025 15:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738164532;
	bh=bok9TVvjjQCymMYvMKlNAI5VH8lxZtesRpd8zGC0hcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NOyxzPTqxCIMDXiltBFL33XgRz5+HmhF0fqEkvxsOMQ+6Wzc56dBN6SyjzMqltBb3
	 6NHtoBcd65EsJ8oCbYGGJvz7/v567MFrM9a76OkdnsX647Ow/whbk9IojguGxowzk/
	 vbgmUGA5QVu9G7m22EiF1kv31X4aNiRWdytIs030qtfGVFcGpnPSqX2oZnwdYQILpm
	 Pjpn1K1oNLt3gHaVCozxK5+ncmcRqK8/EMM9cl/FWKOpIv1Co7UcwDOnuN5Jv9Df4M
	 APJZcGw1WrNChwRUMgJfEVxBXmfA2Yi8igsZSjP24OyJBaMR3b9+I6o4BEWoNaXNbL
	 K/PKTztalZRiQ==
Date: Wed, 29 Jan 2025 16:28:49 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
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
Message-ID: <4jn3dfea3eb5yuqobjwvbzfxhwatpvvhtpxbmt6npyrypkyruw@mgtmxignyvt5>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-14-0d1609a29587@redhat.com>
 <a389f799-442e-45f3-8609-2eb2f0b7a825@suse.de>
 <li2awsqmdoye3u7n3gi2mrhbfxs77e3edjmsg5zclnyjinsnul@2bjkc5agyu5u>
 <2y3lwycrggmktamu3j3gj65uco7quvtu7tlc3724e4mpokhjz2@icedc3kervme>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ntiwixuo22akqcub"
Content-Disposition: inline
In-Reply-To: <2y3lwycrggmktamu3j3gj65uco7quvtu7tlc3724e4mpokhjz2@icedc3kervme>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_072854_786188_43E2F3F3 
X-CRM114-Status: GOOD (  22.98  )
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


--ntiwixuo22akqcub
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 14/14] Documentation: Update the todo
MIME-Version: 1.0

On Wed, Jan 29, 2025 at 03:41:32PM +0100, Thierry Reding wrote:
> On Wed, Jan 29, 2025 at 03:31:50PM +0100, Maxime Ripard wrote:
> > Hi Thomas,
> >=20
> > On Wed, Jan 29, 2025 at 02:06:15PM +0100, Thomas Zimmermann wrote:
> > > Am 28.01.25 um 23:29 schrieb Anusha Srivatsa:
> > > > Remove the TODO now that this series addresses
> > > > the changes needed.
> > >=20
> > > While your series is fine, this TODO item is unrelated. It's about va=
rious
> > > ancient fbdev drivers that do not reserve their memory regions correc=
tly. So
> > > please drop patch 14 form the series.
> >=20
> > Is it? Could we rephrase the entry then? I'm the one that suggested
> > Anusha to work on this, and it's still not clear to me what it means
> > exactly if it's not what she worked on :)
>=20
> The text in the TODO sounds pretty clear to me.

The title is "Request memory regions in all drivers", and the first
sentence is "Go through all drivers and add code to request the memory
regions that the driver uses". It's definitely ambiguous if only fbdev
drivers should be considered, even more so in the DRM documentation.

> It says that not all drivers request the memory that they are going to
> use, and suggests to add those missing calls.

Right.

> But all of the drivers in this series already do that

Nope.

> and the only change here is to convert them to use some of the newer
> helpers.

For some, yes. For others, it actually adds request_mem_region.

Maxime

--ntiwixuo22akqcub
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5pJLAAKCRAnX84Zoj2+
djXJAX42QJuv9ldBu+AhSOcaGHTmHduDMEY8V8Vl9SA1LQwXd1eGjPx3kK6JEffx
SuWaI7oBgKL15NjVE6UaWuMksj7yMDft9JYcv/qLSoYx2TpAp/7FYElajo0cqE0S
btsWT+helA==
=K+FR
-----END PGP SIGNATURE-----

--ntiwixuo22akqcub--

