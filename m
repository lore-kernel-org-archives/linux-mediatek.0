Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC80C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 12:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V6gi4tEb+3/WAgTZFkwQBdtVc2Yet6kuGCXPw7I0NPA=; b=iio2o3PjoBK8Pj
	OLoHya3c2eZKjYblALLXZiPysfrJtCzZigQok+IACBA2fJDXqTTGbWH1l3eGcTEKSQ1pZ0Twl25uK
	f91HYmld6ggoLU45kwdODuHWLIpMMcsWGtiNaFseAHa43MIleeX/sn/mgI3Ak/1kBVLOLMpM+oNAd
	nY89PVvpxKSR9H32vY6QSsaAHGRsuo22VKf/SXqXmrOAYOZcCdpuNVqDdJU1xjDO9XM+eNBTKioDN
	oa+78WVFn0sopSY0jn5og6GRke9wj6rwVee6rPxjXgrfku7DwZ62QG3ZVvfLGUEF77v6s8+7vHWXl
	lLRdkqwxmKzhx4sRfG0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrIaS-001xLv-4k; Wed, 18 May 2022 12:15:32 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrIaD-001wwr-R2; Wed, 18 May 2022 12:15:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C929E1F45027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652876116;
 bh=FtVu2AuXw/AthOSnF4m9ZOeWkCS8FD3CfCIxTGildz4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aW57lKMy568QDyibKHFp8KIuYtoEcTU9ZlysDg7TgOISJeQkR21ZzG6i6rm7EdkXp
 imamVhyO/QUhVa/GJhgXyfjHbhKOAWr7n0NB13CmQGEkiW6E8fmUXOy3Rl0Mc7A01I
 dUeRGME6DL6YM55g6xEdzyawSTicaFE99npv3YmHrfNlSDiqE32AIrR2uu6uO8ZE1C
 sC1bgLitM8tZY4IOPt1yeCXAtgs6YIG6WBneFohHm2TH9xUuQPXOsUbjE+qARBVU4l
 5tHC/JSN11roernrhQW2ggVmJnnDtWG3KVXUhO9RhmT+9G1lN04eNRIvS0EUkNSUo9
 pAkVqgogKF3jw==
Message-ID: <ead37cb0-c841-df1a-ca10-a396b5e9951c@collabora.com>
Date: Wed, 18 May 2022 14:15:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] clk: mediatek: Fix unused 'ops' field in mtk_pll_data
Content-Language: en-US
To: Boris Lysov <arz65xx@gmail.com>, arzamas-16@mail.ee,
 mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
 wenst@chromium.org, miles.chen@mediatek.com
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220515122409.13423-1-arzamas-16@mail.ee>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220515122409.13423-1-arzamas-16@mail.ee>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_051518_075769_5B995528 
X-CRM114-Status: GOOD (  25.80  )
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

Il 15/05/22 14:24, Boris Lysov ha scritto:
> From: Boris Lysov <arzamas-16@mail.ee>
> 
> Allow to specify optional clk_ops in mtk_pll_data which will be picked up in
> mtk_clk_register_pll. So far no already supported Mediatek SoC needs
> non-default clk_ops for PLLs but instead of removing this field it will be
> actually used in the future for supporting older SoCs (see [1] for details)
> with quirky PLLs.
> 

Hello Boris,

I disagree about this change and would rather see the ops pointer removed
with fire.

I got that you're trying to do something about "quirky PLLs", but is it
really about the PLLs that you're mentioning being "quirky", or are they
simply a different IP?

Also, if it's just about a bit inversion and a bigger delay:
1. Bigger delay: Depending on how bigger, we may simply delay more by default
    for all PLLs, even the ones that aren't requiring us to wait for longer...
    ...after all, if it's about waiting for 10/20 *microseconds* more, that's
    really not going to affect anyone's UX, nor make things slower for real,
    as the .prepare() ops for MediaTek PLLs are seldom called.. and even if
    that wasn't true, I don't think that a total of 30uS would be that much
    detrimental to the system's overall operation latency.
    Besides, if you see a case of a PLL not just switching on and off, but
    preparing and unpreparing continuously, there must be some big issue in
    some driver, or in the clock framework somewhere (and that ain't the case);

2. Bit inversion: that can be solved simply with a flag in the prepare/unprepare
    ops for this driver... and if you want something that performs even better,
    sparing you a nanosecond or two, you can always assign an "inverted" callback
    for managing that single bit;

3. Different IP: mtk_clk_register_(name-of-the-new-ip)_pll() - I don't think that
    there's anything to explain to that one.

Regards,
Angelo

> This patch depends on series "clk: mediatek: Move to struct clk_hw provider
> APIs" [2] by Chen-Yu Tsai.
> 
> [1] https://lists.infradead.org/pipermail/linux-mediatek/2022-February/035093.html
> [2] https://lists.infradead.org/pipermail/linux-mediatek/2022-May/040921.html
> 
> Signed-off-by: Boris Lysov <arzamas-16@mail.ee>
> ---
>   drivers/clk/mediatek/clk-pll.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> index cabdf25a27f3..509959a325f0 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -347,7 +347,10 @@ static struct clk_hw *mtk_clk_register_pll(const struct mtk_pll_data *data,
>   
>   	init.name = data->name;
>   	init.flags = (data->flags & PLL_AO) ? CLK_IS_CRITICAL : 0;
> -	init.ops = &mtk_pll_ops;
> +	if (data->ops)
> +		init.ops = data->ops;
> +	else
> +		init.ops = &mtk_pll_ops;
>   	if (data->parent_name)
>   		init.parent_names = &data->parent_name;
>   	else
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
