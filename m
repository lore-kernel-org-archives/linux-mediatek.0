Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E260C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 14:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+yUB1td00nnfmjnpyygEdATRWGHurEUzjeSY0u+pxWU=; b=A9HR5X+yvbTy98yydiqjBZbIBZ
	kX0AvRrykDrNjFH0yDInu5D4UNMO1BClWTB+miSo03lG4wSMSVmyz97eH82Vt1pdRiR84mcIif2Jj
	5Xkeoky0TMBV0uRos09g66ASduyX+zrcqluNPqJM5awreXlZkJ0sB/gaiw1SHy7AIai3cn4Vu1bbG
	e3atydxmBQnQ8TSqsVXISvNKJ+bRx5eJ6r30kaALqs3R2NFCb3nNTu7XD6xk2grRBVIccnL0UNci1
	qgPAt066UI0hTwRmLAlHcYlK7ZbD8xi+4s7gY/U3WyXioQuF93j02tj5l/+4zPTQp+BVnzJQq9Oki
	Gjur8btA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEth4-006Mc8-6O; Fri, 22 Jul 2022 14:31:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEth1-006MQa-Nz; Fri, 22 Jul 2022 14:31:53 +0000
X-UUID: ce354c960f9a404387423b116c266b3f-20220722
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:b9f3fd9d-b59e-4d29-b07d-95c05cbbcb2d,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:8d6540b3-06d2-48ef-b2dd-540836705165,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ce354c960f9a404387423b116c266b3f-20220722
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1560986365; Fri, 22 Jul 2022 07:31:43 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 22 Jul 2022 22:21:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Jul 2022 22:21:07 +0800
Message-ID: <ead993a2b648fb9df138255d31054494d99f9bb6.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: mediatek: Add #reset-cells to mt8186
 sys-clock controller
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Chen-Yu Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <hsinyi@chromium.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@canonical.com>
Date: Fri, 22 Jul 2022 22:21:06 +0800
In-Reply-To: <20220720213924.GA4027969-robh@kernel.org>
References: <20220715110021.3127-1-allen-kh.cheng@mediatek.com>
	 <20220720213924.GA4027969-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_073151_830350_4006E137 
X-CRM114-Status: GOOD (  12.35  )
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

Thanks for your review.

I find #reset-cells had been added into dt-bindings.

Please ignore this PATCH.

Best regards,
Allen

On Wed, 2022-07-20 at 15:39 -0600, Rob Herring wrote:
> On Fri, 15 Jul 2022 19:00:21 +0800, Allen-KH Cheng wrote:
> > MediaTek system clock controller includes reset controller and
> > needs
> > to specify the #reset-cells property.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >  .../bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml      | 4
> > ++++
> >  1 file changed, 4 insertions(+)
> > 
> 
> Acked-by: Rob Herring <robh@kernel.org>


