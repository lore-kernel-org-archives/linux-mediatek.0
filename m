Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F49CCF9EA
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Oct 2025 10:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RH73zBVKuQkP3GCHlHab0zdB083Sd0sv+mvJjkV1Q6k=; b=NOJwyYmdeDoLCL
	kkTDCSzeLoymNlxoo3LO2lNQX0zjnmqDsBwSJtj+Ru+OSKzGZH8fRiqF/2ZSvtVl9fXT3kxVAmY6M
	9ZV57P5F6qK5rptlaNSHsgc69tV9VRoinly7qDQ8+zWGwMdtRjmES2JikHgQJFbkyFs8bdctyuU1j
	FZARZXmQ44JBU7P9df71xOxHW9RxJNxE8aN1LqUHJ0HudPKKydyB6cQiXMOUV0EA6AmtEHfkKuaWS
	VVM24p8EuSa+zqYgCTdPtCAz4zO3BU3X1DlRGYhdtih/e3phqYH033vBwePNflRaBqZLiO5dbA2Pg
	PIwr8QkINO96+7BCsuQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKjN-0000000DgRg-42wR;
	Mon, 27 Oct 2025 10:45:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKjK-0000000DgQ4-3kHl;
	Mon, 27 Oct 2025 10:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761561936;
	bh=Cnd+maDU7k3O40OcWpqyGgAGPEQpq+P5xfKyEVyrjBE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U45os+jLfd0887hvFUj71ZP2F31oUBAvFO+VEBMzsN7YaRJI5C3ZhpJModkXo0KS7
	 De8mnQ8zto8gBMm/3Vz8Ko8kjQ4N1naAgMKgkf8Q0tQPV6U1X1thK8DKCIOtpnuiXa
	 TjSPWMx0lKxDy8W66GclINLh808pkHfg0iqSaWfewF5GksELs+4bMlmBUbwxES2TNQ
	 uIBicZJ+PGDD8l7LQGdQsHYtM1Ac1MoyTXc9Ug2Z6Som06nV9CrqnMi8El3VrFj/HK
	 8Oon8dQxdpHrQOjNlcSe/PrtWjW84iP1YfHMu8p5t9sBQ4ZgUY2NpyP+9thD/aBRLv
	 p7wTvScjPHwxA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6D18717E0DC0;
	Mon, 27 Oct 2025 11:45:35 +0100 (CET)
Message-ID: <6f71b834-2b4d-48a8-be6f-1efdf0e78812@collabora.com>
Date: Mon, 27 Oct 2025 11:45:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] thermal/drivers/mediatek/lvts_thermal: Add SoC
 based golden Temp
To: Frank Wunderlich <linux@fw-web.de>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20251026122143.71100-1-linux@fw-web.de>
 <20251026122143.71100-5-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251026122143.71100-5-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_034539_116250_B6A0D7DB 
X-CRM114-Status: GOOD (  17.69  )
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
Cc: devicetree@vger.kernel.org, Mason Chang <mason-cw.chang@mediatek.com>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Balsam CHIHI <bchihi@baylibre.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 26/10/25 13:21, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add SoC based golden temp for invalid efuse data.
> 
> This is a preliminary patch for mt7987 support where goldentemp is
> slightly higher than other SOCs.
> 

I've found this "hack" required for all of the preproduction SoCs, as those are
usually unfused and/or missing at least some calibration parameters.

Are you using an early/preproduction/whatever SoC, or are you testing on a retail
board?

Regards,
Angelo

> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 9413b30f7b69..544941e8219a 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -134,6 +134,7 @@ struct lvts_data {
>   	int num_init_cmd;
>   	int temp_factor;
>   	int temp_offset;
> +	int golden_temp;
>   	int gt_calib_bit_offset;
>   	unsigned int def_calibration;
>   	bool irq_enable;
> @@ -811,8 +812,10 @@ static int lvts_golden_temp_init(struct device *dev, u8 *calib,
>   	gt = (((u32 *)calib)[0] >> lvts_data->gt_calib_bit_offset) & 0xff;
>   
>   	/* A zero value for gt means that device has invalid efuse data */
> -	if (gt && gt < LVTS_GOLDEN_TEMP_MAX)
> +	if (gt && gt <= LVTS_GOLDEN_TEMP_MAX)
>   		golden_temp = gt;
> +	else
> +		golden_temp = lvts_data->golden_temp;
>   
>   	golden_temp_offset = golden_temp * 500 + lvts_data->temp_offset;
>   
> @@ -1786,6 +1789,7 @@ static const struct lvts_data mt7988_lvts_ap_data = {
>   	.num_init_cmd	= ARRAY_SIZE(mt7988_init_cmds),
>   	.temp_factor	= LVTS_COEFF_A_MT7988,
>   	.temp_offset	= LVTS_COEFF_B_MT7988,
> +	.golden_temp	= LVTS_GOLDEN_TEMP_DEFAULT,
>   	.gt_calib_bit_offset = 24,
>   	.irq_enable = true, //SDK false
>   };
> @@ -1799,6 +1803,7 @@ static const struct lvts_data mt8186_lvts_data = {
>   	.num_init_cmd	= ARRAY_SIZE(default_init_cmds),
>   	.temp_factor	= LVTS_COEFF_A_MT7988,
>   	.temp_offset	= LVTS_COEFF_B_MT7988,
> +	.golden_temp	= LVTS_GOLDEN_TEMP_DEFAULT,
>   	.gt_calib_bit_offset = 24,
>   	.def_calibration = 19000,
>   	.irq_enable = true,
> @@ -1813,6 +1818,7 @@ static const struct lvts_data mt8188_lvts_mcu_data = {
>   	.num_init_cmd	= ARRAY_SIZE(default_init_cmds),
>   	.temp_factor	= LVTS_COEFF_A_MT8195,
>   	.temp_offset	= LVTS_COEFF_B_MT8195,
> +	.golden_temp	= LVTS_GOLDEN_TEMP_DEFAULT,
>   	.gt_calib_bit_offset = 20,
>   	.def_calibration = 35000,
>   	.irq_enable = true,
> @@ -1827,6 +1833,7 @@ static const struct lvts_data mt8188_lvts_ap_data = {
>   	.num_init_cmd	= ARRAY_SIZE(default_init_cmds),
>   	.temp_factor	= LVTS_COEFF_A_MT8195,
>   	.temp_offset	= LVTS_COEFF_B_MT8195,
> +	.golden_temp	= LVTS_GOLDEN_TEMP_DEFAULT,
>   	.gt_calib_bit_offset = 20,
>   	.def_calibration = 35000,
>   	.irq_enable = true,
> @@ -1841,6 +1848,7 @@ static const struct lvts_data mt8192_lvts_mcu_data = {
>   	.num_init_cmd	= ARRAY_SIZE(default_init_cmds),
>   	.temp_factor	= LVTS_COEFF_A_MT8195,
>   	.temp_offset	= LVTS_COEFF_B_MT8195,
> +	.golden_temp	= LVTS_GOLDEN_TEMP_DEFAULT,
>   	.gt_calib_bit_offset = 24,
>   	.def_calibration = 35000,
>   	.irq_enable = true,
> @@ -1855,6 +1863,7 @@ static const struct lvts_data mt8192_lvts_ap_data = {
>   	.num_init_cmd	= ARRAY_SIZE(default_init_cmds),
>   	.temp_factor	= LVTS_COEFF_A_MT8195,
>   	.temp_offset	= LVTS_COEFF_B_MT8195,
> +	.golden_temp	= LVTS_GOLDEN_TEMP_DEFAULT,
>   	.gt_calib_bit_offset = 24,
>   	.def_calibration = 35000,
>   	.irq_enable = true,
> @@ -1869,6 +1878,7 @@ static const struct lvts_data mt8195_lvts_mcu_data = {
>   	.num_init_cmd	= ARRAY_SIZE(default_init_cmds),
>   	.temp_factor	= LVTS_COEFF_A_MT8195,
>   	.temp_offset	= LVTS_COEFF_B_MT8195,
> +	.golden_temp	= LVTS_GOLDEN_TEMP_DEFAULT,
>   	.gt_calib_bit_offset = 24,
>   	.def_calibration = 35000,
>   	.irq_enable = true,
> @@ -1883,6 +1893,7 @@ static const struct lvts_data mt8195_lvts_ap_data = {
>   	.num_init_cmd	= ARRAY_SIZE(default_init_cmds),
>   	.temp_factor	= LVTS_COEFF_A_MT8195,
>   	.temp_offset	= LVTS_COEFF_B_MT8195,
> +	.golden_temp	= LVTS_GOLDEN_TEMP_DEFAULT,
>   	.gt_calib_bit_offset = 24,
>   	.def_calibration = 35000,
>   };


