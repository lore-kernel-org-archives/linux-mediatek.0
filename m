Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C83C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 07:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOCWApX156tOfy22WEfKjuF2sPGgnBI2kTlPddDDMxI=; b=n+cC9FqRk5GL38YcBpimIzZI9E
	S1qvbPYUXJCZfrxuKtABDFqkXi9/rkRQ2vzFVZrDwCGyy7hUIoO0uZLUPvEVj6eefAgpFvEYthmRJ
	XI2tq1L5wqGN9kItDoeibuIkvk6D1HqXP1tek+LfhCgNj/VuLbfZzKJs+V0MOfno9s9KGI/nx3Daf
	4AwTGn3+G0DTDZAEfhZGMIPCQ2QkSb/M4JwqawtDs2RaZ/N2BJbyUnntxnMHsKwx6ZutmJTFhcSKQ
	0+aXuKeCvFiPYIwLrJGP4f14lDxOQl4u2xIxIjy/Ixa/eJGzv5vsNflG8T4IDCoEO4/1H/+sMDhMq
	OEDO2cuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPI9z-00B6LL-8m; Tue, 07 Feb 2023 07:12:59 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPI9o-00B6Iv-JE
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 07:12:49 +0000
Received: by mail-vs1-xe35.google.com with SMTP id g8so28345vso.3
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 23:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fOCWApX156tOfy22WEfKjuF2sPGgnBI2kTlPddDDMxI=;
        b=b/hXV4pxZIzumEMHXNjrdfKA+eRJ7XqQiW2WXrgNLlz7xlWAe3VsU6E1aTpQ3UKu4s
         PIPs/HelH1kBEw7zwHn6eU63usGbh1XJ+i4RCSyUJe7q7bZWniUgNpyksZ7YdbgaX0pA
         Ret3VSCC3ucT9HYyCsy1PU6cZyGBdhRvD7Vxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fOCWApX156tOfy22WEfKjuF2sPGgnBI2kTlPddDDMxI=;
        b=4us48tLaWAWlzuMCVMYrfeW4VsClatlgldgMA7Xw1Qpv3I2BYBH0uG8nbvndSPpPWT
         axeL1cgWa1NLhD4hs//xCShD9S592Z/A+aN3ExKEImmHDLubepAYI4rYF3PdAA0pIL7h
         xiepQ+EnzkBTdsBBS6dCJXMzj40PFQXZdJJrptsrP+ajEAcOx+VEKyM2NY5gDdo0e0cd
         PI1m3EPZklfJcG1vWUcR4qOPx/Cytq0//TE23eXuQ02dr2oWdmB4K0X9b59AQqL21fhX
         gRl7ONjhre69BkiA56DrjNOUFg7pjotv/RF6iJRb3MezVTsEHiwiJPgZzrb1kDzUDrFJ
         ezMw==
X-Gm-Message-State: AO0yUKXCDpamfm1h67MvwecikbVNsUeKqL7NldwCEV3UcNU7R9eodSmi
	6CUx7n8cCvBXKEKNTcD1HtM/kUK+deK5uuoxnigcJQ==
X-Google-Smtp-Source: AK7set96fhA2GvSOixgC41jK7IqHQ4VfH3GRO2zASJ2fzcnZNJW7Zc0QzdAs4TrWQLaww08y9Myd6n9uw3g662INj4U=
X-Received: by 2002:a05:6102:2445:b0:411:a162:c432 with SMTP id
 g5-20020a056102244500b00411a162c432mr269027vss.26.1675753967286; Mon, 06 Feb
 2023 23:12:47 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-12-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-12-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Feb 2023 15:12:36 +0800
Message-ID: <CAGXv+5EvYq9eJkfvrEt-LEN0ODt-_tQ+wiAK-BjKeSi6VCDzEA@mail.gmail.com>
Subject: Re: [PATCH v1 11/45] clk: mediatek: mt8365: Move apmixedsys clock
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
X-CRM114-CacheID: sfid-20230206_231248_655466_3CD1980E 
X-CRM114-Status: GOOD (  16.85  )
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

On Mon, Feb 6, 2023 at 11:30 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for migrating all other mt8365 clocks to the common
> mtk_clk_simple_probe(), move apmixedsys clocks to a different file.
> While at it, use the builtin_platform_driver() macro for it.

`git diff --color-moved=dimmed-zebra --color-moved-ws=ignore-all-space`
agrees this is mostly a code move.

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile                |   2 +-
>  drivers/clk/mediatek/clk-mt8365-apmixedsys.c | 164 +++++++++++++++++++
>  drivers/clk/mediatek/clk-mt8365.c            | 142 ----------------

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

But see below.

>  3 files changed, 165 insertions(+), 143 deletions(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8365-apmixedsys.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 3c7dd19cdddf..b004a47026d4 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -112,7 +112,7 @@ obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o
>                                    clk-mt8195-venc.o clk-mt8195-vpp0.o clk-mt8195-vpp1.o \
>                                    clk-mt8195-wpe.o clk-mt8195-imp_iic_wrap.o \
>                                    clk-mt8195-apusys_pll.o
> -obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365.o
> +obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365.o clk-mt8365-apmixedsys.o
>  obj-$(CONFIG_COMMON_CLK_MT8365_APU) += clk-mt8365-apu.o
>  obj-$(CONFIG_COMMON_CLK_MT8365_CAM) += clk-mt8365-cam.o
>  obj-$(CONFIG_COMMON_CLK_MT8365_MFG) += clk-mt8365-mfg.o
> diff --git a/drivers/clk/mediatek/clk-mt8365-apmixedsys.c b/drivers/clk/mediatek/clk-mt8365-apmixedsys.c
> new file mode 100644
> index 000000000000..6f0fdf92bbd2
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8365-apmixedsys.c
> @@ -0,0 +1,164 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + * Copyright (c) 2023 Collabora Ltd.
> + */
> +
> +#include <dt-bindings/clock/mediatek,mt8365-clk.h>
> +#include <linux/clk.h>

like in the MT2712 patch, this could be clk-provider.h .
Or maybe we should do a pass of header cleanup? There's a bunch left
over from the conversion from |struct clk| to |structk clk_hw|, and
then migration to mtk_clk_simple_probe.

What do you think?

ChenYu

