Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7F8C19F2B
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 09:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edgbRiOMiDCdefRKZ3uufAcAag0pmdlpGIjJ2H0+0Yg=; b=amlRVRum9zOWUA+RbuSGi4XSM4
	h+iV7gGgvBOzdZz8Q3ifhHC2mztXx3RqqybTS11IrsWmgH349cox3ZV3k2i/vugefo5KatQ/jSB/c
	Ns4skgDK0zadNd56gTroWHJvLczKLZWl1UglV3g65ZnUtqxCat+ywsWtmynvIqCPfZUIc1N1cG6tf
	a26t6AaPuymJ3o1FIIK4Y6OwKF1BmCIV7r9If5ytVc+do1OQ1NElQqv9EsGlbaXgCkmF0Bl2p+BK0
	MiduphsZlg0NN+37NTY7Mvf14lg8PvdfFFXX8MDBB6kheJaPDl2KY7bOVgdle8TV4939yOrm91x2U
	X0Drobkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJWzL-004k2E-7p; Thu, 04 Aug 2022 09:17:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJWz9-004jwp-4q; Thu, 04 Aug 2022 09:17:44 +0000
X-UUID: fa7bcd5bd4724bd0b22b086ed4dc9ce7-20220804
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:50f3b2bc-857b-471b-b750-44e9d52e2190,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:123838d1-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: fa7bcd5bd4724bd0b22b086ed4dc9ce7-20220804
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1371027937; Thu, 04 Aug 2022 02:17:32 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 4 Aug 2022 17:16:55 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 4 Aug 2022 17:16:55 +0800
Message-ID: <e4ae167cc5f2436097b98c7c26484e9f782797eb.camel@mediatek.com>
Subject: Re: [PATCH v4 05/20] dt-bindings: power: mediatek: Update
 maintainer list
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
	<robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"MandyJH Liu" <mandyjh.liu@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 4 Aug 2022 17:16:55 +0800
In-Reply-To: <11c7b04e-9837-440c-fa5b-3074a706e0ba@gmail.com>
References: <20220729063208.16799-1-tinghan.shen@mediatek.com>
	 <20220729063208.16799-6-tinghan.shen@mediatek.com>
	 <11c7b04e-9837-440c-fa5b-3074a706e0ba@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_021743_217789_6D81D4C8 
X-CRM114-Status: GOOD (  17.20  )
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

Hi Matthias,

On Thu, 2022-08-04 at 10:43 +0200, Matthias Brugger wrote:
> Weiyi Lu,
> 
> On 29/07/2022 08:31, Tinghan Shen wrote:
> > Update the maintainer list of power controller binding.
> > 
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
> >   .../devicetree/bindings/power/mediatek,power-controller.yaml    | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> > b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> > index 2d6afc0909473..03b7f6aa591d4 100644
> > --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> > +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> > @@ -7,7 +7,7 @@ $schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!0Fm9t0VaOL6Sa_hC5KnVSsSa8A9LD3giZsk9UmSm2U8BkqwKo7-YhZtAaMoqHF2RYvhf1NG1qAc-je5tb-bE03wdVA$
> >  
> >   title: Mediatek Power Domains Controller
> >   
> >   maintainers:
> > -  - Weiyi Lu <weiyi.lu@mediatek.com>
> > +  - MandyJH Liu <mandyjh.liu@mediatek.com>
> 
> Are you ok with this change. Can you provide a Acked-by tag for that?
> 
> Regards,
> Matthias
> 
> >     - Matthias Brugger <mbrugger@suse.com>
> >   
> >   description: |


Weiyi has resigned from MediaTek, and MandyJH has taken his place.
Maybe he still keep an eye on this list, but MandyJH should take over as MediaTek's maintainer.


Best regards,
TingHan




