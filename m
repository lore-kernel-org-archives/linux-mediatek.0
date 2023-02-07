Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D073C636D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 06:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovD4NTkRVtFpsf9ep+ByBKc78lLKrAGdTdRbhoRExPc=; b=hK6IpCEmQpG7waV1DS0UEt6Ml7
	BISNda561Cd7o/KhCPine2RZkA/mPmZCiNeb/6ojx3XSA0jvKW7XJbRNfE6QkvqJyb2lZ8DsfdA5U
	Pq9dD0I66zTmPy3eQyO80dK3/QPxHVgArg/B0BrgbFRZtBPk1OO2+aA19VcB+PPiQ1b4TXEs9ayS4
	aOStATU3VN4+t5TZaMfmSGt6zEZd0mCDEaNJW06TDQq61dBqCNX6fnd2YnsmOG2Q9YVKH13MFCXp9
	TcRuJELZd2yoUG1EfbVvpkm4oex2ar8xnMR7z0yVCDSGaO4SVJBhBNXMHG/EkF4GYJy1k1koX4Pkw
	HTdrAq6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHoe-00B2CW-QI; Tue, 07 Feb 2023 06:50:56 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHoV-00B2A9-SX
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 06:50:49 +0000
Received: by mail-vs1-xe35.google.com with SMTP id a24so15278298vsl.2
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 22:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ovD4NTkRVtFpsf9ep+ByBKc78lLKrAGdTdRbhoRExPc=;
        b=aSz1OItET9lgxK/S1Ryjin49/fpFyBf/eXdaBxZu3kafmKocBA7g/+H7Dc6o8PE9ml
         TpgXs1r44ebC1xHMW2isjHKBewi5M6NwitN4otd+IlASmD+fEKgdmtNl34/v69XDAGPE
         Y2L13X715ApbH8k5GDcCZLUdwbW0SgrXbEXKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovD4NTkRVtFpsf9ep+ByBKc78lLKrAGdTdRbhoRExPc=;
        b=PInLznVheGiBnVJEPa5C22olui/fiE5PMznSzWCb86pSfwzX3QwBM+M6uwoJeuYGcp
         MfN/kgJUXKmDPTgmucOpEhYMLWaWSpG2ZRkN7ZCEGB1Y/WCIE+1HvYfxgWQwEuxbyvG8
         QNsY+I+A1W56ktmX25vMMAhTG+xYuPXxwgwRSWmrqqArkYdxZmcCkSUU/QWSLkeGSO26
         jYxjzlyAeZJoPvjtstFiyTKPZp4oZ8UdCjv9XZk7J+LGLXLTb2H7zAHHhZeMcC8rdZ9J
         Y32+N3geHklJ1GYuy8PZcbbnUS/kBIfzz57reOZz3alLIJ68CD6XwKSU4xvpP/t3uzJ5
         okJw==
X-Gm-Message-State: AO0yUKVWqcoBVSptG9Zu+OHwM+jOt8lmRnKWQekmapbPVfpJ8ed2ZVED
	iIuVxHL2+XKyj0bi0xOXdbY/22A4xyBt+Cc2QbUGGw==
X-Google-Smtp-Source: AK7set99t3gC07Hg4yA0UO3w3cEuRbQykjCNUiz+MsYe6moWdFHqfF8gGT+ZkK7EQ8lATbxIIWMvgDhlF5i8p+oiQ3k=
X-Received: by 2002:a05:6102:4b8:b0:3fe:ae88:d22 with SMTP id
 r24-20020a05610204b800b003feae880d22mr463700vsa.65.1675752645237; Mon, 06 Feb
 2023 22:50:45 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-9-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Feb 2023 14:50:34 +0800
Message-ID: <CAGXv+5EFKxx8-8aD1VeMpPmNsztPJMsirpDc4Nd17ZMi7ED_9Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230206_225047_931718_9F9F3A52 
X-CRM114-Status: GOOD (  20.77  )
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

`git diff --color-moved=dimmed-zebra --color-moved-ws=ignore-all-space`
agrees this is mostly code movement.

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

I think the original author still applies, given you are mostly just
moving the code?

[...]

> +static const struct of_device_id of_match_clk_mt2712_apmixed[] = {
> +       { .compatible = "mediatek,mt2712-apmixedsys" },
> +       { /* sentinel */ }
> +};
> +
> +static struct platform_driver clk_mt2712_apmixed_drv = {
> +       .probe = clk_mt2712_apmixed_probe,
> +       .driver = {
> +               .name = "clk-mt2712",

I'd change the name as well, but I'm not sure if that constitutes a
uAPI change.

> +               .of_match_table = of_match_clk_mt2712_apmixed,
> +       },
> +};
> +builtin_platform_driver(clk_mt2712_apmixed_drv)


ChenYu

