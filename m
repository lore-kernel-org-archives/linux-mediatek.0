Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2950EC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 18:21:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E605360BD3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 18:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E605360BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/uRtahY6/h5EvjqiHM11kdmLryfYUPrQ7Cu4c+Hy41Y=; b=4T/UQLx1wNoNx8
	n3z+9z67whaXU8/JOMfBDNPscHuw7yWX5sifaMZkt8km6M0l2lkYi4FOaKtBYodbuHsvZipSZG0Py
	MsS6E4LKylf/P/lJPpkisCbXfEhALq1hDMv85lIBouuFiyPkqDUfcix/lC9vTq+8+y8gHBSt113e7
	O0JTUQsxsylxCyr5qi/7xo2XkDQdQLlsa/IOQoUBAgD19dEHJTQMbXMf0KC36XcmSN56XLx3Xdw1U
	QPhNqqUR+zLUvQWgJI1v9SyAtvFAjIrpCbZd0sALz+C+aZPWVN6mbbVHVJ2E44EGCcbVAmkI9Jh94
	Z0zTeq1Yges1efUryUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAz2Q-003tXi-6O; Tue, 03 Aug 2021 18:21:14 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAz2C-003tUb-Kd; Tue, 03 Aug 2021 18:21:02 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 s22-20020a17090a1c16b0290177caeba067so5164283pjs.0; 
 Tue, 03 Aug 2021 11:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7wjJjxr5NY0mlwpeyO/0mlW4pSwnhPT8csogJcd6W20=;
 b=oTWlF+ytCtIPrUcUvp8jE0sc3VSofJeRtWtO50ijRo8f4zlLr1u+0xzEwZr5wKCb3S
 kafEZY+V7A1q1MGb7sfDAAg9/QhwYKV2pK0upfGL3mTUpGB/TEo+ymwfJd9bsRt18yoY
 57JKveqpiuCBW7pDdTBcPeGR3cioqGdDn7F/I9DvN283Sm6U8H5ar9nLcYP3JNeopFVx
 /Amsh+qQ6e5PC2cDVkSDGuak4hOLwgmk2n0d9L/gzCKK7l2MTSNLFcXskIvxqTCHY/bJ
 r2VLi3663hCYx2AtShEcDY3J0kbhIiiuNiiLUJj6Z/POYZNte3GmzrOWeDdWywb6rhRG
 4kwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7wjJjxr5NY0mlwpeyO/0mlW4pSwnhPT8csogJcd6W20=;
 b=GxypZlXabnFR4ueVcp5p1Ujh3lfrSrlK+Nsn3GpwolVh6YWC7hJ+Z+Psahw/rGEOrm
 HOEb/RALc6P0G/UvAkwfkm3wmAppM9m7eTkmam83YF6rWE6Ae4DV9zkiFe9JBWl18aCd
 e/tbcRP+UMfTG4jmUGJtqTQkpJrF5AXH7mcZ6YXiXc6GrSnU9u2XQ5hMZN+UyeOfnecU
 4w+6DbEg97mywi+OlqO2e1TILjW6jSxRGM0xW6XIzOIzXyhalEwaRi74w2vL86vDP4KK
 6s9pAWJhuaczvBs3RY6AZ4Fg0iSsL/pdotir8sDoaHH/QP7jhG8Yusgppq46AREPqhx9
 yZ2Q==
X-Gm-Message-State: AOAM530wfwwLBDdXTRt97uGHkqYfZneSS/lq7vhICPMRB2fZ/7p2Oalt
 VUOV6dAEcmcxqXZ7ZSWRkHxapVVTfUTViCK6V70=
X-Google-Smtp-Source: ABdhPJzZT0+vtNBMGVaB8Nb80jJILp9VjVeN4ZHUp/Ifl25xewd/m4FajCdsFVO6zIQQgTLr+fZlDuaC9zZgdT9ply8=
X-Received: by 2002:a17:90a:b10b:: with SMTP id
 z11mr5690793pjq.181.1628014858846; 
 Tue, 03 Aug 2021 11:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210803102428.6476-1-Mason.Zhang@mediatek.com>
In-Reply-To: <20210803102428.6476-1-Mason.Zhang@mediatek.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Aug 2021 21:20:19 +0300
Message-ID: <CAHp75VcPhBB+21wVErWRq+mSDaCkpQBovn+xvMbXyfENnuu40Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] spi: mediatek: modify set_cs_timing callback
To: Mason Zhang <Mason.Zhang@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, linux-spi <linux-spi@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_112100_747925_29F1B653 
X-CRM114-Status: GOOD (  16.32  )
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

On Tue, Aug 3, 2021 at 1:42 PM Mason Zhang <Mason.Zhang@mediatek.com> wrote:
>
> This patch modified set_cs_timing callback:
>   1 support spi_device set cs_timing in their driver;
>   2 support set absolute time but no clk count, because;
>     clk src will change in different platform;
>   3 call this function in prepare_message but not in other API.

Perhaps it should be 3 patches?

...

> +static int mtk_spi_set_hw_cs_timing(struct spi_device *spi)
> +{
> +       struct mtk_spi *mdata = spi_master_get_devdata(spi->master);
> +       struct spi_delay *cs_setup = &spi->cs_setup;
> +       struct spi_delay *cs_hold = &spi->cs_hold;
> +       struct spi_delay *cs_inactive = &spi->cs_inactive;
> +       u16 setup, hold, inactive;
> +       u32 reg_val;
> +       int delay;
> +
> +       delay = spi_delay_to_ns(cs_setup, NULL);
> +       if (delay < 0)
> +               return delay;
> +       setup = (delay / 1000) * DIV_ROUND_UP(mdata->spi_clk_hz, 1000000);

1000 is NSEC_PER_USEC (here and below)?

> +       delay = spi_delay_to_ns(cs_hold, NULL);
> +       if (delay < 0)
> +               return delay;
> +       hold = (delay / 1000) * DIV_ROUND_UP(mdata->spi_clk_hz, 1000000);
> +
> +       delay = spi_delay_to_ns(cs_inactive, NULL);
> +       if (delay < 0)
> +               return delay;
> +       inactive = (delay / 1000) * DIV_ROUND_UP(mdata->spi_clk_hz, 1000000);

> +       setup    = setup ? setup : 1;
> +       hold     = hold ? hold : 1;
> +       inactive = inactive ? inactive : 1;

All of these can be simplified by using ?: (short ternary) form.

> +       reg_val = readl(mdata->base + SPI_CFG0_REG);
> +       if (mdata->dev_comp->enhance_timing) {
> +               reg_val &= ~(0xffff << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
> +               reg_val |= (((hold - 1) & 0xffff)
> +                          << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
> +               reg_val &= ~(0xffff << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
> +               reg_val |= (((setup - 1) & 0xffff)
> +                          << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
> +       } else {
> +               reg_val &= ~(0xff << SPI_CFG0_CS_HOLD_OFFSET);
> +               reg_val |= (((hold - 1) & 0xff) << SPI_CFG0_CS_HOLD_OFFSET);
> +               reg_val &= ~(0xff << SPI_CFG0_CS_SETUP_OFFSET);
> +               reg_val |= (((setup - 1) & 0xff)
> +                           << SPI_CFG0_CS_SETUP_OFFSET);
> +       }
> +       writel(reg_val, mdata->base + SPI_CFG0_REG);
> +
> +       reg_val = readl(mdata->base + SPI_CFG1_REG);
> +       reg_val &= ~SPI_CFG1_CS_IDLE_MASK;
> +       reg_val |= (((inactive - 1) & 0xff) << SPI_CFG1_CS_IDLE_OFFSET);
> +       writel(reg_val, mdata->base + SPI_CFG1_REG);
> +
> +       return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
