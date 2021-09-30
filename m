Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A3DC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 19:41:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D837E619E7
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 19:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D837E619E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1X67SxpzxsNn8lWnvUu/7JZl4xqKkZhg5Bf2sWy0MbQ=; b=cD0MryQY0oCbp4
	sjRx+UEj47am7IQK38IGZEcBFuHjMgvdwh0Azr1+BbJCKAJmeazhO8PwqUgFGFX+t/i3sKCBV/xOK
	UAYtzJ17vwPF7J5xn2Jo6h9wAkCupIwOYdeu/c9Jy+i9gTTHpknoZoLVbZJJrSQJ+aYYgvLCmhtiX
	IF0K17a81PdZVvhL0ovqbO+2sQy9MNgzIBgUIbY8ksuE5NcRAm9CL1SZNkY9KPW3Ui7xlWJu9lUbn
	80TU8My3LvgOhwM3egpk0bntZhj6aW15RAj/nV7kvjK6Ia6o+tyDe4layhosHM7SQq40nDFUS+W8f
	5vkFmOAM+i4oEj3N9vIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mW1vW-00FtmJ-Lk; Thu, 30 Sep 2021 19:41:06 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mW1vT-00FtiM-8q
 for linux-mediatek@lists.infradead.org; Thu, 30 Sep 2021 19:41:05 +0000
Received: by mail-wr1-x42a.google.com with SMTP id d6so11833252wrc.11
 for <linux-mediatek@lists.infradead.org>; Thu, 30 Sep 2021 12:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Hx/tBsdkeGhZxG52QWJPz9Kz/HAe/yuuGxlrpK5+Bs0=;
 b=pGEwkWuKW4obTzm9tbCH+Qhm6GafqSky9gPfAPfj9/ZynrhBmRHqkwF+H9EGA74sZ+
 e65f5loIGlF2z9PQbnab4xRbb3yDQJ/km66crhkHwhTxN1awrIBZNo3u0ERqhPwovU9V
 kwegr6/GU7a9cg+KQ7u51n6TXjbYmROF3vCM4TlVy6iwZ60hnen/i7qJMO9rDoaz9kuJ
 TVZulsdDjJ+zcSoGoLkBHB6sLJrs862Qc2Lg43bki0ztoRX7zWsp7EDGcY5JubxtwWcq
 SBlIX2ZRI0c8idL5Vi1z3XNjCaSY1JOPkyx4pqHbKKIJJu94y6LGa5TWmR8Wb9mZLGSB
 MHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hx/tBsdkeGhZxG52QWJPz9Kz/HAe/yuuGxlrpK5+Bs0=;
 b=4s9lKEqsGN/NNfUqLmfz2YNP/eLyd+QmHZMx8rI0CscAKSmVTz+jBrDibul6Ioyi2o
 RadM0is+REcH3eSSpskGOYFY6B9RWa4PkvmflrFW0mN8vrDkqCkNi0xIQlTzA0TbhagQ
 TIQ1dJbQ98F3NQF7qN98g+90gPMNxmWxEE2IlIFEAJCLW+12zECBL4ZTqNkASLHF6J+Z
 1YYBYAqcRBRepz38qi+m2ibi767W5RMXXe7FXkzooEEaJvo3kTPX1gkQVpZ6XgAwAxbN
 sMNXxQqTc8wOD1M+JkFxWQDe+rVGdpxLeexp85hVuTb6D37SYNcMgWHh6F1xbBW/UFN0
 dHyw==
X-Gm-Message-State: AOAM532wPOLB7cRQ1simQl5RSaHIDOuSKU95oo4EhX9reCInQRopmNZ0
 dLyYm5VsePckXRrEY1bBAeaElA==
X-Google-Smtp-Source: ABdhPJzTZR4PaIT012/kW9Ejx5+BIO/rLhQdspCqmIHaZLLOGMEi/OxAq8Ai70Wk9pA9FTsQaeEIBw==
X-Received: by 2002:adf:cf10:: with SMTP id o16mr8056065wrj.12.1633030859457; 
 Thu, 30 Sep 2021 12:40:59 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id l124sm5576156wml.8.2021.09.30.12.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 12:40:59 -0700 (PDT)
Date: Thu, 30 Sep 2021 21:40:58 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Sean Wang <sean.wang@mediatek.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Matt Mackall <mpm@selenic.com>
Cc: linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] hwrng: mediatek - Force runtime pm ops for sleep ops
Message-ID: <20210930194058.oe5vlqlelilekdde@blmsp>
References: <20210930191242.2542315-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210930191242.2542315-1-msp@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_124103_354266_3D36C0CE 
X-CRM114-Status: GOOD (  22.26  )
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

Hi,

On Thu, Sep 30, 2021 at 09:12:42PM +0200, Markus Schneider-Pargmann wrote:
> Currently mtk_rng_runtime_suspend/resume is called for both runtime pm
> and system sleep operations.
> 
> This is wrong as these should only be runtime ops as the name already
> suggests. Currently freezing the system will lead to a call to
> mtk_rng_runtime_suspend even if the device currently isn't active. This
> leads to a clock warning because it is disabled/unprepared although it
> isn't enabled/prepared currently.
> 
> This patch fixes this by only setting the runtime pm ops and forces to
> call the runtime pm ops from the system sleep ops as well if active but
> not otherwise.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>

Fixes: 81d2b34508c6 (hwrng: mtk - add runtime PM support)

Sorry, forgot to add this line in the commit message. I can add it for
the next version.

Best,
Markus

> ---
>  drivers/char/hw_random/mtk-rng.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/char/hw_random/mtk-rng.c b/drivers/char/hw_random/mtk-rng.c
> index 8ad7b515a51b..6c00ea008555 100644
> --- a/drivers/char/hw_random/mtk-rng.c
> +++ b/drivers/char/hw_random/mtk-rng.c
> @@ -166,8 +166,13 @@ static int mtk_rng_runtime_resume(struct device *dev)
>  	return mtk_rng_init(&priv->rng);
>  }
>  
> -static UNIVERSAL_DEV_PM_OPS(mtk_rng_pm_ops, mtk_rng_runtime_suspend,
> -			    mtk_rng_runtime_resume, NULL);
> +static const struct dev_pm_ops mtk_rng_pm_ops = {
> +	SET_RUNTIME_PM_OPS(mtk_rng_runtime_suspend,
> +			   mtk_rng_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
> +};
> +
>  #define MTK_RNG_PM_OPS (&mtk_rng_pm_ops)
>  #else	/* CONFIG_PM */
>  #define MTK_RNG_PM_OPS NULL
> -- 
> 2.33.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
