Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64249C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 13:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4ZGpKZ3u2f3mFBgGXNwocdwhbctpL/s16OYpwLYfUg=; b=1oFrW4pfAyUxkcB4zHvYTkmRkj
	yHsSBVK2R7wUi+sBMEM+Dv9eySuBf9C+/xFamKP1ojFiNINcJ5GhKs5pr2MNlp/ueqse0MQnvvYiJ
	Hi6tmalVEp67YgkwosTm8T4EYdOQ/VlNRSZF22VPGtcbP8JqbiPPqDmCV5L9ySBMVt88/i4RS6DNn
	iTEHyzVoXT3s+61C0pl+x+jzG07SXXbCoFr6dqpul0S6ii29qe6yCHBee7F1Elt2h0M2N8l+VgKxh
	NX2P2gObQtRzdM53TQX+gZBjyQ5hA8LvFKcmsDLoJQJKbLP4atDoL+99YSyLP+FN33DJSVZA26puI
	cl8nXFqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7HRL-00GRp6-L9; Tue, 11 Jan 2022 13:43:55 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7HQ0-00GQxu-1i; Tue, 11 Jan 2022 13:42:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4C8251F41337
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641908551;
 bh=S0e9ARTzAtOgvzTS0yLRD4LzdD1nK8G8odiHX264OtU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=C0hzcMGIv+omsReBHdCQqtwRp3ld7tYoNqW+9W+h2cTejXkDYZ2u6HEuu9lR2xDz6
 Q+ORrX/6nTkfDSuNHe5P/wXShrJQ/t0KD3Z4tfhWldwbVSVemgBY7SpgfDqm1O/W5Y
 5IuJM5HryMdx81rbUeJG4mjVh4QiugryW/8FZjuoJY9ZxjxnbMRV0nJOLOEE0/qxwH
 IF2VH8o6JjrQ++8QPnQ/r6EFQ4mdGglcy7nfCc+Bl2TlNCNom9IWrkBlGl/gUl75iB
 tCQJIQFFc4IwI1gP6NNd589vqWOwTfk3Aeq/HwceWUvNC6niE33pqmjW9rpffqKPZL
 +hT4HMYk0OKlQ==
Subject: Re: [PATCH 1/7] pinctrl: pinconf-generic: Print arguments for
 bias-pull-*
To: Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Guodong Liu <guodong.liu@mediatek.com>
References: <20220111112244.1483783-1-wenst@chromium.org>
 <20220111112244.1483783-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <2dc957b1-300f-161c-edb6-efacf11942e0@collabora.com>
Date: Tue, 11 Jan 2022 14:42:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220111112244.1483783-2-wenst@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_054232_289891_33507E15 
X-CRM114-Status: GOOD (  16.87  )
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

Il 11/01/22 12:22, Chen-Yu Tsai ha scritto:
> The bias-pull-* properties, or PIN_CONFIG_BIAS_PULL_* pin config
> parameters, accept optional arguments in ohms denoting the strength of
> the pin bias.
> 
> Print these values out in debugfs as well.
> 
> Fixes: eec450713e5c ("pinctrl: pinconf-generic: Add flag to print arguments")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Tested on qcom-SC7180 Trogdor, mtk-MT8173 Elm, and others;

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/pinctrl/pinconf-generic.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
> index f8edcc88ac01..415d1df8f46a 100644
> --- a/drivers/pinctrl/pinconf-generic.c
> +++ b/drivers/pinctrl/pinconf-generic.c
> @@ -30,10 +30,10 @@ static const struct pin_config_item conf_items[] = {
>   	PCONFDUMP(PIN_CONFIG_BIAS_BUS_HOLD, "input bias bus hold", NULL, false),
>   	PCONFDUMP(PIN_CONFIG_BIAS_DISABLE, "input bias disabled", NULL, false),
>   	PCONFDUMP(PIN_CONFIG_BIAS_HIGH_IMPEDANCE, "input bias high impedance", NULL, false),
> -	PCONFDUMP(PIN_CONFIG_BIAS_PULL_DOWN, "input bias pull down", NULL, false),
> +	PCONFDUMP(PIN_CONFIG_BIAS_PULL_DOWN, "input bias pull down", "ohms", true),
>   	PCONFDUMP(PIN_CONFIG_BIAS_PULL_PIN_DEFAULT,
> -				"input bias pull to pin specific state", NULL, false),
> -	PCONFDUMP(PIN_CONFIG_BIAS_PULL_UP, "input bias pull up", NULL, false),
> +				"input bias pull to pin specific state", "ohms", true),
> +	PCONFDUMP(PIN_CONFIG_BIAS_PULL_UP, "input bias pull up", "ohms", true),
>   	PCONFDUMP(PIN_CONFIG_DRIVE_OPEN_DRAIN, "output drive open drain", NULL, false),
>   	PCONFDUMP(PIN_CONFIG_DRIVE_OPEN_SOURCE, "output drive open source", NULL, false),
>   	PCONFDUMP(PIN_CONFIG_DRIVE_PUSH_PULL, "output drive push pull", NULL, false),
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
