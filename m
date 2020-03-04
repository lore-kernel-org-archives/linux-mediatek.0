Return-Path: <SRS0=cHEQ=4V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BCBC3F2D1
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 13:05:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A18D320870
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 13:05:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aBzimD/3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kz3ZoEts"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A18D320870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aLjhNrkbzBYPAv0oJ2V+yfTIT1yuIZ2HCu2zE+7rScI=; b=aBzimD/3srH37P
	4fPCE1CMew2Zvs2ixTWT9gdwjnUXfToWT5O5klW/5i5u2G680ySYWs6s1hOdqLaPtSd2AMgFY92gD
	qdU6HRcYtC68N+T6ZjhySMZtMLNbCwi1SSCuaJ85DtVAov/ohz5Ru0vPKRdsNn2EK/ih0iXn6w5J+
	chU/x4PLawjzWmJPtRHzDCAstHxLK0fGlGmEApbW435UjOV74pkjUEGJ3ymhUxbFT71O3lz2zBwLC
	cmIt3p2mm6FjDdO9cIxVY/Cu1+8GurYohS4jjujNPmDA0HQBTqNUfsOidz9OeJFgz+QyLZyL9iftq
	fRoCVBsB2LRJ5tie1hHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9TiQ-00072j-Fs; Wed, 04 Mar 2020 13:05:34 +0000
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9TiN-00071U-EN
 for linux-mediatek@lists.infradead.org; Wed, 04 Mar 2020 13:05:33 +0000
Received: by mail-vs1-xe41.google.com with SMTP id t12so1036584vso.13
 for <linux-mediatek@lists.infradead.org>; Wed, 04 Mar 2020 05:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y6V/ThFMEUQVv4pGKZWOlNFwrQHTHd/Cjm8+feJdCcI=;
 b=Kz3ZoEtsx/w9PtpTfMWI8BfIvHJpdI9eqfduNdgSwzkFoNOvf5mynamxJMQ38s1scq
 UG5FlR10x0pBG5V1AFPAdPmP0MOEpxBmXzWx7P7RmWNYCu4XmNn6TTtWxhX7VSYioDlK
 wEcFWuz1KtLJRddXeMmM++EC+8fDJOiJlgk+zDB8nWuDmYPwY4OX5/qowiZ948/V+kxU
 9IUoYDeOARIZkvwXc5m99BVtXs8ZzFhifpP2vb1byNKWfJ9JZBThXmMUnc6lTfQjIsKu
 167dPumst3rTtZBc9uDOXmDzBFJItYEmLl1hwTjdK/BEIWqYTDx9KTbELZK9I7NV8XN+
 RenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y6V/ThFMEUQVv4pGKZWOlNFwrQHTHd/Cjm8+feJdCcI=;
 b=jSWfqWgmL4sjVNKRSeSUCWjHX3tyve15r+erSC4t9MNJ3A1gew+Nk2rGCA9HrSeqO/
 OBykEbKAB4rctPDelPW22v3yhLZtjjaO5ni00+bbM9IGJJCq08iAkVbWY6nKSDe/tlQc
 nR3cIr7k1BJTsVA2yYTW/FqFGgWxLGd2GKBZVE1MuQ1SqwP05xxk2zUyMxVLZo3U4K8B
 eN72z7/gqYr8q3KvbNh3zbO/ijg2A1QvVcszMmBdGh1biTakppIaH6BF4rtJv/FsFsvX
 Nb5Fb9Bc+Fy/Od/IGd1vSVOiV9ArrmToGV8Bj7K168UTaou7JPpOX7sAhCL+o8eUT8oW
 OGDg==
X-Gm-Message-State: ANhLgQ30WKGsXT8eNvSXjVw5zmR0ljpDF8E27njutfGgQ96Pj/ffKcDR
 v1SPSScbX/RSfZIObEBZ0fLlHvnk+ghrq7oxdCVPFA==
X-Google-Smtp-Source: ADFU+vutcotJyTUK5tPrXTH7n8AgfiQgisISlV0zrVV7kZWnuc9rR3DZfocZpWM1AQk8GeUV02RcRhWp4SBgvRUJOTA=
X-Received: by 2002:a67:800e:: with SMTP id b14mr1606080vsd.191.1583327129997; 
 Wed, 04 Mar 2020 05:05:29 -0800 (PST)
MIME-Version: 1.0
References: <1581922564-24914-1-git-send-email-chun-hung.wu@mediatek.com>
 <1581922564-24914-2-git-send-email-chun-hung.wu@mediatek.com>
In-Reply-To: <1581922564-24914-2-git-send-email-chun-hung.wu@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Mar 2020 14:04:53 +0100
Message-ID: <CAPDyKFpyah+oA-GtXNmdkrhwnGN_syU1JqRHn-9gk=HK0fV8EQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] mmc: core: expose MMC_CAP2_CQE* to dt
To: Chun-Hung Wu <chun-hung.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_050531_536620_6EB74E11 
X-CRM114-Status: GOOD (  14.96  )
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
 Kate Stewart <kstewart@linuxfoundation.org>, wsd_upstream@mediatek.com,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Android Kernel Team <kernel-team@android.com>, Pan Bian <bianpan2016@163.com>,
 DTML <devicetree@vger.kernel.org>,
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 17 Feb 2020 at 07:56, Chun-Hung Wu <chun-hung.wu@mediatek.com> wrote:
>
> Expose MMC_CAP2_CQE and MMC_CAP2_CQE_DCMD
> to host->caps2 if
> 1. "supports-cqe" is defined in dt and
> 2. "disable-cqe-dcmd" is not defined in dt.

Both of these DT properties are defined as common mmc DT properties,
so the above isn't really correct. Please clarify this.

Moreover, I suggest to update commit message header into "mmc: core:
Extend mmc_of_parse() to parse CQE bindings", as I think it better
describes the change.

>
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
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
> +
> +       /* Must be after "supports-cqe" check */
> +       if (!device_property_read_bool(dev, "disable-cqe-dcmd")) {
> +               if (host->caps2 & MMC_CAP2_CQE)

Does it really doesn't matter if we set this cap, even if MMC_CAP2_CQE
isn't set? You can probably skip the check above.

> +                       host->caps2 |= MMC_CAP2_CQE_DCMD;
> +       }
>
>         /* Must be after "non-removable" check */
>         if (device_property_read_u32(dev, "fixed-emmc-driver-type", &drv_type) == 0) {
> --
> 1.9.1

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
