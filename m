Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD739C4321E
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 12:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KW4ffafdWRk2eNo+Vd9LUA4QY8ptBxsRJc+ciuZDU9I=; b=zWH1vQcyGKlJoDXccB8nBAhT6a
	py05+UoaZGf/M4x7leW/VyVSlwAgbYU7yLpQ4IlW1ogSvEJZVWVD2OjN65NdMgNN5F7jzH4azLRt3
	VJpq8oNsX+t2Zmm2pbPLexIzN9pxAeDfMn306pCNr/bLDo2fAdoOOY8yMLTL3JDMpga0edxDbz4On
	Qoczf+OupiAj5yLaKRfgOFgaIsPrauY/9zZar3b87wX9fumZ42q7jz2G38vpUMhyvPGvMoK3EyW8/
	IZlvlHHjU1o1TTL28k2afUruXCAdhCKc4slXqmRAV6WAmpbXlTGY1zJk0LlM1KwJm3ZHdRA6pWeZD
	jMjzrTrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p008k-008heD-RA; Tue, 29 Nov 2022 12:55:10 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p008a-008ha7-6x
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 12:55:01 +0000
Received: by mail-pj1-x1029.google.com with SMTP id q17-20020a17090aa01100b002194cba32e9so2359686pjp.1
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Nov 2022 04:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KW4ffafdWRk2eNo+Vd9LUA4QY8ptBxsRJc+ciuZDU9I=;
        b=tDGzByIuBQCRqwpzV5s6jlm7LDDXK0ketuCf0pZm4OO+51o7QQyIO7sj2hUwzlkj3l
         vczBgP5r10LmqxWlRrQ0MHe7ogItlJ6BvApLdFkLfSYtFGTFpabrTdyG5qPEI49ZJ3rm
         Quio1niAnlGO1DlmrJi7vKOuCGmslB5hmOCwJt2JxuZrX1JNSEqlLQF5gdhAEm52p1DF
         FE4Rle36KT05z1CsA11u/4IpLYZ2MpxiLZt1khaasKo79rigGinoJU4uv/M0lw/nEedd
         9CrOk/PTxzjiL4JoXgbbEvTxI/4+QpkY+6Zs7SPIAbiEDR5lNbQPAsI6Nhk9BqW8pui6
         5yJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KW4ffafdWRk2eNo+Vd9LUA4QY8ptBxsRJc+ciuZDU9I=;
        b=YjHo6alfznsPMk/tcD74daN6C0fBIXI+TUdoMnN7XmsQjcMI50IpEnFZ2j69fnzYDB
         tGsW5fSZVVQ1ZOd+71WLezX2nCgkNaDJOwONK0nPmk6jSD2sITKNQdxSwyO8glnRF1hR
         HiXx491JPnvyH8PZU/mQ0JP5VVriIgRTJgdfs2uY/GVloKr4HrZgCQYT6JgrdPbcLw7N
         awG8X1fboJZ69PEsZV+uwTRUsVP7nwkt3ehoyCKh4gwtkYj36aDkQXVfcRoFtAPZgLE6
         K4oXsJ6DL30El7Gpc6rvRYwUfDJP/wYfZ5nxcWN/tCty+0Z/soFGf0IxXxftxz0oLOYi
         NMoQ==
X-Gm-Message-State: ANoB5pkzl61ZO4gARVY5eoHePsYTUyz5AzkIF59dzpqrvGZokIdstulp
	ZK6G+wK2YeI30pMnV8SEICK/CnHCBxKHBFCfUs6xww==
X-Google-Smtp-Source: AA0mqf53Fm1c+97bVkY2sGQYz3i1enF9huifz1wXhNyEGCzHavvLEGw2/5bwEZZ3PmacbOA5xVDS8MybnLyZXAom6V0=
X-Received: by 2002:a17:902:a503:b0:188:6baf:2011 with SMTP id
 s3-20020a170902a50300b001886baf2011mr35441978plq.165.1669726498347; Tue, 29
 Nov 2022 04:54:58 -0800 (PST)
MIME-Version: 1.0
References: <20221125090141.3626747-1-cuigaosheng1@huawei.com>
In-Reply-To: <20221125090141.3626747-1-cuigaosheng1@huawei.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 29 Nov 2022 13:54:22 +0100
Message-ID: <CAPDyKFqZOMO2vA7cr89LBqfzRT==LmU4yZnAkfHub5sZWMmx9g@mail.gmail.com>
Subject: Re: [PATCH] mmc: mtk-sd: Fix missing clk_disable_unprepare in msdc_of_clock_parse()
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: chaotian.jing@mediatek.com, matthias.bgg@gmail.com, drinkcat@chromium.org, 
	wenbin.mei@mediatek.com, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_045500_276712_C2F03520 
X-CRM114-Status: GOOD (  17.03  )
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

On Fri, 25 Nov 2022 at 10:01, Gaosheng Cui <cuigaosheng1@huawei.com> wrote:
>
> The clk_disable_unprepare() should be called in the error handling
> of devm_clk_bulk_get_optional, fix it by replacing devm_clk_get_optional
> and clk_prepare_enable by devm_clk_get_optional_enabled.
>
> Fixes: f5eccd94b63f ("mmc: mediatek: Add subsys clock control for MT8192 msdc")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 0f06cc5fec86..abadfc319053 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2605,13 +2605,11 @@ static int msdc_of_clock_parse(struct platform_device *pdev,
>                         return PTR_ERR(host->src_clk_cg);
>         }
>
> -       host->sys_clk_cg = devm_clk_get_optional(&pdev->dev, "sys_cg");
> +       /* If present, always enable for this clock gate */
> +       host->sys_clk_cg = devm_clk_get_optional_enabled(&pdev->dev, "sys_cg");
>         if (IS_ERR(host->sys_clk_cg))
>                 host->sys_clk_cg = NULL;
>
> -       /* If present, always enable for this clock gate */
> -       clk_prepare_enable(host->sys_clk_cg);
> -
>         host->bulk_clks[0].id = "pclk_cg";
>         host->bulk_clks[1].id = "axi_cg";
>         host->bulk_clks[2].id = "ahb_cg";
> --
> 2.25.1
>

