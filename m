Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8E6C3F6B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 18:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAbaE2BPi2JfE0JMSsYw58hC/bDcDdFIaU6lrhJq/5I=; b=3i8MHIiTIsF19ahCxHNvu6XjzU
	U3WeLcBCUbmyUHskdIoZ6eoMWSH0Ir9oDm73Y0zMUW1GjiZXrxn/DS1SuFQXXsHd6UeyGwpmJbznu
	NpZf+hxW+WhssuXbAuWq7kWi2qsi2J1ofmAouqTGIl2n05nXsgyyQULtKqGr9TaW4NMtaZOpHdxmn
	nSRdXwiOQy4UXhIZ5Ls1kbP33mLHak2ofLM6tSEc8p88GGUpaB1Q7YqB4n6WTDXORBM9M+a+zeq8p
	h+BESzIPYqKnVcnTF1F1V0wpY3J+KDSL43xtJb9a8ygXqq1Or9tohSn7iuZJA/RzVDd0Px9sIgAr3
	Nvv2u/og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNf2G-003Mcb-EH; Mon, 15 Aug 2022 18:42:07 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNepS-003CnA-CG
	for linux-mediatek@lists.infradead.org; Mon, 15 Aug 2022 18:28:48 +0000
Received: by mail-oi1-x22b.google.com with SMTP id p132so9414906oif.9
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Aug 2022 11:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=PAbaE2BPi2JfE0JMSsYw58hC/bDcDdFIaU6lrhJq/5I=;
        b=V0SfwLj2Yb74etrx6rZia7hwxnv4XkfBI0cZtG1ukS6nLDzSjJMyA1TvyG1buUgVla
         Jejov9nTjZs+kZUP5vQin6bWDO+v86jb6AaxTKWn9Jw1m2KXFY28/noXzobNQVfR3ms+
         1ZoWxmc7QQCiJbTs1VWn7hbPJYEqvN4rMMIAbkjM/xRtsltDcLhuBpD30bljR3kgQb6/
         7LmETzDf4cPdg8jUN2h4bpZL+/MtVjP4Qs2K3sM9gL8QCklk69cQN5/izcXp88d0LkOR
         9udl1jzq251uFJMR7lB/TUdfxUs9yKIglh/0wXZzqwbvy67Fuu76Q1Y4qEuqP8jFXwaf
         e4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=PAbaE2BPi2JfE0JMSsYw58hC/bDcDdFIaU6lrhJq/5I=;
        b=d90NbDePiSCagNM98x0tQUswDWY7UAKeGGmzjjahggoGk+GyUtHBt6iDgAe1LzM0+B
         18Kxj0QIH7xK/CwmTDYNQW+KJgsmu6IJ3tYCg6WDbQd6dZw1PkpPJY1I70QyHo3Dvm62
         6AshYX8YR/fwFLAE4Tbx2yqpNPw7P4Ccd7gZIeiCnXuiJ691DUuefCYMD4Z5bB1YqSTY
         3GpAtGJkCWpy10ccsHeHEodGJbEOMbnCq01DdLLc1yppq3kKiXuk2iSIelZCRYuyOWrl
         vpzVN0TpPbI2nbJ6mjhUVYhmSJHfwWg0wubYuCHcIEaTSoFXJnTH8y1rhvYkr2/GYml3
         seQw==
X-Gm-Message-State: ACgBeo3aANHY2sppohK3fcTw+IiMBdFUvnvpPXCRGPodHFp//ds/fjRF
	pi+CFqxcIpSMR0Nswm5yQcIR+Hvm2+r7QD1VA4yDAg==
X-Google-Smtp-Source: AA6agR4APC8y0ObSdmVA8gIwBkVKlXdAxjrtt2Pcnsr06+bzyb2N1m7fW/tLBegFGxvYUCkF3SP49wRmVOtKuUNB12U=
X-Received: by 2002:aca:5e89:0:b0:344:80ab:1351 with SMTP id
 s131-20020aca5e89000000b0034480ab1351mr4590109oib.105.1660588124265; Mon, 15
 Aug 2022 11:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220728080048.21336-1-wenbin.mei@mediatek.com>
In-Reply-To: <20220728080048.21336-1-wenbin.mei@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 15 Aug 2022 20:28:04 +0200
Message-ID: <CAPDyKFqg7gDXMKyDXa_oczfkjqEAcsyL-9YJWHE9wA2sY0BGfg@mail.gmail.com>
Subject: Re: [PATCH] mmc: mtk-sd: Clear interrupts when cqe off/disable
To: Wenbin Mei <wenbin.mei@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_112846_539013_F5A9C6FD 
X-CRM114-Status: GOOD (  19.39  )
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

On Thu, 28 Jul 2022 at 10:01, Wenbin Mei <wenbin.mei@mediatek.com> wrote:
>
> Currently we don't clear MSDC interrupts when cqe off/disable, which led
> to the data complete interrupt will be reserved for the next command.
> If the next command with data transfer after cqe off/disable, we process
> the CMD ready interrupt and trigger DMA start for data, but the data
> complete interrupt is already exists, then SW assume that the data transfer
> is complete, SW will trigger DMA stop, but the data may not be transmitted
> yet or is transmitting, so we may encounter the following error:
> mtk-msdc 11230000.mmc: CMD bus busy detected.
>
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>

Applied for fixes and by adding the below tags, thanks!

Fixes: 88bd652b3c74 ("mmc: mediatek: command queue support")
Cc: stable@vger.kernel.org

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 4ff73d1883de..69d78604d1fc 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2446,6 +2446,9 @@ static void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
>         /* disable busy check */
>         sdr_clr_bits(host->base + MSDC_PATCH_BIT1, MSDC_PB1_BUSY_CHECK_SEL);
>
> +       val = readl(host->base + MSDC_INT);
> +       writel(val, host->base + MSDC_INT);
> +
>         if (recovery) {
>                 sdr_set_field(host->base + MSDC_DMA_CTRL,
>                               MSDC_DMA_CTRL_STOP, 1);
> @@ -2932,11 +2935,14 @@ static int __maybe_unused msdc_suspend(struct device *dev)
>         struct mmc_host *mmc = dev_get_drvdata(dev);
>         struct msdc_host *host = mmc_priv(mmc);
>         int ret;
> +       u32 val;
>
>         if (mmc->caps2 & MMC_CAP2_CQE) {
>                 ret = cqhci_suspend(mmc);
>                 if (ret)
>                         return ret;
> +               val = readl(host->base + MSDC_INT);
> +               writel(val, host->base + MSDC_INT);
>         }
>
>         /*
> --
> 2.25.1
>

