Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EDAC636D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 04:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rn/OmYfGz3HlNF4zZ6zIKzHGJ/JlR0OYd4bSBBLtvEA=; b=HAtsx9pL5MN0H2EyRmqABrze1s
	WBjnvQgzW8H1R9RFmjZMQgssJsK46WClrdhfL7fMKp06VMcdXt0yxJ46ls+HeQqBK1+loaVlFeuJL
	g+dT2/8YeCboMn9h8cEraza9ygV61MFibuyNX33aV1Ii8PoYpsJECDAH/qBtBZbvJCSGtQepffEHR
	D5BEjAcpnzZefQoeo8tzCJUQfdkVBV2PCxGVZsSTLMl3P03ioQXNsgfpHPN7uda0FRnEWLN6XVEFq
	i+jCHuiAcy4uFOwR9APUDo8KYpNugXyslxUPBLG6xQElg28EJ/Qq5yRvZLeWNb8PbRBbdmbIoW3OX
	IhjdNyfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSsPK-00Cgvu-8M; Fri, 17 Feb 2023 04:31:38 +0000
Received: from mail-vs1-f45.google.com ([209.85.217.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSsPH-00CguR-Ab
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 04:31:36 +0000
Received: by mail-vs1-f45.google.com with SMTP id d66so4325697vsd.9
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 20:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rn/OmYfGz3HlNF4zZ6zIKzHGJ/JlR0OYd4bSBBLtvEA=;
        b=UXYLlZtdc5jXdgeXyTyGujX2S8FoYZoQki0xcU8Uu2kOhKFR9Mi3/cT2XW2RuZ9Dox
         LcAyX9DfJJ5dOAYEk05t8jzQjcYMmcfHbRHfgy227juzjnLMlOax7DphA1tX6lVmwTuP
         5RTrc+W1w6A7qsHRPWTwfsD8PudbfnOx9L3IA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rn/OmYfGz3HlNF4zZ6zIKzHGJ/JlR0OYd4bSBBLtvEA=;
        b=Sq/7B7r/sLY6Kmc8oFb95bKs4hWBm0F0D22ECpn9jTAmJmjOWhn2zDmU97RrKP3SET
         o9HqM6fX4AGLlH+KMN1it6mMU48OZnIKzaWFuzP6dp/PV2h9EgnJRyZuhG8B3qn7iL87
         6mdNoe01sXkiDOlaDoG7mOBCsazf0AL7lcipOtEZAWfuMVgc1qlwZrcz/8DRw45P+4Ua
         SAPxAwW5YOnmXLt8YIQfuzpwmx/EcMCJcwmWibxSe6TDRotzOMf/PYmC0fT2EF5ouqvk
         TRfOcTy/NRmTymVaQoZm52ElacZn0Nxj42cXi11DKTTrB9Okq2OUisjCYngY+cyIe5Gt
         YRmA==
X-Gm-Message-State: AO0yUKWbc+eO368xGMNvCYjbmac9IURlDnMZTQ6m4OW2ebMX3i9UafEf
	QBSokjKgiM+fzS/QZxsPFPcwi1YWcn8Sj8i5QFbp3w==
X-Google-Smtp-Source: AK7set+RpbyryePA3PgFybbN8hipd8wGwv4jo+RuWVcM6nO3ydmFwiScewRsMc4d2x4qF7+myO9dlYpU5kECAXb2nOI=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1531710vso.60.1676608293769; Thu, 16 Feb
 2023 20:31:33 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-38-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-38-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 12:31:22 +0800
Message-ID: <CAGXv+5H7=rOwVK2SapqyeKHKnRJMwXFf1OSD-qhgjkbkoR=Zmw@mail.gmail.com>
Subject: Re: [PATCH v2 37/47] clk: mediatek: Split MT8195 clock drivers and
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
X-CRM114-CacheID: sfid-20230216_203135_421850_1049C683 
X-CRM114-Status: GOOD (  14.96  )
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

Would something like

          default COMMON_CLK_MT8195

help with the transition?

Otherwise we'd need to add a whole lot more stuff to arm64's defconfig,
and anyone running `make olddefconfig` would have many of their clock
drivers no longer available.

Same applies to the MT8186 split.

Seems like not all MediaTek SoCs apply this pattern, but at least MT7986,
MT8167, MT8173, MT8183 do this.

ChenYu

