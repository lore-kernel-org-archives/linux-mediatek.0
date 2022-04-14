Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1071EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 05:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ksyyrBEVFmFURQnX3j7xBau3G3600ExDqhiqqqP0W/4=; b=Grp8U3VXh+WXFm
	u6/u8hov8wsZAG8fmIWemVFw64pR4tmb5pP2lcjHXh577ruvTSCm7t7tb46T1W2ovRViVKEwcXlIA
	KttqS8LBvCDMWpvd6ql149luk/RFT264N3+wICZ1ki1fVSWurzts6hz5fulXDBC3a/ykYS54S/nkC
	qnbfavqL3+TIQHnLbZ2wJO3vhYIiEuXRxyFsCUOhGpZJ64kzo92gyv/yX5WvKCouwG2BpvJrrnjQl
	Gr1cvbWUvKr02FbbI8E7+xQbdUSGc1YbcJlmhxLjxbHZ8R0bzCTZbCfZ1IyA+xcPEJLFo3K/FnrcK
	FNZyZ8IC8fBMzDCErhmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nes5y-003vno-MF; Thu, 14 Apr 2022 05:32:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nes5v-003vmi-Oe; Thu, 14 Apr 2022 05:32:41 +0000
X-UUID: d6379747c20c46a99607813654ad7932-20220413
X-UUID: d6379747c20c46a99607813654ad7932-20220413
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jia-wei.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 868909056; Wed, 13 Apr 2022 22:32:33 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Apr 2022 22:32:31 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 14 Apr 2022 13:32:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Apr 2022 13:32:18 +0800
Message-ID: <0be3f1af884ba219d3f42286e0307d68406d90e5.camel@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: soc: mediatek: add mt8186 svs dt-bindings
From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Roger Lu
 <roger.lu@mediatek.com>, Kevin Hilman <khilman@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>
Date: Thu, 14 Apr 2022 13:32:18 +0800
In-Reply-To: <215584ce-da8f-d4a1-a557-4cd2abc35e49@linaro.org>
References: <20220412112127.21570-1-jia-wei.chang@mediatek.com>
 <20220412112127.21570-2-jia-wei.chang@mediatek.com>
 <215584ce-da8f-d4a1-a557-4cd2abc35e49@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_223239_851745_6EFC38A7 
X-CRM114-Status: GOOD (  17.00  )
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

On Tue, 2022-04-12 at 14:08 +0200, Krzysztof Kozlowski wrote:
> On 12/04/2022 13:21, Tim Chang wrote:
> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > 
> > Add mt8186 svs compatible in dt-bindings.
> > 
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/mediatek/mtk-
> > svs.yaml b/Documentation/devicetree/bindings/soc/mediatek/mtk-
> > svs.yaml
> > index eecfec13ee8b..122ffabb2be4 100644
> > --- a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> > +++ b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> > @@ -10,6 +10,7 @@ maintainers:
> >    - Roger Lu <roger.lu@mediatek.com>
> >    - Matthias Brugger <matthias.bgg@gmail.com>
> >    - Kevin Hilman <khilman@kernel.org>
> > +  - Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> It's perfectly fine with me, but it's not mentioned in the commit msg
> and some acks from other folks might be useful.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

I missed the commit msg to mention adding myself to svs maintainer
list.
I will update it and ask Roger Lu for his ack in the next version.

Thanks.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
