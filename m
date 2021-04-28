Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630DEC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 19:53:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 943FF61419
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 19:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 943FF61419
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vTTMiwKwY/JsYOrkyJqby5MESDnCKdhE13Eu01EEOBE=; b=Hv0KrFrdRQxrf/+N0iWkMAQJh
	kZ0LOb1/NVTl8Np9edqEHsWhOyLkq/pEAwHemu14XKF+vmG/3IwO3D15od1KB3BXJgK9arM1Yy+fn
	vYEUQgseJcDZQ4DsXl8/7KYUWmk4swumrGK+fhSwUzG7sqheKcAHRMnHHFAp1YyW9C0PSEVgXcrN2
	5VZ2cjGpfr8fpDpfXfnniOZ3526RhBgx9EK9GaW1fbNnFboY3PqWeFnnX9XW22WF04rMXaaVCa7eC
	Vm+GsqkMnAko3njGASAkAJmWIX36XrkZqPWSCRA7wJZ9Fw89RA1999KQOS2btLBGoc77s3ytpolf8
	C4IgSow7w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbqF7-004BSY-Tu; Wed, 28 Apr 2021 19:53:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbqEn-004BRA-NQ; Wed, 28 Apr 2021 19:52:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/pKytGN9W8sMrVQvaOgwD5WVJi+L1fCKHCS1G7ffXOI=; b=HfMwNQlsYQbjIPzqbiXapAeFi/
 H2ekOuGbb4KpnZaGf9cVFvxZ00Lunh5eK5cAgfrl+e4/WAbAbgvgF6/Kn0U+gHsfx1DACzwKcgf5M
 oxHDl9OCXdcYYTaTVlyxThjrNg0pi5NxjuGJyPNtCeLZEoU6AnEfqeu/KG3xAooU4CwrUihGUBEgD
 S88L2nG2edTopIQx1q/LRccLa5L98Szv4lr14eD019A/NhfiuddQLauluHl43Ro4OhSUM5BNCMubK
 Tv1neqzgJ8C89lmVN9FQRspya1vIjXxFCg4ZUu9IWmDCR0B/VhbGTvwskJ9WlGU6Y5iYkAaCGxX4L
 J/wKtqug==;
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbqEk-0009YJ-R6; Wed, 28 Apr 2021 19:52:44 +0000
Received: by mail-pg1-x536.google.com with SMTP id j7so36103050pgi.3;
 Wed, 28 Apr 2021 12:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/pKytGN9W8sMrVQvaOgwD5WVJi+L1fCKHCS1G7ffXOI=;
 b=JdOCV6VmnRIbLKx6LWiszLtHYvAkv+YliD1uLto2Y6DskP5feuZ1MAw4DS5RW+HFJ4
 8zokwR1WHii0SuYzgFVWPHNRgWI2AhhKkMrVqbnzSEaj6wOzopLJEtFfaSPgjJw5s+n4
 TqSWWAyy/KhkQhxPCVoRPlPl/7SgukqcyWd29bGs7Xqy+ieZDwu73MCwq3zdFz7Ptv4m
 em525mqmueFIEMONZbRdU4RmW47dKUG3CSlM58KGTgefI2jgeiuNd3EDF9xy+/XBg0Tn
 EHOVhT6zqINh0wW8wIEmpoX7xxxNP5C3fZngAkZfSz5954/GGsLV+kCtrhoV1hk/hYXc
 OM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/pKytGN9W8sMrVQvaOgwD5WVJi+L1fCKHCS1G7ffXOI=;
 b=Eb9XBW5rMOMZChjUtLVpRUijI1f5seJtsvZduV9HxAKUAgIdWK6sKrdQX+L/bj4skg
 XwH8TB2GXf0RhwT5ne5HC4VV9tnEeKEW9c4QZ1BeTQw9E6W2kTr0oguz4WP7/hUGRT7a
 ptG19CwTaaR6vlVf78BkYswQnNc8t7WC/urbf7gTq+SgBAEHX0j5I9uC//CyFk7U3Iub
 JyKCp19OgvYbO2OlFvZ7rpPafF728TjB5rwYh6Sq37OFFQPbh3Hk22pQfEFETVSgI+tu
 dJqc6UrlJivJwucHxG6NyvzBdIFUPoxf4djhViAnU+075dDx6eSyl7U/OgF6b6bQDiFN
 Evkg==
X-Gm-Message-State: AOAM533IrwUINrgIUkHtPSq317c613hifKUxIo6eG0ew+OOMuj9yrT+n
 TViKSQfMZnFC2+IcDNMFtV4=
X-Google-Smtp-Source: ABdhPJyR42PL2NF7XSqxdOxYCe5B8OyzbVldVe5KhSgU38V4lHZ6FgoTjWcNp+kqYN7WP3BqdhkR9w==
X-Received: by 2002:a63:5d18:: with SMTP id r24mr29461665pgb.94.1619639561456; 
 Wed, 28 Apr 2021 12:52:41 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:84c0:9bcd:2e20:f79d])
 by smtp.gmail.com with ESMTPSA id 123sm430826pfz.127.2021.04.28.12.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 12:52:40 -0700 (PDT)
Date: Wed, 28 Apr 2021 12:52:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, fparent@baylibre.com,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] Input: mtk-pmic-keys - check for NULL on
 of_match_device()
Message-ID: <YIm9Bb3eBjYwY53R@google.com>
References: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
 <20210428164219.1115537-2-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210428164219.1115537-2-mkorpershoek@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_125242_900609_942356E4 
X-CRM114-Status: GOOD (  26.30  )
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

Hi Mattijs,

On Wed, Apr 28, 2021 at 06:42:13PM +0200, Mattijs Korpershoek wrote:
> mtk-pmic-keys being a child device of mt6397, it will always get probed
> when mt6397_probe() is called.
> 
> This also happens when we have no device tree node matching
> mediatek,mt6397-keys.

It sounds for me that creating a platform device instance in case where
we know need OF node, but do not have one, is wasteful. Can
mt6397-core.c and/or MFD core be adjusted to not do that.

> 
> In that case, the mfd core warns us:
> 
>   [    0.352175] mtk-pmic-keys: Failed to locate of_node [id: -1]
> 
> Check return value from call to of_match_device()
> in order to prevent a NULL pointer dereference.
> 
> In case of NULL print error message and return -ENODEV
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index 62391d6c7da6..12c449eed026 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -247,6 +247,9 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
>  	const struct of_device_id *of_id =
>  		of_match_device(of_mtk_pmic_keys_match_tbl, &pdev->dev);
>  
> +	if (!of_id)
> +		return -ENODEV;
> +

So if we make MFD/6396 core smarter we would not be needing this. I
guess there is still a possibility of someone stuffing "mtk-pmic-keys"
into "driver_override" attribute of a random platform device but I
wonder if we really need to take care of such scenarios...

>  	keys = devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
>  	if (!keys)
>  		return -ENOMEM;
> -- 
> 2.27.0
> 

Thanks.

-- 
Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
