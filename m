Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B54DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Mar 2022 09:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G+oz1ykhflmkeImaGMGXxtK2DhEgIhcQW+gpGEZAAPg=; b=Yog6OlmmgMcJBE
	M42ge0pcMsgwMy8IVFQoA75DVNH3zg3HbZYxpD2ckkhKDkLbCreTJAhvtbAcN+BF9e6FYJK+VBoHp
	ii8oRSta+O80g/SFbUP9BMpQjWffSLzqkjOOXnHAJVQlBgyJ7itrvUZX9rAfsj7l5ykK0KGANsWPm
	0gfoPIWH/D+e6ZyyP/JolLG8nNKKH9o5rNfEa7AkdTMpKsMXq89LObeUKN5FJrwJ6yviHsoThJ5L3
	NIXEmYxZfy7kOzd7TMhr6xIXlSMJ+EUS1IqBrvsq9KRyKrU/cLLhKT0SaRMf7swszegCUWz0gsodX
	gyvaMP8eJkyA4ZaoGqoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRsyL-007zV2-V7; Wed, 09 Mar 2022 09:51:09 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRsy8-007zPy-2b; Wed, 09 Mar 2022 09:50:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id F045F1F44798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646819453;
 bh=Wxi2sPEPW5Mnk1KFkrXeTYYuHUNi8Vd22+lhClnt9yg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XoouHc4xb1hLBRzEuSR0otwFxeo0/dtS24PFfocvqliUbmifiwlWmilMW1F5xbZtL
 Ke+zsplmmO7P62nx1fHPa7z5Relc93XNgn62Sq1fifTuPrjAoR2wP/nSeAobGf44Oq
 nUrL8OkMaBu92poQZWpL8f6rtrvCjn3n/bHJLOQMaWf7/jRttizKxTN4Ev3Jg8Ce5X
 knRCIpHV5uNaG+KUEwFYVNPNwaps29PFFUGfQxXMAkxQ3pG3p4USUh7zoJb1GzNyJf
 qpQwD31fb8+SidbyH+Lcp++Np0F3t889m+tmm+ZlefCtH5xKBXAJ7zt/in1QzaueOV
 FuSPkIixwVLbg==
Message-ID: <affb2499-d0c8-9f8f-bfc0-3bf8b2fa431c@collabora.com>
Date: Wed, 9 Mar 2022 10:50:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] mmc: mtk-msdc: change a log level
Content-Language: en-US
To: Alexandre Bailon <abailon@baylibre.com>, chaotian.jing@mediatek.com,
 ulf.hansson@linaro.org, matthias.bgg@gmail.com
Cc: linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220308094924.2868042-1-abailon@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220308094924.2868042-1-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_015056_328186_DE115C45 
X-CRM114-Status: GOOD (  16.83  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 08/03/22 10:49, Alexandre Bailon ha scritto:
> We write data to RPMB, we get many time the following log:
> mtk-msdc 11230000.mmc: phase: [map:ffffffff] [maxlen:32] [final:10]
> 
> dev_info is used to print that log but it seems that log is only
> useful for debbuging. Use dev_dbg instead of dev_info.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>

Hello Alexandre,

I definitely agree with this change, but the commit title is not clear enough;
can you please change it to something like

mmc: mtk-sd: Silence delay phase calculation debug log


After the change,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/mmc/host/mtk-sd.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index d5a9c269d492..05c8b4de46f3 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1914,8 +1914,8 @@ static struct msdc_delay_phase get_best_delay(struct msdc_host *host, u32 delay)
>   		final_phase = (start_final + len_final / 3) % PAD_DELAY_MAX;
>   	else
>   		final_phase = (start_final + len_final / 2) % PAD_DELAY_MAX;
> -	dev_info(host->dev, "phase: [map:%x] [maxlen:%d] [final:%d]\n",
> -		 delay, len_final, final_phase);
> +	dev_dbg(host->dev, "phase: [map:%x] [maxlen:%d] [final:%d]\n",
> +		delay, len_final, final_phase);
>   
>   	delay_phase.maxlen = len_final;
>   	delay_phase.start = start_final;
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
