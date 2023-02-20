Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547F6C636CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 09:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUB3veHF6Yw8WQ3NLxuQA+MMGkImfYwWY19COFV3KcA=; b=ijtTy7uBvGtS16JZzNN2+Nb5/V
	0c2XEPIgZyV/3XYbtXsHaPRewbBDDD14Mgade6hf76haD2Sias8tQ3YxgWGic7VRaVlNn8U8/p10g
	F6jMBEkEdla8gmGYt7FDhwcvorNuAkJdPwctE33fwBrypqQ0yGCPv91w5MKbScgThhwQlKfEiU2n7
	TB1RmkoP3cnus4vspPtui4lKR2GP/KDq6qwV2jxYPbq5Jc9BG0WJVdltEOrzqQJuvIPN9a0AFLHWx
	h9+GzPgLCnPOGeCbF1PN3Bg82+sxhpzNRAyfdLaBzZItjhUDVXiDz6nlWmRbsNX0J/DW600WWyQQa
	XPF0oddg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU2B2-003T4E-3k; Mon, 20 Feb 2023 09:09:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU2Ao-003SyQ-9t; Mon, 20 Feb 2023 09:09:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3E8BA660213E;
	Mon, 20 Feb 2023 09:09:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676884163;
	bh=CcTg7ASDuP93bA3Rq45SQJeq89x8G+dp6U70KNUsMPE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hJka8ss87wnQqdZEpCLiQcXMdci2VjXO/ExBxWNd2u3NQv77pVKCv+DGHYQubq0/o
	 jOR1Q9V8fiDUdLUie9ZgAWAm2ZS3SUyTJtxh8d6pVVh99Gr3ejUZL6i9kC3bBz/ibR
	 4leGEmi7b30mDq5fBsiprHv3BwcOXyvhPyjnHM9WLt2ciyCmXLOgawlXk3rZAPCCqO
	 ayFqXWG5eOvRXt8snq6HqCK7P4pk8nwQ8Ekb0YXVJwQKcbaks6FZeHSLPNr2hy20ng
	 rBEuqKxU6Xm2BcKhPUt1DFa6cukGDfP/GXtAZgoeuEt0eguqDnFCt0KOiWbA1373Vz
	 JoFgV86+K/1GA==
Message-ID: <516d9af5-41cc-94a9-4b35-677672101d9c@collabora.com>
Date: Mon, 20 Feb 2023 10:09:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 01/17] thermal/core: Add a thermal zone 'devdata'
 accessor
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, rafael@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Raju Rangoju
 <rajur@chelsio.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Ido Schimmel <idosch@nvidia.com>,
 Petr Machata <petrm@nvidia.com>,
 Gregory Greenman <gregory.greenman@intel.com>, Kalle Valo
 <kvalo@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Amit Kucheria <amitk@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Markus Mayer <mmayer@broadcom.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 Heiko Stuebner <heiko@sntech.de>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Vasily Khoruzhick
 <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Talel Shenhar <talel@amazon.com>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stefan Wahren <stefan.wahren@i2se.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Zheng Yongjun <zhengyongjun3@huawei.com>, Tim Zimmermann <tim@linux4.de>,
 Yang Li <yang.lee@linux.alibaba.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Jiang Jian <jiangjian@cdjrlc.com>, Daniel Golle <daniel@makrotopia.org>,
 Balsam CHIHI <bchihi@baylibre.com>, Randy Dunlap <rdunlap@infradead.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 "open list:ACPI THERMAL DRIVER" <linux-acpi@vger.kernel.org>,
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>,
 "open list:CXGB4 ETHERNET DRIVER (CXGB4)" <netdev@vger.kernel.org>,
 "open list:INTEL WIRELESS WIFI LINK (iwlwifi)"
 <linux-wireless@vger.kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 "open list:RENESAS R-CAR THERMAL DRIVERS"
 <linux-renesas-soc@vger.kernel.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <20230219143657.241542-1-daniel.lezcano@linaro.org>
 <20230219143657.241542-2-daniel.lezcano@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230219143657.241542-2-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_010926_638928_3AFB9AB8 
X-CRM114-Status: GOOD (  14.68  )
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

Il 19/02/23 15:36, Daniel Lezcano ha scritto:
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
> ---


>   drivers/thermal/mediatek/auxadc_thermal.c        |  2 +-
>   drivers/thermal/mediatek/lvts_thermal.c          |  4 ++--

For MediaTek auxadc and lvts:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



