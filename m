Return-Path: <SRS0=t7yo=3L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D09C2D0DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jan 2020 19:41:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67AC724655
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jan 2020 19:41:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hOPgRj9D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsNumBbK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67AC724655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hMwxFa5N//RbSTR6D0hM/DaGUMbwl+FdP5n1/NMVpek=; b=hOPgRj9DNh29+/
	cGgHs07l2yqBvSaBaqxwv00P/mStKHyaCyvNCn4dFCdEjXgLfCeV8xgIGc/hvPkdZKyVfekN7wv0c
	hF2Npr5VylBF+0L1brDta0voM9CQ3OnNVD76ZCCgJGK/2yyEy7n8XJCpbfLSfIZaL8sU7lf6cYiu9
	VCGEtzxRiNtWBmFjHJ4GmQYEIhrFKsPgPvnseSR0xFJoZwR9BP9jSkkl1/5lLkqPZVVucMIDU9YNl
	QVBCAijsaGDx12nTmes39Bj7tJvQk6DrZI2xfuF7ngTFjqvFt/McR9rLZ634PfEugSDeDWQX85DcO
	fgJpps79Nlf+73Vwia9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuLst-0007Gq-Kw; Wed, 22 Jan 2020 19:41:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuLsq-0007GA-Mn
 for linux-mediatek@lists.infradead.org; Wed, 22 Jan 2020 19:41:50 +0000
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 52FFD24655
 for <linux-mediatek@lists.infradead.org>; Wed, 22 Jan 2020 19:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579722108;
 bh=e9Bx3cpa8c9tVIw9Lu1g7sNSWpGserqqeFYjYE4gSC4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LsNumBbK5m2fDieVpvj7b802xW7FYj1pkAa9ZrlPM7q4sKL2fQ9gMM5cSRkTpidum
 +okRbEgag0ntj4pH65vHTRkxQcpOWwo75vW/Ak1MLSTOIb440SwQklIc4JeGGypopq
 0tFTdhKTMBOFdkzc7S4WOeFYjERxBVMUJdmyVfis=
Received: by mail-io1-f47.google.com with SMTP id z8so528650ioh.0
 for <linux-mediatek@lists.infradead.org>; Wed, 22 Jan 2020 11:41:48 -0800 (PST)
X-Gm-Message-State: APjAAAVfa1n8kOyS2mGOkt8b/wL/Posa9PCpBldm0GRWo+7WWEds0/+l
 MgoEdHXvdH+qEmp4QPIaClG5/m8JdK7LtaJeqDw=
X-Google-Smtp-Source: APXvYqzNhoo+FOYzF0plXSs0nQOgPxMnKRmuYNHa8geFuUFnPU9aCTgCGHogerFgIT+EU8u4QVRWiBJ9ZkOn2ZReuhc=
X-Received: by 2002:a5d:9d11:: with SMTP id j17mr988679ioj.83.1579722107745;
 Wed, 22 Jan 2020 11:41:47 -0800 (PST)
MIME-Version: 1.0
References: <1579675994-7001-1-git-send-email-light.hsieh@mediatek.com>
 <1579675994-7001-2-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1579675994-7001-2-git-send-email-light.hsieh@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 22 Jan 2020 11:41:37 -0800
X-Gmail-Original-Message-ID: <CAGp9LzpuuOWuhK9GfKnQNrTxM_kH3c8vYBt154kGY8jy=5zc8g@mail.gmail.com>
Message-ID: <CAGp9LzpuuOWuhK9GfKnQNrTxM_kH3c8vYBt154kGY8jy=5zc8g@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] pinctrl: mediatek: Supporting driving setting
 without mapping current to register value
To: Light Hsieh <light.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200122_114148_793435_EB020CE2 
X-CRM114-Status: GOOD (  16.28  )
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

On Tue, Jan 21, 2020 at 10:53 PM <light.hsieh@mediatek.com> wrote:
>
> From: Light Hsieh <light.hsieh@mediatek.com>
>
> MediaTek's smartphone project actual usage does need to know current value
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
> Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>

Acked-by: Sean Wang <sean.wang@kernel.org>

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
