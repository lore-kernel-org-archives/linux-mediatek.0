Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EDEC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 06:42:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E4A961019
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 06:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E4A961019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Stp4+g9O25YKPzrGM+BZ8wUyiG2r+NSRKCyOFQnjcY=; b=A0oBrtgoDJUoG7
	RUaKPP969q1+HOCdF/W10/8RBzS+QfCMa9VWp+tfWHdcCXL+jQ4uUYNDYoJKUejFjcHz5e/zj/9oH
	JxLnAAgIuTJhibJn9PdfhGn2fHCYWhLLdyzjhV3fgKMsq6LIcA2OakQbcww8hvIHGxaVrEdi89Ngk
	UpAOt2W6HwxPZlRikewZTWbYpWvlN4TCxNvndxLSpsm9fXd1G0PulTDJ7vEK5GTHN+tayKUDaQIpJ
	+fm19+L4k0ZnWHCEtpXNuLWxh0XrNBZnfe7yKCL5fuVVKFJejADnO8xpn4avgshxtdudcEhgSNgug
	Z29BODC56DrMdMw9e9+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8zjs-003GV5-SQ; Thu, 29 Jul 2021 06:41:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8zjq-003GUL-CF; Thu, 29 Jul 2021 06:41:52 +0000
X-UUID: a8748e5678e3482f872ca5766ef65b28-20210728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=OVLK3H5y5iwA63PL1InnEGJOkT0m5xgZgp18ut59SDc=; 
 b=YvmL2EEDeBsnxfEGzPpgElS3DnAmPGxXUfZI+SajdwDwRufewozPnohsltjt2ur8a6ZwvLIgUrMTt5k753cjdqLT/0NWCKBkTgIKosKyImbv0860S6Fnve6QVbopskyGzxtDa++EiNRfefvgZIE7B0YaEUnMKQRSNWuOCN9c7R0=;
X-UUID: a8748e5678e3482f872ca5766ef65b28-20210728
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 129795884; Wed, 28 Jul 2021 23:41:46 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 23:41:44 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 14:41:43 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Jul 2021 14:41:42 +0800
Message-ID: <1627540902.13818.3.camel@mhfsdcap03>
Subject: Re: [PATCH v2 11/11] memory: mtk-smi: mt8195: Add initial setting
 for smi-larb
From: Yong Wu <yong.wu@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Tomasz Figa
 <tfiga@chromium.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>
Date: Thu, 29 Jul 2021 14:41:42 +0800
In-Reply-To: <1626935902.27875.7.camel@mhfsdcap03>
References: <20210715121209.31024-1-yong.wu@mediatek.com>
 <20210715121209.31024-12-yong.wu@mediatek.com>
 <CAATdQgAfo9oNR5=ogEottHajODngi1ahvKUnEOUczzjreYpPcQ@mail.gmail.com>
 <1626935902.27875.7.camel@mhfsdcap03>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_234150_469152_797A08E3 
X-CRM114-Status: GOOD (  23.24  )
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

Hi Ikjoon,

Just a ping.

On Thu, 2021-07-22 at 14:38 +0800, Yong Wu wrote:
> On Wed, 2021-07-21 at 21:40 +0800, Ikjoon Jang wrote:
> > On Thu, Jul 15, 2021 at 8:23 PM Yong Wu <yong.wu@mediatek.com> wrote:
> > >
> > > To improve the performance, We add some initial setting for smi larbs.
> > > there are two part:
> > > 1), Each port has the special ostd(outstanding) value in each larb.
> > > 2), Two general setting for each larb.
> > >
> > > In some SoC, this setting maybe changed dynamically for some special case
> > > like 4K, and this initial setting is enough in mt8195.
> > >
> > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > ---
> [...]
> > >  struct mtk_smi {
> > > @@ -213,12 +228,22 @@ static void mtk_smi_larb_config_port_mt8173(struct device *dev)
> > >  static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
> > >  {
> > >         struct mtk_smi_larb *larb = dev_get_drvdata(dev);
> > > -       u32 reg;
> > > +       u32 reg, flags_general = larb->larb_gen->flags_general;
> > > +       const u8 *larbostd = larb->larb_gen->ostd[larb->larbid];
> > >         int i;
> > >
> > >         if (BIT(larb->larbid) & larb->larb_gen->larb_direct_to_common_mask)
> > >                 return;
> > >
> > > +       if (MTK_SMI_CAPS(flags_general, MTK_SMI_FLAG_LARB_THRT_EN))
> > > +               writel_relaxed(SMI_LARB_THRT_EN, larb->base + SMI_LARB_CMD_THRT_CON);
> > > +
> > > +       if (MTK_SMI_CAPS(flags_general, MTK_SMI_FLAG_LARB_SW_FLAG))
> > > +               writel_relaxed(SMI_LARB_SW_FLAG_1, larb->base + SMI_LARB_SW_FLAG);
> > > +
> > > +       for (i = 0; i < SMI_LARB_PORT_NR_MAX && larbostd && !!larbostd[i]; i++)
> > > +               writel_relaxed(larbostd[i], larb->base + SMI_LARB_OSTDL_PORTx(i));
> > 
> > All other mtk platform's larbs have the same format for SMI_LARB_OSTDL_PORTx()
> > registers at the same offset? or is this unique feature for mt8195?
> 
> All the other Platform's larbs have the same format at the same offset.

In this case, Do you have some other further comment? If no, I will keep
the current solution for this.

Thanks.

> 
> > 
> > > +
> > >         for_each_set_bit(i, (unsigned long *)larb->mmu, 32) {
> > >                 reg = readl_relaxed(larb->base + SMI_LARB_NONSEC_CON(i));
> > >                 reg |= F_MMU_EN;
> > > @@ -227,6 +252,51 @@ static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
> > >         }
> > >  }
> > >
> 
> [...]
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
