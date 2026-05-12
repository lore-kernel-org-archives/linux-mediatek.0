Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A6DCD37BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2026 00:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nAStgxDrILHcHBeKraq8IhW1NnoPOLY/Yn9N0sOuGOg=; b=RvBhTpZ1kr/2YKsgK5tiriJStr
	/WLk9z3FjASy2/RLasbiTsKix0hdRQlwwBJwWnLcYASAxrrHI2CtImwDmqBgRMynZOLFJBYVqzXNj
	uBoxdz7VdAWMmJrGtlrTVS7inUnm92TRaKEl74W+JTofYSw6GeZ74vgWutoI+pB4w8qdZBOpIJ+KT
	tcjmfyM6Ls4AwoMr3uJzJXCmFlMa3IjBMs56lp7JC9KERlX1m+ZtxtKltGLsk8ukFq2wq+B/Pdzb5
	SRDEhEmtMtIT0OE0oQO/uDwXMtp3CgUdZGa6E1ovUK35VQucEN71Fy8Y7PzVVKTlkCiBx588EZpXQ
	785Rrj6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMbH7-0000000F73t-2EPd;
	Tue, 12 May 2026 00:47:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMbH4-0000000F734-0NZx;
	Tue, 12 May 2026 00:47:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C6A0B4430D;
	Tue, 12 May 2026 00:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DCECC2BCF7;
	Tue, 12 May 2026 00:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778546820;
	bh=nAStgxDrILHcHBeKraq8IhW1NnoPOLY/Yn9N0sOuGOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tt9OVl510AUmHO0p1IfBYvhOgGKzbIKfpqfHYBsKz13+FMYMBmLpLpVBOmYAcwyQI
	 Vy+EKK4zr/+vGU07Js65Hyo4aDbG+6QaHrEFOUB1TXFH+naRL1H1Uhw1KD6+aHWT23
	 /LdGTZO90nGqF6+J9xhNmNUVGqv7ns5XsLMZq8M5Ax399+7RKgCmTtMHJ7AWL8Gt6I
	 2mqWct4eRPEY0bxDP6ePKqAHat1g6xoJl7HHI8It4lQOgChMCaIzm7+PnR5enBxcj0
	 ms6krrI/cN7bLEWOKOrdAlrlFSYkd5I84c3JRoZZ4fJYR7TDmR8mYyHrQN2TfkYcXs
	 rO51hs5zz4rjQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 75C0B1AC58C2; Tue, 12 May 2026 01:46:57 +0100 (BST)
Date: Tue, 12 May 2026 09:46:57 +0900
From: Mark Brown <broonie@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liu Ying <victor.liu@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Vinod Koul <vkoul@kernel.org>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	MD Danish Anwar <danishanwar@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Parvathi Pudi <parvathi@couthit.com>,
	Mohan Reddy Putluru <pmohan@couthit.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michal Simek <michal.simek@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	"Andrew F. Davis" <afd@ti.com>,
	Hussain Khaja <basharath@couthit.com>, Suman Anna <s-anna@ti.com>,
	Ben Levinsky <ben.levinsky@amd.com>,
	Tanmay Shah <tanmay.shah@amd.com>,
	Erwan Leray <erwan.leray@foss.st.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Roger Quadros <rogerq@ti.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Consolidate "sram" property definition
Message-ID: <agJ4gfH0HgmbOr5X@sirena.co.uk>
References: <20260511165942.2774868-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3xlBjuC8zHYeQx3+"
Content-Disposition: inline
In-Reply-To: <20260511165942.2774868-1-robh@kernel.org>
X-Cookie: Truckers welcome.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_174702_177720_2E64B769 
X-CRM114-Status: GOOD (  11.33  )
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


--3xlBjuC8zHYeQx3+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2026 at 11:59:36AM -0500, Rob Herring (Arm) wrote:
> The "sram" property has become a de facto standard property, so create a
> common schema for it and drop all the duplicated definitions.

Acked-by: Mark Brown <broonie@kernel.org>

--3xlBjuC8zHYeQx3+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoCeIAACgkQJNaLcl1U
h9CAeQf/d29Uvfn8GPawCZ+l4UnMHO/18slnjGlircCx5bFlOKWLyqPq14JkP32t
feVK/h8PnpOWbJCebOgL+As1iNYcMRPjw2C4eq+HfdBppx/1NZ7FK7CmBQjRgccv
yKyirduSqH7pUKJ3lNom3Q0qkCjzezWH9fFxqic/P9T3aEsx6rjZ+y9zAl3pskdi
LaMYflOJv7ca2tEWSY+RNNjsmfq2JIsZAwkMRlWtFK4maNWi0dw84s6d5egY76oJ
6ZI//3nGXP8Xy3i48UmCoJDpNhMA3+1PW9i1ylSGK9F0KOttz/cmIG3cUleEVd9f
WXPmJksEzyt97BKPha3/6IKICQtmdw==
=XKlR
-----END PGP SIGNATURE-----

--3xlBjuC8zHYeQx3+--

