Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B111FEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 04:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/roxKmTTLwXKdpyb1VvXj06OYWsR35/mqpHgEtMjLlQ=; b=Y/jzf31GyvLmq/Dwq7CL5It6VL
	KFgqbny4gts21/CsxJcNA1cyUqiH8ox+aMWrcTx77oQvToHTYZGStUcwMTFvyX1HkiZEHQEbkQ/gX
	uCVZVWio0Lc15QiEnQg5QhZfD/Vu6/2zqhVBzGAJR2P3/C4OuZMg8PTfq3xlH/egHHT2ki5tqHa8u
	vO0TgCeL4WxOgv0mxlLwCkwc0fy/6SRrOD7IIOCkLFVkn0ciDvJ8pcFU50/0rqZmwFWwgP/+EI06Z
	cF25xzhVLHH0Ngd9SRGHs662k4rvAx4lTy8oEgriDXUrQVJZHAwmYcMf4aPwQB+RYyoLNPy/7KGLT
	S+kGAbxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzFb-0055pe-2P;
	Wed, 19 Jul 2023 04:57:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzFZ-0055om-29;
	Wed, 19 Jul 2023 04:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/roxKmTTLwXKdpyb1VvXj06OYWsR35/mqpHgEtMjLlQ=; b=mC+8tF3NjHp32i3YGlNYkmUPWk
	TXe5HTbrlKmmGEuiL6KZA6ZGH4cRn60BdbQOljXnQDbxpGqbivQ87Pfuvlx4sWevAn1E2xFdbkoPL
	Osz2tjlv6u0KhFLyTZyCwu26CBVO3wNc1Ptd66DMYp895Zh4bzQqpXsFFgS+akbnksQEkm0RYg5ZM
	OutvUcqGokpc2zYXuFSnWauB5OGWAyV20GIWMqjZa3xlFomHy5ODuaWstYvaRsbeTfpZgAE82ZReO
	DcOHpuE1DPRyHNL//VCGuVDc3laZkZrDRqIsODFdOuQKXWv8bfPrsbMFpxCwghNXsabYyMzUPoxgZ
	SWwg8pvQ==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLhJ6-00BMvz-1o;
	Tue, 18 Jul 2023 09:47:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 792D1660704F;
	Tue, 18 Jul 2023 10:47:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689673662;
	bh=xlkvCFSIyUU/M7gkrwgIXP7wr6bqg7L/fte3NfnuGE4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kpNw5uiQpRxgVIR/cZolWOBcgtgrIh5Qjc90he0kMFkFvs1JnWQ4MgAnaw9HgDhan
	 J+x56N3uYtgBjZoxA6i5Ljwzng0/OHxWegzoPcveF0qv8BhdHpqkgHPswzycJ8Iu5j
	 mT96yOFMrX+tDz7Ezg7vg1tvSr/HmUSjZVHcUdslSvKmr3Pii+2u833Og6T+Wc831J
	 VMzRDzaw3bLI2vrqJdkM51ygFoAaf1KxokL046C2rSmYNJlztSwIdnQz9OHvYm9A7s
	 OtGccP6zdwc2De1Lh9M1fthZwYbRUsXKsL9+QPj0Cnewr3C3oiYOGpsZAw/cFTzJjP
	 F5bEbkHAJiFxw==
Message-ID: <64741cb9-3bcb-ba50-6e09-f30847bda669@collabora.com>
Date: Tue, 18 Jul 2023 11:47:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 07/10] pinctrl: mediatek: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Balsam CHIHI
 <bchihi@baylibre.com>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
 <20230717172821.62827-8-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230717172821.62827-8-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_104748_799207_8C7A5EBA 
X-CRM114-Status: GOOD (  17.87  )
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

Il 17/07/23 19:28, Andy Shevchenko ha scritto:
> Since pm.h provides a helper for system no-IRQ PM callbacks,
> switch the driver to use it instead of open coded variant.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 5 +----
>   drivers/pinctrl/mediatek/pinctrl-paris.c      | 9 +++------
>   2 files changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index 665dec419e7c..2bf5082d3aa9 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -922,10 +922,7 @@ static int mtk_eint_resume(struct device *device)
>   	return mtk_eint_do_resume(pctl->eint);
>   }
>   
> -const struct dev_pm_ops mtk_eint_pm_ops = {
> -	.suspend_noirq = mtk_eint_suspend,
> -	.resume_noirq = mtk_eint_resume,
> -};
> +DEFINE_NOIRQ_DEV_PM_OPS(mtk_eint_pm_ops, mtk_eint_suspend, mtk_eint_resume);
>   
>   static int mtk_pctrl_build_state(struct platform_device *pdev)
>   {
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 33d6c3fb7908..b1cbd5bafa2e 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -1119,24 +1119,21 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev)
>   }
>   EXPORT_SYMBOL_GPL(mtk_paris_pinctrl_probe);
>   
> -static int mtk_paris_pinctrl_suspend(struct device *device)
> +static int mtk_paris_suspend(struct device *device)
>   {
>   	struct mtk_pinctrl *pctl = dev_get_drvdata(device);
>   
>   	return mtk_eint_do_suspend(pctl->eint);
>   }
>   
> -static int mtk_paris_pinctrl_resume(struct device *device)
> +static int mtk_paris_resume(struct device *device)

What's the reason why you changed the suspend/resume function names?
I don't really mind, but please at least mention that in the commit description.

Thanks,
Angelo

>   {
>   	struct mtk_pinctrl *pctl = dev_get_drvdata(device);
>   
>   	return mtk_eint_do_resume(pctl->eint);
>   }
>   
> -const struct dev_pm_ops mtk_paris_pinctrl_pm_ops = {
> -	.suspend_noirq = mtk_paris_pinctrl_suspend,
> -	.resume_noirq = mtk_paris_pinctrl_resume,
> -};
> +DEFINE_NOIRQ_DEV_PM_OPS(mtk_paris_pinctrl_pm_ops, mtk_paris_suspend, mtk_paris_resume);
>   
>   MODULE_LICENSE("GPL v2");
>   MODULE_DESCRIPTION("MediaTek Pinctrl Common Driver V2 Paris");


