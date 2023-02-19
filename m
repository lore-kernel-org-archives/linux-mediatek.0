Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6880DC61DA4
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Feb 2023 14:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRWzUiIkZMN/8VwTf3/WG02TOz303pOTBThE0ISU9KA=; b=D55Qq787xB5CIlgmzXSjXQCE65
	/J3ZbFGB78P2RInlrVPz/8s6R4RQF/EwXB1JtAVyBEfbvlZEjA6ZQTdjUV6+nI5m2+8Ag3LtQmUOf
	idJiCDkmmtDtJZt3wtZtmNpSWjlNssDgNAU6v4dK0imBWPHMCd3EfqOmxCoVZXnL6XAHFjGgi/iGo
	6BcjsojVNiIEEXZqqycKE6UW0P0ycO9uIEDdkzDvLtxGZY2LCsvkUaQpQ1HAWnaP5u2F+hpncqZ1s
	2NJSix1EeqO7toO6HBQk4oqGzac+8AOt7pvMS5XezMCH/OFYrCPO8pSPWMFDt/xUYJNBPCvWAy/lV
	bv+myr6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTl7N-001jee-D9; Sun, 19 Feb 2023 14:56:45 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTl7I-001jcb-JB; Sun, 19 Feb 2023 14:56:42 +0000
Received: by mail-il1-x130.google.com with SMTP id v8so200974iln.6;
        Sun, 19 Feb 2023 06:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRWzUiIkZMN/8VwTf3/WG02TOz303pOTBThE0ISU9KA=;
        b=OBp/XQAU5Q471JJAcxBMgqa6dD4Dp32mVwrDrvC1tRuFffnp8TdtHAw/E8heX1RCnn
         mZ0zJ/aWl+G8TXYcKZuS0Gx/77yQV9MyRVZhYGfgTIwQgi1f+S7jIWw21vvn+0IyeUFX
         rdGxpxTfynV5AOlzLbnmYCLi82W9sEgiqT7rTWjNkuCAl/kE3OPW30GwGFZqwI+/03tU
         y7wSgIhnwQY0CXiY+UKDIT1n/bfXzXdmCFVT9lWQ/dd9grtj5iw3PduSsmfni1mS1tZT
         HOvxd60YwrOlZZkXi8ODkZ40ZdpjvMDWGoKx4Vf2pWX9kbUlwTVQq817YlKAqQz5NLhr
         k9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRWzUiIkZMN/8VwTf3/WG02TOz303pOTBThE0ISU9KA=;
        b=5HTCr/pbzNpTqrhESgxCP1+Q4cShFJBDOOyVUeIwujZNaXvlX1rb3GtKV2dmBh+CYe
         lQX0BhQTg+36FSjoHAzifjWZAxywRJH0mxVNPJ2xc7mavdRHx2X2PNThGGYd/86bWF0a
         KJClttZDsmDjOUgztSje7quMAPeGHumZXwh6Ui09E1wFo2abTaI7LkLmvCpEMTOp0HOM
         fYm+ywACy0RsPrDxtd07Ke1kmkYja0Il9MUEAx69Hexg9ySKyt2cah5J6q1hVp1AKSag
         Rjf9uinR6zoR2sk0/M1lKsKCb7SEsXbcNSMcIgOEOhFgT3nnpoMfNpNUXqUQuJIlpRJa
         8w0w==
X-Gm-Message-State: AO0yUKWIgq40jP2iQtJwaZm0XFr8nTAP08Q//3bUcDT7cii3VDLTwctk
	SYn07Jk5LtywpHb1HWZmdGo=
X-Google-Smtp-Source: AK7set/tBdHvgZ9GFY6tgVICfvLzFe6RtqLrm+n2c8aFQ5ip61CmdhaCQUFruBwYDgn3guOUu59kmw==
X-Received: by 2002:a92:1a41:0:b0:315:4350:9c09 with SMTP id z1-20020a921a41000000b0031543509c09mr1511617ill.16.1676818598543;
        Sun, 19 Feb 2023 06:56:38 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c8-20020a92cf08000000b003153cdd03a3sm501663ilo.61.2023.02.19.06.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 06:56:38 -0800 (PST)
Date: Sun, 19 Feb 2023 06:56:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
	Len Brown <lenb@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Jean Delvare <jdelvare@suse.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Raju Rangoju <rajur@chelsio.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Kalle Valo <kvalo@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Amit Kucheria <amitk@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Talel Shenhar <talel@amazon.com>,
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Zheng Yongjun <zhengyongjun3@huawei.com>,
	Tim Zimmermann <tim@linux4.de>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
	Jiang Jian <jiangjian@cdjrlc.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Balsam CHIHI <bchihi@baylibre.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	"open list:ACPI THERMAL DRIVER" <linux-acpi@vger.kernel.org>,
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:CXGB4 ETHERNET DRIVER (CXGB4)" <netdev@vger.kernel.org>,
	"open list:INTEL WIRELESS WIFI LINK (iwlwifi)" <linux-wireless@vger.kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
	"open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>,
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	"open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v1 01/17] thermal/core: Add a thermal zone 'devdata'
 accessor
Message-ID: <20230219145636.GB4084160@roeck-us.net>
References: <20230219143657.241542-1-daniel.lezcano@linaro.org>
 <20230219143657.241542-2-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230219143657.241542-2-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_065640_667278_5C281D7C 
X-CRM114-Status: GOOD (  15.98  )
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

On Sun, Feb 19, 2023 at 03:36:41PM +0100, Daniel Lezcano wrote:
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
...
>  drivers/hwmon/hwmon.c                            |  4 ++--
>  drivers/hwmon/pmbus/pmbus_core.c                 |  2 +-
>  drivers/hwmon/scmi-hwmon.c                       |  2 +-
>  drivers/hwmon/scpi-hwmon.c                       |  2 +-

For hwmon:

Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter

