Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F22C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 10:28:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE40261AA3
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 10:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE40261AA3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8RUA57gIHa6mvx8xJML6GWB2FkfUjHqQ91+f/ZlkQg=; b=3iAeiJ/OKrh5si
	uL2nFwkWawWmNBl2eeB+0pAVHppytCF7fD04sBNDBht3E6tBOGkkhLJ//fYhNhUBTKg4Tv/b0T77a
	ZInc9Gd2anZpxSQEnUhW2x8gpanzdDdgKT21aJilXHjREZgJdmwtHL2z+X9q7oB/KwLAhaFEqoh1e
	fWyJuahAsmafSMmnNZUH7S7OvdNBaiZV+bHB9LtG7ja7kgpavI9noUQlS/bvXhRWg/qAemvQPCbDj
	M/3aWowtwlT1fETf52+Hlo9Ms66fAAeuINbewtCDLZlhN20bKE4vWnkwErBGO7eP0QzQqBbUVkSnr
	Tl0ppajafwTHFbRZ1+dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFZqY-00Ghh0-92; Mon, 16 Aug 2021 10:27:58 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFZqI-00Ghf2-MF
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 10:27:46 +0000
Received: by mail-ua1-x92d.google.com with SMTP id y14so7324925uai.7
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Aug 2021 03:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pRH4TVFPj1g2bLXry7U6Q5PGawo78fbiYn7oa4P7TUE=;
 b=wUONjgu57oYf3OfxDDScC3ZokM5dNXLU+0GsEWRZ3QVzsyATXYqT58BpdtitRkQkIH
 9j4dHB+IpVqScnNr9gIh/8BBpPPN1oyuqGiBT28prUs0TV2sjtlrXSEKM44kpi29mtgm
 hsFDminvf3C0rKryy/W0IFmoq+mJr3YJ2W9yriAbTRxX9XMEUC0KHf/vO6t4PmpcBVwV
 eHlohxqA6fWnbXgZMYVKahwwM+7oOdp60WFDNSxi1+1S4L3v05kNYa3zKRhdV51s5eyf
 6A1sXyDRMjedq0EvnMhnzh20FFACX3TsDX7epWJFWhh3U9Q8UvF+J3vSXdfACqnJmYBH
 0W0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pRH4TVFPj1g2bLXry7U6Q5PGawo78fbiYn7oa4P7TUE=;
 b=HZwUF7wJ3MzaXb3+M741+HnrijLi4s3yoU0xbJcKR7Yc/3snhQyj9BmHOG2P6PIpp6
 LU1PAtru/lTqalzcPwN847ELNxCeZq+0POUtjTdt26MmkFYX3eWR6PlCxDz29NOTeaF1
 Kpwzvr5sZQDmDR2AxMpTXURxIWg99roLF1CcJqDgrJLA+74DXM/E1zgUen1iOs4O547Y
 YylIyhsPyHPyZmLAWK84nOexOV6zsY0o4otNt2EDp5/jztU8jl2CliUcM0CssdQ+g0CS
 WC3xYHfXJ+7lvfsigdBvRoaZ8IzRPW3pLxeFYdhzduDDUKg8SHajhxcQvn6SyCfHVB0E
 CwMQ==
X-Gm-Message-State: AOAM53353VT9QG1LXZ96z/Ocwh7y4DaPFsC5wIR2zWAwGUNKwq5kgYWM
 rozvrsUE3lged/XKSElL0U01yPJuTLHQdUU86qPwFw==
X-Google-Smtp-Source: ABdhPJx12b+Bqmk2bxuZlUu8XnA8FFpwLQVJjtElcHZQSIpFTlWvmHagxQPgWDu9OhRbbdZgmffyA5kUa3yLHHrPYLQ=
X-Received: by 2002:a9f:25a7:: with SMTP id 36mr8092627uaf.129.1629109660385; 
 Mon, 16 Aug 2021 03:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210809072315.1127-1-derong.liu@mediatek.com>
In-Reply-To: <20210809072315.1127-1-derong.liu@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 16 Aug 2021 12:27:04 +0200
Message-ID: <CAPDyKFq3_eia7cvo-1Ajj5wcrfEHtp_EsMp27uL4dC_n+vPWZQ@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: mediatek: add wait dma stop done flow
To: Derong Liu <derong.liu@mediatek.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mmc <linux-mmc@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 wsp_upstream@mediatek.com, Peng Zhou <peng.zhou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_032742_771657_FE5BECC7 
X-CRM114-Status: GOOD (  17.02  )
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

On Mon, 9 Aug 2021 at 09:25, Derong Liu <derong.liu@mediatek.com> wrote:
>
> We found this issue on a 5G platform, during CMDQ error handling, if DMA status is active when it call msdc_reset_hw, it means mmc host hw reset and DMA transfer will be parallel, mmc host may access sram region unexpectedly.
>
> According to the programming guide of mtk mmc host,it needs to wait for dma stop done after set dma stop.
> This change should be applied to all SoCs.
>
> Signed-off-by: Derong Liu <derong.liu@mediatek.com>
> ---
>  drivers/mmc/host/mtk-sd.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 4dfc246c5f95..1dfd2842471b 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2339,6 +2339,8 @@ static void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
>         if (recovery) {
>                 sdr_set_field(host->base + MSDC_DMA_CTRL,
>                               MSDC_DMA_CTRL_STOP, 1);
> +               while (readl(host->base + MSDC_DMA_CFG) & MSDC_DMA_CFG_STS)
> +                       cpu_relax();

I suggest you look into using readl_poll_timeout() - as we don't want
to hang indefinitely, no matter what.

>                 msdc_reset_hw(host);
>         }
>  }
> --
> 2.18.0

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
