Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A631DC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 12:49:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4931E2078D
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 12:49:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pm0oMy6A";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSvv3znH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4931E2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ea9bv/XSsnvDGZIv3vFaQMikDZ8LHdAUeBxJcMbYAEg=; b=Pm0oMy6AOrFYP1qX+WxvgGKfi
	iJxUta6JUJAZHfEEsJcLX0HlqP0v+d5yDtu5u5fnfCQsr2L1UgtBFqbIt43A7VXcvaM4iwIkTZnAQ
	R62Ga844FGwS0mH3QDBLfEJpnXCZ/NWrW38kzdN35Cwhm9EZLJShwBkPJixyZjJrm0AhAW9AAoMLJ
	j51u9e4o85BQBXq5linqVbFjcbnziCI2ZpbIR9FmRcDuPQbvL79nQGR0UZg3tAJEEFVwyx2FSgy77
	GIVGvNNkmMJ276GTTK0xtayqsHhy96macOE9z1ugJBgeEky8OUbbUlWbjkQDFvIJBOm3qBWc8ctHn
	fwKQGYY/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHnvD-0000Wq-57; Mon, 14 Sep 2020 12:49:27 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHnv3-0000SR-Vm; Mon, 14 Sep 2020 12:49:18 +0000
Received: by mail-pg1-x543.google.com with SMTP id s65so10402029pgb.0;
 Mon, 14 Sep 2020 05:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ROlxFZgVA2Swaooaus/a1+q0GqMXxQ0FAmAp3yP/6bY=;
 b=aSvv3znH5p3QtfV/kQJwGkY2pRzv7SRMcndqbikAXwclu1YjKE0lVYiZNlgEY3fgEK
 SQUUhfrDs9S3Gv7qRZOp7Qz2hfawC7lxdCdm7sNZibCD+Kgk6s8li4yLSmcJ/96Zcr0b
 2jyha3hKUs02yriAZZAW6UyzSvxincKiIXcnlkBQ2/cUhFGAIELxFjkZ0ATMdsRIAKAX
 5LdYGpzi558jCJy6WJQMkZugoSSpNSFoxWj+ktNGKXMzyinEj4fdG9QiS/bL658GgSik
 ivaj15mNwpgb3NjX/UEysV0ceWHJqSSypNlu6hHMeQxBrJiAsaiJALpuaxGlXZ1a87hx
 AB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ROlxFZgVA2Swaooaus/a1+q0GqMXxQ0FAmAp3yP/6bY=;
 b=MAJvRptqLdF0JYJbBamfi3wUK6XwEOzAu5d4ZYfJCbGe4chrfj4Ij2Bam6OShOPFew
 QFPkNL9K/W0vGhQPcrmjQzjHAF2jhQmdBvvY/tjhreyceLBN0hJse8uGO8TfELPIk3q6
 j6aWAcAOLz+sx2JrIOnvYU96FALpbUra5pYGTcf02z7NhXAM28l2V/NT1zqbxMzBhXxT
 FZxM8lW7CVgDC26VFkwajw6mRPCH1GI0z7YucMpwPdKV65EuY3qfwVS+Na3O+uWqHlSW
 amvQJNGUPG4csV9BUTbOEZhaeZlqgt3WkWn9qeAdhdv01QQxGkgRn2bs2Kz0mNarlRNX
 8J9Q==
X-Gm-Message-State: AOAM533py8E+hpvf9bbovcdkzp6hQhq5QrLcGWlnFDJ0q6sbhcaUAHZl
 OdvdaM3aa0ETrSdR/sMOYxcq6Qbwvpich70QWhiMuLNUp2kyDnMC
X-Google-Smtp-Source: ABdhPJymIOiWRsrqO646XK7+kQkW9udJ13idCdF7Qj+IW0QYeT6iuSE88ABLwNuRb+kln8anCVu8Svp0jQ7dfhX/vlU=
X-Received: by 2002:a63:c543:: with SMTP id g3mr10946987pgd.203.1600087754465; 
 Mon, 14 Sep 2020 05:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <1599890246-21191-1-git-send-email-qii.wang@mediatek.com>
In-Reply-To: <1599890246-21191-1-git-send-email-qii.wang@mediatek.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 14 Sep 2020 15:48:56 +0300
Message-ID: <CAHp75VeBuR4fkVk0z=+d7EonHz0h=4=eRj3Wfe8R_8T=eyHaeA@mail.gmail.com>
Subject: Re: [PATCH] i2c: mediatek: Fix generic definitions for bus frequencies
To: qii.wang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_084918_063441_CD3CE42D 
X-CRM114-Status: GOOD (  19.98  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, Wolfram Sang <wsa@the-dreams.de>,
 Leilk Liu <leilk.liu@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Sep 12, 2020 at 9:02 AM <qii.wang@mediatek.com> wrote:
>
> From: Qii Wang <qii.wang@mediatek.com>
>
> The master code needs to being sent when the speed is more than
> I2C_MAX_FAST_MODE_PLUS_FREQ instead of
> I2C_MAX_HIGH_SPEED_MODE_FREQ. Fix it.
>
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index efc1404..0cbdfbe 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -681,8 +681,8 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
>         unsigned int cnt_mul;
>         int ret = -EINVAL;
>
> -       if (target_speed > I2C_MAX_FAST_MODE_PLUS_FREQ)
> -               target_speed = I2C_MAX_FAST_MODE_PLUS_FREQ;
> +       if (target_speed > I2C_MAX_HIGH_SPEED_MODE_FREQ)
> +               target_speed = I2C_MAX_HIGH_SPEED_MODE_FREQ;

Thanks for fixing this. Indeed, somehow I messed these up.

>
>         max_step_cnt = mtk_i2c_max_step_cnt(target_speed);
>         base_step_cnt = max_step_cnt;
> @@ -759,7 +759,7 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
>         for (clk_div = 1; clk_div <= max_clk_div; clk_div++) {
>                 clk_src = parent_clk / clk_div;
>
> -               if (target_speed > I2C_MAX_FAST_MODE_FREQ) {
> +               if (target_speed > I2C_MAX_FAST_MODE_PLUS_FREQ) {

But this one is not related. Original code used to have

#define MAX_FS_MODE_SPEED              400000

       if (target_speed > MAX_FS_MODE_SPEED) {

And this change doesn't fix the above mentioned problem.

So, please split into two separate changes.

>                         /* Set master code speed register */
>                         ret = mtk_i2c_calculate_speed(i2c, clk_src,
>                                                       I2C_MAX_FAST_MODE_FREQ,
> --
> 1.9.1



-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
