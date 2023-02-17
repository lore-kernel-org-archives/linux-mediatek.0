Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B9FC636D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 04:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQTI4GIY7xWZk9axi5Tzvy8kZ0pqgNhEH02uqsyNGWY=; b=upamOtHoUd2uS+BMxWHU8Y01TF
	iKHpYlqd/5c3y/3/2p7x56KlB+xG05Nh6Rb6Yf2hYmFCwCgQU3MI+olS0pQcsSkZG+yMTe28hE3BW
	7udhLeW96FMt6l8UEn5GjNcP+lEocXdgYh556W6t30kbGPnKwRqpVN6IUe4ZLAEcuhwSSDxM/RKpP
	Euk7FNe/V+2jbfzl+UyV9+NWIvEbQfh8YBAw0v0qLeneq7Dv0G+jr6uvzs/PYsaso18hG9S//Iu9R
	9TiUbd3RKgw1jY7T+Y/C8NeWgnPCRUjf+qaiYoGewIox1ISQnFI1vKmvArqITP249p1p03x3OvFIC
	SZFly4Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSsIv-00Cf8l-JQ; Fri, 17 Feb 2023 04:25:01 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSsIn-00Cf5j-DH
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 04:24:54 +0000
Received: by mail-vs1-xe35.google.com with SMTP id d66so4313674vsd.9
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 20:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cQTI4GIY7xWZk9axi5Tzvy8kZ0pqgNhEH02uqsyNGWY=;
        b=Oa+puq2gNoC0CrMJaOehGJxh8+6CiCwgDdIgBCfKbo7A1stwFpVgLYUjxzgVbDaLmX
         38LaXqdmRU4oXC2dtiZ6AhinNyAyytLuwKuz++0xgShjcw63lV3iR+arFRl6YTuFJDPv
         u8/ZLFw4Z+GM7AOohKrhqUIH1TnKI7wrPNYGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQTI4GIY7xWZk9axi5Tzvy8kZ0pqgNhEH02uqsyNGWY=;
        b=dwveQHYA5wP1zej5peg8UwIgfb/sMXEKDMWLPcy4ETCFz567nKMZFzT/6q5VouZ/3P
         Pj0Hh0FXGf+A99s7wRxicTddBRyA6YHSKJyXhfj56+yMNynBhYDEHnXdM67T/4McEMW4
         R7Kc7wdHn1vzmxeEY8q6o6Ur9zxuUpcBedujZNiEHCpKkJhbEw7vnC8mTHP7nTSDpqjU
         zGKYAeZASnLyYl3MXznUvySF/krnHIvNOijdZ3E8ZhC2JqaIn37Elw1EEHVwRLhtPx+G
         7pNP/j/jQCf/cUHfHA4xwrqJ7zrOj37XcUHGkkJIDnLrp88CLfKQ184sqC1oKYJjp9vi
         8PdQ==
X-Gm-Message-State: AO0yUKUbOnV1aoRJW1n5/ivQsvr+aG5yUIfaVcx7JvjyYLIBT0P/5s/V
	XIOJch7ndhhdUuRC4v8QBgOUKKCS1v3giSU4MNzcdA==
X-Google-Smtp-Source: AK7set9KlM3Eli5ccJEfH1OYtj4vfRx7YRy4pEPzZGC/oWqWNj5Lm4wd5sN6Pa2zdobSA2U7pU1eefIjJ+LIz5vYe8Q=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1529570vso.60.1676607892320; Thu, 16 Feb
 2023 20:24:52 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-37-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-37-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 12:24:41 +0800
Message-ID: <CAGXv+5FxnsJaVw2MzeH+-Z3yEPzPCRtTukp7FDhsBoKHfx=m=g@mail.gmail.com>
Subject: Re: [PATCH v2 36/47] clk: mediatek: mt2712: Change Kconfig options to
 allow module build
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_202453_472339_E31DA78E 
X-CRM114-Status: GOOD (  14.65  )
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

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> All of the mt2712 drivers have been converted to platform drivers!
> Change the Kconfig options for all MT2712 clocks to tristate to allow
> building all clock drivers as modules.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/Kconfig | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index b9c0a9e21cf1..45b7aea7648d 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -75,7 +75,7 @@ config COMMON_CLK_MT2701_G3DSYS
>           This driver supports MediaTek MT2701 g3dsys clocks.
>
>  config COMMON_CLK_MT2712
> -       bool "Clock driver for MediaTek MT2712"
> +       tristate "Clock driver for MediaTek MT2712"

Hmm... How does that work out if mt2712-apmixedsys is a
builtin_platform_driver?

ChenYu

