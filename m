Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D935BC32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 03:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BmoI/TGEngfvulBKrOES+4OxsAg0U2OO06UXKEFiwg=; b=P/cndSRD+WLz7CFnF+O4l/nynD
	x1THHEoS10wGPCRlFAm1UMrRr6zlU/na7kAofjDEAs3ArC4HkXpwM6PYGnmdBDf1uxS/Co6lHRq7N
	WVu1LyLiGXE1So7B6Wh0FE4OPe2mU6MBAWciIGgEVdDsjylf7WTV32Z0ZuWtOeP0TNewsnhdE/LkM
	ptr8Ij08ukeOlF1grKmELG6GayeFDFH8LSuaw+9b3D6Jm6WWXG+S6f+Y02H8ZP4VRebjeWnP3xSP0
	HHlxd2rtMQc4IGIyHXQG4vKgjmXq5Y85d/us27onWQDKOm7F/ixHE2J+4uS70dK496oXzGoGJV2nw
	Ek7S2CRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQggr-00A6v4-6d; Wed, 24 Aug 2022 03:04:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQggf-00A6nV-VX; Wed, 24 Aug 2022 03:04:15 +0000
X-UUID: 5a7e7f98b152462481fce6b55f7e740c-20220823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=6BmoI/TGEngfvulBKrOES+4OxsAg0U2OO06UXKEFiwg=;
	b=qJJyUeovkUPNxbn0XsF6reU+2kkACDBW+AoBuIDHuZ9akHX1DcyDNq+eBs1i29ctfQrehZibOVYeXLLFwbb7Mtebyjllu9MQwkpfaQLr5jZQvSBoLdaLiKQiNLjxP1N34zEBfbu9GlXnbKlLSfTiIJchwiHkSNX9WapBIH9vlLc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:1c15d1ee-9b59-408e-abd7-c9c97861a656,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:b7196bcf-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5a7e7f98b152462481fce6b55f7e740c-20220823
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <zheng-yan.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1871477638; Tue, 23 Aug 2022 20:04:03 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 24 Aug 2022 10:03:08 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 24 Aug 2022 10:03:08 +0800
Message-ID: <4e2699a291009deb70b135fc5867f3a894764019.camel@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: mediatek: Add gamma compatible for
 mt8195
From: zheng-yan.chen <zheng-yan.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 24 Aug 2022 10:03:07 +0800
In-Reply-To: <2bbafb3f-3f69-c014-b86c-476f56d93659@linaro.org>
References: <20220822091945.21343-1-zheng-yan.chen@mediatek.com>
	 <20220822091945.21343-2-zheng-yan.chen@mediatek.com>
	 <2bbafb3f-3f69-c014-b86c-476f56d93659@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_200414_033206_853C6A23 
X-CRM114-Status: GOOD (  21.44  )
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

On Tue, 2022-08-23 at 11:38 +0300, Krzysztof Kozlowski wrote:
> On 22/08/2022 12:19, zheng-yan.chen wrote:
> > mt8195 uses 10bit-to-12bit gamma-LUT, which is different from
> > current 9bit-to-10bit gamma-LUT, so this patch add its own
> > compatible
> > for mt8195.
> 
> I am not sure if this explains the need for change. Is mt8195 still
> compatible with mt8183 or not? Your driver change suggests that it is
> and points that this commit is wrong.
> 
> > 
> > Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> > 
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml   | 3
> > ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > index a89ea0ea7542..fbd7b9664a78 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma
> > .yaml
> > @@ -25,11 +25,12 @@ properties:
> >            - const: mediatek,mt8173-disp-gamma
> >        - items:
> >            - const: mediatek,mt8183-disp-gamma
> > +      - items:
> > +          - const: mediatek,mt8195-disp-gamma
> >        - items:
> >            - enum:
> >                - mediatek,mt8186-disp-gamma
> >                - mediatek,mt8192-disp-gamma
> > -              - mediatek,mt8195-disp-gamma
> 
> 
> Best regards,
> Krzysztof

mt8195 is not compatible with mt8183 now, I will change commit message
to:

   mt8195 uses 10bit-to-12bit gamma-LUT, which is not compatible with
current 9bit-to-10bit gamma-LUT.
    
    This patch thus add constant compatible for mt8195, which means
that mt8195 should only use specified mt8195 gamma driver data.    
    
    Also, delete related compatible from enum, to ensure that
    mt8195 will not accidentally get others' gamma driver data and thus
    cause fatal error.

Best regards,
Zheng-Yan Chen


