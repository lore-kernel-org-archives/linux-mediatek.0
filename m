Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC36C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 07:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQK2uaPNvnXeStG+dGqknXjDyPvOsH85QuoH7oLgh9E=; b=LG3UQnMSJlD9FWiNh76+qHfajV
	B2ovjb4vblHlATAepbJVXoVIXFO6XDR01IFX9hE6EtyB/VsQ8MlLpsR/gt8Q/frBx8iiK33oqKNmW
	maF3gu85rF+r/Tny08xIn1telmFDJaHvgqcNNZNAM8EzHo1HJU0oXhNoltk9lAOX2XoePnz4kCJIg
	fEdJc9wx9vqL/wMnC6hqs9QNGuW07AlJNHEREuTB04IxLCszct7XZZWdG8IX0Gj8/qZLovQ3IU+TH
	IujOtb+JnUaX3JVghcifKsr84as/m5PXpY3oEBgXI6d1sOxE1hE6bG7Ovv/k6X09IhgcDPkIMP3+9
	s0XVIb8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDi5Y-00665t-M6; Tue, 19 Jul 2022 07:56:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDi5N-0065wE-FO; Tue, 19 Jul 2022 07:56:06 +0000
X-UUID: f6e8bc9c165a4cfb8ff9dbc08db6ba55-20220719
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:ac33a1c6-d618-40c4-a67e-c2700c63f170,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:55915d33-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: f6e8bc9c165a4cfb8ff9dbc08db6ba55-20220719
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1941311248; Tue, 19 Jul 2022 00:55:56 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 19 Jul 2022 15:55:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 Jul 2022 15:55:21 +0800
Message-ID: <0be4d31850191fe8651348e9695aa025d354be5d.camel@mediatek.com>
Subject: Re: [PATCH v2 05/19] dt-bindings: power: mediatek: Refine multiple
 level power domain nodes
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Yong Wu
	<yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee.jones@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, MandyJH Liu
	<mandyjh.liu@mediatek.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 19 Jul 2022 15:55:21 +0800
In-Reply-To: <631560b2-58f7-064a-020b-d8029f04e451@linaro.org>
References: <20220714122837.20094-1-tinghan.shen@mediatek.com>
	 <20220714122837.20094-6-tinghan.shen@mediatek.com>
	 <c2e9f890-98c2-8f09-952d-495f2b57a254@linaro.org>
	 <631560b2-58f7-064a-020b-d8029f04e451@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_005605_519904_52502DB9 
X-CRM114-Status: GOOD (  13.15  )
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

Hi Krzysztof,

(Remove non-working @mediatek.com)

On Fri, 2022-07-15 at 10:15 +0200, Krzysztof Kozlowski wrote:
> On 15/07/2022 10:07, Krzysztof Kozlowski wrote:
> > On 14/07/2022 14:28, Tinghan Shen wrote:
> > > Extract duplicated properties and support more levels of power
> > > domain nodes.
> 
> Can you guys stop cc-ing all the non-working @mediatek.com emails? Every
> time I got a bunch of bounced:
> 
> 550 Relaying mail to weiyi.lu@mediatek.com is not allowed
> 
> and other like that.
> 
> Really, it's being since some time and it became extra annoying.
> 
> Best regards,
> Krzysztof

I'm sorry for causing the annoying notifications. 
I'll update the maintainer lists in next version.

Thanks,
TingHan


