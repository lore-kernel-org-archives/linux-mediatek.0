Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C884CC07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 16:06:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 972A8613B2
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 16:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 972A8613B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zgzAbG0+3YhtbF+EwmDP+3uy+yQrTi9yU2DQrbFL3FY=; b=IuX6/ndYTj4T2YKerdyH2G2dJJ
	CGFu9LpZa6TRGhwrGHYrygkZ6BV1dRoN1lbMNrgoog1ioUcCOfEK5MYBlJYCUTKc7RS0zTXT676Nm
	i/7GruFQdbE60rH9kTD5wSs/qn0hD+IPuZPuZD4fUyNGLwOTGX2GLg6WDn2dM5I2A1fLwcSi9SOYI
	QI5nda5G02k+sHfcddw8JUVXlFu/1+3cdWM8ht8gLTMUHQ55h8UgFcmhiJL2VyXGpDmozxbc/TOyC
	bCwBDS/4Rmfx7+QimhtM1g49vu1KxaVhAY9FLUtZDXpGRwxu25AhMYE0WPe8Bn6B4im4802tCcOx5
	Ai4OaKhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3hOv-00E2NM-Cy; Wed, 14 Jul 2021 16:06:21 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3hOr-00E2Lo-M1; Wed, 14 Jul 2021 16:06:19 +0000
Received: by mail-wr1-x42c.google.com with SMTP id a13so3844112wrf.10;
 Wed, 14 Jul 2021 09:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5BCcbn9sQ+2WAV1W0ddQFNY2Jjudynx3nG7rKfKPfQo=;
 b=tbY2A/9UW3C4IiWIJ8huqQaBpLgTqqMCWnsSI9Yb6YVa8YHk105tH7U8c3zP0+gD59
 r9GQdeoHepfM4iqU18ZxhBQQhEkpI0hBjjlsD61sH6QDxWevzhTShAG3vPqpoCIuQ1Dd
 s28UntLr4IFAgk0ueWI9rIFE2OqDXw0he049de17YTdBqrAufXo2i2NzV+TwYessfI4R
 RoJ2HxhMCIGNdErm2gNkE9UPGVCx5vNvoHGTkD5YrTzU4TzEumFHkzpwozeQHToT6mAy
 RbMvIkxHKa24tfbxFLjvq7XjzQyMrDzePSH7D0TFN7NmxnjkcUmlRzG5fJQytL5nWViV
 G5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5BCcbn9sQ+2WAV1W0ddQFNY2Jjudynx3nG7rKfKPfQo=;
 b=DgKMYtm+K4bJN9J5f/k7QL40rEyOnJ4R5e0ORr9VFG/W2/MzRBQJSZGxYEMiEYBRll
 YntdkW5Jauax9+xC7v52tVnauP+HIN0gh+X53CVCDguWmIt+mPAt1beGIxm7aC8oAGDJ
 eCbSegP8wBb5G4qX5nl0W6/U5VjUCHZKbP78kp6oRoL3efctti8oJ/SZRFmN2gzqdzqn
 QzAyBCtfsE+11zNBbdwzloet8Njs/rFN+plT8iqqpXMAAkpuXGncT/gsb3PTeV8Xj0Ur
 8JqDa3bhNTMxKvxK/rcervRqagnJoJdMLWJ6GOZpn1uFztNJDycAbyYIj95WZzB6Y7sl
 CzRg==
X-Gm-Message-State: AOAM530j2g9X0b72ZEOFJ4SQR4+mYP2/iwUzx4H3f/QXQ9v4X2iSSx89
 x9RW82VWB+xT6mTORR/51/U=
X-Google-Smtp-Source: ABdhPJwzYyjjqqKap2uKHDPTnRIs3/bfB11QNMlRlx0gv5rzMeLxGz8oh8/kc9IR93MoEMXgDGwuTg==
X-Received: by 2002:adf:e2cf:: with SMTP id d15mr13961791wrj.359.1626278775885; 
 Wed, 14 Jul 2021 09:06:15 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id z7sm3042060wrt.47.2021.07.14.09.06.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 09:06:15 -0700 (PDT)
Subject: Re: [PATCH v2 6/9] soc: mediatek: add mtk-mutex support for mt8195
 vdosys0
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>, chunkuang.hu@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, fshao@google.com,
 nancy.lin@mediatek.com, singo.chang@mediatek.com
References: <20210710113819.5170-1-jason-jh.lin@mediatek.com>
 <20210710113819.5170-7-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <5685a1f2-c76d-853f-085d-e4e26ce03182@gmail.com>
Date: Wed, 14 Jul 2021 18:06:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210710113819.5170-7-jason-jh.lin@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_090617_771899_F85E355F 
X-CRM114-Status: GOOD (  16.21  )
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



On 10/07/2021 13:38, jason-jh.lin wrote:
> Add mtk-mutex support for mt8195 vdosys0.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-mutex.c | 107 +++++++++++++++++++++++++++++--
>  1 file changed, 102 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index 2e4bcc300576..d74eb3f97f1d 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
[...]
>  struct mtk_mutex *mtk_mutex_get(struct device *dev)
>  {
>  	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> @@ -507,6 +602,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
>  	  .data = &mt8173_mutex_driver_data},
>  	{ .compatible = "mediatek,mt8183-disp-mutex",
>  	  .data = &mt8183_mutex_driver_data},
> +	{ .compatible = "mediatek,mt8195-disp-mutex",
> +	  .data = &mt8195_mutex_driver_data},

Are we missing a binding description for that?

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
