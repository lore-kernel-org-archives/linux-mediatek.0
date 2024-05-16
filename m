Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9600C25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 May 2024 09:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPaLwBA3pYm8v6QU7KqOj6WBMgQZi+fj1uTzlIRRqXw=; b=bB7hu6WuU+V9arfN/ky+3yiDFP
	eRmAHgCtCpi4uJUH3+Oc7fhT3ZooQsWYjPAgZM/py6Y48r7isVU5zes2ZwlEAl3pxpQyFBNUdf8Xg
	lHQIC1AKVM9vJ+23vYbOOwXwaLHksP5YCcularMPdoijBQHyoQzyYFxEJ2Dv0ayWzdTt8zGFGZ9M0
	LA27hjAi6F85QizJWm/3TkBPEDVUCklTp6dgb9rZrvubDszctrwVdBmp0+0lZXx6vWsvhis4E3wCN
	7lUJsm2GMyLVep7NO5moTV9U8U320oPPhWPS6PCI+A4Kjoyixp+N9BMIxqe6B1h3mS4+gu4h26vVo
	+sY59u/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7X6U-00000004GM4-3B4E;
	Thu, 16 May 2024 09:08:46 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7X6Q-00000004GKu-1zsp;
	Thu, 16 May 2024 09:08:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715850519;
	bh=vAvIJTNsbVbIUiKWdSGN2T4HDQRkXCi7vBZQDlnrV20=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=1qmPN4MSogKM726TEtrCF4Tayjl4D9lGv8cUo9U3gjtBt4iuHPC4vUOcHtcVtC7LL
	 kZ2tPsVVIjSqzQMLT+QkQPfI6+vPhn41A+iKsCfqm3PVa62heoQ/5xCzeu6jHJ6y3G
	 xDopWBQ/hLf/EAD4n6TM+jLLuPAxs19y3tKU86/FFeJe7g8q7Z5DH5NZAQ+T2/Gal+
	 VHs+vNfktYstW1sLm9wglPx1XzgUY0ffpKw12A5apzywF5U+UWLyC50QxeWF9M2AHe
	 KE1gjqOyoCVi20JlkHRQTxkCk8HktQYfhVqRxyRb1BHAmM3Hsaxz0gMlBGFSdjHCDH
	 5NKeFVye9ny3Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3FD18378218B;
	Thu, 16 May 2024 09:08:39 +0000 (UTC)
Message-ID: <f0a59da9-7b1a-4a11-bc3e-e39c9fa4e3bd@collabora.com>
Date: Thu, 16 May 2024 11:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Remove filtered
 mode for mt8188
To: Julien Panis <jpanis@baylibre.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Pitre <npitre@baylibre.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240515-mtk-thermal-mt8188-mode-fix-v1-1-e656b310b67f@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240515-mtk-thermal-mt8188-mode-fix-v1-1-e656b310b67f@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_020842_738669_A37427D5 
X-CRM114-Status: GOOD (  14.14  )
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

Il 15/05/24 17:03, Julien Panis ha scritto:
> Filtered mode is not supported on mt8188 SoC and is the source of bad
> results. Move to immediate mode which provides good temperatures.
> 
> Signed-off-by: Julien Panis <jpanis@baylibre.com>

Please add the relevant Fixes tag, after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> Filtered mode was set by mistake and difficulties with the test setup
> prevented from catching this earlier. Use default mode (immediate mode)
> instead.
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 0bb3a495b56e..82c355c466cf 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -1458,7 +1458,6 @@ static const struct lvts_ctrl_data mt8188_lvts_mcu_data_ctrl[] = {
>   		},
>   		VALID_SENSOR_MAP(1, 1, 1, 1),
>   		.offset = 0x0,
> -		.mode = LVTS_MSR_FILTERED_MODE,
>   	},
>   	{
>   		.lvts_sensor = {
> @@ -1469,7 +1468,6 @@ static const struct lvts_ctrl_data mt8188_lvts_mcu_data_ctrl[] = {
>   		},
>   		VALID_SENSOR_MAP(1, 1, 0, 0),
>   		.offset = 0x100,
> -		.mode = LVTS_MSR_FILTERED_MODE,
>   	}
>   };
>   
> @@ -1483,7 +1481,6 @@ static const struct lvts_ctrl_data mt8188_lvts_ap_data_ctrl[] = {
>   		},
>   		VALID_SENSOR_MAP(0, 1, 0, 0),
>   		.offset = 0x0,
> -		.mode = LVTS_MSR_FILTERED_MODE,
>   	},
>   	{
>   		.lvts_sensor = {
> @@ -1496,7 +1493,6 @@ static const struct lvts_ctrl_data mt8188_lvts_ap_data_ctrl[] = {
>   		},
>   		VALID_SENSOR_MAP(1, 1, 1, 0),
>   		.offset = 0x100,
> -		.mode = LVTS_MSR_FILTERED_MODE,
>   	},
>   	{
>   		.lvts_sensor = {
> @@ -1507,7 +1503,6 @@ static const struct lvts_ctrl_data mt8188_lvts_ap_data_ctrl[] = {
>   		},
>   		VALID_SENSOR_MAP(1, 1, 0, 0),
>   		.offset = 0x200,
> -		.mode = LVTS_MSR_FILTERED_MODE,
>   	},
>   	{
>   		.lvts_sensor = {
> @@ -1518,7 +1513,6 @@ static const struct lvts_ctrl_data mt8188_lvts_ap_data_ctrl[] = {
>   		},
>   		VALID_SENSOR_MAP(1, 1, 0, 0),
>   		.offset = 0x300,
> -		.mode = LVTS_MSR_FILTERED_MODE,
>   	}
>   };
>   
> 
> ---
> base-commit: 82d92a9a1b9ea0ea52aff27cddd05009b4edad49
> change-id: 20240515-mtk-thermal-mt8188-mode-fix-e583d9a31da1
> 
> Best regards,


