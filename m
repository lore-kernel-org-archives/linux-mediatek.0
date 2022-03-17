Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EACC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 09:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ELH4BlpMoRjtczmW0BfrpWmHaDKWajnXJv0cGRD0LPs=; b=Tbm/YvTmoqM7Qt
	iVxoi2ve49kQBMdv4c12P7YcZhXQ0ZyLCj7M9XkbEwSbF8o39/vN/SekXhCCQieCkAqqy0UgwoIIo
	r6bT59g+u6LHauc0kXY+wcNRRPHFpD2t8PtEXRPwm712EmT1b+4J+z1UfnHozl7hbuuDcgP7vk4r2
	7LmbUmcBFc3jGR+yg0ar7PDlJ33RLdwDCrkxtAj00GXsYLYAuXwNfN5Ohrj92OoIxsuvpikUqte8k
	B68fPBBc2n7S8iMB+qsZHaNmECnLgrVU9FE7KCAhVPhoigbixy+UoRCg3Wo5/wHT1qlBjgjt4j6rG
	nx0BwGh/y51o9y9m6AkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUmQ9-00FW0v-Ij; Thu, 17 Mar 2022 09:27:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUmPx-00FVx3-UH; Thu, 17 Mar 2022 09:27:39 +0000
X-UUID: 9acaabf3ba784e189acfdbaee27e70f1-20220317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=7faKRe8Q/hs4LSauYI2KcatuFN4gnXBudUPaAJrrx3w=; 
 b=G2RyFVdZ8T7rl/++kgSID+ceQDnic8FnmnZRz6N5l7rqMpiSZtUMP+LIHNeYqfj1FToj88Qalat5r6Xwf+CsWHzQsDP+qpV6pkoyeSSyh8JCEGhSvQQ3KmEc3EdCtfFyw57G1cPcL/u87ulXg3EpGreHbJ7+VRLg6JEJQ6bxoVg=;
X-UUID: 9acaabf3ba784e189acfdbaee27e70f1-20220317
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1172193320; Thu, 17 Mar 2022 02:27:30 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 02:27:28 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Mar 2022 17:27:21 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Mar 2022 17:27:20 +0800
Message-ID: <602f93f020967789eff49e2fd821d1b03f5b009f.camel@mediatek.com>
Subject: Re: [PATCH V4 4/6] spi: mediatek: add spi memory support for ipm
 design
From: Leilk Liu <leilk.liu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Mark Brown" <broonie@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 17 Mar 2022 17:27:20 +0800
In-Reply-To: <b237c1fe-9ddd-0a2e-ecf2-05bfb984c5dd@collabora.com>
References: <20220315032411.2826-1-leilk.liu@mediatek.com>
 <20220315032411.2826-5-leilk.liu@mediatek.com>
 <b237c1fe-9ddd-0a2e-ecf2-05bfb984c5dd@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_022738_006104_F84F2E63 
X-CRM114-Status: GOOD (  30.35  )
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

On Tue, 2022-03-15 at 10:31 +0100, AngeloGioacchino Del Regno wrote:
> Il 15/03/22 04:24, Leilk Liu ha scritto:
> > this patch add the support of spi-mem for ipm design.
> > 
> > Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> > ---
> >   drivers/spi/spi-mt65xx.c | 349
> > ++++++++++++++++++++++++++++++++++++++-
> >   1 file changed, 348 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
> > index 1a0b3208dfca..8958c3fa4fea 100644
> > --- a/drivers/spi/spi-mt65xx.c
> > +++ b/drivers/spi/spi-mt65xx.c
> 
> ...snip...
> 
> > +
> > +static void of_mtk_spi_parse_dt(struct spi_master *master, struct
> > device_node *nc)
> > +{
> > +	struct mtk_spi *mdata = spi_master_get_devdata(master);
> > +	u32 value;
> > +
> > +	if (!of_property_read_u32(nc, "spi-tx-bus-width", &value)) {
> 
> Hello Leilk,
> 
> thanks for considering my advice about "spi-{tx,rx}-bus-width", but
> there's
> something that you have misunderstood about it.
> 
> Simply, you don't need this function at all. Whatever you are doing
> here is
> already being performed in the Linux SPI framework: at the end of the
> probe
> function, this driver is calling the (legacy)
> devm_spi_register_master(),
> which calls devm_spi_register_controller().
> 
> In drivers/spi/spi.c, function spi_register_controller(), will in
> turn call
> of_register_spi_devices(ctlr) -> of_register_spi_device(ctlr, nc)...
> that
> will end up finally calling function of_spi_parse_dt(ctlr, spi, nc).
> 
> The last mentioned function already contains the logic and setup to
> check
> devicetree properties "spi-tx-bus-width" and "spi-rx-bus-width" (and
> some
> others, as well).
> 
> This means that spi-mt65xx.c already probed these even before your
> IPM
> implementation, hence ***function of_mtk_spi_parse_dt() is not
> needed***.
> 
> Simply drop it and don't check for these properties: that's already
> done.
> 
> 
> Regards,
> Angelo
> 
Hi Angelo,

Thanks for your advice.

There are two spi controllor on MT7986. One supports single/dual mode,
the other supports quad mode. Both of them can support spi memory
framework(one's tx/rx bus width is 1/2, the other one's tx/rx bus width
is 1/2/4). 

Can I use of_mtk_spi_parse_dt() to parse the information? What's your
suggestion?

Thanks!


> > +		switch (value) {
> > +		case 1:
> > +			break;
> > +		case 2:
> > +			master->mode_bits |= SPI_TX_DUAL;
> > +			break;
> > +		case 4:
> > +			master->mode_bits |= SPI_TX_QUAD;
> > +			break;
> > +		default:
> > +			dev_warn(mdata->dev,
> > +				 "spi-tx-bus-width %d not supported\n",
> > +				value);
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (!of_property_read_u32(nc, "spi-rx-bus-width", &value)) {
> > +		switch (value) {
> > +		case 1:
> > +			break;
> > +		case 2:
> > +			master->mode_bits |= SPI_RX_DUAL;
> > +			break;
> > +		case 4:
> > +			master->mode_bits |= SPI_RX_QUAD;
> > +			break;
> > +		case 8:
> > +			master->mode_bits |= SPI_RX_OCTAL;
> > +			break;
> > +		default:
> > +			dev_warn(mdata->dev,
> > +				 "spi-rx-bus-width %d not supported\n",
> > +				value);
> > +			break;
> > +		}
> > +	}
> > +}
> > +
> >   static int mtk_spi_probe(struct platform_device *pdev)
> >   {
> >   	struct spi_master *master;
> > @@ -830,6 +1170,13 @@ static int mtk_spi_probe(struct
> > platform_device *pdev)
> >   	if (mdata->dev_comp->ipm_design)
> >   		master->mode_bits |= SPI_LOOP;
> >   
> > +	if (mdata->dev_comp->ipm_design) {
> > +		mdata->dev = &pdev->dev;
> > +		master->mem_ops = &mtk_spi_mem_ops;
> > +		of_mtk_spi_parse_dt(master, pdev->dev.of_node);
> > +		init_completion(&mdata->spimem_done);
> > +	}
> > +
> >   	if (mdata->dev_comp->need_pad_sel) {
> >   		mdata->pad_num = of_property_count_u32_elems(
> >   			pdev->dev.of_node,
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
