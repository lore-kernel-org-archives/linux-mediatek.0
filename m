Return-Path: <SRS0=PXBb=2F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DFBC2D0C8
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 12:00:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA67620866
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 12:00:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pT7oi4fx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSen5Gcv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA67620866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9xzO+ingk2fZc20UbhqXDJUUEWJotLdkcXeK9VCkJ4=; b=pT7oi4fxY7nWzT
	AmkWbnXL5EkThQErV+R/PvyyOpG7YA43emiYjs64n5M8VrT5PE6SMVftuhXmxOc222SxzD0aXmfkD
	pF5/iTZDjnKnwUdYQ3ytOU4o8E3zVe18hNAu/LYsXezbqseA8+Mo8UYrDfFLKxAvgJTqUMdnsy1Nb
	NlWPXHWwRlgg7IMHb4AEp16f1wCXIt7d/InyxUeqxhqYqZU7UnqgidOVPIV4hu5SbzHTiTIXIZIkP
	cpSWYkxCfxtAWNG4cZqg9YHjHyDyK3inkswyg3BYJcdNWd6f8G9R7xBuhr0NcFcc/r0EAfBgGmJUh
	7mRcwcvPE4ucmGms2ucw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igSZN-0002sD-Fj; Sun, 15 Dec 2019 12:00:17 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igSZK-0002rg-DB; Sun, 15 Dec 2019 12:00:15 +0000
Received: by mail-io1-xd41.google.com with SMTP id z193so540182iof.1;
 Sun, 15 Dec 2019 04:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U32Ya4ZtyKRe0g31iyaOrg9bNIbVTfXKPEbGivDkS10=;
 b=OSen5Gcvcdj9lEzBZB15Tn6QiRTI9MWlO/rPN49bMq0K83mAgq18VHkzQ7zVlPrjML
 gszdUGt2eF1kyYhDFF+GP7FeP1RPEnPsfH7wY9I095RPAYClYjywGRCaSteDEqN+zK62
 IKehzG864B+NpPZLPI1yH3m0V9J02rnTKvgIZxkccK3VNzHuy++Doo+IV2cQKWeFpyGv
 sOw1S4YJdTl9C8RnFpAVjILHeJMichKHxPUSI98wDRt0UmqQkWCWFLtA7q2g+jukhVzx
 EloylsApJVNnAMvbYem3m+vszDWIyz4reg4yOYbOHfUjbut1/oBMn1uR67AGYca3deCP
 DSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U32Ya4ZtyKRe0g31iyaOrg9bNIbVTfXKPEbGivDkS10=;
 b=Ox9khvQK28UlWRysi1owebpg6ISPT+U3GDWX7ukkmZcLxxsE4usOyJP1GFm0i5X6yW
 zTH4kZvU/rkK5sEXjDmYxZ21k64uD/+Gg3CjLvJ9guqrqvDc/7J1aq0PzNidiBWe18sJ
 7kSFK9d6tGVSiGO3J3Rpqdurm6TeMfaoU7QoeI2Kwp4qDc63MqmshSTke3NSzE7olekf
 qH0emWXgpkea84AY9C43yzlYOUxC4jaNQQEFFSPSNY3cV/xGwCcqyf5c2/fw0rkLyDcA
 0He9kUW0gAXiHQpE+YjNBETq88X0PHqqF9bFMynizvF9JEzSy/lBqi8Y5b7RkHV2zlmE
 7U3Q==
X-Gm-Message-State: APjAAAUkSBYVRbYlE56IpKsgHaFadhGbo0/WknU46e29g8A16us6o76J
 KOnxobrnG+PEOeYzkzzitiDGVGhFtAcfzmamWkE=
X-Google-Smtp-Source: APXvYqytWwvnLfUD+171nhXHDbJqlTikV21tQNc2dQdQlOI6X6lJ/eLQFLTNTro7mQyhFx4wzdvzbYn6q+tytdyDIA8=
X-Received: by 2002:a5d:9f05:: with SMTP id q5mr14678305iot.295.1576411213379; 
 Sun, 15 Dec 2019 04:00:13 -0800 (PST)
MIME-Version: 1.0
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
 <20191214175447.25482-10-tiny.windzz@gmail.com>
 <20191215104824.658889d3@why>
In-Reply-To: <20191215104824.658889d3@why>
From: Frank Lee <tiny.windzz@gmail.com>
Date: Sun, 15 Dec 2019 20:00:01 +0800
Message-ID: <CAEExFWtgXt2pGM1fGfmxNdk_7S_53gnhN0-bProWA4-vOaNN3w@mail.gmail.com>
Subject: Re: [PATCH 10/10] soc: qcom: convert to devm_platform_ioremap_resource
To: Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_040014_475285_C43D3923 
X-CRM114-Status: GOOD (  14.64  )
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
Cc: john@phrozen.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-samsung-soc@vger.kernel.org, khilman@baylibre.com, krzk@kernel.org,
 Chen-Yu Tsai <wens@csie.org>, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, khalasa@piap.pl, ssantosh@kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 bjorn.andersson@linaro.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 shawnguo@kernel.org, linux-mips@vger.kernel.org, leoyang.li@nxp.com,
 kgene@kernel.org, linux-mediatek@lists.infradead.org, jun.nie@linaro.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Dec 15, 2019 at 6:48 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sat, 14 Dec 2019 17:54:47 +0000
> Yangtao Li <tiny.windzz@gmail.com> wrote:
>
> > Use devm_platform_ioremap_resource() to simplify code.
> >
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > ---
> >  drivers/soc/qcom/llcc-qcom.c    | 7 +------
> >  drivers/soc/qcom/qcom-geni-se.c | 4 +---
> >  drivers/soc/qcom/qcom_aoss.c    | 4 +---
> >  drivers/soc/qcom/qcom_gsbi.c    | 5 +----
> >  drivers/soc/qcom/spm.c          | 4 +---
> >  5 files changed, 5 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> > index 429b5a60a1ba..99e19df76889 100644
> > --- a/drivers/soc/qcom/llcc-qcom.c
> > +++ b/drivers/soc/qcom/llcc-qcom.c
> > @@ -387,7 +387,6 @@ static int qcom_llcc_remove(struct platform_device *pdev)
> >  static struct regmap *qcom_llcc_init_mmio(struct platform_device *pdev,
> >               const char *name)
> >  {
> > -     struct resource *res;
> >       void __iomem *base;
> >       struct regmap_config llcc_regmap_config = {
> >               .reg_bits = 32,
> > @@ -396,11 +395,7 @@ static struct regmap *qcom_llcc_init_mmio(struct platform_device *pdev,
> >               .fast_io = true,
> >       };
> >
> > -     res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> > -     if (!res)
> > -             return ERR_PTR(-ENODEV);
> > -
> > -     base = devm_ioremap_resource(&pdev->dev, res);
> > +     base = devm_platform_ioremap_resource(pdev, 0);
>
> What guarantees do you have that entry 0 matches name?

Yeah, this place is wrong. I intruduce another helper.

https://lore.kernel.org/patchwork/patch/1165186/

Thx,
Yangtao


>
> I find these changes pointless: they don't add much to the readability
> or maintainability of the code, and instead introduce creative bugs.
>
>         M.
> --
> Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
