Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B328DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 06:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UnJcd2SswPENO58+/rzm/sjI96J2/J2zTRsSLuTR2RY=; b=uUM5R4BLK6mqaR
	WGiLIA56oRGi7MIeSWnnREfHGIwmCVrmMXnfFjJUmHg3FqM8R1LXplxzJU0ZUqghAYw2eEdWVi+t7
	dLoJ7rWNnWEz3sPm9vcmvXkIusj/7ySN2gyhppG0O1no7UsofUmjN5ITKVj88bY1LP/dpFhmR31Eo
	7kFrMWcjRpBbaPKTU+6iV7RtYDs6Q2KBUUqAtvtzV+9jvklXJfLZ1OrGJBFrad+t9P+LLozH1ZZjh
	1as/8GZJw161PCc2yiFquCrcBGPJkEPBb7gYKT6Fo/DXu3MXGujSyHcJXh10Bo17/dwUIVd/XR1KB
	Pe/hVEo7HJ1/tD4t5/HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBsyl-002Pyy-QT; Mon, 24 Jan 2022 06:37:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBsyh-002Pwx-Uh; Mon, 24 Jan 2022 06:37:25 +0000
X-UUID: 9b6ade5fd4be4ead9c59d44f4f96a58c-20220123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=GRyaEZRyfCt+y1FtTJjtpxi/4iuId1G52GkEM/UR+6E=; 
 b=Pn+mFZ5ZQo7asEm0YXuCXOixW+9uW9lXT1FaBxOi0wyu6o/dVlNBFxvcyMOsvZqg0vxS+dNm9q2jwyBhaUuk+DZ0IYkPFXtvn/tT6ZJBcR68Fy5BVQJnwE0mXPtuJMprd3qwNKsyPD0kUjS1S3VtLiYxwys2jb9s+r1jcCoS320=;
X-UUID: 9b6ade5fd4be4ead9c59d44f4f96a58c-20220123
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qizhong.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 138975799; Sun, 23 Jan 2022 23:37:18 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 23 Jan 2022 22:27:16 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Jan 2022 14:27:14 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 24 Jan 2022 14:27:13 +0800
Message-ID: <bddf917f241a6628d43ddd95b577024c9ddf9931.camel@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek: Change MSI interrupt processing sequence
From: qizhong.cheng <qizhong.cheng@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas
 <bhelgaas@google.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <chuanjia.liu@mediatek.com>
Date: Mon, 24 Jan 2022 14:27:13 +0800
In-Reply-To: <CAGXv+5EcAXFTnjkbeU4f3J2s4Ue5zxrN4QgS=t54BnLX8Gkw2w@mail.gmail.com>
References: <20220123033306.29799-1-qizhong.cheng@mediatek.com>
 <CAGXv+5EcAXFTnjkbeU4f3J2s4Ue5zxrN4QgS=t54BnLX8Gkw2w@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_223724_033345_A0B51ACB 
X-CRM114-Status: GOOD (  25.76  )
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

Hi chenYu,

On Mon, 2022-01-24 at 11:12 +0800, Chen-Yu Tsai wrote:
> Hi,
> 
> On Sun, Jan 23, 2022 at 11:34 AM qizhong cheng
> <qizhong.cheng@mediatek.com> wrote:
> > 
> > As an edge-triggered interrupts, its interrupt status should be
> > cleared
> > before dispatch to the handler of device.
> 
> I'm curious, is this just a code correction or are there real world
> cases where something fails?

Yes, we found a failure when used iperf tool for wifi and network cards
performance testing. The function of "while" has just been executed,
and the EP sent an MSI before executing "Clear MSI interrupt status".
After executing "Clear MSI interrupt status", this edge-triggered
interrupt status is cleared, but EP is still waiting for interrupt
handler.

> 
> Also, please add a Fixes tag and maybe Cc stable so this gets
> backported
> automatically.

Thanks for your review, I will fix it in the next version.

> 
> ChenYu
> 
> > Signed-off-by: qizhong cheng <qizhong.cheng@mediatek.com>
> > ---
> >  drivers/pci/controller/pcie-mediatek.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-mediatek.c
> > b/drivers/pci/controller/pcie-mediatek.c
> > index 2f3f974977a3..705ea33758b1 100644
> > --- a/drivers/pci/controller/pcie-mediatek.c
> > +++ b/drivers/pci/controller/pcie-mediatek.c
> > @@ -624,12 +624,12 @@ static void mtk_pcie_intr_handler(struct
> > irq_desc *desc)
> >                 if (status & MSI_STATUS){
> >                         unsigned long imsi_status;
> > 
> > +                       /* Clear MSI interrupt status */
> > +                       writel(MSI_STATUS, port->base +
> > PCIE_INT_STATUS);
> >                         while ((imsi_status = readl(port->base +
> > PCIE_IMSI_STATUS))) {
> >                                 for_each_set_bit(bit, &imsi_status,
> > MTK_MSI_IRQS_NUM)
> >                                         generic_handle_domain_irq(p
> > ort->inner_domain, bit);
> >                         }
> > -                       /* Clear MSI interrupt status */
> > -                       writel(MSI_STATUS, port->base +
> > PCIE_INT_STATUS);
> >                 }
> >         }
> > 
> > --
> > 2.25.1
> > 
> > 
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
