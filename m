Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95914C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 09:41:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EA7D23A21
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 09:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EA7D23A21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=drXewj00gtQs569J4UzX2dELoyX2QgR1rkjMT1CDEQI=; b=NxLBqDfOng16bddnU7zqkIk9v
	LdbU8S9qVOCT6i9Xlk5Ya+5T+qahbPVcs+/OpSVNK4L2yob5pb49z0Be3ZzBg4dhV6tLJOX7RUszO
	JveP1s5dTf9XYVpolwzreO9iAOl64lcOUVuV7L+cC2SW2V6G3Yw1qsfUv2KL6yQBM3OM5Ejz9kfwB
	8QaLojuBOaxWt78g7sg7ohxdITWsMu5Y7uZ3eQZcskqaBM/MVVYZZExklJy+w8kaa0SYOvu1aXU2N
	V30WgW53VAtvQga65BnK9nMyrTpHOt83DGwkq4BnQBBlxpYd2NcXLkbEVrVFC0IaN0r1Dv7TV3wQo
	Ockt+lhBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzz8D-0002N9-11; Thu, 14 Jan 2021 09:41:29 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzz7q-0002AC-1D
 for linux-mediatek@lists.infradead.org; Thu, 14 Jan 2021 09:41:20 +0000
Received: by mail-ej1-x635.google.com with SMTP id hs11so4888532ejc.1
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Jan 2021 01:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XtRchozMXYyxecV0O3wYbir6w5h71L6TdcF28RnWeBY=;
 b=Y8bXX1lbEW/3cmFQrnS+eYmDQ4vChpWqVuxI13qzfpyTTfnW2L2hooP9lSjWXUiHKl
 wjFBO5SWlHCx0ATesNnz6qkMKO1wMRV3lUJzpI4NvdOm4NTX6NX+pk5N2M/WrBRTgAZn
 67u8qzXMkXyiS03i1qX+D8eNFkrfG48K1Knqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XtRchozMXYyxecV0O3wYbir6w5h71L6TdcF28RnWeBY=;
 b=ei7IIYIpgqrw8lRJkuIXUokMHpNDUETzr1kRtpICHNE3ID9I9+FTT1Cf4Ot4WpTBJG
 mg1U6YeFXfjqrjn80GQvxiR2mv+WEVeSueCtbUmOFmqPMe+00CjgEi5BM0cRfxGvR5Uo
 6CqPJr25L9MipvF2BVGhiRmBeoQLEhqnB+4vroaDKjT+iA7onrJ8xq0NP1OLml2ZYcl4
 7WpaoV5SclWfr0okuszXpdYydzEjFLTjs4Kh+5yoml0nWG1M1cJFHN5dnNO1aUiPZEv8
 8mrfi3gXKZQGcH/+h+uA09/opa8W2ovsJHP7hhlpwOmL/nHrUTzUkzmQqwazaUXQdzpP
 DC1w==
X-Gm-Message-State: AOAM530LHqXPvbsrzTYZi09cdE34eqiKdRhQWcmQ/NoNJ4E4BdGb+4VJ
 rcHwvQsfrN90myK8FX6BeWv/z0j6I3Er/QznskSfxA==
X-Google-Smtp-Source: ABdhPJxBmrMi6Lew1mqN5EeHda8QYdKgJ9IstDviL6V/cclaaacdFTUJzFYwQYjn5SjsWvoMXE9qYTI+Ch9dw6OhPtI=
X-Received: by 2002:a17:906:c78b:: with SMTP id
 cw11mr2378212ejb.448.1610617261954; 
 Thu, 14 Jan 2021 01:41:01 -0800 (PST)
MIME-Version: 1.0
References: <1602732039-12179-1-git-send-email-neal.liu@mediatek.com>
 <1602732039-12179-3-git-send-email-neal.liu@mediatek.com>
In-Reply-To: <1602732039-12179-3-git-send-email-neal.liu@mediatek.com>
From: Pi-Hsun Shih <pihsun@chromium.org>
Date: Thu, 14 Jan 2021 17:40:26 +0800
Message-ID: <CANdKZ0f7=-keVzKm7y5WHUhsCqjA75aCMf=ph+BmrDuS203fVg@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] soc: mediatek: add mt6779 devapc driver
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_044106_196097_1A981259 
X-CRM114-Status: GOOD (  24.63  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, wsd_upstream@mediatek.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Neal,
Please see inline comments below.

On Thu, Oct 15, 2020 at 11:21 AM Neal Liu <neal.liu@mediatek.com> wrote:
>
> MediaTek bus fabric provides TrustZone security support and data
> protection to prevent slaves from being accessed by unexpected
> masters.
> The security violation is logged and sent to the processor for
> further analysis or countermeasures.
>
> Any occurrence of security violation would raise an interrupt, and
> it will be handled by mtk-devapc driver. The violation
> information is printed in order to find the murderer.
>
> Signed-off-by: Neal Liu <neal.liu@mediatek.com>
> ---
>  drivers/soc/mediatek/Kconfig      |    9 ++
>  drivers/soc/mediatek/Makefile     |    1 +
>  drivers/soc/mediatek/mtk-devapc.c |  308 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 318 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mtk-devapc.c
>
> ...
> diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
> new file mode 100644
> index 0000000..f1cea04
> --- /dev/null
> +++ b/drivers/soc/mediatek/mtk-devapc.c
>
> ...
>
> +
> +static void clear_vio_status(struct mtk_devapc_context *ctx)
> +{
> +       void __iomem *reg;
> +       int i;
> +
> +       reg = ctx->infra_base + ctx->data->vio_sta_offset;
> +
> +       for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num) - 1; i++)
> +               writel(GENMASK(31, 0), reg + 4 * i);
> +
> +       writel(GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1, 0),
> +              reg + 4 * i);

Is it guaranteed that vio_idx_num will always not a multiple of 32, or
should we check that VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) is not
zero?

> +}
> +
> +static void mask_module_irq(struct mtk_devapc_context *ctx, bool mask)
> +{
> +       void __iomem *reg;
> +       u32 val;
> +       int i;
> +
> +       reg = ctx->infra_base + ctx->data->vio_mask_offset;
> +
> +       if (mask)
> +               val = GENMASK(31, 0);
> +       else
> +               val = 0;
> +
> +       for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num) - 1; i++)
> +               writel(val, reg + 4 * i);
> +
> +       val = readl(reg + 4 * i);
> +       if (mask)
> +               val |= GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1,
> +                              0);
> +       else
> +               val &= ~GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1,
> +                               0);

Same here.

> +
> +       writel(val, reg + 4 * i);
> +}
> +
> +#define PHY_DEVAPC_TIMEOUT     0x10000
> +
> +/*
> + * devapc_sync_vio_dbg - do "shift" mechansim" to get full violation information.

nit: One extra double quote in the comment.

> + *                       shift mechanism is depends on devapc hardware design.
> + *                       Mediatek devapc set multiple slaves as a group.
> + *                       When violation is triggered, violation info is kept
> + *                       inside devapc hardware.
> + *                       Driver should do shift mechansim to sync full violation
> + *                       info to VIO_DBGs registers.
> + *
> + */
> +static int devapc_sync_vio_dbg(struct mtk_devapc_context *ctx)
>
> ...
>
> +static int mtk_devapc_probe(struct platform_device *pdev)
> +{
> +       struct device_node *node = pdev->dev.of_node;
> +       struct mtk_devapc_context *ctx;
> +       u32 devapc_irq;
> +       int ret;
> +
> +       if (IS_ERR(node))

Does this ever happens? I feel the check should be `if (node == NULL)`.

> +               return -ENODEV;
> +
> +       ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
> +       if (!ctx)
> +               return -ENOMEM;
> +
> +       ctx->data = of_device_get_match_data(&pdev->dev);
> +       ctx->dev = &pdev->dev;
> +
> +       ctx->infra_base = of_iomap(node, 0);
> +       if (!ctx->infra_base)
> +               return -EINVAL;

Missing `iounmap(ctx->infra_base)` in the following error paths and
mtk_devapc_remove. Use devm_of_iomap instead?

> +
> +       devapc_irq = irq_of_parse_and_map(node, 0);
> +       if (!devapc_irq)
> +               return -EINVAL;
> +
> +       ctx->infra_clk = devm_clk_get(&pdev->dev, "devapc-infra-clock");
> +       if (IS_ERR(ctx->infra_clk))
> +               return -EINVAL;
> +
> +       if (clk_prepare_enable(ctx->infra_clk))
> +               return -EINVAL;
> +
> +       ret = devm_request_irq(&pdev->dev, devapc_irq, devapc_violation_irq,
> +                              IRQF_TRIGGER_NONE, "devapc", ctx);
> +       if (ret) {
> +               clk_disable_unprepare(ctx->infra_clk);
> +               return ret;
> +       }
> +
> +       platform_set_drvdata(pdev, ctx);
> +
> +       start_devapc(ctx);
> +
> +       return 0;
> +}
> +
> +static int mtk_devapc_remove(struct platform_device *pdev)
> +{
> +       struct mtk_devapc_context *ctx = platform_get_drvdata(pdev);
> +
> +       stop_devapc(ctx);
> +
> +       clk_disable_unprepare(ctx->infra_clk);
> +
> +       return 0;
> +}
> +
> +static struct platform_driver mtk_devapc_driver = {
> +       .probe = mtk_devapc_probe,
> +       .remove = mtk_devapc_remove,
> +       .driver = {
> +               .name = "mtk-devapc",
> +               .of_match_table = mtk_devapc_dt_match,
> +       },
> +};
> +
> +module_platform_driver(mtk_devapc_driver);
> +
> +MODULE_DESCRIPTION("Mediatek Device APC Driver");
> +MODULE_AUTHOR("Neal Liu <neal.liu@mediatek.com>");
> +MODULE_LICENSE("GPL");
> --
> 1.7.9.5

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
