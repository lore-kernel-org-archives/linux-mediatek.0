Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A49C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 07:54:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E08DD60F3A
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 07:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E08DD60F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gBE1M6s9AIl/Toc03mDDarxnDdQp5A5XNVu6Vxx6Gss=; b=MohrUbKBVUyMWM
	ZHKuIyFbhcMwPkKCn27nXCUZ9BTHjyR8m4klxgWCvFxX4d7EsnnyMyCCPUZGPBedKompCG51QR6JP
	ruH0mMgpTTessKqFCMoKrDuK0xpB1AJkf2F3voC7PqGb36KsPEMH1PBvrtDD2MSmIEA8z+MJzA3De
	8zfRfWO184lLwB5dPoKxig7jiLf3p1+f5dVdCdaFXb1u+Pmrqu98ypTw2g/067duF+rFgBdOVnnnv
	AeumAnSDdH9J+4suc0jFJlTTVSViS14G9EqfHIsWgyqygx2Dq1QkCBS0rcJWXIY+tH/C46EiqqYPA
	qERjV+Lmzrfo3dmWHrBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKyb3-001ki3-9z; Tue, 31 Aug 2021 07:54:17 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKyan-001kem-Gg
 for linux-mediatek@lists.infradead.org; Tue, 31 Aug 2021 07:54:05 +0000
Received: by mail-lf1-x131.google.com with SMTP id b4so36617465lfo.13
 for <linux-mediatek@lists.infradead.org>; Tue, 31 Aug 2021 00:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i4z1Q7XZLrwMagEwf7DhKHY7l4vBFTh7bbew95Rfghc=;
 b=LGhfjvXydY9NR23oENrvhn3uS3FsBDQF5xv94TOHFCy8S4Laq0hXFnjqygFk/9MYrq
 xrXsA5/UygBoKt2NEyejI+2P0P8aB6rKV1kfJLekLODhlhGqjVT/ifPUPOVFzQvx2syd
 ohR9cedskRFxWtgveTf0Wp1JXBzuSjD9PooTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i4z1Q7XZLrwMagEwf7DhKHY7l4vBFTh7bbew95Rfghc=;
 b=PBGf41k0hDlIXOxSx2V5pWYiRjUgjwRbbw0oH2AWJRreZJPLUT2WdBfJGahZrzQVYr
 UuCiGx9Q2T2o2gXBLw/hqzWzKRv1KabRMFMkzVIqdzZucLHgOJQImwjtauaOQ6xHFF+A
 8JldZcsPWWn+GtcY+6ZWVvhJCEOGUZuefLGy5993nXjdbRyb1pskN3/rwmtIjW2Etipj
 Q2DFfsdsX+59r8Va5Rt7lb6mvxqw7GTerUYd+w1PGVYkvVtZ1Sh2PoRVm31NovN/xCyp
 fkqOZA42nPr42oC5GiDL3JDexePHYHWtJ12O//AE6mHef9k20OY4l0duX2uHjxfCUZbi
 rdJQ==
X-Gm-Message-State: AOAM532a+Ib+1+K1XN+BNLcWGF2rpSmPcIbvxaDWpS/Ay8qepZL1m5Do
 V2Op4gAcnxM98Lf7Logg1BWuOe5qCdZQPq/W72yaVQ==
X-Google-Smtp-Source: ABdhPJyI7Qitp2hXCfbD58wQEyaZGTWIKb2i10Sjy5PjIUW1idrtrJ719jxZJe2gtyY1vQEubKsItHY2MUnG2NvMnZg=
X-Received: by 2002:a05:6512:22c8:: with SMTP id
 g8mr21387849lfu.342.1630396439123; 
 Tue, 31 Aug 2021 00:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
 <20210830003603.31864-4-zhiyong.tao@mediatek.com>
In-Reply-To: <20210830003603.31864-4-zhiyong.tao@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 31 Aug 2021 15:53:48 +0800
Message-ID: <CAGXv+5Gx74SxdB_-V3SZB1sQ3=bpUkbkkaHxAyFg9m+7k+HVkw@mail.gmail.com>
Subject: Re: [PATCH v11 3/4] pinctrl: mediatek: mt8195: Add pm_ops
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 hui.liu@mediatek.com, 
 Eddie Huang <eddie.huang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>,
 Biao Huang <biao.huang@mediatek.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>, 
 Devicetree List <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_005401_586882_BD607556 
X-CRM114-Status: GOOD (  22.57  )
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

On Mon, Aug 30, 2021 at 8:37 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> Setting this up will configure wake from suspend properly,
> and wake only for the interrupts that are setup in wake_mask,
> not all interrupts.

This sounds like a fix. Please add a Fixes tag for this patch. This makes
tracking things easier.

So,

Fixes: 6cf5e9ef362a ("pinctrl: add pinctrl driver on mt8195")
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Also this patch is unrelated to the rest. You should send it separately.
This would also help the maintainer merge it directly.

> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mt8195.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8195.c b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> index a7500e18bb1d..892e79703f98 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> @@ -839,6 +839,7 @@ static struct platform_driver mt8195_pinctrl_driver = {
>         .driver = {
>                 .name = "mt8195-pinctrl",
>                 .of_match_table = mt8195_pinctrl_of_match,
> +               .pm = &mtk_paris_pinctrl_pm_ops,
>         },
>         .probe = mt8195_pinctrl_probe,
>  };
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
