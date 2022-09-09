Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712D3ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 03:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFz/AHhlSDwM/COpK+mg6Dt0yGF/fk7aSJKUbMLw82g=; b=jsYiTZXcsxlJT8SbzLq1VNf7vm
	2SzLUR3rzNB3qm5mGORDPyWT56OXyuf28o3czUp1fxkq6Kp5Jha+dh1FKrsryenOgUaoeuAfkBIaU
	y2RsDSFxvinXZ7EiSqPEZYqt9bkCofpyvg3mD1dTxAVK2xLzbrwtWfm/iJl2Jf0ECygUqZfKbZr4J
	DmIZSl0twZzb+VettBMs9ASorGFbFVOtAfU3VEZs9jkQFOd//jBkntKXYpqgmhJjQAuVYY8NFa9JC
	Lwwf2W5Ns3CINZTFkrXxQgL0VTvV1VIUPsNChoeD2mxV/k0FvTiY1t7F28IBFThSw/N8ZJ0+Lulf6
	Vm87ThZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWUbQ-00Bg7p-Uq; Fri, 09 Sep 2022 03:22:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWUbE-00Bg2u-OL; Fri, 09 Sep 2022 03:22:38 +0000
X-UUID: faf9a86038dc4c6b96bae67c5c2710d9-20220908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=kFz/AHhlSDwM/COpK+mg6Dt0yGF/fk7aSJKUbMLw82g=;
	b=LkQ/OFUHxZCTdxJ7H3u/BO6brxaV4j9CGG2aVjM/CD/4f5s3vblRv4fKCSYA2MWKHaqJ2P7Pii9Oh2zTPvyMLg4aNnRFInnaZvE7ybQ1fFzu4adAS/9UFllCZPn487vA+vQdjuZryHCjCAfW2QF0C05x77JT29HLmMmPobxcpww=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:d456a71b-69f2-4b1c-b41a-897a26f84f49,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:8f79185d-5ed4-4e28-8b00-66ed9f042fbd,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: faf9a86038dc4c6b96bae67c5c2710d9-20220908
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chengci.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2113970841; Thu, 08 Sep 2022 20:21:13 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 9 Sep 2022 11:20:39 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Sep 2022 11:20:33 +0800
Message-ID: <c09f262422dd6cd0bf2147870a109bd2ede36d4f.camel@mediatek.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mediatek: mt8188: Add binding for
 MM & INFRA IOMMU
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
Date: Fri, 9 Sep 2022 11:20:32 +0800
In-Reply-To: <2e575ed1-b82c-c7bd-3ddf-ccb6022b2461@linaro.org>
References: <20220831125502.7818-1-chengci.xu@mediatek.com>
	 <20220831125502.7818-2-chengci.xu@mediatek.com>
	 <2e575ed1-b82c-c7bd-3ddf-ccb6022b2461@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_202236_808607_AE937CEA 
X-CRM114-Status: GOOD (  19.23  )
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

On Thu, 2022-09-08 at 12:49 +0200, Krzysztof Kozlowski wrote:

Thanks for your review.

> On 31/08/2022 14:55, Chengci.Xu wrote:
> > This patch adds descriptions for mt8188 IOMMU which also use ARM
> > Short-Descriptor translation table format.
> 
> Do not use "This commit/patch".
> 
https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst*L95__;Iw!!CTRNKA9wMg0ARbw!0FyEQYk5UrJwuW-kVc1X-l58KMwnooLeErNkSwisiEzNf88AvYvMrzE6iYFH0KFOdag$
>  

Thank you for sharing this, I will drop this words.

> 
> >  
> >      then:
> >        required:
> > diff --git a/include/dt-bindings/memory/mediatek,mt8188-memory-
> > port.h b/include/dt-bindings/memory/mediatek,mt8188-memory-port.h
> > new file mode 100644
> > index 000000000000..9363e132c43a
> > --- /dev/null
> > +++ b/include/dt-bindings/memory/mediatek,mt8188-memory-port.h
> > @@ -0,0 +1,482 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
> 
> Why do you license it under BSD-3 clause?
> 

A mediatek internal wiki suggest me use "BSD-3-Clause" without detial
reason. May be it is not suitable for this file.

If you don't approve of this, I can change this license to "GPL-2.0-
only OR BSD-2-Clause", which is perferred by DT bindings file according
to "submitting-patches.rst". 

Do you think "BSD-2-Clause" is OK? Or could you kindly share me another
proper license?


Best regards,
Chengci Xu

> Best regards,
> Krzysztof


