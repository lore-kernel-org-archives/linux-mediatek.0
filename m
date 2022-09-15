Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A435ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 02:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hll8D14Qt08YGxyPP/LHoUI1r1mvl/3LO8G0w9Pypy4=; b=FmPABS7uN7tPoDJhcxNAQfF2X8
	XzdLE/PKWZVNmaEDrWpjz6Mkj9hBpIhEvyzdsPOVZGRGtUQojTFunCr2xupQ9yEk4z8i9eLusAFnL
	RcNXL3V9OcrdEJn5Eyf+wi77NpqU5kwz3cdUhtGBu1X0rBe0Fp8k6B3U7LG2hqsl4HUo2GRCGKEPV
	T2ITQfbk8V1jpUhTCsqPd/FVyBiPi7wbwmDXD6fszRddfI/dG5u1OPYO1pQFUta7u9GM69xR+40a/
	7KEorwxg6jLMCAhVfWZ85TqkvhA3LsNs3HOBy0XWWezWlNewVYTwTHnmGYMFcyOFmpMQh0bdnaJNv
	jH+sVdow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYeW7-00FSUZ-0N; Thu, 15 Sep 2022 02:22:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYeVt-00FRR3-F2; Thu, 15 Sep 2022 02:22:02 +0000
X-UUID: 25c6c3349f4a440e97a0c0e667d4d214-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Hll8D14Qt08YGxyPP/LHoUI1r1mvl/3LO8G0w9Pypy4=;
	b=SW7AwRMt03iywCX638DbFqJFe72Bsdqs4YRABETl8FUwO62IHzhfcMP/pJjjfsawpgYEtK9djRulMWClhVvx57fCEbe1R24DDPrD7oRGdtEhNNpRUSXAviMPQ/Jr1HJ2DFpaXiumE0A0GagtPuioD5OxXDRE7EYQ6HFWzr2DUD8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:0c314b56-fc5e-4900-9915-d4d343bcc42e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:476071f6-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 25c6c3349f4a440e97a0c0e667d4d214-20220914
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 872333104; Wed, 14 Sep 2022 19:08:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 15 Sep 2022 09:37:45 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Sep 2022 09:37:45 +0800
Message-ID: <f206b9f6c4c61b90306e19c713e2758d471ec037.camel@mediatek.com>
Subject: Re: [PATCH 5/5] dt-bindings: arm: mediatek: mmsys: remove the
 unused compatible for mt8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, Singo
 Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 15 Sep 2022 09:37:45 +0800
In-Reply-To: <1b3a880f-06a2-1865-3791-03021aa34175@gmail.com>
References: <20220914182331.20515-1-jason-jh.lin@mediatek.com>
	 <20220914182331.20515-6-jason-jh.lin@mediatek.com>
	 <1b3a880f-06a2-1865-3791-03021aa34175@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_192201_533989_433E6F99 
X-CRM114-Status: GOOD (  17.24  )
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

On Wed, 2022-09-14 at 22:45 +0200, Matthias Brugger wrote:
> 
> On 14/09/2022 20:23, Jason-JH.Lin wrote:
> > The compatible properties of mt8195 have changed to
> > mediatek,mt8195-vdosys0
> > and mediatek,mt8195-vdosys1 from mediatek,mt895-mmsys, so remove
> > the unused
> > compatible.
> > 
> > Fixes: 81c5a41d10b9 ("dt-bindings: arm: mediatek: mmsys: add mt8195
> > SoC binding")
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >  
> > .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml         |
> > 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > index a53b32c0a608..bfbdd30d2092 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > @@ -31,7 +31,6 @@ properties:
> >                 - mediatek,mt8183-mmsys
> >                 - mediatek,mt8186-mmsys
> >                 - mediatek,mt8192-mmsys
> > -              - mediatek,mt8195-mmsys
> 
> Should be part of the first patch. As described in the review.

Ok, I'll merge this patch into the first patch.

Regards,
Jason-JH.Lin

> 
> Regards,
> Matthias
> 
> >                 - mediatek,mt8195-vdosys0
> >                 - mediatek,mt8195-vdosys1
> >                 - mediatek,mt8365-mmsys
> 
> 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


