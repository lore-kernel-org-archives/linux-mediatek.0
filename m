Return-Path: <SRS0=wYRt=DE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5824CC4346E
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2020 18:08:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF0592078B
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2020 18:08:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A+WNLosI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+f9PBYV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF0592078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gKFlSRro7IGcKtTsqCDe/RdtSXJGmEfiATd8whMCw8U=; b=A+WNLosIoda+zJrfxAByCCpJc
	D9+jsBWq46ZVJVQF34lHNXywYIBzH48D9UPvv0php9fNCrAwDNDuoJ+1YeHs8yoSLh8BfSGZcgz1P
	Dzb+/iD2WmFs38wFssVjcmH1KPipkNEVAxuKq97n+SLryHi7wV7xEUCD4hmzF21Y7TuKSdRgpXjIy
	xMzMIalDI0USOqy89BjcYEiZTQp+qZBZNLQ+NOzPh2XYoXezh0yGuLOG35PysyntxT5nFmPj5SJcG
	9+Ty+tEC3nEI8/4gFL2laeBB1qP4yfrHVGCNE5nPPj8GsvI6ADkD8wl0rZGSWKYyvprZYypiE8qxE
	qwU5Kco8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMb5g-0001kh-8c; Sun, 27 Sep 2020 18:08:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMb5a-0001jA-SE; Sun, 27 Sep 2020 18:07:59 +0000
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E72AF2078B;
 Sun, 27 Sep 2020 18:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601230077;
 bh=vsE9X3eOgp7dHrsjtGKh2H/Hys4APfGgXPzjOy78+jo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=V+f9PBYVKnfawmN5ojU0YWt7R+WuJrseSZJvMh9s+F98TeQF9x1d+dq6cq+63T0eR
 xGWZED7d1UupRbRs7p8uANEKo3fyKpqG0FFv1CNxJX/l8937FnRJIUeDMliAUp7EAY
 BhszQvEXrh70MsotsMlw2Hqx3iKpfWm3bMUAYa1s=
Received: by mail-il1-f182.google.com with SMTP id o9so1540681ils.9;
 Sun, 27 Sep 2020 11:07:56 -0700 (PDT)
X-Gm-Message-State: AOAM531WuYi6WTh8LRDCAbtlz8ERJnzItO4flacUFM0tbdH1uWLldBcP
 28eQYGbwyv5vBCOb4E8cSVwnjwbOPVck2A4dpW0=
X-Google-Smtp-Source: ABdhPJx6T9krolcK/30YgUVR5caQAXMJfm/AVPZx6YqMKU9Mlbfb3a9iooHxc2jWt3avTWAWB6bvx8FM+nioWnkZleY=
X-Received: by 2002:a92:d842:: with SMTP id h2mr7981119ilq.176.1601230076381; 
 Sun, 27 Sep 2020 11:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <1597922546-29633-1-git-send-email-hanks.chen@mediatek.com>
 <1601038258.15065.4.camel@mtkswgap22>
In-Reply-To: <1601038258.15065.4.camel@mtkswgap22>
From: Sean Wang <sean.wang@kernel.org>
Date: Sun, 27 Sep 2020 11:07:45 -0700
X-Gmail-Original-Message-ID: <CAGp9LzqOvqm+ewSxyvjuX_D=181+DUu3Lre-oG5FY=Mx8X6Qzw@mail.gmail.com>
Message-ID: <CAGp9LzqOvqm+ewSxyvjuX_D=181+DUu3Lre-oG5FY=Mx8X6Qzw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: check mtk_is_virt_gpio input
 parameter
To: Hanks Chen <hanks.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_140758_967177_85F89240 
X-CRM114-Status: GOOD (  23.08  )
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

On Fri, Sep 25, 2020 at 5:51 AM Hanks Chen <hanks.chen@mediatek.com> wrote:
>
> Hi Sean & Linux & Matthias,
>
> Please kindly let me know your comments about this fixes patch.
> Thanks
>

Acked-by: Sean Wang <sean.wang@kernel.org>

> Regards,
> Hanks
>
>
> On Thu, 2020-08-20 at 19:22 +0800, Hanks Chen wrote:
> > check mtk_is_virt_gpio input parameter,
> > virtual gpio need to support eint mode.
> >
> > add error handler for the ko case
> > to fix this boot fail:
> > pc : mtk_is_virt_gpio+0x20/0x38 [pinctrl_mtk_common_v2]
> > lr : mtk_gpio_get_direction+0x44/0xb0 [pinctrl_paris]
> >
> > Fixes: edd546465002 ("pinctrl: mediatek: avoid virtual gpio trying to set reg")
> > Singed-off-by: Jie Yang <sin_jieyang@mediatek.com>
> > Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> >
> > ---
> > Changes since v1:
> > - update Singed-off-by
> > - align with pinctrl/mediatek/pinctrl-mtk-mt*.h
> >
> > ---
> >  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > index c53e2c391e32..a485d79f51a1 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > @@ -259,6 +259,10 @@ bool mtk_is_virt_gpio(struct mtk_pinctrl *hw, unsigned int gpio_n)
> >
> >       desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio_n];
> >
> > +     /* if the GPIO is not supported for eint mode */
> > +     if (desc->eint.eint_m == NO_EINT_SUPPORT)
> > +             return virt_gpio;
> > +
> >       if (desc->funcs && !desc->funcs[desc->eint.eint_m].name)
> >               virt_gpio = true;
> >
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
