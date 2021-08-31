Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E5E5C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 03:44:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00BAD60E98
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 03:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00BAD60E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4FpxZ28zcHmpieX3E0ey5/nlrBpHl+o1VQPUd9ESt1I=; b=hBk4Dwm9vmqc+j
	06gxFeQTXu8zBpTJwhYKdqitmpodJ5wSSWUI2tnGTKIC7qGSQIQc4qRtjor/DWAThFaBPg6SPXa87
	prk5X4K+OEmWV2FsKF5DCbUJwj2nCe3AzIktjYANnttCkGlYBT7LbF+7TjeLGn0vj5qO8rZqVyFTH
	X8hy3Z32QzzRnJw7y/FAiscNZ6oRCwE+HzQLGIKjcSZm6oEEsmMX0bo46oT/B4XvnzyP1GxBfnNzO
	bZyIaQ/hXxgeidaZfTPkbbEgds123k0D9VgI4Dg9TM3OkOrpxza5571RLwT+qbxLVigmPyt1m9PFd
	F/VMFGiGzldmFqqarQAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKuhY-001Ed8-Lg; Tue, 31 Aug 2021 03:44:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKuY1-001C4i-PF; Tue, 31 Aug 2021 03:34:57 +0000
X-UUID: 4a401612270f4c4dab15c4614eeb3606-20210830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=i4ol5vbanD813f/B2tnhhHkAIPJlnC/VEEVt1TAFHhI=; 
 b=Nf9ll2G683B/PC68VzwDAXf23DlS16J6bAEC4tvJLaUk8r27D3V3DJcudrdqv/Omhb1+m/E9jLUMnrFXfVXE2wmXO0Yg+0fjbYdre+0dByF8RDlM1IkriZPPN4nfN+V1lUZ/+HKJtsmVOHuB+TV15Ceb/gzQRWBrVYiZogbKbcE=;
X-UUID: 4a401612270f4c4dab15c4614eeb3606-20210830
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1843624087; Mon, 30 Aug 2021 20:34:52 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 20:31:25 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 31 Aug 2021 11:31:23 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 31 Aug 2021 11:31:22 +0800
Message-ID: <ccf767340afe13a6d273ad8fbc29c6bc966d6314.camel@mediatek.com>
Subject: Re: [PATCH v12 2/6] PCI: mediatek: Add new method to get shared
 pcie-cfg base address
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <robh+dt@kernel.org>, <bhelgaas@google.com>, <matthias.bgg@gmail.com>,
 <lorenzo.pieralisi@arm.com>, <ryder.lee@mediatek.com>,
 <jianjun.wang@mediatek.com>, <yong.wu@mediatek.com>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Date: Tue, 31 Aug 2021 11:31:24 +0800
In-Reply-To: <20210830214317.GA27606@bjorn-Precision-5520>
References: <20210830214317.GA27606@bjorn-Precision-5520>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_203453_885227_1A8E0F7F 
X-CRM114-Status: GOOD (  26.08  )
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

On Mon, 2021-08-30 at 16:43 -0500, Bjorn Helgaas wrote:
> On Mon, Aug 30, 2021 at 03:09:44PM +0800, Chuanjia Liu wrote:
> > On Fri, 2021-08-27 at 11:46 -0500, Bjorn Helgaas wrote:
> > > On Mon, Aug 23, 2021 at 11:27:56AM +0800, Chuanjia Liu wrote:
> > > > @@ -995,6 +1004,14 @@ static int mtk_pcie_subsys_powerup(struct
> > > > mtk_pcie *pcie)
> > > >  			return PTR_ERR(pcie->base);
> > > >  	}
> > > >  
> > > > +	cfg_node = of_find_compatible_node(NULL, NULL,
> > > > +					   "mediatek,generic-
> > > > pciecfg");
> > > > +	if (cfg_node) {
> > > > +		pcie->cfg = syscon_node_to_regmap(cfg_node);
> > > 
> > > Other drivers in drivers/pci/controller/ use
> > > syscon_regmap_lookup_by_phandle() (j721e, dra7xx, keystone,
> > > layerscape, artpec6) or syscon_regmap_lookup_by_compatible()
> > > (imx6,
> > > kirin, v3-semi).
> > > 
> > > You should do it the same way unless there's a need to be
> > > different.
> > 
> > I have used phandle, but Rob suggested to search for the node by 
> > compatible.
> > The reason why syscon_regmap_lookup_by_compatible() is not 
> > used here is that the pciecfg node is optional, and there is no
> > need to
> > return error when the node is not searched.
> 
> How about this?
> 
>   regmap = syscon_regmap_lookup_by_compatible("mediatek,generic-
> pciecfg");
>   if (!IS_ERR(regmap))
>     pcie->cfg = regmap;

Hi Bjorn,

We need to deal with three situations
1) No error
2) The error of the node not found, don't do anything 
3) Other errors, return errors

I guess you mean

regmap = syscon_regmap_lookup_by_compatible("mediatek,generic-
pciecfg");
  if (!IS_ERR(regmap))
      pcie->cfg = regmap;
  else if (IS_ERR(regmap) && PTR_ERR(regmap) != -ENODEV)
      return PTR_ERR(regmap);

I'm not sure if we need this, it seems a little weird and there are
many drivers in other subsystems that use syscon_node_to_regmap().

Thanks
Chuanjia
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
