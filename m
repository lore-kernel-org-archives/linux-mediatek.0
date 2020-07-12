Return-Path: <SRS0=2SCH=AX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D859FC433E4
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jul 2020 18:06:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2407206F0
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jul 2020 18:06:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BHJhJ8I9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAUkLktO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2407206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xNbgKQDTIv2jFuahCh2jw22juAxm3ZgwSghhcAWaZkQ=; b=BHJhJ8I9YhaxEyDUdiDsllcUK
	bTOuWjxP4i/IgNwnLFraP4G8W3udEnKSC3f6SLjECpZk9WrtmEGrnmRBV6ZUFn4Kmdyd9wE8W+DR5
	ojpJjIpugbADZLOfNijZYSaB+PwRYt+vfehIhnn4IiA4WTutRrSL+GcyestgpgDeDGiFwnkDa/JbD
	YFhtIWPfb8Y5EVdooa42K93f7B6AJ1vRjaU/1zFxmwFQwuhaVvw14kNG7ALvwChnAV5wIzSwnU1rp
	iwBUlpMXfbyZZi7OrBd7GNRgHMZneHle9y1C6PnYLpa3D+1z++K3+Vsbonuu60hAgbU/Jm9zub6Cs
	iGF3lCHbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jugMq-0002uZ-Sv; Sun, 12 Jul 2020 18:06:24 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jugMn-0002te-Ek; Sun, 12 Jul 2020 18:06:22 +0000
Received: by mail-wm1-x344.google.com with SMTP id 17so10747991wmo.1;
 Sun, 12 Jul 2020 11:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rXIYGf7nKP36lUXjPoJamlUt3MsApH6KmL+wKFQttL0=;
 b=CAUkLktOBjEigcVSb5JNR+sboa7yimUHhD+N1nwWEE7TinAlC7ZJNpGfHK9TKMEE9l
 0cFr2gf3pQ/bimZ8PBmiV4spwFLh9Iw1RO9rBcG7PFxWiFLYEPaPpCXAR/N4mc2dgcWB
 tHCvoTJjzayOYqRC+WHHKpHlV4KrlUOlE88MtiGizREsb82J64QBr19uwQSN3z1M+FG/
 Y1DxrB1lza/XDpoPjGgx4mOPJo6Spw3wTZgDtkYXXk8xppsrnxOQwrrSv7ubg5G92EFa
 JRordYRXyQn25uLMcRP1ElTewWOqgggYgqRIBY6UWLtlTGtUn4j7sdy8qAdRtdv5ZVrs
 W+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rXIYGf7nKP36lUXjPoJamlUt3MsApH6KmL+wKFQttL0=;
 b=DgumPSwhnpJa7KiVa/XwLJcZVGJAyD/2nY6gBCA4Hxk6fEqq1VTPtw6pR1nDedyhZf
 xwGZ35Zl7HhTVcB0k2g3S/Ayg7DLNUe+UqKOWCKtjtAgPRDZMgo8yGPomo1KGiUmydoW
 ltRqb/Vn1UMU5qzpOqQrDyTzyo48HP1rSsOtCWQK+kS30U07hrCQzduf3vzV89xBfpAq
 A47YUGK5RU/VoD3QwUWd4Oh/C2qSXVhct2G1Q1BtIuvAlI2ugcdf4XM1AD38dpQwtSw2
 S/q88srEHN+uRIDT7xrMqv/1YQ3l/4gE+5d8Py1iCMrzCkPRIz3smDxd7KUSoC8/bojA
 WNjw==
X-Gm-Message-State: AOAM532oI8cIte/9Tv10y3eKAdiSPqwrw6vUmiREq3C4k7rfOni5WUGE
 nYENToniTxHc2/mOmiuU6LA=
X-Google-Smtp-Source: ABdhPJzOUmPXUmNbjdA7jZ/Qn0aHiRAOlQ80hzDT623yYWJX8GnjOzvPMH7bEVZ6XQEHalOXvPDCZg==
X-Received: by 2002:a1c:49d7:: with SMTP id
 w206mr15866960wma.181.1594577180061; 
 Sun, 12 Jul 2020 11:06:20 -0700 (PDT)
Received: from ziggy.stardust ([213.195.114.245])
 by smtp.gmail.com with ESMTPSA id j6sm20823362wro.25.2020.07.12.11.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Jul 2020 11:06:19 -0700 (PDT)
Subject: Re: [PATCH 01/21] dt-binding: memory: mediatek: Add a common
 larb-port header file
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>
References: <20200711064846.16007-1-yong.wu@mediatek.com>
 <20200711064846.16007-2-yong.wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <9e21288c-07da-88b0-2dbb-bd9a2a4d529b@gmail.com>
Date: Sun, 12 Jul 2020 20:06:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200711064846.16007-2-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200712_140621_561429_6BEB86A3 
X-CRM114-Status: GOOD (  19.10  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 11/07/2020 08:48, Yong Wu wrote:
> Put all the macros about smi larb/port togethers, this is a preparing
> patch for extending LARB_NR and adding new dom-id support.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   include/dt-bindings/memory/mt2712-larb-port.h  |  2 +-
>   include/dt-bindings/memory/mt6779-larb-port.h  |  2 +-
>   include/dt-bindings/memory/mt8173-larb-port.h  |  2 +-
>   include/dt-bindings/memory/mt8183-larb-port.h  |  2 +-
>   include/dt-bindings/memory/mtk-smi-larb-port.h | 15 +++++++++++++++
>   5 files changed, 19 insertions(+), 4 deletions(-)
>   create mode 100644 include/dt-bindings/memory/mtk-smi-larb-port.h
> 
> diff --git a/include/dt-bindings/memory/mt2712-larb-port.h b/include/dt-bindings/memory/mt2712-larb-port.h
> index 6f9aa7349cef..b6b2c6bf4459 100644
> --- a/include/dt-bindings/memory/mt2712-larb-port.h
> +++ b/include/dt-bindings/memory/mt2712-larb-port.h
> @@ -6,7 +6,7 @@
>   #ifndef __DTS_IOMMU_PORT_MT2712_H
>   #define __DTS_IOMMU_PORT_MT2712_H
>   
> -#define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
> +#include <dt-bindings/memory/mtk-smi-larb-port.h>
>   
>   #define M4U_LARB0_ID			0
>   #define M4U_LARB1_ID			1
> diff --git a/include/dt-bindings/memory/mt6779-larb-port.h b/include/dt-bindings/memory/mt6779-larb-port.h
> index 2ad0899fbf2f..60f57f54393e 100644
> --- a/include/dt-bindings/memory/mt6779-larb-port.h
> +++ b/include/dt-bindings/memory/mt6779-larb-port.h
> @@ -7,7 +7,7 @@
>   #ifndef _DTS_IOMMU_PORT_MT6779_H_
>   #define _DTS_IOMMU_PORT_MT6779_H_
>   
> -#define MTK_M4U_ID(larb, port)		 (((larb) << 5) | (port))
> +#include <dt-bindings/memory/mtk-smi-larb-port.h>
>   
>   #define M4U_LARB0_ID			 0
>   #define M4U_LARB1_ID			 1
> diff --git a/include/dt-bindings/memory/mt8173-larb-port.h b/include/dt-bindings/memory/mt8173-larb-port.h
> index 9f31ccfeca21..d8c99c946053 100644
> --- a/include/dt-bindings/memory/mt8173-larb-port.h
> +++ b/include/dt-bindings/memory/mt8173-larb-port.h
> @@ -6,7 +6,7 @@
>   #ifndef __DTS_IOMMU_PORT_MT8173_H
>   #define __DTS_IOMMU_PORT_MT8173_H
>   
> -#define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
> +#include <dt-bindings/memory/mtk-smi-larb-port.h>
>   
>   #define M4U_LARB0_ID			0
>   #define M4U_LARB1_ID			1
> diff --git a/include/dt-bindings/memory/mt8183-larb-port.h b/include/dt-bindings/memory/mt8183-larb-port.h
> index 2c579f305162..275c095a6fd6 100644
> --- a/include/dt-bindings/memory/mt8183-larb-port.h
> +++ b/include/dt-bindings/memory/mt8183-larb-port.h
> @@ -6,7 +6,7 @@
>   #ifndef __DTS_IOMMU_PORT_MT8183_H
>   #define __DTS_IOMMU_PORT_MT8183_H
>   
> -#define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
> +#include <dt-bindings/memory/mtk-smi-larb-port.h>
>   
>   #define M4U_LARB0_ID			0
>   #define M4U_LARB1_ID			1
> diff --git a/include/dt-bindings/memory/mtk-smi-larb-port.h b/include/dt-bindings/memory/mtk-smi-larb-port.h
> new file mode 100644
> index 000000000000..2ec7fe5ce4e9
> --- /dev/null
> +++ b/include/dt-bindings/memory/mtk-smi-larb-port.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020 MediaTek Inc.
> + * Author: Yong Wu <yong.wu@mediatek.com>
> + */
> +#ifndef __DTS_MTK_IOMMU_PORT_H_
> +#define __DTS_MTK_IOMMU_PORT_H_
> +
> +#define MTK_LARB_NR_MAX			16

include/soc/mediatek/smi.h has the very same define.
Should smi.h include this file?

Regards,
Matthias

> +
> +#define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
> +#define MTK_M4U_TO_LARB(id)		(((id) >> 5) & 0xf)
> +#define MTK_M4U_TO_PORT(id)		((id) & 0x1f)
> +
> +#endif
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
