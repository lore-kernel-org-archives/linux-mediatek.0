Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3B7C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 04:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PoRh+57Jvttk/J9SkAwAvh7jIPPSSDCTQGZX77VUbzY=; b=mrvwuFduLYZYnt
	w1+7dUHnsWFfWzm/8OkLsfNt1U8knyH4sUnziENirvkVdB2XIcNYFoHlbD5sG79L4l2JU7jql0K/Q
	I1gEpIH6gvvbKUmbDwtqpvj1kQSCokcooiLNEEuy44pMgLPSIcZ115Ytsx6drSSqQ3jyuuorDW+1T
	iJxHPijybSFG212jGxOf04Kj9+4N2o+Ir+7otH7K+cE8nLYFaOBr8HPy7yfmpaxjwmQaFmiLq5ScP
	yE6A68J59Hl2QBHa/7YViAF1xDkrhqyQ6XjTPvFkOj9TCef8IrZ8Pj3pR/ia0pc5giE7NNMc7S4My
	dLObmIdfUN7JrYKresnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUi3u-00EuFv-PQ; Thu, 17 Mar 2022 04:48:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUi3i-00EuEW-SN; Thu, 17 Mar 2022 04:48:24 +0000
X-UUID: aee8fd151be74ccba451fc26134667a8-20220316
X-UUID: aee8fd151be74ccba451fc26134667a8-20220316
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 84772655; Wed, 16 Mar 2022 21:48:10 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Mar 2022 21:48:08 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 17 Mar 2022 12:48:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Mar 2022 12:48:07 +0800
Message-ID: <2f3c1f4461267644ab8e2b45e21c61591d245b01.camel@mediatek.com>
Subject: Re: [PATCH V8 1/5] dt-bindings: display: mediatek: add aal binding
 for MT8183
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
CC: <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <jassisinghbrar@gmail.com>, <fparent@baylibre.com>,
 <yongqiang.niu@mediatek.com>, <hsinyi@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 17 Mar 2022 12:48:07 +0800
In-Reply-To: <cf765199-30c3-f963-4d9b-8f225efd5b32@canonical.com>
References: <20220316115155.17834-1-rex-bc.chen@mediatek.com>
 <20220316115155.17834-2-rex-bc.chen@mediatek.com>
 <cf765199-30c3-f963-4d9b-8f225efd5b32@canonical.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_214822_929484_4568A584 
X-CRM114-Status: GOOD (  13.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2022-03-16 at 16:18 +0100, Krzysztof Kozlowski wrote:
> On 16/03/2022 12:51, Rex-BC Chen wrote:
> > Add aal binding for MT8183.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 4
> > +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > index 61f0ed1e388f..eb0299b80522 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.y
> > aml
> > @@ -22,7 +22,9 @@ properties:
> >    compatible:
> >      oneOf:
> >        - items:
> > -          - const: mediatek,mt8173-disp-aal
> > +          - enum:
> > +              - mediatek,mt8173-disp-aal
> > +              - mediatek,mt8183-disp-aal
> 
> This should not be under items. You have just one element here, so
> directly "enum" under oneOf.
> 
> 
> Best regards,
> Krzysztof

Hello Krzysztof,

OK, I will do this in next version.
Thanks!

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
