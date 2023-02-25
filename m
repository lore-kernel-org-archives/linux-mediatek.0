Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7921C64ED6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 07:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJhGhrJhM/ia1UG6lSW7wTu8F/0J955GkyXWz+f13ZI=; b=q5cvF4CxnD8JRY2/30MCAhEaAh
	sne+5B2V5CVRUYqa0tRPT3gpLmwn6vh4mhZLGM4NnbLQ4J67yhoDuiT2u/Ahr5kcGwo8j+N3iGUYK
	P7Q4uzX9o+GVBQFJ5NycQXOXlV0LRmncDl7jC7LYS+omYg5ajvXZgQTAVpygloVLOPEb77X1KTyC2
	HDshkIHQLiFPj8bg6KEDCH5aMureeRoNXwYF0nkr8emi+GFPrL6lWAANnR88wH/8dvAlqQDixGgMl
	TuU9RQoi+fqrx9EMqYqCR3jvKUZ1ygzzFj2Z8ibv7rSQ9j2z6GRxXtTQvpKWfZKix49LNzuz0VdGb
	ceE77MEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWYMD-008iag-CF; Mon, 27 Feb 2023 07:55:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVxjL-0063mW-I8; Sat, 25 Feb 2023 16:49:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0BF2CB8074D;
	Sat, 25 Feb 2023 16:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4ADC433D2;
	Sat, 25 Feb 2023 16:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677343736;
	bh=/e0lyJTkNvDAqaicd3Afom3fcaYBkAStZPmcTVYvDYc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XFLhlfK9HLE/sqp5IxJOIpYpGt+HHKeoU23iUxxR4X0t0eGYXJGXqvqs1FoVr8+Uu
	 810JEEPxEnNt+2fC3Ycb2FOIItJ9mBA08kXzZOCxE4LpVp7oCtO4grZfXjltVnINmt
	 sUYo10sGybCVagoaIodhO3xEWC3WCUnO7MLf5EAJlAxDNob/9Z1uCQ4ZFQI3haVkyf
	 qxKrNCDS70Rb3F5o5jtpcVz1tQrUgcr3C+BoZugOaJ6CjEuohb3f8vcFIEnjA3GnJi
	 DCMeY9kS0WnWmg6zKX8eqDC2x/HC9tN9ECKlkzWXUoT8t9SsvEohdYYVSW10EogO8X
	 kY0gekbzPKUsg==
Date: Sat, 25 Feb 2023 17:03:06 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Len Brown
 <lenb@kernel.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Jean Delvare
 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Lars-Peter Clausen
 <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Raju Rangoju <rajur@chelsio.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Ido Schimmel <idosch@nvidia.com>, Petr Machata
 <petrm@nvidia.com>, Gregory Greenman <gregory.greenman@intel.com>, Kalle
 Valo <kvalo@kernel.org>, Sebastian Reichel <sre@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Amit Kucheria <amitk@kernel.org>, Florian
 Fainelli <f.fainelli@gmail.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott
 Branden <sbranden@broadcom.com>, Markus Mayer <mmayer@broadcom.com>,
 Support Opensource <support.opensource@diasemi.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Thara Gopinath <thara.gopinath@gmail.com>,
 Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund@ragnatech.se>, Heiko
 Stuebner <heiko@sntech.de>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Talel Shenhar <talel@amazon.com>, Eduardo Valentin
 <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Stefan Wahren
 <stefan.wahren@i2se.com>, Neil Armstrong <neil.armstrong@linaro.org>, ye
 xingchen <ye.xingchen@zte.com.cn>, Zheng Yongjun
 <zhengyongjun3@huawei.com>, Tim Zimmermann <tim@linux4.de>, Yang Li
 <yang.lee@linux.alibaba.com>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Ricardo Neri
 <ricardo.neri-calderon@linux.intel.com>, Jiang Jian <jiangjian@cdjrlc.com>,
 Daniel Golle <daniel@makrotopia.org>, Balsam CHIHI <bchihi@baylibre.com>,
 Randy Dunlap <rdunlap@infradead.org>, Mikko Perttunen
 <mperttunen@nvidia.com>, linux-acpi@vger.kernel.org (open list:ACPI THERMAL
 DRIVER), linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and
 Parallel ATA drivers)), linux-arm-kernel@lists.infradead.org (moderated
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE), linux-hwmon@vger.kernel.org
 (open list:HARDWARE MONITORING), linux-iio@vger.kernel.org (open list:IIO
 SUBSYSTEM AND DRIVERS), linux-sunxi@lists.linux.dev (open
 list:ARM/Allwinner sunXi SoC support), linux-input@vger.kernel.org (open
 list:INPUT (KEYBOARD, netdev@vger.kernel.org (open list:CXGB4 ETHERNET
 DRIVER (CXGB4)), linux-wireless@vger.kernel.org (open list:INTEL WIRELESS
 WIFI LINK (iwlwifi)), linux-rpi-kernel@lists.infradead.org (moderated
 list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
 linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
 linux-renesas-soc@vger.kernel.org (open list:RENESAS R-CAR THERMAL
 DRIVERS), linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC
 support), linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL
 DRIVER), linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE
 SUPPORT), linux-omap@vger.kernel.org (open list:TI BANDGAP AND THERMAL
 DRIVER), linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek
 SoC support)
Subject: Re: [PATCH v1 01/17] thermal/core: Add a thermal zone 'devdata'
 accessor
Message-ID: <20230225170306.12c30b88@jic23-huawei>
In-Reply-To: <20230219143657.241542-2-daniel.lezcano@linaro.org>
References: <20230219143657.241542-1-daniel.lezcano@linaro.org>
	<20230219143657.241542-2-daniel.lezcano@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230225_084903_955690_D3B72B77 
X-CRM114-Status: GOOD (  15.33  )
X-Mailman-Approved-At: Sun, 26 Feb 2023 23:55:36 -0800
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

On Sun, 19 Feb 2023 15:36:41 +0100
Daniel Lezcano <daniel.lezcano@linaro.org> wrote:

> The thermal zone device structure is exposed to the different drivers
> and obviously they access the internals while that should be
> restricted to the core thermal code.
> 
> In order to self-encapsulate the thermal core code, we need to prevent
> the drivers accessing directly the thermal zone structure and provide
> accessor functions to deal with.
> 
> Provide an accessor to the 'devdata' structure and make use of it in
> the different drivers.
> 
> No functional changes intended.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

For the one change in IIO.
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

