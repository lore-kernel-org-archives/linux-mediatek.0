Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8FDC64ED8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 07:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdmyGXqsuWEA5J1LKHJz/9OjkInX21YMvFtAnrWDjfY=; b=VeL9/fLuWJFMMOw5wA535VUOf6
	bZRFPMj4BJsK3zMXu729UosgrXGY55fOz0492dJnTfkztzluJgT6BhxNmPjb2mRuBlKg5BjQtym0L
	5uRM/ucafUB5zMPr1c9W0th1hXAeFKXLcPLwFOx0+dqbg9lGicfaBCGzWLm15DZdDmkh6cMxjlw2B
	i4FWKJo8SnrKmWxM4kR9jLbRRfg6sCIqoVJ6e8XEf4Ad9Dix5JYzZvKWT9NIkNxbTFxMC4RW902Zb
	xsyJPvrT2JwqQ1Qm3VZz3WaHYqZ844vgztRj7aAUf7TLhCeQsCqWjQV6oeZHp8kuh9fzz+1Yfh0TG
	vIXzH2Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVStn-001S9T-DB; Fri, 24 Feb 2023 07:53:47 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVStk-001S8Z-A3
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 07:53:45 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id a3so7170987vsi.0
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Feb 2023 23:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vdmyGXqsuWEA5J1LKHJz/9OjkInX21YMvFtAnrWDjfY=;
        b=adA6qbq4MVAaO3KK3woJiwoMOuBmQNISBj+EVmRR/SNgcOzcS9d+nUzZPzfYwPYLmu
         ZbqTf2Zsdn/vl/g48cSS+4twwPXAG8NkA1nSxH04kVTlIC4X3i+Tz1cMxwGW2aci91j7
         pHI7rr/eT1IJedTRY6hTC+yNaAoPiwBhJHmTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdmyGXqsuWEA5J1LKHJz/9OjkInX21YMvFtAnrWDjfY=;
        b=ILgmOcsZovXsibKR1uxZ3YzxL37fDR7FUwlvd6l/gXXMWJdkB8whWS6WOU8qtYrw1L
         vHxu9EPXECyouHyRjLFAXix4woyg3SruWC/Ixsaa/hIyQmvhS5pC5TkeBjegb7QNo8d6
         y/dEhGRexI3hHuK7gqDzX13GYhQTi27S/2URC1SAM4xpKEJBp+SddE2XA9yX/KN4aJJo
         DX7gsCaWjFc4UYlKVHw+dVkyQ5OYhg3/yeGoM/7TZUrSjfiiT52kLG+Oe70n5JXNWqZm
         5VqXjElqBsl2MbTfEDrjyqmg3JWdqRQLixts4SQnotzrt0iwevKTA8rIUnBCM/n4DWR1
         SbbA==
X-Gm-Message-State: AO0yUKWcIc4g6yDS7bCPBrs+QGKghlJWtqlM1D2WSe8JsC49z01jYyZs
	/n2QuAFStflfMgBzdFP5kxjx17Md3v/4adHw8HOhCg==
X-Google-Smtp-Source: AK7set9ZAp9+Vs7DCN8gO7YWRVX7TWXuw4hHRRsssi+Iv2W0TTsgH88ywdYxCBLS54DFWC5u60r7qCR10D/MbBr9UZw=
X-Received: by 2002:a1f:4343:0:b0:400:ea69:7082 with SMTP id
 q64-20020a1f4343000000b00400ea697082mr1911875vka.0.1677225222656; Thu, 23 Feb
 2023 23:53:42 -0800 (PST)
MIME-Version: 1.0
References: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com> <20230222092543.19187-54-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230222092543.19187-54-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 15:53:31 +0800
Message-ID: <CAGXv+5F6U9VZaRR3TW_rkDQrROVBGarqZJC6+ntR0d-TxJZ_Lw@mail.gmail.com>
Subject: Re: [PATCH v5 53/54] clk: mediatek: mt8135: Join root_clk_alias and
 top_divs arrays
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
X-CRM114-CacheID: sfid-20230223_235344_400901_159065B4 
X-CRM114-Status: GOOD (  16.34  )
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

On Wed, Feb 22, 2023 at 5:27 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for converting this driver to the common simple probe
> mechanism, join the root_clk_alias and top_divs mtk_fixed_factor
> arrays.
>
> This commit brings no functional change.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/clk/mediatek/clk-mt8135.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8135.c b/drivers/clk/mediatek/clk-mt8135.c
> index 1c76c0003f99..8785d58cb3a5 100644
> --- a/drivers/clk/mediatek/clk-mt8135.c
> +++ b/drivers/clk/mediatek/clk-mt8135.c
> @@ -2,8 +2,6 @@
>  /*
>   * Copyright (c) 2014 MediaTek Inc.
>   * Author: James Liao <jamesjj.liao@mediatek.com>
> - * Copyright (c) 2023 Collabora, Ltd.
> - *               AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Was this meant for some other patch?

Also this is the first patch where my MT8186 fails to boot, which makes
absolutely no sense, since the MT8135 driver isn't even built.

ChenYu

>   */
>
>  #include <linux/clk.h>
> @@ -19,14 +17,12 @@
>
>  static DEFINE_SPINLOCK(mt8135_clk_lock);
>
> -static const struct mtk_fixed_factor root_clk_alias[] __initconst = {
> +static const struct mtk_fixed_factor top_divs[] __initconst = {
>         FACTOR(CLK_TOP_DSI0_LNTC_DSICLK, "dsi0_lntc_dsiclk", "clk_null", 1, 1),
>         FACTOR(CLK_TOP_HDMITX_CLKDIG_CTS, "hdmitx_clkdig_cts", "clk_null", 1, 1),
>         FACTOR(CLK_TOP_CLKPH_MCK, "clkph_mck", "clk_null", 1, 1),
>         FACTOR(CLK_TOP_CPUM_TCK_IN, "cpum_tck_in", "clk_null", 1, 1),
> -};
>
> -static const struct mtk_fixed_factor top_divs[] __initconst = {
>         FACTOR(CLK_TOP_MAINPLL_806M, "mainpll_806m", "mainpll", 1, 2),
>         FACTOR(CLK_TOP_MAINPLL_537P3M, "mainpll_537p3m", "mainpll", 1, 3),
>         FACTOR(CLK_TOP_MAINPLL_322P4M, "mainpll_322p4m", "mainpll", 1, 5),
> @@ -534,7 +530,6 @@ static void __init mtk_topckgen_init(struct device_node *node)
>
>         clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
>
> -       mtk_clk_register_factors(root_clk_alias, ARRAY_SIZE(root_clk_alias), clk_data);
>         mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
>         mtk_clk_register_composites(NULL, top_muxes,
>                                     ARRAY_SIZE(top_muxes), base,
> --
> 2.39.2
>

