Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3A4C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 07:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iR7PVeMnhdeGXKs+FZn+3CfR4SRFgluB6NFl7TsOB9A=; b=sFDZImjqSG+XWr
	iNVs8t66Iz5R+g4JgC9EbZPauYUUBQUl0ZPSQtkm8lhvff6cgz+eOSD0JC7fV7vIB1lgCZamtcUil
	7ba82/8WnuuZQn8txPaJPIYYBKFh1rvAHOVyYToBYVKzKTyOPRnLZEXjyKIvnmebrOrnFRLYxDgXg
	/FyMsZ73+9bfXpX4cJJGbOseCJ0md+w/EYSrm+M5ZY+WGm+atwi+zPWlaA2OAaLN91xxwoO3GX0iT
	l+W14XVW5UciTbO9xqL+Ch3OphQDZTed0B5+IXC6eV0RWvVtMXxdKmZO0BC4Gtcj8Y4CygUwxMmvy
	9qd/PPH9OCvfW/nkV+bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my7qN-008shi-UY; Fri, 17 Dec 2021 07:39:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my7q7-008sdX-Fo; Fri, 17 Dec 2021 07:39:42 +0000
X-UUID: 1df7b9dde5f843d2ab8ba94dd8c830e9-20211217
X-UUID: 1df7b9dde5f843d2ab8ba94dd8c830e9-20211217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1760611835; Fri, 17 Dec 2021 00:39:35 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Dec 2021 23:35:22 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Dec 2021 15:35:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Dec 2021 15:35:19 +0800
Message-ID: <dc7a1e56248fa58f184568e1ce4504a9233209e2.camel@mediatek.com>
Subject: Re: [PATCH 2/2] dt-bindings: mediatek: mt8195: add clock property
 to sound node
From: Trevor Wu <trevor.wu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <jiaxin.yu@mediatek.com>,
 <shumingf@realtek.com>
Date: Fri, 17 Dec 2021 15:35:20 +0800
In-Reply-To: <YbuOQOH3esG1pFQU@robh.at.kernel.org>
References: <20211215065835.3074-1-trevor.wu@mediatek.com>
 <20211215065835.3074-2-trevor.wu@mediatek.com>
 <YbuOQOH3esG1pFQU@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_233939_550492_B774ED2C 
X-CRM114-Status: GOOD (  22.14  )
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

On Thu, 2021-12-16 at 13:06 -0600, Rob Herring wrote:
> On Wed, Dec 15, 2021 at 02:58:35PM +0800, Trevor Wu wrote:
> > clocks and clock-names are added to provide MCLK phandle for sound
> > card.
> > 
> > Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> > ---
> >  .../bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml  | 12
> > ++++++++++++
> >  .../bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml  | 12
> > ++++++++++++
> >  2 files changed, 24 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-
> > rt1011-rt5682.yaml
> > b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-
> > rt5682.yaml
> > index cf6ad7933e23..b57c856d0cf3 100644
> > --- a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-
> > rt5682.yaml
> > +++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-
> > rt5682.yaml
> > @@ -32,11 +32,21 @@ properties:
> >      $ref: "/schemas/types.yaml#/definitions/phandle"
> >      description: The phandle of MT8195 HDMI codec node.
> >  
> > +  clocks:
> > +    items:
> > +      - description: phandle and clock specifier for codec MCLK.
> > +
> > +  clock-names:
> > +    items:
> > +      - const: i2so1_mclk
> > +
> >  additionalProperties: false
> >  
> >  required:
> >    - compatible
> >    - mediatek,platform
> > +  - clocks
> > +  - clock-names
> >  
> >  examples:
> >    - |
> > @@ -44,6 +54,8 @@ examples:
> >      sound: mt8195-sound {
> >          compatible = "mediatek,mt8195_mt6359_rt1011_rt5682";
> >          mediatek,platform = <&afe>;
> > +        clocks = <&topckgen 235>; //CLK_TOP_APLL12_DIV2
> > +        clock-names = "i2so1_mclk";
> >          pinctrl-names = "default";
> >          pinctrl-0 = <&aud_pins_default>;
> >      };
> > diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-
> > rt1019-rt5682.yaml
> > b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-
> > rt5682.yaml
> > index 8f177e02ad35..e4720f76f66b 100644
> > --- a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-
> > rt5682.yaml
> > +++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-
> > rt5682.yaml
> > @@ -42,11 +42,21 @@ properties:
> >        A list of the desired dai-links in the sound card. Each
> > entry is a
> >        name defined in the machine driver.
> >  
> > +  clocks:
> > +    items:
> > +      - description: phandle and clock specifier for codec MCLK.
> > +
> > +  clock-names:
> > +    items:
> > +      - const: i2so1_mclk
> > +
> >  additionalProperties: false
> >  
> >  required:
> >    - compatible
> >    - mediatek,platform
> > +  - clocks
> > +  - clock-names
> >  
> >  examples:
> >    - |
> > @@ -54,6 +64,8 @@ examples:
> >      sound: mt8195-sound {
> >          compatible = "mediatek,mt8195_mt6359_rt1019_rt5682";
> >          mediatek,platform = <&afe>;
> > +        clocks = <&topckgen 235>; //CLK_TOP_APLL12_DIV2
> > +        clock-names = "i2so1_mclk";
> 
> Being a virtual node, how does it have clocks? This belongs in the
> h/w device that consumes the clock.

Hi Rob,

I also found the same usages in some bindings from nvidia, like[1].

Based on my understanding, it seems not to be recommended now and 
clocks should only be used for a real hw node, is it correct?

If yes, I will try other way to get the clock I need in alsa machine
driver.

[1] 
https://elixir.bootlin.com/linux/v5.16-rc5/source/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt

Thanks,
Trevor

> >          pinctrl-0 = <&aud_pins_default>;
> >      };
> > -- 
> > 2.18.0
> > 
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
