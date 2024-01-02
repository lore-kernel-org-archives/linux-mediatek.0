Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9682DC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 16:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7mw9sYe2c4ti/SYwthiIEsX16vYxBmZCGPwYl/4Wm0=; b=vytoUJbsTaI96/P1qWTjYbY8Sa
	P9EzQzYyDxxeQnFInCYb4CjmA5U6sfyY+qb2QBBrZ0dUNQIm6hTjC0GaapldVkCXZ2biebMBrDQC3
	hQiYgbBZdXBf6Kwclfdf/VoBrR14MacyB+jK4ccGP30PEs8YQA0f6EibYWyNhPQfzQ67YnXZxrsyO
	Cc1kc/lZH+fy3l/HeiACLrGITXTcsNmpzIj77uYNgx7iw0vuV9/o4hXmgDT6/skWpPrxgYAgc+MGy
	vZrB8KF6PfuphBEcit4eyfbRs68b4GT+Gy07XdvQKYBsYF7atqrJv1ILYQYEUSYC/fRhFCGAbQXT7
	mFYY5mqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKi5V-008XFx-1b;
	Tue, 02 Jan 2024 16:57:57 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKi5N-008XB0-03
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jan 2024 16:57:53 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5f00bef973aso27924867b3.0
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Jan 2024 08:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704214664; x=1704819464; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P7mw9sYe2c4ti/SYwthiIEsX16vYxBmZCGPwYl/4Wm0=;
        b=Hf9iURgyasqs5eRgFradY7/72MVxgJ3z/fv3VGC6IfaEs80LCaQ8DOn1tEV/8KjLh5
         XdyVW7HHAkjKyL11nBN81di6210E/++xhCwGIsm2AgtxD/GSBHKN8lmYiet42cJHEWlo
         y4o8+iO76//TZxhQEnet4CHBu0VMI3oz986ccbp+GVu+tWYii74mlZ60stkUm3zUk07v
         dAdseTD+eol45oJy0yXTqMc0xllqZiryPG6aZkCNPkqZtVL49h74CglNxZCyqHeLb+Xg
         ktCshPxFkwkYJzjd2PqsPHIRCoAjtQiqi0R6qjR+2boXCGrUrTpnKEpcRJ7XfUEzfApW
         0h1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704214664; x=1704819464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7mw9sYe2c4ti/SYwthiIEsX16vYxBmZCGPwYl/4Wm0=;
        b=JVcydhs4kZTnND+sVZkk7ezU+XZ9CnAS3innM4FC1LpKZymQJB7zNtelLOgxW1ok57
         yk2xV3SCgVsq091Xae67+mf1gRgE5w4NwuMB/x2tPwiVtpqaYQkU52+xzvdQLAMJXE/X
         CPmGf4qNj/74V/stlq7f0rBcLEmcuVSdyC7zt5yC83+eG8ZUXtQ5N9is0SOlEMtremrX
         ofnUf0nq54usby9w0fSJsq1dhLrRu6D0mljnaya6/cySPTD3ZYNjAc8vk2vo4jCwZcSd
         YPCCNnUlTIqyH8PW7FkSihwvLIybC3AuO4/A9CDbXkXYd/pydnvPbySmZlSy0URUpmkr
         Q09A==
X-Gm-Message-State: AOJu0YygdF170PYnPQfEMUxctoTz8JmAgGhXbm0yT4bwWRBYnV6HDlvv
	keHy2CoeLFb7XbW1K65m7x9nsKeLYQn9NbC7FSqjKLXIi0lS9A==
X-Google-Smtp-Source: AGHT+IGiPhJOvkXq8K67MCuEJDvv31lDX3hkO3sQTLR2RzvsBVTJnxsVkQzQRyAgjzoE0B1L1g65UJ2h/Z4CL/yHUxE=
X-Received: by 2002:a81:7b04:0:b0:5e2:2125:2763 with SMTP id
 w4-20020a817b04000000b005e221252763mr12300180ywc.19.1704214663745; Tue, 02
 Jan 2024 08:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20231218224832.81347-1-bo.ye@mediatek.com>
In-Reply-To: <20231218224832.81347-1-bo.ye@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 2 Jan 2024 17:57:07 +0100
Message-ID: <CAPDyKFpW_2vYPkOHHihib+EKi74-TGzW4_2Z4jnRJhdH+=Yi-g@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: add wp_grp_size node
To: Bo Ye <bo.ye@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, yongdong.zhang@mediatek.com, 
	"lin.gui" <lin.gui@mediatek.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_085749_265641_6D8EB7A3 
X-CRM114-Status: GOOD (  26.09  )
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

On Mon, 18 Dec 2023 at 23:48, Bo Ye <bo.ye@mediatek.com> wrote:
>
> From: "lin.gui" <lin.gui@mediatek.com>
>
> Detail:
> Add node "wp_grp_size", corresponding to WP_GRP_SIZE
> (write protect group size) of eMMC's CSD register.
>
> Scenario:
> The eMMC card can be set into write-protected mode to
> prevent data from being accidentally modified or deleted.
> Wp_grp_size (Write Protect Group Size) refers to an
> attribute of the eMMC card, used to manage write protection,
> and is the CSD register  [36:32] of the eMMC device.
> Wp_grp_size (Write Protect Group Size) indicates how many
> eMMC blocks are contained in each write protection group on the eMMC card.
>
> Final rendered file:
> "/sys/class/mmc_host/mmc0/mmc0:0001/wp_grp_size"
>
> Signed-off-by: Lin Gui <lin.gui@mediatek.com>
> Signed-off-by: Bo Ye <bo.ye@mediatek.com>

Applied for next, thanks!

Note that checkpatch complained about the patch (see below), but I
fixed it up this time.

WARNING: From:/Signed-off-by: email name mismatch: 'From: "lin.gui"
<lin.gui@mediatek.com>' != 'Signed-off-by: Lin Gui
<lin.gui@mediatek.com>'

Kind regards
Uffe



> ---
> Change in v2:
> -remove Change-Id
> -replace space with tabulation
> ---
>  drivers/mmc/core/mmc.c   | 16 +++++++++++++++-
>  include/linux/mmc/card.h |  2 ++
>  2 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 705942edacc6..e0d72378ac77 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -136,6 +136,17 @@ static void mmc_set_erase_size(struct mmc_card *card)
>         mmc_init_erase(card);
>  }
>
> +
> +static void mmc_set_wp_grp_size(struct mmc_card *card)
> +{
> +       if (card->ext_csd.erase_group_def & 1)
> +               card->wp_grp_size = card->ext_csd.hc_erase_size *
> +                       card->ext_csd.raw_hc_erase_gap_size;
> +       else
> +               card->wp_grp_size = card->csd.erase_size *
> +                       (card->csd.wp_grp_size + 1);
> +}
> +
>  /*
>   * Given a 128-bit response, decode to our card CSD structure.
>   */
> @@ -186,6 +197,7 @@ static int mmc_decode_csd(struct mmc_card *card)
>                 b = UNSTUFF_BITS(resp, 37, 5);
>                 csd->erase_size = (a + 1) * (b + 1);
>                 csd->erase_size <<= csd->write_blkbits - 9;
> +               csd->wp_grp_size = UNSTUFF_BITS(resp, 32, 5);
>         }
>
>         return 0;
> @@ -790,6 +802,7 @@ MMC_DEV_ATTR(csd, "%08x%08x%08x%08x\n", card->raw_csd[0], card->raw_csd[1],
>  MMC_DEV_ATTR(date, "%02d/%04d\n", card->cid.month, card->cid.year);
>  MMC_DEV_ATTR(erase_size, "%u\n", card->erase_size << 9);
>  MMC_DEV_ATTR(preferred_erase_size, "%u\n", card->pref_erase << 9);
> +MMC_DEV_ATTR(wp_grp_size, "%u\n", card->wp_grp_size << 9);
>  MMC_DEV_ATTR(ffu_capable, "%d\n", card->ext_csd.ffu_capable);
>  MMC_DEV_ATTR(hwrev, "0x%x\n", card->cid.hwrev);
>  MMC_DEV_ATTR(manfid, "0x%06x\n", card->cid.manfid);
> @@ -850,6 +863,7 @@ static struct attribute *mmc_std_attrs[] = {
>         &dev_attr_date.attr,
>         &dev_attr_erase_size.attr,
>         &dev_attr_preferred_erase_size.attr,
> +       &dev_attr_wp_grp_size.attr,
>         &dev_attr_fwrev.attr,
>         &dev_attr_ffu_capable.attr,
>         &dev_attr_hwrev.attr,
> @@ -1764,7 +1778,7 @@ static int mmc_init_card(struct mmc_host *host, u32 ocr,
>                         mmc_set_erase_size(card);
>                 }
>         }
> -
> +       mmc_set_wp_grp_size(card);
>         /*
>          * Ensure eMMC user default partition is enabled
>          */
> diff --git a/include/linux/mmc/card.h b/include/linux/mmc/card.h
> index 7b12eebc5586..b9c3c6303a22 100644
> --- a/include/linux/mmc/card.h
> +++ b/include/linux/mmc/card.h
> @@ -32,6 +32,7 @@ struct mmc_csd {
>         unsigned int            r2w_factor;
>         unsigned int            max_dtr;
>         unsigned int            erase_size;             /* In sectors */
> +       unsigned int            wp_grp_size;
>         unsigned int            read_blkbits;
>         unsigned int            write_blkbits;
>         unsigned int            capacity;
> @@ -306,6 +307,7 @@ struct mmc_card {
>         unsigned int            eg_boundary;    /* don't cross erase-group boundaries */
>         unsigned int            erase_arg;      /* erase / trim / discard */
>         u8                      erased_byte;    /* value of erased bytes */
> +       unsigned int            wp_grp_size;    /* write group size in sectors */
>
>         u32                     raw_cid[4];     /* raw card CID */
>         u32                     raw_csd[4];     /* raw card CSD */
> --
> 2.18.0
>

