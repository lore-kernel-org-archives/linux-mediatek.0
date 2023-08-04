Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4E0C001DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 09:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPQtYJxSrXhI8le2opMMvqeT4pm48kowlmZco4+Lxps=; b=Kr5ng1Da9zLCyscUu4URxVO6FN
	x7/rcUJDomPkyNQxUo9C+QK2giTP+wMwQ8efDLRo/JR6u93ixJCyusm8jwIyCA1ljDkgAjmO4P38A
	PGV6dfYgns+pLxwUiFfK61HcgQRHtNS8zIO2lNmDyIskFgP0nvp+84EB28+xBxEgS8YTiuJych447
	gIxeCI0JmtLFxvhWTUOPmTk5mj0MVb7hd2juxOJ93cNn157H05BkI1CJu98E8P7j9lLv23lLeWlv4
	yRAtuEmCZUQcbjRlxVamlbQFq4o5e3Fr7rhAtS4nLWVeCJT6fqpuO/zNUZFM9qe9LOuLR7svLI32s
	yb3ZzjhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRrTq-00C3t1-0o;
	Fri, 04 Aug 2023 09:52:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRrTl-00C3sR-2o;
	Fri, 04 Aug 2023 09:52:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19B7B1007;
	Fri,  4 Aug 2023 02:52:58 -0700 (PDT)
Received: from bogus (unknown [10.57.96.101])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 756D23F6C4;
	Fri,  4 Aug 2023 02:52:03 -0700 (PDT)
Date: Fri, 4 Aug 2023 10:51:27 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Rob Herring <robh@kernel.org>
Cc: soc@kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>,
	Tsahee Zidenberg <tsahee@annapurnalabs.com>,
	Antoine Tenart <atenart@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Jean-Marie Verdun <verdun@hpe.com>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Sh iraz Has him <shiraz.linux.kernel@gmail.com>,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Jay Fang <f.fangjian@huawei.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Michal Simek <michal.simek@amd.com>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Ulf Hansson <ulf.hansson@linaro.org>, Li Yang <leoyang.li@nxp.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v2 17/23] firmware: Explicitly include correct DT includes
Message-ID: <20230804095127.w74m6aphiwkaqlim@bogus>
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
 <20230803-dt-header-cleanups-for-soc-v2-17-d8de2cc88bff@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-17-d8de2cc88bff@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_025218_009113_5B621C85 
X-CRM114-Status: GOOD (  11.70  )
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

On Thu, Aug 03, 2023 at 04:42:57PM -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Acked-by: Dinh Nguyen <dinguyen@kernel.org>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/firmware/arm_scmi/driver.c | 4 ++--
>  drivers/firmware/scpi_pm_domain.c  | 3 ++-

(For SCMI changes)

Acked-by:  Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

