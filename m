Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C6FC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 08:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C9FyXHp2GkBilDBUc3HNb8y5GSlXbHgdft/7YrTrRQ0=; b=eCJKskgCJWR4Gl
	tcpt0ChmaMAtNbhriSLr0nZ4YA66QYZafjI0R3ysNyUrI3O2B22qmw+yIXWTsPd+FfxOJM0yWeS4E
	B/CWNwwLd8NOQgONS2bbIODeLxbU43dV+cBHYR73MfgaJMedhgHD7AKQWdqu8NzEGEBj1xHkYa/IO
	73sGC/2TRrU1M1JIaUBhHd3o0+NtYdT83zrDy+XTvxyLVvqBpJaRZoEUF3hqLK4RvHVpa0wojgiku
	Smv+CWIGEKRItkOkivCwCEtQi4bulfHp/MQHuSEaXKPqRCN7alr7R2A3MS2pemu188p82fplK3dwq
	xE7s86ErXsJg0utcaW2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBuoQ-002cQI-SJ; Mon, 24 Jan 2022 08:34:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBuoM-002cPR-Ib; Mon, 24 Jan 2022 08:34:52 +0000
X-UUID: 700997b8f2fb45889786b636492c71be-20220124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DM2HEqThcynx9ZyYyPkNaef51I1qLysXoCvcfoxZXZ4=; 
 b=Iyn6W7dGgdImlWwY1vgrnCQxm3CF0OaofOVrfyhPexzZmVbsxjiHIcfvHOI8Y3kEU4t5EfykOj99Ft+mkG529MNbfnlhx/fb6q0F0clu6pQXKh5a7yJ1+ZJhKamTL8saBzsIugQPFGFBLwJDXYntb+SHaYQ+MruwCKMsL0e+Eiw=;
X-UUID: 700997b8f2fb45889786b636492c71be-20220124
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <qizhong.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 857630707; Mon, 24 Jan 2022 01:34:48 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Jan 2022 00:34:46 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 24 Jan 2022 16:34:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 24 Jan 2022 16:34:43 +0800
Message-ID: <a43c470c41d083ad632b276ebf17795f35c98a3a.camel@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek: Change MSI interrupt processing sequence
From: qizhong.cheng <qizhong.cheng@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas
 <bhelgaas@google.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <chuanjia.liu@mediatek.com>,
 <qizhong.cheng@mediatek.com>
Date: Mon, 24 Jan 2022 16:34:43 +0800
In-Reply-To: <CAGXv+5GUW6qcxwnfj3dsn7Lb1yY5bNv+v+PQ2VN1NX9yPmGd2A@mail.gmail.com>
References: <20220123033306.29799-1-qizhong.cheng@mediatek.com>
 <CAGXv+5EcAXFTnjkbeU4f3J2s4Ue5zxrN4QgS=t54BnLX8Gkw2w@mail.gmail.com>
 <bddf917f241a6628d43ddd95b577024c9ddf9931.camel@mediatek.com>
 <CAGXv+5GUW6qcxwnfj3dsn7Lb1yY5bNv+v+PQ2VN1NX9yPmGd2A@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_003450_647259_60068F81 
X-CRM114-Status: GOOD (  34.86  )
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

On Mon, 2022-01-24 at 14:55 +0800, Chen-Yu Tsai wrote:
> On Mon, Jan 24, 2022 at 2:27 PM qizhong.cheng
> <qizhong.cheng@mediatek.com> wrote:
> > 
> > Hi chenYu,
> > 
> > On Mon, 2022-01-24 at 11:12 +0800, Chen-Yu Tsai wrote:
> > > Hi,
> > > 
> > > On Sun, Jan 23, 2022 at 11:34 AM qizhong cheng
> > > <qizhong.cheng@mediatek.com> wrote:
> > > > 
> > > > As an edge-triggered interrupts, its interrupt status should be
> > > > cleared
> > > > before dispatch to the handler of device.
> > > 
> > > I'm curious, is this just a code correction or are there real
> > > world
> > > cases where something fails?
> > 
> > Yes, we found a failure when used iperf tool for wifi and network
> > cards
> > performance testing. The function of "while" has just been
> > executed,
> > and the EP sent an MSI before executing "Clear MSI interrupt
> > status".
> > After executing "Clear MSI interrupt status", this edge-triggered
> > interrupt status is cleared, but EP is still waiting for interrupt
> > handler.
> 
> Can you also include this in the commit log?  It would be nice to
> record
> the exact scenario that this fix targets.

Thanks for your suggestion. I will add commit log in the next version
for others review.

> 
> ChenYu
> 
> > > 
> > > Also, please add a Fixes tag and maybe Cc stable so this gets
> > > backported
> > > automatically.
> > 
> > Thanks for your review, I will fix it in the next version.
> > 
> > > 
> > > ChenYu
> > > 
> > > > Signed-off-by: qizhong cheng <qizhong.cheng@mediatek.com>
> > > > ---
> > > >  drivers/pci/controller/pcie-mediatek.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/pci/controller/pcie-mediatek.c
> > > > b/drivers/pci/controller/pcie-mediatek.c
> > > > index 2f3f974977a3..705ea33758b1 100644
> > > > --- a/drivers/pci/controller/pcie-mediatek.c
> > > > +++ b/drivers/pci/controller/pcie-mediatek.c
> > > > @@ -624,12 +624,12 @@ static void mtk_pcie_intr_handler(struct
> > > > irq_desc *desc)
> > > >                 if (status & MSI_STATUS){
> > > >                         unsigned long imsi_status;
> > > > 
> > > > +                       /* Clear MSI interrupt status */
> > > > +                       writel(MSI_STATUS, port->base +
> > > > PCIE_INT_STATUS);
> > > >                         while ((imsi_status = readl(port->base
> > > > +
> > > > PCIE_IMSI_STATUS))) {
> > > >                                 for_each_set_bit(bit,
> > > > &imsi_status,
> > > > MTK_MSI_IRQS_NUM)
> > > >                                         generic_handle_domain_i
> > > > rq(p
> > > > ort->inner_domain, bit);
> > > >                         }
> > > > -                       /* Clear MSI interrupt status */
> > > > -                       writel(MSI_STATUS, port->base +
> > > > PCIE_INT_STATUS);
> > > >                 }
> > > >         }
> > > > 
> > > > --
> > > > 2.25.1
> > > > 
> > > > 
> > > > _______________________________________________
> > > > Linux-mediatek mailing list
> > > > Linux-mediatek@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
