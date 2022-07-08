Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7185C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 08:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Osjtr54B0fBZJDE1gYrQVbIL+6w7oIsRytAofQ8Z3+Y=; b=1rjkC8UmU4ziYrQV68c7TC+bWV
	ucWr4uwpeIVqKktK2pRxFmuj96WMthqwS93ozLuqsNrgJIzeIRCQYe34+OZKGBKWOc2zNRoCWs4pl
	LV1Ult9nFCHtFpVqGIAm27YpoHlB7ZEZq5rfGI+lMwkd8PwZ5VXfnWtfL6cjwpXJM4bxRJVJTvuLj
	sMX7E50L54mppRbJuDwCAZsOd/DWsA7w7epgbem3ti9Wv3oEC69o/vy5GzrgEZ15fgunk1yCFOnV7
	ny2ey9oHMrBvoW6a4ciAd83VfJFcwpJmDgZ6Cv6M4m4ui8AnZ5cIFm/fQdqBJcD16Z1MzZxYS0HCc
	qWMaQMyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jc9-002e1f-GS; Fri, 08 Jul 2022 08:45:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jc6-002e0R-Ha; Fri, 08 Jul 2022 08:45:28 +0000
X-UUID: adc3a6992d974e30941e427fd66cf6a2-20220708
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:7fbdc6ea-b622-40c1-8102-099c4478f7fe,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:f47ce686-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: adc3a6992d974e30941e427fd66cf6a2-20220708
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 138458894; Fri, 08 Jul 2022 01:45:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 8 Jul 2022 16:14:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 8 Jul 2022 16:14:44 +0800
Message-ID: <55fafa62684e077f75c3b8b192a59df62ad01692.camel@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: soc: mediatek: add mdp3 mutex support
 for mt8186
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Xiandong Wang <xiandong.wang@mediatek.com>
Date: Fri, 8 Jul 2022 16:14:44 +0800
In-Reply-To: <243b30ca-a552-3cb7-8a4e-6e54a56ff60a@collabora.com>
References: <20220705122627.2273-1-allen-kh.cheng@mediatek.com>
	 <20220705122627.2273-2-allen-kh.cheng@mediatek.com>
	 <5916c91b-41a1-c97a-84b4-7d48739a0639@collabora.com>
	 <640c1a9b-f8b5-aa89-19af-7d6f5c55eb12@gmail.com>
	 <243b30ca-a552-3cb7-8a4e-6e54a56ff60a@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_014526_660616_D22DD730 
X-CRM114-Status: GOOD (  26.17  )
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

Hi Angelo,

On Thu, 2022-07-07 at 12:59 +0200, AngeloGioacchino Del Regno wrote:
> Il 07/07/22 12:41, Matthias Brugger ha scritto:
> > 
> > 
> > On 07/07/2022 10:52, AngeloGioacchino Del Regno wrote:
> > > Il 05/07/22 14:26, Allen-KH Cheng ha scritto:
> > > > Add mdp3 mutex compatible for mt8186 SoC.
> > > > 
> > > > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > > > Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>
> > > 
> > > 
> > > Please drop this commit. Adding a mdp3-mutex compatible is not
> > > needed here.
> > > 
> > 
> > Thanks for checking. We probably would need a fallback compatible.
> > We can only know 
> > from the HW engineers that can confirm if the IP block is the same
> > as the disp 
> > mutex or a different one.
> > 
> > I'll drop both patches for now until things got clear.
> > 
> 
> They're located in a different iospace from each other, but either
> the platform
> data needs to *not be* joined together, or if they're together, I
> would not like
> having two different compatible strings for essentially the same
> thing.
> 
> I would at this point prefer dropping '-disp' from 'mediatek,mt8186-
> disp-mutex'
> so that we would be able to declare two 'mediatek,mt8186-mutex' in
> devicetree...
> ...or simply have two mediatek,mt8186-disp-mutex (although logically
> incorrect?).
> 
> Cheers,
> Angelo
> 

Thanks for your opinion.

They are two different hardwares for different address spaces. 

I think we drop '-disp' from 'mediatek,mt8186-disp-mutex' will be
excessive because we also need to modify mutex node in all exited dts
files.

I prefer havingg two mediatek,mt8186-disp-mutex. 

ex:
mutex: mutex@14001000 {
	compatible = "mediatek,mt8186-disp-mutex";
	..
}

mdp3_mutex0: mutex@1b001000 {
	compatible = "mediatek,mt8186-disp-mutex";
	...
}

What do you think?

Best regards,
Allen

> > Regards,
> > Matthias
> > 
> > > > ---
> > > >  
> > > > .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml       
> > > >   | 1 +
> > > >   1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex
> > > > .yaml 
> > > > b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex
> > > > .yaml
> > > > index 627dcc3e8b32..234fa5dc07c2 100644
> > > > ---
> > > > a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex
> > > > .yaml
> > > > +++
> > > > b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex
> > > > .yaml
> > > > @@ -30,6 +30,7 @@ properties:
> > > >         - mediatek,mt8173-disp-mutex
> > > >         - mediatek,mt8183-disp-mutex
> > > >         - mediatek,mt8186-disp-mutex
> > > > +      - mediatek,mt8186-mdp3-mutex
> > > >         - mediatek,mt8192-disp-mutex
> > > >         - mediatek,mt8195-disp-mutex
> > > 
> > > 
> > > 
> 
> 


