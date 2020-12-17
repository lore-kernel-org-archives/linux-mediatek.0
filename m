Return-Path: <SRS0=e3uk=FV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C3AC4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 06:29:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 701BB2311F
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 06:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 701BB2311F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6HPOOIV+Yw9IVatTbULrlcstrCAe2QO3m2ZXQu627cA=; b=O17TxTfJZj0y7Aq9br2vpKnxp
	nkZXwXXti/PIL1LP86NMrsEGmN8dLQo1C+mj6HbXAQJFyumx3RxYV2tHA8pxc3XZNprL7qZdH/s0F
	ynD3+8C3P4OHyCp68FLXeG9mY5qkm+r5xl0+yg4ufXM+B3uwtVDYJ3Az0S1sPB2v9wDvdJsgt07xz
	PtZJCchGQ3ND5N9xdrVWSOF6ua94sRqVr2izDWd4GaKfpXKyxkk1foLqX9P3UKtZqLhRYrP7YepUD
	0SMWodAaEiv54OocsEfQ0z8DVCXGc9yjLsY/ymzYQQBP61sGfq4v5BoNvPLfC3dzvEqUo2eVFemkm
	D+SUXtDSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpmn2-0008Vg-4h; Thu, 17 Dec 2020 06:29:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpmmy-0008UY-B9; Thu, 17 Dec 2020 06:29:27 +0000
X-UUID: 64884c0e1f174eb4a6674a2690d277d5-20201216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=RV8fWtJixVJsdBrLusXjxNOKP7+KPKBTMLVxNEwmSh4=; 
 b=j0xQzTCC89Kq8wj2X7iVl9V6/o5AR8PwmGY7jE2ZpEre1l9crgwnXTxYDWhEHvCZBaCvtlcj67EPD+6fmAeYpHRE1YdtGQIgvBpyg7AbGv3Ck35OTExSLmAj+6sNrZf7wmDqvoiAd/wABPg5+Kh+tU87c7kKkVhnclLjDFw+bTs=;
X-UUID: 64884c0e1f174eb4a6674a2690d277d5-20201216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1927567513; Wed, 16 Dec 2020 22:29:10 -0800
Received: from MTKMBS32N2.mediatek.inc (172.27.4.72) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 22:23:55 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Dec 2020 14:23:50 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Dec 2020 14:23:50 +0800
Message-ID: <1608186230.23328.78.camel@mhfsdcap03>
Subject: Re: [PATCH 2/3] usb: xhci-mtk: fix UAS issue by XHCI_BROKEN_STREAMS
 quirk
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 17 Dec 2020 14:23:50 +0800
In-Reply-To: <CANMq1KA4L4PPRgHTmeisfSWu4qgjgNVFZRvxeuAOyq2_TimELA@mail.gmail.com>
References: <20201216115125.5886-1-chunfeng.yun@mediatek.com>
 <20201216115125.5886-2-chunfeng.yun@mediatek.com>
 <CANMq1KDBmuoBNeizm9+f1yJgqF9oMqU5k26KfZrSdjrPQm_LwA@mail.gmail.com>
 <1608171557.23328.53.camel@mhfsdcap03>
 <CANMq1KA4L4PPRgHTmeisfSWu4qgjgNVFZRvxeuAOyq2_TimELA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: ED6A86936AB121403639494CDB402CE4A1CF19B2194A5888403A55922E4C5A1A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_012924_576717_8CFE04B8 
X-CRM114-Status: GOOD (  38.60  )
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
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, Hsin-Yi
 Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-12-17 at 11:32 +0800, Nicolas Boichat wrote:
> On Thu, Dec 17, 2020 at 10:19 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> >
> > On Wed, 2020-12-16 at 20:28 +0800, Nicolas Boichat wrote:
> > > On Wed, Dec 16, 2020 at 7:53 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > > >
> > > > The 0.96 xHCI controller on some platforms does not support
> > > > bulk stream even HCCPARAMS says supporting, due to MaxPSASize
> > > > is set a non-zero default value by mistake, here use
> > > > XHCI_BROKEN_STREAMS quirk to fix it.
> > > >
> > > > Fixes: 94a631d91ad3 ("usb: xhci-mtk: check hcc_params after adding primary hcd")
> > > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > > ---
> > > >  drivers/usb/host/xhci-mtk.c | 7 ++++++-
> > > >  drivers/usb/host/xhci-mtk.h | 1 +
> > > >  2 files changed, 7 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> > > > index 8f321f39ab96..08dab974d847 100644
> > > > --- a/drivers/usb/host/xhci-mtk.c
> > > > +++ b/drivers/usb/host/xhci-mtk.c
> > > > @@ -395,6 +395,9 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
> > > >         xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
> > > >         if (mtk->lpm_support)
> > > >                 xhci->quirks |= XHCI_LPM_SUPPORT;
> > > > +
> > > > +       if (mtk->broken_streams)
> > > > +               xhci->quirks |= XHCI_BROKEN_STREAMS;
> > > >  }
> > > >
> > > >  /* called during probe() after chip reset completes */
> > > > @@ -460,6 +463,8 @@ static int xhci_mtk_probe(struct platform_device *pdev)
> > > >                 return ret;
> > > >
> > > >         mtk->lpm_support = of_property_read_bool(node, "usb3-lpm-capable");
> > > > +       mtk->broken_streams =
> > > > +               of_property_read_bool(node, "mediatek,broken_streams_quirk");
> > >
> > > Would it be better to add a data field to struct of_device_id
> > > mtk_xhci_of_match, and enable this quirk on mediatek,mt8173-xhci only?
> > This is the common issue for all SoCs (before 2016.06) with 0.96 xHCI
> > when the controller don't support bulk stream. If enable this quirk only
> > for mt8173, then for other SoCs, the compatible need include
> > "mediatek,mt8173-xhci" in dts, this may be not flexible for some cases,
> > e.g. a new SoC has the broken stream as mt8173, but also has another
> > different quirk, the way you suggested will not handle it.
> 
> It can, we do this regularly for many other components. One example:
> https://elixir.bootlin.com/linux/latest/source/drivers/i2c/busses/i2c-mt65xx.c#L402
> 
Got it. Indeed works when add compatible private data.

Due to many SoCs supports USB and not upstream, I'd prefer to avoid
adding new compatible in driver when support new SoCs, and leave the
code as simple as possible.

> > And I plan to remove "mediatek,mt8173-xhci" in mtk_xhci_of_match after
> > converting the binding to YMAL.
> >
> > >
> > > (IMHO usb3-lpm-capable detection should also be done in the same way)
> > I prefer to provide a property for common issues, and use the way you
> > suggested for the issue only happened at a specific SoC.
> 
> Understand, it's just different approaches, 
Yes

> there seems to be
> precedent (at least in this driver/binding) for using properties, so
> I'll let the USB maintainers speak up ,-)
> 
> >
> > Thank you
> >
> > >
> > > Thanks,
> > >
> > > >         /* optional property, ignore the error if it does not exist */
> > > >         of_property_read_u32(node, "mediatek,u3p-dis-msk",
> > > >                              &mtk->u3p_dis_msk);
> > > > @@ -546,7 +551,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
> > > >         if (ret)
> > > >                 goto put_usb3_hcd;
> > > >
> > > > -       if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
> > > > +       if (!mtk->broken_streams && HCC_MAX_PSA(xhci->hcc_params) >= 4)
> > > >                 xhci->shared_hcd->can_do_streams = 1;
> > > >
> > > >         ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
> > > > diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
> > > > index a93cfe817904..86aa4978915e 100644
> > > > --- a/drivers/usb/host/xhci-mtk.h
> > > > +++ b/drivers/usb/host/xhci-mtk.h
> > > > @@ -147,6 +147,7 @@ struct xhci_hcd_mtk {
> > > >         struct phy **phys;
> > > >         int num_phys;
> > > >         bool lpm_support;
> > > > +       bool broken_streams;
> > > >         /* usb remote wakeup */
> > > >         bool uwk_en;
> > > >         struct regmap *uwk;
> > > > --
> > > > 2.18.0
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
