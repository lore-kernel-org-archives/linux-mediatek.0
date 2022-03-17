Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5D5C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 09:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ukc+jQZPmdOQo4lO3ily2W5rtYH4oblvCzb+8NRBedA=; b=mJPZK6L5n1ceUV
	qeaIkJ5eyE+pZBTjhDR+rQY+T5daMdGYtbGTomOJ14w6tG9WlyfHsqx0dTwj95nfYyyarFxc4QF+b
	GJiupwm+DuPwNDc1LAgCBs+PToOoqCAiP0Y6Ez12X/wUQ2xeaYC3fwRgBLXJR5AAp5H+l3WvAf9KL
	LnTy2PxE75/upOu1sdk8RNSEL+bzA8BFKBzL8C3m2JZ0C/uV7xLZS5S2l470b3EETLoPlAe3OvaaW
	gmvSbeIZYSlEm1YQnbZMVutctE56Of/PzYF6Pk2qlANcKRuXM3k8E0YSUrQIfV8lEzVf5OuU8IsCz
	wCsKj85yzEnC8M7cBKxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUmio-00FZcv-6t; Thu, 17 Mar 2022 09:47:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUmib-00FZYV-0J; Thu, 17 Mar 2022 09:46:55 +0000
X-UUID: 69f9876f68bd423abceabb14997f1d53-20220317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=dWT0+lUgrRHS5RkfH0Ay6pPNP1NxAfU+eaNkJylBkYA=; 
 b=PmpEt8hiEu1aM17/g+BJwnM/8cqSanve7EppkU1BicpsuGZuGWrRFPzNOsKKpsJmSnQKfPsDAKUQ+0God9GXndbWsIylhogmy0NQK4U7bCJ/8P18BZBqLHSYlTDce4UaXn+KiMeZafgf5zFsUKNLNcLSYgyEeFuexyyHKGsbPvk=;
X-UUID: 69f9876f68bd423abceabb14997f1d53-20220317
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 966945539; Thu, 17 Mar 2022 02:46:49 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 02:44:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Mar 2022 17:44:06 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Mar 2022 17:44:04 +0800
Message-ID: <85717fa0b71f26431e4ca5de794e79c32c503552.camel@mediatek.com>
Subject: Re: [PATCH V4 4/6] spi: mediatek: add spi memory support for ipm
 design
From: Leilk Liu <leilk.liu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Mark Brown" <broonie@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 17 Mar 2022 17:44:04 +0800
In-Reply-To: <b6394c1a-28ee-f4bb-434f-afd311893fb8@collabora.com>
References: <20220315032411.2826-1-leilk.liu@mediatek.com>
 <20220315032411.2826-5-leilk.liu@mediatek.com>
 <b237c1fe-9ddd-0a2e-ecf2-05bfb984c5dd@collabora.com>
 <602f93f020967789eff49e2fd821d1b03f5b009f.camel@mediatek.com>
 <b6394c1a-28ee-f4bb-434f-afd311893fb8@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_024653_082854_A2680DE0 
X-CRM114-Status: GOOD (  37.92  )
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

On Thu, 2022-03-17 at 10:33 +0100, AngeloGioacchino Del Regno wrote:
> Il 17/03/22 10:27, Leilk Liu ha scritto:
> > On Tue, 2022-03-15 at 10:31 +0100, AngeloGioacchino Del Regno
> > wrote:
> > > Il 15/03/22 04:24, Leilk Liu ha scritto:
> > > > this patch add the support of spi-mem for ipm design.
> > > > 
> > > > Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> > > > ---
> > > >    drivers/spi/spi-mt65xx.c | 349
> > > > ++++++++++++++++++++++++++++++++++++++-
> > > >    1 file changed, 348 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-
> > > > mt65xx.c
> > > > index 1a0b3208dfca..8958c3fa4fea 100644
> > > > --- a/drivers/spi/spi-mt65xx.c
> > > > +++ b/drivers/spi/spi-mt65xx.c
> > > 
> > > ...snip...
> > > 
> > > > +
> > > > +static void of_mtk_spi_parse_dt(struct spi_master *master,
> > > > struct
> > > > device_node *nc)
> > > > +{
> > > > +	struct mtk_spi *mdata = spi_master_get_devdata(master);
> > > > +	u32 value;
> > > > +
> > > > +	if (!of_property_read_u32(nc, "spi-tx-bus-width",
> > > > &value)) {
> > > 
> > > Hello Leilk,
> > > 
> > > thanks for considering my advice about "spi-{tx,rx}-bus-width",
> > > but
> > > there's
> > > something that you have misunderstood about it.
> > > 
> > > Simply, you don't need this function at all. Whatever you are
> > > doing
> > > here is
> > > already being performed in the Linux SPI framework: at the end of
> > > the
> > > probe
> > > function, this driver is calling the (legacy)
> > > devm_spi_register_master(),
> > > which calls devm_spi_register_controller().
> > > 
> > > In drivers/spi/spi.c, function spi_register_controller(), will in
> > > turn call
> > > of_register_spi_devices(ctlr) -> of_register_spi_device(ctlr,
> > > nc)...
> > > that
> > > will end up finally calling function of_spi_parse_dt(ctlr, spi,
> > > nc).
> > > 
> > > The last mentioned function already contains the logic and setup
> > > to
> > > check
> > > devicetree properties "spi-tx-bus-width" and "spi-rx-bus-width"
> > > (and
> > > some
> > > others, as well).
> > > 
> > > This means that spi-mt65xx.c already probed these even before
> > > your
> > > IPM
> > > implementation, hence ***function of_mtk_spi_parse_dt() is not
> > > needed***.
> > > 
> > > Simply drop it and don't check for these properties: that's
> > > already
> > > done.
> > > 
> > > 
> > > Regards,
> > > Angelo
> > > 
> > 
> > Hi Angelo,
> > 
> > Thanks for your advice.
> > 
> > There are two spi controllor on MT7986. One supports single/dual
> > mode,
> > the other supports quad mode. Both of them can support spi memory
> > framework(one's tx/rx bus width is 1/2, the other one's tx/rx bus
> > width
> > is 1/2/4).
> > 
> > Can I use of_mtk_spi_parse_dt() to parse the information? What's
> > your
> > suggestion?
> > 
> > Thanks!
> > 
> 
> As I've already said, this does NOT require any devicetree handling
> in
> spi-mt65xx.c, as setting the right mode_bits is already handled in
> drivers/spi/spi.c - please follow the explaination that I have given
> before to fully understand the situation.
> 
> Regards,
> Angelo
> 
OK, I'll fix it, thanks.

> 
> > 
> > > > +		switch (value) {
> > > > +		case 1:
> > > > +			break;
> > > > +		case 2:
> > > > +			master->mode_bits |= SPI_TX_DUAL;
> > > > +			break;
> > > > +		case 4:
> > > > +			master->mode_bits |= SPI_TX_QUAD;
> > > > +			break;
> > > > +		default:
> > > > +			dev_warn(mdata->dev,
> > > > +				 "spi-tx-bus-width %d not
> > > > supported\n",
> > > > +				value);
> > > > +			break;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	if (!of_property_read_u32(nc, "spi-rx-bus-width",
> > > > &value)) {
> > > > +		switch (value) {
> > > > +		case 1:
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
