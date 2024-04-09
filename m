Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A269C67861
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 11:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cXnY3N069ShtuQKQSH8FzFJSBT/CkPPkbl87PX+Plg=; b=zl9XGcfnB624tRx1Xf650WxTYY
	136bzdX1927xgMO6xQX1tySiMFOYByPGXQML81pxvXlwvlTnJ3hUiZ3HTjd8IFZyCRtMmjvg+pBsB
	TwOPm9jalGI2z8WpgnDqUVNE+PvO9dNe0i9wanShh7bWVLMpsjqbqIvSn5sNIFDP7KXHuwDS7zb/G
	ThFAzSPQ38S7uODHSrC7i0SnPSGxL/NYnD165aKRZIAM5mUiJY2EbpzDtDmGVz0h1EvrAtzGr0cli
	niuKcD7wcTFOOOO1OF3L9DzGQ6vqfjtdb3Rz+2QQIqzfJgKYfv0XpcmVgmRVy3Rdi6mjpwS89dBIb
	tfBNDjvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9vA-00000001lon-3211;
	Tue, 09 Apr 2024 11:45:48 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9v5-00000001lmz-3UXQ;
	Tue, 09 Apr 2024 11:45:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712663142;
	bh=lC4EWcyFhRfCmq02OzOhjC6dK5sQhjYXtXyu0Z/pVO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=w3c2kQFOB9CvuYyVBDEo7ncdVlz3Zt9JgxPdIIBosC8qcLaa0fP2yD2eKN4eGtn0J
	 Uiu5m97KAjMcXiRPcc1XSZU9gtEdOpf2lACGTOibkpHatkd7aH0LOn914CkjBpm30M
	 /VPO9c6ORB8uqvHl27IOmsB55KdiiH12cgbfZ2GYL2Ag6WDsck244+j+pmCQAjAn1H
	 rWX02LNgggpNu9ExU7PMayxgB2nZh+1yujFm/W/VX2s3yYVyetuRVnd2l8au+MMCc3
	 ioJTAjRb/nGm5yulnao+dR9u1V+URfC+eCL11sGhJt4f64X9pUlr8jJbWnkIqX3hz8
	 RV4QuRAowgY7w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DDAEB37820F5;
	Tue,  9 Apr 2024 11:45:41 +0000 (UTC)
Message-ID: <c98ea7c9-6c9b-466d-bc49-ec76874ac6da@collabora.com>
Date: Tue, 9 Apr 2024 13:45:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: mt6360: Fix the second LED can not enable torch
 mode by V4L2
To: ChiaEn Wu <chiaen_wu@richtek.com>, pavel@ucw.cz, lee@kernel.org,
 matthias.bgg@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 peterwu.pub@gmail.com, cy_huang@richtek.com
References: <d1d1419bb322e2b0f40d34edd3a66979015b668c.1712657386.git.chiaen_wu@richtek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <d1d1419bb322e2b0f40d34edd3a66979015b668c.1712657386.git.chiaen_wu@richtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_044544_061649_CBD6CDAD 
X-CRM114-Status: GOOD (  19.95  )
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

Il 09/04/24 12:21, ChiaEn Wu ha scritto:
> V4L2 will disable strobe mode of the LED device when enable torch mode,
> but this logic will conflict with the "priv->fled_torch_used"
> in "mt6360_strobe_set()". So after enabling torch mode of the first
> LED, the second LED will not be able to enable torch mode correctly.
> 
> Therefore, at the beginning of "mt6360_strobe_set()", check whether the
> state of the upcoming change and the current LED device state are the
> same, so as to avoid the above problem.
> 
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
>   drivers/leds/flash/leds-mt6360.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt6360.c
> index a90de82f4568..1b75b4d36834 100644
> --- a/drivers/leds/flash/leds-mt6360.c
> +++ b/drivers/leds/flash/leds-mt6360.c
> @@ -241,10 +241,20 @@ static int mt6360_strobe_set(struct led_classdev_flash *fl_cdev, bool state)
>   	u32 enable_mask = MT6360_STROBEN_MASK | MT6360_FLCSEN_MASK(led->led_no);
>   	u32 val = state ? MT6360_FLCSEN_MASK(led->led_no) : 0;
>   	u32 prev = priv->fled_strobe_used, curr;
> -	int ret;
> +	int ret = 0;

I prefer that you leave ret uninitialized here, and...

>   
>   	mutex_lock(&priv->lock);
>   
> +	/*
> +	 * If the state of the upcoming change is the same as the current LED
> +	 * device state, then skip the subsequent code to avoid conflict
> +	 * with the flow of turning on LED torch mode in V4L2.
> +	 */
> +	if (state == !!(BIT(led->led_no) & prev)) {
> +		dev_info(lcdev->dev, "No change in strobe state [0x%x]\n", prev);

...that you do here, instead

		ret = 0;
		goto unlock;

With that addressed,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collaobra.com>



