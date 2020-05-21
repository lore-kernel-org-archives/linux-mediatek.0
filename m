Return-Path: <SRS0=x8tw=7D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F901C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 01:37:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4129A2075F
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 01:37:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WdUJ7efw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="qUG0/EH6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4129A2075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aai+65zn4P17ByqsfnsWSULw4qg2cOEJh6MzkrrGqI0=; b=WdUJ7efw4/PHlG
	J+X4c+G9d+ojaV5v3Stdbb56cCEnSEVW9jxjTeYwODQE2FbKAA1WiK8G9JYIjeEZfP0VITS7ayUvH
	/RiXH+3CqsH3a/oATBFhAP8rhXTj5kMCOZyMSq/NIjivBkyMNoqD8/cVF7EMe+2qO3Yk0tOk5nPYR
	xdIqOLzb1L7Gxxcbj1ZIGeJVe0h8F11KyZ3rkGZI2YADGVAEFREUdt+h/yAAXgOEolUuVw7E8g3ej
	wHI17rJURDEWznb4zyqhAzLRmoQDRuNiw8YkMBKDGR9S3MT/+lBPZVT8Fj+Kl6LHzvsVjNQ8tvZd1
	zZriRntXfwxWMVx3n7bA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jba90-0006tK-Bj; Thu, 21 May 2020 01:37:10 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jba8p-0006kd-Rf
 for linux-mediatek@lists.infradead.org; Thu, 21 May 2020 01:37:01 +0000
Received: by mail-qv1-xf43.google.com with SMTP id f89so2384501qva.3
 for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2020 18:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oUriGfgjkQX3LYY7wtj+RwTpaaRdDlt+3hTHB1vDTro=;
 b=qUG0/EH6XgLuxNXbQdJGezJbSQnq0Y0S/9ctlrDqDZzBmDJvsxq7FBzhGpk11Ot+cT
 UsLryIJ+nLWIYzsIV6Gu/Gb2PxgGUbjh0zqQVnPG4bzFl45QemjVJQaDawNLUKoLvCC9
 QJ8VqGPOjpv3ayUyQtnOU0LD/9bRdnFGsbRl64BkFPt8mD+QhsPumB/jzYiHyLkVE4B0
 902XwQS+EUOGGd8kT064L7blhtHZHmZ24U4MraCQJQSV6gr+SfKf9DRh/zaCfYbaRUPl
 uuGzpzGRkVx78pLUo5Smp49BsBnHwC+RAjbVqMp24UtmQT38yD4UGvKQGeuitvt76b7K
 MitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oUriGfgjkQX3LYY7wtj+RwTpaaRdDlt+3hTHB1vDTro=;
 b=HKjYL+nnNcdLfZ5CaAifQW5Wzs8tc3n7Y2Y4ZP5L0dBy1v2fMj5KnIeBtivVjCRRWI
 hOoquSBJY4kPI9fpc2Koj8LdH+yHIjAFNGUm1A8Y092QRkmopUVwPUNQVDz+03QfWIhC
 o6wIsnqxAt/BeGzlCcSxXaeVq+ECDgrZEA4AUubj73/iGiDGmXR7d2yNFxtWwJaMeheH
 QbGVbKgEtu/YKy2VVnk1j0S7CSPZSJ6LdZg/0bVnvQB4P82t4na74mVYOgbz6a+i9uNL
 2Kct559TNQZcMrVH0ZNBxylZrB2RLmrQ5t6AaRBTW4wH5Jjs8O4UrpOiK+MaFVPrNcfp
 m1rw==
X-Gm-Message-State: AOAM533682p/4tD9EICPr9V3lCGujNyLxXDJG11bSsbVyfEb9TYEux8m
 79/E+C6mZMeMVt+wLXZ3yRtjZ5rGjf09Y/znQ81Qug==
X-Google-Smtp-Source: ABdhPJy4C/+klK8xF4IEwT19w/09g+zR+6lWSkQvG6oshEgv9u7seIlkLrXJWcxPACRQ5P+F/R97+CzyHpQhoOhPB0E=
X-Received: by 2002:a0c:ed21:: with SMTP id u1mr7831281qvq.206.1590025015219; 
 Wed, 20 May 2020 18:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200506084039.249977-1-eizan@chromium.org>
 <20200506184018.v2.2.I87cf35a058328c780bd3b8b2191209a5011b7016@changeid>
 <CAFqH_50_Py7Diu5bwmjLBPGiy3F5J5qNGmtrbH7i7aTUaHif9A@mail.gmail.com>
In-Reply-To: <CAFqH_50_Py7Diu5bwmjLBPGiy3F5J5qNGmtrbH7i7aTUaHif9A@mail.gmail.com>
From: Eizan Miyamoto <eizan@google.com>
Date: Thu, 21 May 2020 11:36:43 +1000
Message-ID: <CAOak1e-U8kxocZWUV=e9zWHzdfLg0=cnvjtX-Wq0G9Cw=Bcq0g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] [media] mtk-mdp: use pm_runtime in MDP component
 driver
To: Enric Balletbo Serra <eballetbo@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_183659_892836_340041F8 
X-CRM114-Status: GOOD (  31.02  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>, Houlong Wei <houlong.wei@mediatek.com>,
 Eizan Miyamoto <eizan@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 7, 2020 at 3:07 AM Enric Balletbo Serra <eballetbo@gmail.com> wrote:
>
> Hi Eizan,
>
> Thank you for the patch.
>
> Missatge de Eizan Miyamoto <eizan@chromium.org> del dia dc., 6 de maig
> 2020 a les 10:42:
> >
> > Without this change, the MDP components are not fully integrated into
> > the runtime power management subsystem, and the MDP driver does not
> > work.
> >
> > For each of the component device drivers to be able to call
> > pm_runtime_get/put_sync() a pointer to the component's device struct
> > had to be added to struct mtk_mdp_comp, set by mtk_mdp_comp_init().
> >
> > Note that the dev argument to mtk_mdp_comp_clock_on/off() has been
> > removed. Those functions used to be called from the "master" mdp driver
> > in mtk_mdp_core.c, but the component's device pointer no longer
> > corresponds to the mdp master device pointer, which is not the right
> > device to pass to pm_runtime_put/get_sync() which we had to add to get
> > the driver to work properly.
> >
> > Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> > ---
> >
> > Changes in v2:
>
> Ah, I guess this change log corresponds to the first patch.
>
> > - remove empty mtk_mdp_comp_init
> > - update documentation for enum mtk_mdp_comp_type
> > - remove comma after last element of mtk_mdp_comp_driver_dt_match
> >
> >  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 22 ++++++++++++++-----
> >  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  6 +++--
> >  drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  6 ++---
> >  3 files changed, 23 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> > index 5b4d482df778..228c58f92c8c 100644
> > --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> > +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/of_platform.h>
> >  #include <soc/mediatek/smi.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> >
> >  #include "mtk_mdp_comp.h"
> >  #include "mtk_mdp_core.h"
> > @@ -53,7 +54,7 @@ static const struct of_device_id mtk_mdp_comp_driver_dt_match[] = {
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_mdp_comp_driver_dt_match);
> >
> > -void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
> > +void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
> >  {
> >         int i, err;
> >
> > @@ -62,25 +63,31 @@ void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
> >                 if (err) {
> >                         enum mtk_mdp_comp_type comp_type =
> >                                 (enum mtk_mdp_comp_type)
> > -                               of_device_get_match_data(dev);
> > -                       dev_err(dev,
> > +                               of_device_get_match_data(comp->dev);
> > +                       dev_err(comp->dev,
> >                                 "failed to get larb, err %d. type:%d\n",
> >                                 err, comp_type);
> >                 }
> >         }
> >
> > +       err = pm_runtime_get_sync(comp->dev);
> > +       if (err < 0)
> > +               dev_err(comp->dev,
> > +                       "failed to runtime get, err %d.\n",
> > +                       err);
>
> Should you really ignore this error? If that's the case I'd just call
> pm_runtime_get_sync() without adding the logic to just print an error
> message.

This is mostly consistent with style elsewhere, e.g., in mtk_mdp_m2m.c
mtk_mdp_m2m_start_streaming and mtk_mdp_m2m_stop_streaming.

>
> > +
> >         for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
> >                 if (IS_ERR(comp->clk[i]))
> >                         continue;
> >                 err = clk_prepare_enable(comp->clk[i]);
> >                 if (err)
> > -                       dev_err(dev,
> > +                       dev_err(comp->dev,
> >                                 "failed to enable clock, err %d. i:%d\n",
> >                                 err, i);
>
> Although ignoring errors seems to be a common pattern in this file and
> I know you did not introduce this.

Maybe the issue is that since no action is taken, logging at the 'error' log
level is not the right thing? IOW, should it be changed to an informational
message instead? Nevertheless, I think we should defer these changes to a
follow-up patch instead.

>
> >         }
> >  }
> >
> > -void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
> > +void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
> >  {
> >         int i;
> >
> > @@ -92,6 +99,8 @@ void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
> >
> >         if (comp->larb_dev)
> >                 mtk_smi_larb_put(comp->larb_dev);
> > +
> > +       pm_runtime_put_sync(comp->dev);
> >  }
> >
> >  static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
> > @@ -101,6 +110,7 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
> >         struct mtk_mdp_dev *mdp = data;
> >
> >         mtk_mdp_register_component(mdp, comp);
> > +       pm_runtime_enable(dev);
> >
> >         return 0;
> >  }
> > @@ -111,6 +121,7 @@ static void mtk_mdp_comp_unbind(struct device *dev, struct device *master,
> >         struct mtk_mdp_dev *mdp = data;
> >         struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
> >
> > +       pm_runtime_disable(dev);
> >         mtk_mdp_unregister_component(mdp, comp);
> >  }
> >
> > @@ -129,6 +140,7 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
> >                  (enum mtk_mdp_comp_type)of_device_get_match_data(dev);
> >
> >         INIT_LIST_HEAD(&comp->node);
> > +       comp->dev = dev;
> >
> >         for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
> >                 comp->clk[i] = of_clk_get(node, i);
> > diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> > index b5a18fe567aa..de158d3712f6 100644
> > --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> > +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> > @@ -12,17 +12,19 @@
> >   * @node:      list node to track sibing MDP components
> >   * @clk:       clocks required for component
> >   * @larb_dev:  SMI device required for component
> > + * @dev:       component's device
> >   */
> >  struct mtk_mdp_comp {
> >         struct list_head        node;
> >         struct clk              *clk[2];
> >         struct device           *larb_dev;
> > +       struct device           *dev;
> >  };
> >
> >  int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev);
> >
> > -void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp);
> > -void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp);
> > +void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp);
> > +void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp);
> >
> >  extern struct platform_driver mtk_mdp_component_driver;
> >
> > diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> > index 539a7942e3cb..133d107aa4e6 100644
> > --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> > +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> > @@ -52,20 +52,18 @@ MODULE_DEVICE_TABLE(of, mtk_mdp_of_ids);
> >
> >  static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
> >  {
> > -       struct device *dev = &mdp->pdev->dev;
> >         struct mtk_mdp_comp *comp_node;
> >
> >         list_for_each_entry(comp_node, &mdp->comp_list, node)
> > -               mtk_mdp_comp_clock_on(dev, comp_node);
> > +               mtk_mdp_comp_clock_on(comp_node);
> >  }
> >
> >  static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
> >  {
> > -       struct device *dev = &mdp->pdev->dev;
> >         struct mtk_mdp_comp *comp_node;
> >
> >         list_for_each_entry(comp_node, &mdp->comp_list, node)
> > -               mtk_mdp_comp_clock_off(dev, comp_node);
> > +               mtk_mdp_comp_clock_off(comp_node);
> >  }
> >
> >  static void mtk_mdp_wdt_worker(struct work_struct *work)
> > --
> > 2.26.2.526.g744177e7f7-goog
> >
> >
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
