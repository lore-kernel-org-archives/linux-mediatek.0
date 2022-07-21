Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8B7C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 03:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWNlgTOC0ymj6NnIAQIWZMHKhsDiYlXkbUotihqVf5I=; b=PV46jJzAM7E9EPGojm+X/a4cuP
	ldQEytWT2D1mvDH6tT//s9IW33+Ll6slVb+bIPZlMNaRjQNu6/wP3JrAZpQml+N1eehRTozts3tKZ
	1BoUKDrKkbqgXMDmn4B13Ip78ruUv0Z9GyrQJuPKe6/jW/yAzULEMts3KNyPlSyhlJuF9t5msvsXJ
	wn4LA05srhUVfUus1dimZ48bdHho8O861+zBK7NY1o6WE/dDEqJYpdoXngfPFDq/ZDJ84XTnPdmjM
	iXe/twFYBHnKT7gxnNYKcDh5SpEIPXPXN1ViI6sxGw29Ab9f+DngD9BIiTB65JH7+mhWP5cAaMSCP
	N8iTEPoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEMpD-00Fbf6-5N; Thu, 21 Jul 2022 03:26:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEMp2-00FbZI-J2; Thu, 21 Jul 2022 03:25:58 +0000
X-UUID: b8f360b2cada4d288c237970ee8f157d-20220720
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:3f336b67-f35d-4a58-8428-5e4f3aa3b0aa,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:34c68a33-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: b8f360b2cada4d288c237970ee8f157d-20220720
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 366514642; Wed, 20 Jul 2022 20:25:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 21 Jul 2022 10:35:13 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 21 Jul 2022 10:35:13 +0800
Message-ID: <c79b0f441bc4d7dce6c8d35f189783e69144413f.camel@mediatek.com>
Subject: Re: [PATCH v3 06/21] dt-bindings: power: mediatek: Add bindings for
 MediaTek SCPSYS
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Lee Jones
	<lee.jones@linaro.org>
CC: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, MandyJH Liu
	<mandyjh.liu@mediatek.com>, <iommu@lists.linux.dev>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 21 Jul 2022 10:35:13 +0800
In-Reply-To: <68a30bbd-5f9d-17d2-59fa-7b0da06ee877@linaro.org>
References: <20220720123023.13500-1-tinghan.shen@mediatek.com>
	 <20220720123023.13500-7-tinghan.shen@mediatek.com>
	 <YtgDu70Lpl/uPOkf@google.com>
	 <68a30bbd-5f9d-17d2-59fa-7b0da06ee877@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_202556_644188_3E330C8E 
X-CRM114-Status: GOOD (  20.38  )
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

On Wed, 2022-07-20 at 19:37 +0200, Krzysztof Kozlowski wrote:
> On 20/07/2022 15:31, Lee Jones wrote:
> > On Wed, 20 Jul 2022, Tinghan Shen wrote:
> > 
> > > The System Control Processor System (SCPSYS) has several power
> > > management related tasks in the system. Add the bindings for it.
> > > 
> > > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > 
> > Why have you ignored my review comments from v2?
> 
> If you refer whether the binding is needed at all, then the answer is
> yes, because this is not simple syscons but a device with children,
> which we want to parse/match.
> 
> Anyway Tinghan should respond to you about way how he proceeds...
> 
> Best regards,
> Krzysztof

Hi Lee,

I'm so sorry for not answering your feedback. I misunderstood it
that you're waiting the review result of DT maintainers.

This binding is added because of the discussion of the scpsys node[1].
I first looked at mfd/syscon.yaml to see if I could use it.
I found that it doesn't have the 'simple-mfd' compatible, so I decide to add a new one.
It's because I need the 'simple-mfd' compatible to parse child nodes.


[1] https://lore.kernel.org/all/f7eee4e8-05fa-4c83-9168-64e5ea4c510f@linaro.org/



Best regards,
TingHan


