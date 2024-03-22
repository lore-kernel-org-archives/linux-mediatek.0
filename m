Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7C3C47DD9
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 14:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFZ1yPD5FPfNmdnDQT4S4dEkS92ro2TOAoKTVqaTos8=; b=qWHr4f3Ti9FsOLeZsoZm2U/1gl
	KMmbjFDKxncyAe58GBjrQWx4WX9pxLWUhcTW0eexsGTvq5lG0SdwXhmVn4afWg4V7TCNuVMS92Ar6
	4RqWUaVnVyUZK/KevnqRyEEpm6nBM1g/Gf3KVeRQG5xrvHwTuqIlXV2G7mDqjMk1B9lDD/i1oDomr
	VaGUtLIGMERYjT7Ly3jvkhQdmK8lR0zGBeagCwA9Wx9Lf2PYezQT4nveI4nHs0o+miaT1uuRkm5zC
	z7VxGcuPP6Gbw08zAFvUCVTZ601p8g0yUDBhDncg+6icFxznTouGss/rbO0LmZpfOaYPVVJkrV5Dj
	N1KFCfgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnfys-00000007Zoz-1b6i;
	Fri, 22 Mar 2024 14:34:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnfyo-00000007ZmF-0MSq;
	Fri, 22 Mar 2024 14:34:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B0B1160C24;
	Fri, 22 Mar 2024 14:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB7FC43390;
	Fri, 22 Mar 2024 14:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711118083;
	bh=hlZVhqXG5tZdnG9IkzH2tQNrjKC3YWqFEQJmVE1j798=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L9YIH9mHGzkuhZa5ZVgbm1uCmpXH/UdC5VoAAU2ZdmPoXXqtpJMpUbovXd3gDgO41
	 CU2DUUw+SMa8RxrldgPU79Ss9iLOQN6UmBrNuMgrwYhLnrE/9pIW897R2ohFddMIXc
	 fKAcsdytm6UayuPjZsV6voe6BUrX1bROQ4UC5NTMEIiFIp4Cdztw4DnZ0J1u/GaohG
	 CdPO8YbPjtOS9u2k4iiFhrL81vXJ7YZxlQaIdf2NetJ3ZGrkO0LeJuDCMVwOrjUrRl
	 LZee8y5F+DzlqtMhPwLn2YgOsuJFmKXvTh9GCAuztPZGuK4AA8IAS+C6YSkEmDZmew
	 YKo4qspd4j+2A==
Date: Fri, 22 Mar 2024 09:34:35 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Elie Morisse <syniurge@gmail.com>, 
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Krzysztof Adamski <krzysztof.adamski@nokia.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Jean-Marie Verdun <verdun@hpe.com>, 
	Nick Hawkins <nick.hawkins@hpe.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, 
	Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Ajay Gupta <ajayg@nvidia.com>, Peter Korsgaard <peter@korsgaard.com>, 
	Andrew Lunn <andrew@lunn.ch>, Robert Richter <rric@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Vladimir Zapolskiy <vz@mleia.com>, Loic Poulain <loic.poulain@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Conghui Chen <conghui.chen@intel.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Michal Simek <michal.simek@amd.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
Message-ID: <zdgzj3oemsmlsqz2ctxb3ew6xkohiuew2e4djvxileiew66su5@3pjbsgqdbf3f>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_073446_270027_1FDE7D20 
X-CRM114-Status: UNSURE (   9.92  )
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

On Fri, Mar 22, 2024 at 02:25:57PM +0100, Wolfram Sang wrote:
> Match the wording in i2c_algorithm in I2C drivers wrt. the newest I2C
> v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
> appropriate terms. For some drivers, this means no more conversions are
> needed. For the others more work needs to be done but this will be
> performed incrementally along with API changes/improvements. All these
> changes here are simple search/replace results.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

