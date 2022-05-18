Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8735CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 02:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q9goQL8YDuCL9OIdzXFyvlS8QVJ8AdBFqtwi6i9QPYQ=; b=mG1F/i2ZKRME1x
	ZacovtDnyPy4uTiOWopsDBPwMxkWw+3DSD6jFBaIM2h+fUu0Wk99nHNHYRz0YFoi7t95qlCjhZi/L
	XW/gBnYRyoqrzpnP1+GS9Ky/zSzzwZN5esyjRGMTLiOvJlj2yFhdodBXvhR65mriS12NuS8S3nK2R
	VH9IzRDGMqNJAb70jMq5pHaI8L8s/hMUaz7layfk6RtyY6oAd+HxqjI3uaYtX4yO4MQJGY52i3tf4
	rIM9mqXPwLHfKp7KiRxW2cGq2PXhIqYOuXWgBwZt8nlnz/a0yQjnTeN8IZYURGjEv0kObKI0/UIoX
	Vjb28ESB+hxWsV0zc0CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr9Jm-00GhXT-Vq; Wed, 18 May 2022 02:21:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr9Jb-00GhWA-MX; Wed, 18 May 2022 02:21:33 +0000
X-UUID: cf2b76ce1b9f4e44907190b481b53d66-20220517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=LXkOG9D6XEdFm7SxKof7YFQUeMPJyp1wipk9Vmb2i+c=; 
 b=TB4MeCqETDmzNycOUZt+BIN0aoPp7bDPqsM9EzU807FrKgCMG9jrrDONAMHpyb9IV/BGY1jdcFRh+ko/3WTcdtUM/QuZ6Jl/zfdFeqTGgYGT3HnyVrHH0TIa6KPdtGANF1CQjXoFoVTRKK481/cQRbijIPkDRlNqTQicvxLPtWA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:60738092-3589-4c22-8443-559cafd8969d, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:2a19b09, CLOUDID:c08f8fe2-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: cf2b76ce1b9f4e44907190b481b53d66-20220517
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1998545340; Tue, 17 May 2022 19:21:28 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 May 2022 19:21:27 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 May 2022 10:21:25 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 18 May 2022 10:21:23 +0800
Message-ID: <124a48372c1ce0c28433f5c93ba1b4ac222ae9b8.camel@mediatek.com>
Subject: Re: [PATCH v8 2/2] phy: mediatek: Add PCIe PHY driver
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>, "Vinod
 Koul" <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
CC: Wei-Shun Chang <weishunc@google.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <randy.wu@mediatek.com>,
 <jieyy.yang@mediatek.com>, <chuanjia.liu@mediatek.com>,
 <qizhong.cheng@mediatek.com>, <jian.yang@mediatek.com>
Date: Wed, 18 May 2022 10:21:20 +0800
In-Reply-To: <8affe58a4952d6c405dd41f18c6a7f40b2313fde.camel@mediatek.com>
References: <20220507060621.32252-1-jianjun.wang@mediatek.com>
 <20220507060621.32252-3-jianjun.wang@mediatek.com>
 <8affe58a4952d6c405dd41f18c6a7f40b2313fde.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_192131_787034_0D54C010 
X-CRM114-Status: GOOD (  24.47  )
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

On Wed, 2022-05-11 at 11:22 +0800, Rex-BC Chen wrote:
> On Sat, 2022-05-07 at 14:06 +0800, Jianjun Wang wrote:
> > Add PCIe GEN3 PHY driver support on MediaTek chipsets.
> > 
> > +
> > +static int mtk_pcie_phy_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct phy_provider *provider;
> > +	struct mtk_pcie_phy *pcie_phy;
> > +	int ret;
> > +
> > +	pcie_phy = devm_kzalloc(dev, sizeof(*pcie_phy), GFP_KERNEL);
> > +	if (!pcie_phy)
> > +		return -ENOMEM;
> > +
> > +	pcie_phy->sif_base =
> > devm_platform_ioremap_resource_byname(pdev, "sif");
> > +	if (IS_ERR(pcie_phy->sif_base))
> > +		return dev_err_probe(dev, PTR_ERR(pcie_phy->sif_base),
> > +				     "Failed to map phy-sif base\n");
> > +
> > +	pcie_phy->phy = devm_phy_create(dev, dev->of_node,
> > &mtk_pcie_phy_ops);
> > +	if (IS_ERR(pcie_phy->phy))
> > +		return dev_err_probe(dev, PTR_ERR(pcie_phy->phy),
> > +				     "Failed to create PCIe phy\n");
> > +
> > +	pcie_phy->dev = dev;
> > +	pcie_phy->data = of_device_get_match_data(dev);
> > +	if (!pcie_phy->data)
> > +		return dev_err_probe(dev, -EINVAL, "Failed to get phy
> > data\n");
> > +
> > +	if (pcie_phy->data->sw_efuse_supported) {
> > +		/*
> > +		 * Failed to read the efuse data is not a fatal
> > problem,
> > +		 * ignore the failure and keep going.
> > +		 */
> > +		ret = mtk_pcie_read_efuse(pcie_phy);
> > +		if (ret == -EPROBE_DEFER)
> > +			return ret;
> 
> Hello Jianjun,
> 
> even though it's not a fatal problem if we can not read efuse, but I
> tink "ret = -ENOMEM" does not mean we can't read it?
> 
> Do we need to handle this?

Yes, I think we should handle it in this case, I'll fix it in the next
version, thanks for your review.

Thanks.

> 
> BRs,
> Rex
> > +	}
> > +
> > +	phy_set_drvdata(pcie_phy->phy, pcie_phy);
> > +
> > +	provider = devm_of_phy_provider_register(dev,
> > of_phy_simple_xlate);
> > +	if (IS_ERR(provider))
> > +		return dev_err_probe(dev, PTR_ERR(provider),
> > +				     "PCIe phy probe failed\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct mtk_pcie_phy_data mt8195_data = {
> > +	.num_lanes = 2,
> > +	.sw_efuse_supported = true,
> > +};
> > +
> > +static const struct of_device_id mtk_pcie_phy_of_match[] = {
> > +	{ .compatible = "mediatek,mt8195-pcie-phy", .data =
> > &mt8195_data },
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(of, mtk_pcie_phy_of_match);
> > +
> > +static struct platform_driver mtk_pcie_phy_driver = {
> > +	.probe	= mtk_pcie_phy_probe,
> > +	.driver	= {
> > +		.name = "mtk-pcie-phy",
> > +		.of_match_table = mtk_pcie_phy_of_match,
> > +	},
> > +};
> > +module_platform_driver(mtk_pcie_phy_driver);
> > +
> > +MODULE_DESCRIPTION("MediaTek PCIe PHY driver");
> > +MODULE_AUTHOR("Jianjun Wang <jianjun.wang@mediatek.com>");
> > +MODULE_LICENSE("GPL");
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
