Return-Path: <SRS0=Oval=DI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF54C4727C
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 14:16:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE67320796
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 14:16:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="20TgEATv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oMhrCQWA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE67320796
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lQs3qFrxjtZB8ME9W/kmQb27AoaxfP8KGZNF0y9W+Gg=; b=20TgEATvVpC8/XV/AfHXnY5M1
	wB8b8Bb+VKlaIXijhi5JVvX13cLwi2+Pk8z+ACyNnwOMadA6V+7ubaPXVZK3Ccg+28bCtI/hkjD4P
	+kk0Nu8wrGgjymCxg1sawR3xIq3zLgXfeheFRz1XkhGPq4BSbEBCVx1/LwIEjYPtbwAzVNamny4A2
	+yi8UAcO2DQVsaqHpBAPqLqN2Qk4FPX8zsXYE7abMO2VwlZ973SS0pxbHW9CgEtUXpEinTYsmLLe+
	l1JGgcHmmujhxHp90TWFFxIF3vU+JdS+lyL15VZeT7Cqqu9QdYzN83rXtXSOVHBtRs4aS+JBIdasM
	P6t5S5bmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNzNK-0002zD-P7; Thu, 01 Oct 2020 14:16:02 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNzN8-0002qG-P3; Thu, 01 Oct 2020 14:15:55 +0000
Received: by mail-wr1-x441.google.com with SMTP id s12so5963165wrw.11;
 Thu, 01 Oct 2020 07:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BEVeioAblvOjShBbM1jBg6agZyVGfRoTs/GtPxjBCbI=;
 b=oMhrCQWAOHqG6HxVMBmqVZPYxMru6FIXm3mJvAbc8rbL7tactK29OZk+GvNiM5PZk8
 rF6p5qi0AyXKRjNx+f23OJ8VJ+FleD7gQP9lLRLq2Y4dXvx012uxiiO1b7fpiRntPsoI
 PI0IvzVtjor7xv0a/TguOEJumonWGlfE65S4PwSOaNJs2XyLk4l1P2ZKGnjoloQnXwyz
 6CDkgfu187Eq4Lf2dvoi1cHfzHjCKVZhmf5NrBoC9ZlJVUhX8aK9BA+/KWZFgHuk8Wxl
 7frfWbzrA5r6wEJBfZ+pXNAGHzjb8U3WB0CfY06Dbqb+2MmXIltXnqleTmlcDnjvc9Mi
 EFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BEVeioAblvOjShBbM1jBg6agZyVGfRoTs/GtPxjBCbI=;
 b=CLlMTIjZvZAhEFWiJiPY478eyEmqNz+3SzjoeLXHJJz+oEgIezL4rghMSgRTOya+l3
 8WDZ2exXQ3i7DMjN2wI98aJOy/exM1c92FMCTATICrtSkxB9TtLz9/t172XCp3UPmgJG
 xKlzlF3ZxvtYHGd6jLI9xgjMuy2jKyr8kD9nGgYU9icO6m7IW8VzlOuOqZPYBmZx+Ski
 KMvHWGffejZMpl2MsLqyliKziA51F67ajkiKzJAHB3e+eSG2RvzP0Gwhg52jSCT5mjRy
 khMOLYvJXfzmrCwYClF3Ka2nFOjXvXN7TvBXEKy01kfew0c50XSHtjTxA1I+gQOoP8J1
 /fog==
X-Gm-Message-State: AOAM530sUBqcP/lAxW92Z4XoOYh+5aXp3HYOa04AN0UyN+SGxGFaxjLi
 Yu5pt5ns1U4ecoOW5Hg+W48=
X-Google-Smtp-Source: ABdhPJwUjBFOW1XPUuWU4ekSqDncW2iPM/Z45iswZFbsIeOrE+yuHZU3Vu24DSJPTVO2+ih9PwthHw==
X-Received: by 2002:adf:e4cf:: with SMTP id v15mr9174610wrm.174.1601561747382; 
 Thu, 01 Oct 2020 07:15:47 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id v4sm96564wml.46.2020.10.01.07.15.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 07:15:45 -0700 (PDT)
Subject: Re: [PATCH v3 7/9] clk: mediatek: Fix asymmetrical PLL enable and
 disable control
To: Weiyi Lu <weiyi.lu@mediatek.com>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
References: <1599103380-4155-1-git-send-email-weiyi.lu@mediatek.com>
 <1599103380-4155-8-git-send-email-weiyi.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <516a5f5b-f5af-0362-a73e-97b3db7300aa@gmail.com>
Date: Thu, 1 Oct 2020 16:15:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599103380-4155-8-git-send-email-weiyi.lu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_101551_033759_7EB0DA10 
X-CRM114-Status: GOOD (  22.76  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: James Liao <jamesjj.liao@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Wendell Lin <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 03/09/2020 05:22, Weiyi Lu wrote:
> The en_mask actually is a combination of divider enable mask
> and pll enable bit(bit0).
> Before this patch, we enabled both divider mask and bit0 in prepare(),
> but only cleared the bit0 in unprepare().
> Now, setting the enable register(CON0) in 2 steps: first divider mask,
> then bit0 during prepare(), vice versa.
> Hence, en_mask will only be used as divider enable mask.
> Meanwhile, all the SoC PLL data are updated.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>   drivers/clk/mediatek/clk-mt2701.c | 26 +++++++++++++-------------
>   drivers/clk/mediatek/clk-mt2712.c | 30 +++++++++++++++---------------
>   drivers/clk/mediatek/clk-mt6765.c | 20 ++++++++++----------
>   drivers/clk/mediatek/clk-mt6779.c | 24 ++++++++++++------------
>   drivers/clk/mediatek/clk-mt6797.c | 20 ++++++++++----------
>   drivers/clk/mediatek/clk-mt7622.c | 18 +++++++++---------
>   drivers/clk/mediatek/clk-mt7629.c | 12 ++++++------
>   drivers/clk/mediatek/clk-mt8173.c | 28 ++++++++++++++--------------
>   drivers/clk/mediatek/clk-mt8183.c | 22 +++++++++++-----------
>   drivers/clk/mediatek/clk-pll.c    | 16 ++++++++++++----
>   10 files changed, 112 insertions(+), 104 deletions(-)
> 
[...]
>   
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> index f440f2cd..e0b00bc 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -247,10 +247,14 @@ static int mtk_pll_prepare(struct clk_hw *hw)
>   	writel(r, pll->pwr_addr);
>   	udelay(1);
>   
> -	r = readl(pll->base_addr + REG_CON0);
> -	r |= pll->data->en_mask;
> +	r = readl(pll->base_addr + REG_CON0) | CON0_BASE_EN;
>   	writel(r, pll->base_addr + REG_CON0);
>   
> +	if (pll->data->en_mask) {
> +		r = readl(pll->base_addr + REG_CON0) | pll->data->en_mask;
> +		writel(r, pll->base_addr + REG_CON0);
> +	}
> +

I think a better approach here would be to add a flag to mtk_pll_data instead of 
changing all drivers in one big patch. This will allow you to add the driver 
that needs to write the en_mask after writing CON0_BASE_EN more easily. And it 
will later allow you to change the remaining driver one by one until all are 
using the new flag.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
