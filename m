Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49965C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 07:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ryLOEKWbee+ndjps07t4kDI2Eg2FatHh2fvzWokSXBU=; b=vVZ6eVXhrQ276NvZF/Wh/S0hNe
	pzH9JouEphiMtVIJZKso1LiMnGooJW/3CxFQdUKOxYxmhGOAne75/SMmZ8nPkJyAFwTKhlepYTMiC
	2jeo7iXroINa5fbiQdC5+ORsSXy11Rz+ZKygobxNBrwh+OPeGtq28XiTfGIXFuddsJLGL0rP5kzWY
	j2G2zIyEfv+SZXgMsK6VD7yqOYFS4GQxEiNsjc2A4YlxsX7SWcziyoHiDGRSf7NWUisQc8xILsbpj
	+Cui33+9ivfW/OCVZMuqzNTjQLLMy842Sik4zmzcypbuH3WSnukWt0nz4x+Lj1Ta28LkaoGcJ8zhW
	lJwoMs3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPI55-00B5Y3-8r; Tue, 07 Feb 2023 07:07:55 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPI52-00B5WH-74
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 07:07:53 +0000
Received: by mail-ua1-x930.google.com with SMTP id g13so1313937uan.7
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 23:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ryLOEKWbee+ndjps07t4kDI2Eg2FatHh2fvzWokSXBU=;
        b=eoZ6mKxOp2w6xUsUEooFANxsnzN/A6kMbr5e8jO18lPmqMXcrsWo3B88hanIbtdLAE
         0xFl1kDIp6B2Y6mHtnh+RrLHHU2iHC1HmSAeOtyo6DAd7O4MqxbGhU5dygKI8JAMdVEl
         yLi/knhfNvEXH9lE9ivUjFclZySG+12+smFQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ryLOEKWbee+ndjps07t4kDI2Eg2FatHh2fvzWokSXBU=;
        b=nPcPIk86ig21AVAQ4SAI2FTX7Sxx1E2pqqBSRf5e+Wr5mW9GPQ+QZynAJvxbwTkQW9
         Ywny4EGkLjuOOXP+3Sp7Ff8wO5LAJlDcYVkNDs3B0OfkS67NRW/XkV6I9CMIA5sbtY4o
         kHwTsICuLZ+CO1HtyLyT+/5aOKltExndE1+DvwoshwkbhCJdXlzT08t8f9MDPLPtnqxC
         ak6ODGvDowFWGFsuW4+0CuG9W6f1so7acRTSTjTyVYen35BPzTygUCl6swgaYjxrOA73
         fTMN3oxDcWPjlVYN+LW+DaoZJ8itQJWuXN6o/6rie69FEh3djgsCZroiC7hknikL0hVY
         J5QQ==
X-Gm-Message-State: AO0yUKX//5efWil2fHiu3IR+utWEGUSFm3WFrqsyQBEuyE6QwwKsbt4a
	BT1Mb5NgGj4zs77HeSXuSPZXu/fsLM1wrxLxCB7aeQ==
X-Google-Smtp-Source: AK7set/bGnKz5U9kIPIfo8WqyaYvhc91nHxy9RmnWyFXodO5/eIlBgd4lmr1uUB0s2fHTNklpOlu2qX7HHS/cqrlwlc=
X-Received: by 2002:ab0:3b90:0:b0:683:c74a:af60 with SMTP id
 p16-20020ab03b90000000b00683c74aaf60mr362260uaw.74.1675753664132; Mon, 06 Feb
 2023 23:07:44 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-9-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Feb 2023 15:07:33 +0800
Message-ID: <CAGXv+5GAHngx89bts_SMxh3kD=4kNP9LYLc-J3pixKojVs=GMg@mail.gmail.com>
Subject: Re: [PATCH v1 08/45] clk: mediatek: mt2712: Move apmixedsys clock
 driver to its own file
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_230752_293104_E3ECD58F 
X-CRM114-Status: GOOD (  16.49  )
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

On Mon, Feb 6, 2023 at 11:29 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The only clock driver that does not support mtk_clk_simple_probe() is
> apmixedsys: in preparation for enabling module build of non-critical
> mt2712 clocks, move this to its own file.
> While at it, also fix some indentation issues in the PLLs table.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile                |   2 +-
>  drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 152 +++++++++++++++++
>  drivers/clk/mediatek/clk-mt2712.c            | 164 -------------------
>  3 files changed, 153 insertions(+), 165 deletions(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt2712-apmixedsys.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index e5d018270ed0..3c7dd19cdddf 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -38,7 +38,7 @@ obj-$(CONFIG_COMMON_CLK_MT2701_HIFSYS) += clk-mt2701-hif.o
>  obj-$(CONFIG_COMMON_CLK_MT2701_IMGSYS) += clk-mt2701-img.o
>  obj-$(CONFIG_COMMON_CLK_MT2701_MMSYS) += clk-mt2701-mm.o
>  obj-$(CONFIG_COMMON_CLK_MT2701_VDECSYS) += clk-mt2701-vdec.o
> -obj-$(CONFIG_COMMON_CLK_MT2712) += clk-mt2712.o
> +obj-$(CONFIG_COMMON_CLK_MT2712) += clk-mt2712.o clk-mt2712-apmixedsys.o
>  obj-$(CONFIG_COMMON_CLK_MT2712_BDPSYS) += clk-mt2712-bdp.o
>  obj-$(CONFIG_COMMON_CLK_MT2712_IMGSYS) += clk-mt2712-img.o
>  obj-$(CONFIG_COMMON_CLK_MT2712_JPGDECSYS) += clk-mt2712-jpgdec.o
> diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
> new file mode 100644
> index 000000000000..e841be3a02c9
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
> @@ -0,0 +1,152 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2017 MediaTek Inc.
> + * Copyright (c) 2023 Collabora Ltd.
> + * Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> + */
> +#include <linux/clk.h>

Missed one. I think you would want <linux/clk-provider.h> instead?
And you could drop the header from drivers/clk/mediatek/clk-mt2712.c

ChenYu

