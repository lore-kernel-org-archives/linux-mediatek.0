Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9563AC77B7F
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 May 2023 17:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dMfl0C8EMOIowWqbI/Rqq/+20qm/1u6RPCMDDJIfSHE=; b=jXlsmCiYZ+BdZ4viecQr/vvvSw
	wMQlZkQTjDMHoi++XVIRf8tXrcNikFvixxt7EejtCiTLXBd1Gctzx7v8QJTjFhOXAXiwkzSIjZ0W/
	zwsTFUbcEifmmvqbIgfxGBLOepODE1KoDACDNlk3tlBT21H2ejEUpKZDVmZfobiUbes98cNynGq62
	JAN+TJ1w5H5CN0KxzyFMl7T20DJ9c4nLqRJBn8hGSiAmnACP6ErQd6qtiuVFgNLKgsd8BgpYYsuFS
	M6VSLg/yNRU25cv5LkvJuLzZV1EIOZwIui+CakSjcPaxX3NT1hF71F3PnZ0wR6TX6hpNrkipVgHad
	IV2PoUhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puz0O-00BO1m-25;
	Fri, 05 May 2023 17:14:04 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puz0J-00BO0L-1Y;
	Fri, 05 May 2023 17:14:02 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3077d134028so681075f8f.3;
        Fri, 05 May 2023 10:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683306837; x=1685898837;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dMfl0C8EMOIowWqbI/Rqq/+20qm/1u6RPCMDDJIfSHE=;
        b=U4q6GwkvxBZ02dcyk99ozrFVmaFKd9pXRVdIq/QMfjQfSM0DuYV11qSq3LjQ/eh2hn
         SWoMjUcqXlUtdBEDydU5uR/ThsuXpidINhAN5u5FVfNXQe4U+xXWPT/5GacMC0hOAhUm
         N+9fx7EdGhIgSMeJ/fXhj+tbWfL3jApEH0buSB+7BSDggwjJaF5BC+yOyuqonEktV/BB
         gcj/LQdGZ2QC+glfRh38xbPaj3m6h/eW+L4zktEq3vtrVTipyuZ4jiwGq6ROfK3afeb8
         WFDpXjQvo3HeGWHRzWy/jV1w79bCWpBHYHcwBnGEfOj9izvG0ZDkXscyUbGf7Hrhah5v
         044A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683306837; x=1685898837;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dMfl0C8EMOIowWqbI/Rqq/+20qm/1u6RPCMDDJIfSHE=;
        b=AFmUwA6mlIEfK9KVzlfZLu2pFSQeNM8PltlXMoCVZOoRadjO3w7hKQmSGesb+XPIGO
         hrbjMm0LuzdmXFxKr6LOgJdmznNWA3pjCcDlgl6kJ/a8LkjECRZ4RcJi3jEh1a9lzHpC
         fQYkDoRfIzYymeRrHELrGG3Tst7aW8tz8vis2FCk+TlXxioPte/tqt8QfsW4QryqQGC/
         Gb5MLw9k4RxCPq/jbK7xv/cCt2M3mABHSTP/FVRdTj6ZDTV3ZJSPH58nGZOc3SIdjX4/
         fwMxS+KDZxWnczTOE+j5pdlBJOQ28kbIr/UO0IXgQNOOd8yGebioqAxaSlrnNg7tBAKX
         bNoA==
X-Gm-Message-State: AC+VfDzqOBJzpjk1LqHvEgrUHDA6yLp5k+p6tIvMLFCLDdjaWfHeA5zy
	Mv633vZagJFyZnStKvh9b7M=
X-Google-Smtp-Source: ACHHUZ6hqgTsps9ibKVkPPhU/c2tsc26KuGSdINz19lQutH4+j4O3f6l2AMBZzNuHLaVkM6/FpGKVA==
X-Received: by 2002:a5d:4745:0:b0:306:3ad3:94f2 with SMTP id o5-20020a5d4745000000b003063ad394f2mr1805903wrs.42.1683306837105;
        Fri, 05 May 2023 10:13:57 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id z13-20020adfd0cd000000b0030631a599a0sm2947687wrh.24.2023.05.05.10.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 10:13:56 -0700 (PDT)
Message-ID: <65f4c370-e9fa-c715-19a4-54347c077e53@gmail.com>
Date: Fri, 5 May 2023 19:13:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 06/18] remoteproc: mtk_scp: Convert to platform remove
 callback returning void
Content-Language: en-US, ca-ES, es-ES
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-remoteproc@vger.kernel.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
 <20230504194453.1150368-7-u.kleine-koenig@pengutronix.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230504194453.1150368-7-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_101359_523128_5F7F4C44 
X-CRM114-Status: GOOD (  24.54  )
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



On 04/05/2023 21:44, Uwe Kleine-König wrote:
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
>   drivers/remoteproc/mtk_scp.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index e1d93e63d7df..dcc94ee2458d 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -913,7 +913,7 @@ static int scp_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int scp_remove(struct platform_device *pdev)
> +static void scp_remove(struct platform_device *pdev)
>   {
>   	struct mtk_scp *scp = platform_get_drvdata(pdev);
>   	int i;
> @@ -925,8 +925,6 @@ static int scp_remove(struct platform_device *pdev)
>   	for (i = 0; i < SCP_IPI_MAX; i++)
>   		mutex_destroy(&scp->ipi_desc[i].lock);
>   	mutex_destroy(&scp->send_lock);
> -
> -	return 0;
>   }
>   
>   static const struct mtk_scp_of_data mt8183_of_data = {
> @@ -1003,7 +1001,7 @@ MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
>   
>   static struct platform_driver mtk_scp_driver = {
>   	.probe = scp_probe,
> -	.remove = scp_remove,
> +	.remove_new = scp_remove,
>   	.driver = {
>   		.name = "mtk-scp",
>   		.of_match_table = mtk_scp_of_match,

