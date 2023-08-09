Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2560C0015E
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Aug 2023 13:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cswTEByuqWpeOlZdKGDMRzVxn/HpbgZ+DF3/Ia0ZobQ=; b=Su95OclCK5mwWkvURzfpQf488N
	sAFHnWkToRSBmh1BKnGZ2zayp1n5swMmphZxj3hRRzMfdkvLdcNuziDDxllotZNeLu7omY8G1a9L7
	3OaF7dFv5QTqssLJeZOChug6peiwGo77udxsPmgDHqOTAWWICcgBsFB6pXBG8D0TyS7xo/VBDcy/6
	fsd3UFmWHySxDEgCg4pf3kPS169mc6lWVq2X4OO9YCrRnev/k76MvqmJlheRdJ0PrJPPS4MQ730Ic
	HfO4qD+WSbH0dMpBwZHCcd96Y9TPth9vlhmpt8srTX5RrGb5LCw0xJ8SRs3eN1Xx1qQKGdPouxyym
	J474/VAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTjhi-0056QQ-1p;
	Wed, 09 Aug 2023 13:58:26 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTjhf-0056PB-1e;
	Wed, 09 Aug 2023 13:58:24 +0000
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qTjgu-0007Qm-Nw; Wed, 09 Aug 2023 15:57:36 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Daniel Mack <daniel@zonque.org>,
	Jay Fang <f.fangjian@huawei.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Benjamin Fair <benjaminfair@google.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Tsahee Zidenberg <tsahee@annapurnalabs.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Li Yang <leoyang.li@nxp.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Rob Herring <robh@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	soc@kernel.org,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Patrick Venture <venture@google.com>,
	Michal Simek <michal.simek@amd.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Avi Fishman <avifishman70@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Joel Stanley <joel@jms.id.au>,
	Jean-Marie Verdun <verdun@hpe.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nancy Yuen <yuenn@google.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Shiraz Has him <shiraz.linux.kernel@gmail.com>,
	Stuart Yoder <stuyoder@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Chen-Yu Tsai <wens@csie.org>,
	Antoine Tenart <atenart@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Thierry Reding <treding@nvidia.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-sunxi@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-aspeed@lists.ozlabs.org
Subject: Re: (subset) [PATCH v2 00/23] ARM: DT include cleanups
Date: Wed,  9 Aug 2023 15:57:33 +0200
Message-Id: <169158939237.3288791.15504684466280859190.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_065823_545988_8F70A542 
X-CRM114-Status: GOOD (  12.53  )
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

On Thu, 03 Aug 2023 16:42:40 -0600, Rob Herring wrote:
> Arnd, This is all the remaining ARM and SoC related patches of DT
> include cleanups which have not be applied by sub-arch maintainers.
> 
> A few of these are v2, but most are just resends of v1.
> 
> 

Applied, thanks!

I didn't find a reply to the thread in terms of it going
in alltogether, so went forward and picked the Rockchip things
I missed before.


[12/23] ARM: rockchip: Drop unused includes
        commit: 8cbdf5d2880923070198c240534f4cca3e04dfb1
[20/23] soc: rockchip: Explicitly include correct DT includes
        commit: fc7696e2ae81404c6ca176e7ebbddd4b19c40953

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

