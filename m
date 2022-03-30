Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C569C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 07:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WIb5g/TlRjox5utD7Gwkyz4hhfKxXCiFUVeq0i1hvUw=; b=O6xG38QZbFlz8W
	+tFFf+X4bhO3i5NMUvQMpd27euZBE3co2FEeGm2Ba6iXABJpIBY8EccGMXARyGMdm92erBlovHV2k
	wni+a7X18xfGqWf+nwRHoA36koqWy78hvBG2HBq/6qBEo/tvlDn17JBwlTrvrG83sri66XnpiIAAX
	5osieV4xUkOa6xkwGxmoaSsxzrxPoISGnhA+Btue0eO69Shh9+Hsuu4ZqyPNXQgaXBCMrbQv2/zyc
	qfHJPa0lduCD1mmwpBZvtbcWqqlXbreZKMwpQVN0v0kSLISFie5NiMvSVCMs8xWDUbz25BJehg7u2
	Wjq5JHsd1iMcy5IJiXBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZSpo-00Ebkt-NR; Wed, 30 Mar 2022 07:33:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZSpa-00EbgL-T8; Wed, 30 Mar 2022 07:33:28 +0000
X-UUID: 477331a516364aad86c8f23e2758e20b-20220330
X-UUID: 477331a516364aad86c8f23e2758e20b-20220330
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 675991303; Wed, 30 Mar 2022 00:33:19 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 00:33:18 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 15:33:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Mar 2022 15:33:16 +0800
Message-ID: <094d261cf7621b2e68e53a0aaef8e7eaa9965a7e.camel@mediatek.com>
Subject: Re: [PATCH v12 2/3] dt-bindings: mmc: mtk-sd: increase reg maxItems
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Wenbin Mei
 <wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <ryder.lee@kernel.org>,
 <wenst@chromium.org>, <chunfeng.yun@mediatek.com>
Date: Wed, 30 Mar 2022 15:33:16 +0800
In-Reply-To: <32931f81-5615-8156-4c67-bb4260488185@gmail.com>
References: <20220329114540.17140-1-tinghan.shen@mediatek.com>
 <20220329114540.17140-3-tinghan.shen@mediatek.com>
 <32931f81-5615-8156-4c67-bb4260488185@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_003326_981996_FC5487C1 
X-CRM114-Status: GOOD (  21.32  )
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

Hi Matthias,

On Tue, 2022-03-29 at 16:27 +0200, Matthias Brugger wrote:
> 
> On 29/03/2022 13:45, Tinghan Shen wrote:
> > Add optional host top register base for the reg binding description.
> > 
> 
> Is this based a on a new version of the IP? Shall we make the second reg 
> mandatory for the new HW? If I remember correctly the reg needs to be restored 
> after power save event. So I suppose mmc won't work if that's not done. So 
> optional wouldn't be the right approach.
> 
> Can you please clarify if that's the case.

Yes. This change is introduced since mt8183, and the host top register 
is required for mt8183. 

We'll try to describe this change clearly in bindings in next version.


Best regards,
Tinghan

> 
> Thanks,
> Matthias
> 
> > Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > ---
> >   Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > index 7032f7adf3ca..6d41bcec900f 100644
> > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > @@ -40,7 +40,8 @@ properties:
> >             - const: mediatek,mt8183-mmc
> >   
> >     reg:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> >   
> >     clocks:
> >       description:


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
