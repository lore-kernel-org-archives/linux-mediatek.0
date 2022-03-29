Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9862C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 02:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1GzjigIIu6FiXMqDf9Z7BbmTV9MqaiPAu3T/pPgE4yg=; b=QrEuO6WqHNtABi
	1dEhx7ZNt7K3RJsMAcBYWyXvRMI4B1cqfkIrJP8VuhV95tDh0lM0hzJXnXDKddTkPQJm+jMF5S9Le
	2XrgCI2diHTMhoQtpx5L6WKRRkof0nKAqK8mbU40X9aRcJaf651/YTvQBWq8eNuX+EZKzAngfQrWK
	6zZglI2mokw3NpolgTkH4mwHMjFjBo7/JNwWCGX/D25xc+2AknCid8dvvQFz61J2+iY7TwFxJCIKp
	ZpTxQ1mTLSztGzXZmqZp30fAZNRenUSaOzUpNafYNGXFC3vynFJr0qUUVJLMBNSkpQulBjzA29Wwq
	gbYctyRxFb05cYREwd8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ1KL-00Ahlv-CV; Tue, 29 Mar 2022 02:11:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ1K6-00AhjK-W7; Tue, 29 Mar 2022 02:11:09 +0000
X-UUID: 58ea0046d53243e5a4c3e4f60c09acfd-20220328
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=x5AyyUBvlMiawQUO0d3OT7MpXUOUwdYfEN3OK4pPh4Y=; 
 b=YygvhpwXDKfND8kBgzbsFBXWstCx4ogPhQlyAST5uFYLTe3kFQwMa7EegbY0efFsAJS4nwmWOE5lV8ZcGja61T+AoBeC7ITHd4fIDHOOVp9FeeNgbemHMxhAZYeSAYpVQdOqqLqrGRVnxlUlw0b2kPuamkujHeSn+ES5fx6IFdU=;
X-UUID: 58ea0046d53243e5a4c3e4f60c09acfd-20220328
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 537974539; Mon, 28 Mar 2022 19:10:55 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Mar 2022 19:00:52 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Mar 2022 10:00:50 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Mar 2022 10:00:50 +0800
Message-ID: <c074fc33a64bd09b583b0aae58e950b0d826d82e.camel@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek-gen3: Print LTSSM state when PCIe link down
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <jieyy.yang@mediatek.com>, <chuanjia.liu@mediatek.com>,
 <qizhong.cheng@mediatek.com>, <jian.yang@mediatek.com>
Date: Tue, 29 Mar 2022 10:00:49 +0800
In-Reply-To: <cd9c7d5c-4ab6-2795-2bba-9deedb8198e3@collabora.com>
References: <20220324072548.11408-1-jianjun.wang@mediatek.com>
 <cd9c7d5c-4ab6-2795-2bba-9deedb8198e3@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_191107_086987_6ECD4964 
X-CRM114-Status: GOOD (  21.88  )
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

On Mon, 2022-03-28 at 16:39 +0200, AngeloGioacchino Del Regno wrote:
> Il 24/03/22 08:25, Jianjun Wang ha scritto:
> > Print current LTSSM state when PCIe link down instead of the
> > register
> > value, make it easier to get the link status.
> > 
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> 
> Hello Jianjun,
> this patch is really helpful when comes to understand the source of
> an issue,
> so I agree with it - and thank you for that.
> 
> Though, I think that you should still print the hex number along with
> the
> meaning of it, check below:
> 
> > ---
> >   drivers/pci/controller/pcie-mediatek-gen3.c | 40
> > ++++++++++++++++++++-
> >   1 file changed, 39 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c
> > b/drivers/pci/controller/pcie-mediatek-gen3.c
> > index 7705d61fba4c..54663f025e27 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> 
> ..snip..
> 
> > @@ -327,8 +358,15 @@ static int mtk_pcie_startup_port(struct
> > mtk_gen3_pcie *pcie)
> >   				 !!(val & PCIE_PORT_LINKUP), 20,
> >   				 PCI_PM_D3COLD_WAIT * USEC_PER_MSEC);
> >   	if (err) {
> > +		const char *ltssm_state;
> > +		int ltssm_index;
> > +
> >   		val = readl_relaxed(pcie->base +
> > PCIE_LTSSM_STATUS_REG);
> > -		dev_err(pcie->dev, "PCIe link down, ltssm reg val:
> > %#x\n", val);
> > +		ltssm_index = PCIE_LTSSM_STATE(val);
> > +		ltssm_state = ltssm_index >= ARRAY_SIZE(ltssm_str) ?
> > +			      "Unknown state" : ltssm_str[ltssm_index];
> > +		dev_err(pcie->dev, "PCIe link down, current ltssm
> > state: %s\n",
> 
> There, I think that you should do:
> 
> dev_err(pcie->dev, "PCIe link down, current LTSSM state: %s (%#x)\n",
> 	ltssm_state, val);
> 
> this will be extremely useful in the "Unknown state" case.
> 
> After fixing that,
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Thanks!

> 
> Regards,
> Angelo
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
