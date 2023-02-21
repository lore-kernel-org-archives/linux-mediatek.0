Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134E2C636D7
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 18:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEx60aGsOPq7IkDOpzyHIUcwhrl0mz7YlLyNt97/zzk=; b=QcSYD38jQPbzc99r4rPWyU/jMd
	42pfkmg86vlIONLideaRk5GPfC3DZb/E3KyTRSfpoKlUDioiP00QHbpzZhQfUQ/ZiyhM6EtdlpnDh
	Ny6rsyOoGa+Vrt0a99fO+2MFSIGsRJ+Jd04IkWQZwSaDMMu5WoLkViAcUra4VX/kUc3ajpSVce3Il
	n876nzjXnfZTLJy1Klta1iRcuTMRmLWJMGSnJvEym1bK0nhkN3PLi0G5VufUH6FZS8moko35Q5h5Y
	7HnPpAzr5cpNyQuB1ocD0a6cD41rhCk/YeXL8gIzlV0qNtPpRB7v3ZKh+dxg91y7vr20IR9gdpEKE
	rYfOJnjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUXGB-009M5S-L0; Tue, 21 Feb 2023 18:21:03 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUXG7-009M40-5B; Tue, 21 Feb 2023 18:21:00 +0000
Received: by mail-ed1-x52e.google.com with SMTP id ee7so5798370edb.2;
        Tue, 21 Feb 2023 10:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEx60aGsOPq7IkDOpzyHIUcwhrl0mz7YlLyNt97/zzk=;
        b=Vkiaa+8m8yu4NTxbblvl9Xy6xRY9QvaCJQQZbhyYuTZn8LBqKKDe7jY7cLga8bqrcE
         YaFq3y0C2R5gLoZ44PHVCrMAdGGatzNgi+EosQ56cNauhD/qzPxPu9eWtArP/kQYf6rx
         36GQyJWdRypl3dP6LvmlQomgaS1x7ac8qIOxKBv4iPYah7/H4U4h/V6DJktLKCDLkCNt
         zam9FAexUE4ScIdFjriD/ldLT/qH7DYDTEMJw7I5irpI67gcvfxo0PhE5WzARIJUnSPa
         wlya8h0DyOjyph7LZJFK7Rnd+iEZ0//cF85WuFwOA5cl7PpXtV4f/127McL5fndnVkaK
         p+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEx60aGsOPq7IkDOpzyHIUcwhrl0mz7YlLyNt97/zzk=;
        b=oYCAzBGomyx68zO7Fed8dyG/lyzUD7tMQd+WospPty9uKEbOf/XSo+Sdlq74XzYmvt
         xG2YgiOsIwaVD/oC3qc/0JcM7kHWe/bSHcdOdBp1f2Fdm74ewnN7UZs+aXsm900OOeUn
         B9QrMUuOziHAva9+xeX/M72d+S/sndhBx7Ubw83ZP8w8qgjCwC69K6lCSEK3pgseHUvl
         x3KN2o/c6aN7qYZ7J/RE+fsE4emmRoHURSsvwVsjjg1ikMmVWBxswwFDUMlIWFSWYcth
         qX4Lonw5CLL4LvRiiuowbqqjNsCxnEcmTXP/sBlTd38XV5Ao/k3oKW0F0k0A9svb/xbd
         Ua3Q==
X-Gm-Message-State: AO0yUKW+v/ahq8X6hzWXVMnyDfRohYqKp0jjrXLuyeQ5krH0aEWca/I/
	HF33I+8BFuJ1DJVMTSiYDn0=
X-Google-Smtp-Source: AK7set/77DXP7YfI8zufkfadXlbWVnpTCpeUBy9C/lrv0XbiKTxHiGSVqDS5SHlnDvtOC7YRM2po7A==
X-Received: by 2002:a17:906:3e43:b0:88a:2e57:9813 with SMTP id t3-20020a1709063e4300b0088a2e579813mr13728718eji.33.1677003656530;
        Tue, 21 Feb 2023 10:20:56 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id p20-20020a1709060dd400b008be5b97ca49sm4790892eji.150.2023.02.21.10.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:20:55 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: rafael@kernel.org, daniel.lezcano@linaro.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>,
 Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Mark Brown <broonie@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Balsam CHIHI <bchihi@baylibre.com>,
 Gregory Greenman <gregory.greenman@intel.com>,
 Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jean Delvare <jdelvare@suse.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Raju Rangoju <rajur@chelsio.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Petr Machata <petrm@nvidia.com>,
 Kalle Valo <kvalo@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Amit Kucheria <amitk@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Markus Mayer <mmayer@broadcom.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Thara Gopinath <thara.gopinath@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 Heiko Stuebner <heiko@sntech.de>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Orson Zhai <orsonzhai@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Yangtao Li <tiny.windzz@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Talel Shenhar <talel@amazon.com>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stefan Wahren <stefan.wahren@i2se.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 Zheng Yongjun <zhengyongjun3@huawei.com>, Tim Zimmermann <tim@linux4.de>,
 Yang Li <yang.lee@linux.alibaba.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Jiang Jian <jiangjian@cdjrlc.com>, Daniel Golle <daniel@makrotopia.org>,
 Randy Dunlap <rdunlap@infradead.org>,
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
 "open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>,
 "open list:RENESAS R-CAR THERMAL DRIVERS"
 <linux-renesas-soc@vger.kernel.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Subject:  Re: [PATCH v2 01/16] thermal/core: Add a thermal zone 'devdata' accessor
Date: Tue, 21 Feb 2023 19:20:51 +0100
Message-ID: <5907084.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20230221180710.2781027-2-daniel.lezcano@linaro.org>
References:  <20230221180710.2781027-1-daniel.lezcano@linaro.org>
 <20230221180710.2781027-2-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_102059_213177_E9CF33CD 
X-CRM114-Status: GOOD (  15.92  )
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

Dne torek, 21. februar 2023 ob 19:06:55 CET je Daniel Lezcano napisal(a):
> The thermal zone device structure is exposed to the different drivers
> and obviously they access the internals while that should be
> restricted to the core thermal code.
>=20
> In order to self-encapsulate the thermal core code, we need to prevent
> the drivers accessing directly the thermal zone structure and provide
> accessor functions to deal with.
>=20
> Provide an accessor to the 'devdata' structure and make use of it in
> the different drivers.
>=20
> No functional changes intended.
>=20
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Acked-by: Guenter Roeck <linux@roeck-us.net> #hwmon
> Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se> #=
R-Car
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Ido Schimmel <idosch@nvidia.com> #mlxsw
> Reviewed-by: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> #MediaTek auxadc and lvts
> Reviewed-by: Balsam CHIHI <bchihi@baylibre.com> #Mediatek lvts
> Acked-by: Gregory Greenman <gregory.greenman@intel.com> #iwlwifi
> Reviewed-by: Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com> #da9062
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>  #spread
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com> #power_supp=
ly
> ---
>  drivers/acpi/thermal.c                           | 16 ++++++++--------
>  drivers/ata/ahci_imx.c                           |  2 +-
>  drivers/hwmon/hwmon.c                            |  4 ++--
>  drivers/hwmon/pmbus/pmbus_core.c                 |  2 +-
>  drivers/hwmon/scmi-hwmon.c                       |  2 +-
>  drivers/hwmon/scpi-hwmon.c                       |  2 +-
>  drivers/iio/adc/sun4i-gpadc-iio.c                |  2 +-
>  drivers/input/touchscreen/sun4i-ts.c             |  2 +-
>  .../net/ethernet/chelsio/cxgb4/cxgb4_thermal.c   |  2 +-
>  .../net/ethernet/mellanox/mlxsw/core_thermal.c   | 14 +++++++-------
>  drivers/net/wireless/intel/iwlwifi/mvm/tt.c      |  4 ++--
>  drivers/power/supply/power_supply_core.c         |  2 +-
>  drivers/regulator/max8973-regulator.c            |  2 +-
>  drivers/thermal/armada_thermal.c                 |  4 ++--
>  drivers/thermal/broadcom/bcm2711_thermal.c       |  2 +-
>  drivers/thermal/broadcom/bcm2835_thermal.c       |  2 +-
>  drivers/thermal/broadcom/brcmstb_thermal.c       |  4 ++--
>  drivers/thermal/broadcom/ns-thermal.c            |  2 +-
>  drivers/thermal/broadcom/sr-thermal.c            |  2 +-
>  drivers/thermal/da9062-thermal.c                 |  2 +-
>  drivers/thermal/dove_thermal.c                   |  2 +-
>  drivers/thermal/hisi_thermal.c                   |  2 +-
>  drivers/thermal/imx8mm_thermal.c                 |  2 +-
>  drivers/thermal/imx_sc_thermal.c                 |  2 +-
>  drivers/thermal/imx_thermal.c                    |  6 +++---
>  drivers/thermal/intel/intel_pch_thermal.c        |  2 +-
>  drivers/thermal/intel/intel_soc_dts_iosf.c       | 13 +++++--------
>  drivers/thermal/intel/x86_pkg_temp_thermal.c     |  4 ++--
>  drivers/thermal/k3_bandgap.c                     |  2 +-
>  drivers/thermal/k3_j72xx_bandgap.c               |  2 +-
>  drivers/thermal/kirkwood_thermal.c               |  2 +-
>  drivers/thermal/max77620_thermal.c               |  2 +-
>  drivers/thermal/mediatek/auxadc_thermal.c        |  2 +-
>  drivers/thermal/mediatek/lvts_thermal.c          |  4 ++--
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c         |  4 ++--
>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c      |  4 ++--
>  drivers/thermal/qoriq_thermal.c                  |  2 +-
>  drivers/thermal/rcar_gen3_thermal.c              |  4 ++--
>  drivers/thermal/rcar_thermal.c                   |  3 +--
>  drivers/thermal/rockchip_thermal.c               |  4 ++--
>  drivers/thermal/rzg2l_thermal.c                  |  2 +-
>  drivers/thermal/samsung/exynos_tmu.c             |  4 ++--
>  drivers/thermal/spear_thermal.c                  |  8 ++++----
>  drivers/thermal/sprd_thermal.c                   |  2 +-
>  drivers/thermal/sun8i_thermal.c                  |  2 +-

=46or sun8i_thermal:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/thermal/tegra/tegra-bpmp-thermal.c       |  6 ++++--
>  drivers/thermal/tegra/tegra30-tsensor.c          |  4 ++--
>  drivers/thermal/thermal-generic-adc.c            |  2 +-
>  drivers/thermal/thermal_core.c                   |  6 ++++++
>  drivers/thermal/thermal_mmio.c                   |  2 +-
>  .../thermal/ti-soc-thermal/ti-thermal-common.c   |  4 ++--
>  drivers/thermal/uniphier_thermal.c               |  2 +-
>  include/linux/thermal.h                          |  7 +++++++
>  53 files changed, 102 insertions(+), 91 deletions(-)




