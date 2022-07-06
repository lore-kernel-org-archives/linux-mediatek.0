Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CD7C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 04:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpB3EQLQoKYahHIgPTU11ry7vTzd4mlZ3uSQuOqWbJY=; b=eqJq1ccymSN7G6dfBWIJnDtriN
	0+W8M3RZLA93Yj97FQMUqnX6/0Oi5u2vhQ7gUuFfnYtROmo2DctL/+P2gu3+JfGS4dl9ZoJqP4mxB
	/N+ND8dIiMbFGNbwLCpyiy6YYrFcHn6UH68Nj166tVUG2GoO/i7gigRvpVwctXpD2N3o7Nfwn9Llj
	rquO9lzwKAVmSt0/dnQJ6/VLa+tServPdAvDRXNy2LzEqW5D7LOtHe91k0chg95dWtU8LnSk1BVg7
	zzItIcg9mKW3WlaBfr6gZUxnd34rCkc9L6HFQO14+8Gl5UKJ+E5piB8ta/bm+VsV+oNs3u8x2Pptm
	FrdcwHbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8wiV-005omj-FX; Wed, 06 Jul 2022 04:32:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8wiK-005ojM-FI; Wed, 06 Jul 2022 04:32:37 +0000
X-UUID: fa190a1e0d7f438aa1a0938782993289-20220705
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:a4aa8abc-8c6d-47b8-81ed-f8c3196a8907,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:e52eb9d6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: fa190a1e0d7f438aa1a0938782993289-20220705
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1686486933; Tue, 05 Jul 2022 21:32:32 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 6 Jul 2022 12:01:57 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 6 Jul 2022 12:01:57 +0800
Message-ID: <6886a99699aa8240b2a59eb068dbf48061001d06.camel@mediatek.com>
Subject: Re: [PATCH v1 02/16] dt-bindings: memory: mediatek: Update
 condition for mt8195 smi node
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Yong Wu
	<yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Enric
 Balletbo i Serra" <enric.balletbo@collabora.com>, Weiyi Lu
	<weiyi.lu@mediatek.com>
CC: <iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 6 Jul 2022 12:01:57 +0800
In-Reply-To: <119f2a98-ef56-7b99-631f-221b737939ae@linaro.org>
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
	 <20220704100028.19932-3-tinghan.shen@mediatek.com>
	 <119f2a98-ef56-7b99-631f-221b737939ae@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_213236_568245_C9A02E31 
X-CRM114-Status: GOOD (  21.34  )
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

On Mon, 2022-07-04 at 14:36 +0200, Krzysztof Kozlowski wrote:
> On 04/07/2022 12:00, Tinghan Shen wrote:
> > The max clock items for the dts node with compatible
> > 'mediatek,mt8195-smi-sub-common' should be 3.
> > 
> > However, the dtbs_check of such node will get following message,
> > arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: smi@14010000: clock-names: ['apb', 'smi', 'gals0']
> > is too long
> >          From schema: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-
> > common.yaml
> > 
> > Remove the last 'else' checking to fix this error.
> 
> Missing fixes tag.
> 
> > 
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > ---
> >  .../memory-controllers/mediatek,smi-common.yaml        | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> > b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> > index a98b359bf909..e5f553e2e12a 100644
> > --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> > +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> > @@ -143,7 +143,15 @@ allOf:
> >              - const: gals0
> >              - const: gals1
> >  
> > -    else:  # for gen2 HW that don't have gals
> > +  - if:  # for gen2 HW that don't have gals
> > +      properties:
> > +        compatible:
> > +          enum:
> > +            - mediatek,mt2712-smi-common
> > +            - mediatek,mt8167-smi-common
> > +            - mediatek,mt8173-smi-common
> > +
> 
> Without looking at the code, it's impossible to understand what you are
> doing here. The commit msg says one, but you are doing something else.
> 
> Write commit msg explaining what you want to achieve and what you are doing.
> 
> 
> Best regards,
> Krzysztof

Ok, I'll update in next version.

Thanks,
TingHan


