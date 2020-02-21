Return-Path: <SRS0=GSZf=4J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BED5C35646
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Feb 2020 14:34:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4586222C4
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Feb 2020 14:34:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UGTbQbYT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DUMUWH+o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4586222C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6ln/BEIArpiQFqcP3bitzzCKr4G57Zk3K4ujWtaEKU=; b=UGTbQbYTnRlyR+
	ptr5d3oBNE7VDeNHfS0bjTw81Y0qOrAidOhQMBk1N3L97wHnv9adsn7lFEQK7Jb+mtR6V/5V82swA
	FUEg2ntB/1v90pehJsy7w9A0z5B2KrNkMqfz2G7564Hd05dBrB4VJtIe1owbaIJpMzai3V27mJGvb
	saqKJR1LX1ucrTyJ3edrSWdBeqUL2tkDyorgXaA80PGcBIHxT7axm6JkH4VkHbb2xlaO6IFG784sg
	yhAh/9rEB0EoPnLkhhWcLWOquFForT83Mlg+i116Jx7VOhRzLF9GVtq7jgOywrD8GBh7UtWnpbo9K
	rFGCyPLXU8CRpBg0tNVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j59Np-000226-PA; Fri, 21 Feb 2020 14:34:25 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j59Nd-0001pI-ES
 for linux-mediatek@lists.infradead.org; Fri, 21 Feb 2020 14:34:14 +0000
Received: by mail-lj1-x243.google.com with SMTP id q8so2421316ljb.2
 for <linux-mediatek@lists.infradead.org>; Fri, 21 Feb 2020 06:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qE1ZprvNAQZEaedKCgeg3ifr2lhMX5FFSbIkCacp4Kw=;
 b=DUMUWH+o5xdEn4HR/SntOIZf6pWK2WCRJo9GDytRJlf/wRrfthg3iixysSl789z7QV
 cWt75Jm8nDTe+v9ctDDtSdF0l5ln3hu7YnDUgIww04Q1jOLT3LlEJY5Np7xnnDm12q22
 zMtcwL6aW4EdhmjVpuhoKoluw2mZk8ZlFiPs7NXZpmM1yCzC0wVB0BH1b3EG4rqRqa9C
 pYVGdEP1BZ1xifOB1yzVdKi9iSVyJh2LWc8OsI88wTr7ivb3LyFWFFC5WkJlQ9bnDKOI
 Tv60UO/1LRXTVVXr8nBzNDWO6d8+PQniSdcEiO/19AcFYSeICRQ7COilyc6YYMi1QnPa
 y2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qE1ZprvNAQZEaedKCgeg3ifr2lhMX5FFSbIkCacp4Kw=;
 b=cis0HunSo3Sm1TqMcQDNxeDidXNiuTNAE4grKdv6XmZpRDltBMsB//grPJNE5snKb6
 8L5NKL0FN+w0pNLU8WzXUtTM5bZIJey//dOXg4iEeaZog3yB+X/nZ4ycJXuRaSFEITjg
 bgTqFO4NLuac9gO2rZsdm50g1MLujydNTP2qT3E9nKfanFGPYSLyjVErz03K6Qqyaq7R
 dRQaC16abyO7hQ9CAKyeeL4CchHkLvt226L1PaH5T3Q4/Bw7hC6qbKAj/1sPazGP8h/n
 reqQ1RUElfrzk94Ilz/Pwki90Xw0JdgoYp4U5el3nf0QJzc8WRrd0zP8sjK0OorqSJYn
 hrKA==
X-Gm-Message-State: APjAAAWPnnL5aNwEK2/Aol3USTnIUrWECmCrIn6y1vROIyA1yxWNze8G
 Ce0hX5cy9n5DXdFTuCw15Lx8N6d8cuInnML2xqsPxw==
X-Google-Smtp-Source: APXvYqw4oSVVlShPCelo7IGnTIlbPgsMGxvB5xli1PlMp8bLrG3RvR3Haq1OJ5idjUHugDKxC+iAjv/NG+M/2+LLAR0=
X-Received: by 2002:a2e:81c3:: with SMTP id s3mr21749572ljg.168.1582295649418; 
 Fri, 21 Feb 2020 06:34:09 -0800 (PST)
MIME-Version: 1.0
References: <1581921111-24172-1-git-send-email-chun-hung.wu@mediatek.com>
 <1581921111-24172-2-git-send-email-chun-hung.wu@mediatek.com>
In-Reply-To: <1581921111-24172-2-git-send-email-chun-hung.wu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Feb 2020 15:33:58 +0100
Message-ID: <CACRpkdauCe-zAcsO5q_79+Ux_a2=bktA5UqKjWs4XdBJZ3wWeg@mail.gmail.com>
Subject: Re: [PATCH 1/4] [1/4] mmc: core: expose MMC_CAP2_CQE* to dt
To: Chun-Hung Wu <chun-hung.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_063413_481476_7E3D4B4D 
X-CRM114-Status: GOOD (  17.02  )
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
 linux-mmc <linux-mmc@vger.kernel.org>, Pan Bian <bianpan2016@163.com>,
 Pavel Machek <pavel@ucw.cz>, Chaotian Jing <chaotian.jing@mediatek.com>,
 kernel-team@android.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stanley Chu <stanley.chu@mediatek.com>,
 Allison Randal <allison@lohutok.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Feb 17, 2020 at 7:32 AM Chun-Hung Wu <chun-hung.wu@mediatek.com> wrote:

> Expose MMC_CAP2_CQE and MMC_CAP2_CQE_DCMD
> to host->caps2 if
> 1. "supports-cqe" is defined in dt and
> 2. "disable-cqe-dcmd" is not defined in dt.
>
> ---
>  drivers/mmc/core/host.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index 105b7a7..efb0dbe 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -319,6 +319,14 @@ int mmc_of_parse(struct mmc_host *host)
>                 host->caps2 |= MMC_CAP2_NO_SD;
>         if (device_property_read_bool(dev, "no-mmc"))
>                 host->caps2 |= MMC_CAP2_NO_MMC;
> +       if (device_property_read_bool(dev, "supports-cqe"))
> +               host->caps2 |= MMC_CAP2_CQE;

I don't understand why this is even a DT property as it should
be clear from the hosts compatible whether it supports CQE or
not. But it's too late to do anything about that I suppose, and
I just assume there is something I don't understand here.

> +       /* Must be after "supports-cqe" check */
> +       if (!device_property_read_bool(dev, "disable-cqe-dcmd")) {
> +               if (host->caps2 & MMC_CAP2_CQE)
> +                       host->caps2 |= MMC_CAP2_CQE_DCMD;
> +       }

This is the right place to do this I suppose. Disabling CQE
selectively is something you might wanna do for debugging.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I see that some drivers are already parsing this DT property
on their own, should we follow up with patches so that these:

$ git grep 'supports-cqe'
drivers/mmc/host/sdhci-brcmstb.c:       if
(device_property_read_bool(&pdev->dev, "supports-cqe")) {
drivers/mmc/host/sdhci-msm.c:   if (of_property_read_bool(node, "supports-cqe"))
drivers/mmc/host/sdhci-tegra.c: if
(device_property_read_bool(host->mmc->parent, "supports-cqe"))

Make use of the central parsing instead?

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
