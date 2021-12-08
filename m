Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A84C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 15:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fX9P/cXCz0q9BYWiR7mOTVu8+T402ybCerbP6GskpOc=; b=WGpgJrjKsPpe6M
	AXfu2sZqLfq71Phqr1RszEfHMWrMXfYqECshJA0JlHvfSbRc5aHcDnTFJoryUAr5EKRHi0bWcXNNI
	PXdWHxaVWGEqlX8lD6hASXlqnkLRVAHGq729W3aDzyYrVf6IBFEoQy/ZH0dkFWFJTW9jLpM+4L7i2
	iaOcCB7NYAOO1Nx+JRZQv0k+59OgtM+86d1qAt3Dw6NMW9HwwWAxN9MuwGMWGcIqa7Mgagv2ozMRH
	kEjE38rzPQ5lQhgYfvl4Kf/+7TKnvadH6iOL+knD0WvhycZn177JtHjKejVbWzI5L8jOZ4QJpcZ0Y
	reVGBhYMBvYo+CEcgqkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muz7J-00DLkc-NP; Wed, 08 Dec 2021 15:44:25 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muz71-00DLg5-Sv; Wed, 08 Dec 2021 15:44:09 +0000
Received: by mail-oo1-xc36.google.com with SMTP id
 w5-20020a4a2745000000b002c2649b8d5fso920721oow.10; 
 Wed, 08 Dec 2021 07:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IRArnEbMOztmbyOTj+MWlwJucegmDvjTF1PfafI2nU8=;
 b=YjKPpH556mUnunfWLwQX9k7x4QLylXJZUiVkVxzIvM1nLMRBmqHT+7XobjEuYaJccG
 FLJqKrYQeq2j/yDmJRtUkkNHwrs8eMjriypPB5VrvwC52PNKPIpe+Wbt9ME+hG5RFMrt
 srbmJh8pbtr3KRDCdr5QRikqx3Z9rbdalS7bEa1kRyIYb/SEvyfwNnqj1nbV3h4VLiwE
 42Fk+LHPQuWvkjBCRYB0CCMdw9sNkFviwR9eupqUtIjPL165syYlDzpQgq95xqspDNJl
 apwDzIWZv5v2VsKwl9XLag6afOs8noYn19YHYizLPEv2Ts+ovVaM3l0VoYb6Uy/Pg2lw
 3AeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=IRArnEbMOztmbyOTj+MWlwJucegmDvjTF1PfafI2nU8=;
 b=vUYvgHBYDbi+HQvb9yKE7mrjR4ouUN/GiiROQqT1X3CZ6kyLdjHDhJFlqML3QuP2dA
 OCSETPeUj2oVu9TjD9EF9CSbR9inW2G7aaND4DsS5+zCGX+Vj9lB9/WAwWypAy18WerM
 gU2bqKue6z0k0M7fehPTwN3FMUONhJbHOsiV1JHHXyiCPimO8dRWr8RavXFB7NIx+Oq/
 /sGyGYcB0DrQtrCSMkPVZCEfrBqWXIwvcVUdjQHv+2uOesWqkL77TcKITCwwUrv02Kzc
 jhM5EtPWl+VZbWt6s2Y4Jp1x9+2bzYAvFbJrKmZ/qCQnQ6Ew7N+6JvejY6EKpLVpfGKp
 fUiw==
X-Gm-Message-State: AOAM531+tkXM56oF8yyW+xJaWcV1rOYA+wNEyzQSphnQGC4V8LxM1IXp
 tK/cPq5CrdnBdQsMbuSMw7g=
X-Google-Smtp-Source: ABdhPJx1XEhf8O9VtJfXTVdjxdZSEDndjFeVobBKh/ztIW6ZBlvGLRlnbr7rkZAxxlLe2yLbeLhSsA==
X-Received: by 2002:a4a:9292:: with SMTP id i18mr190335ooh.90.1638978246227;
 Wed, 08 Dec 2021 07:44:06 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 i29sm543824ots.49.2021.12.08.07.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 07:44:05 -0800 (PST)
Date: Wed, 8 Dec 2021 07:44:03 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: wim@linux-watchdog.org, matthias.bgg@gmail.com,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wangqing@vivo.com
Subject: Re: [PATCH] watchdog: mtk_wdt: use platform_get_irq_optional
Message-ID: <20211208154403.GA1031331@roeck-us.net>
References: <20211208095555.4099551-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211208095555.4099551-1-tzungbi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_074407_984734_789159CA 
X-CRM114-Status: GOOD (  16.19  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 08, 2021 at 05:55:55PM +0800, Tzung-Bi Shih wrote:
> The watchdog pre-timeout (bark) interrupt is optional.  Use
> platform_get_irq_optional() to avoid seeing such following
> error message:
> >>> mtk-wdt 10007000.watchdog: IRQ index 0 not found
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> The patch bases on linux-next next-20211208.
> 
>  drivers/watchdog/mtk_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 543cf38bd04e..4577a76dd464 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -339,7 +339,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(mtk_wdt->wdt_base))
>  		return PTR_ERR(mtk_wdt->wdt_base);
>  
> -	irq = platform_get_irq(pdev, 0);
> +	irq = platform_get_irq_optional(pdev, 0);
>  	if (irq > 0) {
>  		err = devm_request_irq(&pdev->dev, irq, mtk_wdt_isr, 0, "wdt_bark",
>  				       &mtk_wdt->wdt_dev);
> -- 
> 2.34.1.173.g76aa8bc2d0-goog
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
