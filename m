Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611BEC55ABD
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 05:38:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9B7E22280
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 05:38:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PL1SSIoD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XVbu23OB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9B7E22280
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rmCa9PCqBqoxT+CvogH2C979lZpskOwzSQOgHVwM1Po=; b=PL1SSIoDm49eDbjorYAOPDBNY
	Tazwlwvlheqyjr4jzJK903mDpX4pGdDHrAZ8n17PvDIyScNhpFQ7sjU4M630J/bq3nNaPAv9vm94p
	Jnxq7De8EYuyaJt3hI1EOjHB7DMidVb9nCFUOuewD4hByxj1+Nw2/D7zl583SwKM5H3QzIcbQFMWt
	re7yUHHRl1whweLiXJmX2zZzPnVEmE5STXwoFC73wzLe3VhD9CDM5dEOBa6JokTbu+pHYqbDtrFDd
	q6TbgKQFUm4FhTi2sRZHEYnXqpHcuTagqfXm8NaThD7dSi8Y//SDsZ78jxX25tfAdhLg/ittVl7yy
	P6ZHcEJAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keXDO-0006bJ-A4; Mon, 16 Nov 2020 05:38:10 +0000
Received: from mail-vk1-xa41.google.com ([2607:f8b0:4864:20::a41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keXDL-0006aP-36
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 05:38:08 +0000
Received: by mail-vk1-xa41.google.com with SMTP id i62so3473736vkb.7
 for <linux-mediatek@lists.infradead.org>; Sun, 15 Nov 2020 21:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rZGxpsS9SWcX2KVxrN7YD413ZCNuX4yPXBbFR5ByFWw=;
 b=XVbu23OBn5PNkV1teq06K1Z44OxiHb82e0Wg6E7S1Vj2Bmkuc/doDnSQNi1KFToli1
 0S5l69GmsCebr/v5fEobsPaL8b9ooim7t2AmB4/MvF3PR98Si8xTXUG3KIamfwSgVWCo
 duxLnz8nwqwLiRu0X0bBXKlaJZBbXg/rvfNt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rZGxpsS9SWcX2KVxrN7YD413ZCNuX4yPXBbFR5ByFWw=;
 b=OZQ4w5BjfnCA2h6kEYt91T0qYaulj8nT9gFxGI8UUKFjHnkAPutIgvrF9aztMTIqLv
 NIaqJjswHPdCAUG0E7zkMJu+cUq9RnoPQGiBVpzfD89cITpgBa1/kf2gG9nIA6HWWxl8
 dMc58nG9QAFl1cqzYDDRIVr8uFwl0BekvULDIy/Z8O/RjXAnug4dYGRNN+P7sqzj9K4V
 UkPEJ3yeav22XzQxHCLTcKwdQshgpMY9xaNf1yoQqWtti7GxRkQfws+irwjcKwPC32tt
 dmOF7CD9Tx9u23xOWURJKiY+hGD/7V3lEloPPLJ+rEKfpvCgeiFr+NYHobClobxZQttX
 pjWA==
X-Gm-Message-State: AOAM530XN4h2c9qTwTXnJRUJSCQHD47HPWXSCk2uHcyNtolzIl7m8rzv
 +hmSpqzudECPpDmY9FBQeLBN5BMWya6gFZ0DFopnGw==
X-Google-Smtp-Source: ABdhPJy7BF/5YwDz0qkfa3oXRNGg+wQM9E1TreiLVWmV5WWnfedcMHX6XloaIeeGKkT6X3h0jCnY6BzPsLqAU6kvXGo=
X-Received: by 2002:a1f:1c6:: with SMTP id 189mr6606866vkb.13.1605505083697;
 Sun, 15 Nov 2020 21:38:03 -0800 (PST)
MIME-Version: 1.0
References: <20201116044121.2457272-1-tzungbi@google.com>
In-Reply-To: <20201116044121.2457272-1-tzungbi@google.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 16 Nov 2020 13:37:52 +0800
Message-ID: <CANMq1KDXnLqBu5CBnWCeFEZbqxFRVmoSi=hu_qOtQDnZW6SPbg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc/mediatek: fix sparse errors
To: Tzung-Bi Shih <tzungbi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_003807_176270_AF64288F 
X-CRM114-Status: GOOD (  21.88  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Nicolas Boichat <drinkcat@google.com>,
 kernel test robot <lkp@intel.com>, groeck@google.com, pihsun@google.com,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Nov 16, 2020 at 12:41 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> Fixes the following sparse errors:
>
> warning: incorrect type in argument 2 (different address spaces)
>    expected void volatile [noderef] __iomem *addr
>    got void *addr
> warning: incorrect type in argument 1 (different address spaces)
>    expected void *addr
>    got void [noderef] __iomem *
> warning: incorrect type in assignment (different address spaces)
>    expected void [noderef] __iomem *cpu_addr
>    got void *
> warning: incorrect type in argument 3 (different address spaces)
>    expected void *cpu_addr
>    got void [noderef] __iomem *cpu_addr

Can you also tell us which lines actually fail? Would be easier to
follow (I ended up digging out the test robot email to understand)

>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 577cbd5d421e..99d5a4de3e2f 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -298,7 +298,7 @@ static int mt8183_scp_before_load(struct mtk_scp *scp)
>         return 0;
>  }
>
> -static void mt8192_power_on_sram(void *addr)
> +static void mt8192_power_on_sram(void __iomem *addr)
>  {
>         int i;
>
> @@ -307,7 +307,7 @@ static void mt8192_power_on_sram(void *addr)
>         writel(0, addr);
>  }
>
> -static void mt8192_power_off_sram(void *addr)
> +static void mt8192_power_off_sram(void __iomem *addr)
>  {
>         int i;
>

These 2 make sense.

> @@ -556,8 +556,9 @@ static int scp_map_memory_region(struct mtk_scp *scp)
>
>         /* Reserved SCP code size */
>         scp->dram_size = MAX_CODE_SIZE;
> -       scp->cpu_addr = dma_alloc_coherent(scp->dev, scp->dram_size,
> -                                          &scp->dma_addr, GFP_KERNEL);
> +       scp->cpu_addr = (void __iomem *)dma_alloc_coherent(
> +                                       scp->dev, scp->dram_size,
> +                                       &scp->dma_addr, GFP_KERNEL);
>         if (!scp->cpu_addr)
>                 return -ENOMEM;
>

This one looks wrong to me. dma_alloc_coherent memory is not normally
tagged as __iomem. Why is scp->cpu_addr __iomem in the first place?

> @@ -569,8 +570,8 @@ static void scp_unmap_memory_region(struct mtk_scp *scp)
>         if (scp->dram_size == 0)
>                 return;
>
> -       dma_free_coherent(scp->dev, scp->dram_size, scp->cpu_addr,
> -                         scp->dma_addr);
> +       dma_free_coherent(scp->dev, scp->dram_size,
> +                         (void __force *)scp->cpu_addr, scp->dma_addr);
>         of_reserved_mem_device_release(scp->dev);
>  }
>
> --
> 2.29.2.299.gdc1121823c-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
