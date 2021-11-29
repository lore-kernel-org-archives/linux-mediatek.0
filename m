Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C04C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 02:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AwAXSUHaAgfDokFkHNjESf5yU+nmaM8MXE+ywbMXPH4=; b=BCwWdvGD2STDoB
	gEUDWuobyRd/URrVsOXTdF73iE8e2Dn/8tOWkJFEC4fzr3cQwzrW+lQRVRtdfjBOZdD/BxoCXy9eZ
	0gPeVmBqTnGXre+TNJKH4kaV6w/SG+TjJd85FyRVoLsRLuzWiMu7+RsluH73qYbCZzjxuqWZ6rEMk
	mOYvUACY0MnAGFuxX9UqNMZHyP/8ltjrK57+ypF9eFk38ESaSYeZRMA4/FkcEczrIxTBuwrs65cZG
	tC+dH9b38vTULroU9g2hYdH05lCsNfuzloQmrSGr8/q90ReQ4mOvfXz1QOeyJfgniNVm5MTQ9Fqen
	7iqDBMlcNOyjhjVhR/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrWnA-00H8P7-VG; Mon, 29 Nov 2021 02:53:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrWn7-00H8NK-As; Mon, 29 Nov 2021 02:53:20 +0000
X-UUID: f65ccae42b984d08a1ed18b3ade543f4-20211128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=kD09jtn2dVIcl3Vsg9OLSofmPvBwrfGGIswuDPvN4T0=; 
 b=U4YMdNp9oXuxWqgFZ5KGoPSBeqdJ6XDmfM79WmZb3Aq2M/Ti6HE8ikAWh6MYLorGRDhdGLFYyBPP/T7yWE9mCOAcUD3kJQLtMqBNyozkLQOqvyS+KGj7yQZdRMtI35bii46MFyNIEerW9L5vXxlrbyD4gy/LcjB/zUOKlSa1rik=;
X-UUID: f65ccae42b984d08a1ed18b3ade543f4-20211128
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 320474898; Sun, 28 Nov 2021 19:53:09 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Nov 2021 18:52:02 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Nov 2021 10:52:00 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Nov 2021 10:51:59 +0800
Message-ID: <253e497abbcff425428ac8b7f30cebce718a63c9.camel@mediatek.com>
Subject: Re: [PATCH v3] PCI: mediatek-gen3: Disable DVFSRC voltage request
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <qizhong.cheng@mediatek.com>, <Ryan-JH.Yu@mediatek.com>, Tzung-Bi Shih
 <tzungbi@google.com>
Date: Mon, 29 Nov 2021 10:51:59 +0800
In-Reply-To: <b18f74b8831492c4a75f45fa778c359fd80184d0.camel@mediatek.com>
References: <20211015063602.29058-1-jianjun.wang@mediatek.com>
 <b18f74b8831492c4a75f45fa778c359fd80184d0.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_185318_807453_5BDE37B5 
X-CRM114-Status: GOOD (  24.97  )
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

Hi Maintainers,

Just gentle ping for this patch, is there anything I need to do to get
this patch merged?

Thanks.

On Tue, 2021-11-09 at 14:10 +0800, Jianjun Wang wrote:
> 
> On Fri, 2021-10-15 at 14:36 +0800, Jianjun Wang wrote:
> > When the DVFSRC (dynamic voltage and frequency scaling resource
> > collector)
> > feature is not implemented, the PCIe hardware will assert a voltage
> > request
> > signal when exit from the L1 PM Substates to request a specific
> > Vcore
> > voltage, but cannot receive the voltage ready signal, which will
> > cause
> > the link to fail to exit the L1 PM Substates.
> > 
> > Disable DVFSRC voltage request by default, we need to find a common
> > way to
> > enable it in the future.
> > 
> > Fixes: d3bf75b579b9 ("PCI: mediatek-gen3: Add MediaTek Gen3 driver
> > for MT8192")
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
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
