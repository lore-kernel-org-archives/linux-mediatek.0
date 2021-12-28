Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08AEC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Dec 2021 16:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n0l4Ok1axdXsLcA9hafwQKuopEH1glQGFXzvhcHKPWc=; b=RTGuWx8XBJjR/l
	yYjcZvmx1aslCfetQkXfNhaHx1lbExv5HeJNl/Ev23uo4AEkh84xl9FVlCRGk26noQguah1iROqt3
	o8CE/YS1ouswnOy74f2x86tmbe6kDF59bjO4DvKFCb3SntwNUKnwrAzccJpb20jyKb0YKM/RTARGo
	fjy6g+3e7WLo10gRkF68RwuVlT+x/PSwmiqLSf5cWKu4EL57hmJoKK5XA0q5LeqXxsDuvF5e8mOTr
	zYPNSwsKuxKdsekk0Lcp8zcSFfuUsMa5899rqzTkgMfItRr0Ld237196sreT5fyuKRNHNXvKlhfv2
	H/RtSTb3Op04W3sZz0Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Fo2-001abP-4b; Tue, 28 Dec 2021 16:58:34 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Fno-001aWZ-FW
 for linux-mediatek@lists.infradead.org; Tue, 28 Dec 2021 16:58:21 +0000
Received: by mail-lf1-x131.google.com with SMTP id k21so42683167lfu.0
 for <linux-mediatek@lists.infradead.org>; Tue, 28 Dec 2021 08:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wJ2UCTOdHZ1mWOou8w5B04IVAeeeJIqBvX9nSk3ClqQ=;
 b=SWJ2Hna+Zx0qaSG8FksPVfe8GzT41+58Zl7EihJQ0yEGRg0IyryEJbQJwf7hx4ZSPO
 Mpr2QJGKNoZsF3zyxYbGZ6pRFlkekadHQsYzEe5ez4RV4K/OC0bwMXr71tSqjQlccOPv
 pe+AJLpJOQyKMtKH4hIN4SiDVHndl6zRGorQuwm/A0EVRa5LKHazQcnB7gtDJZry67M8
 PHTtoUMPo4W+brLzd9KwXP+vJH4rgmNdSKT/8QCnGrthpmzUszsXumlm8phWThohlwNy
 ixfhTCQjQG0a3V7YlALyI5hrZoYBX81wH01iO2yrK5Nk6aFm6sN23NfS2Bj7nSfT1DWi
 e8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wJ2UCTOdHZ1mWOou8w5B04IVAeeeJIqBvX9nSk3ClqQ=;
 b=4Bc3O4HoF4APpihCZfPc9YzklUsw/wiJjC9iJ8y/fUZ+RlWfOJoGVfsUpGTqe9+773
 sYNEXYenHljimJH10Ft5YG7rJqjTVouns6VI3vQwpsRmb7FgRRhrV01X+pOivLzKwa4c
 y2pkwtZ7EWqnJfbeMvnj+c2fsEF+vDWfEvg73C8xh75vCpx2Z/aTTWdbYg8wwUS6JIyr
 WTm/MBriZMIuAqOuVV4xk8rStRPsnlw8yOQKiRaBGNO+R9uITXxvqmvW1GDJ1nrgzPtp
 hhcqCWbQ1wdGoLdyfzNYYCTqXg22HVFCyhUUW9lIm/wH8wPluvJ9+mnJu4UCoS6r8Yjw
 Uttw==
X-Gm-Message-State: AOAM533rkJne+euTZlOrUMBZ/Zi6swbbi+8a3OUACCuAWcQo2fgR6VBP
 lnCbzLC64CAJAon/LmcBdInEAIlAUw8A4VVSFHcPHw==
X-Google-Smtp-Source: ABdhPJzYWvZcshY2MB9EFYsPiJxSD+LRfRy9Mzdvq2XmNz9OcxVwVMzoyqJJK4f3ZhxQaPfqf4O+91KOCSHNNQYSs/Q=
X-Received: by 2002:a19:5019:: with SMTP id e25mr20271955lfb.254.1640710698232; 
 Tue, 28 Dec 2021 08:58:18 -0800 (PST)
MIME-Version: 1.0
References: <20211216125748.179602-1-angelogioacchino.delregno@collabora.com>
 <20211216125748.179602-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20211216125748.179602-5-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 28 Dec 2021 17:57:41 +0100
Message-ID: <CAPDyKFpX7_EfnDup-ZvG=9H36Ok3tvnBdS_Q+e4RcAYMN1K_KQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] mmc: mtk-sd: Assign src_clk parent to src_clk_cg for
 legacy DTs
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chaotian.jing@mediatek.com, matthias.bgg@gmail.com, 
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_085820_559403_DCEF367D 
X-CRM114-Status: GOOD (  22.08  )
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

On Thu, 16 Dec 2021 at 13:57, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In commit 3c1a88443698 ("mmc: mediatek: add support of source_cg clock")
> an independent cg was introduced to avoid a hardware hang issue during
> clock mode switches (subsequent commits will set that clock as optional).
>
> When this clock is not present in device-tree, any operation is being
> done on src_clk's parent (calling clk_get_parent()): to simplify this
> and avoid checking for src_clk_cg presence everytime, just assign the
> parent clock to src_clk_cg and remove the now useless checks.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

The series applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 59d7decc3051..65037e1d7723 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -901,14 +901,8 @@ static void msdc_set_mclk(struct msdc_host *host, unsigned char timing, u32 hz)
>                 }
>         }
>         sdr_clr_bits(host->base + MSDC_CFG, MSDC_CFG_CKPDN);
> -       /*
> -        * As src_clk/HCLK use the same bit to gate/ungate,
> -        * So if want to only gate src_clk, need gate its parent(mux).
> -        */
> -       if (host->src_clk_cg)
> -               clk_disable_unprepare(host->src_clk_cg);
> -       else
> -               clk_disable_unprepare(clk_get_parent(host->src_clk));
> +
> +       clk_disable_unprepare(host->src_clk_cg);
>         if (host->dev_comp->clk_div_bits == 8)
>                 sdr_set_field(host->base + MSDC_CFG,
>                               MSDC_CFG_CKMOD | MSDC_CFG_CKDIV,
> @@ -917,11 +911,8 @@ static void msdc_set_mclk(struct msdc_host *host, unsigned char timing, u32 hz)
>                 sdr_set_field(host->base + MSDC_CFG,
>                               MSDC_CFG_CKMOD_EXTRA | MSDC_CFG_CKDIV_EXTRA,
>                               (mode << 12) | div);
> -       if (host->src_clk_cg)
> -               clk_prepare_enable(host->src_clk_cg);
> -       else
> -               clk_prepare_enable(clk_get_parent(host->src_clk));
>
> +       clk_prepare_enable(host->src_clk_cg);
>         readl_poll_timeout(host->base + MSDC_CFG, val, (val & MSDC_CFG_CKSTB), 0, 0);
>         sdr_set_bits(host->base + MSDC_CFG, MSDC_CFG_CKPDN);
>         mmc->actual_clock = sclk;
> @@ -2530,6 +2521,19 @@ static int msdc_of_clock_parse(struct platform_device *pdev,
>         if (IS_ERR(host->src_clk_cg))
>                 return PTR_ERR(host->src_clk_cg);
>
> +       /*
> +        * Fallback for legacy device-trees: src_clk and HCLK use the same
> +        * bit to control gating but they are parented to a different mux,
> +        * hence if our intention is to gate only the source, required
> +        * during a clk mode switch to avoid hw hangs, we need to gate
> +        * its parent (specified as a different clock only on new DTs).
> +        */
> +       if (!host->src_clk_cg) {
> +               host->src_clk_cg = clk_get_parent(host->src_clk);
> +               if (IS_ERR(host->src_clk_cg))
> +                       return PTR_ERR(host->src_clk_cg);
> +       }
> +
>         host->sys_clk_cg = devm_clk_get_optional(&pdev->dev, "sys_cg");
>         if (IS_ERR(host->sys_clk_cg))
>                 host->sys_clk_cg = NULL;
> --
> 2.33.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
