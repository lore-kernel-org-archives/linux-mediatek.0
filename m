Return-Path: <SRS0=e3uk=FV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1806C4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 03:43:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65BA12371F
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 03:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65BA12371F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HB9CE0Fu+8hbRHbHJ41RitRBmet/ytsm3D/Tx7CXlgw=; b=CbORVxfZOv5KChdAi+MbV3heY
	mwywaBGbKijmVXQQEq98C09xGeM8NYcrrtGT55xaqAO+06P8axZ7VvHaRDn3lOL3nug2AgDZUTT3h
	GTASY8CtIqhKaYgtWxIcSKDnfAOXGs0uFSMZ5Tx/bRnCaTZfvbnIzPa9cFA8Fj/7B/eCEWNeKsBDd
	fkJuyKRU9vWXEKL0YcUqhHLK/gxyy+MCUwObPsQzgMFFPk2qCTCdrb3ts4HMz/nFf9nraQtKIVUjr
	J/AJy4aGOuKUElDwoIAsmhuW2w+RDmrqXmhcbMBEHrNa3DEeLXRxKT+uxEWxgOb2D9I7PAeszf/al
	yXb9pc2dQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpkCO-0007Pp-Ob; Thu, 17 Dec 2020 03:43:28 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpkCL-0007Ob-R3; Thu, 17 Dec 2020 03:43:27 +0000
Received: by mail-pf1-x42a.google.com with SMTP id q22so18149705pfk.12;
 Wed, 16 Dec 2020 19:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tkZdULlUHpCTLPPLnvYRioU35Xl4oRXIiOGWSipJOsk=;
 b=naJK+sF6BTWwx2gI+Fp66YCAll/8W/IjZ7maOeoXiGnYRhT7yJu0VFGdnprp0DZ06H
 mM+yGyD9z0lVF9t1mR7k0WZOaCfeWcDuh2cc9UYyAZoeYI/oPIPVXpwjusP63QyVyRSn
 xjuPwyi7OZxJ4Lq20qCAh+8RBOPcmYnJanST8fZneUCjiaZEPKRdfg2Nkzi4CKmN4mFQ
 AlamZkC9vNZRlUGMpkhtSenWeJFzVGv9b6GtffaguFjJrOqHW80bBPoue2jOCnkmd1b4
 9fkc6FycbqaoZLI28ocEaXAon5yvjDusDP+pSMWpGCLzcrP/pZpGnyKALPEyHSsyhnrt
 EpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tkZdULlUHpCTLPPLnvYRioU35Xl4oRXIiOGWSipJOsk=;
 b=NjKJknFm+viWwe8ylBKqaflhFnss7i92yRMuJdeffbuX+P0rH1SgnxXxjPrUFA+qPR
 qCP13jUQXuRYPod9XG0BVd/QWModHypUAL6x0FmWHWToLkmbf27QiRZMDozbE4sbEDnH
 7bE7j68GSMjhfe/OWftUndGxreC6Mgop+yc6+xFsWNS8OEg+bIatT0w2BbmDutmAcZVB
 Tqtl7boYvWwG+DcT2xeG71kcBNQy/ab1Fg5Y0pM2LVORLkdhIWl5b9uTqEkfsBgrNO1m
 aLW3RWp5umfU26siHGZvxF4iXUmeSc/kCkoSYoX6filZPMNZ3yezMCBAQssFAvDYNEKg
 SWBQ==
X-Gm-Message-State: AOAM531KkJacFDeLF9qH6ENTcJV2lBIaMU1pPkMWdAgdDIML+mG1IcMq
 XgKZlTrNf7VtIvEJd7eFj4GIfJ4eQBoAYH1zfD2PFiQrPfkzBQ==
X-Google-Smtp-Source: ABdhPJznguuQh7IRu3aSxMyBje/lCbX2oP9c7FXYlVCM9OjqL/sLyOTWgjUOzEQ2GLBt80IA9/rivRT7iPc7Hb/yiYg=
X-Received: by 2002:a05:6a00:2384:b029:19a:eed3:7f42 with SMTP id
 f4-20020a056a002384b029019aeed37f42mr35475427pfc.4.1608176601666; Wed, 16 Dec
 2020 19:43:21 -0800 (PST)
MIME-Version: 1.0
References: <20201216115125.5886-1-chunfeng.yun@mediatek.com>
 <20201216115125.5886-2-chunfeng.yun@mediatek.com>
 <CANMq1KDBmuoBNeizm9+f1yJgqF9oMqU5k26KfZrSdjrPQm_LwA@mail.gmail.com>
 <1608171557.23328.53.camel@mhfsdcap03>
In-Reply-To: <1608171557.23328.53.camel@mhfsdcap03>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 16 Dec 2020 19:43:10 -0800
Message-ID: <CAKxU2N8q1XjDbWbv5ksqYr7RMEedV7fng7OUccVggsT89Oyf5w@mail.gmail.com>
Subject: Re: [PATCH 2/3] usb: xhci-mtk: fix UAS issue by XHCI_BROKEN_STREAMS
 quirk
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_224326_009608_2EB82C00 
X-CRM114-Status: GOOD (  34.10  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 16, 2020 at 6:29 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> On Wed, 2020-12-16 at 20:28 +0800, Nicolas Boichat wrote:
> > On Wed, Dec 16, 2020 at 7:53 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > >
> > > The 0.96 xHCI controller on some platforms does not support
> > > bulk stream even HCCPARAMS says supporting, due to MaxPSASize
> > > is set a non-zero default value by mistake, here use
> > > XHCI_BROKEN_STREAMS quirk to fix it.
> > >
> > > Fixes: 94a631d91ad3 ("usb: xhci-mtk: check hcc_params after adding primary hcd")
> > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > ---
> > >  drivers/usb/host/xhci-mtk.c | 7 ++++++-
> > >  drivers/usb/host/xhci-mtk.h | 1 +
> > >  2 files changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> > > index 8f321f39ab96..08dab974d847 100644
> > > --- a/drivers/usb/host/xhci-mtk.c
> > > +++ b/drivers/usb/host/xhci-mtk.c
> > > @@ -395,6 +395,9 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
> > >         xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
> > >         if (mtk->lpm_support)
> > >                 xhci->quirks |= XHCI_LPM_SUPPORT;
> > > +
> > > +       if (mtk->broken_streams)
> > > +               xhci->quirks |= XHCI_BROKEN_STREAMS;
> > >  }
> > >
> > >  /* called during probe() after chip reset completes */
> > > @@ -460,6 +463,8 @@ static int xhci_mtk_probe(struct platform_device *pdev)
> > >                 return ret;
> > >
> > >         mtk->lpm_support = of_property_read_bool(node, "usb3-lpm-capable");
> > > +       mtk->broken_streams =
> > > +               of_property_read_bool(node, "mediatek,broken_streams_quirk");
> >
> > Would it be better to add a data field to struct of_device_id
> > mtk_xhci_of_match, and enable this quirk on mediatek,mt8173-xhci only?
> This is the common issue for all SoCs (before 2016.06) with 0.96 xHCI
> when the controller don't support bulk stream. If enable this quirk only
> for mt8173, then for other SoCs, the compatible need include
> "mediatek,mt8173-xhci" in dts, this may be not flexible for some cases,
> e.g. a new SoC has the broken stream as mt8173, but also has another
> different quirk, the way you suggested will not handle it.
> And I plan to remove "mediatek,mt8173-xhci" in mtk_xhci_of_match after
> converting the binding to YMAL.
I'm guessing this also applies to mt7621?
>
> >
> > (IMHO usb3-lpm-capable detection should also be done in the same way)
> I prefer to provide a property for common issues, and use the way you
> suggested for the issue only happened at a specific SoC.
>
> Thank you
>
> >
> > Thanks,
> >
> > >         /* optional property, ignore the error if it does not exist */
> > >         of_property_read_u32(node, "mediatek,u3p-dis-msk",
> > >                              &mtk->u3p_dis_msk);
> > > @@ -546,7 +551,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
> > >         if (ret)
> > >                 goto put_usb3_hcd;
> > >
> > > -       if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
> > > +       if (!mtk->broken_streams && HCC_MAX_PSA(xhci->hcc_params) >= 4)
> > >                 xhci->shared_hcd->can_do_streams = 1;
> > >
> > >         ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
> > > diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
> > > index a93cfe817904..86aa4978915e 100644
> > > --- a/drivers/usb/host/xhci-mtk.h
> > > +++ b/drivers/usb/host/xhci-mtk.h
> > > @@ -147,6 +147,7 @@ struct xhci_hcd_mtk {
> > >         struct phy **phys;
> > >         int num_phys;
> > >         bool lpm_support;
> > > +       bool broken_streams;
> > >         /* usb remote wakeup */
> > >         bool uwk_en;
> > >         struct regmap *uwk;
> > > --
> > > 2.18.0
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
