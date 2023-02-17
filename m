Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42003C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 07:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7w2nsj+BPyzWeqVlSJ1h+PblPLRF+B8VDDNr9VLL6Y=; b=pGg5VHfv5ihIsZPotWtn+FX8wx
	2SubtmD8a83hDQ0iLIE+ih4m04QwFcrcHD5zETq2xB32niudqwutK+jPQ598pw2Z90QWM/rUKQDus
	xaHcJ3tZ/OkVcRUOLC0rqFX5UBpd/w0Xsc8yCbrmh7PC0eBvOTY8hOq5un7247rFif4nuJ+0X0Af2
	sISbRfd/KsrQLa7kyDjyMRe84NwoE/tiohnhUtEnjJ6q6WsYgZYK0W/7LPi/v6IdkNqgmu1yOGygF
	zm2jpHBlQBEkx7lmf0Dc8aski6AXsr5HReXFw239oZ+FCFxYSoNcVUWM2a6LPZNrbAwRrutDPiM7F
	9BpB/Y+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSvJe-00D7mK-7L; Fri, 17 Feb 2023 07:37:58 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSvJT-00D7i3-VY
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 07:37:49 +0000
Received: by mail-vs1-xe35.google.com with SMTP id j40so2690768vsv.2
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 23:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P7w2nsj+BPyzWeqVlSJ1h+PblPLRF+B8VDDNr9VLL6Y=;
        b=H5L2d+NhIswiKXwwkO0FV43AoayGluXrnMNLZcrQte38M8LVO/AwQYO11kryqQtguB
         zUMoULjT9e+/wPTmU7FPBZaJe9GTgVUE827NMb+dFosXL9Ca2pscyHXSCGQJTJAGGb8/
         EnRfF7yqrLFshOXJqWF3u8yC2dMP8Tg2E8DZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7w2nsj+BPyzWeqVlSJ1h+PblPLRF+B8VDDNr9VLL6Y=;
        b=HHbGGpx//cqhoqxp5abT6LTKpFhlaVIslxOAWIiOKaI2+ZpjAYO3nxQuCKXU+FrqRD
         oX7yR/meVUM7QvLSXqpURRchxV2fjY79qW0I1wT0fobc0mIYP3vCZcRpQKvCZlWm/Qvc
         6WSqRLu8j1KzLejCyGN9F9pM3ZY39/e9RzWXgPDJ0DFR17i64+a4DBpJm4L/LhEURh0D
         Hz3x7XfaCi6ICCPQlLBADDGQNVBA59MG4W2o692taKJ3GsMSr3zlfW6BK/xvfkhxBcYL
         KKUUQSZCkg/a/joskOZDc179UUfNe8tVh6eXqDJjbkdzexl6gFlp+wDzONMp2ehU5iTr
         Hvhg==
X-Gm-Message-State: AO0yUKXLEFegDjNcYizO/eQg6hvkcHNM3JJ0ETN3qAHAEq2gl2bA7GWw
	Diecf3ldCtzgFS/ru2gdlJASxDdJC8pwvmqEL4ci1Q==
X-Google-Smtp-Source: AK7set8j7+F3ZFMEJGFoWnVWh6MfPilnGHfz77xcGdvx1oI3rzUkBVSr7gZdqtonaWqySsWjv0S8Z1IeLYtIP/tTnL8=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1603745vso.60.1676619465306; Thu, 16 Feb
 2023 23:37:45 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-38-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-38-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 15:37:34 +0800
Message-ID: <CAGXv+5Gf6idN3LMkei503cXnuxo7HNc8=8fG0jENVHDtxDg5jQ@mail.gmail.com>
Subject: Re: [PATCH v2 37/47] clk: mediatek: Split MT8195 clock drivers and
 allow module build
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Arnd Bergmann <arnd@kernel.org>
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
X-CRM114-CacheID: sfid-20230216_233748_021175_2D5C8CF8 
X-CRM114-Status: GOOD (  18.68  )
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
> MT8195 clock drivers were encapsulated in one single (and big) Kconfig
> option: there's no reason to do that, as it is totally unnecessary to
> build in all or none of them.
>
> Split them out: keep boot-critical clocks as bool and allow choosing
> non critical clocks as tristate.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/Kconfig  | 86 +++++++++++++++++++++++++++++++++++
>  drivers/clk/mediatek/Makefile | 20 +++++---
>  2 files changed, 99 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 45b7aea7648d..88937d111e98 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -692,6 +692,92 @@ config COMMON_CLK_MT8195
>          help
>            This driver supports MediaTek MT8195 clocks.
>
> +config COMMON_CLK_MT8195_APUSYS
> +       tristate "Clock driver for MediaTek MT8195 apusys"
> +       depends on COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 AI Processor Unit System clocks.
> +
> +config COMMON_CLK_MT8195_AUDSYS
> +       tristate "Clock driver for MediaTek MT8195 audsys"
> +       depends on COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 audsys clocks.
> +
> +config COMMON_CLK_MT8195_CAMSYS
> +       tristate "Clock driver for MediaTek MT8195 camsys"
> +       depends on COMMON_CLK_MT8195_VPPSYS

One other thing. If a Kconfig option immediately follows its dependency,
then it gets indented nicely in menuconfig, but only if.
If other options are interspersed, then the indentation gets reset.

So could you reorder the options to follow the dependency graph?

Also how you chose the dependencies should be mentioned in the commit log.
These are pure run time dependencies, not compile time nor link/load ones.

Last, I think an argument could be made against the proliferation of
Kconfig options, as it dramatically increases the combinations of
allrandconfigs. Maybe Arnd (who IIRC frequently runs allrandconfig)
could chime in on whether this is actually a concern or not.

> +       help
> +         This driver supports MediaTek MT8195 camsys and camsys_raw clocks.
> +
> +config COMMON_CLK_MT8195_IMGSYS
> +       tristate "Clock driver for MediaTek MT8195 imgsys"
> +       depends on COMMON_CLK_MT8195_VPPSYS
> +       help
> +         This driver supports MediaTek MT8195 imgsys and imgsys2 clocks.
> +
> +config COMMON_CLK_MT8195_IMP_IIC_WRAP
> +       tristate "Clock driver for MediaTek MT8195 imp_iic_wrap"
> +       depends on COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 I2C/I3C clocks.
> +
> +config COMMON_CLK_MT8195_IPESYS
> +       tristate "Clock driver for MediaTek MT8195 ipesys"
> +       depends on COMMON_CLK_MT8195_IMGSYS
> +       help
> +         This driver supports MediaTek MT8195 ipesys clocks.
> +
> +config COMMON_CLK_MT8195_MFGCFG
> +       tristate "Clock driver for MediaTek MT8195 mfgcfg"
> +       depends on COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 mfgcfg clocks.
> +
> +config COMMON_CLK_MT8195_VDOSYS
> +       tristate "Clock driver for MediaTek MT8195 vdosys"
> +       depends on COMMON_CLK_MT8195

Not sure why this option is here, out of order?

> +       help
> +         This driver supports MediaTek MT8195 vdosys0/1 (multimedia) clocks.

[...]

ChenYu

