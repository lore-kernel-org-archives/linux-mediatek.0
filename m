Return-Path: <SRS0=YRwc=GW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_RED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4EAC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 09:20:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B48E20867
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 09:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B48E20867
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ah/oIhkveuJPUSTNLm5gGrjrV2EjsLiAhGv/sJJ7/ok=; b=AMHrMxT+zM5KkRQGEarnYB5Hg
	fsfKGoA9S2JaRazXilZ1eHfm5Rs+wKa7bGa/lRA7YdbKq9aAN0RauO9J8OJGAKnUiUZOXhkJRjSxO
	WfljVeKz485aguFB4kBeKbI6wBxAQ50FJTel7QQO5rnkv/3iLfEj+x34NAFysxIRUapsf/JaPOcXN
	PvysuNhtkPQgi6NYfuR/HybaMMLO3EGNrbb43IhQpdl1BKO/TV4uAHmDxDFG3L/CD2hCS4PECk+ud
	02DmZE34w1eeN6v2VaEw7uDTWxSKlz5rvtBRZGe1+nog1ak6/9odehYT9xuRnOcgsKt0d55Nr/Cib
	pePk8Js7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1nBl-0007hF-ML; Tue, 19 Jan 2021 09:20:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1nBd-0007ek-QC; Tue, 19 Jan 2021 09:20:31 +0000
X-UUID: a7ef86c4cf2c4546aa24ae2ea1b62ef1-20210119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=giToPo/p/3LJytE3l2ogQIfAO4f4TZp/+5aQlKOr25k=; 
 b=Q4PPqmPnYGluQfcENozOFI7ipi/dEF+cpBdSMBJRpT1MvfNM6GQPKN/LpzQwqRQW9w3OPLs3dV02NjDc2kgg1Or0dNjVE9qsA473HidhbMe2i2tS2nBnHwVhhu4oL+CGCUE+saC0SaOQMVgHN3iA8wl6Z4voPXz3JpLXjOfuUPI=;
X-UUID: a7ef86c4cf2c4546aa24ae2ea1b62ef1-20210119
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1655187712; Tue, 19 Jan 2021 01:20:17 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 Jan 2021 01:20:16 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 19 Jan 2021 17:20:12 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 Jan 2021 17:20:11 +0800
Message-ID: <1611048011.14702.6.camel@mhfsdcap03>
Subject: Re: [PATCH v6 06/33] of/device: Move dma_range_map before
 of_iommu_configure
From: Yong Wu <yong.wu@mediatek.com>
To: Robin Murphy <robin.murphy@arm.com>, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Date: Tue, 19 Jan 2021 17:20:11 +0800
In-Reply-To: <1853732d-0efd-171e-9e1f-7ee7ed72a98f@arm.com>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
 <20210111111914.22211-7-yong.wu@mediatek.com>
 <20210114192732.GA3401278@robh.at.kernel.org>
 <1610688626.4578.1.camel@mhfsdcap03>
 <1853732d-0efd-171e-9e1f-7ee7ed72a98f@arm.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 20BEF15089BCBF56838670AF738616419DD03D4DB65FFC4A7D6595AC154756AB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_042030_047812_0FCA47D4 
X-CRM114-Status: GOOD (  27.09  )
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
Cc: youlin.pei@mediatek.com, Rob Herring <robh@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 chao.hao@mediatek.com, Tomasz
 Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2021-01-18 at 15:49 +0000, Robin Murphy wrote:
> On 2021-01-15 05:30, Yong Wu wrote:
> > On Thu, 2021-01-14 at 13:27 -0600, Rob Herring wrote:
> >> On Mon, Jan 11, 2021 at 07:18:47PM +0800, Yong Wu wrote:
> >>> "dev->dma_range_map" contains the devices' dma_ranges information,
> >>> This patch moves dma_range_map before of_iommu_configure. The iommu
> >>> driver may need to know the dma_address requirements of its iommu
> >>> consumer devices.
> >>>
> >>> CC: Rob Herring <robh+dt@kernel.org>
> >>> CC: Frank Rowand <frowand.list@gmail.com>
> >>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> >>> ---
> >>>   drivers/of/device.c | 3 ++-
> >>>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/of/device.c b/drivers/of/device.c
> >>> index aedfaaafd3e7..1d84636149df 100644
> >>> --- a/drivers/of/device.c
> >>> +++ b/drivers/of/device.c
> >>> @@ -170,9 +170,11 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
> >>>   	dev_dbg(dev, "device is%sdma coherent\n",
> >>>   		coherent ? " " : " not ");
> >>>   
> >>> +	dev->dma_range_map = map;
> >>>   	iommu = of_iommu_configure(dev, np, id);
> >>>   	if (PTR_ERR(iommu) == -EPROBE_DEFER) {
> >>>   		kfree(map);
> >>> +		dev->dma_range_map = NULL;
> >>
> >> Not really going to matter, but you should probably clear dma_range_map
> >> before what it points to is freed.
> >>
> >> With that,
> >>
> >> Reviewed-by: Rob Herring <robh@kernel.org>
> > 
> > Thanks for the review. I will move it before "kfree(map)" in next
> > version.
> 
> Paul noticed that we already have a bug in assigning to this 
> unconditionally[1] - I'd totally forgotten about this series when I 
> theorised about IOMMU drivers wanting the information earlier, but 
> sweeping my inbox now only goes to show I was right to think of it :)
> 
> We should really get something in as a fix independent of this series, 
> taking both angles into account.

Thanks this info. Following your suggestion, Move this into the "if (!
ret)". Then it is like this:


--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -163,8 +163,10 @@ int of_dma_configure_id(struct device *dev, struct
device_node *np,
 	dev->coherent_dma_mask &= mask;
 	*dev->dma_mask &= mask;
 	/* ...but only set bus limit if we found valid dma-ranges earlier */
-	if (!ret)
+	if (!ret) {
 		dev->bus_dma_limit = end;
+		dev->dma_range_map = map;
+	}
 
 	coherent = of_dma_is_coherent(np);
 	dev_dbg(dev, "device is%sdma coherent\n",
@@ -172,6 +174,8 @@ int of_dma_configure_id(struct device *dev, struct
device_node *np,
 
 	iommu = of_iommu_configure(dev, np, id);
 	if (PTR_ERR(iommu) == -EPROBE_DEFER) {
+		if (!ret)
+			dev->dma_range_map = NULL;
 		kfree(map);
 		return -EPROBE_DEFER;
 	}
@@ -181,7 +185,6 @@ int of_dma_configure_id(struct device *dev, struct
device_node *np,
 
 	arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
 
-	dev->dma_range_map = map;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_dma_configure_id);


If this is ok, I will send this as a independent patch.

> 
> Robin.
> 
> [1] 
> https://lore.kernel.org/linux-arm-kernel/5c7946f3-b56e-da00-a750-be097c7ceb32@arm.com/
> 
> >>
> >>>   		return -EPROBE_DEFER;
> >>>   	}
> >>>   
> >>> @@ -181,7 +183,6 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
> >>>   
> >>>   	arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
> >>>   
> >>> -	dev->dma_range_map = map;
> >>>   	return 0;
> >>>   }
> >>>   EXPORT_SYMBOL_GPL(of_dma_configure_id);
> >>> -- 
> >>> 2.18.0
> >>>
> > 
> > _______________________________________________
> > iommu mailing list
> > iommu@lists.linux-foundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/iommu
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
