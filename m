Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E99ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 07:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+mFt5oOb+qqgFR3EfXheSjsteVBRKUjXyMdk+LEkyI=; b=Z+JqS8tDWrCNUGSJYbLumbC2Y5
	I2H2yRzYOTe85WvFs1inBp/qToCaiMwg6xoog7DIYuwGJ6g2NyEiqWyZKeNjKZBINTmPKoXJTytPt
	mB967MfQHGv5yhAFJu3XKFBhgxEHjA0gu796UdCSodrNM4bU9uCjpzIW99SnPTP3btiKbH+IYhhgm
	YYVN453UKVvS8y2JZljQkORHJS3C9A00pU3HCJXY9kd1ClQfOnFdNePXEm+3mmqhgNTw4oQ/u3Y7H
	0iPSztrer02P6cBUqoNtllrYXvHQ76/J+tTq/4l7AznXlGz1aZBRsJsVpyz4MMj1vJefLf1eS4Pt/
	nQQ1hW1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYkt-00E84y-4t; Fri, 09 Sep 2022 07:48:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYcJ-00E2eS-5D; Fri, 09 Sep 2022 07:40:03 +0000
X-UUID: c69e7b6928d04e72b0492d073e856c41-20220909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=0+mFt5oOb+qqgFR3EfXheSjsteVBRKUjXyMdk+LEkyI=;
	b=Pv+9ZG1wQXnmta8e9p0nQyS0UeMcGRwjxsGV5GEfZOwwmdTG5h2mCuShdkzVYAk0lI6d6A9upkQH9d/Cw1fUUcmp6lIu+yvu9k5lV5fmFMuW09gXhQZCGHJUr+V4RCWcoiGUAd8y3Nfztv+Iw2eBk/GNjZGX/Yxm+YrgY3PCLZw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:8ae723a7-68f9-44f3-834c-28c938ad63c9,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:cce6e4eb-2856-4fce-b125-09d4c7ebe045,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:1,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c69e7b6928d04e72b0492d073e856c41-20220909
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chengci.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 293756634; Fri, 09 Sep 2022 00:39:51 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 9 Sep 2022 15:39:15 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 9 Sep 2022 15:39:14 +0800
Message-ID: <f70232ad7365fbd8fb27a8658b9633897c7b18a4.camel@mediatek.com>
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
Date: Fri, 9 Sep 2022 15:39:14 +0800
In-Reply-To: <87307ae4-a320-5880-1333-6ea700b61ca7@linaro.org>
References: <20220831125502.7818-1-chengci.xu@mediatek.com>
	 <20220831125502.7818-2-chengci.xu@mediatek.com>
	 <2e575ed1-b82c-c7bd-3ddf-ccb6022b2461@linaro.org>
	 <c09f262422dd6cd0bf2147870a109bd2ede36d4f.camel@mediatek.com>
	 <87307ae4-a320-5880-1333-6ea700b61ca7@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_003959_280623_D4490375 
X-CRM114-Status: GOOD (  17.46  )
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

On Fri, 2022-09-09 at 09:11 +0200, Krzysztof Kozlowski wrote:
> On 09/09/2022 05:20, Chengci.Xu wrote:
> > > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
> > > 
> > > Why do you license it under BSD-3 clause?
> > > 
> > 
> > A mediatek internal wiki suggest me use "BSD-3-Clause" without
> > detial
> > reason. May be it is not suitable for this file.
> > 
> > If you don't approve of this, I can change this license to "GPL-
> > 2.0-
> > only OR BSD-2-Clause", which is perferred by DT bindings file
> > according
> > to "submitting-patches.rst". 
> > 
> > Do you think "BSD-2-Clause" is OK? Or could you kindly share me
> > another
> > proper license?
> 
> Please switch to "GPL-2.0-only OR BSD-2-Clause", which is preferred
> for
> bindings.

Thanks for your advice, we will use "GPL-2.0-only OR BSD-2-Clause".

Best regards,
Chengci Xu

> 
> 
> Best regards,
> Krzysztof


