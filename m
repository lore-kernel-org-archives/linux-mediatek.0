Return-Path: <SRS0=m4qr=PB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982D5C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 19:02:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 612AD60E96
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 19:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 612AD60E96
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=5LOaxF9O9SZNVoEkG7kEoAvSU76JOfH+bXx41KSHdns=; b=q+gRsvlOXobw5s
	EI9EzN/aMHrMK7H5HwhsFLMlcKRRnvJDfD2LGKGt1IxEHdEw2oC7YPjDxILHm+lpG9QaUz3sJi4IA
	AinuWgyNY9/FhFr+F1RAFYQ4sxEPnvfubzgEb5wmTE8RL0Q+IC74+rypzK+qvNW+l1/hb3RkgQ3s4
	9PlU4PukDyrojJ5+J0MTQ3rYcqXgsXlnHvC2YofJxGNty3H8f1fIVRpniTa8TdNdcHAETDYw7+NRY
	+5RBeeV6kFIN/rzRLw1JTu5rE416tsQldggwPYTkTZi/sUwGeE9db1Z0eEWI21vHfnl9iJS/G14mD
	85gUzCnoG1Y+YZ5iKyXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1majWT-000OM3-CF; Wed, 13 Oct 2021 19:02:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1majWH-000OJh-9J; Wed, 13 Oct 2021 19:02:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6284060E96;
 Wed, 13 Oct 2021 19:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634151749;
 bh=nrpmV2aL7Yyo2rvXkWXL6W7OTMDFqb0qTu+6E6wA2jw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=SOy4uik6jEZWbxmPABrbRogV42T8n5r6jEXXfPGNkk6SIgKDyIO6cbZHoarlAkULH
 kjFBy8PONij7Kl/a60F5hUAIVGNFG9k12KIb2imfqAi2rJcNiU8z+4/0Pb3gpVh9NV
 ZE3BZ4ySVphSPjAHTDam/ZsH5e6jxU/R6OI0hHiCymtbcuanXohqSbDNMLVzpcPMG4
 +ZwTDIG4PZnBHVWK/y0yyxATl1P2Qxh2c1shr3aCXxIkGCWdlLx0vEnrb+FK0vCgIV
 liF96uxIaP05sMPqKAeIkyXUSC0pKpdUh2TTdPkiCAvJs5qPoCYm3v145cEdkU6kNk
 2BB+INXZ2Oo4Q==
Date: Wed, 13 Oct 2021 14:02:26 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 qizhong.cheng@mediatek.com, Ryan-JH.Yu@mediatek.com,
 Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH v2] PCI: mediatek-gen3: Disable DVFSRC voltage request
Message-ID: <20211013190226.GA1910352@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013183515.GA1907868@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_120229_379885_BC2DF4E4 
X-CRM114-Status: GOOD (  26.73  )
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

On Wed, Oct 13, 2021 at 01:35:17PM -0500, Bjorn Helgaas wrote:
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
> 
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> > Tested-by: Qizhong Cheng <qizhong.cheng@mediatek.com>

Krzysztof also pointed out that if this is a bug fix, we may want a
stable tag here.  And, ideally, a Fixes: tag with the specific commit
that introduced the bug.

> > ---
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
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
> > @@ -297,6 +300,11 @@ static int mtk_pcie_startup_port(struct mtk_pcie_port *port)
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
> >  	val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
> > -- 
> > 2.25.1
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
