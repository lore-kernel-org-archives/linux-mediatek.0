Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE32EC001E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 09:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XznQUuiJb54uwYssnpziXtdB1g0ycFoSN01wYyxF/c0=; b=sp/kxS3fzIlH62czN3QvjDTtbq
	5WDzcgraPRKpcCxch2qsc0uqRmEIFi41piRFAz711g49e3pPzFTqlV+e9Y+xUPZ6z+o/ptjuY7Y1V
	YLS4d9huYi5DW8dBCk3QsOjM6cWbpoo5XpAbAPDxo0F4nTFA77Gt9qv9e+nJgNjZGwgXayN61Pwdc
	T+8iIkVCiaYHoxHbbcT1MKrs6gt/hcoGYr8bOwCTa1zJxNAiTcUhgnx0dbBYlqJkfm2Tgw3sK5g/5
	J1E3BoIE4vk1W0IAUEp6pRrcvcqUgbmUu+0wlwcsmr6PN4kz6J/G6PFdkx1SCH40XnJSDajdlb0XI
	9fuWI7dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsLR-002ZtQ-1j;
	Thu, 13 Jul 2023 09:10:41 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsLL-002ZqP-0A
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jul 2023 09:10:39 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3090d3e9c92so651269f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jul 2023 02:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689239432; x=1691831432;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XznQUuiJb54uwYssnpziXtdB1g0ycFoSN01wYyxF/c0=;
        b=FHeBakREsG4Z6rum1jL3V/EaDxVsP+vazLfvdtBwMKVlQ5rsBg2X8Es6ckTs4R1DOc
         sS5A1ZZZz/4S3XRRFhkoZDGGO7bg1jvPazO5bo13XXJvoWdCtZczsDhI4V87qrB/EXK+
         x+KOZuE66xkOoP8C/vJjqWPL//edg8WsgU9PXmKu7wjkBTe8qOLlqfRqVpvzCH8C3P08
         xU92KmLZ6owDVyComAGhfeHDHd+VQtXFYE4TzSkIL4iT2g7GNIIgNN8yUIvSeXl2hF46
         du+AeDp//Mi/i7Q81ZA98FOx00pKdhnwalFNnDBUt6LSIpSD6bgJsIZIb3WpBA7BhckA
         qD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689239432; x=1691831432;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XznQUuiJb54uwYssnpziXtdB1g0ycFoSN01wYyxF/c0=;
        b=k/MfD3jWgTQiOkljvVWaLjEr1VVXjTbQ6MAmiQhdI78BQD3LLlR1tcbP/JM0IsUTI0
         JxA/Jr6Kw4z4u5oD/UQAgiljHp2eTeCsQ84nReJ/2OyCz4msdp79ZwwMsqe9tREl0gEm
         AwKRb6qTGBUKXgt6Rx0sYx+Mvxo8BrD4KWtf10lG2anrUxNKSSQFcvFfmFMJbpScbCLE
         rDKf+lYD5Q7jUzjRGn/BeHlr37ivTVDJ/qOXiMGEkU0Fy//7zf/wxPHvW8z22uuJjdYl
         Bg4yCwyxO1bgzZa70lsstXUy6WjiCdw1pv5mCrG8UHatgFku/5aUaqp8qx4lxq8Z7Epn
         YGIg==
X-Gm-Message-State: ABy/qLYwpRTEFDHvz1be3raFiNz6eug9FADZU62ba3PPDHPZst6oWzdd
	7LzYG46Kwox3XrdnSj1G4iUT7g==
X-Google-Smtp-Source: APBJJlHhw9AYxg1hAv2II73+0rasYKMnkDxHEkSNwa5YORkhO8HmoSJ3UF4LYWWLNCqBqfFXl1cdyg==
X-Received: by 2002:a05:6000:1c4:b0:314:7fb:92c2 with SMTP id t4-20020a05600001c400b0031407fb92c2mr1172184wrx.30.1689239431891;
        Thu, 13 Jul 2023 02:10:31 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id y17-20020adfee11000000b0031274a184d5sm7350195wrn.109.2023.07.13.02.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 02:10:31 -0700 (PDT)
Message-ID: <b2a5f64f-3861-6345-3c2c-acba6ed40ee2@linaro.org>
Date: Thu, 13 Jul 2023 11:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1] drivers: mediatek: fix parameter check in
 lvts_debugfs_init()
Content-Language: en-US
To: Minjie Du <duminjie@vivo.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Cc: opensource.kernel@vivo.com
References: <20230713042413.2519-1-duminjie@vivo.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230713042413.2519-1-duminjie@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_021035_103050_79953A26 
X-CRM114-Status: GOOD (  16.98  )
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

On 13/07/2023 06:24, Minjie Du wrote:
> Make IS_ERR() judge the debugfs_create_dir() function return
> in lvts_debugfs_init().
> 
> Signed-off-by: Minjie Du <duminjie@vivo.com>

Applied (but massaged the changelog)

Thanks for the fix

> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index b693fac2d..b46f351d1 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -190,7 +190,7 @@ static int lvts_debugfs_init(struct device *dev, struct lvts_domain *lvts_td)
>   	int i;
>   
>   	lvts_td->dom_dentry = debugfs_create_dir(dev_name(dev), NULL);
> -	if (!lvts_td->dom_dentry)
> +	if (IS_ERR(lvts_td->dom_dentry))
>   		return 0;
>   
>   	for (i = 0; i < lvts_td->num_lvts_ctrl; i++) {

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


