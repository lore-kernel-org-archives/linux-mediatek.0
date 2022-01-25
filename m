Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2A4C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 06:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9RTtKP9hHtwetkkoSTnQjeDZ8mqVrlNTt2TkOPsRbmg=; b=ciuzsXdwd2LyvS
	SyWSrGapshuHOqCl/tioYoOsCOA/OH96BQ6EQgWniL5KJzcbWfU5Tn2aQM/0AHOWYR+K64jZ5Yjc5
	74XwtzqHwQyWf24biTjyBpuRpM7y2N1H3s5I6l1ioN4EXJXm5Lf9ohij3omzXsNvqE9yBtOdckoZ0
	FOf4nddsYghGVAVWh+9yixclqr3msbVxz+2gPfT1SN6hali95sw6FfqqgAcP/wvWpEL7VqyLa7U59
	n3ydMegFDyG6QJuMJ/kBnSaMnkyNCDGirnAjHZ5+JFQPp0LjXPmqvgkYlcX7vqYBO8Bv/SjEDax6w
	P6Ornf2ZKAkAUqHTufpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCFD6-006YU4-Az; Tue, 25 Jan 2022 06:21:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCFD4-006YT9-77; Tue, 25 Jan 2022 06:21:43 +0000
X-UUID: 3c6ec7c78d284da58abcca18ad6bee6b-20220124
X-UUID: 3c6ec7c78d284da58abcca18ad6bee6b-20220124
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 266675314; Mon, 24 Jan 2022 23:21:36 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Jan 2022 22:21:34 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 25 Jan 2022 14:21:33 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Jan 2022 14:21:33 +0800
Message-ID: <102ea6303dd16fdf9ec931d0a1845a93afe92545.camel@mediatek.com>
Subject: Re: [PATCH v9 2/3] dt-bindings: pinctrl: mt8195: Add
 mediatek,drive-strength-adv property
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "David
 Matlack" <dmatlack@google.com>, Jing Zhang <jingzhangos@google.com>, "Marc
 Zyngier" <maz@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <ryder.lee@kernel.org>,
 <wenst@chromium.org>, <chunfeng.yun@mediatek.com>
Date: Tue, 25 Jan 2022 14:21:33 +0800
In-Reply-To: <18f7a647-6153-6d38-dff1-727b9592b01e@gmail.com>
References: <20220112114724.1953-1-tinghan.shen@mediatek.com>
 <20220112114724.1953-3-tinghan.shen@mediatek.com>
 <18f7a647-6153-6d38-dff1-727b9592b01e@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_222142_304222_8392AD07 
X-CRM114-Status: GOOD (  27.68  )
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

On Thu, 2022-01-13 at 17:31 +0100, Matthias Brugger wrote:
> [dopping Maciej, Paolo and Sean Christopherson]
> 
> On 12/01/2022 12:47, Tinghan Shen wrote:
> > Extend driving support for I2C pins on SoC mt8195.
> > This property is already documented in mediatek,mt8183-pinctrl.yaml.
> > 
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Looks good to me. Linus please let me know when you are queuing this patch and 
> I'll take the rest of the series. Another option is, that you provide an 
> Acked-by and I can take the whole set through my branch.
> 
> Regards,
> Matthias

Hi Matthias,

I want to send next version to update the CC list of this series, but I'm not sure 
whether this will break the conversation between you and Linus.

Is it ok to send next version? or waiting the response?

Best regards,
TingHan

> 
> > ---
> >   .../bindings/pinctrl/pinctrl-mt8195.yaml      | 35 +++++++++++++++++++
> >   1 file changed, 35 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > index 328ea59c5466..4db4899af6b1 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > @@ -98,6 +98,32 @@ patternProperties:
> >             drive-strength:
> >               enum: [2, 4, 6, 8, 10, 12, 14, 16]
> >   
> > +          mediatek,drive-strength-adv:
> > +            description: |
> > +              Describe the specific driving setup property.
> > +              For I2C pins, the existing generic driving setup can only support
> > +              2/4/6/8/10/12/14/16mA driving. But in specific driving setup, they
> > +              can support 0.125/0.25/0.5/1mA adjustment. If we enable specific
> > +              driving setup, the existing generic setup will be disabled.
> > +              The specific driving setup is controlled by E1E0EN.
> > +              When E1=0/E0=0, the strength is 0.125mA.
> > +              When E1=0/E0=1, the strength is 0.25mA.
> > +              When E1=1/E0=0, the strength is 0.5mA.
> > +              When E1=1/E0=1, the strength is 1mA.
> > +              EN is used to enable or disable the specific driving setup.
> > +              Valid arguments are described as below:
> > +              0: (E1, E0, EN) = (0, 0, 0)
> > +              1: (E1, E0, EN) = (0, 0, 1)
> > +              2: (E1, E0, EN) = (0, 1, 0)
> > +              3: (E1, E0, EN) = (0, 1, 1)
> > +              4: (E1, E0, EN) = (1, 0, 0)
> > +              5: (E1, E0, EN) = (1, 0, 1)
> > +              6: (E1, E0, EN) = (1, 1, 0)
> > +              7: (E1, E0, EN) = (1, 1, 1)
> > +              So the valid arguments are from 0 to 7.
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            enum: [0, 1, 2, 3, 4, 5, 6, 7]
> > +
> >             bias-pull-down:
> >               description: |
> >                 For pull down type is normal, it don't need add RSEL & R1R0 define
> > @@ -268,4 +294,13 @@ examples:
> >             bias-pull-down;
> >           };
> >         };
> > +
> > +      i2c0-pins {
> > +        pins {
> > +          pinmux = <PINMUX_GPIO8__FUNC_SDA0>,
> > +                   <PINMUX_GPIO9__FUNC_SCL0>;
> > +          bias-disable;
> > +          mediatek,drive-strength-adv = <7>;
> > +        };
> > +      };
> >       };
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
