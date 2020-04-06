Return-Path: <SRS0=dAcd=5W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E21DC2BA19
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 13:59:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58322206C3
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 13:59:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aLVIavro";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q9doaK/j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58322206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kNfp/p5eqw6ZYkLcYT6EeGDXfd1VKN/S5Vm0e3Qun8Q=; b=aLVIavroeRVwSv
	WzEErgwDyCHPS38hfzemdncEP8zajng7Vp40GogmRkZlHtIdvEFnPgJwjqhrD+EpmFMKqxcv0JudP
	iEeFoU7B+NMUGBBgfkJZQOmwT60OC2OWAUjXmFxdHdqv28gkkO+jNumihhr8wbwkNU5LFTpIGCU8I
	d6ylKm5ubYHSIr/FOc84LtTghrSA6g8nMQzysbbaRmPo1NEv/vWJ1smxwi8lb+vq0no0G+Ye4ByFN
	RIVmzkwrEGggKjcFizK/ewFNUQporXa2gUzp0ogL4rhAu+QyErx1JxKiSHWtmxWDIL68EfEI7AYjY
	/1CxAZM2Tj1VVoZWlkJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLSHj-0002Lg-OD; Mon, 06 Apr 2020 13:59:31 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLSHh-0002KJ-Dj; Mon, 06 Apr 2020 13:59:30 +0000
Received: by mail-io1-xd41.google.com with SMTP id o3so15905408ioh.2;
 Mon, 06 Apr 2020 06:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WiuMw9xp+mz0F42UsrL6QJlGqNwQFdd9t3J1yc1c128=;
 b=q9doaK/jB6bzjdiPXdM99b+qxzxFd86JnUE4lPM2p2JB/Swp2TkaXGPUs9/8Sy0l5c
 Hm/R89+F+ZJjqwLKA0hlVs5+9vJkWinSKTrElIhHFNwWgudRJgtu3CAGAC2lAij+MAqY
 KEjOV7kThMttPa9yFWO6204IuptO208FPDtYuS8bAiX1Zera0q9dyX9LQfjFtbWX8269
 cKtZ60zpE+EMBatUc//2ApK/bqTWJg54i21O7Rsm+DXndSYVzAEJWSQ7nFhvyGkGXLav
 Y8J72h1H+8zS3zQBfHmBCcNKT8aZv1ztlOle5VIZd17SY6jNMz/UBsRS6aAmJgq4QRog
 S81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WiuMw9xp+mz0F42UsrL6QJlGqNwQFdd9t3J1yc1c128=;
 b=tGy0uVyqvVJfBQhDO/7iarIMdq7jli5UaEoh6kRtPKZA16vOeD1pJDWX3nFbN3e5QK
 phiIptJsLg1kL7AAp2yg+3PTrjq3bvCgDr7afPw98I4nZIFVwlsyQDl4n3mwBj6L10Ck
 iSEWY4Ltozc8IOW7xnlMV7G7PGGjWj1Prb/qDCUer0KsBTOmcbKUpbnHqTS+j8WuGZYw
 5It5sLwvZbyRLItoRRo5S/ncnEHwwYx2zcbDmHRxITpb4qBvWs2MFORqHvRmv8q1irmL
 I/FC7UhPAU6/5ZyM09GG+UH1TDkol2s9GVSiY0wWqDwxThGvj6eb3kKBxSJkmHnikvjB
 rB1g==
X-Gm-Message-State: AGi0PuaFlzIetwKIby378ef420/3rWil6HzvINbcx+QZgIxJmQ3uGLCI
 SfykJouOmlGeVt9fMogcYpsik282qACuahjiib4=
X-Google-Smtp-Source: APiQypKtgDkzu/faGibQ6B724sQtNeNo6BF+zpyGWrRWohntvwo9hrBSntu3RhE1re6zf7ZfhNSGrnVqR5/HJVoHlDs=
X-Received: by 2002:a05:6638:120c:: with SMTP id
 n12mr21231145jas.32.1586181568036; 
 Mon, 06 Apr 2020 06:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <1586165281-11888-1-git-send-email-chun-hung.wu@mediatek.com>
 <1586165281-11888-3-git-send-email-chun-hung.wu@mediatek.com>
In-Reply-To: <1586165281-11888-3-git-send-email-chun-hung.wu@mediatek.com>
From: Alan Cooper <alcooperx@gmail.com>
Date: Mon, 6 Apr 2020 09:59:16 -0400
Message-ID: <CAOGqxeUjx+OWRhwWznk-uHZ9op7WTZaAGq6xd4Z4QdL+Hja2yA@mail.gmail.com>
Subject: Re: [PATCH 2/5] [2/5] mmc: host: Remove redundant host CQE bindings
To: Chun-Hung Wu <chun-hung.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_065929_466196_0A4BFEA4 
X-CRM114-Status: GOOD (  19.55  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, wsd_upstream@mediatek.com,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>,
 BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>, kernel-team@android.com,
 Pan Bian <bianpan2016@163.com>, DTML <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, mirq-linux@rere.qmqm.pl,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stanley Chu <stanley.chu@mediatek.com>,
 Allison Randal <allison@lohutok.net>,
 "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 ": Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Apr 6, 2020 at 5:28 AM Chun-Hung Wu <chun-hung.wu@mediatek.com> wrote:
>
> CQE bindings "supports-cqe" and "disable-cqe-dcmd" is parsed
> in mmc_of_parse(). Remove vendor code which parses CQE bindings,
> and use mmc_host->caps2 to decide support CQE or not.
>
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> ---
>  drivers/mmc/host/sdhci-brcmstb.c   | 11 ++++++-----
>  drivers/mmc/host/sdhci-msm.c       |  3 +--
>  drivers/mmc/host/sdhci-of-arasan.c |  3 ---
>  drivers/mmc/host/sdhci-tegra.c     |  2 +-
>  4 files changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
> index ad01f64..07c90c6 100644
> --- a/drivers/mmc/host/sdhci-brcmstb.c
> +++ b/drivers/mmc/host/sdhci-brcmstb.c
> @@ -247,10 +247,6 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
>                 return res;
>
>         memset(&brcmstb_pdata, 0, sizeof(brcmstb_pdata));
> -       if (device_property_read_bool(&pdev->dev, "supports-cqe")) {
> -               has_cqe = true;
> -               match_priv->ops->irq = sdhci_brcmstb_cqhci_irq;

The above line that sets the irq was moved to later in the function,
but needs to come before sdhci_pltfm_init()

Al

> -       }
>         brcmstb_pdata.ops = match_priv->ops;
>         host = sdhci_pltfm_init(pdev, &brcmstb_pdata,
>                                 sizeof(struct sdhci_brcmstb_priv));
> @@ -261,7 +257,6 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
>
>         pltfm_host = sdhci_priv(host);
>         priv = sdhci_pltfm_priv(pltfm_host);
> -       priv->has_cqe = has_cqe;
>
>         /* Map in the non-standard CFG registers */
>         iomem = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> @@ -276,6 +271,12 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
>         if (res)
>                 goto err;
>
> +       if (host->mmc->caps2 & MMC_CAP2_CQE) {
> +               has_cqe = true;
> +               match_priv->ops->irq = sdhci_brcmstb_cqhci_irq;
> +       }
> +       priv->has_cqe = has_cqe;
> +
>         /*
>          * If the chip has enhanced strobe and it's enabled, add
>          * callback
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index c3a160c..fbb2f57 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1880,7 +1880,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>         u8 core_major;
>         const struct sdhci_msm_offset *msm_offset;
>         const struct sdhci_msm_variant_info *var_info;
> -       struct device_node *node = pdev->dev.of_node;
>
>         host = sdhci_pltfm_init(pdev, &sdhci_msm_pdata, sizeof(*msm_host));
>         if (IS_ERR(host))
> @@ -2076,7 +2075,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>         pm_runtime_use_autosuspend(&pdev->dev);
>
>         host->mmc_host_ops.execute_tuning = sdhci_msm_execute_tuning;
> -       if (of_property_read_bool(node, "supports-cqe"))
> +       if (host->mmc->caps2 & MMC_CAP2_CQE)
>                 ret = sdhci_msm_cqe_add_host(host, pdev);
>         else
>                 ret = sdhci_add_host(host);
> diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
> index e49b44b..359eff6 100644
> --- a/drivers/mmc/host/sdhci-of-arasan.c
> +++ b/drivers/mmc/host/sdhci-of-arasan.c
> @@ -1281,9 +1281,6 @@ static int sdhci_arasan_probe(struct platform_device *pdev)
>                                         sdhci_arasan_voltage_switch;
>                 sdhci_arasan->has_cqe = true;
>                 host->mmc->caps2 |= MMC_CAP2_CQE;
> -
> -               if (!of_property_read_bool(np, "disable-cqe-dcmd"))
> -                       host->mmc->caps2 |= MMC_CAP2_CQE_DCMD;
>         }
>
>         ret = sdhci_arasan_add_host(sdhci_arasan);
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index 403ac44..d09abdd 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -715,7 +715,7 @@ static void tegra_sdhci_parse_dt(struct sdhci_host *host)
>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>         struct sdhci_tegra *tegra_host = sdhci_pltfm_priv(pltfm_host);
>
> -       if (device_property_read_bool(host->mmc->parent, "supports-cqe"))
> +       if (host->mmc->caps2 & MMC_CAP2_CQE)
>                 tegra_host->enable_hwcq = true;
>         else
>                 tegra_host->enable_hwcq = false;
> --
> 1.9.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
