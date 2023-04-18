Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F7FC6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 16:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTdlBH7gDMe1gwvvIrce6g7Kee26bgpxsr6cq5gCaQM=; b=LOKN09nnFqCWBX6htedNbmGZ1I
	xfSJ4cr97EBC4HhdunxWl0PIuK4fCykzWl4tFlp7WNnMS7tcLPkhJeYZD1cJbtKWhfskH6k3zKue2
	rrxVF3Twvadw8PRPlHDCCunfHcJPMApHI6brukWNW850mkX/XwpYuGWbmtVV9woMRU2OQAQkeF1S+
	ACy7A4rDwJpx4fhmyfYx3SafN981yzI8FukZY0Sv/gHLoifunrKG3t0INTZCdWnq6WheLfm2bsmP4
	r5W6lk+8XjInwdtwFQ1ZkQE/49kAM2P444oYLwYGxdGAtvl+w+bNL2ONfHc9cFFj9EdzFQrllJUIg
	P8E7Jfbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pooCB-002mBt-10;
	Tue, 18 Apr 2023 16:28:43 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pooC6-002mAG-2h;
	Tue, 18 Apr 2023 16:28:40 +0000
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6a5f21a0604so635593a34.2;
        Tue, 18 Apr 2023 09:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681835318; x=1684427318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTdlBH7gDMe1gwvvIrce6g7Kee26bgpxsr6cq5gCaQM=;
        b=GigAWhtw+0qM3cnlRSaOZKXPVwEXYKvfKpTXV2cjckzMTd4t/SnEajnt62LCC0+/y/
         BlIwhIM2SGkocgpuFKRf8pFS3RHUTmy/nYU3QLCbwAsYWTIVBup9zNgPk5n/f5NI91SJ
         AAccAs7BWeceoI+ZLJs3Yi8UHCo2uv0ih3d81Uj0gWBO2oGKC2am9cWOA+2D56K84tOY
         7RgiPHJ0UfP/ZahhhB6IM9z1J0Krxg8lOLr42CdH8iAQnYF9xnJevOwAcwp7Z1EEAdvx
         rfCzj8hlPDfCXN5g+LaQKHs78Rj6J3+IaX511a2fpVAlFwru+pN8hWzMeBkbdgHXhDIE
         pdIg==
X-Gm-Message-State: AAQBX9e/N8bniziGMb4KyLE6PmBYOVDdGgeh9CKWIHObOBaIv/IRV8By
	ebCQ+Npc7Jyc2g4r/+P5hA==
X-Google-Smtp-Source: AKy350ZFkf368usk4zZSQ/xerYs5DI4VOYXV+JxF5CSCs1hhDwPdmg4CpIlRzCupHO97xwwOs5n1Dw==
X-Received: by 2002:a9d:7b45:0:b0:6a5:fdec:e1 with SMTP id f5-20020a9d7b45000000b006a5fdec00e1mr1075466oto.16.1681835318049;
        Tue, 18 Apr 2023 09:28:38 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l23-20020a9d7a97000000b006864b5f4650sm5788490otn.46.2023.04.18.09.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 09:28:37 -0700 (PDT)
Received: (nullmailer pid 1811524 invoked by uid 1000);
	Tue, 18 Apr 2023 16:28:36 -0000
Date: Tue, 18 Apr 2023 11:28:36 -0500
From: Rob Herring <robh@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] thermal: mediatek: Use of_address_to_resource()
Message-ID: <20230418162836.GG1764573-robh@kernel.org>
References: <20230319163231.226738-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230319163231.226738-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_092838_874363_139E0E99 
X-CRM114-Status: GOOD (  15.84  )
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

On Sun, Mar 19, 2023 at 11:32:31AM -0500, Rob Herring wrote:
> Replace of_get_address() and of_translate_address() calls with single
> call to of_address_to_resource().
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/thermal/mediatek/auxadc_thermal.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

Ping!

> 
> diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
> index ab730f9552d0..c8a3acaf56c1 100644
> --- a/drivers/thermal/mediatek/auxadc_thermal.c
> +++ b/drivers/thermal/mediatek/auxadc_thermal.c
> @@ -897,14 +897,12 @@ static void mtk_thermal_init_bank(struct mtk_thermal *mt, int num,
>  
>  static u64 of_get_phys_base(struct device_node *np)
>  {
> -	u64 size64;
> -	const __be32 *regaddr_p;
> +	struct resource res;
>  
> -	regaddr_p = of_get_address(np, 0, &size64, NULL);
> -	if (!regaddr_p)
> +	if (of_address_to_resource(np, 0, &res))
>  		return OF_BAD_ADDR;
>  
> -	return of_translate_address(np, regaddr_p);
> +	return res.start;
>  }
>  
>  static int mtk_thermal_extract_efuse_v1(struct mtk_thermal *mt, u32 *buf)
> -- 
> 2.39.2
> 

