Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B67C7EE2F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 07:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EhiYOnsYcT5eT162fH50ozvyNeO9MUK81ojzqXqppDY=; b=WwOfXiCF96L4Rcs+fkgdw+mOEq
	SNZiscFylN3F1tjrpUjZYdTcXHD5JF1U7mTZV+N5gcnHhA6uGEIlalhvuEGDzoWU8Z17YrZfxWrlX
	1K+8rfXSWcATeeSmk3uhWaWY93lbNfHEh1rC6pufptqs1BlcZofYXueJ4ieFJX2G4+ZHZBChamLJm
	ByVMnpVLNMP/7ov704l2sVUTuBeBf6d3K1hyQsjnIGLgLmF/inKzw5ybtnqKaa0SOTl5AYDcSWAGw
	Rsf6kWuXwGufkzpI4l9dPlEu9OcE08s1dePGA4/sSWtGmHLSybHaru+ZRA5tSdfQNoF0V4yw8mXU7
	GstrCItA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tXP-00CgOR-1d;
	Tue, 30 May 2023 07:12:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tXC-00CgHn-31;
	Tue, 30 May 2023 07:12:48 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f6077660c6so26617735e9.0;
        Tue, 30 May 2023 00:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685430756; x=1688022756;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EhiYOnsYcT5eT162fH50ozvyNeO9MUK81ojzqXqppDY=;
        b=U83neCvrC1S8vKrCVu6eew6hp0L1KaCWdX+0LE6hOcZvfUkVF3y9EJvWzgJDTtj4Ed
         n4M3B8h4PCfuB2DdbM9zErpdK8206Dx8woGg27lb5kyuDd/yMjCclmDFb0stcl5A9UWr
         uxU4I0ObOSXW2BlMzr/L3HliTb6Cer24nlCyqV0T+CnIdOsQjgUMkP7IPCKsZtOZsven
         MTAhXEPrXhWWSAcCb6ySl6h7wipC2u9xKdiHnTDlgEtdSX6H2QLJ+9zxe03Pg7faC1AA
         1mb7c6alVJYHJJMUl5DqFW6S6/Wq8djM9+m2qXbk+Kd4QkPOn9ybxBr/AGWSu9KE7WP9
         kDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685430756; x=1688022756;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EhiYOnsYcT5eT162fH50ozvyNeO9MUK81ojzqXqppDY=;
        b=UyaHEOxAVxFokK4mlnJkNr0Z/UYWboPLgjle2mUVakuWdBZuBoAMEvoUuvWM69kfCC
         Jsl7czV94JkQqCLCPmJq9R5hKWByeAJXrYi40CGcJtP3o9gcD2qUS5CQ9TfdGD/3kbdA
         dXbgTy49Cwocb3+UyEGNMAqzpXwUn7Vxhic9GbPCbSYt35UQ/9p+HQz5Ds1ZYM/w3yMO
         0XEj1lO+vCsIhsoWv9uA4ervyeJnYLe4uOrl1Yi6PK09kxpm3ZY0ctDXfSrAU7w8SBmT
         Un8xbApmG9/M60Tbo1FUs9/uI5GlUlfpYqJVLk7KpY8XF2Iz+VyU1B4oURjy1tcGWFeH
         3ZFA==
X-Gm-Message-State: AC+VfDwgGB/KzhG5A4/brBJBEFL9Y3coXJhAmjfKXAX+ZcZb2CBjJu4g
	tysysonkS6qscG88zDb+IKM=
X-Google-Smtp-Source: ACHHUZ4TXP7FM+FJLQx0g9zOkQnADdQ6DuE8ZawqR+xzm9uue4UInlabGeS+fHbG8n0MP2sy32jqHg==
X-Received: by 2002:a05:600c:21c7:b0:3f5:176:c398 with SMTP id x7-20020a05600c21c700b003f50176c398mr809351wmj.31.1685430756217;
        Tue, 30 May 2023 00:12:36 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id 24-20020a05600c021800b003f080b2f9f4sm19926196wmi.27.2023.05.30.00.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 00:12:34 -0700 (PDT)
Message-ID: <34d3298c-7d50-468b-b8e6-36440ccc0790@gmail.com>
Date: Tue, 30 May 2023 09:12:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 3/5] thermal/drivers/mediatek/lvts_thermal: Add mt8192
 support
Content-Language: en-US, ca-ES, es-ES
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com,
 rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, wenst@chromium.org, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com, nfraprado@collabora.com, abailon@baylibre.com,
 amergnat@baylibre.com, khilman@baylibre.com
References: <20230529164605.3552619-1-bero@baylibre.com>
 <20230529164605.3552619-4-bero@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230529164605.3552619-4-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_001246_973957_6F70A665 
X-CRM114-Status: GOOD (  17.43  )
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



On 29/05/2023 18:46, Bernhard Rosenkränzer wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add LVTS Driver support for MT8192.
> 
> Co-developed-by : Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

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

