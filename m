Return-Path: <SRS0=Uf5e=NV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7066DC432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 21:43:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 396A660E90
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 21:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 396A660E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=FV//9gQR+0+FrRI5PPjRZDEBS6VbC3GPLvhzJf8ySYw=; b=4mNeMDDe8wpWDE
	zKVQQ4HceippmiAC0S/qq/U5jp6ZOOacxh17mDo4TQrTVZm/fmdTdtjJ2uDp4X3H66D6tp0ifcPne
	66muPqCHjpEG3BPaEJxlZvX28EU0CREI85fPWmc0uYaPai+qij8hSGoGKnJd8UbYtJFrnX7I5iQi7
	REzSzxkb6aXusJqeoQ24gAOS1BVm8dDgHB6YE418Usqmrq3hVJHB+KzPOaZDPwjeEW1i4KLevTG73
	G3tDzYGajIr6t1FbrqRLqiWOVpfweKdtTIBTbaCfp4HqvoivYQA87RwgTwQdfWcJ6KbF6J7ClUVat
	a+B/NZQDWq8ClpSBt0lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKp41-000h1D-2i; Mon, 30 Aug 2021 21:43:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKp3n-000gz1-On; Mon, 30 Aug 2021 21:43:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B5DBD60E90;
 Mon, 30 Aug 2021 21:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630359799;
 bh=zbF3yv3WsPc6wc8t9qfmmgZ/lsdWyqbDW8FcCrDPuyU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=kBXWL/TQGLTNPzPT5D1t87Hd+gPPA12194U6gqUgTgOFjGN6ii3xJMWicLvkbRmgF
 XVwshnvVeiN9iMrc4FFbRj59YUQk04lQi6bBCL+2GTo7D+lJfy4hNXsVD5TrAdsyFf
 VxpmLP+Ct8VykrxQuK8Sheqhu0Ae+P/T6ewQr8vHeAxzwLHRExW+E7YZFwnUI48Ta/
 WUlU3rCydCVeGmRmiDdW3Jx5N1ha0ke9S5ycXg3eVu2ramZcp9WMShG2qm1prMMBsF
 kX1hbDVvP/WhP6SwQADep/x4y5OQWKTzrYG64YklfpHiGo9UOZT032NOZCDS6qibdw
 Sj+Gr6a7gZQYQ==
Date: Mon, 30 Aug 2021 16:43:17 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chuanjia Liu <chuanjia.liu@mediatek.com>
Cc: robh+dt@kernel.org, bhelgaas@google.com, matthias.bgg@gmail.com,
 lorenzo.pieralisi@arm.com, ryder.lee@mediatek.com,
 jianjun.wang@mediatek.com, yong.wu@mediatek.com,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 2/6] PCI: mediatek: Add new method to get shared
 pcie-cfg base address
Message-ID: <20210830214317.GA27606@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <968266ecd5889721aa234c414361bedbe66b9539.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_144319_868149_461A2169 
X-CRM114-Status: GOOD (  19.54  )
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

On Mon, Aug 30, 2021 at 03:09:44PM +0800, Chuanjia Liu wrote:
> On Fri, 2021-08-27 at 11:46 -0500, Bjorn Helgaas wrote:
> > On Mon, Aug 23, 2021 at 11:27:56AM +0800, Chuanjia Liu wrote:

> > > @@ -995,6 +1004,14 @@ static int mtk_pcie_subsys_powerup(struct
> > > mtk_pcie *pcie)
> > >  			return PTR_ERR(pcie->base);
> > >  	}
> > >  
> > > +	cfg_node = of_find_compatible_node(NULL, NULL,
> > > +					   "mediatek,generic-pciecfg");
> > > +	if (cfg_node) {
> > > +		pcie->cfg = syscon_node_to_regmap(cfg_node);
> > 
> > Other drivers in drivers/pci/controller/ use
> > syscon_regmap_lookup_by_phandle() (j721e, dra7xx, keystone,
> > layerscape, artpec6) or syscon_regmap_lookup_by_compatible() (imx6,
> > kirin, v3-semi).
> > 
> > You should do it the same way unless there's a need to be different.
>
> I have used phandle, but Rob suggested to search for the node by 
> compatible.

> The reason why syscon_regmap_lookup_by_compatible() is not 
> used here is that the pciecfg node is optional, and there is no need to
> return error when the node is not searched.

How about this?

  regmap = syscon_regmap_lookup_by_compatible("mediatek,generic-pciecfg");
  if (!IS_ERR(regmap))
    pcie->cfg = regmap;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
