Return-Path: <SRS0=wYRt=DE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B01C4346E
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2020 18:30:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 991C721775
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2020 18:30:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OpL8uWXL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TsX1Hi+B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 991C721775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cpntHPoZUSufu40oBemz5Yp47JT4Z6ADJgKc0Uj8s7A=; b=OpL8uWXLwddDT6J89fGQ76/0F
	36+aFykBMPi+2wIdzV2W0X1830vndFc280gqyvExXHb7CwXeB0kJ75DBSrS0uGMnRnjNme5lbyRjb
	yiwFECujJ+I5bME2At/hP3IGJgFn6m2AL9JhWgHcx8/vNn7Rnn2kpMccaBGhlcdf6eqC2YanhyLu5
	K3P24pLwzGcWBrccYTem0uBSyXWgPTmF9LUyyXYlldz5rVe8qETrrbDOsBuJU9Oqz3UYmPgJfLikm
	L/6BuPWGSH9GUIP0BjKOG1gfL5ICmTrKwUgkCwvUnVG9KFJ9eFjN+87cfKAUViSqcf/tEcio7XYvT
	A1zu7aLjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMbQw-0003BF-GV; Sun, 27 Sep 2020 18:30:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMbQr-0003AI-Tq; Sun, 27 Sep 2020 18:29:59 +0000
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ABB0D21775;
 Sun, 27 Sep 2020 18:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601231396;
 bh=o48bCQ4LqnPM5NZOhjvfrMyLLYDLJHOdXNzF4bg4daE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TsX1Hi+BoejwOjfm6vB78EmSBSznYSnIX6+fONLn0XcJEGm7PMKvT+LBnw7ZMSbiT
 +glc7VNjN9S7i35txK9zyD8mRQb3r0nh5KJwQgf8LQO1vzQQLGuZbuYE0aCpwXi7xi
 4zS3ImXiEgYBqnLVckYr0RZ4g/6QqoFh+1HsaZFY=
Received: by mail-io1-f50.google.com with SMTP id r25so8850273ioj.0;
 Sun, 27 Sep 2020 11:29:56 -0700 (PDT)
X-Gm-Message-State: AOAM5327pFV/M5X85luEEUmWknHMqO6ZBA9Katf2bSEh5qXRYBOE5jF1
 ykk/bayHkGRTX/THKsixC79fg2cuqeGkcBEosIQ=
X-Google-Smtp-Source: ABdhPJzO12pxlidI5kGU9QGUWbGi/ZljqhWOXRJgX4k9iI120oPZRWbZcGpjjYlWpvzsRjZnhzTlKTS6DH8cMcm6sbY=
X-Received: by 2002:a6b:b7cf:: with SMTP id h198mr4909784iof.55.1601231396068; 
 Sun, 27 Sep 2020 11:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200917064151.2184010-1-wangxiaojun11@huawei.com>
In-Reply-To: <20200917064151.2184010-1-wangxiaojun11@huawei.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Sun, 27 Sep 2020 11:29:44 -0700
X-Gmail-Original-Message-ID: <CAGp9LzotAgyN0L9fKgodAuQ6ax5FLE=uiNj568=iHE4guJj5yw@mail.gmail.com>
Message-ID: <CAGp9LzotAgyN0L9fKgodAuQ6ax5FLE=uiNj568=iHE4guJj5yw@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: mediatek: use
 devm_platform_ioremap_resource_byname()
To: Wang Xiaojun <wangxiaojun11@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_142958_202159_BCE93BD6 
X-CRM114-Status: GOOD (  22.78  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 16, 2020 at 11:39 PM Wang Xiaojun <wangxiaojun11@huawei.com> wrote:
>
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately.
>
> Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>

Acked-by: Sean Wang <sean.wang@kernel.org>

> ---
>  drivers/pinctrl/mediatek/pinctrl-moore.c         | 11 ++---------
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c |  9 +--------
>  drivers/pinctrl/mediatek/pinctrl-paris.c         | 11 ++---------
>  3 files changed, 5 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
> index aa1068d2867f..5e00f93ac998 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-moore.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
> @@ -589,7 +589,6 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
>                             const struct mtk_pin_soc *soc)
>  {
>         struct pinctrl_pin_desc *pins;
> -       struct resource *res;
>         struct mtk_pinctrl *hw;
>         int err, i;
>
> @@ -612,14 +611,8 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
>                 return -ENOMEM;
>
>         for (i = 0; i < hw->soc->nbase_names; i++) {
> -               res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -                                                  hw->soc->base_names[i]);
> -               if (!res) {
> -                       dev_err(&pdev->dev, "missing IO resource\n");
> -                       return -ENXIO;
> -               }
> -
> -               hw->base[i] = devm_ioremap_resource(&pdev->dev, res);
> +               hw->base[i] = devm_platform_ioremap_resource_byname(pdev,
> +                                               hw->soc->base_names[i]);
>                 if (IS_ERR(hw->base[i]))
>                         return PTR_ERR(hw->base[i]);
>         }
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 2f3dfb56c3fa..e8622c7e117a 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -354,7 +354,6 @@ static const struct mtk_eint_xt mtk_eint_xt = {
>  int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
>  {
>         struct device_node *np = pdev->dev.of_node;
> -       struct resource *res;
>
>         if (!IS_ENABLED(CONFIG_EINT_MTK))
>                 return 0;
> @@ -366,13 +365,7 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
>         if (!hw->eint)
>                 return -ENOMEM;
>
> -       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "eint");
> -       if (!res) {
> -               dev_err(&pdev->dev, "Unable to get eint resource\n");
> -               return -ENODEV;
> -       }
> -
> -       hw->eint->base = devm_ioremap_resource(&pdev->dev, res);
> +       hw->eint->base = devm_platform_ioremap_resource_byname(pdev, "eint");
>         if (IS_ERR(hw->eint->base))
>                 return PTR_ERR(hw->eint->base);
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index a23c18251965..623af4410b07 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -940,7 +940,6 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
>  {
>         struct pinctrl_pin_desc *pins;
>         struct mtk_pinctrl *hw;
> -       struct resource *res;
>         int err, i;
>
>         hw = devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
> @@ -963,14 +962,8 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
>                 return -ENOMEM;
>
>         for (i = 0; i < hw->soc->nbase_names; i++) {
> -               res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -                                                  hw->soc->base_names[i]);
> -               if (!res) {
> -                       dev_err(&pdev->dev, "missing IO resource\n");
> -                       return -ENXIO;
> -               }
> -
> -               hw->base[i] = devm_ioremap_resource(&pdev->dev, res);
> +               hw->base[i] = devm_platform_ioremap_resource_byname(pdev,
> +                                       hw->soc->base_names[i]);
>                 if (IS_ERR(hw->base[i]))
>                         return PTR_ERR(hw->base[i]);
>         }
> --
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
