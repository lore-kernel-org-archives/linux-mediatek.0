Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44680C5320E
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Aug 2024 10:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUD1Ea9UKeIFr1Gi+Fx5mI9X0GR2X7d/ng4gbm+FxPE=; b=MoSfFrPQ/livMz7VFzh6SnLGJR
	YvpSxqG3/1nOcLdI4Ri4ikZNeh7rUsXQYvn5LWZizAUg1ACC9v6m0LO4uWKDyKCTz0o8KTnDLRCMn
	EGNhcaNtTQXqRy5KtRMvLw+lRDhgJUWB9mqR0V9U9nO1Y1aM3VOdrhaCwE2LxhdxhVcGml9B+R39E
	2o6TYG1aQwRC8brMBU1oWgDaqKf19mjx39XE89IzHGCwbHH0235eGlCRPa9047/g09eP0ON85sx/E
	Z//CUuxt2Y6vlRDMUO/O6K4YsVktJA/nCYiixni71p8IBCbG/oNiWozemQBsbd42FNUvTCN+z4TI0
	0pQKZ0LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfzgB-000000017Go-3QHv;
	Mon, 19 Aug 2024 10:32:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfzf9-0000000177c-2sTr;
	Mon, 19 Aug 2024 10:31:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B1ECCCE0A54;
	Mon, 19 Aug 2024 10:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C92C32782;
	Mon, 19 Aug 2024 10:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724063456;
	bh=HBIKWG6jwrr6gqe7BImTmvWVfskIYRFLauZN/B8GRG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hzEd9VHcHNtSkwfXSik9ABC3aPjkQ2QBXzcrkaHSUcxJo9eYKA/LLH9fnQNA7Ayqa
	 mHCShD1AYWY2xCQHBKkJysUYWQRQ+q7EQbsfAZmwYk8ghsF/kpRdhgTnQc0jplq144
	 axyfNuklrdtdcN0HyvJIZbV66Q3T9Q8gKqb9CF/ychlazid166Gc22mPTDE4QOUiNl
	 g/IFxQfX0XA23TwZCxwG94Gf3HgAn34VTodJ5SoGk9qdrRm4xCNXFmuqFuET5KOU9/
	 6ygG5URP4xMWXwEel5h+RQLb7XIcAQLyVuvVY/CukIiegO/+wEQC5MKrEaCMzA36w1
	 96tCuvSRwXcSQ==
Date: Mon, 19 Aug 2024 12:30:51 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Riku Voipio <riku.voipio@iki.fi>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 16/17] leds: turris-omnia: Simplify with scoped for each
 OF child loop
Message-ID: <4ht5cirpwz3pax5qm72hrjqy6oocsd2jctcwliwc65idijjcjt@fthzfoljm3ys>
References: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
 <20240816-cleanup-h-of-node-put-var-v1-16-1d0292802470@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240816-cleanup-h-of-node-put-var-v1-16-1d0292802470@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_033059_920147_937526D5 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Reviewed-by: Marek Behún <kabel@kernel.org>

On Fri, Aug 16, 2024 at 05:31:48PM +0200, Krzysztof Kozlowski wrote:
> Use scoped for_each_available_child_of_node_scoped() when iterating over
> device nodes to make code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/leds/leds-turris-omnia.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
> index 39f740be058f..1ef942b5cefa 100644
> --- a/drivers/leds/leds-turris-omnia.c
> +++ b/drivers/leds/leds-turris-omnia.c
> @@ -452,7 +452,7 @@ static int omnia_mcu_get_features(const struct i2c_client *client)
>  static int omnia_leds_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
> -	struct device_node *np = dev_of_node(dev), *child;
> +	struct device_node *np = dev_of_node(dev);
>  	struct omnia_leds *leds;
>  	struct omnia_led *led;
>  	int ret, count;
> @@ -497,12 +497,10 @@ static int omnia_leds_probe(struct i2c_client *client)
>  	}
>  
>  	led = &leds->leds[0];
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		ret = omnia_led_register(client, led, child);
> -		if (ret < 0) {
> -			of_node_put(child);
> +		if (ret < 0)
>  			return ret;
> -		}
>  
>  		led += ret;
>  	}
> 
> -- 
> 2.43.0
> 

