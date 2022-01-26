Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840F7C28CF5
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 03:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OzfM68Vu0Tg/LGbdnuDba9Ak2jSDh/MIhTCb7yc0jyE=; b=HR3tzBZMbCOhVn
	ghjl26f2A4zqWh/rCPx2Dd/+UhKTh+dhJ2qcPzBYSF5f0j/2fe9EyIfS624tTXS85gYxB6OBuLLA1
	3JfB/goobG8izpxllKNsqsx6JxnXSRnV1MxiD0jDMAUix4XN9wpRHDk4azOY3rIzivrKlFYH4SSmU
	x2yAqb8oV1ahxmiUCgYrtd0mbeE25g0BI+F4FIAil9dPP+bnKFvOsdeTT7YP7fGSjZJQOh2Dvi6S2
	mLC6hbiJPIt0niU3GBSJc9qZKGG9ZgW9475ReOp4eW3AILRYTwaM89KB9vRWL9JCLqu+payp37aSV
	yIhYR0SmiXJxmBGBblJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCZ8N-00A4E5-98; Wed, 26 Jan 2022 03:38:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCZ8J-00A4DL-1g; Wed, 26 Jan 2022 03:38:09 +0000
X-UUID: 49ba5485584e4e309c2c0f55437522b6-20220125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=a/gBlUU1hsQb2mCfMYxlytCU6fL3X0VehMaAcBYrxY4=; 
 b=S0swC8UBGVArrCpgwY5mYYQ0Tmn9kn4wwVKd0FiobQ+hcHBAFl8GBiJ/9QdPrTZ/rNNeomBfLT7wnyUzkTyiQUEf9npbb0UP4UkQGtMWbGLdKbyApTGVBwpCuN/Rzn7mR/6KXYive/opGT0lsLHB8JFsfRwBENjf9POQawQQk9Q=;
X-UUID: 49ba5485584e4e309c2c0f55437522b6-20220125
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <qizhong.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 541032328; Tue, 25 Jan 2022 20:38:02 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 19:38:01 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 26 Jan 2022 11:37:59 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 Jan 2022 11:37:58 +0800
Message-ID: <d78b45e461b204d375830217d0d27ffdd97cedd3.camel@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek: Change MSI interrupt processing sequence
From: qizhong.cheng <qizhong.cheng@mediatek.com>
To: Marc Zyngier <maz@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
CC: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas
 <bhelgaas@google.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <chuanjia.liu@mediatek.com>
Date: Wed, 26 Jan 2022 11:37:58 +0800
In-Reply-To: <e8e42eba6e7cf49bc2260f20844a7849@kernel.org>
References: <20220125165748.GA1458116@bhelgaas>
 <e8e42eba6e7cf49bc2260f20844a7849@kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_193808_511275_78CA7F7E 
X-CRM114-Status: GOOD (  26.17  )
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

On Tue, 2022-01-25 at 17:21 +0000, Marc Zyngier wrote:
> On 2022-01-25 16:57, Bjorn Helgaas wrote:
> > All patches change *something*.  Can you update the subject line so
> > it
> > says something specific about the change?
> > 
> > Maybe something like "Clear MSI status before dispatching handler"?
> > 
> > On Sun, Jan 23, 2022 at 11:33:06AM +0800, qizhong cheng wrote:
> > > As an edge-triggered interrupts, its interrupt status should be 
> > > cleared
> > > before dispatch to the handler of device.
> > 
> > I'm not an IRQ expert, but the reasoning that "we should clear the
> > MSI
> > interrupt status before dispatching the handler because MSI is an
> > edge-triggered interrupt" doesn't seem completely convincing
> > because
> > your code will now look like this:
> > 
> >   /* Clear the INTx */
> >   writel(1 << bit, port->base + PCIE_INT_STATUS);
> >   generic_handle_domain_irq(port->irq_domain, bit - INTX_SHIFT);
> >   ...
> > 
> >   /* Clear MSI interrupt status */
> >   writel(MSI_STATUS, port->base + PCIE_INT_STATUS);
> >   generic_handle_domain_irq(port->inner_domain, bit);
> > 
> > You clear interrupt status before dispatching the handler for
> > *both*
> > level-triggered INTx interrupts and edge-triggered MSI interrupts.
> > 
> > So it doesn't seem that simply being edge-triggered is the critical
> > factor here.
> 
> This is the usual problem with these half-baked implementations.
> The signalling to the primary interrupt controller is level, as
> they take a multitude of input and (crucially) latch the MSI
> edges. Effectively, this is an edge-to-level converter, with
> all the problems that this creates.
> 
> By clearing the status *after* the handling, you lose edges that
> have been received and coalesced after the read of the status
> register. By clearing it *before*, you are acknowledging the
> interrupts early, and allowing them to be coalesced independently
> of the ones that have been received earlier.
> 
> This is however mostly an educated guess. Someone with access
> to the TRM should verify this.
> 

Yes, as Maz said, we save the edge-interrupt status so that it becomes
a level-interrupt. This is similar to an edge-to-level converter, so we
need to clear it *before*. We found this problem through a lot of
experiments and tested this patch.

Thanks Helgaas and Maz for your comment.

--
Jazz ain't dead, dreams haven't parted with you.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
