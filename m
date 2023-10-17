Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A9DCDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 17:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUUCkiu5vUAHLKvjzzzRJs8u1+C022EMiTeERsZUBSE=; b=cYdjbBKUCXczn4Bl0V7taHatMD
	WMTSzHRHGLReXG6xxUpdkxG+yI7jVnz8lAnEkdjtqvR87pCKAUaufBjQbhfBVc0VJ63iuzlEVAQrh
	PgZQQ6DvKmDwaxvjqt1qWr/AUtc1Z/D0uYNFDLO9B+o/8PJ9sgT8zzUqO6qXTQFx/cjwylnbLITnD
	aD2ubQYOIms4fDXvoMdTzcudxh4WmsmaKkqV3TcPIllTb29jFw5n7CWO9u5iOYuO6ItrsChzs4rPN
	K2RCfRjYXfoom4BTtB9OLLUt4hPQvEZctmjT5cGR5BxB9zwuFyzLVmrS7OmBwSTyQfMPG8d4LWSbd
	E1F8XeHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsoH4-00CwCC-3A;
	Tue, 17 Oct 2023 17:54:34 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsoH1-00CwAS-16
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Oct 2023 17:54:32 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40776b1ff73so35292815e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Oct 2023 10:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697565266; x=1698170066; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MUUCkiu5vUAHLKvjzzzRJs8u1+C022EMiTeERsZUBSE=;
        b=JzR0YZalv6pCfl3OHIC7rn/sHyqh3+8Y1bH5TEwZcId803PG0GytdOVS6WPzSiLOAW
         flhUE8srht6kpCsCC+PUIOlLhTbp1V1VF9WK7/Wk3T9U5r2FfW/clnALjlDTyaiKKTCc
         Uzf/wfLY1tY5aMCODb/E7WdjjHfrT2QcGAO50aAo8Gd6YOX76lnxv/S/S4rgSkf2yZzs
         zMkejvgGuefUnZzh2z2CV55cV7wenXT3LjgcUL94xvXeywMWVY/YSQ0kiKIZC5h1sIv8
         +5O734lmM7fbPFQ/lo2S526QzQMn8Qj6LP+sm8wxTeg9H3QRX4ttQOlC/TUl/IeyRNyi
         LyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697565266; x=1698170066;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MUUCkiu5vUAHLKvjzzzRJs8u1+C022EMiTeERsZUBSE=;
        b=NHjqeK2M2x5I0dlOIjwrY9hkFgxzJZqmUd1OO/drNgRyig6nBUga4RDfVb89XocwQ3
         delUoDz1nlfK66Wy3scvLxuT8BxFt+OpmJkMvipWBP6EfT9z0/kPsKLuTxDTYjZxp7jN
         Vb2jY0aBcKkDOigwp5AeFejWfB+mICpWmS6bc51LFIhU7hemWPRgLDT1WZAxszDi6bWK
         VBJzf2ngz2eXpTA4mjVPHz8Mgh9fqyyFBWRXZs6M6Qiri8XFfmx03S5GF2kcCqDSeEnH
         fFwHHGaa8IAeZ2ryJOIEqcH4VyFVwbkBm4JONyjMC8FUQ11HObzuKCPXNBPmGaNHgj8S
         T1RQ==
X-Gm-Message-State: AOJu0YyhgumZ7WwFo6lBZxMXX+vVUgcR1X/FvSt16kpOCdr9FPTmn3yT
	rHBZFlRg1di1c+12HlB1SXwjjQ==
X-Google-Smtp-Source: AGHT+IG505kDYsm+03qRLM/qO/s22ze8aCQIk76ph//q3WRXO4DCwOktsuci2V9jr+fr4BJ+ziIiuw==
X-Received: by 2002:a05:600c:3114:b0:407:7e5f:ffb9 with SMTP id g20-20020a05600c311400b004077e5fffb9mr2450207wmo.9.1697565266528;
        Tue, 17 Oct 2023 10:54:26 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id v18-20020a05600c15d200b00406447b798bsm2221328wmf.37.2023.10.17.10.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 10:54:26 -0700 (PDT)
Message-ID: <2d5190ed-5c95-4278-8e70-211a71de821b@linaro.org>
Date: Tue, 17 Oct 2023 19:54:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] thermal: lvts: make some read-only arrays static
 const
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231017171655.177096-1-colin.i.king@gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20231017171655.177096-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_105431_378499_1A49F9F6 
X-CRM114-Status: GOOD (  14.57  )
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


Hi Colin,

On 17/10/2023 19:16, Colin Ian King wrote:
> Don't populate the read-only arrays on the stack, instead make them
> static const. 

Why ?

> Make lvts_write_config parameters cmds and nr_cmds
> const too.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 877a0e5ac3fd..b20e69cb466f 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -308,7 +308,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
>   
>   static void lvts_update_irq_mask(struct lvts_ctrl *lvts_ctrl)
>   {
> -	u32 masks[] = {
> +	static const u32 masks[] = {
>   		LVTS_MONINT_OFFSET_SENSOR0,
>   		LVTS_MONINT_OFFSET_SENSOR1,
>   		LVTS_MONINT_OFFSET_SENSOR2,
> @@ -400,7 +400,7 @@ static irqreturn_t lvts_ctrl_irq_handler(struct lvts_ctrl *lvts_ctrl)
>   {
>   	irqreturn_t iret = IRQ_NONE;
>   	u32 value;
> -	u32 masks[] = {
> +	static const u32 masks[] = {
>   		LVTS_INT_SENSOR0,
>   		LVTS_INT_SENSOR1,
>   		LVTS_INT_SENSOR2,
> @@ -781,7 +781,7 @@ static int lvts_ctrl_init(struct device *dev, struct lvts_domain *lvts_td,
>    * each write in the configuration register must be separated by a
>    * delay of 2 us.
>    */
> -static void lvts_write_config(struct lvts_ctrl *lvts_ctrl, u32 *cmds, int nr_cmds)
> +static void lvts_write_config(struct lvts_ctrl *lvts_ctrl, const u32 *cmds, const int nr_cmds)
>   {
>   	int i;
>   
> @@ -865,7 +865,8 @@ static int lvts_ctrl_set_enable(struct lvts_ctrl *lvts_ctrl, int enable)
>   
>   static int lvts_ctrl_connect(struct device *dev, struct lvts_ctrl *lvts_ctrl)
>   {
> -	u32 id, cmds[] = { 0xC103FFFF, 0xC502FF55 };
> +	u32 id;
> +	static const u32 cmds[] = { 0xC103FFFF, 0xC502FF55 };
>   
>   	lvts_write_config(lvts_ctrl, cmds, ARRAY_SIZE(cmds));
>   
> @@ -889,7 +890,7 @@ static int lvts_ctrl_initialize(struct device *dev, struct lvts_ctrl *lvts_ctrl)
>   	/*
>   	 * Write device mask: 0xC1030000
>   	 */
> -	u32 cmds[] = {
> +	static const u32 cmds[] = {
>   		0xC1030E01, 0xC1030CFC, 0xC1030A8C, 0xC103098D, 0xC10308F1,
>   		0xC10307A6, 0xC10306B8, 0xC1030500, 0xC1030420, 0xC1030300,
>   		0xC1030030, 0xC10300F6, 0xC1030050, 0xC1030060, 0xC10300AC,

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


