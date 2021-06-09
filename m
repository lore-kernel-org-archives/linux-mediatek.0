Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED13AC48BCD
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 15:55:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B063960FEB
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 15:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B063960FEB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=K4AKKZaE/GeoXmM4QFp+Hr0/tc0llOitFlQ3l09KmCo=; b=qELshcJtGSdITKtU6FC9csLqwi
	rvnh6L9OqMb5DLo8IIUjyId92kpa2gWiq/HBpGi6fhWgGfQhWHGhw9i8Lgirz0S8UmfEd7V45tYiE
	SBZzgFzn4t4LXlhFTmFikSVgdN4jdQsbxXu9W+fZWjMfOIkgmPofFongf1Ln5vKG0W6qkvIEuiCLE
	Oih9jN1VfwQPltsbYR3GZAALSzxLFqhhqTLcWxXAp2amlVfnonyS9fOuzrvN2pOUaq6o1KBlV2Kgc
	wYPPGAklx2Ad4w5owz7vYPp6SuuCVrB7UsFUzX9rqubcbKTE+W5M4OW27czK5Xsah8A1bYore2ljN
	KyyNLNkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr0Xn-00EjZf-Mk; Wed, 09 Jun 2021 15:55:03 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqzPM-00EN3r-3I; Wed, 09 Jun 2021 14:42:17 +0000
Received: by mail-wr1-x436.google.com with SMTP id q5so25812134wrm.1;
 Wed, 09 Jun 2021 07:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IhyCu8H5WSS/E4CDjMhpArM4pXXOj0TlzCRvDB9JWNs=;
 b=FylaupbFDFZrMhi3SvSNnIe8tPXxK9fI1FeBkscPkU7HbplyXTi5mjeQl4ajeZUMjF
 3u9Y9nVjGb2t0Jl/1yP6vkekD7tk4+/juEZuLQPMu++PeIg4Rz0q+Y3HoLTPRvxlNgwm
 d/saSwDWPCECKQPpWi/mJ6GbyjOEuY9BOFCwwHxkr9bLFyuLqWhYP8LZvaPQ1YYCIL6s
 waetdHEa2R04ypG6be8Vd7k+j9eqjmmhbEldq2TdqRkoUscclY5BLVAkfx/5Dreyal2u
 gb5v7pguPCe4uVY8/JkG6lEj0nXgYj6jMz7m0CFQZbala5Oq81d+LQmqbKQOnnBaf50D
 O/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IhyCu8H5WSS/E4CDjMhpArM4pXXOj0TlzCRvDB9JWNs=;
 b=iT/OmjYNoTlwr0nftiRSM776dX3+iveBw/W1fJ7nebbpZP9tgZ1G3VAnagVwZIbSPp
 29gxQK05iCA89WDkVWpgBpuvY1RBYTv5imBFD9nPvWuaB50FHq9xheP5HDb8e8xJkTBq
 FeX8EgLaOLx8oJ1mMUKN3LJULtTlIm/CjYK1QvpFMvHkq8GVew4G/OEfu3Yw537hi/Gl
 lCbNX+X5XDEOGpiLunD5LxsI/AmmXhruu1Riqq0hbAj3GoV+BQhvRsGAwUgc4c+8w+cM
 SGdnX9DRX0ktt5VKdTEt1Cn3HPmEdit2tjaXpVAGmSpOLWvprtYQOb4Apyx9Rvr2yatG
 wa7A==
X-Gm-Message-State: AOAM531NFFfRT+LFTSwXGYweorcW4K5wrrpYqLQUIEkWUZ/qJlmYsp8o
 DJlzmIxrNu/XgreU5eb3xvU=
X-Google-Smtp-Source: ABdhPJxs1AUnYHyns8XqNWnre7Ubl2p5jpkkdqatFTbqbgJrQpW3L64xpTz6S+pkS0t8gqgaaORBHg==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr171709wrr.292.1623249731120; 
 Wed, 09 Jun 2021 07:42:11 -0700 (PDT)
Received: from ziggy.stardust (81.172.61.185.dyn.user.ono.com. [81.172.61.185])
 by smtp.gmail.com with ESMTPSA id v7sm129321wru.66.2021.06.09.07.42.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 07:42:10 -0700 (PDT)
Subject: Re: [PATCH v5 14/16] memory: mtk-smi: Get rid of mtk_smi_larb_get/put
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
 eizan@chromium.org, acourbot@chromium.org
References: <20210410091128.31823-1-yong.wu@mediatek.com>
 <20210410091128.31823-15-yong.wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <1755fd87-a724-508f-92a8-d09b627d58ca@gmail.com>
Date: Wed, 9 Jun 2021 16:42:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210410091128.31823-15-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_074216_203821_B377561F 
X-CRM114-Status: GOOD (  20.32  )
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
> After adding device_link between the iommu consumer and smi-larb,
> the pm_runtime_get(_sync) of smi-larb and smi-common will be called
> automatically. we can get rid of mtk_smi_larb_get/put.
> 
> CC: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Evan Green <evgreen@chromium.org>

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  drivers/memory/mtk-smi.c   | 14 --------------
>  include/soc/mediatek/smi.h | 20 --------------------
>  2 files changed, 34 deletions(-)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index c5fb51f73b34..7c61c924e220 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -134,20 +134,6 @@ static void mtk_smi_clk_disable(const struct mtk_smi *smi)
>  	clk_disable_unprepare(smi->clk_apb);
>  }
>  
> -int mtk_smi_larb_get(struct device *larbdev)
> -{
> -	int ret = pm_runtime_resume_and_get(larbdev);
> -
> -	return (ret < 0) ? ret : 0;
> -}
> -EXPORT_SYMBOL_GPL(mtk_smi_larb_get);
> -
> -void mtk_smi_larb_put(struct device *larbdev)
> -{
> -	pm_runtime_put_sync(larbdev);
> -}
> -EXPORT_SYMBOL_GPL(mtk_smi_larb_put);
> -
>  static int
>  mtk_smi_larb_bind(struct device *dev, struct device *master, void *data)
>  {
> diff --git a/include/soc/mediatek/smi.h b/include/soc/mediatek/smi.h
> index 15e3397cec58..11f7d6b59642 100644
> --- a/include/soc/mediatek/smi.h
> +++ b/include/soc/mediatek/smi.h
> @@ -19,26 +19,6 @@ struct mtk_smi_larb_iommu {
>  	unsigned char  bank[32];
>  };
>  
> -/*
> - * mtk_smi_larb_get: Enable the power domain and clocks for this local arbiter.
> - *                   It also initialize some basic setting(like iommu).
> - * mtk_smi_larb_put: Disable the power domain and clocks for this local arbiter.
> - * Both should be called in non-atomic context.
> - *
> - * Returns 0 if successful, negative on failure.
> - */
> -int mtk_smi_larb_get(struct device *larbdev);
> -void mtk_smi_larb_put(struct device *larbdev);
> -
> -#else
> -
> -static inline int mtk_smi_larb_get(struct device *larbdev)
> -{
> -	return 0;
> -}
> -
> -static inline void mtk_smi_larb_put(struct device *larbdev) { }
> -
>  #endif
>  
>  #endif
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
