Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD11C27C6E
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jun 2024 18:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osjHdpENVIPZkE6xIPy2V4BuG0sO5GBaRhifuE5x2O0=; b=oDwKgm0U1pjiWo44edbG6dHUK3
	zjXkrbmJaO/Q9BNqo3F0G0XAfW7jMAaafDHPjaIRlq3jeol+3vzRQdpNjQg4SqLouOP3dOJATKHUy
	egusGFzh8Rs27B+oseA8dyRexhNXbQz3QZ/hiZQ4Euy+KJDwQU4Kk6l3m5MuztIh68cLq94kdve7x
	WK/BghQ/TW5SmCl1EJEHoX0bFJipo154OuFZ/1rOZBig5+PZW/Q67AbiXnTXSn9TAkmhXDA7dcb+j
	FskbelhTYKAeDJwMy2woHLNF+2+ciDfMKo1yI13p4dwkH30VFR542HhOYZhnF1VJsZTODH+CPWICd
	NRV0dzHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIux1-000000088BK-2O7V;
	Sun, 16 Jun 2024 18:50:03 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIuws-0000000888m-3v7f;
	Sun, 16 Jun 2024 18:49:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DF6BBCE0ED3;
	Sun, 16 Jun 2024 18:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF56C2BBFC;
	Sun, 16 Jun 2024 18:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718563790;
	bh=osjHdpENVIPZkE6xIPy2V4BuG0sO5GBaRhifuE5x2O0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=coDx3fTCDyHCwcx4phLEdKPE4EnO0+r5shya/UDwFe1tr2yNK3DD5+11me8gnjfCo
	 gcgxjn1nhU11+GPNDlr70AY4FsCrONmAuiz2j8aTXJdQbIHEw7/IF/cnHnan8oigXy
	 tvq9Y/l6Ls0ceOSLpTlOmbdCRh68+btlPNA2k4EMVCSGTLrHAurqhFLet/O9WE3ewA
	 ULmnLzGKFayh2LHgHDLw2ANYsfHGD5rv6QbpyeYy91sjm5K5YywxT3CpwHu0T8N3EE
	 FB5mtdDSfIDYwlg1L/vpD0Dt4nRhV1TbTtB3DeC2Xgpm2Z/P2OyDdyPM5d7b0emAHE
	 c6dz3vR4/Ppkg==
Date: Sun, 16 Jun 2024 19:49:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Guillaume La Roque <glaroque@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Anson Huang <Anson.Huang@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	zhanghongchen <zhanghongchen@loongson.cn>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-sunxi@lists.linux.dev, imx@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 00/22] dt-bindings: thermal: few cleanups
Message-ID: <20240616-immovably-washboard-5eff43888e6f@spud>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kOA5/bYAEVq+jUn/"
Content-Disposition: inline
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_114955_688958_9A88792E 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
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


--kOA5/bYAEVq+jUn/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 11:45:59AM +0200, Krzysztof Kozlowski wrote:
>=20
> Few cleanups witout practical impact, except maybe the Amlogic schema
> (bringing required cells).

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--kOA5/bYAEVq+jUn/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZm8zwgAKCRB4tDGHoIJi
0ttlAQCXZrCE/f+fR0kZEWAkq+YZfRQhwyqkNPYsIPr3O9xqAAD+NmeiOYPzL4/8
zTg9dNEipYzGNeR396Pg5r09PcUJDQM=
=AUoM
-----END PGP SIGNATURE-----

--kOA5/bYAEVq+jUn/--

