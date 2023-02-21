Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334FBC61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 07:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DUvCeFI9BHWAoO/zKvffMjZuUEizyKxpjmRG4IyfZI=; b=1ssDoXmCickFJr5zPC5Rewih5u
	02BNh/wStWbLOe4A+yFCgwVU8wBUINOxUmDPcZCL1kSsO8L7h/EmUpESG+w/IAS4kA3ALudmaXDc7
	ZDWmlBkPabpd580bFW2Rc+MDFQP/Ut7nvOiLN/YN4he9Og0GT1p+wr2Tf0dg7prvIrnMXA2plH7cu
	ykTiUutRMZgjweKpp0ffjlucMTyWlQnvng2flSXg73x+tzU3ndJIPyV1Rxu45+Gkvs4iiTiLlxn9C
	H4YQ3PqYJRqezxLjwAweRBqeLJ7Ud3iH7t6L+qcWarYB+95g7iFhzTdGMXdfDaCLl3lSO8IWfLB/Z
	c1vrI0HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMoM-006qVL-I2; Tue, 21 Feb 2023 07:11:38 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMoA-006qRq-PZ
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 07:11:28 +0000
Received: by mail-ua1-x931.google.com with SMTP id p18so207524uad.11
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 23:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+DUvCeFI9BHWAoO/zKvffMjZuUEizyKxpjmRG4IyfZI=;
        b=U5KZdGiXJibu7wRYaxdO8HYzWbPJyYS6XheXOL9JFe+YKSqEEjtZZeuVgyAKELDP8K
         AEvWkZNSwhMdd8iTivrxTKWfywG2fAwi48dgmGUCG1T/S+EoIMMkozbGylKqbZhpkNoO
         1GsmiEV5XJyMthaIEl5gYZUSnUhnm+fuU9C84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+DUvCeFI9BHWAoO/zKvffMjZuUEizyKxpjmRG4IyfZI=;
        b=NClC+WmL+iQwS+92vJBbLn2FxaX6pcLw78qs38ZgOoMswxJHGrU1Cc9Y7jsb/ECWas
         GTUVbmf8e7yAWWP2xhTbPVFR1K4fX5eo1Jjgx/w/v79vCu23W1GPP6euEwGBL3SPvWxa
         PltRuOSXd7mUWKQzRCYSNtdwOjN6BfBPVWBbNZI7FpUYKH/iB42f69zRu/hNGyLjyAF6
         2vf1OOgB5l8voUlB8mGxIsizEeNkoR54pVgorilbDvtX2IcIJ4AmAyBwTWpyvTvfBHT+
         s/xSH+OTKIq2nWNUC9iOzmFGx1YDYLwueOhOuaCJbiHzsu1weDhSrBQ2JEmQj+QU4aWC
         tlrg==
X-Gm-Message-State: AO0yUKXL++rt1jpaYWgC+Vfv58wmrH+myKad1IE1r5GieUdRkrEBX9wj
	r5IjoTIjzxTLHxlcpUj6Opc4knEVQpvkXLX6cXDBDOU6fqcCj451
X-Google-Smtp-Source: AK7set/yqwhMIo1VLl3ac92155791hmnZ3MjUsVUCyfkhacYq1LOD2N4kB2QwF3gdeKHtYu1rW9Bfxw3g2Zsn0izPyU=
X-Received: by 2002:ab0:53d5:0:b0:68a:5c52:7f2b with SMTP id
 l21-20020ab053d5000000b0068a5c527f2bmr613970uaa.1.1676963480849; Mon, 20 Feb
 2023 23:11:20 -0800 (PST)
MIME-Version: 1.0
References: <20230216130021.64875-1-angelogioacchino.delregno@collabora.com> <20230216130021.64875-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230216130021.64875-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 15:11:10 +0800
Message-ID: <CAGXv+5E+EExkTSn8GKKEVHGrJf8aP+ZNwuMVPEO1v6frtfAeCg@mail.gmail.com>
Subject: Re: [PATCH v1 5/9] soc: mediatek: mtk-mutex: Compress of_device_id
 array entries
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, jason-jh.lin@mediatek.com, chunkuang.hu@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_231126_905724_473765AC 
X-CRM114-Status: GOOD (  16.31  )
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

On Thu, Feb 16, 2023 at 9:02 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Compress entries of the of_match_mtk_mmsys array to reduce the amount
> of lines and increase readability; this brings us to a maximum of 95
> columns.
>
> While at it, also add a sentinel comment to the last entry for the
> sole purpose of consistency.
>
> This commit brings no functional changes.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/soc/mediatek/mtk-mutex.c | 38 +++++++++++---------------------
>  1 file changed, 13 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index c5b1b42303ac..5c875139425c 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -921,31 +921,19 @@ static int mtk_mutex_probe(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id mutex_driver_dt_match[] = {
> -       { .compatible = "mediatek,mt2701-disp-mutex",
> -         .data = &mt2701_mutex_driver_data},
> -       { .compatible = "mediatek,mt2712-disp-mutex",
> -         .data = &mt2712_mutex_driver_data},
> -       { .compatible = "mediatek,mt6795-disp-mutex",
> -         .data = &mt6795_mutex_driver_data},
> -       { .compatible = "mediatek,mt8167-disp-mutex",
> -         .data = &mt8167_mutex_driver_data},
> -       { .compatible = "mediatek,mt8173-disp-mutex",
> -         .data = &mt8173_mutex_driver_data},
> -       { .compatible = "mediatek,mt8183-disp-mutex",
> -         .data = &mt8183_mutex_driver_data},
> -       { .compatible = "mediatek,mt8186-disp-mutex",
> -         .data = &mt8186_mutex_driver_data},
> -       { .compatible = "mediatek,mt8186-mdp3-mutex",
> -         .data = &mt8186_mdp_mutex_driver_data},
> -       { .compatible = "mediatek,mt8188-disp-mutex",
> -         .data = &mt8188_mutex_driver_data},
> -       { .compatible = "mediatek,mt8192-disp-mutex",
> -         .data = &mt8192_mutex_driver_data},
> -       { .compatible = "mediatek,mt8195-disp-mutex",
> -         .data = &mt8195_mutex_driver_data},

This conflicts with the MT8195 VPP mutex patch already in Matthias's
temporary branch: http://git.kernel.org/matthias.bgg/h/v6.3-tmp/soc

ChenYu

