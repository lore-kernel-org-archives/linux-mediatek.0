Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3912C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 01:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E2oBy6WUznCbtB5js529Zg93efsENn/lDYeoZId8f38=; b=1BvkXcnsMV/0c/
	qUhfNmmvHdU0fX7QsMvhMHopagS0yDj6KC/l1FAoS9SDppXW4PEZZTwoo6/NDaIUxnNNC3qVMHDie
	jnduoSQp8aF9YZyO4xgDTei6MSReoljZ8Tg/N7zIchiLnHRKawcULkAl9sXa3xa/6jwzKaAqpAY4d
	vJ4WtWcp7dVAn/4ih/apfFQOemhdvqxsqc+jt/HqvW7dBoa5c5muu6UvqqW0A3ciTliqaFWLJSarc
	5T2wN6yfF3MrND64UHIYHwSoa+jZEjrXNlTuOeVlmLhna0kY5HNYvcx5EAxSlQ2Na9GFzRjEsRkHt
	n4O50uLhcYUgQXuix/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr8ul-00GeIF-Mk; Wed, 18 May 2022 01:55:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr8uX-00GeB9-3D; Wed, 18 May 2022 01:55:38 +0000
X-UUID: 1cbb0a577c494262ad5947465d60430c-20220517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NPZeFkDBstYVPwQYeE9RhZaOLOv5eYzckjqE99NDZvg=; 
 b=Fjkv4sbbn2PHjJHKcr9yxlWz7QPTJ8rbqgdEzm8dOgOfWRbLLrjr2/wAf1a8xlgXQrpSa1rTGwvM4AVIujgzQrd6At/qCaTekA3daHXyKEibxtgqiV5tXo/uNcABn4meQoL6zN4Kk4NFTeen0OH3oKBc+OTpZUIAneBZvoPdPZ4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:68286d0e-3aed-4532-8ede-e423d0826d06, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:b2718ee2-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 1cbb0a577c494262ad5947465d60430c-20220517
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1861666930; Tue, 17 May 2022 18:55:31 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 May 2022 18:55:30 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 May 2022 09:55:29 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 May 2022 09:55:28 +0800
Message-ID: <7a10b1d7fc294093f26555a8b5a8748a3c0e1c9f.camel@mediatek.com>
Subject: Re: [PATCH v2] PCI: mediatek-gen3: Print LTSSM state when PCIe link
 down
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <jieyy.yang@mediatek.com>, <chuanjia.liu@mediatek.com>,
 <qizhong.cheng@mediatek.com>, <jian.yang@mediatek.com>
Date: Wed, 18 May 2022 09:55:28 +0800
In-Reply-To: <32f5308e629cef3692c57c4c55442b0f2f25634f.camel@mediatek.com>
References: <20220329030715.7975-1-jianjun.wang@mediatek.com>
 <32f5308e629cef3692c57c4c55442b0f2f25634f.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_185537_330864_486F3771 
X-CRM114-Status: GOOD (  26.89  )
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

Gentle ping for this patch, if there is anything I can do to get this
patch merged, please let me know.

Thanks.

On Fri, 2022-04-22 at 14:33 +0800, Jianjun Wang wrote:
> Hi Maintainers,
> 
> Just gentle ping for this patch, if there is anything I can do to get
> this patch merged, please let me know.
> 
> Thanks.
> 
> On Tue, 2022-03-29 at 11:07 +0800, Jianjun Wang wrote:
> > Print current LTSSM state when PCIe link down instead of the
> > register
> > value, make it easier to get the link status.
> > 
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> > Changes in v2:
> > Print both of the register value and the LTSSM state.
> > ---
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 41
> > ++++++++++++++++++++-
> >  1 file changed, 40 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c
> > b/drivers/pci/controller/pcie-mediatek-gen3.c
> > index 6745076a02b9..c24e03c198b7 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -153,6 +153,37 @@ struct mtk_gen3_pcie {
> >  	DECLARE_BITMAP(msi_irq_in_use, PCIE_MSI_IRQS_NUM);
> >  };
> >  
> > +/* LTSSM state in PCIE_LTSSM_STATUS_REG bit[28:24] */
> > +static const char *const ltssm_str[] = {
> > +	"detect.quiet",			/* 0x00 */
> > +	"detect.active",		/* 0x01 */
> > +	"polling.active",		/* 0x02 */
> > +	"polling.compliance",		/* 0x03 */
> > +	"polling.configuration",	/* 0x04 */
> > +	"config.linkwidthstart",	/* 0x05 */
> > +	"config.linkwidthaccept",	/* 0x06 */
> > +	"config.lanenumwait",		/* 0x07 */
> > +	"config.lanenumaccept",		/* 0x08 */
> > +	"config.complete",		/* 0x09 */
> > +	"config.idle",			/* 0x0A */
> > +	"recovery.receiverlock",	/* 0x0B */
> > +	"recovery.equalization",	/* 0x0C */
> > +	"recovery.speed",		/* 0x0D */
> > +	"recovery.receiverconfig",	/* 0x0E */
> > +	"recovery.idle",		/* 0x0F */
> > +	"L0",				/* 0x10 */
> > +	"L0s",				/* 0x11 */
> > +	"L1.entry",			/* 0x12 */
> > +	"L1.idle",			/* 0x13 */
> > +	"L2.idle",			/* 0x14 */
> > +	"L2.transmitwake",		/* 0x15 */
> > +	"disable",			/* 0x16 */
> > +	"loopback.entry",		/* 0x17 */
> > +	"loopback.active",		/* 0x18 */
> > +	"loopback.exit",		/* 0x19 */
> > +	"hotreset",			/* 0x1A */
> > +};
> > +
> >  /**
> >   * mtk_pcie_config_tlp_header() - Configure a configuration TLP
> > header
> >   * @bus: PCI bus to query
> > @@ -327,8 +358,16 @@ static int mtk_pcie_startup_port(struct
> > mtk_gen3_pcie *pcie)
> >  				 !!(val & PCIE_PORT_LINKUP), 20,
> >  				 PCI_PM_D3COLD_WAIT * USEC_PER_MSEC);
> >  	if (err) {
> > +		const char *ltssm_state;
> > +		int ltssm_index;
> > +
> >  		val = readl_relaxed(pcie->base +
> > PCIE_LTSSM_STATUS_REG);
> > -		dev_err(pcie->dev, "PCIe link down, ltssm reg val:
> > %#x\n", val);
> > +		ltssm_index = PCIE_LTSSM_STATE(val);
> > +		ltssm_state = ltssm_index >= ARRAY_SIZE(ltssm_str) ?
> > +			      "Unknown state" : ltssm_str[ltssm_index];
> > +		dev_err(pcie->dev,
> > +			"PCIe link down, current ltssm state: %s
> > (%#x)\n",
> > +			ltssm_state, val);
> >  		return err;
> >  	}
> >  
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
