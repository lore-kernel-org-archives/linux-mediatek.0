Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D2CC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 16:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4472QStNp6Zr1RLAldtMI7Jne10bfsy1ti/c3TxR+2Y=; b=TRZ0J1Xsrn+DbjyftSMMvAYAEp
	HhfEQ37+EX9bkiq2BUhEa0i+MQg3fCXvnXvmBfbgmQQfD7xeRFRm6Uo3CsRUT04wQl9t6t6JfnFt5
	WUEb+bV+yOntMzB86ljzsShcTfh0uZXaO+W/KWrmF27qyfuxHp6Yjxmo5oQe1UEu2UT5L/DrUY54C
	KrXv8gB2IcoBYgX/5v4VFdboffg0He/DTfh2NOw9LNmZ+WgUUkmpjc2Wzwr/RY0ozhi7XGb41CP2/
	B+8mG+dCz5BUg9lUzXefCAtsJAePDANbWKVXq12NIi7E8VgcNaq80K2b6yZVx2Q/YpZh1/frCdE7b
	EZFSuo0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKi5e-008XKL-1s;
	Tue, 02 Jan 2024 16:58:06 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKi5P-008XCt-1N
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jan 2024 16:57:56 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-dbd029beef4so7855392276.0
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Jan 2024 08:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704214670; x=1704819470; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4472QStNp6Zr1RLAldtMI7Jne10bfsy1ti/c3TxR+2Y=;
        b=RPSyLIy+VmCN8rVRZISBs0zr26Dc8aUOPJEmPNq4YLarbisYMA2pA1XcQ73RQ5PHYI
         jvmtmVI5ntbNkxsPVuUgAV7baTql4e/G326Y1UekhbrQbpb8hhgT9haTRsikPvJW08fj
         vmATzE7DQWfkw/lXS1MrVx8FTqXohq7uqIrmjb//NGolGtJpwt2al9ZO7zy9CAdTB6F3
         pOldTAj1EymREz7UckeWx7/V7jNnKJnAXY8fi1Y8uSClTnO/GYE++ou8NnFIufxJIY42
         PthIYYALNuaKyB5QR9mnTrtJp1oYmAyL6fv6q6P2GOEMgFaNntwJa+Wu/twmnoU76GKv
         lF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704214670; x=1704819470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4472QStNp6Zr1RLAldtMI7Jne10bfsy1ti/c3TxR+2Y=;
        b=m+c9R27WFwIx4/ISypPGt69Ixxj8UhCKVJPHJwpnKI3mQORuGbV9M87A7GmjrcPMkz
         B1rNykuxRt4FQpGtS78HQo/CT5XNVXvXov5rpl3SHzO98hj0yenh+T1QYq1gc2btamVP
         ZFFRVZvMbIE2ZRVtnLdG7sdLyTwP6M+GvPU205xFPUs6RC1Q4etBCfsYfrMNKVgACqbg
         Qt7lOphd+N0k9fXV3yogSFWSYrjTYLknN9teEoAtf9TmAjgRkDHHqdOOUvkSZZnz3eIa
         L4oh18fS0yI4oSu3bDmgNUlsykGrt8glFwdOv6Sp1gOG+5d9o1Ba0vYso4w6BaCOQXv3
         MUNQ==
X-Gm-Message-State: AOJu0YxOyAgOqUBD4C7m/1dRYefy33mJ3fYDB60zjndBQnEe5ESUmAVb
	iIA3rKx9aXfbHH+yMFHCN+DXRMkGxsTC89aFCiK/V036WmBzJA==
X-Google-Smtp-Source: AGHT+IGaie7llkC0WY/ixF26z8u+KlGBuJcMXc/mTXO9lJk5lRRKNK+aRovxY0vGl7k6LwgOSjGmAgsCULdJSRRqxi8=
X-Received: by 2002:a25:b2a2:0:b0:dbd:9bd9:2159 with SMTP id
 k34-20020a25b2a2000000b00dbd9bd92159mr10842360ybj.45.1704214669983; Tue, 02
 Jan 2024 08:57:49 -0800 (PST)
MIME-Version: 1.0
References: <20231225093839.22931-1-mengqi.zhang@mediatek.com> <20231225093839.22931-2-mengqi.zhang@mediatek.com>
In-Reply-To: <20231225093839.22931-2-mengqi.zhang@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 2 Jan 2024 17:57:14 +0100
Message-ID: <CAPDyKFpJYKLCrrb0-dPLNGcaLRjevWkrrXpJY70rbwjsUJdYug@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] mmc: core: Add HS400 tuning in HS400es initialization
To: Mengqi Zhang <mengqi.zhang@mediatek.com>
Cc: chaotian.jing@mediatek.com, matthias.bgg@gmail.com, 
	wenbin.mei@mediatek.com, yangyingliang@huawei.com, adrian.hunter@intel.com, 
	avri.altman@wdc.com, vincent.whitchurch@axis.com, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_085753_628660_07FB8E6D 
X-CRM114-Status: GOOD (  16.21  )
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

On Mon, 25 Dec 2023 at 10:39, Mengqi Zhang <mengqi.zhang@mediatek.com> wrote:
>
> During the initialization to HS400es stage, add hs400 tuning flow as an
> optional process. For Mediatek IP, HS00es mode requires a specific
> tuning to ensure the correct HS400 timing setting.
>
> Signed-off-by: Mengqi Zhang <mengqi.zhang@mediatek.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v1 https://patchwork.kernel.org/project/linux-mediatek/patch/20231201030547.11553-1-mengqi.zhang@mediatek.com/
> v2 https://patchwork.kernel.org/project/linux-mediatek/patch/20231222062236.26370-1-mengqi.zhang@mediatek.com/
> ---
>  drivers/mmc/core/mmc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 705942edacc6..d5173a9bb4b0 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -1822,8 +1822,13 @@ static int mmc_init_card(struct mmc_host *host, u32 ocr,
>
>                 if (err)
>                         goto free_card;
> -
> -       } else if (!mmc_card_hs400es(card)) {
> +       } else if (mmc_card_hs400es(card)) {
> +               if (host->ops->execute_hs400_tuning) {
> +                       err = host->ops->execute_hs400_tuning(host, card);
> +                       if (err)
> +                               goto free_card;
> +               }
> +       } else {
>                 /* Select the desired bus width optionally */
>                 err = mmc_select_bus_width(card);
>                 if (err > 0 && mmc_card_hs(card)) {
> --
> 2.25.1
>

