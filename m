Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93340CD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 10:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLQbXGwtJnz9iLue5Wy+z1JPH+q+yPyB3yik9mruRQw=; b=KV+KRgUT8PUN2TVfibNHxqQ/Hc
	aCkucEtsLEtLrt1fgDbpyeKyGkf6zlKHDokLDsohT5O/KnUhejSelPrFHOBkgH+oSw3fp6z9hatEr
	pNFacmWIn/sMdiJpWUNh2Tf3jkU8U03tTe6Wqrpiw6CIHFjFe1A1z16lX6fRCR1YZI6IJYcGnD1PI
	q2drScIL+IdfV6OENZeCpGt6cpRtPvWOFJ1AaORE/sIawk+BiUIL7V+51sKoXUZN+UGx7gcQEApGM
	DuXN76sfLSL3lpb88xyfsm6OnIkURzfkeWC5n7OiKOW28OVQG5mQCYhyNQ7yF1OgmBwKQY30qGc2v
	Vd5akvCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruUrr-00000006JPs-0Bil;
	Wed, 10 Apr 2024 10:07:47 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruUrc-00000006JGu-1E90;
	Wed, 10 Apr 2024 10:07:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712743650;
	bh=L7YBVL+XZ2VzkgoJkD+hlJcRUOM0nGUw0aD6v+UvR1I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=zDaaLyvDnhGU8YvyVvaBf45X06tNM3lZGjEFYYBIDpNMabnM0jTsZhCK8AflDmL4c
	 yHIeqDvSrbvbTfqfKXBmGKi0FSHVCbipEoHLpFibLeZQHOij6FlNssiGUkc9ZPz7J/
	 A4zZfAakrVAHUiy3LG0M+vkQMLw5eHGJ3EVF50CVmwlmxPHJl7Gv8Dhw3XYpRGBz2O
	 lU10xT6RCwXVL6p0KwOQiCntzwh0CqueNZj1ZByppKOXx8Cs3WcANhKvanylO1MaDA
	 WXclW8oNrSmIJP3rkYtqfNbIYp+klkM8PxWHYDgHVO40inPr0YkgxiDpIJ4JjhCtvF
	 PKni27OE4To2w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AE18D37820E2;
	Wed, 10 Apr 2024 10:07:29 +0000 (UTC)
Message-ID: <30499665-4182-4241-86cd-1ec88c719072@collabora.com>
Date: Wed, 10 Apr 2024 12:07:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Add coeff for
 mt8192
To: Hsin-Te Yuan <yuanhsinte@chromium.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?=
 <bero@baylibre.com>, Balsam CHIHI <bchihi@baylibre.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240410-lvts_thermal-v1-1-ee50b29c1756@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240410-lvts_thermal-v1-1-ee50b29c1756@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_030732_803172_30BF8C47 
X-CRM114-Status: GOOD (  14.37  )
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

Il 10/04/24 12:06, Hsin-Te Yuan ha scritto:
> In order for lvts_raw_to_temp to function properly on mt8192,
> temperature coefficients for mt8192 need to be added.
> 
> Fixes: 288732242db4 ("thermal/drivers/mediatek/lvts_thermal: Add mt8192 support")
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index fd4bd650c77a6..6d226c3e135ca 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -80,6 +80,8 @@
>   #define LVTS_SENSOR_MAX				4
>   #define LVTS_GOLDEN_TEMP_MAX		62
>   #define LVTS_GOLDEN_TEMP_DEFAULT	50
> +#define LVTS_COEFF_A_MT8192			-250460
> +#define LVTS_COEFF_B_MT8192			250460

This is the same as LVTS_COEFF_{A,B}_MT8195, please just assign that to both
7988 and 8192's lvts_ap_data.

No need to create duplicate definitions.

Cheers,
Angelo

>   #define LVTS_COEFF_A_MT8195			-250460
>   #define LVTS_COEFF_B_MT8195			250460
>   #define LVTS_COEFF_A_MT7988			-204650
> @@ -1530,11 +1532,15 @@ static const struct lvts_data mt7988_lvts_ap_data = {
>   static const struct lvts_data mt8192_lvts_mcu_data = {
>   	.lvts_ctrl	= mt8192_lvts_mcu_data_ctrl,
>   	.num_lvts_ctrl	= ARRAY_SIZE(mt8192_lvts_mcu_data_ctrl),
> +	.temp_factor	= LVTS_COEFF_A_MT8192,
> +	.temp_offset	= LVTS_COEFF_B_MT8192,
>   };
>   
>   static const struct lvts_data mt8192_lvts_ap_data = {
>   	.lvts_ctrl	= mt8192_lvts_ap_data_ctrl,
>   	.num_lvts_ctrl	= ARRAY_SIZE(mt8192_lvts_ap_data_ctrl),
> +	.temp_factor	= LVTS_COEFF_A_MT8192,
> +	.temp_offset	= LVTS_COEFF_B_MT8192,
>   };
>   
>   static const struct lvts_data mt8195_lvts_mcu_data = {
> 
> ---
> base-commit: 20cb38a7af88dc40095da7c2c9094da3873fea23
> change-id: 20240410-lvts_thermal-3d365847acff
> 
> Best regards,


