Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B31A3C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 07:18:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7069860EAF
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 07:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7069860EAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9UtmfRk/TENxoD/GdIbr02vHUN7JtCM6sbGn8cUJBHU=; b=tPp6nKMLFRm2cI
	3CQMoPX8U4WALMmQGXivcxWBcEsseZeV+9Ca0Ze7h4SBbIHiHEZOJe3J0hl5IWOUz8e2f1rVer+U5
	QsM+lFSzd5+H712syyHWo1xmU36IBoaBWUdOJD6mfhVMzUbF5u/Gpn6ssfvbmqnuyi3RGqEZZYAci
	OQkPu9oZfeUYIRL1vygkeggwFpykbHgpCxmwOrRq3pxLls6EnQXYNAogF3HbIEaKxT6fYLUuDRFKN
	udGfDHI7FtS+CHZ3sAw2Z8VjNVMxGk8LaotcV63gsK4cr20nhym072eZYY/Elvor8ccSoUoHkqnaW
	ACO2yFq1fBnYpAfxh+kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6pRR-003fs2-0J; Fri, 23 Jul 2021 07:17:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6pRD-003fpQ-5Z; Fri, 23 Jul 2021 07:17:40 +0000
X-UUID: 3e9cdee0af3c4bedae54a302a9abe914-20210723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=prDrh7DxvcudMBmuQ1JSmdMeIVoEkDXcOOdpbvc2mFA=; 
 b=QI6jc+ZVluBVkxEG3ZV3sBFIUZDM97gmELDiXF/AEQI7ajf4sXdARMqMiH4kcznjq+GCXDI1lpw2gaCJXuYd6IMGyM8llAodIzi1B9TAzvMr1XrdtAnMmdKF15rtlebhqXtxSUP9oknFJ6wmBAReIxBMzfQ9XwfQ9tlDR+Rc4Qw=;
X-UUID: 3e9cdee0af3c4bedae54a302a9abe914-20210723
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 496204382; Fri, 23 Jul 2021 00:17:35 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Jul 2021 00:17:34 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Jul 2021 15:17:27 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Jul 2021 15:17:26 +0800
Message-ID: <1627024646.19956.2.camel@mhfsdcap03>
Subject: Re: [PATCH v11 1/4] dt-bindings: PCI: mediatek: Update the Device
 tree bindings
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jianjun Wang
 <jianjun.wang@mediatek.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>,
 PCI <linux-pci@vger.kernel.org>, Frank Wunderlich <frank-w@public-files.de>,
 <devicetree@vger.kernel.org>, Yong Wu <yong.wu@mediatek.com>
Date: Fri, 23 Jul 2021 15:17:26 +0800
In-Reply-To: <CAL_JsqJXN1b5Tq7uAngXfDmpTJoPvDmSzMedK3kr6efvuCgQ=w@mail.gmail.com>
References: <20210719073456.28666-1-chuanjia.liu@mediatek.com>
 <20210719073456.28666-2-chuanjia.liu@mediatek.com>
 <20210719224718.GA2766057@robh.at.kernel.org>
 <1626746843.2466.10.camel@mhfsdcap03>
 <CAL_JsqJXN1b5Tq7uAngXfDmpTJoPvDmSzMedK3kr6efvuCgQ=w@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_001739_256535_D16C8D85 
X-CRM114-Status: GOOD (  25.13  )
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

On Tue, 2021-07-20 at 10:26 -0600, Rob Herring wrote:
> On Mon, Jul 19, 2021 at 8:07 PM Chuanjia Liu <chuanjia.liu@mediatek.com> wrote:
> >
> > On Mon, 2021-07-19 at 16:47 -0600, Rob Herring wrote:
> > > On Mon, 19 Jul 2021 15:34:53 +0800, Chuanjia Liu wrote:
> > > > There are two independent PCIe controllers in MT2712 and MT7622
> > > > platform. Each of them should contain an independent MSI domain.
> > > >
> > > > In old dts architecture, MSI domain will be inherited from the root
> > > > bridge, and all of the devices will share the same MSI domain.
> > > > Hence that, the PCIe devices will not work properly if the irq number
> > > > which required is more than 32.
> > > >
> > > > Split the PCIe node for MT2712 and MT7622 platform to comply with
> > > > the hardware design and fix MSI issue.
> > > >
> > > > Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> > > > Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> > > > ---
> > > >  .../bindings/pci/mediatek-pcie-cfg.yaml       |  39 ++++
> > > >  .../devicetree/bindings/pci/mediatek-pcie.txt | 206 ++++++++++--------
> > > >  2 files changed, 150 insertions(+), 95 deletions(-)
> > > >  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
> > > >
> > >
> > >
> > > Please add Acked-by/Reviewed-by tags when posting new versions. However,
> > > there's no need to repost patches *only* to add the tags. The upstream
> > > maintainer will do that for acks received on the version they apply.
> > >
> > > If a tag was not added on purpose, please state why and what changed.
> > >
> > Hi,Rob
> > I have described in the cover letter:
> > v11:Rebase for 5.14-rc1 and add "interrupt-names", "linux,pci-domain"
> >     description in binding file. No code change.
> > if you still ok for this, I will add R-b in next version.
> 
> Yes, it's fine.
> 
> In the future, put the changelog for a patch in the patch.
Hi, Rob
 Thanks for you suggestion, I will do this in future versions.
Best regards


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
