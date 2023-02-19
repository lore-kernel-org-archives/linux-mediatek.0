Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48169C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Feb 2023 15:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfvHBPjFD3fnJEXsEdcPBmeh9w1ZDPtCXMtTzNwUMP4=; b=sMrUnHUllMth7DQP5+Wi9j9wll
	BmbstzmBst50mJaHJuBZV0WRspDgAaqMyyKOuo4Je7zCxQ2KS+rYL1jUe6DjHHWFnl7u4kcjOUSCO
	hu6waL362SzhGK9ekBCxhSG3bt69GgDiskmnLwp5P/x9LEsoLciugCAP9rnJp5kqHTiA4q570uhSY
	CnzegLJrhfjMPMaq87Gxh8ObN+EIhlQ/mLqMC7myEDUEFbAMDi4Ser/PBvx4rBFCSzTDBYSpVVm+W
	Tnd0mv7t9rXtLQ2E+DPKDiSbpoHTnbxSur9Yf1Oz5TXu5zbdlAUVfToCHAItEETzvcG3FrsTFVnLJ
	rYFkM+Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTlHp-001kue-Vu; Sun, 19 Feb 2023 15:07:33 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTlHl-001krc-LQ
	for linux-mediatek@lists.infradead.org; Sun, 19 Feb 2023 15:07:31 +0000
Received: by mail-lj1-x236.google.com with SMTP id r10so716347ljp.3
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Feb 2023 07:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vfvHBPjFD3fnJEXsEdcPBmeh9w1ZDPtCXMtTzNwUMP4=;
        b=2MT453GERnVCOXc+pZDXjhNske3WayAQFfKvKJjkTaSXaH9ypTF1xoFmHts7lcs6Tu
         8awMK4Po/ABZ5dh9w4kEV1FldjJxMrBZVoiOQuoO90QinuTnKOP01zHiWmaOtrj+nQvd
         F+ZaO4uYXLhJM+VztPHntmkaf7c2ZT1Q0aPQ00s5xppJj7swa9G6CIbKQNlCxZ/w13pb
         K749pLo5Tg+B9AZJIM2QgMhbSb1PATOb59v0crPXiX4ae6edrBvt+0E1yX/NUh/mJvXP
         jtQvKiAA2OdtGon53LBFrgDiJMJWAudwD546mUhHoHUTb6TiVX8ddk95TiBrWGbr05LD
         zGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vfvHBPjFD3fnJEXsEdcPBmeh9w1ZDPtCXMtTzNwUMP4=;
        b=ap+DPid782jpskMcTXUneqTjzDgEBJHVUTpCD7mtwpeN/FgNaPf+DytsVsXp/jT+6x
         j2bdxU7o8io+FuEwtsJtZRfVrrcrqa93oHN/mFDosll91eI/rIDOUQGw+MkXclIv1KEq
         vouHc47XxbadusftweaUnxQ6J4jI73WsBBv7rzX5pJWvz0E/OaEQyCE1iTP/+d5/8EBr
         P75rTtyj14kM5YQhzzbCzhTc1KvSXvhkyTqZ5IOzcCmcz9jWhx70Hbo9RcaB4nubYHcA
         kr0jVFU1/uhX13qQwDCF3MSi5BdkwnjHCMJkGTVpzfol6hvqstdKU9iCmy36bI9ijxo9
         /s1A==
X-Gm-Message-State: AO0yUKX6rBAB24qjokzJ+ER9D3IiNX0LDkBRClxwkVztXwZ1vlMmvFR/
	76//866f3dv9vjIqRV6Ig3rq+w==
X-Google-Smtp-Source: AK7set9/3IywPw1ycXkXfjTE1BOHzIfMRekgiKErVRCZRj2jjMurZbyZpbHyyTOgbRvkntf1piSbOg==
X-Received: by 2002:a05:651c:1541:b0:293:14c8:f588 with SMTP id y1-20020a05651c154100b0029314c8f588mr403194ljp.27.1676819242130;
        Sun, 19 Feb 2023 07:07:22 -0800 (PST)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id f23-20020a2e9517000000b0029355185926sm1245807ljh.137.2023.02.19.07.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 07:07:21 -0800 (PST)
Date: Sun, 19 Feb 2023 16:07:20 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
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
	Guenter Roeck <linux@roeck-us.net>,
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
Message-ID: <Y/I7KA2Uqqk7ib6L@oden.dyn.berto.se>
References: <20230219143657.241542-1-daniel.lezcano@linaro.org>
 <20230219143657.241542-2-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230219143657.241542-2-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_070729_777745_4511578A 
X-CRM114-Status: GOOD (  21.63  )
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

Hi Daniel,

Thanks for your work.

On 2023-02-19 15:36:41 +0100, Daniel Lezcano wrote:
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

>  drivers/thermal/rcar_gen3_thermal.c              |  4 ++--
>  drivers/thermal/rcar_thermal.c                   |  3 +--

For R-Car,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

...


> diff --git a/include/linux/thermal.h b/include/linux/thermal.h
> index 2bb4bf33f4f3..724b95662da9 100644
> --- a/include/linux/thermal.h
> +++ b/include/linux/thermal.h
> @@ -365,6 +365,8 @@ thermal_zone_device_register_with_trips(const char *, struct thermal_trip *, int
>  					void *, struct thermal_zone_device_ops *,
>  					struct thermal_zone_params *, int, int);
>  
> +void *thermal_zone_device_get_data(struct thermal_zone_device *tzd);
> +

bikeshedding:

Would it make sens to name this thermal_zone_device_get_priv_data(), 
thermal_zone_device_get_priv() or something like that? To make it more 
explicitly when reading the driver code this fetches the drivers private 
data, and not some data belonging to the zone itself.

>  int thermal_zone_bind_cooling_device(struct thermal_zone_device *, int,
>  				     struct thermal_cooling_device *,

-- 
Kind Regards,
Niklas Söderlund

