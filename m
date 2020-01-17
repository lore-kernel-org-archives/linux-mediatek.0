Return-Path: <SRS0=2M+Y=3G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DF5C33CB1
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 08:35:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75E4A20728
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 08:35:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GhVkAGsw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+2atMjo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75E4A20728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=unpLqg/sm1TH/BQ9AUDOELp8Ejznbb3CjkjDLVtdLmE=; b=GhVkAGswGcWzoY
	n2NjYvz0khiLjUmRGm3X7jtyIQl++wbhlWC8a81bnFRQZMWAEKJsmmQvoZBkUgVuGpl5npfDHsxCi
	qccKj4cKGAmDlh6/jnzVyImatj1eNS5SWl+UIsQPoAifkAWdruq8b9zpicxRHuSah6+xVSvOl3ktK
	ZKQevpQHxHmEkW/03ymvaXpAXEDtEYb/c96afWwiUUYj5YNP+zIBuRFLGuplc+WZOUAgFpXm9jj9f
	90BozJvMFJo7u/9MzKv1QIysNGx+7w93xVM4Z5gJ5Mv8l2yfDF45fmfeNxVGx5UzOKUYGPNfWRP/K
	9Vejd5e6Mbp7JsmB8Kcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isN6A-0006Ah-Hd; Fri, 17 Jan 2020 08:35:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isN66-00069v-5K
 for linux-mediatek@lists.infradead.org; Fri, 17 Jan 2020 08:35:21 +0000
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BEC7320842
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Jan 2020 08:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579250117;
 bh=cp/ktM/dmtoDtuAhz2mQTckERL9vbLg4ESnKJ2wY7IY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=k+2atMjooYUHauwz9g7SwXtbaa8N2Xp07fY96vmJcR8n0go+Q8bNSozeylluPU1xT
 lDvT8st40WidJSwBE+/2xYMcNmeaVeQ+ZI5cssGqXaq98OizEILj3dTmwVs6T/qo7r
 2jKHoqcD8vtiKQbH+2/qXWxV63iwzxgPomnzfIdY=
Received: by mail-io1-f44.google.com with SMTP id z8so25108960ioh.0
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Jan 2020 00:35:17 -0800 (PST)
X-Gm-Message-State: APjAAAVtF30Dt3B8bqKA7/bUQF0y8t8w6idz75vkyj+JLbeJg/3D8QFk
 SkMfuoIERliTQYKnwjvcFPWrLudnxgEILH8uIhk=
X-Google-Smtp-Source: APXvYqyUzHUUSyhZCCc2hOzOzCT2PKcdpu79m9BCKZgH9glu6EHQle4w87rkM/wJxYua8E4vGMiRa9Ng0bVSjuFIifc=
X-Received: by 2002:a6b:f206:: with SMTP id q6mr30555906ioh.264.1579250117041; 
 Fri, 17 Jan 2020 00:35:17 -0800 (PST)
MIME-Version: 1.0
References: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
 <1577799707-11855-2-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1577799707-11855-2-git-send-email-light.hsieh@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Fri, 17 Jan 2020 00:35:06 -0800
X-Gmail-Original-Message-ID: <CAGp9LzpRQAU9TFLVFHrv=YoUUiRUQA5V_Rz+zRxAeBqqGyOiSA@mail.gmail.com>
Message-ID: <CAGp9LzpRQAU9TFLVFHrv=YoUUiRUQA5V_Rz+zRxAeBqqGyOiSA@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] Supporting driving setting without mapping current
 to register value
To: Light Hsieh <light.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_003518_245929_5BAE775F 
X-CRM114-Status: GOOD (  16.02  )
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, kuohong.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 31, 2019 at 5:41 AM Light Hsieh <light.hsieh@mediatek.com> wrote:
>
> MediaTek's smarphone project actual usage does need to know current value
> (in mA) in procedure of finding the best driving setting.
> The steps in the procedure is like as follow:
>
> 1. set driving setting field in setting register as 0, measure waveform,
>    perform test, and etc.
> 2. set driving setting field in setting register as 1, measure waveform,
>    perform test, and etc.
> ...
> n. set driving setting field in setting register as n-1, measure
>    waveform, perform test, and etc.
> Check the results of steps 1~n and adopt the setting that get best result.
>
> This procedure does need to know the mapping between current to register
> value.
> Therefore, setting driving without mapping current is more practical for
> MediaTek's smartphone usage.
>
> Change-Id: I8bd6a2cecc0af650923704589b5b90097b0ff77e

If removing the change-ids, add a prefix "pinctrl: mediatek:" to the
subject, and proper signed-off-by tags, then Acked-by: Sean Wang
<sean.wang@kernel.org>.

> ---
>  drivers/pinctrl/mediatek/pinctrl-mt6765.c        |  4 ++--
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 12 ++++++++++++
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |  5 +++++
>  3 files changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6765.c b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> index 32451e8..1212264 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> @@ -1077,8 +1077,8 @@
>         .bias_disable_get = mtk_pinconf_bias_disable_get,
>         .bias_set = mtk_pinconf_bias_set,
>         .bias_get = mtk_pinconf_bias_get,
> -       .drive_set = mtk_pinconf_drive_set_rev1,
> -       .drive_get = mtk_pinconf_drive_get_rev1,
> +       .drive_set = mtk_pinconf_drive_set_raw,
> +       .drive_get = mtk_pinconf_drive_get_raw,
>         .adv_pull_get = mtk_pinconf_adv_pull_get,
>         .adv_pull_set = mtk_pinconf_adv_pull_set,
>  };
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index d63e05e..2247eae 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -608,6 +608,18 @@ int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
>         return 0;
>  }
>
> +int mtk_pinconf_drive_set_raw(struct mtk_pinctrl *hw,
> +                              const struct mtk_pin_desc *desc, u32 arg)
> +{
> +       return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV, arg);
> +}
> +
> +int mtk_pinconf_drive_get_raw(struct mtk_pinctrl *hw,
> +                              const struct mtk_pin_desc *desc, int *val)
> +{
> +       return mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DRV, val);
> +}
> +
>  int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
>                              const struct mtk_pin_desc *desc, bool pullup,
>                              u32 arg)
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> index 1b7da42..75d0e07 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> @@ -288,6 +288,11 @@ int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
>  int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
>                                const struct mtk_pin_desc *desc, int *val);
>
> +int mtk_pinconf_drive_set_raw(struct mtk_pinctrl *hw,
> +                              const struct mtk_pin_desc *desc, u32 arg);
> +int mtk_pinconf_drive_get_raw(struct mtk_pinctrl *hw,
> +                              const struct mtk_pin_desc *desc, int *val);
> +
>  int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
>                              const struct mtk_pin_desc *desc, bool pullup,
>                              u32 arg);
> --
> 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
