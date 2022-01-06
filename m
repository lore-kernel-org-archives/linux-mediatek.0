Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15420C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 08:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ctGGe+akTlvsQMNAQGZdy6Az9FZyDAHQucHDi9v/bHI=; b=fmsXpoYfnBV1TQ
	1atv1KX6WuTpdX9gkE9LnUb9OeojnNvRBEyOn96nf5RW/G5RlHkqNMY0R7XM7dd86FfSU70bYoudY
	HdAb46ogXWaHbNz91QywjfYOD+aT75rVX1VRkqkxZSfFEvM3ZhtySjViUk0pTk0lQSZHNPvpE9T+M
	hWvYvUDUyndCMHpYwO09NSW6rTGOukle6/y6MUozRf2gNe5aYmhFVX4MUF2ce00rllmjI2hzxulg4
	LpMb05cv2G97vVpgQ04lzjrcT7tPS3eHZKoqlX2TeA0xoipn61sh+NRsFx7d43y2wWvzRUS3Ou+zO
	ubg3H1iWn+7Pmfu2V3RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5NnC-00Gwwk-59; Thu, 06 Jan 2022 08:06:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5Nmz-00GwtB-BK; Thu, 06 Jan 2022 08:06:26 +0000
X-UUID: 8389c323e1ed47f8b656308662971e25-20220106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Ce3ZAY9B/aYHymoAIZXZKDFaFQVqQSpZylX0kY7AnpA=; 
 b=pUNYVGWfAh994wItUqcIA9yBNwfLRoiuz0l3uRJuPDyoFy6J5h7eU7Zi6X2xnmeuSIHqguLcf5iVx70sbBHst6CZK2Lof2RYy69cVg4htfHffB3JmKNF/9zCb4Jt1WOPJq+dEYzHuphyBUwvGPFqHZJjnzj37XhYtMfuR2gOsTs=;
X-UUID: 8389c323e1ed47f8b656308662971e25-20220106
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1603228879; Thu, 06 Jan 2022 01:06:23 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Jan 2022 00:06:22 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 6 Jan 2022 16:06:20 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Jan 2022 16:06:16 +0800
Message-ID: <b5a9c481f8ed42b2d8bd04ca8b727627d4a3a15a.camel@mediatek.com>
Subject: Re: [PATCH V6, 1/5] dt-bindings: mediatek: Add mediatek,
 mt8195-jpgenc compatible
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Ricardo Ribalda <ribalda@chromium.org>
CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <xia.jiang@mediatek.com>,
 <maoguang.meng@mediatek.com>, <srv_heupstream@mediatek.com>,
 <irui.wang@mediatek.com>, <kyrie.wu@mediatek.com>
Date: Thu, 6 Jan 2022 16:06:14 +0800
In-Reply-To: <Yaoe/Tk1wMyFoB1s@gmail.com>
References: <1638501230-13417-1-git-send-email-kyrie.wu@mediatek.com>
 <1638501230-13417-2-git-send-email-kyrie.wu@mediatek.com>
 <Yaoe/Tk1wMyFoB1s@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_000625_424551_09CF25BB 
X-CRM114-Status: GOOD (  20.44  )
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

On Fri, 2021-12-03 at 14:43 +0100, Ricardo Ribalda wrote:
> kyrie.wu wrote:
> 
> > Add mediatek, mt8195-jpgenc compatible to binding document
> > 
> > Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> > ---
> > V6: no change
> 
> Hi Kyrie
> 
> Your patch does not seem to apply on top of linus or linus/next.
> 
> In linus/next they still have the .txt file:
> 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt?id=7afeac307a9561e3a93682c1e7eb22f918aa1187
> 
> What are you using?
> 
> Thanks
I will fix this issue in the next code version, thanks.
> 
> 
> > ---
> >  Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml 
> > | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-
> > encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-
> > jpeg-encoder.yaml
> > index fcd9b82..e93ccf5 100644
> > --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-
> > encoder.yaml
> > +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-
> > encoder.yaml
> > @@ -18,6 +18,9 @@ properties:
> >        - enum:
> >            - mediatek,mt2701-jpgenc
> >            - mediatek,mt8183-jpgenc
> > +          - mediatek,mt8195-jpgenc
> > +          - mediatek,mt8195-jpgenc0
> > +          - mediatek,mt8195-jpgenc1
> >        - const: mediatek,mtk-jpgenc
> >    reg:
> >      maxItems: 1
> > -- 
> > 2.6.4
> > 
> > 
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
