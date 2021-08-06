Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8DB7C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 10:42:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4561261167
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 10:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4561261167
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=B8+lclorGs0T7e4BwXfK43IOsRAafkTk+GLCKOu4nAQ=; b=HB8gMDLA9b3P+dN7VBTOPmgLdv
	XRZMznoo4/Y8EeSo7vXONeoehXnYf23alb9YW9SvCNvGJ7g/1RRUvYMEvNUrgKJBpq9OYhbW57eiH
	C7pCkTWA/mGYuw/GOyzVbUQc5kgjbjWPzoKAU+52zcbVgCLIkc/HRjtrVGWPRX0aZg8IiaR+RAeMM
	TcLrnnrCCrk82gWSTAqO5YF9ttrqMVT1uz2cb3rRg1sM/LDceXkhQDMOUiXouew7kP842QCH2fVc7
	lBsOTlrn3TQaLUqGoHrhntVBMsyQrhAgcT043abdgHa5Mm8MLvpKicGzM25f43o45Y23/h1tPQdgo
	FBneu/3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBxJG-00C9aS-19; Fri, 06 Aug 2021 10:42:38 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBxJC-00C9Zx-TV; Fri, 06 Aug 2021 10:42:36 +0000
Received: by mail-wr1-x431.google.com with SMTP id b13so10493108wrs.3;
 Fri, 06 Aug 2021 03:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/Fj67vOhz3zmXYi3Qy2zVy0So4Mw59Xgs1vAgB0E0YQ=;
 b=KnFYoJFHiqhapmSUUGCFGUDZh0IMJPp9qJHWp3iTHyXOdfFF4OSN6Gtf4egRQ1fCw5
 +pi5v7V4UFShrw5/hC5Mjfxuio88BndrAUh92piTUUUNY+yc/J7I+CB/PSKZz2XFU6RD
 mAR3geycppZUM3nP+oAX/l7VdWidLunwdInVG0lcK+XX+m9By8vbp7sxmsFodSkbmrV6
 GMXXZut9YmDc/jkBmbqlMsbu3gJ9BRAfw+79XSOxvJW7srdccSiHY2m0bjRWxSk95IR7
 ixngMx+hNYnOJ3jzP6ST5Rz6vXDx3AxMFE+Zvub/UqP7X9sb3oeuUiE2qHHcgnR4/JOc
 37TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Fj67vOhz3zmXYi3Qy2zVy0So4Mw59Xgs1vAgB0E0YQ=;
 b=BvyG+miPRIy8GPk0NCVIq8nxhZj5PG/d0yf2TExOuGYHwBnA0yQneAxrL8KHgz7V4g
 YDM0twOA48c3EOshzUVWYDtEfUUPdm/60PqJIaeO4T8hDoR9vWAOEpN03tV9ay0L0vYA
 O4+PyMTyKsVTVO2xUkdJPMyctOtmPETlIC3H7yh6HBFPuyE5XTf9IpAx3T7i/FOIvmgo
 b5jWypSMYa+7UE9axCZmQkYvqmCOvuzK8TGyzAz8np5yaT9mRZEOX8RKKcMvJGUY8sFl
 WI4RoQulskJdVcy33mnf/Pr6PSjcnONWq/UCxDNGBnw5gjpkeAQCPhXqX4aTpP+BvJLz
 b5bw==
X-Gm-Message-State: AOAM532/dmGMIwg/XZ9pwgXFBLJqRyZmltiOV9r6TD30Q3jPTob/IcyL
 BZFpdURepfqyFWEr/3g58o0=
X-Google-Smtp-Source: ABdhPJxbkatffN2NdQfvVb8GL6t7oz55edCNarBDIyq8u8iv+IFT4WDTO8j5qwIv7QK0j/7lzdDVqw==
X-Received: by 2002:adf:e0d1:: with SMTP id m17mr9870192wri.233.1628246553431; 
 Fri, 06 Aug 2021 03:42:33 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id x9sm12066410wmj.41.2021.08.06.03.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 03:42:33 -0700 (PDT)
Subject: Re: [PATCH] mmc: mediatek: add wait dma stop done flow
To: Derong Liu <derong.liu@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wsp_upstream@mediatek.com, Peng Zhou <peng.zhou@mediatek.com>
References: <20210806023055.29524-1-derong.liu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <dae1e028-d817-aba3-cc11-546a07865cda@gmail.com>
Date: Fri, 6 Aug 2021 12:42:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210806023055.29524-1-derong.liu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_034235_002286_75944DC5 
X-CRM114-Status: GOOD (  16.34  )
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

Thanks for your patch.

On 06/08/2021 04:30, Derong Liu wrote:
> From: mtk13858 <derong.liu@mediatek.com>
> 
> it needs to wait for dma stop done after set dma stop.
> 

Please provide a better commit message. Which bug do you see on which SoC? Are
you sure you can apply that to all SoC without breaking stuff?

> Signed-off-by: mtk13858 <derong.liu@mediatek.com>

Full name please.

Regards,
Matthias

> ---
>  drivers/mmc/host/mtk-sd.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 4dfc246c5f95..1dfd2842471b 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2339,6 +2339,8 @@ static void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
>  	if (recovery) {
>  		sdr_set_field(host->base + MSDC_DMA_CTRL,
>  			      MSDC_DMA_CTRL_STOP, 1);
> +		while (readl(host->base + MSDC_DMA_CFG) & MSDC_DMA_CFG_STS)
> +			cpu_relax();
>  		msdc_reset_hw(host);
>  	}
>  }
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
