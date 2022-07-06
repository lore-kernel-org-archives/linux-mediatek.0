Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DB7C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 04:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3SFW/fTX89vR0eb1+jQqECZOf+5WsRYeS1I1G9q1z0=; b=KQxaGkT/FMetgxpDZkhilsFGtF
	sJ78xf2a6970clPHIC05+R2hoeNbfSyH7zAcAQ7i3iIbaqW61bijt9GnPJ/fN+bznfVgGAuHvMiRB
	nnCszt/RDPQDx4aPKplj3iPZ8L4R3MugEFFVu6SAbaO7yJ9XsjgoZHm/lkJjTrsUuyyyympvmMQvR
	iIOxHtBDdhErlf3SCncQbo4KYjCeQNHWFYOdnS6S1VdV3AA7oMzgZVz8azg3HbzvlAmdf7IEMAl8b
	eaKO44cIDHvr/9dSZoeSZ4xgZrwGi/coFDpINj7exfDqwTxK+zoGRLmT/sQiK64/og2OADWnTWVkp
	nY6UD6rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8wgE-005oEN-Bu; Wed, 06 Jul 2022 04:30:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8wg3-005oBP-T8; Wed, 06 Jul 2022 04:30:17 +0000
X-UUID: a8a20de29d594976bbc4f3bb1f1ec0e1-20220705
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:b274a4f6-e8fe-4648-baee-814788e72993,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:add38663-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: a8a20de29d594976bbc4f3bb1f1ec0e1-20220705
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 881422874; Tue, 05 Jul 2022 21:30:11 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 6 Jul 2022 11:59:37 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 6 Jul 2022 11:59:37 +0800
Message-ID: <fe61f536d626131580174d8ec8841c47f9e9cdd4.camel@mediatek.com>
Subject: Re: [PATCH v1 02/16] dt-bindings: memory: mediatek: Update
 condition for mt8195 smi node
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yong
 Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, "Weiyi
 Lu" <weiyi.lu@mediatek.com>
CC: <iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 6 Jul 2022 11:59:36 +0800
In-Reply-To: <6aafec78-2699-0cc9-bd2a-5ccd39262e38@collabora.com>
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
	 <20220704100028.19932-3-tinghan.shen@mediatek.com>
	 <6aafec78-2699-0cc9-bd2a-5ccd39262e38@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_213015_994351_FFB0F8DE 
X-CRM114-Status: GOOD (  19.56  )
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

On Mon, 2022-07-04 at 12:25 +0200, AngeloGioacchino Del Regno wrote:
> Il 04/07/22 12:00, Tinghan Shen ha scritto:
> > The max clock items for the dts node with compatible
> > 'mediatek,mt8195-smi-sub-common' should be 3.
> > 
> > However, the dtbs_check of such node will get following message,
> > arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: smi@14010000: clock-names: ['apb', 'smi', 'gals0']
> > is too long
> >           From schema: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-
> > common.yaml
> > 
> > Remove the last 'else' checking to fix this error.
> > 
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > ---
> >   .../memory-controllers/mediatek,smi-common.yaml        | 10 +++++++++-
> >   1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> > b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> > index a98b359bf909..e5f553e2e12a 100644
> > --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> > +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> > @@ -143,7 +143,15 @@ allOf:
> >               - const: gals0
> >               - const: gals1
> >   
> > -    else:  # for gen2 HW that don't have gals
> > +  - if:  # for gen2 HW that don't have gals
> > +      properties:
> > +        compatible:
> > +          enum:
> > +            - mediatek,mt2712-smi-common
> 
> MT6795 also doesn't have any GALS, please add it in here.

Ok, I'll update it in next version.

Thanks,
TingHan


