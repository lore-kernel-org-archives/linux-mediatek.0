Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7960C433E3
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 23:43:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97F9A20885
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 23:43:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NWwWtsZD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lsGv7Ijx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97F9A20885
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eFkzR9VjFcNjd7NoXaX8B0EdfGkvLe5t/RDIMQ3jToU=; b=NWwWtsZDBlNyIMvnfaqsAJ70W
	zC7ZAEJh2wCVuewZaA2fG/5Ta/d/EBjvrF2Rp4DfPMoAEA4IBkvwUcoLWadYZ6XIwXp6+FaF1W3+c
	4tCceBC2l/DDbII0IVlwwnTmfuck/AuCoDuHxm2FX2FboMaYD3a03uc2NakwwP9SzEwTXce/EOWZq
	wsQmSIQYR/U6x6xaIfbx1uKMdS7T00IrPWVUL3iIfYnsQxhJ4ILfvHbYKrj4/YU3TGjpiq03BkpM6
	A01gpfCXLAfRGfQsBiuKsPk6ov9HoSS3Cq0OGzIJTq7cFB9o+BKAhg2Fdkfc/7hZAm/2LfwkuBAPX
	IuASrn53Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8Xk0-0007FI-1V; Wed, 19 Aug 2020 23:43:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8Xjv-0007Dr-Az; Wed, 19 Aug 2020 23:43:32 +0000
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D41E3208DB;
 Wed, 19 Aug 2020 23:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597880609;
 bh=ElRgQNa+eCXKxKGiAwXCvT5SEdd/aIQYRPIeKR0A834=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lsGv7IjxoikfbbLi8veuPzeJZ4LzzUuP8aF0z+SUXXzi6hloYN69Oxkth75X7fuhx
 Pq3maN5J9QUHHgZNAc7O730nLvimgC0Ja4dzYQj3ncuK3mseUtibMYtnsOLeW8ZhvH
 SJUXUHgEK++U51u9gKAggXVtsIWRGANPt6nP1VBw=
Received: by mail-io1-f53.google.com with SMTP id a5so477566ioa.13;
 Wed, 19 Aug 2020 16:43:29 -0700 (PDT)
X-Gm-Message-State: AOAM5334Tqd43iz2FXVQg00uRS6814mIdJXdODZvgjF22zGHVo11Tx6h
 6BC71c2ROAT90vVnsHoPuKh1USviiogMvyltj20=
X-Google-Smtp-Source: ABdhPJywImw8dXNnBobaBopdocSp5GlcwoPSbxbSaryZt8nivOMkmwgkEBFD3B3CiPbqAgeiGZaHFLwLGbaFwxJnAgc=
X-Received: by 2002:a6b:c88f:: with SMTP id y137mr321019iof.55.1597880609305; 
 Wed, 19 Aug 2020 16:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <1597317260-24348-1-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1597317260-24348-1-git-send-email-hanks.chen@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 19 Aug 2020 16:43:18 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzq7H_KREyhxNy1zBsBJdFRAA7Zc1jkGc=ZiN_og1H9KBQ@mail.gmail.com>
Message-ID: <CAGp9Lzq7H_KREyhxNy1zBsBJdFRAA7Zc1jkGc=ZiN_og1H9KBQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: check mtk_is_virt_gpio input parameter
To: Hanks Chen <hanks.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_194331_447762_B1FA0F29 
X-CRM114-Status: GOOD (  20.90  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, sin_jieyang <sin_jieyang@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, lkml <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hanks,

On Thu, Aug 13, 2020 at 4:14 AM Hanks Chen <hanks.chen@mediatek.com> wrote:
>
> check mtk_is_virt_gpio input parameter,
> virtual gpio need to support eint mode.
>
> add error handler for the ko case
> to fix this boot fail:
> pc : mtk_is_virt_gpio+0x20/0x38 [pinctrl_mtk_common_v2]
> lr : mtk_gpio_get_direction+0x44/0xb0 [pinctrl_paris]

it is better we post the complete call stack when the failure occurs

>
> Fixes: edd546465002 ("pinctrl: mediatek: avoid virtual gpio trying to set reg")
> Singed-off-by: sin_jieyang <sin_jieyang@mediatek.com>

signed-off-by with the full name

> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index c53e2c391e32..27ab9c512ae1 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -259,6 +259,10 @@ bool mtk_is_virt_gpio(struct mtk_pinctrl *hw, unsigned int gpio_n)
>
>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio_n];
>
> +       /* if the GPIO is not supported for eint mode */
> +       if (desc->eint.eint_m == EINT_NA)

s/NO_EINT_SUPPORT/EINT_NA/ to align with pinctrl/mediatek/pinctrl-mtk-mt*.h uses

> +               return virt_gpio;
> +
>         if (desc->funcs && !desc->funcs[desc->eint.eint_m].name)
>                 virt_gpio = true;
>
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
