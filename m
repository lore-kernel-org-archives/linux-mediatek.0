Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A83C00140
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 01:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOWVM8voEZOj8QsIgEwHtQL5oZR9puzNe4gdcUCy3PI=; b=yS2tIM8cR9hhyWUEWGoc7tTERS
	xDrA67AA54kLZz/rQgEYuZTW7A1GQwuSn+yMUaeqZKnARL3A/5s0VJwmzKhG6LvW0DKGVP+bdN9iH
	jledwUZfqEcJH+079cIm8Qv0sqf3DABy7RKQtm8RyodvePXrRSyLv6ZL3DBTbeB9XxfmoPNlpNZh1
	uEWb9vfzpYC+IRpG4HnqhV8SXNfpYzy/Ysy2G+Qn2uJV/7c6Oj5ArFOfXM1Mi9lyzWIbfXCJCdr6W
	uXnFhxlwRRgnyfTXHnbO3NE5SUm32n37SZlhSGBlbsiObfL3d6dbLkNygY08cIrKcmYHuBRYWkiir
	P580g+Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOr67-00DbPx-KZ; Fri, 19 Aug 2022 01:46:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOr63-00DbGR-EO; Fri, 19 Aug 2022 01:46:54 +0000
X-UUID: c3a1f6bcdc034379a52a6fde657c2a59-20220818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=IOWVM8voEZOj8QsIgEwHtQL5oZR9puzNe4gdcUCy3PI=;
	b=Gu1gDOBfZARtTpls85okNmzvsIr5wRLxLvDJ3NwWFr4qo3wDHR2qVshLBmsA4tf5dAVTshf4m49yY3tCSTQbhOjOewQTigHC7HLXjQ9Lg4RnNbD0ox/w7+cWzBLJy4IWqPssOTJ0t9hpXVMCXUU6xS+GtiIIs58zsGtYZBuR+6E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:04241f1f-a44e-45e1-aba5-4f5b30aec21c,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:f339179d-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c3a1f6bcdc034379a52a6fde657c2a59-20220818
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <johnson.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2033740076; Thu, 18 Aug 2022 18:46:45 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 19 Aug 2022 09:46:11 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Aug 2022 09:46:11 +0800
Message-ID: <0fb7809abab73c82f7ab98a80e5e04444381cf8e.camel@mediatek.com>
Subject: Re: [PATCH RESEND] dt-bindings: timer: Add compatible for MediaTek
 MT8188
From: Johnson Wang <johnson.wang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<daniel.lezcano@linaro.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 19 Aug 2022 09:46:11 +0800
In-Reply-To: <9947dc76-ab12-f840-3439-ca383c02c598@linaro.org>
References: <20220818124602.20394-1-johnson.wang@mediatek.com>
	 <3d91fe87-feed-d083-9eeb-51293aead67a@linaro.org>
	 <9947dc76-ab12-f840-3439-ca383c02c598@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_184651_538915_CD032878 
X-CRM114-Status: GOOD (  18.56  )
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

On Thu, 2022-08-18 at 16:40 +0300, Krzysztof Kozlowski wrote:
> On 18/08/2022 15:51, Krzysztof Kozlowski wrote:
> > On 18/08/2022 15:46, Johnson Wang wrote:
> > > Add dt-binding documentation of timer for MediaTek MT8188 SoC
> > > platform.
> > > 
> > > Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > ---
> > >  Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt |
> > > 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> > > b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> > > index f1c848af91d3..8bbb6e94508b 100644
> > > --- a/Documentation/devicetree/bindings/timer/mediatek,mtk-
> > > timer.txt
> > > +++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-
> > > timer.txt
> > > @@ -25,6 +25,7 @@ Required properties:
> > >  	For those SoCs that use SYST
> > >  	* "mediatek,mt8183-timer" for MT8183 compatible timers (SYST)
> > >  	* "mediatek,mt8186-timer" for MT8186 compatible timers (SYST)
> > > +	* "mediatek,mt8188-timer" for MT8188 compatible timers (SYST)
> > 
> > Where is the driver change implementing this?
> 
> Or is there a generic fallback and you just added a specific one (not
> visible on the diff)?
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

Yes, MT8188 uses "mediatek,mt6765-timer" as fallback compatible.

BRs,
Johnson Wang


