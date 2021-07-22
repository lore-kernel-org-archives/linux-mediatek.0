Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD49C6377D
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 06:39:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DC47610F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 06:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DC47610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oua/B5+9g1XOsTc3RKcDkhkcW0JJZzYgIry5qo1bSFM=; b=4cEAu9EhTjUIIF
	Zer8727yYNhdj+zAnmu0+/kjXd/keLW/TjF1OvQj/zo0dCgJKOPsiRtV/7p++8S2rPwat4JB3Wp1f
	BdpAQKFygLtORULTJV3WPv902uEG2YkzLCG7pAYvmAC5tDLF4CxlGyEpjV08mzh66vvCecf2nDYNM
	0I2VbcjahOdV4tl7VCeQ/13mzOA/vmv3RRFWC8KJpFKEKeGcgNJz9hVTQ49Zqn0k3L1uqySdWteAe
	QwuOWEtmRHbKztDnBwwcY4+ufFgXY7qchceKKm4BV19+dMGJyotJ1e3LiEo1VkRFh0mEUBYa2dqFC
	Wu1fHqYQboILmdoNxzQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6SM4-000Pol-Lw; Thu, 22 Jul 2021 06:38:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6SLn-000Phg-3K; Thu, 22 Jul 2021 06:38:32 +0000
X-UUID: 7d2299df7995473e95771f1064eaf3ee-20210721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=E0/21i/rjqYJSvlRFf3hf7vSNWScyQPpeAG8uBlbP3o=; 
 b=AzDdA2JmY3JXcQjf4KRlTgeOVef8J0NRQ3sCNkds955AhMpRPyKxdWAhlLsv2RR1Soao421TCNDa6m/3HxVde2JN8NhwO/j2H6bjU8xgSbLame2sHJLVCQlfJ90zMzYmDqDsl4y9RRKw383zRBumVdSWM6JEaeqUSsvGykRM+To=;
X-UUID: 7d2299df7995473e95771f1064eaf3ee-20210721
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1533512237; Wed, 21 Jul 2021 23:38:27 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Jul 2021 23:38:25 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs07n1.mediatek.inc
 (172.21.101.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 22 Jul 2021 14:38:24 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Jul 2021 14:38:22 +0800
Message-ID: <1626935902.27875.7.camel@mhfsdcap03>
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
Date: Thu, 22 Jul 2021 14:38:22 +0800
In-Reply-To: <CAATdQgAfo9oNR5=ogEottHajODngi1ahvKUnEOUczzjreYpPcQ@mail.gmail.com>
References: <20210715121209.31024-1-yong.wu@mediatek.com>
 <20210715121209.31024-12-yong.wu@mediatek.com>
 <CAATdQgAfo9oNR5=ogEottHajODngi1ahvKUnEOUczzjreYpPcQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_233831_243671_9F42C92F 
X-CRM114-Status: GOOD (  21.66  )
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

On Wed, 2021-07-21 at 21:40 +0800, Ikjoon Jang wrote:
> On Thu, Jul 15, 2021 at 8:23 PM Yong Wu <yong.wu@mediatek.com> wrote:
> >
> > To improve the performance, We add some initial setting for smi larbs.
> > there are two part:
> > 1), Each port has the special ostd(outstanding) value in each larb.
> > 2), Two general setting for each larb.
> >
> > In some SoC, this setting maybe changed dynamically for some special case
> > like 4K, and this initial setting is enough in mt8195.
> >
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
[...]
> >  struct mtk_smi {
> > @@ -213,12 +228,22 @@ static void mtk_smi_larb_config_port_mt8173(struct device *dev)
> >  static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
> >  {
> >         struct mtk_smi_larb *larb = dev_get_drvdata(dev);
> > -       u32 reg;
> > +       u32 reg, flags_general = larb->larb_gen->flags_general;
> > +       const u8 *larbostd = larb->larb_gen->ostd[larb->larbid];
> >         int i;
> >
> >         if (BIT(larb->larbid) & larb->larb_gen->larb_direct_to_common_mask)
> >                 return;
> >
> > +       if (MTK_SMI_CAPS(flags_general, MTK_SMI_FLAG_LARB_THRT_EN))
> > +               writel_relaxed(SMI_LARB_THRT_EN, larb->base + SMI_LARB_CMD_THRT_CON);
> > +
> > +       if (MTK_SMI_CAPS(flags_general, MTK_SMI_FLAG_LARB_SW_FLAG))
> > +               writel_relaxed(SMI_LARB_SW_FLAG_1, larb->base + SMI_LARB_SW_FLAG);
> > +
> > +       for (i = 0; i < SMI_LARB_PORT_NR_MAX && larbostd && !!larbostd[i]; i++)
> > +               writel_relaxed(larbostd[i], larb->base + SMI_LARB_OSTDL_PORTx(i));
> 
> All other mtk platform's larbs have the same format for SMI_LARB_OSTDL_PORTx()
> registers at the same offset? or is this unique feature for mt8195?

All the other Platform's larbs have the same format at the same offset.

> 
> > +
> >         for_each_set_bit(i, (unsigned long *)larb->mmu, 32) {
> >                 reg = readl_relaxed(larb->base + SMI_LARB_NONSEC_CON(i));
> >                 reg |= F_MMU_EN;
> > @@ -227,6 +252,51 @@ static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
> >         }
> >  }
> >

[...]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
