Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1574EECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 04:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rLsStbz5cgwBp8n8FSrzzs21pF96RWU9pVe4cDU0NkI=; b=Yv6cFjIdvnihg1b29Cdnw5WOO7
	JOPSOhMuKmz/ryaKHxPh3dYLPvoYA0T6Ddd8nNxz00ZcYK2XbvtSiro3YfTpX2eyQerSKeVZ/XbJk
	PjPkxT6Ss1g0z7pi96NLZw5R2mHIB/5G20AwAUCSxlydSFIHL+Gsg5obQ4QUfsO79Slf5fQd3L8mN
	LY5OX0b3Ph2hy8US9L87aVPZmFYOJBBS1ugPnJufAJ/Mad1XLHQ9qakolIZjK7yhQmqIVL/C8SNUh
	McQoFkstcTD5y+T+xy96uEPlnyR3Jx7u3tXBPOifZrHsbwVEofLT0XUpTCy36yXwBvCJVZPotwq33
	XX4+M06w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTFQa-003jkl-Hr; Wed, 31 Aug 2022 04:34:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTFQX-003jjc-Bf; Wed, 31 Aug 2022 04:34:11 +0000
X-UUID: 199a76412db942d0961639e322b40e9c-20220830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=rLsStbz5cgwBp8n8FSrzzs21pF96RWU9pVe4cDU0NkI=;
	b=emTBwVCOS0/MYLGbkYN+c9XuRBrrYd+GswYzN3we1+53ZwyPPJDgdmfxHB9aSycIvrYfs5gZUCjthiNRC6lPScL5FKg4YS9qeO3ADHM82TjbhACB8AN7Cc9drupJpniVFpJfchjNN3zta9B0Vju+lIQXyEB8qsh1SDV82WMps5E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:2ee21a21-7dfe-4d1d-9dc7-8e237c793f1c,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:9b1c1a56-e800-47dc-8adf-0c936acf4f1b,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 199a76412db942d0961639e322b40e9c-20220830
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2086366982; Tue, 30 Aug 2022 21:33:58 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 31 Aug 2022 11:43:22 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 31 Aug 2022 11:43:22 +0800
Message-ID: <60e39b9bc27850f9ba1be5bf1a28a32a9fd016ae.camel@mediatek.com>
Subject: Re: [V13,3/7] mtk-jpegenc: support jpegenc multi-hardware
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	<irui.wang@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<hverkuil-cisco@xs4all.nl>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <maoguang.meng@mediatek.com>,
	<matthias.bgg@gmail.com>, <mchehab@kernel.org>,
	<nicolas.dufresne@collabora.com>, <robh+dt@kernel.org>, <tfiga@chromium.org>,
	<tzungbi@chromium.org>, <wenst@chromium.org>, <xia.jiang@mediatek.com>
Date: Wed, 31 Aug 2022 11:43:21 +0800
In-Reply-To: <eba77c0f-7c1a-ad09-eca0-529e59c7f6ed@wanadoo.fr>
References: <20220826092956.10340-1-irui.wang@mediatek.com>
	 <20220826092956.10340-4-irui.wang@mediatek.com>
	 <eba77c0f-7c1a-ad09-eca0-529e59c7f6ed@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_213409_418186_13BE214E 
X-CRM114-Status: GOOD (  25.57  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2022-08-26 at 11:45 +0200, Christophe JAILLET wrote:
> Le 26/08/2022 à 11:29, Irui Wang a écrit :
> > From: kyrie wu <kyrie.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > 
> > support jpeg encode multi-hardware includes HW0 and HW1.
> > 
> > Signed-off-by: kyrie wu <
> > kyrie.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: irui wang <
> > irui.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >   drivers/media/platform/mediatek/jpeg/Makefile |  11 +-
> >   .../platform/mediatek/jpeg/mtk_jpeg_core.c    |  67 +++----
> >   .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  37 ++++
> >   .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 163
> > ++++++++++++++++++
> >   4 files changed, 245 insertions(+), 33 deletions(-)
> 
> [...]
> 
> > static int mtk_jpegenc_hw_init_irq(struct mtk_jpegenc_comp_dev
> > *dev)
> > +{
> > +	struct platform_device *pdev = dev->plat_dev;
> > +	int ret;
> > +
> > +	dev->jpegenc_irq = platform_get_irq(pdev, 0);
> > +	if (dev->jpegenc_irq < 0) {
> > +		dev_err(&pdev->dev, "Failed to get irq resource");
> 
> Hi,
> 
> Should there be a v14, this dev_err() is useless.
> platform_get_irq() already prints a more informative message.

Hi Christophe,

thanks for your introduction about platform_get_irq(),
I will remove it.
> 
> > +		return dev->jpegenc_irq;
> > +	}
> > +
> > +	ret = devm_request_irq(&pdev->dev,
> > +			       dev->jpegenc_irq,
> > +			       mtk_jpegenc_hw_irq_handler,
> > +			       0,
> > +			       pdev->name, dev);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Failed to devm_request_irq %d
> > (%d)",
> > +			dev->jpegenc_irq, ret);
> > +		return -ENOENT;
> 
> Why not propagate 'ret' here?

yeah, kindly suggestion, maybe ret contains enough messages for this
error.
> 
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
> > +{
> > +	struct mtk_jpegenc_clk *jpegenc_clk;
> > +	struct mtk_jpeg_dev *master_dev;
> > +	struct mtk_jpegenc_comp_dev *dev;
> > +	int ret, i;
> > +
> > +	struct device *decs = &pdev->dev;
> > +
> > +	if (!decs->parent)
> > +		return -EPROBE_DEFER;
> > +
> > +	master_dev = dev_get_drvdata(decs->parent);
> > +	if (!master_dev)
> > +		return -EPROBE_DEFER;
> > +
> > +	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> > +	if (!dev)
> > +		return -ENOMEM;
> > +
> > +	dev->plat_dev = pdev;
> > +	dev->dev = &pdev->dev;
> > +
> > +	if (!master_dev->is_jpgenc_multihw) {
> > +		master_dev->is_jpgenc_multihw = true;
> > +		for (i = 0; i < MTK_JPEGENC_HW_MAX; i++)
> > +			master_dev->enc_hw_dev[i] = NULL;
> > +	}
> > +
> > +	jpegenc_clk = &dev->venc_clk;
> > +
> > +	jpegenc_clk->clk_num = devm_clk_bulk_get_all(&pdev->dev,
> > +						     &jpegenc_clk-
> > >clks);
> > +	if (jpegenc_clk->clk_num < 0)
> > +		return dev_err_probe(&pdev->dev, jpegenc_clk->clk_num,
> > +				     "Failed to get jpegenc clock
> > count\n");
> > +
> > +	dev->reg_base =
> > +		devm_platform_ioremap_resource(pdev, 0);
> 
> This can be written on 1 line only.
> 
> just my 2c,
> 
> CJ

OK, I will update this item.

Thanks.

Regards,
Kyire.
> 
> > +	if (IS_ERR(dev->reg_base))
> > +		return PTR_ERR(dev->reg_base);
> > +
> > +	ret = mtk_jpegenc_hw_init_irq(dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
> > +		if (master_dev->enc_hw_dev[i])
> > +			continue;
> > +
> > +		master_dev->enc_hw_dev[i] = dev;
> > +		master_dev->reg_encbase[i] = dev->reg_base;
> > +		dev->master_dev = master_dev;
> > +	}
> > +
> > +	platform_set_drvdata(pdev, dev);
> > +	pm_runtime_enable(&pdev->dev);
> > +
> > +	return 0;
> > +}
> > +
> > +struct platform_driver mtk_jpegenc_hw_driver = {
> > +	.probe = mtk_jpegenc_hw_probe,
> > +	.driver = {
> > +		.name = "mtk-jpegenc-hw",
> > +		.of_match_table = of_match_ptr(mtk_jpegenc_drv_ids),
> > +	},
> > +};
> > +
> > +module_platform_driver(mtk_jpegenc_hw_driver);
> > +
> > +MODULE_DESCRIPTION("MediaTek JPEG encode HW driver");
> > +MODULE_LICENSE("GPL");
> 
> 


