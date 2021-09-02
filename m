Return-Path: <SRS0=hgkd=NY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A13BAC4320E
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 09:36:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F89761051
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 09:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F89761051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GOQRIOkcCAOpZZCZ5l2wl7mIzHpy/RUrlqiw3e3SE1Y=; b=tsNapcwsv5leUB
	2RYDXn5a998fa6eTVTxCyV3SI+d4yWBr8VOuxggadfpx9YfAXVQUhiVsGwhpv88I6zpQXjt+3HSUR
	42wo/jfx13xp5bIblIVJsxE+ZpD+wtykxdPv+zBMqi2xs67itOHibWYPGAI5mRf7fr9nZqrVqppaG
	/nFlNAgMt44QcY8kWVFU+ARwFKhptAb3nbyaTgTVdpiRYj2CrgesLariR5JoK7BmIFXPg42D4037z
	+hqADsGd7Q5RAUUZ2F9225ckB6XDyDcMksTavKqgAc4t/aryveXwbQfeIYZX62cpz0VgHNWF75onB
	pqiPuuAqoUVetg/ml6gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLj8P-009816-Ap; Thu, 02 Sep 2021 09:35:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLj8K-0097zu-GZ; Thu, 02 Sep 2021 09:35:48 +0000
X-UUID: 9a12bd8ba74849989e3f306e74b37293-20210902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ZPDQyXrInu0IQssPczuqbUdeSDCOSdcmMPprWdZX5fA=; 
 b=ukqblwj6wBxjKfQ9K3+7xnfsoyB0O6uqn2flde0iLc3SJ6TQLE1O9XpQUD0OXepxMyPaaZMXY3UHBZ1tgk/V3x83glIWsq9IlPJX3vzcsgEqevi5CNtjqfz+DTwBPLoOc30fIZ9IJs7Vhqn//1Gj0gtcjyestb8P90h5A9q995Q=;
X-UUID: 9a12bd8ba74849989e3f306e74b37293-20210902
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 902604847; Thu, 02 Sep 2021 02:35:39 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 02:34:10 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 17:34:09 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Sep 2021 17:34:06 +0800
Message-ID: <eb855d186d572e8a0343456bb5d76797f8f3870f.camel@mediatek.com>
Subject: Re: [PATCH v12 2/6] PCI: mediatek: Add new method to get shared
 pcie-cfg base address
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
CC: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Ryder Lee <ryder.lee@mediatek.com>, "Jianjun
 Wang" <jianjun.wang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, PCI
 <linux-pci@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date: Thu, 2 Sep 2021 17:34:08 +0800
In-Reply-To: <CAL_Jsq+dBi-XUDJD_STP=jWw+RLkRpX1U9XsRMhqK4U1H=0FHw@mail.gmail.com>
References: <20210830214317.GA27606@bjorn-Precision-5520>
 <ccf767340afe13a6d273ad8fbc29c6bc966d6314.camel@mediatek.com>
 <CAL_Jsq+dBi-XUDJD_STP=jWw+RLkRpX1U9XsRMhqK4U1H=0FHw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_023544_598135_36F3C688 
X-CRM114-Status: GOOD (  37.52  )
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

On Tue, 2021-08-31 at 10:17 -0500, Rob Herring wrote:
> On Mon, Aug 30, 2021 at 10:31 PM Chuanjia Liu <
> chuanjia.liu@mediatek.com> wrote:
> > 
> > On Mon, 2021-08-30 at 16:43 -0500, Bjorn Helgaas wrote:
> > > On Mon, Aug 30, 2021 at 03:09:44PM +0800, Chuanjia Liu wrote:
> > > > On Fri, 2021-08-27 at 11:46 -0500, Bjorn Helgaas wrote:
> > > > > On Mon, Aug 23, 2021 at 11:27:56AM +0800, Chuanjia Liu wrote:
> > > > > > @@ -995,6 +1004,14 @@ static int
> > > > > > mtk_pcie_subsys_powerup(struct
> > > > > > mtk_pcie *pcie)
> > > > > >                         return PTR_ERR(pcie->base);
> > > > > >         }
> > > > > > 
> > > > > > +       cfg_node = of_find_compatible_node(NULL, NULL,
> > > > > > +                                          "mediatek,generi
> > > > > > c-
> > > > > > pciecfg");
> > > > > > +       if (cfg_node) {
> > > > > > +               pcie->cfg =
> > > > > > syscon_node_to_regmap(cfg_node);
> > > > > 
> > > > > Other drivers in drivers/pci/controller/ use
> > > > > syscon_regmap_lookup_by_phandle() (j721e, dra7xx, keystone,
> > > > > layerscape, artpec6) or syscon_regmap_lookup_by_compatible()
> > > > > (imx6,
> > > > > kirin, v3-semi).
> > > > > 
> > > > > You should do it the same way unless there's a need to be
> > > > > different.
> > > > 
> > > > I have used phandle, but Rob suggested to search for the node
> > > > by
> > > > compatible.
> > > > The reason why syscon_regmap_lookup_by_compatible() is not
> > > > used here is that the pciecfg node is optional, and there is no
> > > > need to
> > > > return error when the node is not searched.
> > > 
> > > How about this?
> > > 
> > >   regmap = syscon_regmap_lookup_by_compatible("mediatek,generic-
> > > pciecfg");
> > >   if (!IS_ERR(regmap))
> > >     pcie->cfg = regmap;
> 
> +1
> 
> > 
> > Hi Bjorn,
> > 
> > We need to deal with three situations
> > 1) No error
> > 2) The error of the node not found, don't do anything
> > 3) Other errors, return errors
> > 
> > I guess you mean
> > 
> > regmap = syscon_regmap_lookup_by_compatible("mediatek,generic-
> > pciecfg");
> >   if (!IS_ERR(regmap))
> >       pcie->cfg = regmap;
> >   else if (IS_ERR(regmap) && PTR_ERR(regmap) != -ENODEV)
> 
> You already know  IS_ERR is true here.
> 
> >       return PTR_ERR(regmap);
> 
> syscon_regmap_lookup_by_compatible_optional is the function you are
> looking for. The _optional flavor doesn't exist, so create it. There
> is one for the phandle lookup.
> 
> > 
> > I'm not sure if we need this, it seems a little weird and there are
> > many drivers in other subsystems that use syscon_node_to_regmap().
> 
> You are implementing the exact same sequence that
> syscon_regmap_lookup_by_compatible() does, so clearly you should be
> using it. The one difference is you forgot the of_node_put().

Hi,Rob
Thanks for your explanation. You're right. 
Now I understand use syscon_regmap_lookup_by_compatible() is a better
way. I'll follow your advice
 
regmap = syscon_regmap_lookup_by_compatible("mediatek,generic-
pciecfg");
if (!IS_ERR(regmap))
	pcie->cfg = regmap;
else if (PTR_ERR(regmap) != -ENODEV)
	return PTR_ERR(regmap);

Best regards
Chuanjia
 
> 
> Rob
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
