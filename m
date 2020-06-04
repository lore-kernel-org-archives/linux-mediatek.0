Return-Path: <SRS0=aF3H=7R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32564C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 02:29:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05D1B20657
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 02:29:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b4CnVkO+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gF+uWURR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05D1B20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJeMOzht6iidXkkZc8FNVvIUy/Oo4hNDJpKRnwRmJPw=; b=b4CnVkO+JbZj+B
	/rBer9uv5h5zh0euR2UlLoFn9CTi0pkWYQD4ftpUULozJWtPoST8i5KI8Ctxon6CmVB/Oj3+/8p55
	BDxAyScuDn3XgHFucXkJH9jBWf40D2Gs2ZhL2FYB+apgsvd1KfFMyigerTChT8eR1iTPg1HAs51gv
	x0Ahp6IKTqw8oNbfPe+kupa9gQCsFYxPueYdNVpNzSjnRGQSahMIzTQhA1hokUFEneBxyPlmjVH4m
	wjfyIhzkltOSMI37KKzBNRQSIi5ovbz7+GS37LCiJPQsXZjADdnoRimVOUJgJDkPMsXJ3Bwzy/2qf
	Z7K8mXUR57gwTsdFzyyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgfdS-0006Ie-AG; Thu, 04 Jun 2020 02:29:38 +0000
Received: from mail-vk1-xa44.google.com ([2607:f8b0:4864:20::a44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgfdP-0006I0-Sl
 for linux-mediatek@lists.infradead.org; Thu, 04 Jun 2020 02:29:37 +0000
Received: by mail-vk1-xa44.google.com with SMTP id w188so1000386vkf.0
 for <linux-mediatek@lists.infradead.org>; Wed, 03 Jun 2020 19:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GiZwMzoPS09yzBU7S2hJ7r+gRIFX95ple22IuWgCNw4=;
 b=gF+uWURRh8uwv2hzNLJPZDege+6/RxAKTa99l8IPtuMOxNN3gLY9hIZiknH3Fkeaar
 cvBMdieSIb+hccNBsqfqKdjKbGDy19j8gffbEb5p9RQpriNR8VSJwJB2NL9Ukxk0KgxX
 RUd+vKOB/CvPR0X5Es5srwyCY/HvUcznw45jU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GiZwMzoPS09yzBU7S2hJ7r+gRIFX95ple22IuWgCNw4=;
 b=bA1Olk9mOMNepXwANkyOM0eHmFoYKpTKRJJ3v9nyC9Ti9n/aRTuuBhEOdrmzATDjjX
 yBHb2iba91yrR1Q5bn6L1yfa8oofFzUJxg1t7NlBLqO0r03B9HydRUDprDkF/NT+l4vv
 CrqXZXWbhs6WhCtx0q67cOkW3sN3Bpt0xqgm9s13XMz+XFKX5EIkBuHhSH9Oz1ZY5RSZ
 PYlXD67HTwm9wIIeHQAa7uayFexQ505BXCoW13YV8d3mXj3u4YHLnipga1e6XHPCkeZw
 Mer+mM6WYPOgVkJllNpgZv8mQHyo96Xt9X+KQlw3HA3sQ1HnaYvaxWBiSMTtYC2vYmy0
 7j1w==
X-Gm-Message-State: AOAM533iZbhgElziAGd+hAFm0CR0OwjPVtp0r7SR3MIzOO4Tm2rGWLrr
 Ss6krbV2si/uu+CMnqFXuQgWr1ZbZxQvlDZv7q54wA==
X-Google-Smtp-Source: ABdhPJyOkMxi3kmXQuLdkLG0TI4YGq6+Fj1A2qCxPvej1w2D2dixQYceehb742uQ5rO3puyZGIjvnIKc79wo0ALTZ+8=
X-Received: by 2002:a1f:8d0a:: with SMTP id p10mr1986031vkd.33.1591237770303; 
 Wed, 03 Jun 2020 19:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <1590051985-29149-1-git-send-email-weiyi.lu@mediatek.com>
 <1590051985-29149-7-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1590051985-29149-7-git-send-email-weiyi.lu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 4 Jun 2020 10:29:19 +0800
Message-ID: <CANMq1KBRe81Sa4A6sCM2egOVRWCJbUNPsXHpfzkT33XGVZXBhg@mail.gmail.com>
Subject: Re: [PATCH v15 06/11] soc: mediatek: Add subsys clock control for bus
 protection
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_192935_949893_12ACF9EC 
X-CRM114-Status: GOOD (  17.57  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, Rob Herring <robh@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 lkml <linux-kernel@vger.kernel.org>, Fan Chen <fan.chen@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 21, 2020 at 5:06 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> For the bus protection operations, some subsys clocks need to be enabled
> before releasing the protection, and vice versa.
> But those subsys clocks could only be controlled once its corresponding
> power domain is turned on first.
> In this patch, we add the subsys clock control into its relevant steps.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-scpsys.c | 62 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 60 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index 59a525a..ef2c668 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> [snip]
>         val |= PWR_ISO_BIT;
> @@ -498,6 +511,39 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>         return ret;
>  }
>
> +static int init_subsys_clks(struct platform_device *pdev,
> +               const char *prefix, struct clk **clk)
> +{
> +       struct device_node *node = pdev->dev.of_node;
> +       u32 prefix_len, sub_clk_cnt = 0;
> +       struct property *prop;
> +       const char *clk_name;
> +
> +       prefix_len = strlen(prefix);
> +
> +       of_property_for_each_string(node, "clock-names", prop, clk_name) {
> +               if (!strncmp(clk_name, prefix, prefix_len) &&
> +                               (clk_name[prefix_len] == '-')) {
> +                       if (sub_clk_cnt >= MAX_SUBSYS_CLKS) {
> +                               dev_err(&pdev->dev,
> +                                       "subsys clk out of range %d\n",
> +                                       sub_clk_cnt);
> +                               return -EINVAL;
> +                       }
> +
> +                       clk[sub_clk_cnt] = devm_clk_get(&pdev->dev,
> +                                               clk_name);
> +
> +                       if (IS_ERR(clk[sub_clk_cnt]))
> +                               return PTR_ERR(clk[sub_clk_cnt]);
> +
> +                       sub_clk_cnt++;
> +               }
> +       }
> +
> +       return sub_clk_cnt;
> +}
> +
>  static int init_basic_clks(struct platform_device *pdev, struct clk **clk,
>                         const char * const *name)
>  {
> @@ -596,6 +642,18 @@ static struct scp *init_scp(struct platform_device *pdev,
>                 if (ret)
>                         return ERR_PTR(ret);
>
> +               if (data->subsys_clk_prefix) {
> +                       ret = init_subsys_clks(pdev,
> +                                       data->subsys_clk_prefix,
> +                                       scpd->subsys_clk);
> +                       if (ret < 0) {
> +                               dev_err(&pdev->dev,
> +                                       "%s: subsys clk unavailable\n",
> +                                       data->name);

init_subsys_clks should already have printed an error (directly or
indirectly), so this is not needed.

> +                               return ERR_PTR(ret);
> +                       }
> +               }
> +
>                 genpd->name = data->name;
>                 genpd->power_off = scpsys_power_off;
>                 genpd->power_on = scpsys_power_on;
> --
> 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
