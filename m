Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB232ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 05:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BCfGBsb7CSZYwJuH3WigjL/wLKPmkV6fORRrQKE4gM=; b=vevPt0lGb8cuHAMmEwiMRu+rUt
	sqwT9CbfSCnelD+pDObkY2iFInDr8VR3Qe+txTUcApu8tqBSxLEud5uvjYVOvwDSSqp+2hqIXXZ9e
	KGQbRxH6PXWvxTyho+QVXJ0ESQ0Yql97NKCgoqoA1Zhq3iuX9Y1tUq7zDfRSiqO45WJ3fQHXrSaeT
	o4tNcfHJyoHWIjiyfkOmXg5G3uFG4wt8yst/fHiFmAIG4GYUGAg6lK6bLZVceYJDS1yx9/kAo2DIM
	uczDqjbkozddDElO5U310N9v273bQUyKsJpqyxwJRAz95EkvJKL5SuXRR+NFO5tiKpQQbhyQtkDf2
	KgTTlkKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oarxs-008ykh-37; Wed, 21 Sep 2022 05:08:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oarxf-008yhQ-5A; Wed, 21 Sep 2022 05:07:52 +0000
X-UUID: ca6bd2cf76c94b97ad170850eb910ab0-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=6BCfGBsb7CSZYwJuH3WigjL/wLKPmkV6fORRrQKE4gM=;
	b=Ejqr2ba5baV/MFNwriPiCLnRVedqvx3vJKkJNmQ67bGddq383BJrlgAWX0AGhQCAyucXiIsYE1J41+GSjhWlkxpvDN1Pkx1NRFzOq14ubp7qi0sD4x61XxyckQqht2JZXcFRhQaCN0sB21XDuSo3/EE8OpV/V1qtVC5mRCkamuk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:c7b8928b-5d92-4ee7-81fa-3f126054b14d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:d2481ef7-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ca6bd2cf76c94b97ad170850eb910ab0-20220920
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 223245203; Tue, 20 Sep 2022 22:07:36 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 21 Sep 2022 12:16:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 21 Sep 2022 12:16:58 +0800
Message-ID: <8fba20bf37326504b871fb55ce171cd37720a9a0.camel@mediatek.com>
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
Date: Wed, 21 Sep 2022 12:16:58 +0800
In-Reply-To: <65c93c5d-941a-267b-408d-95be83dc2454@linaro.org>
References: <20220920140145.19973-1-jason-jh.lin@mediatek.com>
	 <20220920140145.19973-2-jason-jh.lin@mediatek.com>
	 <65c93c5d-941a-267b-408d-95be83dc2454@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_220751_214356_2BA11165 
X-CRM114-Status: GOOD (  26.11  )
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

Thanks for the reviews.

On Tue, 2022-09-20 at 17:25 +0200, Krzysztof Kozlowski wrote:
> On 20/09/2022 16:01, Jason-JH.Lin wrote:
> > For previous MediaTek SoCs, such as MT8173, there are 2 display HW
> > pipelines binding to 1 mmsys with the same power domain, the same
> > clock driver and the same mediatek-drm driver.
> > 
> > For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding
> > to
> > 2 different power domains, different clock drivers and different
> > mediatek-drm drivers.
> > 
> > Moreover, Hardware pipeline of VDOSYS0 has these components: COLOR,
> > CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture
> > Quality)
> > and they makes VDOSYS0 supports PQ function while they are not
> > including in VDOSYS1.
> > 
> > Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
> > component). It makes VDOSYS1 supports the HDR function while it's
> > not
> > including in VDOSYS0.
> > 
> > To summarize0:
> > Only VDOSYS0 can support PQ adjustment.
> > Only VDOSYS1 can support HDR adjustment.
> > 
> > Therefore, we need to separate these two different mmsys hardwares
> > to
> > 2 different compatibles for MT8195.
> > 
> > Fixes: 81c5a41d10b9 ("dt-bindings: arm: mediatek: mmsys: add mt8195
> > SoC binding")
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4
> > ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > index 6ad023eec193..df9184b6772c 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > @@ -38,6 +38,10 @@ properties:
> >            - const: mediatek,mt7623-mmsys
> >            - const: mediatek,mt2701-mmsys
> >            - const: syscon
> > +      - items:
> > +          - const: mediatek,mt8195-vdosys0
> > +          - const: mediatek,mt8195-mmsys
> > +          - const: syscon
> 
> and why mediatek,mt8195-mmsys is kept as non-deprecated?

Shouldn't we keep this for fallback compatible?

I think this items could support the device node like:
foo {
  compatible = "mediatek,mt8195-vdosys0", "mediatek,mt8195-mmsys", 
	       "syscon";
}


Or should I change the items like this?
- items:
    - const: mediatek,mt8195-vdosys0
    - enum:
        - mediatek,mt8195-mmsys
    - const: syscon


Regards,
Jason-JH.Lin

> 
> Best regards,
> Krzysztof
> 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


