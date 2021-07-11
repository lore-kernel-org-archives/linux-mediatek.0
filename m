Return-Path: <SRS0=zHGV=MD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059B5C07E96
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Jul 2021 08:30:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B068B611F1
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Jul 2021 08:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B068B611F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aL0psUOZlfAO7kAfoB0+3twXcv2wuaGIdjvbAWEc8hw=; b=351cvA9JOWdr3V
	EkRvyuztHklaRjkd/lRBn2ZqgkqkBUiRuBrzhUiZQpuEGXD6jNFE+bCMztfISPDlqauVXsxZ41wTh
	xMBLLMyeI/nll+C/laZPUdpktVipgSWFEe505u5OAGnko4y6ReCjqmWYRlp8AUTokqWRBkXkJ4typ
	LWDpv46GQVWsw3eWoxO4YuSlngMQ8+96hcYNNe6eq7NgZxAKUp8byQ+iFIUD1ZkKQJS60fIHGBIkj
	0HkbrBXCKuZAFBgH5aATEkQKrLrW/PFYLrTeWZM55rZ6vbe3jOPptSeWRJMUm/r2YrDiaiOv7dvwk
	mIqsN4pi/asUMpn6u6iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2Uqv-004ict-HC; Sun, 11 Jul 2021 08:30:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2Uqq-004icC-HI; Sun, 11 Jul 2021 08:30:14 +0000
X-UUID: 9df0fe03d7c34f52a4fe38aafe522410-20210711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=t9mLnCFBNPQ+QFBApPB3w3g/T+cWtNxPL3HGdUb3WsA=; 
 b=iyijnGoDBCAKLaJbAoNDrkvq1J5QEqOoWQ401AkZkzyB8w4mmgc3XKcPgP9RYdgRj3/Ei5iVY8zXeDsvKVT5jPDagwKv9YV3ym4jg0i1S6mRM62hotVS5ovbsvGlv5YdSxVh8SmpL/iv6gXb7iPmkZaEUxx50oQhTADLPOJH8c4=;
X-UUID: 9df0fe03d7c34f52a4fe38aafe522410-20210711
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1119610898; Sun, 11 Jul 2021 01:30:04 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Jul 2021 01:30:02 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 11 Jul 2021 16:29:59 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 11 Jul 2021 16:29:59 +0800
Message-ID: <1625992199.22309.15.camel@mhfsdcap03>
Subject: Re: [PATCH 3/9] memory: mtk-smi: Use clk_bulk instead of the clk ops
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Joerg
 Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <youlin.pei@mediatek.com>,
 <anan.sun@mediatek.com>, <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>, 
 <anthony.huang@mediatek.com>
Date: Sun, 11 Jul 2021 16:29:59 +0800
In-Reply-To: <4047dfaf-f2f8-b6b2-52fd-41821475b162@canonical.com>
References: <20210616114346.18812-1-yong.wu@mediatek.com>
 <20210616114346.18812-4-yong.wu@mediatek.com>
 <4047dfaf-f2f8-b6b2-52fd-41821475b162@canonical.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 755D024FD7727026C23CB3E6A5D8D9521A587CF4AB7DEEF2F8C0332526F861752000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210711_013012_625871_EB3BB50C 
X-CRM114-Status: GOOD (  29.63  )
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

On Thu, 2021-07-08 at 11:32 +0200, Krzysztof Kozlowski wrote:
> On 16/06/2021 13:43, Yong Wu wrote:
> > smi have many clocks: apb/smi/gals.
> > This patch use clk_bulk interface instead of the orginal one to simply
> > the code.
> > 
> > gals is optional clk(some larbs may don't have gals). use clk_bulk_optional
> > instead. and then remove the has_gals flag.
> > 
> > Also remove clk fail logs since bulk interface already output fail log.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/memory/mtk-smi.c | 124 +++++++++++----------------------------
> >  1 file changed, 34 insertions(+), 90 deletions(-)
> > 
> > diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> > index c5fb51f73b34..bcd2bf130655 100644
> > --- a/drivers/memory/mtk-smi.c
> > +++ b/drivers/memory/mtk-smi.c
> > @@ -60,9 +60,18 @@ enum mtk_smi_gen {
> >  	MTK_SMI_GEN2
> >  };
> >  
> > +#define MTK_SMI_CLK_NR_MAX			4
> > +
> > +static const char * const mtk_smi_common_clocks[] = {
> > +	"apb", "smi", "gals0", "gals1", /* glas is optional */
> 
> Typo here - glas.

Will Fix. Thanks.

> 
> > +};
> > +

[snip]

> > @@ -493,7 +449,7 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
> >  	struct device *dev = &pdev->dev;
> >  	struct mtk_smi *common;
> >  	struct resource *res;
> > -	int ret;
> > +	int i, ret;
> >  
> >  	common = devm_kzalloc(dev, sizeof(*common), GFP_KERNEL);
> >  	if (!common)
> > @@ -501,23 +457,13 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
> >  	common->dev = dev;
> >  	common->plat = of_device_get_match_data(dev);
> >  
> > -	common->clk_apb = devm_clk_get(dev, "apb");
> > -	if (IS_ERR(common->clk_apb))
> > -		return PTR_ERR(common->clk_apb);
> > -
> > -	common->clk_smi = devm_clk_get(dev, "smi");
> > -	if (IS_ERR(common->clk_smi))
> > -		return PTR_ERR(common->clk_smi);
> > +	common->clk_num = ARRAY_SIZE(mtk_smi_common_clocks);
> > +	for (i = 0; i < common->clk_num; i++)
> > +		common->clks[i].id = mtk_smi_common_clocks[i];
> >  
> > -	if (common->plat->has_gals) {
> > -		common->clk_gals0 = devm_clk_get(dev, "gals0");
> > -		if (IS_ERR(common->clk_gals0))
> > -			return PTR_ERR(common->clk_gals0);
> > -
> > -		common->clk_gals1 = devm_clk_get(dev, "gals1");
> > -		if (IS_ERR(common->clk_gals1))
> > -			return PTR_ERR(common->clk_gals1);
> > -	}
> > +	ret = devm_clk_bulk_get_optional(dev, common->clk_num, common->clks);
> > +	if (ret)
> > +		return ret;
> 
> How do you handle now missing required clocks?

It looks this is a common issue for this function which supports all the
clocks could be optional. Is there common suggestion for this?

For our case, the apb/smi clocks are required while "gals" are optional.

thus, we should use devm_clk_bulk_get for the necessary clocks and
devm_clk_bulk_get_optional for the optional ones. right?

> 
> >  
> >  	/*
> >  	 * for mtk smi gen 1, we need to get the ao(always on) base to config
> > @@ -561,11 +507,9 @@ static int __maybe_unused mtk_smi_common_resume(struct device *dev)
> >  	u32 bus_sel = common->plat->bus_sel;
> >  	int ret;
> >  
> > -	ret = mtk_smi_clk_enable(common);
> > -	if (ret) {
> > -		dev_err(common->dev, "Failed to enable clock(%d).\n", ret);
> > +	ret = clk_bulk_prepare_enable(common->clk_num, common->clks);
> > +	if (ret)
> >  		return ret;
> > -	}
> >  
> >  	if (common->plat->gen == MTK_SMI_GEN2 && bus_sel)
> >  		writel(bus_sel, common->base + SMI_BUS_SEL);
> > @@ -576,7 +520,7 @@ static int __maybe_unused mtk_smi_common_suspend(struct device *dev)
> >  {
> >  	struct mtk_smi *common = dev_get_drvdata(dev);
> >  
> > -	mtk_smi_clk_disable(common);
> > +	clk_bulk_disable_unprepare(common->clk_num, common->clks);
> >  	return 0;
> >  }
> >  
> > 
> 
> 
> Best regards,
> Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
