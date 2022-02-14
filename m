Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B13AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 15:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/YZhGYfC6IYJOe4kVSO8xCjFTxo+Hpz7s5GHLnMBWY8=; b=zcTKGUSQDCUnrs
	9+Enj0FC/yySGgL6ZNgm7luDF8TBYglCB71Ky/BG33MeiUcnhpialbwhs+xWExB8tPySIJyowjIZn
	E1PV+JRvs4gYMOtruXQXqXzDc/9YvUx6DyKvJYQCdrpEl7YJD8TKr/5ZSplLMb41dE9V5m6NOM5wT
	2LAFAvx7sy79hjZUlkduKgdqeHXpDQqNb7K+A46Kub1DOJnBU5FRDdAkmU5gQzq2SnawejG+6uh6S
	67CZeGQBTrLfhV5Px2bWCXRfEujikqtQeBCfDfjKvSYLPooD4+XxxwudKrESNUlIwpsB/cNG9u68A
	WYAN+xLKy7ds5BHCzvuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJdO9-00FraM-JS; Mon, 14 Feb 2022 15:35:41 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJdNx-00FrYw-NC
 for linux-mediatek@lists.infradead.org; Mon, 14 Feb 2022 15:35:31 +0000
Received: by mail-lf1-x12b.google.com with SMTP id z14so10275868lfu.5
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Feb 2022 07:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iRYhE5QfFh6N5neui9jc14hYBWThUe6VRAPVyILvtvI=;
 b=hVYAEeUsZHwDztmlTeFxSWpRg3De/fjl/iZo3DZ2HN/sZNhxgJWdjODwGlfVs9GWuU
 T3hUgy3RLKCaGk9U+pUc/FqmBoayO/BRpiaL6rXDMNEN2pfnVc5uDV/fY0Vq00k3eVFQ
 WNoIuJIsnPKJ1ofvs7c4qiM3qaKtT9+qNSf+wOnunJUN7upd3HcRF4zlh/SS3q87GUua
 zhsvo/z5wl3fUazBjwE1KzKcjTW/x/lWiRht9v8ZiDfJovHGYnsOL+Dr5+DgskHtYJ5S
 eXitXaIvPefLnFP7E+OIOZya1VCZlRA+61zHOWQDq/Hp5It9wGjcz2t0Q0O22yF9Lpkq
 YMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iRYhE5QfFh6N5neui9jc14hYBWThUe6VRAPVyILvtvI=;
 b=vRpg4RgyBSqWevtK30LcFbGZ6hyzCGH/zMPfHTOC8ULCeN1hpMg5zoz/qhXXVtaJmY
 vrcVI/mjZa/3t7zLqOtsx1k+7jdQOoCyoJjw3uHzc0hGLIC3tJCjQFkf7H0YdglHXLOH
 4jf/0WWfvQgh31m9xJW3KvQ874UUVFjy/1r/b/k3SA0ObM236b13ZcXKhbPEaE3D7nYj
 OQKGeNJTZj0Ei8YM+QWLrDWTNufQnO6sMhILwQskAedJSQgC7adxCG9yQoFZ5x0HW+mp
 sz+JP8ixAS44oI7jUcVWa4/Qva8iNI65nP+XGthyx1rctlfKK2YmQaBzYd6l7Sd0VCqn
 aevg==
X-Gm-Message-State: AOAM532AF4jGsUHNWh0nrbLWszwy588uMHAUJuaSr8ZbV3NNEwjC2a99
 0pB1imlh3pyXgULTNaThoOH+CzkdgTFVJPDVNnFdjdbh2+d9tA==
X-Google-Smtp-Source: ABdhPJx9g6QNumI+cxbYO4D4/KGsV3uSlDR9miwSvQwPmYjPvhAAf0dojPsqo48saytOTLx1auETX9CyWKvOARPGSgs=
X-Received: by 2002:a05:6512:3e10:: with SMTP id
 i16mr160939lfv.184.1644852926808; 
 Mon, 14 Feb 2022 07:35:26 -0800 (PST)
MIME-Version: 1.0
References: <20220121071942.11601-1-axe.yang@mediatek.com>
 <20220121071942.11601-3-axe.yang@mediatek.com>
In-Reply-To: <20220121071942.11601-3-axe.yang@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 14 Feb 2022 16:34:50 +0100
Message-ID: <CAPDyKFqd+H6F4+gBd4CEigaOTC5TtjtT75B3G0B6qexFi6XqKw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] mmc: core: Add support for SDIO async interrupt
To: Axe Yang <axe.yang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Satya Tangirala <satyat@google.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach <dev@lynxeye.de>, 
 Eric Biggers <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>,
 Yue Hu <huyue2@yulong.com>, 
 Tian Tao <tiantao6@hisilicon.com>, angelogioacchino.delregno@collabora.com, 
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_073529_786398_BC141F95 
X-CRM114-Status: GOOD (  25.31  )
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

On Fri, 21 Jan 2022 at 08:19, Axe Yang <axe.yang@mediatek.com> wrote:
>
> If cap-sdio-async-irq flag is set in host dts node, parse EAI
> information from SDIO CCCR interrupt externsion segment. If async
> interrupt is supported by SDIO card then send command to card to
> enable it and set enable_async_irq flag in sdio_cccr structure to 1.
> The parse flow is implemented in sdio_read_cccr().
>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> ---
>  drivers/mmc/core/host.c  |  2 ++
>  drivers/mmc/core/sdio.c  | 17 +++++++++++++++++
>  include/linux/mmc/card.h |  3 ++-
>  include/linux/mmc/host.h |  1 +
>  include/linux/mmc/sdio.h |  5 +++++
>  5 files changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index cf140f4ec864..a972241548b4 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -410,6 +410,8 @@ int mmc_of_parse(struct mmc_host *host)
>         if (device_property_read_bool(dev, "no-mmc-hs400"))
>                 host->caps2 &= ~(MMC_CAP2_HS400_1_8V | MMC_CAP2_HS400_1_2V |
>                                  MMC_CAP2_HS400_ES);
> +       if (device_property_read_bool(dev, "cap-sdio-async-irq"))
> +               host->caps2 |= MMC_CAP2_SDIO_ASYNC_IRQ;
>
>         /* Must be after "non-removable" check */
>         if (device_property_read_u32(dev, "fixed-emmc-driver-type", &drv_type) == 0) {
> diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
> index 41164748723d..771fb5d18585 100644
> --- a/drivers/mmc/core/sdio.c
> +++ b/drivers/mmc/core/sdio.c
> @@ -225,6 +225,23 @@ static int sdio_read_cccr(struct mmc_card *card, u32 ocr)
>                                 card->sw_caps.sd3_drv_type |= SD_DRIVER_TYPE_C;
>                         if (data & SDIO_DRIVE_SDTD)
>                                 card->sw_caps.sd3_drv_type |= SD_DRIVER_TYPE_D;
> +
> +                       if (card->host->caps2 & MMC_CAP2_SDIO_ASYNC_IRQ) {

We can probably check host->pm_caps & MMC_PM_WAKE_SDIO_IRQ here,
instead of MMC_CAP2_SDIO_ASYNC_IRQ.

> +                               ret = mmc_io_rw_direct(card, 0, 0, SDIO_CCCR_INTERRUPT_EXT, 0,
> +                                                      &data);
> +                               if (ret)
> +                                       goto out;
> +
> +                               if (data & SDIO_INTERRUPT_EXT_SAI) {
> +                                       data |= SDIO_INTERRUPT_EXT_EAI;
> +                                       ret = mmc_io_rw_direct(card, 1, 0, SDIO_CCCR_INTERRUPT_EXT,
> +                                                              data, NULL);
> +                                       if (ret)
> +                                               goto out;
> +
> +                                       card->cccr.enable_async_irq = 1;

As you show in the next patch(3), this flag is useful to read for the
host driver.

However, rather than accessing this flag directly in the host driver,
can you please add a helper function that takes a struct mmc_card* as
in-parameter instead?

> +                               }
> +                       }
>                 }
>
>                 /* if no uhs mode ensure we check for high speed */
> diff --git a/include/linux/mmc/card.h b/include/linux/mmc/card.h
> index 37f975875102..4df9182bc0e6 100644
> --- a/include/linux/mmc/card.h
> +++ b/include/linux/mmc/card.h
> @@ -219,7 +219,8 @@ struct sdio_cccr {
>                                 wide_bus:1,
>                                 high_power:1,
>                                 high_speed:1,
> -                               disable_cd:1;
> +                               disable_cd:1,
> +                               enable_async_irq:1;
>  };
>
>  struct sdio_cis {
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index 7afb57cab00b..502a5418264c 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -402,6 +402,7 @@ struct mmc_host {
>  #define MMC_CAP2_CRYPTO                0
>  #endif
>  #define MMC_CAP2_ALT_GPT_TEGRA (1 << 28)       /* Host with eMMC that has GPT entry at a non-standard location */
> +#define MMC_CAP2_SDIO_ASYNC_IRQ        (1 << 29)       /* SDIO host supports asynchronous interrupt */
>
>         int                     fixed_drv_type; /* fixed driver type for non-removable media */
>
> diff --git a/include/linux/mmc/sdio.h b/include/linux/mmc/sdio.h
> index 2a05d1ac4f0e..1ef400f28642 100644
> --- a/include/linux/mmc/sdio.h
> +++ b/include/linux/mmc/sdio.h
> @@ -159,6 +159,11 @@
>  #define  SDIO_DTSx_SET_TYPE_A  (1 << SDIO_DRIVE_DTSx_SHIFT)
>  #define  SDIO_DTSx_SET_TYPE_C  (2 << SDIO_DRIVE_DTSx_SHIFT)
>  #define  SDIO_DTSx_SET_TYPE_D  (3 << SDIO_DRIVE_DTSx_SHIFT)
> +
> +#define SDIO_CCCR_INTERRUPT_EXT        0x16
> +#define SDIO_INTERRUPT_EXT_SAI (1 << 0)
> +#define SDIO_INTERRUPT_EXT_EAI (1 << 1)
> +
>  /*
>   * Function Basic Registers (FBR)
>   */

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
