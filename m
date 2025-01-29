Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FBAC02190
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2025 14:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NQivZatFy6ozbG8cW4E7SYCaO/iSD4IT71wGW8bA+U=; b=RM18wCbNtDC+qMagyHzxWqwZU4
	6DKGl2ui1phoTLAk1pAb5UbIafXfpHSFpHrK4FVOunG432H+9Uvl5U67cqh5xIVZd0jW5pevzHVO2
	8IA/li1poat7J5GLubrXhZDn72TiuY0w7Jqbxjb0+UFeebF6ZHP3SjJkJW8xpFeJZyh2OAeP6TrsR
	8x7IxBQFqU0trbd5ab6L+o6Ub27gMc6aRep3IPuugdpL2AR68pycI71rRSYrw+VQFcOyuh9zjRQBE
	8IH+tL0psNsD6ZzoAV3iADsFXYfOg39DhBLhP05bM2342q4Wzqt3xSc/hUt0O9dSjcm47iRzVQnzj
	Qdrmhbxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td96n-000000078Mg-0cjb;
	Wed, 29 Jan 2025 14:32:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td96i-000000078Jh-3cS0;
	Wed, 29 Jan 2025 14:31:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 15ABF5C5D05;
	Wed, 29 Jan 2025 14:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80EADC4CED1;
	Wed, 29 Jan 2025 14:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738161114;
	bh=/NQivZatFy6ozbG8cW4E7SYCaO/iSD4IT71wGW8bA+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XwkYLReRA45QF3dUHy2a5jJCxEh/8q0TL3kVXAa2fw4Ahf/WYOfr4xtttIKeBbyc/
	 mDRVGqF1sIyPmUPXVpRTEiqvANTBSxwkyCn+KVXDefWJKRT8MP2GRekoCahVd007Ih
	 CP918gN8Tg+65uWncO6AC8DjiTwETGtUNBziEih0x09caA2bAX82v/m1vlrsGUyf8w
	 B/ZP77LhzZG7Q/azQWEd5JmWQ4v+3nu1JaI/q0aIuyHWZgFsQKPoFEaNYaSOdWiRwO
	 EQ/Ichf24+ZgBpu6lFjVGCimVGm4SrC+Wkf8jGVRniARB0uLj5/lcma9JiP2TTeCAW
	 ICPsEs4ALdTeQ==
Date: Wed, 29 Jan 2025 15:31:50 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Anusha Srivatsa <asrivats@redhat.com>, Joel Stanley <joel@jms.id.au>, 
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
	Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Alexey Brodkin <abrodkin@synopsys.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jonathan Corbet <corbet@lwn.net>, linux-aspeed@lists.ozlabs.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 14/14] Documentation: Update the todo
Message-ID: <li2awsqmdoye3u7n3gi2mrhbfxs77e3edjmsg5zclnyjinsnul@2bjkc5agyu5u>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-14-0d1609a29587@redhat.com>
 <a389f799-442e-45f3-8609-2eb2f0b7a825@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="4zgjoi5tasqxwp35"
Content-Disposition: inline
In-Reply-To: <a389f799-442e-45f3-8609-2eb2f0b7a825@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_063157_102604_CCC2D3D1 
X-CRM114-Status: GOOD (  12.48  )
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


--4zgjoi5tasqxwp35
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 14/14] Documentation: Update the todo
MIME-Version: 1.0

Hi Thomas,

On Wed, Jan 29, 2025 at 02:06:15PM +0100, Thomas Zimmermann wrote:
> Am 28.01.25 um 23:29 schrieb Anusha Srivatsa:
> > Remove the TODO now that this series addresses
> > the changes needed.
>=20
> While your series is fine, this TODO item is unrelated. It's about various
> ancient fbdev drivers that do not reserve their memory regions correctly.=
 So
> please drop patch 14 form the series.

Is it? Could we rephrase the entry then? I'm the one that suggested
Anusha to work on this, and it's still not clear to me what it means
exactly if it's not what she worked on :)

Maxime

--4zgjoi5tasqxwp35
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5o71gAKCRAnX84Zoj2+
dlIiAYCuZ4LfnornQ6HBeGeodgAvHyP2JHHAH32UgOwV9w+vt/5RwFWlygqXx5nv
ggyszhgBgJuXAJdx+hiY88mf0JptAOibew6TT8wLX6WV4WS6/NXT4CzBcrvJArwN
C91xDc/bTg==
=wEcd
-----END PGP SIGNATURE-----

--4zgjoi5tasqxwp35--

