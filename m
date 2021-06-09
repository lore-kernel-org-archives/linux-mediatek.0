Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6AA8C48BD1
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 14:14:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0BE061364
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 14:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0BE061364
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0x2aoK6i48WhC2Ry6tW0sOvZNl2OfSsOBFoW3xtO9pE=; b=Jk4nu2zMxFtG3EfN9uOrHMzhRW
	gu/acbiqemiTRO1pjXLfkS1EpxoxOSWv1jbBJT7+q/ZbSvoSHwO5uS4tZgyUtdCe4VGcce95biUuU
	Jz+WeQ4jqu6AuRMaEmJX6aB/ylWPfieLCr4WXelhjBoIVV1KhxZD7wwWDTH6AsqRlNGdS0NAfwZke
	TZG40ImdNNAHI6OJT4RcOXig/tJyiRXVNwgGHlD8CSCGLZWMFAOrWOETciuBe6DMkDNIEd0c6OFNW
	WcLy/EdqxhbOzOvL0s3v0fq9SvPsUEUamhD3CHd8CUneJcK8Cw/7fJvaLUdYYKN6STqQIE3vqA2Ea
	C93MzKJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqyxz-00EEr9-Sq; Wed, 09 Jun 2021 14:13:59 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqyPR-00E2KJ-Ob; Wed, 09 Jun 2021 13:38:19 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 m41-20020a05600c3b29b02901b9e5d74f02so1135012wms.3; 
 Wed, 09 Jun 2021 06:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2XtC26dDQI+8z2NBND3LcVHi35tPI4TG6eO9es29Zac=;
 b=DzJMNm+3h04RwqPbHWExMNYCF+kaN1b1pLrOfQW7uU+gGHoukXnx3AUoHcpShlEZO0
 G71QT3Yq2vT78oEWlHeQbmVZbe6WM94LtTSdjT/VxIglyPKyK3Q2T/JDNndT0yPXJsLv
 dzSJJGkGwPqQfbRaTULkHwERsRxu0yYuZnTzhu1Xntt4qzZgrVQnNR77xZGHBK9l9stF
 BXbE4iv+o0YLeRS2xXM1E2//e2UMHJyrgFdOtBoiyUlO/bQ62I9kCR/NdZq1THpFdIzK
 9DCO2qzA06o/FOLDmZ7BKKEoefE45EM+fOjGHTirVfQMUhogaiE+NoMOAtVlA0BO8b+B
 FG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2XtC26dDQI+8z2NBND3LcVHi35tPI4TG6eO9es29Zac=;
 b=P0zdh65u9dQu0SuNeGsesEYpFYietqmpB1coTu2fN12j3MnZnX/JrDbC57sElBzaTs
 l/vx5kyi0Ha4cyjj3hfdYK4Ci7GwNzyFPoQYg2yxbmBLzDto9OUXBJkSqLP0YjNQ1QnJ
 9L+glDT8nzySCqDtmoBMrQbWPRQqzkWkDzqLxAc5VzAGR1WCemNLG1BNCW6DBlwGfTze
 xNi7XSYFend/ZNAmOrjg6djYe9zjl+CGrg9eR4+3fKd0eksppbMpoTIYeAxo8p94v1W0
 znBCdSB3HR2gWr8Kdx/TcDU6DLJ5sTnUuGCU1pSa6C8ckDiD9+Yzy8dU4M21cZXs0zX5
 iepw==
X-Gm-Message-State: AOAM531fyUh/bE6VMFkQE8dvPJZ5kBT1YSi1Tuz09Jh3r4V7OR2itSn5
 +0vj2clbgpl5XRZ3nqM5Bmc=
X-Google-Smtp-Source: ABdhPJwRn7xOH9cpkumSJykpQHFyX0W4qhaLI33hiASlySCZeUqCvFm4zsH9ez6+Ei9TmMDVCfoy+Q==
X-Received: by 2002:a05:600c:190f:: with SMTP id
 j15mr10147185wmq.4.1623245895818; 
 Wed, 09 Jun 2021 06:38:15 -0700 (PDT)
Received: from ziggy.stardust (81.172.61.185.dyn.user.ono.com. [81.172.61.185])
 by smtp.gmail.com with ESMTPSA id u12sm2793979wrr.40.2021.06.09.06.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 06:38:15 -0700 (PDT)
Subject: Re: [PATCH v5 05/16] media: mtk-jpeg: Use pm_runtime_resume_and_get
 for PM get_sync
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com,
 chao.hao@mediatek.com, ming-fan.chen@mediatek.com, yi.kuo@mediatek.com,
 eizan@chromium.org, acourbot@chromium.org, Xia Jiang <xia.jiang@mediatek.com>
References: <20210410091128.31823-1-yong.wu@mediatek.com>
 <20210410091128.31823-6-yong.wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <82aea4aa-0007-369d-9c0d-db0077471b80@gmail.com>
Date: Wed, 9 Jun 2021 15:38:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210410091128.31823-6-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_063817_885438_2208F8C1 
X-CRM114-Status: GOOD (  17.26  )
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



On 10/04/2021 11:11, Yong Wu wrote:
> pm_runtime_get_sync will increment pm usage counter even it failed.
> This patch use pm_runtime_resume_and_get instead of pm_runtime_get
> to keep usage counter balanced.
> 
> CC: Xia Jiang <xia.jiang@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index 88a23bce569d..a89c7b206eef 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -920,7 +920,7 @@ static void mtk_jpeg_enc_device_run(void *priv)
>  	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>  	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>  
> -	ret = pm_runtime_get_sync(jpeg->dev);
> +	ret = pm_runtime_resume_and_get(jpeg->dev);
>  	if (ret < 0)
>  		goto enc_end;
>  
> @@ -973,7 +973,7 @@ static void mtk_jpeg_dec_device_run(void *priv)
>  		return;
>  	}
>  
> -	ret = pm_runtime_get_sync(jpeg->dev);
> +	ret = pm_runtime_resume_and_get(jpeg->dev);
>  	if (ret < 0)
>  		goto dec_end;
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
