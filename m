Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C12C04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 09:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qu02L3ngEBnLc9dEXQC/1TM0t4c6SP/t7lXHXTw9NdY=; b=YWxfy9EDkMbraL1gPQ1nV9d4HW
	Cgez+cL6JKguQff9P+DM8Z9qmxKpBS+I8pOUWzBKo6WpsvpJrkKJMb7cmFGsbLxGt8fCAOM1Pl5P3
	fuGim30MuA2QGXGZkrFa7qsEumz/qTOOGCpd+xQc0gP3IaWaE7bXoCidxyXa4M5Fvo+XoOLN7rHvB
	UlbDawTaabOzlmy8pQsprjpvobdnMOXlY8s5Y1rlaxsAylswl3jjUUMU8jIrjJ0XvmT9z62J2KPm3
	BaWNM7hrwITkB3XzQfqvVzEsDDhIZSPEWhm6KDqs1x/X4VBcpvQVreKkK3P7HcOlrEoAjrTjJ54zv
	Dp09QAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdXh-00BuAN-Ox; Wed, 27 Jul 2022 09:41:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdX7-00BtmU-Sq; Wed, 27 Jul 2022 09:40:51 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 10CA36601B25;
	Wed, 27 Jul 2022 10:40:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658914848;
	bh=/tSZBVIuOPVrLZ+Pv9GixCN2b9o+Bbox7JHQmveYKn8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CnEUNxM6sH6Za9eS1dGCEiIZSFE/trQz92dIdRmswdczzZpDwPMWmdd82JkLXKQg9
	 d8f1SHZUhha6hjj+c8J9uN97ZVzKs4nxdHNhIfA3m0lDqb1FCpKhADcsO5NK0zWFqE
	 Ko2FK6RAi31qvCOZ7keaareHRzTGqP/+Pl/Lk6SSvCbeFplKoNWh1D9auuQ0IFBWnw
	 OldnTeHWmkfh0MEk6WaS3oPRH4rtP8ev+uvGXd/6kBXOgMVku/rSKQVZTW0TGa8hKd
	 TWI3y1DXPAjxBmzAeVhPfHXyC2Er4retswk8r2bkOWDG9bVQ+i3WSAw42Wk5oFy+Mm
	 g/BZP4RD41UkA==
Message-ID: <ce46e9b2-8e34-b6cd-d802-35b3ae66e02d@collabora.com>
Date: Wed, 27 Jul 2022 11:40:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v15 07/11] drm/mediatek: Add retry to prevent misjudgment
 for sink devices
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
Cc: msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com,
 wenst@chromium.org, ck.hu@mediatek.com, liangxu.xu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220727045035.32225-1-rex-bc.chen@mediatek.com>
 <20220727045035.32225-8-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220727045035.32225-8-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_024050_146624_116ABCED 
X-CRM114-Status: GOOD (  22.38  )
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

Il 27/07/22 06:50, Bo-Chen Chen ha scritto:
> For some DP dungles, we need to train more than onece to confirm that we
> don't misjudge the status of sink device.

Please fix the typos in your commit title and description.
title: misjudgment -> misjudgement
desc: dungles->dongles; onece->once

> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dp.c | 21 ++++++++++++++++++---
>   1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index ce817cb59445..80d7d6488105 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -42,6 +42,7 @@
>   #define MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT 3
>   #define MTK_DP_TBC_BUF_READ_START_ADDR 0x08
>   #define MTK_DP_TRAIN_DOWNSCALE_RETRY 8
> +#define MTK_DP_TRAIN_CLEAR_RETRY 50
>   
>   struct mtk_dp_train_info {
>   	bool tps3;
> @@ -1431,11 +1432,25 @@ static int mtk_dp_video_config(struct mtk_dp *mtk_dp)
>   
>   static int mtk_dp_training(struct mtk_dp *mtk_dp)
>   {
> +	short max_retry = MTK_DP_TRAIN_CLEAR_RETRY;
>   	int ret;
>   
> -	ret = mtk_dp_train_start(mtk_dp);
> -	if (ret)
> -		return ret;
> +	/*
> +	 * We do retry to confirm that we don't misjudge the sink status.
> +	 * If it is still failed, we can confirm there are some issues for the
> +	 * sink device.
> +	 */
> +	do {
> +		ret = mtk_dp_train_start(mtk_dp);
> +		if (!ret)
> +			break;
> +	} while (--max_retry);
> +
> +	dev_info(mtk_dp->dev, "dp training clear retry times: %d\n",
> +		 MTK_DP_TRAIN_CLEAR_RETRY - max_retry);

dev_dbg() here.

...after which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +
> +	if (!max_retry)
> +		return -ETIMEDOUT;
>   
>   	ret = mtk_dp_video_config(mtk_dp);
>   	if (ret)


