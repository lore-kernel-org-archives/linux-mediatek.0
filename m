Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FCAC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 12:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TdOd7FZzTaTIHiXbw3Ym17Qi9Zrbn54oICVrlDUn6kk=; b=iav3YPLmg8tFRZ
	ehNeNsC2gbDFLLLIANg0YHK7RDZLHIQDCL9ZsU3VpN4/KT6VJR5+ngjVI1attGlUHEW1e5u0Y9oqY
	SeGIpyWPD4Ja2PFTbrnoeaauY6/AYDODTfD7B1004yZI67PRiIZD37icLWZSKGRK2sFhEGxj3wipL
	xhph+2o0L83HuGEVpLLnCXSxUEOkgsrlIoyf6OfEfaLN2bcOqyyNBZO+O1oGDvNMl2koQBkYRUR0d
	x9Ge5PVxIq+0WK5h6ElQtHnC/L+hkMCnAuaEEAOZchb6J+L2XAMqlPabUZnxCDR5X8xvVOgFptTs6
	tMh/mhea5OujvbNznN/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naGcC-005eqA-3K; Fri, 01 Apr 2022 12:42:56 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naGc8-005ep3-Ps
 for linux-mediatek@lists.infradead.org; Fri, 01 Apr 2022 12:42:54 +0000
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2e6ceb45174so31337237b3.8
 for <linux-mediatek@lists.infradead.org>; Fri, 01 Apr 2022 05:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wr+mFET+ztEiJpTYfAk9pLOZKM9Kx7FBprGkyZzhxS0=;
 b=KM0TJGBdcQQngOeNHboefqLI4uHbz6uV9J+uQy1zcNZfFR34k8gkutoi8XLXUTohHv
 1Z95jzkeHay1dm7TbPcx+gDcNbUlvz3f7lsRIQhkrRWFVrz0weE6IwJHpVDsML0uICUS
 692Qc5DoJOXPJ+Az3s+6Mip3gUbMd133dyCly6PW1Nzd0MFb2tgGakrWDJiY3fwHYIdP
 3r6EZ/o03HGN5zmxJkM/JdZj454m4fGERvYjmoAJVDS5+LqTYuVzTXro68p8w6pqsknw
 iamHYkpAOStzhn2JfC6uyU3706j26dZcdaKmpHNlQuyvQuX3mJvqU4IRVZ8URKrg5kgd
 jo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wr+mFET+ztEiJpTYfAk9pLOZKM9Kx7FBprGkyZzhxS0=;
 b=TB/7rcl+5oRx/TF3jESM4OA6zBQgqtGO7WX00tlPyyYKhwb183dLsE55Zf5YDlZCtk
 lfvBHdDTk7JPEosLXNqgmvc0cvrn61aX3lWoc3BOucA2e5QsvYojcDJx8txRFoQRIbt1
 WvRkKAv9PB9kz1Ef3AIZINIu3Ib0WUZlkIV39Zmn8VQa141UvG1ZotsM5zm7pQOrTnQ8
 ksbXd+ND7pNzxV4cLDF/aK8QypqLG0WbqHH5UFuU1izs5CyuAHfrHckYO1OzEVJ8vOk/
 dVsvu0+qiT5I5bs83x2m51fdO941SqrVBsx6U6cQh4rZdTGb1hzFsMt2b1O0+SmGtYDN
 iZpA==
X-Gm-Message-State: AOAM532UCyU6iKsC4M0Q5Wu5PZL+ZgwRFFJWwTMUINkEHJuLX0S/g9Cf
 41WsLF0LcbiA2aDd/Mlv5gAQLbfzEQEEtfxJqQSfKQ==
X-Google-Smtp-Source: ABdhPJw5Lf2dY4cBbTNOwmsSY9juu3wQscQ3aPtqvEuQGh8Q8VFuF9YD6PF38LZ4ttaWRJj/1l6Srm4bsJfUdsq5Nv0=
X-Received: by 2002:a0d:d84f:0:b0:2e5:f8f1:7272 with SMTP id
 a76-20020a0dd84f000000b002e5f8f17272mr9960403ywe.376.1648816970864; Fri, 01
 Apr 2022 05:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220329032913.8750-1-axe.yang@mediatek.com>
 <20220329032913.8750-3-axe.yang@mediatek.com>
In-Reply-To: <20220329032913.8750-3-axe.yang@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 1 Apr 2022 14:42:14 +0200
Message-ID: <CAPDyKFqzNJxt8RhQ5ABLqqkVaJmRPDFu=QuSUvAr-eW9SK4fSw@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] mmc: core: Add support for SDIO wakeup interrupt
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
X-CRM114-CacheID: sfid-20220401_054252_945565_754D66CD 
X-CRM114-Status: GOOD (  19.71  )
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

On Tue, 29 Mar 2022 at 05:29, Axe Yang <axe.yang@mediatek.com> wrote:
>
> If wakeup-source flag is set in host dts node, parse EAI information
> from SDIO CCCR interrupt externsion segment for in-band wakeup. If
> async interrupt is supported by SDIO card then enable it and set
> enable_async_irq flag in sdio_cccr structure to 1. The parse flow is
> implemented in sdio_read_cccr().
>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> ---
>  drivers/mmc/core/sdio.c  | 17 +++++++++++++++++
>  include/linux/mmc/card.h |  8 +++++++-
>  include/linux/mmc/sdio.h |  5 +++++
>  3 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
> index 25799accf8a0..4898c5e9a299 100644
> --- a/drivers/mmc/core/sdio.c
> +++ b/drivers/mmc/core/sdio.c
> @@ -226,6 +226,23 @@ static int sdio_read_cccr(struct mmc_card *card, u32 ocr)
>                                 card->sw_caps.sd3_drv_type |= SD_DRIVER_TYPE_C;
>                         if (data & SDIO_DRIVE_SDTD)
>                                 card->sw_caps.sd3_drv_type |= SD_DRIVER_TYPE_D;
> +
> +                       if (card->host->pm_caps & MMC_PM_WAKE_SDIO_IRQ) {

After a second thought, I think we can just skip this check. The
MMC_PM_WAKE_SDIO_IRQ indicates that the host supports SDIO IRQs as
*system wakeups*.

But, in fact, I think we want this feature to be enabled to allow
waking up for runtime_suspend (RPM_SUSPENDED) too.

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
> +                               }
> +                       }
>                 }

[...]

Other than the above, this looks good to me!

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
