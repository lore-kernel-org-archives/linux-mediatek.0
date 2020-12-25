Return-Path: <SRS0=56RK=F5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E14C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Dec 2020 06:12:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D39A821D7A
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Dec 2020 06:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D39A821D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yK0HbdN6iVsa/8eaIexhhl0LLYc/ynw9sctGTVIzChE=; b=KA/luYq5WrOereTI+9JdckEYn
	DjtakofNFW5AA2Zgr3I4zQ9uZOB5z+2a+YbMri4W4PE5K9YkXesQT4sK/Ryjd1mm4qPoz6wtXH7S3
	V0iEyTKIxzXWUlSVawGF7uHaTdy2AyvnQi9KJoanIbpg+3QtYvgnviniGZDKKnI06j9Qm7TTIHgZa
	8uPiQVr4Pw9ga2bOVhIjIHjbB5sDQceBgV3M948/ANpYYqAW4eCUUSECoA9fUk7abT2hBgdyUn74x
	KPkCx/n+USYXX6l7U+SX51T275bgIrOQ8SOdMLH2LzMwKJRpJFGCRc+oZ1jOZlYgCyTbZIKIyZpX8
	+2PUeNIog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksgLG-00082z-Fm; Fri, 25 Dec 2020 06:12:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksgLD-00082H-Lk; Fri, 25 Dec 2020 06:12:45 +0000
X-UUID: a9c09c5950384cc0a9b577bba282bc7e-20201224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6uQYTXdICvOcbpvLdkCR21Rtp+nLkicnEhalJcMTfBQ=; 
 b=osOE7VGB949RFAaD3VNFajzl5u1GmD2MOt/1guYmkSjchc2IOemPgpCIVSZ0T0zOWo3BI68mUWRjyVresfCP1Mg5g3ofgIDiQA0lMgYog6ArMdj6OO1JSP2x3C/pzQTklyvTOqPWVXp4/0C8eHTi2K2QcAL5kdboTXi/Que9xfY=;
X-UUID: a9c09c5950384cc0a9b577bba282bc7e-20201224
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1240789920; Thu, 24 Dec 2020 22:12:36 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 22:12:34 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 25 Dec 2020 14:12:22 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Dec 2020 14:12:22 +0800
Message-ID: <1608876743.7499.38.camel@mhfsdcap03>
Subject: Re: [PATCH 2/3] usb: xhci-mtk: fix UAS issue by XHCI_BROKEN_STREAMS
 quirk
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Fri, 25 Dec 2020 14:12:23 +0800
In-Reply-To: <20201221193533.GB407645@robh.at.kernel.org>
References: <20201216115125.5886-1-chunfeng.yun@mediatek.com>
 <20201216115125.5886-2-chunfeng.yun@mediatek.com>
 <CANMq1KDBmuoBNeizm9+f1yJgqF9oMqU5k26KfZrSdjrPQm_LwA@mail.gmail.com>
 <1608171557.23328.53.camel@mhfsdcap03>
 <CANMq1KA4L4PPRgHTmeisfSWu4qgjgNVFZRvxeuAOyq2_TimELA@mail.gmail.com>
 <1608186230.23328.78.camel@mhfsdcap03>
 <20201221193533.GB407645@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: CC79322889513D177F84654F153801002F6ADCE607B6FD4D675B9BFE8D94AAAF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201225_011243_931913_0812FA05 
X-CRM114-Status: GOOD (  36.64  )
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
 lkml <linux-kernel@vger.kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-12-21 at 12:35 -0700, Rob Herring wrote:
> On Thu, Dec 17, 2020 at 02:23:50PM +0800, Chunfeng Yun wrote:
> > On Thu, 2020-12-17 at 11:32 +0800, Nicolas Boichat wrote:
> > > On Thu, Dec 17, 2020 at 10:19 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > > >
> > > > On Wed, 2020-12-16 at 20:28 +0800, Nicolas Boichat wrote:
> > > > > On Wed, Dec 16, 2020 at 7:53 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > > > > >
> > > > > > The 0.96 xHCI controller on some platforms does not support
> > > > > > bulk stream even HCCPARAMS says supporting, due to MaxPSASize
> > > > > > is set a non-zero default value by mistake, here use
> > > > > > XHCI_BROKEN_STREAMS quirk to fix it.
> > > > > >
> > > > > > Fixes: 94a631d91ad3 ("usb: xhci-mtk: check hcc_params after adding primary hcd")
> > > > > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > > > > ---
> > > > > >  drivers/usb/host/xhci-mtk.c | 7 ++++++-
> > > > > >  drivers/usb/host/xhci-mtk.h | 1 +
> > > > > >  2 files changed, 7 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> > > > > > index 8f321f39ab96..08dab974d847 100644
> > > > > > --- a/drivers/usb/host/xhci-mtk.c
> > > > > > +++ b/drivers/usb/host/xhci-mtk.c
> > > > > > @@ -395,6 +395,9 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
> > > > > >         xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
> > > > > >         if (mtk->lpm_support)
> > > > > >                 xhci->quirks |= XHCI_LPM_SUPPORT;
> > > > > > +
> > > > > > +       if (mtk->broken_streams)
> > > > > > +               xhci->quirks |= XHCI_BROKEN_STREAMS;
> > > > > >  }
> > > > > >
> > > > > >  /* called during probe() after chip reset completes */
> > > > > > @@ -460,6 +463,8 @@ static int xhci_mtk_probe(struct platform_device *pdev)
> > > > > >                 return ret;
> > > > > >
> > > > > >         mtk->lpm_support = of_property_read_bool(node, "usb3-lpm-capable");
> > > > > > +       mtk->broken_streams =
> > > > > > +               of_property_read_bool(node, "mediatek,broken_streams_quirk");
> > > > >
> > > > > Would it be better to add a data field to struct of_device_id
> > > > > mtk_xhci_of_match, and enable this quirk on mediatek,mt8173-xhci only?
> > > > This is the common issue for all SoCs (before 2016.06) with 0.96 xHCI
> > > > when the controller don't support bulk stream. If enable this quirk only
> > > > for mt8173, then for other SoCs, the compatible need include
> > > > "mediatek,mt8173-xhci" in dts, this may be not flexible for some cases,
> > > > e.g. a new SoC has the broken stream as mt8173, but also has another
> > > > different quirk, the way you suggested will not handle it.
> > > 
> > > It can, we do this regularly for many other components. One example:
> > > https://elixir.bootlin.com/linux/latest/source/drivers/i2c/busses/i2c-mt65xx.c#L402
> > > 
> > Got it. Indeed works when add compatible private data.
> > 
> > Due to many SoCs supports USB and not upstream, I'd prefer to avoid
> > adding new compatible in driver when support new SoCs, and leave the
> > code as simple as possible.
> 
> No. The problem is adding new fixes requires updating the DT. That would 
> be fine if you knew all possible issues and quirks up front. You may for 
> some, but you won't catch them all.
Yes.
But all SoCs use the generic compatible "mediatek,mtk-xhci" except
mtk8173. as following:
compatible = "mediatek,mt<SoC>-xhci", "mediatek,mtk-xhci";

It may be a little messy when the driver fill many compatibles after
supporting several tens or hundreds SoCs.

I'll think about it again. 
> 
> Save DT properties for per board quirks/features, not per SoC ones.
This is for USB IP quirks/feature, not board or SoC

Thanks

> 
> > 
> > > > And I plan to remove "mediatek,mt8173-xhci" in mtk_xhci_of_match after
> > > > converting the binding to YMAL.
> > > >
> > > > >
> > > > > (IMHO usb3-lpm-capable detection should also be done in the same way)
> 
> I tend to agree, but am more tolerable of standard USB features than 
> specific IP block quirks.
> 
> Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
