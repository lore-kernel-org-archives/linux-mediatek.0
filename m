Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847C7C77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 08:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C50tr76vLlOxRvpcvzGB6wTVvWWByjYksIRf2Hyt2vk=; b=P9mS4A+WcLWNcVZTEwjj5tGcRE
	0Q/EGszP/59UiXVDKsfWDJZLbum4/Ppqfva/zJ9keGB3pHTZ4zT99cJuIIoCtmSLvXpUXGEFFHMPU
	VSNSMhC/+8WIttdiYCXlySdpql6U0MOf9Wrsq6bv3+9wuPLyA5tugy7tkkcimdL2PS7NXiw5iShPb
	OqFrsRmpHHaiqygtWzTV0q0XZYBS+fHf+MDdQ2XCcY3erRIKQXs769Bufz3PlnwYP+IZINDcHViu4
	XYZLpf3949ncVhwpB7h7UKwNKt5qXKBpRJI4+VyAb3wMwOCbb2nsAaO7kscCkIyhb90BrsCNS5Aba
	+lF1w3bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GsA-00GZN5-07;
	Wed, 31 May 2023 08:07:58 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Gs6-00GZLy-2S;
	Wed, 31 May 2023 08:07:56 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0FC7A6605840;
	Wed, 31 May 2023 09:07:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685520473;
	bh=syibSnSgVW/WgKtMEucS9UFVkWbwc3QJ4w7wcrUGNe4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lGTUTiov8cdSlXACf27Y27u3DUVUgRr0kpNk+qIvvL+OolmBZtQ5wUXE+v3DjRU9O
	 vWfsHEwq/zp3+cCXfiHECRqp1uP39YNqAezjOLeQrHnrHYkVQzhnc55JK/gBGr95jw
	 7qBUfGooI++rwUhkA+1B80kDqk6jYZy3aWgYDqTi5vi7MTUaGsQuAfz7MrWjtp/F5t
	 bgNwAX3vYymrSOQMnz2ekb+i3RcXVcXbNyfwzZXb8BO5a+6RqQOj10kDxU0JV77vbT
	 CBMMXdTbwSMdNNmdRc52NwUdcM+u0c1T2XUO+1n+iQJUUb/qkSlOLvh/fG7gg/da7a
	 wEb3FxVeQmvWg==
Message-ID: <7acba6fc-e1f7-8711-cf4a-2c24b2ccaf36@collabora.com>
Date: Wed, 31 May 2023 10:07:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 3/5] thermal/drivers/mediatek/lvts_thermal: Add mt8192
 support
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 daniel.lezcano@linaro.org, rafael@kernel.org, amitk@kernel.org,
 rui.zhang@intel.com, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
 ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, wenst@chromium.org, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com, nfraprado@collabora.com, abailon@baylibre.com,
 amergnat@baylibre.com, khilman@baylibre.com
References: <20230530195132.2286163-1-bero@baylibre.com>
 <20230530195132.2286163-4-bero@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230530195132.2286163-4-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_010755_090625_B489F932 
X-CRM114-Status: GOOD (  18.51  )
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

Il 30/05/23 21:51, Bernhard Rosenkränzer ha scritto:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add LVTS Driver support for MT8192.
> 
> Co-developed-by : Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 95 +++++++++++++++++++++++++
>   1 file changed, 95 insertions(+)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 5ea8a9d569ea6..d5e5214784ece 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -80,6 +80,7 @@
>   #define LVTS_MSR_FILTERED_MODE		1
>   
>   #define LVTS_HW_SHUTDOWN_MT8195		105000
> +#define LVTS_HW_SHUTDOWN_MT8192		105000
>   
>   static int golden_temp = LVTS_GOLDEN_TEMP_DEFAULT;
>   static int coeff_b = LVTS_COEFF_B;
> @@ -1280,6 +1281,88 @@ static const struct lvts_ctrl_data mt8195_lvts_ap_data_ctrl[] = {
>   	}
>   };
>   
> +static const struct lvts_ctrl_data mt8192_lvts_mcu_data_ctrl[] = {
> +	{
> +		.cal_offset = { 0x04, 0x08 },
> +		.lvts_sensor = {
> +			{ .dt_id = MT8192_MCU_BIG_CPU0 },
> +			{ .dt_id = MT8192_MCU_BIG_CPU1 }
> +		},
> +		.num_lvts_sensor = 2,
> +		.offset = 0x0,
> +		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT8192,
> +		.mode = LVTS_MSR_FILTERED_MODE,
> +	},
> +	{
> +		.cal_offset = { 0x0c, 0x10 },
> +		.lvts_sensor = {
> +			{ .dt_id = MT8192_MCU_BIG_CPU2 },
> +			{ .dt_id = MT8192_MCU_BIG_CPU3 }
> +		},
> +		.num_lvts_sensor = 2,
> +		.offset = 0x100,
> +		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT8192,
> +		.mode = LVTS_MSR_FILTERED_MODE,
> +	},
> +	{
> +		.cal_offset = { 0x14, 0x18, 0x1c, 0x20 },
> +		.lvts_sensor = {
> +			{ .dt_id = MT8192_MCU_LITTLE_CPU0 },
> +			{ .dt_id = MT8192_MCU_LITTLE_CPU1 },
> +			{ .dt_id = MT8192_MCU_LITTLE_CPU2 },
> +			{ .dt_id = MT8192_MCU_LITTLE_CPU3 }
> +		},
> +		.num_lvts_sensor = 4,
> +		.offset = 0x200,
> +		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT8192,
> +		.mode = LVTS_MSR_FILTERED_MODE,
> +	}
> +};
> +
> +static const struct lvts_ctrl_data mt8192_lvts_ap_data_ctrl[] = {
> +		{
> +		.cal_offset = { 0x24, 0x28 },
> +		.lvts_sensor = {
> +			{ .dt_id = MT8192_AP_VPU0 },
> +			{ .dt_id = MT8192_AP_VPU1 }
> +		},
> +		.num_lvts_sensor = 2,
> +		.offset = 0x0,
> +		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT8192,
> +	},
> +	{
> +		.cal_offset = { 0x2c, 0x30 },
> +		.lvts_sensor = {
> +			{ .dt_id = MT8192_AP_GPU0 },
> +			{ .dt_id = MT8192_AP_GPU1 }
> +		},
> +		.num_lvts_sensor = 2,
> +		.offset = 0x100,
> +		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT8192,

I'm unable to get readings for the GPU sensors, didn't really check
the others; `cat (xxxx)` gives a resource not available error, is that
the same for you?!

Regards,
Angelo

> +	},
> +	{
> +		.cal_offset = { 0x34, 0x38 },
> +		.lvts_sensor = {
> +			{ .dt_id = MT8192_AP_INFRA },
> +			{ .dt_id = MT8192_AP_CAM },
> +		},
> +		.num_lvts_sensor = 2,
> +		.offset = 0x200,
> +		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT8192,
> +	},
> +	{
> +		.cal_offset = { 0x3c, 0x40, 0x44 },
> +		.lvts_sensor = {
> +			{ .dt_id = MT8192_AP_MD0 },
> +			{ .dt_id = MT8192_AP_MD1 },
> +			{ .dt_id = MT8192_AP_MD2 }
> +		},
> +		.num_lvts_sensor = 3,
> +		.offset = 0x300,
> +		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT8192,
> +	}
> +};
> +
>   static const struct lvts_data mt8195_lvts_mcu_data = {
>   	.lvts_ctrl	= mt8195_lvts_mcu_data_ctrl,
>   	.num_lvts_ctrl	= ARRAY_SIZE(mt8195_lvts_mcu_data_ctrl),
> @@ -1290,9 +1373,21 @@ static const struct lvts_data mt8195_lvts_ap_data = {
>   	.num_lvts_ctrl	= ARRAY_SIZE(mt8195_lvts_ap_data_ctrl),
>   };
>   
> +static const struct lvts_data mt8192_lvts_mcu_data = {
> +	.lvts_ctrl	= mt8192_lvts_mcu_data_ctrl,
> +	.num_lvts_ctrl	= ARRAY_SIZE(mt8192_lvts_mcu_data_ctrl),
> +};
> +
> +static const struct lvts_data mt8192_lvts_ap_data = {
> +	.lvts_ctrl	= mt8192_lvts_ap_data_ctrl,
> +	.num_lvts_ctrl	= ARRAY_SIZE(mt8192_lvts_ap_data_ctrl),
> +};
> +
>   static const struct of_device_id lvts_of_match[] = {
>   	{ .compatible = "mediatek,mt8195-lvts-mcu", .data = &mt8195_lvts_mcu_data },
>   	{ .compatible = "mediatek,mt8195-lvts-ap", .data = &mt8195_lvts_ap_data },
> +	{ .compatible = "mediatek,mt8192-lvts-mcu", .data = &mt8192_lvts_mcu_data },
> +	{ .compatible = "mediatek,mt8192-lvts-ap", .data = &mt8192_lvts_ap_data },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, lvts_of_match);



