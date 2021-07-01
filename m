Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D68C11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 07:21:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B90716147D
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 07:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B90716147D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cs15lQ0KALhvc1h427bZiodocltT66c3MnO/yAZoX0s=; b=XE/QzYMIUyK3X0
	y3xyzdbieB8VUj+nwAFtToZFH4ebqe0shklYat7ld1IZMKRgo8xkvfG13/BHB3vsFsJfh5pzhqv+4
	R87LfRT0zeQeHf7YEZNTi+A1JmwrsXAbbEV1D/g1yJl4nQG+EJbslMLOA0orc6kwuKKTBDSLhvwSF
	yu9ivUZq1oAgtmViNbzU9qL1RJ2Ga7C88ekS1W63mTdiSkNjvt3hYcEeyJzcNI/Mx/1QqMR7qtRvF
	QX69u1rP1ANkmzJjazXzDw5DIoIuzQSrBuPiMpoiPywVw3MqJkgzvanyKvWpUYcT6+xAgG+/h4his
	4yKHTtQEso4BSmAkD7gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyr0p-00GNgN-9R; Thu, 01 Jul 2021 07:21:27 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyr0m-00GNfi-Vf
 for linux-mediatek@lists.infradead.org; Thu, 01 Jul 2021 07:21:26 +0000
Received: by mail-lj1-x232.google.com with SMTP id u20so6978411ljo.12
 for <linux-mediatek@lists.infradead.org>; Thu, 01 Jul 2021 00:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ga4/H+zFc4BIvkIZp/GwacqLCotWEZsIhOfh+7jAZ3s=;
 b=IaI97DW3ssIIS+7nQ5kQe8/cemQmh7BCye8Vf2G2Io0KFRMGvpn3hkzbv4E0GNYhAl
 klR2AaOqqU+FUSziNdA/ipLW79CJGazcHBsd80s/iR0+tiLs3yar5ixRAwrCCH7BUFxV
 mwR/rL3iszdTDvZjTJDIrKMoqUgj28IFMpYKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ga4/H+zFc4BIvkIZp/GwacqLCotWEZsIhOfh+7jAZ3s=;
 b=YdkUUefCGy6IyB8KQrX++0Uk3QQJzB852JYvuCjocGLtmiikNV2/FuXE1kl7D+9epI
 TOLx9GMKJj96/+pWRuk8ELJSFC4kgLgyaqV06klxCB9OERnuSgjNva9JlQyPJFbxs88x
 R1zTOajZTVOokiUoeVbW4ldzcIMIyN15Or4ve9jHmvqd4BcitcifeTinnXdtfAGVIsP/
 8EjUpwURmGAat3M71zepk0nCN3OhOxyEsHcGe5TgUBPIaTa9SOsj1fm1s/PoTTn6rR9L
 7sq0/kTZnsOaQ2/mVK9rFFDIjS/ZnnC8mAvCz9RWbckKT7Dy4ZUmIc9PfqnghrLp1OX3
 780w==
X-Gm-Message-State: AOAM531qFNRkI8xdQ/0xU7PZ9PqYbPZTMmkTVwoIsJqFLRoN4rBzWsuV
 Z6WgHhTEa/yb8N2SJyzNc6Np0jBrc6rr/EtciMgo5Q==
X-Google-Smtp-Source: ABdhPJyxvSNuZmwRYoKy8FDKToeJS7PWq88q64REDzsuI4/M4wTPs/gV+/Jhx06I0DFC/KinbxeFXBAee1LQDg9hUZE=
X-Received: by 2002:a05:651c:32e:: with SMTP id
 b14mr10809961ljp.251.1625124082895; 
 Thu, 01 Jul 2021 00:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210701065439.2527790-1-hsinyi@chromium.org>
In-Reply-To: <20210701065439.2527790-1-hsinyi@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 1 Jul 2021 15:21:11 +0800
Message-ID: <CAGXv+5GNkqHOxv9zXoa3yLh5_FXGUARqXd82W00CBTnHS_BFPw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix fallback behavior for
 bias_set_combo
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 zhiyong.tao@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_002125_085414_4900A518 
X-CRM114-Status: GOOD (  24.12  )
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

On Thu, Jul 1, 2021 at 2:55 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Some pin doesn't support PUPD register, if it fails and fallbacks with
> bias_set_combo case, it will call mtk_pinconf_bias_set_pupd_r1_r0() to
> modify the PUPD pin again.
>
> Since the general bias set are either PU/PD or PULLSEL/PULLEN, try
> bias_set or bias_set_rev1 for this fallback case.
>
> Fixes: 81bd1579b43e ("pinctrl: mediatek: Fix fallback call path")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 5b3b048725cc8..0cdff487836fa 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -926,9 +926,12 @@ int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
>                         if (err)
>                                 return err;
>                 } else if (hw->soc->bias_set_combo) {
> -                       err = hw->soc->bias_set_combo(hw, desc, pullup, arg);
> -                       if (err)
> -                               return err;
> +                       err = mtk_pinconf_bias_set_rev1(hw, desc, pullup);
> +                       if (err) {
> +                               err = mtk_pinconf_bias_set(hw, desc, pullup);
> +                               if (err)
> +                                       return err;

You don't need to nest this. If mtk_pinconf_bias_set_rev1() succeeds,
err would be 0 and the following if blocks would all be skipped. So:

err = mtk_pinconf_bias_set_rev1();
if (err)
        err = mtk_pinconf_bias_set();
if (err)
        return err;

Moreover, maybe you should rework the test for hw->soc->bias_set_combo,
as it is no longer relevant to the code within the if block?


ChenYu

> +                       }
>                 } else {
>                         return -ENOTSUPP;
>                 }
> --
> 2.32.0.93.g670b81a890-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
