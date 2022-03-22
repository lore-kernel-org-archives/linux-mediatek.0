Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1329EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 01:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HznNNmRF9sHUDj0qgnX0pGofP+R627RaYz7J6HY1tX4=; b=CeYYNBy12Uoq3u
	loaxFFBIcH2IEzKvcuKdaaohsQSFYjqJnEc5x/N/CUFYY8gpYj/67enNQetsjg3AB9ifRA52RXxmX
	BPzJKyh4Te+kILCaBqGSPPLx49df0UBgKZc03RRL1HuwDwyAKjmOKeZoSOSd/fHFqz5JEmE/X3R4r
	ODu28iRxqzwYdA5qDyq7W6tnEcjV4edg5m5wQkHn5kBYKPKadpuWnhA3eb+/+IGv4IdrtDWDr38rE
	KjHbd6pdl4LFWmQh7tpgB0lr3NYSAP+QHE0NgLaSZdmMfiJW0rjPQyL5B7mN71u35KEpiAajLXtjk
	4txxZ9no/p9r+95jpvKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWTaV-009cgM-NZ; Tue, 22 Mar 2022 01:45:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWTaE-009ccy-Qf; Tue, 22 Mar 2022 01:45:21 +0000
X-UUID: ab219ab00fc246ac87509d48fa9bf2e5-20220321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=a669kASSOW8yV0ncywkLLqqxbgsh2EqZUbItlsiRdpY=; 
 b=DouXB9LPrmEDg0H9bnHrQneqcm0B3MzcTfOpRVGuskto+KFyH/nAj93HK67fCDieDk/+YskXwGL8DWhCKiHgkhAWetMJafmipJOjohc8fbcdDOeJ8GyTOi7G4vaPf6aMitXCeH/qQD6FRn/YptPatcpiYBfgcCBnjq355tl2skU=;
X-UUID: ab219ab00fc246ac87509d48fa9bf2e5-20220321
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1408976696; Mon, 21 Mar 2022 18:45:07 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Mar 2022 18:35:04 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 22 Mar 2022 09:35:03 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Mar 2022 09:35:01 +0800
Message-ID: <b03df175f871ee9a6561862f5bd7bceb9cafbde1.camel@mediatek.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
From: Axe Yang <axe.yang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala <satyat@google.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Lucas Stach <dev@lynxeye.de>, "Eric
 Biggers" <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>, "Stephen
 Boyd" <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu
 <huyue2@yulong.com>, Tian Tao <tiantao6@hisilicon.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Tue, 22 Mar 2022 09:35:01 +0800
In-Reply-To: <YjkKURNzg8JPbXcg@robh.at.kernel.org>
References: <20220321115133.32121-1-axe.yang@mediatek.com>
 <20220321115133.32121-2-axe.yang@mediatek.com>
 <YjkKURNzg8JPbXcg@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_184516_297034_47D86A81 
X-CRM114-Status: GOOD (  20.27  )
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

On Mon, 2022-03-21 at 18:29 -0500, Rob Herring wrote:
> On Mon, Mar 21, 2022 at 07:51:32PM +0800, Axe Yang wrote:
> > Extend interrupts and pinctrls for SDIO wakeup interrupt feature.
> > This feature allow SDIO devices alarm asynchronous interrupt to
> > host
> > even when host stop providing clock to SDIO card. An extra wakeup
> > interrupt and pinctrl states for SDIO DAT1 pin state switching are
> > required in this scenario.
> > 
> > Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> > ---
> >  .../devicetree/bindings/mmc/mtk-sd.yaml       | 23
> > ++++++++++++++++++-
> >  1 file changed, 22 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > index 297ada03e3de..f57774535a1d 100644
> > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > @@ -69,12 +69,23 @@ properties:
> >        - const: ahb_cg
> >  
> >    interrupts:
> > -    maxItems: 1
> > +    description:
> > +      Should at least contain MSDC GIC interrupt. To support SDIO
> > in-band wakeup, an extended
> > +      interrupt is required and be configured as wakeup source
> > irq.
> > +    minItems: 1
> > +    maxItems: 2
> >  
> >    pinctrl-names:
> > +    description:
> > +      Should at least contain default and state_uhs. To support
> > SDIO in-band wakeup, dat1 pin
> > +      will be switched between GPIO mode and SDIO DAT1 mode,
> > state_eint and state_dat1 are
> > +      mandatory in this scenarios.
> > +    minItems: 2
> >      items:
> >        - const: default
> >        - const: state_uhs
> > +      - const: state_eint
> > +      - const: state_dat1
> >  
> >    pinctrl-0:
> >      description:
> > @@ -86,6 +97,16 @@ properties:
> >        should contain uhs mode pin ctrl.
> >      maxItems: 1
> >  
> > +  pinctrl-2:
> > +    description:
> > +      should switch dat1 pin to GPIO mode.
> > +    maxItems: 1
> > +
> > +  pinctrl-3:
> > +    description:
> > +      should switch SDIO dat1 pin from GPIO mode back to SDIO
> > mode.
> 
> How is this different than pinctrl-0?

pinctrl-0 contains default settings for all IO pins(CLK/CMD/DAT).
pinctrl-1 contains settings for all IO pins(CLK/CMD/DAT) in UHS mode.
pinctrl-3 is lightweight pinctrl-1, only keep SDIO DAT1 pin function
switch part.

...

Regards,
Axe
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
