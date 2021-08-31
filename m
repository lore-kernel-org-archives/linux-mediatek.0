Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4190DC432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 15:18:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F05D46103D
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 15:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F05D46103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dtpg8NdeL97umJ5UldxW2Ogh4yaDK70M6Jal56O9Hyg=; b=rYDXfoRv3UfENx
	wEe8t03cKRyUBJGMjUsIzIM5U0zS94LVsS8cLAD3fJqEEyhc36XPSNCAQTALa12Mqy1oDECLwjg9l
	NjZPLlsUfx92j9Wt6YAK5kiVwg6NNWToxuX24OzDTcLAhZCsYEgZW5hgZe3b01qwipxqU/s+uFcGI
	eSRWQ0ae1C7eJnxtsNNUr7bOdhy5GpmDBo3DMyMY6Svjx0MwvcGvw0eehGRrKIEqfzAW9wyVg7ews
	dni9TAbScZcczKlQGlbfAMsHXU7pscudEfdIGOkKlA3tPtGWkji4svCrxVDQxBj9Gi9V/Yiz0izHq
	/+vDXy16yFOc+FOdkdAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL5Wl-002cVq-SE; Tue, 31 Aug 2021 15:18:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL5WZ-002cUb-Ia; Tue, 31 Aug 2021 15:18:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 045F361056;
 Tue, 31 Aug 2021 15:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630423087;
 bh=RJTxHIyrBUknplHV6hGq8g2EyXUUbu+8+pAvfCZtkMk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=G0yMMTqHzwe0qELu/DoAveRwHUB13dr3KPJRkqxmmeotdjBerRgfbWfJzvi9M4w7j
 R3d+skaMiYzBdMNJOfXm9IWujZ7afBwVsnt3mzrac3T8HNMuZFQm6btu2kyq11MD9l
 NU0wxpysBolR1UlYFWOd3DdrfplB3FDtilgRYq9UbC1JXckD5jD+uXirhjfZ876WcO
 cqkLBhbYdUEdxIO0Y3pu3KB4qCvNUYdQDdwG5VOgIGLiZCWlloej9IUto9KfnXma+I
 CftbNTGohba7GqvjL/2RLJlsW3BEuUXuEVwcoNO1UjdzSkJ21YGcAF73la1USBO6cM
 6J9E/lUdaDRTA==
Received: by mail-ej1-f51.google.com with SMTP id h9so39599148ejs.4;
 Tue, 31 Aug 2021 08:18:06 -0700 (PDT)
X-Gm-Message-State: AOAM530pZufSWn49XMRLxy8dmX1YGbwv5wzrduu/N91eER3jMHu34uFy
 9H6VrucxncxnN8TyprKhqtC8hbT/sbggFSqLZQ==
X-Google-Smtp-Source: ABdhPJy8LprSPFGyN9DqZEs0SFSzAWJ2ZV2nFyBr73KsmWA8/W5JGC4e+TWoma70T7sy/5hnC40loUZrlfZ4loNuCl4=
X-Received: by 2002:a17:906:8cd:: with SMTP id
 o13mr32127271eje.341.1630423085544; 
 Tue, 31 Aug 2021 08:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210830214317.GA27606@bjorn-Precision-5520>
 <ccf767340afe13a6d273ad8fbc29c6bc966d6314.camel@mediatek.com>
In-Reply-To: <ccf767340afe13a6d273ad8fbc29c6bc966d6314.camel@mediatek.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 31 Aug 2021 10:17:53 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+dBi-XUDJD_STP=jWw+RLkRpX1U9XsRMhqK4U1H=0FHw@mail.gmail.com>
Message-ID: <CAL_Jsq+dBi-XUDJD_STP=jWw+RLkRpX1U9XsRMhqK4U1H=0FHw@mail.gmail.com>
Subject: Re: [PATCH v12 2/6] PCI: mediatek: Add new method to get shared
 pcie-cfg base address
To: Chuanjia Liu <chuanjia.liu@mediatek.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
 Yong Wu <yong.wu@mediatek.com>, PCI <linux-pci@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 devicetree@vger.kernel.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_081807_668768_F539A4A7 
X-CRM114-Status: GOOD (  30.23  )
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

On Mon, Aug 30, 2021 at 10:31 PM Chuanjia Liu <chuanjia.liu@mediatek.com> wrote:
>
> On Mon, 2021-08-30 at 16:43 -0500, Bjorn Helgaas wrote:
> > On Mon, Aug 30, 2021 at 03:09:44PM +0800, Chuanjia Liu wrote:
> > > On Fri, 2021-08-27 at 11:46 -0500, Bjorn Helgaas wrote:
> > > > On Mon, Aug 23, 2021 at 11:27:56AM +0800, Chuanjia Liu wrote:
> > > > > @@ -995,6 +1004,14 @@ static int mtk_pcie_subsys_powerup(struct
> > > > > mtk_pcie *pcie)
> > > > >                         return PTR_ERR(pcie->base);
> > > > >         }
> > > > >
> > > > > +       cfg_node = of_find_compatible_node(NULL, NULL,
> > > > > +                                          "mediatek,generic-
> > > > > pciecfg");
> > > > > +       if (cfg_node) {
> > > > > +               pcie->cfg = syscon_node_to_regmap(cfg_node);
> > > >
> > > > Other drivers in drivers/pci/controller/ use
> > > > syscon_regmap_lookup_by_phandle() (j721e, dra7xx, keystone,
> > > > layerscape, artpec6) or syscon_regmap_lookup_by_compatible()
> > > > (imx6,
> > > > kirin, v3-semi).
> > > >
> > > > You should do it the same way unless there's a need to be
> > > > different.
> > >
> > > I have used phandle, but Rob suggested to search for the node by
> > > compatible.
> > > The reason why syscon_regmap_lookup_by_compatible() is not
> > > used here is that the pciecfg node is optional, and there is no
> > > need to
> > > return error when the node is not searched.
> >
> > How about this?
> >
> >   regmap = syscon_regmap_lookup_by_compatible("mediatek,generic-
> > pciecfg");
> >   if (!IS_ERR(regmap))
> >     pcie->cfg = regmap;

+1

>
> Hi Bjorn,
>
> We need to deal with three situations
> 1) No error
> 2) The error of the node not found, don't do anything
> 3) Other errors, return errors
>
> I guess you mean
>
> regmap = syscon_regmap_lookup_by_compatible("mediatek,generic-
> pciecfg");
>   if (!IS_ERR(regmap))
>       pcie->cfg = regmap;
>   else if (IS_ERR(regmap) && PTR_ERR(regmap) != -ENODEV)

You already know  IS_ERR is true here.

>       return PTR_ERR(regmap);

syscon_regmap_lookup_by_compatible_optional is the function you are
looking for. The _optional flavor doesn't exist, so create it. There
is one for the phandle lookup.

>
> I'm not sure if we need this, it seems a little weird and there are
> many drivers in other subsystems that use syscon_node_to_regmap().

You are implementing the exact same sequence that
syscon_regmap_lookup_by_compatible() does, so clearly you should be
using it. The one difference is you forgot the of_node_put().

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
