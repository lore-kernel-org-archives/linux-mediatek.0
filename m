Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CCFC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 06:48:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 648BA610D1
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 06:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 648BA610D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KcRf16gyWb3fNldgv9TeKZyhW2iQpVcNR5hIiLEnYU=; b=IlnuSZ8p8R6L2F
	PbT7OQMNOFrdsUe7uzd+k7VI++odSNomonnB4EZI9HS0Pblvz51fq/PTX4Zil5G5gS7NXvGKnU4kA
	IzburIqks3XzZ3RYA0MfZF5YP0aJUUBY7sc8cti345fKz8ETJILe5DlgcrVX6/0S/epiMpFRdvMqi
	TRbbTIGmr8YEIeDmdynv2E9h+TiA9PluiK/hnWBbaCy9VQwsf+hOqct9fsP9JCBNFNMnyZrziWJa7
	CXeUQV9H40u4XlmrAeRerhV5FlO4Qe3RZBYI8xrOOnNOmD517lMHTmbHNtf5Ryf5dX1GIpQL6HSPD
	gQiH6VZJOg5+KPIr97yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTf0c-00DCMO-Tp; Fri, 24 Sep 2021 06:48:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTf0Y-00DCLb-TA; Fri, 24 Sep 2021 06:48:34 +0000
X-UUID: 24088ebf754a472d889fb8bf8487d9d5-20210923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=U1WH7tFmUVe6cBE0xA0PpEbolQJrAvxy+M82LPb1hj0=; 
 b=scsa0ygpY/weZ/XiQKvI5IYR+xdIeiPOKlC8bgyRPtTZfTlWMKqHDDTOHuz2fjC+LVdoPOGhhWUkwS2w7FkZsfdQa0r7tjEb1B3ipwk6kJziUlFRYYv2iWUMjEvzJ5by1nnozPyyw0zran2ZTXzNZ/W7rODEuXnCQRl+haEmhzA=;
X-UUID: 24088ebf754a472d889fb8bf8487d9d5-20210923
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 284492859; Thu, 23 Sep 2021 23:48:26 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Sep 2021 23:40:06 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 14:40:04 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Sep 2021 14:40:03 +0800
Message-ID: <7d83a73dd8abcc24a1562e65a8f38f5c8606c80f.camel@mediatek.com>
Subject: Re: [PATCH v13 2/5] dt-bindings: pinctrl: mt8195: change pull
 up/down description
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <linus.walleij@linaro.org>, <mark.rutland@arm.com>,
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>,
 <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>,
 <light.hsieh@mediatek.com>, <biao.huang@mediatek.com>,
 <hongzhou.yang@mediatek.com>, <sean.wang@mediatek.com>,
 <seiya.wang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Date: Fri, 24 Sep 2021 14:40:06 +0800
In-Reply-To: <YU0jJxr0OJoqahHr@robh.at.kernel.org>
References: <20210922025640.11600-1-zhiyong.tao@mediatek.com>
 <20210922025640.11600-3-zhiyong.tao@mediatek.com>
 <YU0jJxr0OJoqahHr@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_234830_975609_650B2E17 
X-CRM114-Status: GOOD (  21.75  )
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

On Thu, 2021-09-23 at 20:00 -0500, Rob Herring wrote:
> On Wed, Sep 22, 2021 at 10:56:37AM +0800, Zhiyong Tao wrote:
> > For supporting SI units in "bias-pull-down" & "bias-pull-up",
> > Change pull up/down description
> > 
> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > ---
> >  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 65
> > ++++++++++++++++++-
> >  1 file changed, 63 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-
> > mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-
> > mt8195.yaml
> > index 2f12ec59eee5..2f2afabbe4fc 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > @@ -85,9 +85,70 @@ patternProperties:
> >            2/4/6/8/10/12/14/16mA in mt8195.
> >          enum: [0, 1, 2, 3, 4, 5, 6, 7]
> >  
> > -      bias-pull-down: true
> > +      bias-pull-down:
> > +        description: |
> > +          For pull down type is normal, it don't need add RSEL &
> > R1R0 define
> > +          and resistance value.
> > +          For pull down type is PUPD/R0/R1 type, it can add R1R0
> > define to
> > +          set different resistance. It can support
> > "MTK_PUPD_SET_R1R0_00" &
> > +          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
> > "MTK_PUPD_SET_R1R0_11"
> > +          define in mt8195.
> > +          For pull down type is RSEL, it can add RSEL define &
> > resistance value(ohm)
> > +          to set different resistance by identifying property
> > "mediatek,rsel_resistance_in_si_unit".
> > +          It can support "MTK_PULL_SET_RSEL_000" &
> > "MTK_PULL_SET_RSEL_001"
> > +          & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" &
> > "MTK_PULL_SET_RSEL_100"
> > +          & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" &
> > "MTK_PULL_SET_RSEL_111"
> > +          define in mt8195. It can also support resistance
> > value(ohm) "75000" & "5000" in mt8195.
> 
> Please make a schema:
> 
> oneOf:
>   - enum: [ 0, 1, ...7 ]
>   - description: MT8195...
>     enum: [ 5000, 75000 ]
> 

we will add it in the next verison.

> > +          An example of using RSEL define:
> > +          pincontroller {
> > +            i2c0_pin {
> > +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> > +              bias-pull-down = <MTK_PULL_SET_RSEL_001>;
> > +            };
> > +          };
> > +          An example of using si unit resistance value(ohm):
> > +          &pio {
> > +            mediatek,rsel_resistance_in_si_unit;
> > +          }
> > +          pincontroller {
> > +            i2c0_pin {
> > +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> > +              bias-pull-down = <75000>;
> > +            };
> > +          };
> >  
> > -      bias-pull-up: true
> > +      bias-pull-up:
> > +        description: |
> > +          For pull up type is normal, it don't need add RSEL &
> > R1R0 define
> > +          and resistance value.
> > +          For pull up type is PUPD/R0/R1 type, it can add R1R0
> > define to
> > +          set different resistance. It can support
> > "MTK_PUPD_SET_R1R0_00" &
> > +          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
> > "MTK_PUPD_SET_R1R0_11"
> > +          define in mt8195.
> > +          For pull up type is RSEL, it can add RSEL define &
> > resistance value(ohm)
> > +          to set different resistance by identifying property
> > "mediatek,rsel_resistance_in_si_unit".
> > +          It can support "MTK_PULL_SET_RSEL_000" &
> > "MTK_PULL_SET_RSEL_001"
> > +          & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" &
> > "MTK_PULL_SET_RSEL_100"
> > +          & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" &
> > "MTK_PULL_SET_RSEL_111"
> > +          define in mt8195. It can also support resistance
> > value(ohm)
> > +          "1000" & "1500" & "2000" & "3000" & "4000" & "5000" &
> > "10000" & "75000" in mt8195.
> 
> Same here.
> 
> > +          An example of using RSEL define:
> > +          pincontroller {
> > +            i2c0_pin {
> > +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> > +              bias-pull-up = <MTK_PULL_SET_RSEL_001>;
> > +            };
> > +          };
> > +          An example of using si unit resistance value(ohm):
> > +          &pio {
> > +            mediatek,rsel_resistance_in_si_unit;
> > +          }
> > +          pincontroller {
> > +            i2c0_pin {
> > +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> > +              bias-pull-up = <1000>;
> > +            };
> > +          };
> >  
> >        bias-disable: true
> >  
> > -- 
> > 2.25.1
> > 
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
