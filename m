Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EF4C00140
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 08:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wpJo/uafqISHKgQcmWBoEH/7E2JFyU+XtWTOyLnY1T8=; b=EXcDmAVOB2mBsy25Pn4e0Lqt3D
	dcaIKXPl3hxkWunlZOxuymu7ntwsMIHk8/JeOtF3Yk+u9t3fAlMNkmLKdYhIcBoXVsQAH/gAhlGgv
	WpCrWoo1QWNIzKMTIlhVMfApb6hgF6E9LDKSoaiLcg55FplN78ynlBXTUvVo/4EoXKZIH1iMY9mX6
	FOHUNfbHiKPTRR1t0zfP97awz4+JeZfhEbVQKpam5I+EFhaagFhzsXm/3f5d66lXVSko+nLYE30iP
	qqP6YTECXq2hSLQZOj/jschk0j1h9z4TFKSlp8c5w0qVezgqTNj45fUKPIULRyeinL2aRpx7dK0O0
	EtkxORGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOaz1-000veb-6g; Thu, 18 Aug 2022 08:34:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOayg-000v92-09; Thu, 18 Aug 2022 08:34:11 +0000
X-UUID: a986bf713c994b939ca04272174a26f5-20220818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=wpJo/uafqISHKgQcmWBoEH/7E2JFyU+XtWTOyLnY1T8=;
	b=l8/bB1KunIsK/98SXWoWXKaguz/FICil9VUsBLuYxkzp8auScZk/1bDgShSZOIpvbWuR1iKdTZAJr+fA8XCIw53vrN+NWfVGNG2Fl1+qjNqT6ORJX+CKsHLT40CBQAK8OvFIOxoNg4kTwuYdkSCCoVH22d8GGKX8OUg4+4Vyt8c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:c7d5f876-0243-4b93-82b8-f03bb185bc91,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:8228089d-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a986bf713c994b939ca04272174a26f5-20220818
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chengci.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 623545665; Thu, 18 Aug 2022 01:34:06 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 18 Aug 2022 16:03:27 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 18 Aug 2022 16:03:26 +0800
Message-ID: <bc7214a78952066bf93f8bedaa5b8191ff3e10e3.camel@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: mediatek: mt8188: Add binding for MM &
 INFRA IOMMU
From: Chengci.Xu <chengci.xu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Yong Wu
	<yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 18 Aug 2022 16:03:26 +0800
In-Reply-To: <61c0d3bf-cf1f-77f0-bb47-dec7cde5b488@linaro.org>
References: <20220804105834.626-1-chengci.xu@mediatek.com>
	 <20220804105834.626-2-chengci.xu@mediatek.com>
	 <ae06f644-b988-8fc3-fde8-258299f8f2ae@linaro.org>
	 <f34db3a295b8c83e03bf79950cc25d39b6f81240.camel@mediatek.com>
	 <61c0d3bf-cf1f-77f0-bb47-dec7cde5b488@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_013410_085557_8453B808 
X-CRM114-Status: GOOD (  20.14  )
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

On Thu, 2022-08-18 at 10:42 +0300, Krzysztof Kozlowski wrote:
> On 18/08/2022 10:26, Chengci.Xu wrote:
> > > >      then:
> > > >        required:
> > > > diff --git a/include/dt-bindings/memory/mt8188-memory-port.h
> > > >  b/include/dt-bindings/memory/mt8188-memory-port.h
> > > > new file mode 100644
> > > > index 000000000000..612fd366c3a7
> > > > --- /dev/null
> > > > +++ b/include/dt-bindings/memory/mt8188-memory-port.h
> > > 
> > > Use vendor prefix in filename, so mediatek,mt8188-memory-port.h
> > 
> > Is this a new mandatory rules to add a vendor prefix in dt-bindings
> > file name? we have never add a vendor prefix before.
> > 
> > If possible, we'd like not to use vendor prefix for the consistency
> > of
> > fliename's format(mtxxxx-memory-port.h).
> > Such as "mt8195-memory-port.h" and "mt8186-memory-port.h".
> 
> That's a generic rule, although loosely applied. The consistency is
> rather to have a vendor prefix everywhere. Why Mediatek should have
> an
> exception?
> 

Thank you for sharing that generic rule and we will rename the file to 
"mediatek,mt8188-memory-port.h" in th coming next version.

> Best regards,
> Krzysztof
> 

Best regards,
Chengci Xu


