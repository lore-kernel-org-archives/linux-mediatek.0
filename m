Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3859EC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 09:00:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8867B64E33
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 09:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8867B64E33
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OFy+wx+hstUV0YPQAc080BjWhaYAt+EdJ5iKdcPXWY=; b=qoP61EJ/g/K5ftiK3ONdky3xQy
	YMCHSWMhpQ74jCP6uD2XKxy7J4ilUoiswJCuvjKvXx9A8z4bJe7fx6DMeFJhVwD42WI0TFoM4z8d3
	nlPdgifj68jdqYVoM207YDnNBXMLDNBn2vySMyWPZiA1yJVmrCtFLHbp8AmPwf1ZfHXPOuPU+C8li
	vr8v5hRkKy1k8WqFQpaZQVt2jo01Wl7aVlz3g7KA5jWc9+SFySp3xYYAWUIqRAweejtFVxzeJ4cAg
	R/Jlfe5s8FIu5LzGaZFYvDJdVHSjej8h5YzPYL5q1BactgcmPLtH2bjHFDz0AZq/heBcUD3xkcrQv
	CGxSlSBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6V3p-0003vh-HF; Mon, 01 Feb 2021 08:59:53 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6V3m-0003ub-In; Mon, 01 Feb 2021 08:59:51 +0000
Received: by mail-wm1-x32e.google.com with SMTP id i9so12467296wmq.1;
 Mon, 01 Feb 2021 00:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Ga5Wn4Eex51ui7fkqD+QdHO2SxUk0pWG55X7znoYW1o=;
 b=NF3/w6iBpDa6dw3c8knn0Dpgq6BDkre5I+/SQWKWoVHRZ1y4wDjIPv3/il33zJrHPt
 uuCyZNEZd0Iywq389XacekYZ7RdxPr0DHofo7YQpTdNUd+C8ioHCmiNoZHV8LEOWqWXo
 61xtbGk9nzr/JD3v8dfCc8VnF+KXnnUvgJ6up7vjI1XkMcu3AVr3iFDhYRq6Cg+T9OWA
 od0ZUVKJ2+6glHagfgwmSbNu2nv/iQmaRYU4Bd12/D+J2Rim2Kvz1xXVmUyXGZQMl9yq
 c0Mok+qYSyKoeX9IWD/2xbXJS0ZBYKoAB34Z8GnOHDX5dGy89GXaJhUisczK08bO89ko
 mPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ga5Wn4Eex51ui7fkqD+QdHO2SxUk0pWG55X7znoYW1o=;
 b=Fixm6tfo8gbTAVFLHFpYpRnt7ymMZCR0zML/paL7/rl1LoZvfrATnNWLL13xQSqj49
 +CEVW1pgEuVibfQlNW8PS1q6P7l2qfUHDCTNvPN9dqx6TPznUJjWbUYqMeW4nm3BXY1F
 i8LCLaTKVo8gnCjo8SJEtQBq+hf0hlZlcxGwB3ljvpe/Rtf//IkEhwR9YAJxnw6F5i8A
 z2zJuppQjkJqTkweKzz/8pj+TVsAkqF60r2ETF5lZ1aH6GX052kwn6c4oex0pLp5UPzw
 b0U4OjWyQIxTSR8jE/DiIg3ODLB5Kk2a6vlRwEIvVU0YoI3/s9nzzxeyq7N9ibTWguzq
 faXg==
X-Gm-Message-State: AOAM530q94MbNKNEodmG6e6CxKLeB826Q1HnRhEx1tPcukwi5rNsEiuN
 p3tjpE39oV5hj0xoMI/VRw4=
X-Google-Smtp-Source: ABdhPJyqD3lnfamEWdXR0fEBZ53K1Km2cEtErSfVz8XmOxHUXgB7b3hPxR+Maae7JOowmnUsekQGIQ==
X-Received: by 2002:a1c:cb:: with SMTP id 194mr14283189wma.30.1612169989209;
 Mon, 01 Feb 2021 00:59:49 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id u6sm27489814wro.75.2021.02.01.00.59.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 00:59:48 -0800 (PST)
Subject: Re: [PATCH 1/2] soc: mediatek: pm-domains: Use correct mask for
 bus_prot_clr
To: Bilal Wasim <bilalwasim676@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, enric.balletbo@collabora.com,
 hsinyi@chromium.org, weiyi.lu@mediatek.com
References: <20210201054542.1470695-1-Bilal.Wasim@imgtec.com>
 <20210201054542.1470695-2-Bilal.Wasim@imgtec.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <e4961c5e-db52-148d-c414-25f16101fb3f@gmail.com>
Date: Mon, 1 Feb 2021 09:59:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210201054542.1470695-2-Bilal.Wasim@imgtec.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_035950_676387_661D48D8 
X-CRM114-Status: GOOD (  18.49  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
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



On 01/02/2021 06:45, Bilal Wasim wrote:
> When "bus_prot_reg_update" is false, the driver should use
> INFRA_TOPAXI_PROTECTEN for both setting and clearing the bus
> protection. However, the driver does not use this mask for
> clearing bus protection which causes failure when booting
> the imgtec gpu.
> 
> Corrected and tested with mt8173 chromebook.
> 
> Signed-off-by: Bilal Wasim <Bilal.Wasim@imgtec.com>
> ---
>  drivers/soc/mediatek/mtk-pm-domains.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> index 141dc76054e6..7454c0b4f768 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.h
> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> @@ -60,7 +60,7 @@
>  #define BUS_PROT_UPDATE_TOPAXI(_mask)				\
>  		BUS_PROT_UPDATE(_mask,				\
>  				INFRA_TOPAXI_PROTECTEN,		\
> -				INFRA_TOPAXI_PROTECTEN_CLR,	\
> +				INFRA_TOPAXI_PROTECTEN,		\

BUS_PROT_UPDATE sets bus_prot_reg_update to true, which contradicts what you say
in the commit message.

Please clarify.

Regards,
Matthias

>  				INFRA_TOPAXI_PROTECTSTA1)
>  
>  struct scpsys_bus_prot_data {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
