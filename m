Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171C3C636D7
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 04:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOkHbt2DwM0CDgIvRL/mxyEHP//aQl4XeYjeyOBey4A=; b=r76P9DA6JfFVCtluhB/fMKI9nL
	KDhSGOcHH7Tnen0DqkZCTs2yg5R8ovN62JRt1LTg/I3K9K57wJ7GcvVrsYyineY4fmmb/s5YqnIis
	VMQp254GRyE/egX1GBt+qqZM8c0rzozWop+NQZjcoosl0KrJhtRmOFRWuFUeG9V/u8/W02Vsc8cMZ
	obA8+3zUlocOG39IpA55pVDXdoMjgJKEG5NN51y2ydKKlP/WdiIoi5uKWl9Nh3E3M1buyjfRZuTkx
	uMeUumynXBa/Bhd2cdbulYJji+OmZ/Lxdk1cP0A4pZM1vFJcLE5M4ybwi6q/fGsr7Pu7oh7X/D5us
	Ys+Bb2/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJq2-006YWS-QU; Tue, 21 Feb 2023 04:01:10 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJq0-006YVC-2n
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 04:01:09 +0000
Received: by mail-vk1-xa29.google.com with SMTP id r11so1789005vkq.7
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 20:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aOkHbt2DwM0CDgIvRL/mxyEHP//aQl4XeYjeyOBey4A=;
        b=b+iylTa6pifiuUsPWtginkR3amD5g+GUDC7Wh3+CzjrYhHuyjRXSLt3A4xbnXF4qK8
         NlizL7XQPzOTWet6rwrDA0QE9d42LG6k274AJXjhNjDZuRyoZN0r7er34Jxvekq6dIue
         YFF/a9h1WcDzSV5Jg2o9lP3QKhAqSsYC1CUjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOkHbt2DwM0CDgIvRL/mxyEHP//aQl4XeYjeyOBey4A=;
        b=u3cI4t4hXHtU7qwEUZP8zsiXgtueb5FAf6m0oOEoA1Gby/rfXLa/W8EUAGbSk8nqgI
         VcMuttrafx/PKe5xc1xg5bAjEQ/BdjZ1m4ntBMN3mHAZl6TJSxtfQZVIpPhjgim3bEYv
         xx5h3YXWC2Q3W71Vem49Zc246IlmaT3pYprVpyW7QMZRa/XD0ZfOvR5Fyv0lQVj0q6J+
         oxyrkZUXR8YKA1qAFdZTDQH3f+m5W7a8LdpDxM4CBq9HbQl3X8chhdSFnNrOznjPrKaT
         l9NtzpAiJuDolXOGTPj+N2yyOc1wAuczkZ0QGCWtLg3FfANnY8CrldzD9Yg2PMDDufIY
         2+ZQ==
X-Gm-Message-State: AO0yUKUs4CV4Ipwxc2ydlc6WAKCPgCAcvRzSMgM4+icOIFlVxbP3OS9a
	vb9Ph8yGaxsDeIzlbFjHFokZjY1oJ36l7bwCxMIA3Q==
X-Google-Smtp-Source: AK7set8EYzfpFS4t09iZSiGn9H8yH0KJIAf4682oGD9YBvGRiuQa0HIJxKrzUp9L/87daw+fVOjn7JpM6sxEWLIM/Us=
X-Received: by 2002:a1f:a3c8:0:b0:40b:9:82fd with SMTP id m191-20020a1fa3c8000000b0040b000982fdmr815514vke.18.1676952067008;
 Mon, 20 Feb 2023 20:01:07 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-55-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-55-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 12:00:55 +0800
Message-ID: <CAGXv+5HOEa0+FrL-97HPsfe47taU4i8xfm-A+FytAv2v9FOj6A@mail.gmail.com>
Subject: Re: [PATCH v3 54/55] clk: mediatek: mt8135: Convert to simple probe
 and enable module build
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
X-CRM114-CacheID: sfid-20230220_200108_144244_C2544CC0 
X-CRM114-Status: GOOD (  15.53  )
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

On Mon, Feb 20, 2023 at 11:02 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Convert the MT8135 clock drivers to platform_driver using the common
> simple probe mechanism.
>
> Now that all of the MT8135 clock drivers (including apmixedsys) can
> be compiled as modules, change the COMMON_CLK_MT8135 configuration
> option to tristate to enable module build.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/Kconfig      |   2 +-
>  drivers/clk/mediatek/clk-mt8135.c | 110 ++++++++++++------------------
>  2 files changed, 43 insertions(+), 69 deletions(-)
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 90691261cddb..a15fbdfd3a53 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -423,7 +423,7 @@ config COMMON_CLK_MT7986_ETHSYS
>           required on MediaTek MT7986 SoC.
>
>  config COMMON_CLK_MT8135
> -       bool "Clock driver for MediaTek MT8135"
> +       tristate "Clock driver for MediaTek MT8135"
>         depends on (ARCH_MEDIATEK && ARM) || COMPILE_TEST
>         select COMMON_CLK_MEDIATEK
>         default ARCH_MEDIATEK && ARM
> diff --git a/drivers/clk/mediatek/clk-mt8135.c b/drivers/clk/mediatek/clk-mt8135.c
> index 8785d58cb3a5..39fd919900e5 100644
> --- a/drivers/clk/mediatek/clk-mt8135.c
> +++ b/drivers/clk/mediatek/clk-mt8135.c
> @@ -5,8 +5,10 @@
>   */
>
>  #include <linux/clk.h>
> +#include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/mfd/syscon.h>
>  #include <dt-bindings/clock/mt8135-clk.h>
> @@ -18,6 +20,7 @@
>  static DEFINE_SPINLOCK(mt8135_clk_lock);
>
>  static const struct mtk_fixed_factor top_divs[] __initconst = {
> +       FACTOR(CLK_DUMMY, "top_divs_dummy", "clk_null", 1, 1),

The dummy clock stuff deserves another mention in the commit log.

Once added,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

