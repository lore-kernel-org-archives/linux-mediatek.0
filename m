Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBAA8C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 05:10:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8180960F46
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 05:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8180960F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tpEz+u9IldqbbUx7OToj36xj0jG35wNmENlErIKVzOo=; b=cBuH9Rw9N189/d
	t3ljeHDTNH3+mnM75x5D4dxMVvjee+aVpS5yu7ys1WAbySQu2oCkOZMc6AlCD6gOAIkgEonii9Ayv
	93JurX0xF/Brac8dff3WyeBCclKA/R1QpTmlV1O8YRg5q704Y0k/hnXcaG4YPj3o9Rx7sDnm182L2
	+vS8niWVQWXKg08+LBGOovIxvs34aauze2fJHczV9tOvSQkKeYFwgURqgyzBxztjWBsZ5pFIBHnT0
	QylYt3iSbTm2myHY2+wtNA/AFcCB/5xwDPSWhX109hK6klEQNl4OxLbabw2O7FIa1xhNsugo6PkyW
	mzdos7Qm3aZfOKhY8lHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9KmM-007FqC-0M; Fri, 30 Jul 2021 05:09:50 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9KmJ-007FpI-Ka; Fri, 30 Jul 2021 05:09:49 +0000
Received: by mail-oo1-xc32.google.com with SMTP id
 o17-20020a4a64110000b0290263e1ba7ff9so2160695ooc.2; 
 Thu, 29 Jul 2021 22:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DtOXr89OzIUFPwE95nTmJSuToUjtwfHb2hL/EyTTeLc=;
 b=XY33TRonS6iaFY857RRIQ5xAHb5O7L8Jrt4fQzW+qvvevuzod7Xg8is59dM5ETkBJ4
 wYWWROpIyuB2L67wmNUMRY35h3FfSQeiVKCWaPWJcdc8/mvg4bF8W4iGiaGEvAvgKp0I
 6GjooQqaU07rJv//dEwa75a8mjLFg/xo2ybK/5lUnMfeOGAfglml4Fa2I1tQjqwc5V3B
 fUgF41r5dR96gDmnyiGArQGCFLH+dau1Dx3vHOZ4GZotNZXUDkKTs00VBtY6kKlTjavu
 Pz37oaj2IsjpSq3R9Y2i6Nwddl/6b6nu9y1QxwqYsxv1l6wRSOQzzq5400YFKQZjbsu8
 m4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=DtOXr89OzIUFPwE95nTmJSuToUjtwfHb2hL/EyTTeLc=;
 b=t+y3qjGYBDjzmOIbGWAzYLP1GIIlqG94CmWG6I6ux8ky0VcTffQmjjIYuSvkp+NLI/
 HTKRKPeDSMb38gw9CfKC9X9C5tiSX1AuAVrE8GI5nN0yQvDrq1VTfkWsTuGZoBO3Pv+O
 vsTLDNlMdFoCGp+EOrmKCFDJcw+D5RoCuTXcMokdZ2e5/ONYRweFw7CWw24CmfbuiESd
 jxIH2mBhehP9wS4+Oe7kJbPcx1BBkjbmFiRJyMdjE6IUnFYLqZ00Q9TEclvCxEvseFPc
 3iSP7GJviLf0Yo1YwTTABtUICULxFPWFZUcUHQHsFDZTPDf5kEX7Wqoa1gkO1/hDMdeN
 exaQ==
X-Gm-Message-State: AOAM531nu05g0wopsjbE86+oi0BwGrZhtr7sHL/Gv1xhP/AbXoxbbEzm
 eP2tOtzl/KSTKV1TxSc+NIo=
X-Google-Smtp-Source: ABdhPJwfnmqbVIz/NnmIZ/LXSibJIG3tB+bMED54PtXcQRW60tZjj7o7wIbGMW91sxaKQT6whWsfFQ==
X-Received: by 2002:a4a:7b4b:: with SMTP id l72mr473141ooc.9.1627621786751;
 Thu, 29 Jul 2021 22:09:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q186sm127995oib.31.2021.07.29.22.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 22:09:46 -0700 (PDT)
Date: Thu, 29 Jul 2021 22:09:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christine Zhu <Christine.Zhu@mediatek.com>
Cc: wim@linux-watchdog.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 seiya.wang@mediatek.com,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [v5, 2/3] dt-bindings: reset: mt8195: add toprgu reset-controller
 head file
Message-ID: <20210730050944.GA2111694@roeck-us.net>
References: <20210628113730.26107-1-Christine.Zhu@mediatek.com>
 <20210628113730.26107-3-Christine.Zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210628113730.26107-3-Christine.Zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_220947_741276_C00590D2 
X-CRM114-Status: GOOD (  16.98  )
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

On Mon, Jun 28, 2021 at 07:37:30PM +0800, Christine Zhu wrote:
> From: "Christine Zhu" <Christine.Zhu@mediatek.com>
> 
> Add toprgu reset-controller head file for MT8195 platform.
> 
> Signed-off-by: Christine Zhu <Christine.Zhu@mediatek.com>
> ---
>  .../reset-controller/mt8195-resets.h          | 29 +++++++++++++++++++

There is another patch pending which moves the mtk reset controller
include files to another directory. See [1]. Maybe it would make
sense to use the same directory for this file ?

Thanks,
Guenter

>  1 file changed, 29 insertions(+)
>  create mode 100644 include/dt-bindings/reset-controller/mt8195-resets.h
> 
> diff --git a/include/dt-bindings/reset-controller/mt8195-resets.h b/include/dt-bindings/reset-controller/mt8195-resets.h
> new file mode 100644
> index 000000000000..7ec27a64afc7
> --- /dev/null
> +++ b/include/dt-bindings/reset-controller/mt8195-resets.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Crystal Guo <crystal.guo@mediatek.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8195
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT8195
> +
> +#define MT8195_TOPRGU_CONN_MCU_SW_RST          0
> +#define MT8195_TOPRGU_INFRA_GRST_SW_RST        1
> +#define MT8195_TOPRGU_APU_SW_RST               2
> +#define MT8195_TOPRGU_INFRA_AO_GRST_SW_RST     6
> +#define MT8195_TOPRGU_MMSYS_SW_RST             7
> +#define MT8195_TOPRGU_MFG_SW_RST               8
> +#define MT8195_TOPRGU_VENC_SW_RST              9
> +#define MT8195_TOPRGU_VDEC_SW_RST              10
> +#define MT8195_TOPRGU_IMG_SW_RST               11
> +#define MT8195_TOPRGU_APMIXEDSYS_SW_RST        13
> +#define MT8195_TOPRGU_AUDIO_SW_RST             14
> +#define MT8195_TOPRGU_CAMSYS_SW_RST            15
> +#define MT8195_TOPRGU_EDPTX_SW_RST             16
> +#define MT8195_TOPRGU_ADSPSYS_SW_RST           21
> +#define MT8195_TOPRGU_DPTX_SW_RST              22
> +#define MT8195_TOPRGU_SPMI_MST_SW_RST          23
> +
> +#define MT8195_TOPRGU_SW_RST_NUM               16
> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8195 */

[1] https://patchwork.kernel.org/project/linux-watchdog/patch/20210714121116.v2.1.I514d9aafff3a062f751b37d3fea7402f67595b86@changeid/


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
