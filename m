Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BBDC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 02:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5aoonLv/MdHzabK2rsVrdfMOxMwO2rVbaK/tnKBIaqc=; b=iBmbdwHJG8F/UZ
	kCaeYPmkD59GPKXCfxb3k0Zqu+M0LfII/4Wy3adwVxmm5rgrJNJxqZdO+E7j7oNamkdGjuNDjShuW
	HjVAaKJzAucY/Csox9qgOTKPgNKtjhxp14aipxuwPijRt39/crfFzn2J6P60/uZ8mXiMaqfc6SugP
	yAyPmAZWfQu/Xen25R6sGnp1FxZYe60ozJ8eyg/Hp5fp3iIsZpuO7nrFG9gQKU5cZkCkC6aYA3PER
	2kqKrMg8zpyoUawH2BQnM7gn9ExblXdu+r+H0nzpVDDDYG7tgZ0pxLhQdhnZLVPm8ppBOJASpdrLt
	HjUNCnKuxVdTP01phIcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noyUM-009QPS-QT; Thu, 12 May 2022 02:23:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noyRk-009Okc-96; Thu, 12 May 2022 02:20:57 +0000
X-UUID: deb091ff89d24fc59123d13b739ebe26-20220511
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:c50fd90b-359b-4850-baec-92320fc07489, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:a3254125-b432-452e-9e03-2bf3148aed85,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: deb091ff89d24fc59123d13b739ebe26-20220511
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1513960803; Wed, 11 May 2022 19:20:43 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 19:13:22 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 12 May 2022 10:13:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 May 2022 10:13:21 +0800
Message-ID: <1277a1395d37de582223c9d56f8e25ee20d7bd47.camel@mediatek.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: nvmem: mediatek: document
 deprecated efuse property
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "Srinivas
 Kandagatla" <srinivas.kandagatla@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@canonical.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, "; Lala Lin"
 <lala.lin@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Allen-kh Cheng
 <allen-kh.cheng@mediatek.corp-partner.google.com>
Date: Thu, 12 May 2022 10:13:21 +0800
In-Reply-To: <78cc1d8a-e8c4-bb6a-1058-ab912b90ebe4@linaro.org>
References: <20220510132637.5864-1-allen-kh.cheng@mediatek.com>
 <20220510132637.5864-3-allen-kh.cheng@mediatek.com>
 <78cc1d8a-e8c4-bb6a-1058-ab912b90ebe4@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_192056_354732_3906EBEC 
X-CRM114-Status: GOOD (  24.94  )
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

Hi Krzysztof,

On Wed, 2022-05-11 at 17:20 +0200, Krzysztof Kozlowski wrote:
> On 10/05/2022 15:26, Allen-KH Cheng wrote:
> > From: Allen-kh Cheng <
> > allen-kh.cheng@mediatek.corp-partner.google.com>
> > 
> > We mark mediatek,mt8173-efuse and mediatek,efuse as deprecated to
> > prevent them from being the single compatible in the future.
> > 
> > The mediatek,efuse compatible should be used as generic fallback
> > for
> > all MediaTek chipsets.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >  .../devicetree/bindings/nvmem/mediatek,efuse.yaml | 15 +++++++++
> > ------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> > b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> > index 529f5888d93f..04ecf5980b2e 100644
> > --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> > +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> > @@ -16,16 +16,18 @@ allOf:
> >  properties:
> >    compatible:
> >      oneOf:
> > -      - enum:
> > -          - mediatek,mt8173-efuse
> > -          - mediatek,efuse
> > +      - const: mediatek,mt8173-efuse # Don't use this in new dts
> > files
> > +        deprecated: true
> > +      - const: mediatek,efuse
> > +        deprecated: true
> >          description:
> > -          Only mt8173 SoC-specific compatible with generic
> > fallback should be
> > -          used
> > +          Please use mediatek,efuse as generic fallback to enable
> > the MediaTek
> > +          eFuse support.
> 
> Now I see the change, it's a bit surprising to have it in separate
> patch, but ok. In such case, in your first patch don't add this
> description. There is no point to add a description which immediately
> you change in next patch.
> 

I think I misunderstand "Actually I would prefer to deprecate it in
second patch." in preivues reply. It would be great to put all change
in one PATCH.

On the other hand, in order to not check the same mediatek efuse yaml
schema in [1] to cause any conflicts.

Chunfeng will integrate with me and resed again in series [1].
[1] 
https://lore.kernel.org/all/5847417d-921c-7fca-f5de-00e8a550dcb8@linaro.org/

Thanks,
Allen

> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
