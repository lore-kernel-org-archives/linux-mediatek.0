Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F14C636CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 07:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzjdoXctNUchxC8lTyeO8JDrtbzbdeV99CaKuJ4JayI=; b=oBcmVdrOqhjfCnVp4Z5AL9QxBL
	UFxlkyaKZPB3qsZzcyjKQF+Pl/yiMOmeLFcsV/AzJx1c6+FKCw7Min80fh9vrDbyaLn7EJgmK7jTu
	/r9xdcM1wVUhEyVUHwUWMcbY5GoFKZTJGMeaIOMbpxijaNff8sh02YAUVzFw0lnAAzyQqDoHr83EL
	np0gsCoPRN1YrA3XXgfCYP04j933wBE3kJs8TwEGTSr4Mr3FUpH59enAaxRbiVQM/FZWZ3kdwKw1V
	lIksmHA1gPI5/y4/+IjjTGP+YyHXJn3Za+2pSzzz2GZGI4nNQOXJ1t3tWZNixzyzD3pe1wWP/Wh+L
	cvIbP8Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPIPK-00B8t6-Jd; Tue, 07 Feb 2023 07:28:50 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPIPH-00B8rZ-Bv
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 07:28:48 +0000
Received: by mail-ua1-x92b.google.com with SMTP id g12so2607849uae.6
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 23:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HzjdoXctNUchxC8lTyeO8JDrtbzbdeV99CaKuJ4JayI=;
        b=VyL6/wHisq/CO8BrIHy/E1ZH+etzFmfEs6Fc0Xn26pS87rXRAGgbjDMCgy1VO9w2LD
         53GSLXS0tjoqspDOrc2sbsMG1jvLGphbz02oHV+YVrY8i9vVqtA+aUZl65UDERtK1jfR
         Wp/CP1B4JQ7BNsIMKRhf8hqg2ERetD+jUVZsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HzjdoXctNUchxC8lTyeO8JDrtbzbdeV99CaKuJ4JayI=;
        b=Cwm1n2pktGZ4WodHwkG+5ErfNKJwA/ljRjnKdvVXZUX4FEcZuxtt4xv1a6ibiCX12s
         TWRl7j9ki0CxSgQL5yye72GBs8s2tOJk5mQGhxJttiEKosxJ5gZtR5GelA3jdCehRt0b
         CfZgkxgG0wk5U0kboJgsOJ8oG99W4kfBoiHiBvcAuOcnLN9umvvwURV9TiOKtutKT/Mf
         yS1XUlDxy84q6lLBAVC1DFu87faQBRHmzeg2gQ1derdvtnsDDoiqziGdW9Taw0Y49FV1
         ifIo7DoLJgXqYGlU/rPERwLZvIFinOsyMxMFAEPNnwfbmwsYpTnssGJ0k25asfZqQMXE
         b3WQ==
X-Gm-Message-State: AO0yUKWy6E0L2nGZdqR/m1keDlFTk2AZOeiF0sD7DezrKAPua5RmZ1PG
	RXASt6XKoM2PetDm0+h/QmFl/6r0ei6mWlxBqVtSCw==
X-Google-Smtp-Source: AK7set8XFtuxBK35Pvm8tuc5v8uLTzBmZlvege+TNQdg4B3RZkkeRNjUNbCkF5kOjZv0eXvuVKh8HqhvTkURODvoF7g=
X-Received: by 2002:ab0:76c4:0:b0:5f0:4676:e4f1 with SMTP id
 w4-20020ab076c4000000b005f04676e4f1mr433891uaq.44.1675754926331; Mon, 06 Feb
 2023 23:28:46 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-13-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-13-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Feb 2023 15:28:35 +0800
Message-ID: <CAGXv+5G0+pbgz_6ajWOYNLYMOn4a9+pmPKFngUCrQEtwZe8vVg@mail.gmail.com>
Subject: Re: [PATCH v1 12/45] clk: mediatek: mt8365: Convert to mtk_clk_simple_{probe,remove}()
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
X-CRM114-CacheID: sfid-20230206_232847_446222_4FE74B99 
X-CRM114-Status: GOOD (  20.25  )
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
> Change the custom mt8365_simple_gate to be mtk_gate clocks and
> audio clocks to be composites to be consistent with all of the
> other MediaTek clock drivers, allowing to convert this entire
> driver to use the common mtk_clk_simple_probe() mechanism that
> also allows building this driver as module.

I think this would be easier to follow if it were split in half:
the first half migrating mt8365_simple_gate to mtk_gate, and the
second half converting to mtk_clk_simple_probe.

I assume git would generate better diffs after that.

> While at it, also perform some macro compression cleanups and
> switch to use module_platform_driver().

This would get split in half as well. The macro cleanups go with the
first half, and the switch to module_platform_driver goes with the
second.

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt8365.c | 460 ++++++++----------------------
>  1 file changed, 124 insertions(+), 336 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8365.c b/drivers/clk/mediatek/clk-mt8365.c
> index 69f293497778..4bd624884b62 100644
> --- a/drivers/clk/mediatek/clk-mt8365.c
> +++ b/drivers/clk/mediatek/clk-mt8365.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright (C) 2022 MediaTek Inc.
> + * Copyright (C) 2023 Collabora Ltd.
>   */
>
>  #include <dt-bindings/clock/mediatek,mt8365-clk.h>
> @@ -17,7 +18,6 @@
>  #include "clk-gate.h"
>  #include "clk-mtk.h"
>  #include "clk-mux.h"
> -#include "clk-pll.h"

This should be in the previous patch?

Could you also remove some of the other inclusions that don't get
referenced after this patch?

>  static DEFINE_SPINLOCK(mt8365_clk_lock);
>
> @@ -383,31 +383,23 @@ static const char * const mbist_diag_parents[] = {
>         "univpll2_d8"
>  };
>
> -static const char * const apll_i2s0_parents[] = {
> +static const char * const apll_i2s_parents[] = {

Misc. unmentioned change. It makes sense, but please mention it.

ChenYu

