Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF640C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 03:24:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45CF1224DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 03:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45CF1224DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XImdKBDKuxeM62ZEFAiBL+5awUM3gKx67Q0Rs4rBkE4=; b=oqbyyYFPOfSrf8BOjBjK9k6Hn
	iQu52DXi38xxfnNSZBdQWvJFDbVa+hbEtaslm+bFN3Iw+yKWjcucBqf3eZ64LsD/GssV+Zv9217Nf
	ibM41ubMR3xotiR4sbyHXViO/CCcQO1dZka5bSwP6NOpixubySEY1SC6hHKe8uLN/pIoIrwXstLZi
	ocmDeSXy874ZOPygmJOsSBSTNhQt6Siw5uGuG9gwLXfUoxhrDZk9ChfLNPcyyoMAQMRRiJwT/GSqd
	ukw+ngR8MU1vhJWCnppRi4ODkSvhMFL+svRa74m9Ox5qZlc2Ug4KCdE2yKtGiWXEDi8BtUskKtp9q
	KwKCRNfzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3sUS-0007PP-Ui; Mon, 25 Jan 2021 03:24:32 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3sUQ-0007Ol-1d
 for linux-mediatek@lists.infradead.org; Mon, 25 Jan 2021 03:24:31 +0000
Received: by mail-ua1-x92b.google.com with SMTP id t15so3978986ual.6
 for <linux-mediatek@lists.infradead.org>; Sun, 24 Jan 2021 19:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mCmh2kWpn9Xf7nqnBfNwjaSrOMJ8Dlsin1zC2EYEHJM=;
 b=DxgVfbgSgEU3qgjORZIqffrN0lR2zv6uJlzsMyt1HdJ74Zta1SnL83jfWhNjn/ka8V
 TeU18fLLS7MzAQMqTJQkUKs9gNo1UIWDxHy31rUO1XBhmxpi9c8NUkO3LqH124Y291qe
 /pAoAw1tjynLxxN3eNPD/F8GUhnNuYTmh8ZKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mCmh2kWpn9Xf7nqnBfNwjaSrOMJ8Dlsin1zC2EYEHJM=;
 b=DPCSDnWglnjjxhfHEGGZQti1X7pfRWND5oluWEFS0B9elh72kO2dnMJuZ/DSmB4CP9
 5vU0nkrfMkxJGQUSBrXdj9zY8SU7jHbYJn4JOWDPRmdpYrG/FGa+gZpNIdFwzveDqgrn
 YXg+viZ9BEMsyTP6nEu2l310xwpjxTuQcasOU4bUK6sjjUxwXM3CPgjtSTvsuansTF27
 Ix2ZVTJIlGdYQF0WgznJjvMkpgc2l9F65DMfkqeUnI1rv34/vFW+hNb3I8H0fBffbBHP
 E5GV6tH888cMLjzHRNcMbJt5fSqtb8teAETJ3LDgHwcub2LG38Xv+5EnnAjSfIR1HQQi
 yoSg==
X-Gm-Message-State: AOAM530hlk2PmB9p6uB5I691Ao3qOE4nMPWSvpWITnLw4c3LiONWP7DB
 uL8ZOVpA2/VQXFHtkz8/6Q+JGCCz4IODNja4FLd79w==
X-Google-Smtp-Source: ABdhPJyYWCvHa9SZ4CbA+9JK6kGYitKJP5aZI/nt5+g9QIrUsiAgnlrD05UCiXdDd4g7lvPf5Y9Qa6n2R/zQn+Vy8zQ=
X-Received: by 2002:ab0:3043:: with SMTP id x3mr105842ual.88.1611545066853;
 Sun, 24 Jan 2021 19:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20210125031513.1741-1-hailong.fan@mediatek.com>
In-Reply-To: <20210125031513.1741-1-hailong.fan@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 25 Jan 2021 11:24:16 +0800
Message-ID: <CANMq1KCfBy9dRELP-hMjY5FraachcRGHEC9mmaMjJCLQzdu+ZA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix trigger type setting follow for
 unexpected interrupt
To: Hailong Fan <hailong.fan@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210124_222430_112150_16752901 
X-CRM114-Status: GOOD (  19.68  )
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
Cc: youlin.pei@mediatek.com, Hanks Chen <hanks.chen@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Chen-Tsung Hsieh <chentsung@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 gtk_pangao@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 25, 2021 at 11:15 AM Hailong Fan <hailong.fan@mediatek.com> wrote:
>
> When flipping the polarity will be generated interrupt under certain
> circumstances, but GPIO external signal has not changed.
> Then, mask the interrupt before polarity setting, and clear the
> unexpected interrupt after trigger type setting completed.

I'd add a short note about why you remove mtk_eint_flip_edge, that is,
because mtk_eint_unmask already calls it.

>
> Signed-off-by: Hailong Fan <hailong.fan@mediatek.com>
> ---
> [V2]
> ---
>  drivers/pinctrl/mediatek/mtk-eint.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> index 22736f60c16c..0042f32c7e7e 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -157,6 +157,7 @@ static void mtk_eint_ack(struct irq_data *d)
>  static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
>  {
>         struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
> +       bool unmasked;

Well, this is true if the interrupt has been masked (or, equivalently,
if we need to unmask it later).

So I think either "masked" or "unmask" are better as variable names.

>         u32 mask = BIT(d->hwirq & 0x1f);
>         void __iomem *reg;
>
> @@ -173,6 +174,13 @@ static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
>         else
>                 eint->dual_edge[d->hwirq] = 0;
>
> +       if (!mtk_eint_get_mask(eint, d->hwirq)) {
> +               mtk_eint_mask(d);
> +               unmasked = true;
> +       } else {
> +               unmasked = false;
> +       }
> +
>         if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING)) {
>                 reg = mtk_eint_get_offset(eint, d->hwirq, eint->regs->pol_clr);
>                 writel(mask, reg);
> @@ -189,8 +197,9 @@ static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
>                 writel(mask, reg);
>         }
>
> -       if (eint->dual_edge[d->hwirq])
> -               mtk_eint_flip_edge(eint, d->hwirq);
> +       mtk_eint_ack(d);
> +       if (unmasked)
> +               mtk_eint_unmask(d);
>
>         return 0;
>  }
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
