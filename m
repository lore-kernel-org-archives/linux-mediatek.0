Return-Path: <SRS0=RXgq=A4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F19F1C433EA
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 08:18:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C163A2074B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 08:18:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QKd+jHTN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="h8WRNFGZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C163A2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E1DD9jpsQUbLyFTeZuukoTjYXuaS+FFRfBdqlVKKGFg=; b=QKd+jHTNzhaNFWajMthUeZrob
	6qnWOSJFMuA+BAucwHoyx9XFKfj2o7vZnu84gJhWqzrayLsmz8i0seCFarqmI7A6XMl9/RhuzeJGX
	Gjpf9T5tSqozrVjEwm4kX7DhO+OELNLicpZLM703GneJ4OLRYubvDkrvtrzw3lx/7JInV0NlEZcvn
	1qZOubZMgJDNAgUf+fc0ajyZ+LW/dMOI35qqNUdWD7zSr/RqTrdVEQx5TLXJgiAhbjiPmJM+rrN17
	9vr8m5cEoQPpCaLtOAaD0sko2jWxyFTnwCauWrpEL6inB2cV3+2BnFzOExu+Kn2z+ISgYUzLEB+tj
	gHLPONLOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwLZr-0003VX-LE; Fri, 17 Jul 2020 08:18:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwLZp-0003Tt-3M; Fri, 17 Jul 2020 08:18:42 +0000
X-UUID: 55b3d26eec694496a2aa2e52602b6805-20200717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jFgiHvr1fVVgOZ8IpoZq8KSqHUKORJrsDZDgN40XiAY=; 
 b=h8WRNFGZ7w4shM3mbMkE2zKSbK1FnBwTqhMP4RtCVTBwu0UAbxwEL4/4SXr27m5Aq9Jo+yPsG0iSov9pqX5V+Rx4rWKLOAF0aftWk2hmfA5kNk+55XbYjbUl3ueCcMZ/xuJeHxiG+9qM0+1GAbIxL0ey+TiVl6K/ycl06VgQJdQ=;
X-UUID: 55b3d26eec694496a2aa2e52602b6805-20200717
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1184320695; Fri, 17 Jul 2020 00:18:41 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Jul 2020 01:18:28 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Jul 2020 16:18:24 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Jul 2020 16:18:24 +0800
Message-ID: <1594973906.12796.20.camel@mtkswgap22>
Subject: Re: [PATCH 1/4] dt-bindings: mediatek: add mediatek,infracfg phandle
From: Miles Chen <miles.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Fri, 17 Jul 2020 16:18:26 +0800
In-Reply-To: <20200715205120.GA778876@bogus>
References: <20200702093721.6063-1-miles.chen@mediatek.com>
 <20200715205120.GA778876@bogus>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5CB742BDEFA856503BBD69CE4475BAA8884078200B5E49D595D6209E416DC56D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_041841_335166_D6EC07C1 
X-CRM114-Status: GOOD (  24.33  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-07-15 at 14:51 -0600, Rob Herring wrote:
> On Thu, Jul 02, 2020 at 05:37:17PM +0800, Miles Chen wrote:
> > Add a description for mediatek,infracfg. We can check if 4GB mode
> > is enable by reading it instead of checking the unexported
> > symbol "max_pfn".
> > 
> > This is a step towards building mtk_iommu as a kernel module.
> 
> You determined this before without DT, so it is an OS problem and 
> shouldn't need a DT update.

Thanks for your comment.

The old way (using max_pfn) do determine this is risky because the
max_pfn may lower than (GB if reserved memory regions occupy memory
higher than 4GB.

So, the better way to do this is by reading register from H/W.
> 
> I'd assume there's only one instance of the node mediatek,infracfg 
> points to, so just search for it if you want to get the info from DT.
> 
I can do syscon_regmap_lookup_by_compatible() to search for it. However,
the compatibles are different in mt2712e.dtsi and mt8173.dtsi. so I have
to search "mediatek,mt2712-infracfg" and "mediatek,mt8173-infracfg"
respectively.

Using mediatek,infracfg phandle can make the code easier to read.
Is it possible to reconsider the phandle approach, please?


arch/arm64/boot/dts/mediatek/mt2712e.dtsi:253:
infracfg: syscon@10001000 {
compatible = "mediatek,mt2712-infracfg", "syscon";
arch/arm64/boot/dts/mediatek/mt8173.dtsi:363:                   
infracfg: power-controller@10001000 {
compatible = "mediatek,mt8173-infracfg", "syscon";



> 
> > 
> > Cc: Yong Wu <yong.wu@mediatek.com>
> > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/iommu/mediatek,iommu.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt b/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> > index ce59a505f5a4..a7881deabcca 100644
> > --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> > +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> > @@ -74,6 +74,8 @@ Required properties:
> >  - mediatek,larbs : List of phandle to the local arbiters in the current Socs.
> >  	Refer to bindings/memory-controllers/mediatek,smi-larb.txt. It must sort
> >  	according to the local arbiter index, like larb0, larb1, larb2...
> > +- mediatek,infracfg: a phandle to infracfg. It is used to confirm if 4GB mode is set.
> > +	It is an optional property, add it when the SoC have 4g mode.
> >  - iommu-cells : must be 1. This is the mtk_m4u_id according to the HW.
> >  	Specifies the mtk_m4u_id as defined in
> >  	dt-binding/memory/mt2701-larb-port.h for mt2701, mt7623
> > -- 
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
