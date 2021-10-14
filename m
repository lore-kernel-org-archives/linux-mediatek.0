Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879C6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 07:32:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BB2960F93
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 07:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4BB2960F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZoUOcfN4TG3Tp3s+ktjNeylCDu+MUj6TquNQmNSST8=; b=yS9m9+XDpgTof2
	aqHA4Jsymv4l9VHvSt5khEPBr7C7oL0uovNgvWnAmkfv4QkB4nhXT6ARaB2jCv0ME4PZmq95vXhuY
	s64ugv7jkokqBHnFatfGdJgEskmHMJzjl9+q+xTUYHkBvKwe3PnxBBtn7mR2SWnoufKm4HI9TKMjA
	Z6y/tbnJrnC0S7aDyWh4qA1cWABYWBCMdbIjybcP8EFJkGwCIM+I7fiKVKxPviKcmX3v2L9H7R69E
	sSwca4aMFATbK5uD3iuStaoePAtGGJA/fyVmAKMHmPYQXirnbETp9RkcJZjbVF9vNBiwZyAiPPF1G
	PJDgeYxuOuxntjZ7n7Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mavDb-001uvK-0i; Thu, 14 Oct 2021 07:31:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mavDN-001uqH-1p; Thu, 14 Oct 2021 07:31:47 +0000
X-UUID: f5a5016f410e449f9b2b880bdd8443c9-20211014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9lY6LHEh9lVFUboaWig5Y2+eb27e6WH0vW234KZQ/6c=; 
 b=EPZzf81URHg+bP0asUlZxBa24o/BLm7g5gEnTu01YRzdCVUFslpyKCO0ajsNvaKk0elZZjN2gRAa4yrjPZI5sIEwzWKmDZ9ZURbbCuPgRjZ9ZpYrhpv28UR1gMxS0APWKSFOQQsfPCCEXfs9yKKUbuR3NZKSEqsK8CPBio1yNB8=;
X-UUID: f5a5016f410e449f9b2b880bdd8443c9-20211014
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 561859350; Thu, 14 Oct 2021 00:31:40 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Oct 2021 00:31:38 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Oct 2021 15:31:37 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Oct 2021 15:31:36 +0800
Message-ID: <cb8ba624881fa4f57ea6a1d4c30fcb472f709a4f.camel@mediatek.com>
Subject: Re: [PATCH v2] PCI: mediatek-gen3: Disable DVFSRC voltage request
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <qizhong.cheng@mediatek.com>,
 <Ryan-JH.Yu@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 14 Oct 2021 15:31:36 +0800
In-Reply-To: <20211013183515.GA1907868@bhelgaas>
References: <20211013183515.GA1907868@bhelgaas>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_003145_933232_5571ECD5 
X-CRM114-Status: GOOD (  30.10  )
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

On Wed, 2021-10-13 at 13:35 -0500, Bjorn Helgaas wrote:
> On Wed, Oct 13, 2021 at 03:53:28PM +0800, Jianjun Wang wrote:
> > When the DVFSRC feature is not implemented, the MAC layer will
> > assert a voltage request signal when exit from the L1ss state,
> > but cannot receive the voltage ready signal, which will cause
> > the link to fail to exit the L1ss state correctly.
> > 
> > Disable DVFSRC voltage request by default, we need to find
> > a common way to enable it in the future.
> 
> Rewrap commit log to fill 75 columns.
> 
> Does "L1ss" above refer to L1.1 and L1.2?  If so, please say that
> explicitly or say something like "L1 PM Substates" (the term used in
> the PCIe spec) so it's clear.
> 
> This seems on the boundary of PCIe-specified things and Mediatek
> implementation details, so I'm not sure what "DVFSRC," "MAC," and
> "voltage request signal" mean.  Since I don't recognize those terms,
> I'm guessing they are Mediatek-specific things.
> 
> But if they are things specified by the PCIe spec, please use the
> exact names used in the spec.

Hi Bjorn,

Yes, the DVFSRC (dynamic voltage and frequency scaling resource
collector) is a proprietary hardware of Mediatek, which is used to
collect the requests from system and turn into the decision of minimum
Vcore voltage and minimum DRAM frequency to fulfill those requests, and
the "voltage request signal" is the hardware signal which from the PCIe
hardware to the DVFSRC module to request a specific Vcore voltage.

I will add its full name in the next version, thanks for your review.

Thanks.
> 
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> > Tested-by: Qizhong Cheng <qizhong.cheng@mediatek.com>
> > ---
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c
> > b/drivers/pci/controller/pcie-mediatek-gen3.c
> > index f3aeb8d4eaca..79fb12fca6a9 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -79,6 +79,9 @@
> >  #define PCIE_ICMD_PM_REG		0x198
> >  #define PCIE_TURN_OFF_LINK		BIT(4)
> >  
> > +#define PCIE_MISC_CTRL_REG		0x348
> > +#define PCIE_DISABLE_DVFSRC_VLT_REQ	BIT(1)
> > +
> >  #define PCIE_TRANS_TABLE_BASE_REG	0x800
> >  #define PCIE_ATR_SRC_ADDR_MSB_OFFSET	0x4
> >  #define PCIE_ATR_TRSL_ADDR_LSB_OFFSET	0x8
> > @@ -297,6 +300,11 @@ static int mtk_pcie_startup_port(struct
> > mtk_pcie_port *port)
> >  	val &= ~PCIE_INTX_ENABLE;
> >  	writel_relaxed(val, port->base + PCIE_INT_ENABLE_REG);
> >  
> > +	/* Disable DVFSRC voltage request */
> > +	val = readl_relaxed(port->base + PCIE_MISC_CTRL_REG);
> > +	val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
> > +	writel_relaxed(val, port->base + PCIE_MISC_CTRL_REG);
> > +
> >  	/* Assert all reset signals */
> >  	val = readl_relaxed(port->base + PCIE_RST_CTRL_REG);
> >  	val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
> > PCIE_PE_RSTB;
> > -- 
> > 2.25.1
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
