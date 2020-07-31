Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A601C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 03:21:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E924B2083E
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 03:21:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jt0MVWWs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="X9UoXAr6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E924B2083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tu0yhgvfQhAkOICWXFDIzrxKfmeyPGDJMCapJ+LGFtQ=; b=jt0MVWWsmwQKQeSxmAJmNSaOm
	srKBCgf3n+PnsBMBtbv0n5DzClSKqU1yZ+r9z6lGriZi3+EDzWVBuOt9pirPE+05T1+rMPp1EADBJ
	K4V5m6jCTwqWqG6cwN4HAw7K/p8F13ca6FU0Q49B5U4NXz8qMjFMYPna/GKrOMPI/nEacIP/Hh043
	1rh07j9CxUlRKS680u/HeYgXV3fQg5m7tiNzJ3UHG+WrGlYQoUR1AZ4cCzewsteDMzQ7FR4Bsuh7g
	+XLaETqf9yznuXzflpAy8t5iKTm8mBzqZ9kJhKwqgx4dRx2JG1KTs6mJ7akgVQZHjfN0GYOd1g1O3
	94F6h3w9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1LbO-0005fe-4s; Fri, 31 Jul 2020 03:20:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1LbK-0005ek-Re; Fri, 31 Jul 2020 03:20:56 +0000
X-UUID: 59c1ad3d30d7421788dc939378b8b7cf-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=LweoCW7u41q+HSMVZXfqKKkgVKA1sH4ZjdqFdMsBerE=; 
 b=X9UoXAr6ouk6C9Apo5II03OS1Fx1T22FtxE+95Ff5JIDIh6WaO6FItBBJbMtfL1YxFcWfwCtA/9pwqmoG6R8VwlgdQikunxMs4Ly8fnwqppIf6S/7IqGO14NkY/y0fUwrYzh45+YNBBjK1h5XxT+8ynn7hdb59h06tv5fyc2VqY=;
X-UUID: 59c1ad3d30d7421788dc939378b8b7cf-20200730
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1759188184; Thu, 30 Jul 2020 19:20:54 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 20:20:46 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 31 Jul 2020 11:20:34 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 31 Jul 2020 11:20:30 +0800
Message-ID: <1596165602.17247.10.camel@mhfsdcap03>
Subject: Re: [PATCH v10 22/28] media: platform: Change the call functions of
 getting/enable/disable the jpeg's clock
From: Xia Jiang <xia.jiang@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 31 Jul 2020 11:20:02 +0800
In-Reply-To: <20200730163419.GA3779380@chromium.org>
References: <20200723030451.5616-1-xia.jiang@mediatek.com>
 <20200723030451.5616-23-xia.jiang@mediatek.com>
 <20200730163419.GA3779380@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C3E134842F386A9EE67149A0D56802F68BD2E0220DD0C4A211C8A74D97BFF4552000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_232055_127308_CAFCF54F 
X-CRM114-Status: GOOD (  27.98  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: drinkcat@chromium.org, devicetree@vger.kernel.org, mojahsu@chromium.org,
 srv_heupstream@mediatek.com, Rick Chang <rick.chang@mediatek.com>,
 senozhatsky@chromium.org, linux-kernel@vger.kernel.org,
 maoguang.meng@mediatek.com, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 linux-mediatek@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-07-30 at 16:34 +0000, Tomasz Figa wrote:
> Hi Xia,
> 
> On Thu, Jul 23, 2020 at 11:04:45AM +0800, Xia Jiang wrote:
> > Use the generic of_property_* helpers to get the clock_nums and clocks
> > from device tree.
> > Use the generic clk_bulk_* helpers to enable and disable clocks.
> > 
> > Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> > ---
> > v10: new add patch
> > ---
> >  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 47 +++++++++++++++----
> >  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  8 ++--
> >  2 files changed, 42 insertions(+), 13 deletions(-)
> > 
> 
> Thank you for the patch. Please see my comments inline.
> 
> > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > index 7881e9c93df7..921ed21f7db3 100644
> > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > @@ -783,14 +783,15 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
> >  	ret = mtk_smi_larb_get(jpeg->larb);
> >  	if (ret)
> >  		dev_err(jpeg->dev, "mtk_smi_larb_get larbvdec fail %d\n", ret);
> > -	clk_prepare_enable(jpeg->clk_jdec_smi);
> > -	clk_prepare_enable(jpeg->clk_jdec);
> > +
> > +	ret = clk_bulk_prepare_enable(jpeg->num_clks, jpeg->clks);
> > +	if (ret)
> > +		dev_err(jpeg->dev, "Failed to open jpeg clk: %d\n", ret);
> >  }
> >  
> >  static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
> >  {
> > -	clk_disable_unprepare(jpeg->clk_jdec);
> > -	clk_disable_unprepare(jpeg->clk_jdec_smi);
> > +	clk_bulk_disable_unprepare(jpeg->num_clks, jpeg->clks);
> >  	mtk_smi_larb_put(jpeg->larb);
> >  }
> >  
> > @@ -939,6 +940,7 @@ static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
> >  {
> >  	struct device_node *node;
> >  	struct platform_device *pdev;
> > +	int ret, i;
> >  
> >  	node = of_parse_phandle(jpeg->dev->of_node, "mediatek,larb", 0);
> >  	if (!node)
> > @@ -952,12 +954,39 @@ static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
> >  
> >  	jpeg->larb = &pdev->dev;
> >  
> > -	jpeg->clk_jdec = devm_clk_get(jpeg->dev, "jpgdec");
> > -	if (IS_ERR(jpeg->clk_jdec))
> > -		return PTR_ERR(jpeg->clk_jdec);
> > +	jpeg->num_clks =
> > +		of_property_count_strings(jpeg->dev->of_node, "clock-names");
> > +
> > +	if (jpeg->num_clks > 0) {
> > +		jpeg->clks = devm_kcalloc(jpeg->dev, jpeg->num_clks,
> > +					  sizeof(struct clk_bulk_data),
> > +					  GFP_KERNEL);
> > +		if (!jpeg->clks)
> > +			return -ENOMEM;
> > +	} else {
> > +		dev_err(&pdev->dev, "Failed to get jpeg clock count\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	for (i = 0; i < jpeg->num_clks; i++) {
> > +		ret = of_property_read_string_index(jpeg->dev->of_node,
> > +						    "clock-names", i,
> > +						    &jpeg->clks->id);
> 
> The names of the clocks must be explicitly specified in the driver, as per
> the DT bindings.
Dear Tomasz,

Thank you for your reply.
You mean that I should keep the v9 version about names of the clocks in
the match data.
The v10 version about the names of the clocks follows the upstreamed
mtk_venc/vdec.I think that this method is more generic. For example,when
other project has more clocks, we can get the names of clocks from dtsi
without changing the driver code.
What about your further opinion? 

Best Regards,
Xia Jiang
> 
> Best regards,
> Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
