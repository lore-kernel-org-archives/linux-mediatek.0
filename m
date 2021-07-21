Return-Path: <SRS0=lmF9=MN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9683C636C9
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 11:44:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5E206113C
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 11:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5E206113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dPkh4MJdOv6wCa0/u5b6iD03Uhyk3hS7p8EqjzjhTts=; b=u10GxY4afPxr2k
	rvMz4mJLClS0J8KrxHGHMAlXTiHPFt+sU5O6g97MaHi6wE48MtlMW3mp4l1/jH/2kGFsTtb4r9Wvy
	maL11V19U2j/h17fQquTRrvq20u9K992JzpQ0zND9AZng66nv83Xrd8EMz32GwfKN5H4PFrxRSN74
	BSB65edZLKQYVQokj8rqBaoHBgx6IqpxIqf8ouAzSOcX9zvPfvhrfjwoJ+fgxlI0ITUt3UgoIqdmz
	18sz9V/EwWX4+i3SzWwP0DWE2KrwqVcPs4ISTTfZhP16EsOunLI3x6sptjPWbLr26tM9pwxK7I3UY
	8iqTuOhOC5YYcOlI8etQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6AeR-00FUaB-G7; Wed, 21 Jul 2021 11:44:35 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Adz-00FUQQ-O0
 for linux-mediatek@lists.infradead.org; Wed, 21 Jul 2021 11:44:09 +0000
Received: by mail-pg1-x536.google.com with SMTP id a6so1624275pgw.3
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Jul 2021 04:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4eOE5oXt0Te/GnUqshzOeQhr7DeyqOGjYygIrkfQGGA=;
 b=KdQI6LuD8Wmsu8sCpYBmVNr4uqXouJd6KbQ3iYRLn2UXIAxs+TuEUbZye6F9L7aj1V
 ZAgxxPSOUOm+s48Q3N1vGWUj2UI5ovvKG0zNnKpAZ+Y4nQZHgOrkuO2NxaUrVYYpljXg
 lyBhu/YTGUcqASeyyy69yxEUAvWHEkFO5P9HA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4eOE5oXt0Te/GnUqshzOeQhr7DeyqOGjYygIrkfQGGA=;
 b=s9P9toOqx99PQwKPurhnQqZbRcNCKPrwwAEWHKFaSjo5EZ+lvGA0815qfi+nyIHkVF
 X5zuiBgynq6H6/Mf6Pv7GVsYTIiD2B8HcKBXoyCmod8OQmIZE3KnxBXWZCYVGiQ4YMgX
 Iyyk3s52YalHUGN3m/xF5efcABCwogKdIbbcYuVQq2GQGAY2oc2wM7FkwPKp4MzmZ2LE
 hIuLO1D4QKB1BmD0pREVeGRaVp6nuaG7upeKTrmyeH542By+8RbeCEViAq9gaWETz5f4
 rxh9EX6dLFJ7fr0PPzKcxmFgr2J80zSbu9PtpLZ28kXwj5ibTqP2v0/bRlujRij/S4ES
 XCMw==
X-Gm-Message-State: AOAM533/wURzDEPF2pV6DHNAGaVYMQuQKH0yJVe4MCPlUwBUArj9m9nk
 x82iYA6q+Wmjniz9IhdF5EUQvT890xWT/mPVl3Y15Q==
X-Google-Smtp-Source: ABdhPJwOBnuO9cyF8OBviJSYN7tjfT+V3IKi0eKLRcwtLf+HGoO48XKeVyIURCRqP1SfZkP8A4tRfzpBVnepdhLBrCI=
X-Received: by 2002:a05:6a00:2407:b029:341:185e:8674 with SMTP id
 z7-20020a056a002407b0290341185e8674mr20738643pfh.42.1626867846555; Wed, 21
 Jul 2021 04:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210715121209.31024-1-yong.wu@mediatek.com>
 <20210715121209.31024-8-yong.wu@mediatek.com>
In-Reply-To: <20210715121209.31024-8-yong.wu@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Wed, 21 Jul 2021 19:43:55 +0800
Message-ID: <CAATdQgBDsPHcuPYd=a+fjjTuqwXdJ-1GuSkj47cH1Ju5geqSLg@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] memory: mtk-smi: Add smi sub common support
To: Yong Wu <yong.wu@mediatek.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 open list <linux-kernel@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, iommu@lists.linux-foundation.org, 
 youlin.pei@mediatek.com, anan.sun@mediatek.com, ming-fan.chen@mediatek.com, 
 yi.kuo@mediatek.com, anthony.huang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_044407_835452_48A096D6 
X-CRM114-Status: GOOD (  36.38  )
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

On Thu, Jul 15, 2021 at 8:25 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> In mt8195, there are some larbs connect with the smi-sub-common, then
> connect with smi-common.

Not critical but I suggest to describe what is smi-sub-common.
e.g. "some larbs are not directly connected to smi-common,
they are connected to smi-sub-common which is a bridge(?) interface to..."

>
> Before we create device link between smi-larb with smi-common. If we have
> sub-common, we should use device link the smi-larb and smi-sub-common,
> then use device link between the smi-sub-common with smi-common. This is
> for enabling clock/power automatically.
>
> Move the device link code to a new interface for reusing.
>
> There is no SW extra setting for smi-sub-common.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

> ---
>  drivers/memory/mtk-smi.c | 75 +++++++++++++++++++++++++++-------------
>  1 file changed, 51 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index e68cbb51dd12..ee49bb50f5f5 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -60,7 +60,8 @@
>
>  enum mtk_smi_type {
>         MTK_SMI_GEN1,
> -       MTK_SMI_GEN2
> +       MTK_SMI_GEN2,           /* gen2 smi common */
> +       MTK_SMI_GEN2_SUB_COMM,  /* gen2 smi sub common */
>  };
>
>  #define MTK_SMI_CLK_NR_MAX                     4
> @@ -90,13 +91,14 @@ struct mtk_smi {
>                 void __iomem            *smi_ao_base; /* only for gen1 */
>                 void __iomem            *base;        /* only for gen2 */
>         };
> +       struct device                   *smi_common_dev; /* for sub common */
>         const struct mtk_smi_common_plat *plat;
>  };
>
>  struct mtk_smi_larb { /* larb: local arbiter */
>         struct mtk_smi                  smi;
>         void __iomem                    *base;
> -       struct device                   *smi_common_dev;
> +       struct device                   *smi_common_dev; /* common or sub-common dev */
>         const struct mtk_smi_larb_gen   *larb_gen;
>         int                             larbid;
>         u32                             *mmu;
> @@ -259,6 +261,38 @@ static const struct of_device_id mtk_smi_larb_of_ids[] = {
>         {}
>  };
>
> +static int mtk_smi_device_link_common(struct device *dev, struct device **com_dev)
> +{
> +       struct platform_device *smi_com_pdev;
> +       struct device_node *smi_com_node;
> +       struct device *smi_com_dev;
> +       struct device_link *link;
> +
> +       smi_com_node = of_parse_phandle(dev->of_node, "mediatek,smi", 0);
> +       if (!smi_com_node)
> +               return -EINVAL;
> +
> +       smi_com_pdev = of_find_device_by_node(smi_com_node);
> +       of_node_put(smi_com_node);
> +       if (smi_com_pdev) {
> +               /* smi common is the supplier, Make sure it is ready before */
> +               if (!platform_get_drvdata(smi_com_pdev))
> +                       return -EPROBE_DEFER;
> +               smi_com_dev = &smi_com_pdev->dev;
> +               link = device_link_add(dev, smi_com_dev,
> +                                      DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
> +               if (!link) {
> +                       dev_err(dev, "Unable to link smi-common dev\n");
> +                       return -ENODEV;
> +               }
> +               *com_dev = smi_com_dev;
> +       } else {
> +               dev_err(dev, "Failed to get the smi_common device\n");
> +               return -EINVAL;
> +       }
> +       return 0;
> +}
> +
>  static int mtk_smi_dts_clk_init(struct device *dev, struct mtk_smi *smi,
>                                 unsigned int clk_nr_optional,
>                                 const char * const clk_optional[])
> @@ -285,9 +319,6 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
>         struct mtk_smi_larb *larb;
>         struct resource *res;
>         struct device *dev = &pdev->dev;
> -       struct device_node *smi_node;
> -       struct platform_device *smi_pdev;
> -       struct device_link *link;
>         int ret;
>
>         larb = devm_kzalloc(dev, sizeof(*larb), GFP_KERNEL);
> @@ -307,26 +338,10 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
>                 return ret;
>
>         larb->smi.dev = dev;
> -       smi_node = of_parse_phandle(dev->of_node, "mediatek,smi", 0);
> -       if (!smi_node)
> -               return -EINVAL;
>
> -       smi_pdev = of_find_device_by_node(smi_node);
> -       of_node_put(smi_node);
> -       if (smi_pdev) {
> -               if (!platform_get_drvdata(smi_pdev))
> -                       return -EPROBE_DEFER;
> -               larb->smi_common_dev = &smi_pdev->dev;
> -               link = device_link_add(dev, larb->smi_common_dev,
> -                                      DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
> -               if (!link) {
> -                       dev_err(dev, "Unable to link smi-common dev\n");
> -                       return -ENODEV;
> -               }
> -       } else {
> -               dev_err(dev, "Failed to get the smi_common device\n");
> -               return -EINVAL;
> -       }
> +       ret = mtk_smi_device_link_common(dev, &larb->smi_common_dev);
> +       if (ret < 0)
> +               return ret;
>
>         pm_runtime_enable(dev);
>         platform_set_drvdata(pdev, larb);
> @@ -471,6 +486,14 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
>                 if (IS_ERR(common->base))
>                         return PTR_ERR(common->base);
>         }
> +
> +       /* link its smi-common if this is smi-sub-common */
> +       if (common->plat->type == MTK_SMI_GEN2_SUB_COMM) {
> +               ret = mtk_smi_device_link_common(dev, &common->smi_common_dev);
> +               if (ret < 0)
> +                       return ret;
> +       }
> +
>         pm_runtime_enable(dev);
>         platform_set_drvdata(pdev, common);
>         return 0;
> @@ -478,6 +501,10 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
>
>  static int mtk_smi_common_remove(struct platform_device *pdev)
>  {
> +       struct mtk_smi *common = dev_get_drvdata(&pdev->dev);
> +
> +       if (common->plat->type == MTK_SMI_GEN2_SUB_COMM)
> +               device_link_remove(&pdev->dev, common->smi_common_dev);
>         pm_runtime_disable(&pdev->dev);
>         return 0;
>  }
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
