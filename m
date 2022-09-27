Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FFAC54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 13:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5A9tE5XjShKgk0dp4mGM6QaE+oB3gw3GtO9g42ZRvK8=; b=WZ0g38TU6NsPcmxuFdWVgoRdan
	+1zZPoN//iKYLJMu9Sfk+Rz7Gd1K+8YV/M+SkdY3v9afrr8CcNz+L+MK1C2KcvCdRNnvrKeLvUxAW
	dftcKm5anVJxWY/6BEmdenzG1kxPEhF2gH5aRCGpcT5yLmGoNqUfcRchPYsBE7xcsHYLe2mGIVOY8
	2jhJu40gH4K1w1cpmLWTqASLIl3Qiw6vzwjxzCrQHhQROSPPRXaB3SQEj/GfBrv3I0a1C/QY5CsSd
	AGIolSwo8MtGlTu8+rKoaO4XUjlQwsWRGpR/UP33y4scSJpUt7nufUKwbSv/7AZKv7K+Rcx5c/cY7
	wSqXVibw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odAG4-00AfhM-R5; Tue, 27 Sep 2022 13:04:20 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odAG1-00Aff6-Ht
	for linux-mediatek@lists.infradead.org; Tue, 27 Sep 2022 13:04:19 +0000
Received: by mail-pl1-x62e.google.com with SMTP id w20so8991010ply.12
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Sep 2022 06:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date;
        bh=5A9tE5XjShKgk0dp4mGM6QaE+oB3gw3GtO9g42ZRvK8=;
        b=K6t+GiDMxCE5PqXx9M7wnOxrmVe8RhMGvnDnBYG8NOKa2YssCusIkZAF4W4yvOQESA
         grgJhoRBvxxax0+eCuPKh8p2W5rWUX6HXDrfWlnt3QOGcvz2Z0pKWEx5bc2keTzCKDPA
         EFNonbeyTfJxCD6F40ovXsaSvZaA6ciUzimvjumUgzudbGcVF+jQjdL0HxEI5YO8kDxR
         uaL+FNOyGJVlqjEpMvpc2MXt9w63j7o81b3Y3ky55r6MbLY0d+jh1dOdyFrtP5/68Jsh
         ZON8Od6QdsueW9v6KQ7nfWtM/RdVCng56yDGIVeLLVpq3zbI72tvF/vuGVGpBIBmWRps
         bqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
        bh=5A9tE5XjShKgk0dp4mGM6QaE+oB3gw3GtO9g42ZRvK8=;
        b=5UibdTonqkTWaZHz20ywiRmlhp3eEA2/pNJ+E5/eO9CZiCPfussOxlZHtjsYb+OTkq
         +T1a6j5wYwYpvNfhPyz7TbMv3qlXZvLCjy0+mLBc3K7AfZJpvmEmYNdzUocupQuCeT52
         Hp3KJgkQy4T+saiEzoSE4M9kXiRN4yjbc4ZKUXLRmus9ShQdNltkU1n4dlawpgm/mCwx
         XRovGvmUBFnts85Er8xLzqey15JJKYxMSiK78h82ImrutJHhSTvAI/1lKSrzIQOqk1/h
         hmP3CfffRiYiRu5wyeFDh2CPcoa3KevW+kOGsUOFl7WKpIEWZWPHLhTH/kPUBYNcyZ44
         Kiww==
X-Gm-Message-State: ACrzQf3Zgk/39tGnLNj0qPJ03b3UAg+glSJUpRaWuvgLLZCyIoXsK0Sn
	M7QDzUPsU1n1Uk/ELYEreLWkDuzoMcZfQzgBBHvqwfPixtQ=
X-Google-Smtp-Source: AMsMyM5gawCoKKBTAHhXh48htU73+kqaFhoDJNb7qglhir+j3HxUZ0tCej0iXrKwzR9+MRTcHiP7gPgmwpcjXrYibm8=
X-Received: by 2002:a17:90b:33c9:b0:200:a0ca:e6c8 with SMTP id
 lk9-20020a17090b33c900b00200a0cae6c8mr4481943pjb.147.1664283852916; Tue, 27
 Sep 2022 06:04:12 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Sep 2022 06:04:12 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com> <20220919-v1-17-4844816c9808@baylibre.com>
 <a0a3c427-c851-ae5d-4010-e94740bf9f6e@linaro.org>
In-Reply-To: <a0a3c427-c851-ae5d-4010-e94740bf9f6e@linaro.org>
MIME-Version: 1.0
Date: Tue, 27 Sep 2022 06:04:11 -0700
Message-ID: <CABnWg9s3N_Ua9g0S3x0uj8PN4FtOX6DO+zQcBzGFqoLTL1J24A@mail.gmail.com>
Subject: Re: [PATCH v1 17/17] drm/mediatek: Add mt8195-dpi support to drm_drv
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_060417_854864_C5F895FB 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

On Thu, 22 Sep 2022 09:20, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>On 19/09/2022 18:56, Guillaume Ranquet wrote:
>> Add dpi support to enable the HDMI path.
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> index 72049a530ae1..27f029ca760b 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> @@ -820,6 +820,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>>  	  .data = (void *)MTK_DPI },
>>  	{ .compatible = "mediatek,mt8192-dpi",
>>  	  .data = (void *)MTK_DPI },
>> +	{ .compatible = "mediatek,mt8195-dpi",
>> +	  .data = (void *)MTK_DPI },
>
>It's compatible with the others. You don't need more compatibles.

Hi Krzysztof,

It's a bit confusing, because this compatible is used in both
mtk_drm_drv.c and in mtk_dpi.c

Albeit it's entirely the same thing regarding the mtk_drm_drv module,
it's pretty different
regarding the mtk_dpi module.

Thx,
Guillaume.
>
>Best regards,
>Krzysztof
>

