Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F07C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 13:58:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E5D161250
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 13:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E5D161250
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NuAUixmnS2AznJyj5bbz9+e3+SXQXQvpnSQ+4K+ZZHw=; b=qXSitoR8uGNZSefS01M6OIw0uY
	BEjeIcrBB6cPaym0CZ/5GnsWXlVhLvNlA+ZhzaD6Kiia5qxlr0gp0vLn31eqF7nGIY1oUP4rT8bER
	pER71QWE9mGCbcz8acXknhZ3658pZiQZ8VibwNIr9xYBwjOnkORPifYV0Mt4alb0Hq3hiNHMzwt01
	Xo7ORDmxPhw70zc0u4fcr1HliLMfFiHTcOiyxIrNMwfxNGZzmOo/PIsbV8OupfX5HP1AnZxSveEOd
	Ba3QSTPrOBmBNwj+4bs3ctyR975PKvpoTv1JT7uS3MUGrJyRqVszWrZ48NYOcJZEabgbGRRjz9Gti
	BvQBT/bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAYRv-00GVpP-Rz; Mon, 02 Aug 2021 13:57:47 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAYRs-00GVns-PP; Mon, 02 Aug 2021 13:57:46 +0000
Received: by mail-oo1-xc29.google.com with SMTP id
 f33-20020a4a89240000b029027c19426fbeso1969036ooi.8; 
 Mon, 02 Aug 2021 06:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4innsOL2Q3KWcAqQhqXiBn1f8Lxu8dmaKQoSumnZeAQ=;
 b=baBe0MLf4OGBzPDNUbm3SqMz8awtAC42JZbCrY8lNcgy+SIKA3mV20Sabr85Uclj1t
 ulimS87lHCCYqmtw3yI1mXPXnA+HyXbwamwWqeOtNxnw/sHUQzGOUZ7pUw7Tg9FlS3fM
 moMSkGtSAxBNug0WN0qY9P8SMJcoZA4wQeHLDyUx7u2OmM0QiCrkogZLKgUJZvjcN2bD
 iyJOFJCxjaU0igeXBbEK3p/KbZpIV4da91luDcGi8U0QbdcKf/9Z1jkcb3Nrwb2l0Ltx
 fMc4u3KA+7u+8bOdlJ7BaO+AdRxFIlN17MaeW4hd12cU6sQtwvXcnlyr28TR+wbFN99z
 dDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4innsOL2Q3KWcAqQhqXiBn1f8Lxu8dmaKQoSumnZeAQ=;
 b=WqiR2QQ49PzBBJkyWMpMJU5fMIlnINnbS5JVxK1BMWLAbuWuz87bG/aeChh2ARV/Ch
 nnnxBMO2JueIlMlc6HPcuyJj25bpriZrNT/WAbjA3k0+lvvJLe6gYrZeeNzmT2gRMw8l
 OrH4btjN3S1dbK9DAvq4v0hAtN7w7tTUGeKxCIZbarstUGhsxwp2J4ky4f/BFkoF6/0Y
 L46SqxA47ivCbSPiV5Kv6ZjFdxTD1M2K20087lkVentVZrg24owU1jA6T6gaRgcEMKWK
 KrJVXD20DCVHBbDpyDej8mD4g4ca88VSEUxaftBkm+CFMeHzZr/EnlxhXdeZycJQlQKS
 Z+Sw==
X-Gm-Message-State: AOAM531zWoseTiCprsGG0IZ4k8UlWKz8SVXJWRxioEedEMITzVxHT14D
 HUSQPAv7nb1Y66uzfjHCu6M=
X-Google-Smtp-Source: ABdhPJyiMuR6up32Ii8P3kcZU8ODU5bQh+TRUkFM/vZhIPbYC7x5JcFxqU3XUxk69wOs4DetH5ciig==
X-Received: by 2002:a4a:ca8b:: with SMTP id x11mr10773342ooq.16.1627912663328; 
 Mon, 02 Aug 2021 06:57:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d24sm1793012oic.23.2021.08.02.06.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 06:57:42 -0700 (PDT)
Subject: Re: [PATCH] spi: mediatek: Fix fifo transfer
To: Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Peter Hess <peter.hess@ph-home.de>,
 Frank Wunderlich <frank-w@public-files.de>,
 Tzung-Bi Shih <tzungbi@google.com>, Hsin-Yi Wang <hsinyi@google.com>
References: <20210802030023.1748777-1-linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <836776f1-5b8d-ba18-2bd7-3b21673a8b82@roeck-us.net>
Date: Mon, 2 Aug 2021 06:57:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802030023.1748777-1-linux@roeck-us.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_065744_867238_6E220475 
X-CRM114-Status: GOOD (  24.04  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 8/1/21 8:00 PM, Guenter Roeck wrote:
> Commit 3a70dd2d0503 ("spi: mediatek: fix fifo rx mode") claims that
> fifo RX mode was never handled, and adds the presumably missing code
> to the FIFO transfer function. However, the claim that receive data
> was not handled is incorrect. It was handled as part of interrupt
> handling after the transfer was complete. The code added with the above
> mentioned commit reads data from the receive FIFO before the transfer
> is started, which is wrong. This results in an actual transfer error
> on a Hayato Chromebook.
> 
> Remove the code trying to handle receive data before the transfer is
> started to fix the problem.
> 
> Fixes: 3a70dd2d0503 ("spi: mediatek: fix fifo rx mode")
> Cc: Peter Hess <peter.hess@ph-home.de>
> Cc: Frank Wunderlich <frank-w@public-files.de>
> Cc: Tzung-Bi Shih <tzungbi@google.com>
> Cc: Hsin-Yi Wang <hsinyi@google.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

I should have added here: If this patch isn't acceptable for some reason,
commit 3a70dd2d0503 should be reverted because it is obviously wrong
and introduces a severe regression.

Thanks,
Guenter

>   drivers/spi/spi-mt65xx.c | 19 +++++--------------
>   1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
> index 68dca8ceb3ad..7914255521c3 100644
> --- a/drivers/spi/spi-mt65xx.c
> +++ b/drivers/spi/spi-mt65xx.c
> @@ -426,24 +426,15 @@ static int mtk_spi_fifo_transfer(struct spi_master *master,
>   	mtk_spi_prepare_transfer(master, xfer);
>   	mtk_spi_setup_packet(master);
>   
> -	cnt = xfer->len / 4;
> -	if (xfer->tx_buf)
> +	if (xfer->tx_buf) {
> +		cnt = xfer->len / 4;
>   		iowrite32_rep(mdata->base + SPI_TX_DATA_REG, xfer->tx_buf, cnt);
> -
> -	if (xfer->rx_buf)
> -		ioread32_rep(mdata->base + SPI_RX_DATA_REG, xfer->rx_buf, cnt);
> -
> -	remainder = xfer->len % 4;
> -	if (remainder > 0) {
> -		reg_val = 0;
> -		if (xfer->tx_buf) {
> +		remainder = xfer->len % 4;
> +		if (remainder > 0) {
> +			reg_val = 0;
>   			memcpy(&reg_val, xfer->tx_buf + (cnt * 4), remainder);
>   			writel(reg_val, mdata->base + SPI_TX_DATA_REG);
>   		}
> -		if (xfer->rx_buf) {
> -			reg_val = readl(mdata->base + SPI_RX_DATA_REG);
> -			memcpy(xfer->rx_buf + (cnt * 4), &reg_val, remainder);
> -		}
>   	}
>   
>   	mtk_spi_enable_transfer(master);
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
