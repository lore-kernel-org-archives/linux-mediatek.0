Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F476C433E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:44:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B5A820EDD
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:44:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lb+Q3/eR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UFlJVSht"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B5A820EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dOVNjCOfmEtjoyhbXKp/P5QAyCQzxtDcujf7/rRItys=; b=Lb+Q3/eRINhkvmAumoxOQkuwp
	wWQvIYZjTL+q7b+dbV4PTcTTajJJQox5vFNu12hao8lpoWJliqA5vXe+PzTnSj/KWHXpvSTNFC+t+
	6bktJjGB2j7y0Wj3K3ULFADVh/rzIZ8G3jQqdS9SQjL0/J97s/OQ3VtvVlLHDUf+TwmckP01My1uR
	2gLLeWxHTiodQTVFcCJekNsBbQWz7YxXAA+kwX1z8f10Ob3gSPHRyhQEk5cIi7zq9W+Q+xwzCo+cV
	ehYBY1IItByw2nUnfzm2WhPBNXdvNYKVKd/ZvHiFl5D4mpO18FrTADHj/VsQMRLUfK10QYNK97JVB
	6V3vdH8/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvHTs-00075u-DR; Tue, 14 Jul 2020 09:44:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvHTq-00075H-H3; Tue, 14 Jul 2020 09:44:07 +0000
X-UUID: 006bd45141f9404d8bc84c38ccb2664b-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=g0vfCKfsVImSYs7pBa71fJvZ3L9cSxC+jFd3c5Ar0OA=; 
 b=UFlJVShtjCXVq2DIUkDLjvUK/ukwROKNcuV5JwNb15OcvyBSqL0en0f9W8cuBl7kvJdJvoHZBLqexNoPTEstlZHtb32R8DS/S9eisfmOxPOWF91RZJ1G6HhIJwumLHwm/04RYRPy+FwkdjIfUQqfin7h1y3l+Z0yizQGxkpSBY8=;
X-UUID: 006bd45141f9404d8bc84c38ccb2664b-20200714
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1872248109; Tue, 14 Jul 2020 01:44:03 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 02:33:58 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 14 Jul 2020 17:33:55 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Jul 2020 17:33:54 +0800
Message-ID: <1594719186.16172.35.camel@mhfsdcap03>
Subject: Re: [PATCH 11/21] iommu/mediatek: Add power-domain operation
From: Yong Wu <yong.wu@mediatek.com>
To: Pi-Hsun Shih <pihsun@chromium.org>
Date: Tue, 14 Jul 2020 17:33:06 +0800
In-Reply-To: <CANdKZ0e3=AeCxpSHVk7daUE01L7AgJYmZ7jeOQDT169SaowL-g@mail.gmail.com>
References: <20200711064846.16007-1-yong.wu@mediatek.com>
 <20200711064846.16007-12-yong.wu@mediatek.com>
 <CANdKZ0e3=AeCxpSHVk7daUE01L7AgJYmZ7jeOQDT169SaowL-g@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4A868CC5672C9E09033785D03A34B39C2AB230B1DC2A9B4BD748D338AF6B73A92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_054406_778911_F66099DB 
X-CRM114-Status: GOOD (  19.32  )
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
Cc: Youlin Pei =?UTF-8?Q?=28=E8=A3=B4=E5=8F=8B=E6=9E=97=29?=
 <youlin.pei@mediatek.com>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 cui.zhang@mediatek.com, srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 open list <linux-kernel@vger.kernel.org>, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-07-13 at 15:03 +0800, Pi-Hsun Shih wrote:
> On Sat, Jul 11, 2020 at 2:51 PM Yong Wu <yong.wu@mediatek.com> wrote:
> >
> > In the previous SoC, the M4U HW is in the EMI power domain which is
> > always on. the latest M4U is in the display power domain which may be
> > turned on/off, thus we have to add pm_runtime interface for it.
> >
> > we should enable its power before M4U hw initial. and disable it after HW
> > initialize.
> >
> > When the engine work, the engine always enable the power and clocks for
> > smi-larb/smi-common, then the M4U's power will always be powered on
> > automatically via the device link with smi-common.
> >
> > Note: we don't enable the M4U power in iommu_map/unmap for tlb flush.
> > If its power already is on, of course it is ok. if the power is off,
> > the main tlb will be reset while M4U power on, thus the tlb flush while
> > m4u power off is unnecessary, just skip it.
> >
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/iommu/mtk_iommu.c | 54 ++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 47 insertions(+), 7 deletions(-)
> > ...
> >         for_each_m4u(data) {
> > +               /* skip tlb flush when pm is not active */
> > +               if (pm_runtime_enabled(data->dev) &&
> > +                   !pm_runtime_active(data->dev))
> > +                       continue;
> > +
> 
> pm_runtime_active(dev) == false implies dev->power.disable_depth == 0,
> which implies pm_runtime_enabled(dev) == true, so the
> pm_runtime_enabled(data->dev) can be omitted here.

Yes. Thanks.
Will fix in next version.

> 
> >                 spin_lock_irqsave(&data->tlb_lock, flags);
> >                 writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
> >                                data->base + data->plat_data->inv_sel_reg);
> > ...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
