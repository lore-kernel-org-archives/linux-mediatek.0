Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0164CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 08:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FyXcOD3oHM2u3CE040ChcV+n1Eh7pYa90Dt7bqOeGkg=; b=Aacq3SoNWD94zZInr4M0vwDNy6
	hkeUZgmjaQVamJHvQ/3cZHJOWt/S7gHYcaicl3SotmA3kWNVRBTNXga58uH0FjoJeHmC0QgF+AfgU
	POFEBVeJwJN7P+1cy3Rz0ol462JeuPwVpV4n2z/0Vvpogfuvu8D/f13gNdVDFzJjxhFo4TrSTimeZ
	8cLOscp+WWpArrPyvyD6TD7SJ8H3tfEIorcFPPYZ6/JG5sm7aNQUb5SJG5GZ8XCBwM1MjAiEC8QKR
	+Aj1BEVnAKaAe2mgDE4E2r/sTCvq8TmkfnalVTp7ENXSpbUriTJLmLTL15bLQQarCwXSJE3iNlMpa
	GHnKG6wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oERM1-002LwJ-Lc; Thu, 21 Jul 2022 08:16:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oERLp-002Llr-AV; Thu, 21 Jul 2022 08:16:07 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 37F8566019C1;
	Thu, 21 Jul 2022 09:16:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658391361;
	bh=+uro6du1jM5M4noaSgYgRc27Gam/1Je5qgKJlaUGw3E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KQVQhT6Yc7na1ehojhPFmDL6LAvIqD293jaoYW48/jtLurvY4/CuT2s4HYBbxeC0u
	 BSfzVXeX+qjChVMmr7GBDNvKMpE5tG7GUQOHWYWGaeJ+H1iCpMMckiIYwWlwev2KK9
	 kFuAPGPpYxedUOShBPOaGIYB/hdHOrp/Nmj5QGLNWDAvkNoqB0BvDoXU/upUysfb/0
	 2rAScxkwo22utlywvGDmmg8HHUYe4cofuvRASIDflpLQrsbn3aG0ALUhqcaUBtekbb
	 7q3Vm3ruvO2JzY1QPxEbLOjKd55sWa+7yAfiTkZRISPeTWlRnrRGpJ7YJDey7cxsO+
	 JTeISkn/Jf8LQ==
Message-ID: <c780f640-7112-1968-04d5-17e30c8e1cc2@collabora.com>
Date: Thu, 21 Jul 2022 10:15:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/4] thermal: mediatek: add support for MT8365 SoC
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>, matthias.bgg@gmail.com
Cc: rafael@kernel.org, fparent@baylibre.com, amitk@kernel.org,
 daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, robh+dt@kernel.org, rui.zhang@intel.com
References: <20220720181854.547881-1-aouledameur@baylibre.com>
 <20220720181854.547881-3-aouledameur@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220720181854.547881-3-aouledameur@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_011605_662460_D24CA806 
X-CRM114-Status: GOOD (  21.99  )
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

Il 20/07/22 20:18, Amjad Ouled-Ameur ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> MT8365 is similar to the other SoCs supported by the driver. It has only
> one bank and 3 actual sensors that can be multiplexed. There is another
> one sensor that does not have usable data.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Tested-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> ---
>   drivers/thermal/mtk_thermal.c | 68 +++++++++++++++++++++++++++++++++++
>   1 file changed, 68 insertions(+)
> 
> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> index ede94eadddda..216eb0d61c5b 100644
> --- a/drivers/thermal/mtk_thermal.c
> +++ b/drivers/thermal/mtk_thermal.c
> @@ -31,6 +31,7 @@
>   #define AUXADC_CON2_V		0x010
>   #define AUXADC_DATA(channel)	(0x14 + (channel) * 4)
>   
> +#define APMIXED_SYS_TS_CON0	0x600
>   #define APMIXED_SYS_TS_CON1	0x604
>   
>   /* Thermal Controller Registers */
> @@ -245,6 +246,17 @@ enum mtk_thermal_version {
>   /* The calibration coefficient of sensor  */
>   #define MT8183_CALIBRATION	153
>   
> +/* MT8365 */
> +#define MT8365_TEMP_AUXADC_CHANNEL 11
> +#define MT8365_CALIBRATION 164
> +#define MT8365_NUM_CONTROLLER 1
> +#define MT8365_NUM_BANKS 1
> +#define MT8365_NUM_SENSORS 3
> +#define MT8365_NUM_SENSORS_PER_ZONE 3
> +#define MT8365_TS1 0
> +#define MT8365_TS2 1
> +#define MT8365_TS3 2
> +
>   struct mtk_thermal;
>   
>   struct thermal_bank_cfg {
> @@ -386,6 +398,24 @@ static const int mt7622_mux_values[MT7622_NUM_SENSORS] = { 0, };
>   static const int mt7622_vts_index[MT7622_NUM_SENSORS] = { VTS1 };
>   static const int mt7622_tc_offset[MT7622_NUM_CONTROLLER] = { 0x0, };
>   
> +/* MT8365 thermal sensor data */
> +static const int mt8365_bank_data[MT8365_NUM_SENSORS] = {
> +	MT8365_TS1, MT8365_TS2, MT8365_TS3
> +};
> +
> +static const int mt8365_msr[MT8365_NUM_SENSORS_PER_ZONE] = {
> +	TEMP_MSR0, TEMP_MSR1, TEMP_MSR2
> +};
> +
> +static const int mt8365_adcpnp[MT8365_NUM_SENSORS_PER_ZONE] = {
> +	TEMP_ADCPNP0, TEMP_ADCPNP1, TEMP_ADCPNP2
> +};
> +
> +static const int mt8365_mux_values[MT8365_NUM_SENSORS] = { 0, 1, 2 };
> +static const int mt8365_tc_offset[MT8365_NUM_CONTROLLER] = { 0 };
> +
> +static const int mt8365_vts_index[MT8365_NUM_SENSORS] = { VTS1, VTS2, VTS3 };
> +
>   /*
>    * The MT8173 thermal controller has four banks. Each bank can read up to
>    * four temperature sensors simultaneously. The MT8173 has a total of 5
> @@ -460,6 +490,40 @@ static const struct mtk_thermal_data mt2701_thermal_data = {
>   	.version = MTK_THERMAL_V1,
>   };
>   
> +/*
> + * The MT8365 thermal controller has one bank, which can read up to
> + * four temperature sensors simultaneously. The MT8365 has a total of 3
> + * temperature sensors.
> + *
> + * The thermal core only gets the maximum temperature of this one bank,
> + * so the bank concept wouldn't be necessary here. However, the SVS (Smart
> + * Voltage Scaling) unit makes its decisions based on the same bank
> + * data.
> + */
> +static const struct mtk_thermal_data mt8365_thermal_data = {
> +	.auxadc_channel = MT8365_TEMP_AUXADC_CHANNEL,
> +	.num_banks = MT8365_NUM_BANKS,
> +	.num_sensors = MT8365_NUM_SENSORS,
> +	.vts_index = mt8365_vts_index,
> +	.cali_val = MT8365_CALIBRATION,
> +	.num_controller = MT8365_NUM_CONTROLLER,
> +	.controller_offset = mt8365_tc_offset,
> +	.need_switch_bank = false,
> +	.bank_data = {
> +		{
> +			.num_sensors = MT8365_NUM_SENSORS,
> +			.sensors = mt8365_bank_data
> +		},
> +	},
> +	.msr = mt8365_msr,
> +	.adcpnp = mt8365_adcpnp,
> +	.sensor_mux_values = mt8365_mux_values,
> +	.version = MTK_THERMAL_V1,
> +	.apmixed_buffer_ctl_reg = APMIXED_SYS_TS_CON0,
> +	.apmixed_buffer_ctl_mask = (u32) ~GENMASK(29, 28),
> +	.apmixed_buffer_ctl_set = 0,

Every commit has to build on its own.

This won't compile unless moved after 'thermal: mediatek: control buffer enablement
tweaks': please move it.

Regards,
Angelo


