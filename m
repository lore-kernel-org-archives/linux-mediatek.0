Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5C7C77B7D
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 16:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9y7cGD3DdhxiTnvOkhxIVt549Y/e7kFTE/+uk3TXWg=; b=pcAl6jeDFGAXSY4PP+okks0DTw
	NQSEKYBaBrpojtsuTm/nOIjCbdUCDJdBieXWKCuUq1UoYgmo51nDceLsWSaKU7s8JvLcTxhU3Hh88
	k53bB9NEeRfyfxMrGOKbZsbLKicuzwIvZr1OytqWoWW+xbX7OMvv/jYsElpJJJISslqLnXIij5ts2
	YVClrHpgfvING42RQn5Ea+Uo35wSR9bdC6lh2QqlS8jQEKEsXNFu7mfyT8Io7MtLJPpZMbRfty7Rf
	WznjEq4cJwSRxdLpEhKyYDLjYuuEKbVGIkYtN08Omnr5n32xurbuLFS3Th4/oPuvHZc9JYlxS5dhe
	ppslcncQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwn6h-006c72-1P;
	Wed, 10 May 2023 16:56:03 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwn6d-006c5M-0D;
	Wed, 10 May 2023 16:56:01 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f315735514so254831955e9.1;
        Wed, 10 May 2023 09:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683737750; x=1686329750;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i9y7cGD3DdhxiTnvOkhxIVt549Y/e7kFTE/+uk3TXWg=;
        b=ldXAkfpTo6z8AMiwx38DDlh15ZKGU4BpuVeFTScNNtgMhWVBikjfiQ9n1LZOup0LuO
         3Oop3vDms+w/1o5p6d+s1ifEQo/OMIkmPPYe40yOY3oaxAh4HBxw5avcF2q9QfvXr0zS
         hH/Q/VbxN9finYJmHwuJLGwIoEFF1Tk2TojfdiZuWX3r3nXiAf8hNw6dGoYun6qHqJwu
         TXkdG4c+QMfzHLIXlhuJDrrbZwSRBh49ye5cICAfbwGmecDnoy6gReyu249FaO4vfaAa
         Tx7FWWRVTiWqtEyG1dlnMUYZfzG3JeXxjiQbP0qLIm5ZMsYinSjv5+q0PWXM8+UPx63e
         ca2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683737750; x=1686329750;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i9y7cGD3DdhxiTnvOkhxIVt549Y/e7kFTE/+uk3TXWg=;
        b=kozDW9JxcZJNfhXpjox7tIqTFl3hz29+MpKK0g8dV5+FjjfUTgSVr2gW87+o5hvW0x
         8ytX9DDISlECdlefVT+OYT7T3ukAeG5BUdyxnpK9eNvcLZlYNRwbdHfCe9/UDUfsp7ni
         kpM8pQhbJbQqu/PZFKyAcf3c61F38YAEawQQA99Qg+E9KhjklUX/XWo8vepND3OAxMFt
         fDfiCwfwl6j03UXs3JsoF38ohbW7gfzQFywiTwLarBzSHyKTiNVzwRk71QPhnpvZOFCT
         D1Dvx41PCtDFzTOhGoOQE0+8m30xb5phVuAyFtg7vKhAQrKOGi4b6eJnsuwjk/KWz5UX
         CTDw==
X-Gm-Message-State: AC+VfDxXDJLJaocwO8o0VMp9B04/XPZN7jIG66v/mbK11v52M7LTyh5o
	qJ2sqMW13X7T6amyraIVZYo=
X-Google-Smtp-Source: ACHHUZ4JOPmHj45Ix++KLw55iJfyL9l77zzzY6bH3JYTV32D7R7TFxqwc7S4vI3oaBhXTU4NXdKB/Q==
X-Received: by 2002:a05:600c:5129:b0:3f1:7371:86bb with SMTP id o41-20020a05600c512900b003f1737186bbmr11018982wms.20.1683737749992;
        Wed, 10 May 2023 09:55:49 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id 10-20020a05600c024a00b003f423dfc686sm10585430wmj.45.2023.05.10.09.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 09:55:48 -0700 (PDT)
Message-ID: <a477f921-909e-ae83-f8af-0d794f8859fb@gmail.com>
Date: Wed, 10 May 2023 18:55:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 41/89] i2c: mt65xx: Convert to platform remove callback
 returning void
Content-Language: en-US, ca-ES, es-ES
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Qii Wang <qii.wang@mediatek.com>, Wolfram Sang <wsa@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-i2c@vger.kernel.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-42-u.kleine-koenig@pengutronix.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230508205306.1474415-42-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_095559_123363_273CF12B 
X-CRM114-Status: GOOD (  23.89  )
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



On 08/05/2023 22:52, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index a43c4d77739a..7ca3f2221ba6 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -1505,15 +1505,13 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int mtk_i2c_remove(struct platform_device *pdev)
> +static void mtk_i2c_remove(struct platform_device *pdev)
>   {
>   	struct mtk_i2c *i2c = platform_get_drvdata(pdev);
>   
>   	i2c_del_adapter(&i2c->adap);
>   
>   	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
> -
> -	return 0;
>   }
>   
>   #ifdef CONFIG_PM_SLEEP
> @@ -1555,7 +1553,7 @@ static const struct dev_pm_ops mtk_i2c_pm = {
>   
>   static struct platform_driver mtk_i2c_driver = {
>   	.probe = mtk_i2c_probe,
> -	.remove = mtk_i2c_remove,
> +	.remove_new = mtk_i2c_remove,
>   	.driver = {
>   		.name = I2C_DRV_NAME,
>   		.pm = &mtk_i2c_pm,

