Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC819C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 13:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9UgPR+9Ts8m1Lq/VKaffXRuOwQgDVn1dN58Fi2EW1A=; b=pkhmp2LLHKgiuKReE7s4bfBuux
	JpjXlNWH+JCjWN5JzSXIi4a0w5abGjA7ulY/uf8FvqnF6Ih3/73u7s/Hl4ldhHUwlEmEOMk8R4Ssw
	10vuia5d3era59vS6ucRyZ5ZYas3FsSV4qJlv7rP7r7AC4v98RxH+7OHUN18IjKIygxaNFyLC0R+S
	yEJ2lo3sg8AKoQlOw1aTFOJpakWwBx+GveR6mTbgNUOQ/RCFGzGjgiHsF2P4fIylOJIow9j2PKbOV
	GvdrstgrRyefRZ9y5/FhwmhB29SAPOrpw2qfL70VXjJ1zgT7IL8yGFrBHrounO2K9NcXRa6qkOwKR
	FVi/GjnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oByns-00EgG0-3A; Thu, 14 Jul 2022 13:22:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBynh-00EgCC-B4; Thu, 14 Jul 2022 13:22:42 +0000
X-UUID: 96369261ce79428dae2c26dfcdbfe35d-20220714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:2b79240b-244b-427e-8110-a844ff734f6a,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:c51b4e64-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 96369261ce79428dae2c26dfcdbfe35d-20220714
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 85000535; Thu, 14 Jul 2022 06:22:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 14 Jul 2022 20:22:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 14 Jul 2022 20:22:30 +0800
Message-ID: <e7d28a927044e47ad8018c71d511754dda9ae7d7.camel@mediatek.com>
Subject: Re: [PATCH v1 03/16] dt-bindings: power: mediatek: Refine multiple
 level power domain nodes
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Enric
 Balletbo i Serra" <enric.balletbo@collabora.com>, Weiyi Lu
	<weiyi.lu@mediatek.com>, <iommu@lists.linux-foundation.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 14 Jul 2022 20:22:30 +0800
In-Reply-To: <20220712192119.GK1823936-robh@kernel.org>
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
	 <20220704100028.19932-4-tinghan.shen@mediatek.com>
	 <20220705205739.GA2599256-robh@kernel.org>
	 <b5667c052447d1b3c3498131af98d80a07ed4767.camel@mediatek.com>
	 <20220712192119.GK1823936-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_062241_409860_50CFD375 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

Hi Rob,
> 
> Okay, I think you need something more like this that doesn't recurse 
> infinitely:
> 
> patternProperties:
>   "^power-domain@[0-9a-f]+$":
>     $ref: #/$defs/power-domain-node
> 
>     unevaluatedProperties:
>       $ref: #/$defs/power-domain-node
> 
> If you need a 3rd level of nodes:
>       unevaluatedProperties:
>         $ref: #/$defs/power-domain-node
> 
> 
> Rob

After some test, your 1st suggestion works.

The infinite error is introduced from my changes and affect the result of power/renesas,sysc-
rmobile.yaml. The 'additionalProperties' being defined as a DT property is the root of this error.
After fix the indentation, the error is gone.

I'll update the yaml as your 1st suggestion in next version.

Thanks,
TingHan




