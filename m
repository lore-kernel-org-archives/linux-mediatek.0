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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F5FC63793
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 06:39:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D45A610F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 06:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D45A610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oUVoWQrX7qa85pBebNJpjuQW0oQA0qfu7CX7fsa14I4=; b=jTjcRZmuKzputI
	n++6SbM3x+SpHyzbctmvA4qLPoz5RSjHhLiig6YFA4qik4XeO/st36ZejIOJhcEYe+FQ/dA549uRm
	1H9MNMCHcKUn55EM84VhVVneH8nF3kqXH2iktTrlycFzw+nGeHt3dp4rbfJPLLm6AvkEzDwaI2buz
	2ttMyfwYSkf4lvtjb4+R04CTQ8/ebEe9yHGwpvGfKh4L/Xca31G4C75jsZnuyCIW7J5ir4Flov17U
	faap2csbKA3B613bkrSWkfEkLNbOf9QjnRJFt6nvHH8XbWm+/xWyLOAZxGZfYmOdAlSjOwPg7HGgX
	Lq/BmdzhNBrodNnfAysQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6SMO-000Pvq-4j; Thu, 22 Jul 2021 06:39:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6SM7-000Ppd-6o; Thu, 22 Jul 2021 06:38:52 +0000
X-UUID: d4486c138ec94694b3b2710e33cda605-20210721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=W5iu4yn7qNOz8O4L5niY76z7dUrVPoTbT38cQYHyaGE=; 
 b=BsWI1Hd7SbxRaMAXdov9QsxTyPV6BzFs5VDH04IK0r9b4xYMEQpeb/vN2AmR5j7uxy9TYCKZ9jPCOSnt9uOhcZ98l2E/7n7c5YdAC7OU6A02CyIePAqWmBIbSwimgy3uay0fgp8cINwZA91z3s2kul1rkciS2RWIi7VYlkcitB8=;
X-UUID: d4486c138ec94694b3b2710e33cda605-20210721
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 989251646; Wed, 21 Jul 2021 23:38:43 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Jul 2021 23:38:41 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 22 Jul 2021 14:38:34 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Jul 2021 14:38:33 +0800
Message-ID: <1626935913.27875.8.camel@mhfsdcap03>
Subject: Re: [PATCH v2 10/11] memory: mtk-smi: mt8195: Add initial setting
 for smi-common
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
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>,
 <anthony.huang@mediatek.com>
Date: Thu, 22 Jul 2021 14:38:33 +0800
In-Reply-To: <CAATdQgDOGW7nudDoR5UPbax+d3e9omhPstrNd_FCPLd+96ZC9w@mail.gmail.com>
References: <20210715121209.31024-1-yong.wu@mediatek.com>
 <20210715121209.31024-11-yong.wu@mediatek.com>
 <CAATdQgDOGW7nudDoR5UPbax+d3e9omhPstrNd_FCPLd+96ZC9w@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 09C7E65E6584ADFA42B61DD670F9B1049F10F210E285069CFBA433B0E7C4F5862000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_233851_312474_F299645F 
X-CRM114-Status: GOOD (  28.23  )
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

On Wed, 2021-07-21 at 20:54 +0800, Ikjoon Jang wrote:
> On Thu, Jul 15, 2021 at 8:25 PM Yong Wu <yong.wu@mediatek.com> wrote:
> >
> > To improve the performance, add initial setting for smi-common.
> > some register use some fix setting(suggested from DE).
> >
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/memory/mtk-smi.c | 42 ++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 38 insertions(+), 4 deletions(-)

[...]

> >  static const struct mtk_smi_common_plat mtk_smi_sub_common_mt8195 = {
> > @@ -530,15 +558,21 @@ static int mtk_smi_common_remove(struct platform_device *pdev)
> >  static int __maybe_unused mtk_smi_common_resume(struct device *dev)
> >  {
> >         struct mtk_smi *common = dev_get_drvdata(dev);
> > -       u32 bus_sel = common->plat->bus_sel;
> > -       int ret;
> > +       const struct mtk_smi_reg_pair *init = common->plat->init;
> > +       u32 bus_sel = common->plat->bus_sel; /* default is 0 */
> > +       int ret, i;
> >
> >         ret = clk_bulk_prepare_enable(common->clk_num, common->clks);
> >         if (ret)
> >                 return ret;
> >
> > -       if (common->plat->type == MTK_SMI_GEN2 && bus_sel)
> > -               writel(bus_sel, common->base + SMI_BUS_SEL);
> > +       if (common->plat->type != MTK_SMI_GEN2)
> > +               return 0;
> > +
> > +       for (i = 0; i < SMI_COMMON_INIT_REGS_NR && init && init[i].offset; i++)
> > +               writel_relaxed(init[i].value, common->base + init[i].offset);
> 
> I'm not sure this array for register settings could be applied to other
> platforms in future or only applied to mt8195. If it's only for mt8195,

The other platforms have the nearly same setting.

> I think taking callback function instead of mtk_smi_reg_pair[] as init member
> would be better:
> 
> if (common->plat->init)
>     common->plat->init(...);
> 
> > +
> > +       writel(bus_sel, common->base + SMI_BUS_SEL);
> >         return 0;
> >  }
> >
> > --
> > 2.18.0
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
