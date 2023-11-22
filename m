Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65F3C61D97
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 11:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZiaBqNqVlXsHFKUILkwVCxKL2dg90m4Llgs5VWsMC84=; b=RTrhaWGjH/2jNoLiy9Q5J10sOV
	GdyGCLYz9Pas4XxyL/DlerQmozpG8KiIPpg1r2E0tolUbsvj+SCiLWt0wMOwnQpu8Q8mKsa4r/C0x
	3XqrJSrT1odZGTCTg5lsbJZ686UQksILHDDm2chbi87VZ6AOxh+Qj2tuxsWTTviW8zAH+/ZPOiQP3
	o9M/j8i+te+JOdY7Zxs16JEVtYMerE09Eq0Lp4KQPSxmyf7YzVxgzHtneU5yqSM8SmqHD0DQrBRQr
	wF6byisKqVaTqXhbqxOGKnXUTGoPyxsoNtl8BFF2RNZJyhp8KPc0sX38GwuTvXhGD0cZZS6/JEjmM
	wefkPZKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5lKv-001Xnl-2X;
	Wed, 22 Nov 2023 11:24:05 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5lKr-001Xlf-33;
	Wed, 22 Nov 2023 11:24:03 +0000
Received: from [100.94.55.57] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D77346601A70;
	Wed, 22 Nov 2023 11:23:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700652238;
	bh=5TmIolpcIPLP5N8rdAB8FNKOeqZ/zp/Ukqm30CHtAto=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ir9ccfWbmcCD4s03ppCs67f3x/yk+ABrqSSJQld+Xp89+HAzdOK+q2TQEGfBmXw6k
	 M9oDrpkHtJmxMAAwryZdb2bo6MTkb/GJ1aqgx2K/NxvwPj9jPdrwo9vOWzgPYLAamt
	 ThWOpEZksFuPF61y9l7+p5gBG+qGSQNKZ7Jh5bqHZSnLXUZvWkurbF4Y33Oj1u+XqN
	 aX++W1jsqmYlycvVWkTk21+oc29WPfJ2wdbHgJFnP5F4bfEywPeBwDhXP/V9rxrA2+
	 dwyHnwUetNoQkG3NFy5kkYUVRiqabi0zQGwu8Y7RhAXWD0VnnJv1Nmyft3rVORTAWj
	 py5Bk9JJNiblw==
Message-ID: <6018ec3f-d3e6-4fe0-b57f-9a7994f983a5@collabora.com>
Date: Wed, 22 Nov 2023 13:23:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/20] soc: mediatek: mtk-svs: Move t-calibration-data
 retrieval to svs_probe()
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 robh+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com, wenst@chromium.org
References: <20231121125044.78642-1-angelogioacchino.delregno@collabora.com>
 <20231121125044.78642-10-angelogioacchino.delregno@collabora.com>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20231121125044.78642-10-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_032402_268515_56BA7076 
X-CRM114-Status: GOOD (  24.68  )
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

On 11/21/23 14:50, AngeloGioacchino Del Regno wrote:
> The t-calibration-data (SVS-Thermal calibration data) shall exist for
> all SoCs or SVS won't work anyway: move it to the common svs_probe()
> function and remove it from all of the per-SoC efuse_parsing() probe
> callbacks.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/soc/mediatek/mtk-svs.c | 32 ++++++--------------------------
>   1 file changed, 6 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index ab564d48092b..1042af2aee3f 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -1884,11 +1884,6 @@ static bool svs_mt8195_efuse_parsing(struct svs_platform *svsp)
>   		svsb->vmax += svsb->dvt_fixed;
>   	}
>   
> -	ret = svs_get_efuse_data(svsp, "t-calibration-data",
> -				 &svsp->tefuse, &svsp->tefuse_max);
> -	if (ret)
> -		return false;
> -

Hello Angelo,

if you removed the code using `ret` in this patch, it makes sense to 
also remove the variable here instead of doing it in patch 18.
It will avoid unused variable warnings for this patch.


>   	for (i = 0; i < svsp->tefuse_max; i++)
>   		if (svsp->tefuse[i] != 0)
>   			break;
> @@ -1949,11 +1944,6 @@ static bool svs_mt8192_efuse_parsing(struct svs_platform *svsp)
>   		svsb->vmax += svsb->dvt_fixed;
>   	}
>   
> -	ret = svs_get_efuse_data(svsp, "t-calibration-data",
> -				 &svsp->tefuse, &svsp->tefuse_max);
> -	if (ret)
> -		return false;
> -
>   	for (i = 0; i < svsp->tefuse_max; i++)
>   		if (svsp->tefuse[i] != 0)
>   			break;
> @@ -2009,11 +1999,6 @@ static bool svs_mt8188_efuse_parsing(struct svs_platform *svsp)
>   		svsb->vmax += svsb->dvt_fixed;
>   	}
>   
> -	ret = svs_get_efuse_data(svsp, "t-calibration-data",
> -				 &svsp->tefuse, &svsp->tefuse_max);
> -	if (ret)
> -		return false;
> -
>   	for (i = 0; i < svsp->tefuse_max; i++)
>   		if (svsp->tefuse[i] != 0)
>   			break;
> @@ -2097,11 +2082,6 @@ static bool svs_mt8186_efuse_parsing(struct svs_platform *svsp)
>   		svsb->vmax += svsb->dvt_fixed;
>   	}
>   
> -	ret = svs_get_efuse_data(svsp, "t-calibration-data",
> -				 &svsp->tefuse, &svsp->tefuse_max);
> -	if (ret)
> -		return false;
> -
>   	golden_temp = (svsp->tefuse[0] >> 24) & GENMASK(7, 0);
>   	if (!golden_temp)
>   		golden_temp = 50;
> @@ -2198,11 +2178,6 @@ static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
>   		}
>   	}
>   
> -	ret = svs_get_efuse_data(svsp, "t-calibration-data",
> -				 &svsp->tefuse, &svsp->tefuse_max);
> -	if (ret)
> -		return false;
> -
>   	/* Thermal efuse parsing */
>   	adc_ge_t = (svsp->tefuse[1] >> 22) & GENMASK(9, 0);
>   	adc_oe_t = (svsp->tefuse[1] >> 12) & GENMASK(9, 0);
> @@ -3040,8 +3015,13 @@ static int svs_probe(struct platform_device *pdev)
>   
>   	ret = svs_get_efuse_data(svsp, "svs-calibration-data",
>   				 &svsp->efuse, &svsp->efuse_max);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Cannot read SVS calibration\n");

With the previous code, if svs-calibration-data could not be read, the 
code would go to svs_probe_free_efuse. In your case, it returns directly.
I believe that svs_get_efuse_data using nvmem_cell_read does not 
allocate the buffer for the efuse , hence no more need to free it ? The 
exit code is checking if it's ERR or NULL, but still, if the buffer was 
not allocated, it doesn't make sense to jump there indeed.
In that case, you are also changing the behavior here , and your commit 
appears to do more than a simple move.

> +
> +	ret = svs_get_efuse_data(svsp, "t-calibration-data",
> +				 &svsp->tefuse, &svsp->tefuse_max);
>   	if (ret) {
> -		ret = -EPERM;
> +		dev_err_probe(&pdev->dev, ret, "Cannot read SVS-Thermal calibration\n");
>   		goto svs_probe_free_efuse;

again in this case the tefuse has not been allocated I assume.

So previous code was a bit excessive in trying to free the efuse/tefuse ?

Eugen

>   	}
>   


