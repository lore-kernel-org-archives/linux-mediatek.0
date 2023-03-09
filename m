Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F0EC64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 11:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8FFJb+pXQiKRO9zlIUlDVOryGoXBUsjdWw4F0s1t44=; b=l8e9dZQwCPmsGDLab4JX/toO7z
	43WiI8N2mZE5d/qvFNWZLhSPYxvW1qhpBZcV3aWzTJ+dAGkvl3uLjfK70g6atuK2ia7/ioqrVVEJy
	DsmWq0Xu8jyBoaNttIw/BHRalFhrPuOIV6aJHSLXg4NTH62v1RsnxrwXW+ihhQbnTEd4Hxt5ad4w/
	Ri9O61Q1j+Hp5VlpqYHePfyiQs/XfelITNrN/afspj6F8bMqylg9+9kfE2QlM/kqXoTONUCV2qglV
	pVHW7RISx9indWEuPOJ5jldXY9NREtLL+k6i0rb5yah12MHAwR8tJQpdEWBZlpRP2900suz1JFTiF
	w/OJVvxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEM7-009S94-PL; Thu, 09 Mar 2023 11:22:43 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paE0n-009Hm5-6U; Thu, 09 Mar 2023 11:00:42 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7291966003B0;
	Thu,  9 Mar 2023 11:00:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678359639;
	bh=JSM/onmWuhsexsFzCDi5hXyjmL/ZSFGnsUuxT22kfWE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TQ6Lq21YiAfNab+c89pa21k1sdmo3xUJRRYLVOSzNj+c0rkQd6hMO7tynBI/n5G6E
	 nVHYV+T39fNBe8xFMTV6SgRcQbpVbecSXKoCV5afjiXCH/jFAaK30MSnwlP5XRYGVZ
	 5BAIVZaZOG2V0lNw+zYGG80SZm8vui4t0HvVrtfYSZQi9h+eEw/0CxY3U9e3IKsd1+
	 ZHOgokNODgppRwU0phhJuVjS7SRdThHsIhoXlgQlbyx1f6GhjHht7t5SEgfaxDqu6w
	 AQCYKqRxJhDmRWOThdzApG6NKH5SUWq6XnFHedseQktdAr6xqNHZxgfUZ3tMOmIh0i
	 //oswa6ygrQ4A==
Message-ID: <8d845834-db8f-be0e-93a4-30f27617dd0c@collabora.com>
Date: Thu, 9 Mar 2023 12:00:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] spi: mt65xx: Properly handle failures in .remove()
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-spi@vger.kernel.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230309094704.2568531-1-u.kleine-koenig@pengutronix.de>
 <20230309094704.2568531-2-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230309094704.2568531-2-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_030041_400375_0EBF7F9A 
X-CRM114-Status: GOOD (  22.06  )
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

Il 09/03/23 10:47, Uwe Kleine-König ha scritto:
> Returning an error code in a platform driver's remove function is wrong
> most of the time and there is an effort to make the callback return
> void. To prepare this rework the function not to exit early.
> 
> There wasn't a real problem because if pm runtime resume failed the only
> step missing was pm_runtime_disable() which isn't an issue.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/spi/spi-mt65xx.c | 21 +++++++++++++--------
>   1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
> index 9eab6c20dbc5..b1cf7bbb2c08 100644
> --- a/drivers/spi/spi-mt65xx.c
> +++ b/drivers/spi/spi-mt65xx.c
> @@ -1275,15 +1275,20 @@ static int mtk_spi_remove(struct platform_device *pdev)
>   	struct mtk_spi *mdata = spi_master_get_devdata(master);
>   	int ret;
>   
> -	ret = pm_runtime_resume_and_get(&pdev->dev);
> -	if (ret < 0)
> -		return ret;
> -
> -	mtk_spi_reset(mdata);
> +	ret = pm_runtime_get_sync(&pdev->dev);

> +	/*
> +	 * If pm runtime resume failed, clks are disabled and unprepared. So
> +	 * don't access the hardware and skip clk unpreparing.
> +	 */

This comment is counter-intuitive: you're saying in words "if this failed" but
in code "if this didn't fail".

Please, either invert the branch so that it looks either like

/* if negative */
if (negative) warn
else /* positive */

or like

if (ret >= 0) {
	do_things()
} else {
	/* if it failed ... */
	warn
}

Functionally, though, looks good to me.

Cheers,
Angelo


