Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F547C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 06:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f0j4qTAjxNh7qu8DDRtrd5y9jpHU+KjqghTmfUvcwiI=; b=TJgbVkeX2/KJrL
	NPDEzthYyqbQKUhEkHNiIAV3s7rKpeWtJnj3sddacWKO9Ka51XFVx1MH7xVipBv4h7fHxt+DIHbXB
	7TngPQmWV45Cg8lug8JeiRLzqwwB+mTGlzSgFnGdw0JaUORLZhFM4j7jDS/24fxWxdgZC32sN6Evd
	FUeoVKFw7MdeT1dLEEuxTONZh3FQMPyQ0LQSqg0dgES3XA6TFBs6sUkgwfFmxYGe5yVSgdiACXWkL
	YztAeGabAmYlWx5Rn5zBDd26oV8oUeZHRvtzQCaoY/YebUFKsHzi3vw5Vs2WrYt1IrF9v23wSdJZq
	WEQcWOW3tUkscqJnBcXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIPlM-0060jP-1A; Fri, 11 Feb 2022 06:50:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIPlH-0060ih-29; Fri, 11 Feb 2022 06:50:34 +0000
X-UUID: 1ea55caaf015410484190775b6112c96-20220210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qnqekZxaHhYJpN2y/q2vj6neS3IBIAacbiXlHvR0vWo=; 
 b=oeaPFkV69o073mVc4rYSqGLbeuk+qU3m3yQSAi927ii3qIBqeVhRB0kDb/sMRBM/Iudw7Qd8BShl1hFrdw5oVZyEjRFWTHTjkaOru7SG3zn5YXYmk60LBO1OfcpkkBS+SWG6As98wm4fCYyxSS16Siur3GOY4398uxw/3A1xc5o=;
X-UUID: 1ea55caaf015410484190775b6112c96-20220210
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <qizhong.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 15920199; Thu, 10 Feb 2022 23:50:22 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Feb 2022 22:50:21 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Feb 2022 14:50:19 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Feb 2022 14:50:18 +0800
Message-ID: <bf5cbb745d4f5bdf675aff661f0cc7aef7280e2f.camel@mediatek.com>
Subject: Re: [PATCH v2] PCI: mediatek: Clear interrupt status before
 dispatching handler
From: qizhong.cheng <qizhong.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Krzysztof
 =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas
 <bhelgaas@google.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <chuanjia.liu@mediatek.com>
Date: Fri, 11 Feb 2022 14:50:18 +0800
In-Reply-To: <06446828-b589-5d7a-0e9f-25f6321e0da6@collabora.com>
References: <20220210012125.6420-1-qizhong.cheng@mediatek.com>
 <06446828-b589-5d7a-0e9f-25f6321e0da6@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_225031_142240_4C5F02E8 
X-CRM114-Status: GOOD (  27.14  )
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

Hi AngeloGioacchino & Greg KH,

On Thu, 2022-02-10 at 15:31 +0100, AngeloGioacchino Del Regno wrote:
> Il 10/02/22 02:21, qizhong cheng ha scritto:
> > We found a failure when used iperf tool for wifi performance
> > testing,
> > there are some MSIs received while clearing the interrupt status,
> > these MSIs cannot be serviced.
> > 
> > The interrupt status can be cleared even the MSI status still
> > remaining,
> > as an edge-triggered interrupts, its interrupt status should be
> > cleared
> > before dispatching to the handler of device.
> > 
> > Signed-off-by: qizhong cheng <qizhong.cheng@mediatek.com>
> 
> Hello Qizhong,
> 
> This commit is fixing an issue, which means that you *have to* add a
> proper
> Fixes tag.
> 
> I believe that this is fixing commit
> 43e6409db64d ("PCI: mediatek: Add MSI support for MT2712 and
> MT7622").
> 
> Please add the tag and send a v3, after which:
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 

Thanks for your reviews and suggestions.
I will fix it in the next v3 version.

> 
> > ---
> > v2:
> >   - Update the subject line.
> >   - Improve the commit log and code comments.
> > 
> >   drivers/pci/controller/pcie-mediatek.c | 9 +++++++--
> >   1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-mediatek.c
> > b/drivers/pci/controller/pcie-mediatek.c
> > index 2f3f974977a3..2856d74b2513 100644
> > --- a/drivers/pci/controller/pcie-mediatek.c
> > +++ b/drivers/pci/controller/pcie-mediatek.c
> > @@ -624,12 +624,17 @@ static void mtk_pcie_intr_handler(struct
> > irq_desc *desc)
> >   		if (status & MSI_STATUS){
> >   			unsigned long imsi_status;
> >   
> > +			/*
> > +			 * The interrupt status can be cleared even the
> > MSI
> > +			 * status still remaining, hence as an edge-
> > triggered
> > +			 * interrupts, its interrupt status should be
> > cleared
> > +			 * before dispatching handler.
> > +			 */
> > +			writel(MSI_STATUS, port->base +
> > PCIE_INT_STATUS);
> >   			while ((imsi_status = readl(port->base +
> > PCIE_IMSI_STATUS))) {
> >   				for_each_set_bit(bit, &imsi_status,
> > MTK_MSI_IRQS_NUM)
> >   					generic_handle_domain_irq(port-
> > >inner_domain, bit);
> >   			}
> > -			/* Clear MSI interrupt status */
> > -			writel(MSI_STATUS, port->base +
> > PCIE_INT_STATUS);
> >   		}
> >   	}
> >   
> > 
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
