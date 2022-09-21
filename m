Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88C3C6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 17:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2F19Vqk4oTeChl6tfimZoIWmEP62hPQK3JzSGtep98=; b=ojSaWIguZEwSiQQS+4hceD930l
	upRE3pHgG9c/9fLNZmpSJUefh/r/KAC67VZuI/3hMi+Ipx2Z6Hopx7EYOKG2UL4lyYyOD2EWfN2WT
	t2u42/H7Ko/7/y2bkTY9bntM2BzNr/3BNxrEM8p09XU9nCkIQ+e6JMPJFt/gAtjK/5mbKCRljdj9k
	sKw/qXMir5MILGHWFM+CK+ZUVPWKSv7qM+v5N5qkik74AVhWZEjc0VnzZm9iuAHANr8WYko614Z6k
	TXJp55fnci35PLmL7ryyArJut8dlUX5ZMxEw2lgn+s/AZ1n/vEkyzHBaOlWNBKqLIOfEwgch8xFru
	pcenV0Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob3Ct-00C7Xy-U0; Wed, 21 Sep 2022 17:08:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob3Ci-00C7UH-VC; Wed, 21 Sep 2022 17:08:10 +0000
X-UUID: c62fac889efc4d5085f5be7b5885a417-20220921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=F2F19Vqk4oTeChl6tfimZoIWmEP62hPQK3JzSGtep98=;
	b=E23Y54WTmCJxlqA2sbjDdjVOBjkFNYOsyc6SGBohpKvB6kBQQTvZNZamFOj/mu10XuYvacBRTO21XWRe3TABiZKHpoW672hyp2CDecSJvwr6QFg8QdgclKjlAtbXcR6v9zXQu5h3mTfG59VAAxjZSqeK9Ijq7B0mKtYVShnO8yc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:667f82e8-56dc-4c9a-83a2-a8d6a93e0ef4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:e2b1705e-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c62fac889efc4d5085f5be7b5885a417-20220921
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1326698606; Wed, 21 Sep 2022 10:07:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 22 Sep 2022 00:47:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 22 Sep 2022 00:47:17 +0800
Message-ID: <4c9c9ad5b5ab8ce88c28c01832195d196b1ef964.camel@mediatek.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: arm: mediatek: mmsys: change
 compatible for MT8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, Singo
 Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 22 Sep 2022 00:47:17 +0800
In-Reply-To: <29a06da0-ddf5-15eb-ac3d-0bc2e0006ae9@linaro.org>
References: <20220920140145.19973-1-jason-jh.lin@mediatek.com>
	 <20220920140145.19973-2-jason-jh.lin@mediatek.com>
	 <65c93c5d-941a-267b-408d-95be83dc2454@linaro.org>
	 <8fba20bf37326504b871fb55ce171cd37720a9a0.camel@mediatek.com>
	 <29a06da0-ddf5-15eb-ac3d-0bc2e0006ae9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_100809_026301_74AB6361 
X-CRM114-Status: GOOD (  38.67  )
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

On Wed, 2022-09-21 at 08:28 +0200, Krzysztof Kozlowski wrote:
> On 21/09/2022 06:16, Jason-JH Lin wrote:
> > Hi Krzysztof,
> > 
> > Thanks for the reviews.
> > 
> > On Tue, 2022-09-20 at 17:25 +0200, Krzysztof Kozlowski wrote:
> > > On 20/09/2022 16:01, Jason-JH.Lin wrote:
> > > > For previous MediaTek SoCs, such as MT8173, there are 2 display
> > > > HW
> > > > pipelines binding to 1 mmsys with the same power domain, the
> > > > same
> > > > clock driver and the same mediatek-drm driver.
> > > > 
> > > > For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines
> > > > binding
> > > > to
> > > > 2 different power domains, different clock drivers and
> > > > different
> > > > mediatek-drm drivers.
> > > > 
> > > > Moreover, Hardware pipeline of VDOSYS0 has these components:
> > > > COLOR,
> > > > CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture
> > > > Quality)
> > > > and they makes VDOSYS0 supports PQ function while they are not
> > > > including in VDOSYS1.
> > > > 
> > > > Hardware pipeline of VDOSYS1 has the component ETHDR (HDR
> > > > related
> > > > component). It makes VDOSYS1 supports the HDR function while
> > > > it's
> > > > not
> > > > including in VDOSYS0.
> > > > 
> > > > To summarize0:
> > > > Only VDOSYS0 can support PQ adjustment.
> > > > Only VDOSYS1 can support HDR adjustment.
> > > > 
> > > > Therefore, we need to separate these two different mmsys
> > > > hardwares
> > > > to
> > > > 2 different compatibles for MT8195.
> > > > 
> > > > Fixes: 81c5a41d10b9 ("dt-bindings: arm: mediatek: mmsys: add
> > > > mt8195
> > > > SoC binding")
> > > > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > > ---
> > > >  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      
> > > > | 4
> > > > ++++
> > > >  1 file changed, 4 insertions(+)
> > > > 
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
> > > > .yam
> > > > l
> > > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
> > > > .yam
> > > > l
> > > > index 6ad023eec193..df9184b6772c 100644
> > > > ---
> > > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
> > > > .yam
> > > > l
> > > > +++
> > > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
> > > > .yam
> > > > l
> > > > @@ -38,6 +38,10 @@ properties:
> > > >            - const: mediatek,mt7623-mmsys
> > > >            - const: mediatek,mt2701-mmsys
> > > >            - const: syscon
> > > > +      - items:
> > > > +          - const: mediatek,mt8195-vdosys0
> > > > +          - const: mediatek,mt8195-mmsys
> > > > +          - const: syscon
> > > 
> > > and why mediatek,mt8195-mmsys is kept as non-deprecated?
> > 
> > Shouldn't we keep this for fallback compatible?
> 
> I am not talking about it.
> 
> > 
> > I think this items could support the device node like:
> > foo {
> >   compatible = "mediatek,mt8195-vdosys0", "mediatek,mt8195-mmsys", 
> > 	       "syscon";
> > }
> > 
> 
> Yes, this one ok.
> 
> > 
> > Or should I change the items like this?
> > - items:
> >     - const: mediatek,mt8195-vdosys0
> >     - enum:
> >         - mediatek,mt8195-mmsys
> >     - const: syscon
> > 
> 
> No, this does not look correct.

OK, I'll keep this one:
- items:
    - const: mediatek,mt8195-vdosys0
    - const: mediatek,mt8195-mmsys
    - const: syscon

Thanks for the reviews.

> 
> I asked why do you keep old mediatek,mt8195-mmsys compatible in the
> same
> place (the alone one), without making it deprecated?

 - items:
          - enum:
              - mediatek,mt2701-mmsys
              - mediatek,mt2712-mmsys
              - mediatek,mt6765-mmsys
              - mediatek,mt6779-mmsys
              - mediatek,mt6797-mmsys
              - mediatek,mt8167-mmsys
              - mediatek,mt8173-mmsys
              - mediatek,mt8183-mmsys
              - mediatek,mt8186-mmsys
              - mediatek,mt8192-mmsys
              - mediatek,mt8195-mmsys
Do you mean this one can be deprecated?
I'm not sure if I should keep this after adding the new item.
If so, I can remove this at the next version.

              - mediatek,mt8365-mmsys
          - const: syscon

Regards,
Jason-JH.Lin

> 
> Best regards,
> Krzysztof
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


