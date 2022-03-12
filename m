Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8061DC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Mar 2022 14:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0+ySl0r8jwz3XQ7i9IXSzNxN/jXhwIF0ncoCFdVIClk=; b=CX2iBOO3XyDBSp
	OH+8uJt8PJ5qt5dWzPHfVlY/zXY+kng3Eyd4pUh5uhIQ3gRZKA8p/Kf9zKarGgWqC+uCs/hLEHIbE
	aacDqN15LYbH46A+Ne6Zkyg91B09mRv94kazvy+q2A3WMX7gDhLPB5Xs91O9LO6agQfk549rc+yz6
	2sMgkt12Vq7Mq0dYn3GUkj9nUXvnk/agKVnTrJTflMvWtUQdV4bvszcKL+uc+sw1f06TNkUpuOA0n
	h5xhx6/l9E5jvtuygIbfbM+94K5DPAjPizzII4d4+E//toWEPYY777gDI+ymD0fbrCqlhykcgDIly
	raQO1+YJmSxhxi6vAUPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nT2bh-001Sk7-F2; Sat, 12 Mar 2022 14:20:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nT2be-001SjL-E8; Sat, 12 Mar 2022 14:20:32 +0000
X-UUID: 98115c60336a4e7cac3cbf7cc404f7e5-20220312
X-UUID: 98115c60336a4e7cac3cbf7cc404f7e5-20220312
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 736758206; Sat, 12 Mar 2022 07:20:24 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Mar 2022 06:20:23 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 12 Mar 2022 22:20:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 12 Mar 2022 22:20:21 +0800
Message-ID: <fc3c76ab274c12bea9be9e17823fcb4f80ddf764.camel@mediatek.com>
Subject: Re: [PATCH 5/5] dt-bindings: mediatek: mt8195: add
 mt8195-mt6359-max98390-rt5682 document
From: Trevor Wu <trevor.wu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <aaronyu@google.com>, <yc.hung@mediatek.com>
Date: Sat, 12 Mar 2022 22:20:21 +0800
In-Reply-To: <Yip5O3t0Ymyc2h+p@robh.at.kernel.org>
References: <20220308072435.22460-1-trevor.wu@mediatek.com>
 <20220308072435.22460-6-trevor.wu@mediatek.com>
 <Yip5O3t0Ymyc2h+p@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220312_062030_520394_31A37DCF 
X-CRM114-Status: GOOD (  21.87  )
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

On Thu, 2022-03-10 at 16:18 -0600, Rob Herring wrote:
> On Tue, Mar 08, 2022 at 03:24:35PM +0800, Trevor Wu wrote:
> > This patch adds document for mt8195 board with mt6359, max98390 and
> > rt5682.
> > 
> > Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> > ---
> >  .../sound/mt8195-mt6359-max98390-rt5682.yaml  | 61
> > +++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/mt8195-
> > mt6359-max98390-rt5682.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-
> > max98390-rt5682.yaml
> > b/Documentation/devicetree/bindings/sound/mt8195-mt6359-max98390-
> > rt5682.yaml
> > new file mode 100644
> > index 000000000000..7ec14d61b109
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359-
> > max98390-rt5682.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/sound/mt8195-mt6359-max98390-rt5682.yaml*__;Iw!!CTRNKA9wMg0ARbw!zb7eaqdAQfuyPpP5m31L3Q5pdCulclJgnygkkMgYh2M6segUZedd-cYz51-5Q2XDCA$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!zb7eaqdAQfuyPpP5m31L3Q5pdCulclJgnygkkMgYh2M6segUZedd-cYz5187C1ArQA$
> >  
> > +
> > +title: Mediatek MT8195 with MT6359, MAX98390 and RT5682 ASoC sound
> > card driver
> > +
> > +maintainers:
> > +  - Trevor Wu <trevor.wu@mediatek.com>
> > +
> > +description:
> > +  This binding describes the MT8195 sound card.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt8195_mt6359_max98390_rt5682
> 
> You have nodes for each of these components, why do we need new 
> compatible string for each combination. You can figure out the 
> combination by looking at each of those nodes.
> 
> Second, why does each combination need a new schema doc?
> 
> Rob

Hi Rob,

I'm not sure whether I can reuse the old schema doc because of the doc
name and compatible string seems to be specifically for the codec
combination.
If I want to reuse the old schema doc, should I change the doc name or
compatible string? Make the naming more general.

Thanks,
Trevor   



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
