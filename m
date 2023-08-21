Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6652EE4996
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Aug 2023 03:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00sTKj6r29idEJKO1tqRjR2HLLSE0fyMr4hXBqiW47I=; b=SrGrYR60Ny+H5gcbbb6+18LQW5
	tcQfxK/mV+WoTxZfIvr4c+BXTNwYT5pCqauKlgmG6zHK2iQME6KCu7qpyTmlf6mxO6/Hq743b6me2
	+GPCaGRMQDZ7qRj3G0SiGmJCBTk8GEcsRRHVMlMGHyBNj7EfvzYlwTC1IlfwQtarI3se6LSiJIi8p
	oYeZxBvUukkZNvZI4lWxjntRw0OyCGs2mJnEtNoAAgcTMG40V980B8LAn11KqYIXMcLKHo8ahzU40
	PLfzpVmh4J65WI0/JR74SmFEOCASQuXJPczEswHHKpwDT/PBBBXRhf88KdcsrRf6gwhdFObU/ICPm
	LSDsB/UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXvhc-00Czou-2G;
	Mon, 21 Aug 2023 03:35:40 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXvhZ-00CzoB-1n
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Aug 2023 03:35:38 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-56a8794b5adso730588a12.2
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Aug 2023 20:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692588936; x=1693193736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=00sTKj6r29idEJKO1tqRjR2HLLSE0fyMr4hXBqiW47I=;
        b=EoyOxijThar9EAUzeD2tdAYhkNhVBKLl5DvbKipB5sV6cz6R9mEcIg+4Z8Z9okgZ2k
         YeZ2+ayHnz4AcanYdoMscZoQpZ7Te1XBrw3p9RyKA66C2vIxkEcpKYICCoALmRS3VlTM
         iRe2QuQTxYpQJTh5Hz17W91X7F5RoYaXw1JaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692588936; x=1693193736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00sTKj6r29idEJKO1tqRjR2HLLSE0fyMr4hXBqiW47I=;
        b=jhDhDZOpQql15oqurOVOUBCFrfzBAPTFkXxSscUdZVL7lBFNxYKI9YNLahu6faUG21
         1v0Cp5/hRfcSr9eFZIBqGzo0GOa6WN68sg3xeSKhrcHCyVVNbwqheMAV/k+MaU4Is8Be
         oN/pdcO0qb+0xD8Q8Ca5bbxAUamcVHuse7xemEkWx7Bj3ZBgI6qbhNCzkNyJf9c4Z6uZ
         KmzLIVYczX3eIs0cfJHC3+xK4Fq7Bt2Mm5AtjVV7GSdfwg4CUUMxclNavivQc+qHOblA
         YGclYQwBZj0UCpQ9JWoICXbtn+n8k+NOhtbkiWFrImJ0iNmeGICgYTrSOGw8KhDNsf2T
         ipHA==
X-Gm-Message-State: AOJu0YxzNiEEbzq3lQcApIKIAmRWhO7KMwYwBGv9jJ5Y6OPZTHY3wxBe
	nlN7soUbpg4G0HXrKhYy04YkZQ==
X-Google-Smtp-Source: AGHT+IG5aGqs5D00DDjj7OJwcEOzDcmv6vQD+bo07/gyCLmBibr72UHzCi3wAuI/jaEHXPiLMS1QHg==
X-Received: by 2002:a17:903:2305:b0:1bf:cdc:f402 with SMTP id d5-20020a170903230500b001bf0cdcf402mr7301478plh.48.1692588935784;
        Sun, 20 Aug 2023 20:35:35 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:d88c:8ac2:1586:6240])
        by smtp.gmail.com with ESMTPSA id iz22-20020a170902ef9600b001b9da42cd7dsm5881881plb.279.2023.08.20.20.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 20:35:35 -0700 (PDT)
Date: Mon, 21 Aug 2023 11:35:32 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Yu-Che Cheng <giver@chromium.org>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] spmi: mediatek: Fix UAF on device remove
Message-ID: <20230821033532.GA21555@google.com>
References: <20230717173934.1.If004a6e055a189c7f2d0724fa814422c26789839@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717173934.1.If004a6e055a189c7f2d0724fa814422c26789839@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230820_203537_627981_122F865A 
X-CRM114-Status: GOOD (  24.03  )
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, James Lo <james.lo@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jul 17, 2023 at 05:39:35PM +0800, Yu-Che Cheng wrote:
> The pmif driver data that contains the clocks is allocated along with
> spmi_controller.
> On device remove, spmi_controller will be freed first, and then devres
> , including the clocks, will be cleanup.
> This leads to UAF because putting the clocks will access the clocks in
> the pmif driver data, which is already freed along with spmi_controller.
> 
> This can be reproduced by enabling DEBUG_TEST_DRIVER_REMOVE and
> building the kernel with KASAN.
> 
> Fix the UAF issue by using unmanaged clk_bulk_get() and putting the
> clocks before freeing spmi_controller.
> 
> Reported-by: Fei Shao <fshao@chromium.org>
> Signed-off-by: Yu-Che Cheng <giver@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Stephen, could you pick this up?

> ---
> 
>  drivers/spmi/spmi-mtk-pmif.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
> index b3c991e1ea40..74b73f9bc222 100644
> --- a/drivers/spmi/spmi-mtk-pmif.c
> +++ b/drivers/spmi/spmi-mtk-pmif.c
> @@ -465,7 +465,7 @@ static int mtk_spmi_probe(struct platform_device *pdev)
>  	for (i = 0; i < arb->nclks; i++)
>  		arb->clks[i].id = pmif_clock_names[i];
>  
> -	err = devm_clk_bulk_get(&pdev->dev, arb->nclks, arb->clks);
> +	err = clk_bulk_get(&pdev->dev, arb->nclks, arb->clks);
>  	if (err) {
>  		dev_err(&pdev->dev, "Failed to get clocks: %d\n", err);
>  		goto err_put_ctrl;
> @@ -474,7 +474,7 @@ static int mtk_spmi_probe(struct platform_device *pdev)
>  	err = clk_bulk_prepare_enable(arb->nclks, arb->clks);
>  	if (err) {
>  		dev_err(&pdev->dev, "Failed to enable clocks: %d\n", err);
> -		goto err_put_ctrl;
> +		goto err_put_clks;
>  	}
>  
>  	ctrl->cmd = pmif_arb_cmd;
> @@ -498,6 +498,8 @@ static int mtk_spmi_probe(struct platform_device *pdev)
>  
>  err_domain_remove:
>  	clk_bulk_disable_unprepare(arb->nclks, arb->clks);
> +err_put_clks:
> +	clk_bulk_put(arb->nclks, arb->clks);
>  err_put_ctrl:
>  	spmi_controller_put(ctrl);
>  	return err;
> @@ -509,6 +511,7 @@ static void mtk_spmi_remove(struct platform_device *pdev)
>  	struct pmif *arb = spmi_controller_get_drvdata(ctrl);
>  
>  	clk_bulk_disable_unprepare(arb->nclks, arb->clks);
> +	clk_bulk_put(arb->nclks, arb->clks);
>  	spmi_controller_remove(ctrl);
>  	spmi_controller_put(ctrl);

Maybe we need devres versions of spmi_controller_alloc and
spmi_controller_add to avoid this in the future? I'm sure
drivers put all sorts of stuff in their private data.

ChenYu

>  }
> -- 
> 2.41.0.255.g8b1d071c50-goog
> 

