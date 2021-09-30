Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065ABC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 01:59:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7DF661872
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 01:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7DF661872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LeTFx3Jdxol+ggQCRYwJqQgLbn+rnEWEOjPUi9cuccM=; b=deMRAlVkxnR1bV
	NUtZL+1UDvuST4Bio8uOw07mKwpHJ5GZ2LnmYeiT8Q/93ys34xqkLfRPgT17ZSHaVf4xErO26YXJJ
	Awqz7PlGHM7fMe/UdrTZ0b8rFwN3SfUOdp6QfaMoqornv7EKUB0gfJByYY2KXnf9pRB8+xhAFt88H
	wapBF46JbXul7WH/2nVsUKnqZYa4TXtLozphlywRCBRnpZ1A4FIBsVwkn5tFJyc4hE98LDybPwNlN
	QH2++eGOsk/ypiCsgFtmca2FlLG9nfm//31iVPKImvAmgXwQIH60sCUxHtTVb9SeKubaSd2dWvtrc
	sqF0TGElmmf35eRUj9gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVlLg-00Ckvs-No; Thu, 30 Sep 2021 01:59:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVlLR-00CktT-IF; Thu, 30 Sep 2021 01:58:49 +0000
X-UUID: de81333050d843da860b24cc91c34e62-20210929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8xFaGwy8m9rJRO6E7J8y12QhwWnG7CWtmSNhyH6WxMY=; 
 b=BCUb00lDXAgKDei4Zf6LMwas7/zczSdCNr6j8nQJcbHJfkbIVw9msiHgJh/CG2Yo/zAfSCAh7jLUtRJGsYeLluRyw8vfSvRrLJKg5PwzRMQaBPhveMsxK2TCTaOOxHlNPEALzwTBB/XjJwmOdTT46nkhbN4PAQ4FxIG/Of3mLoY=;
X-UUID: de81333050d843da860b24cc91c34e62-20210929
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1641738372; Wed, 29 Sep 2021 18:58:41 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Sep 2021 18:54:43 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 30 Sep 2021 09:54:42 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Sep 2021 09:54:41 +0800
Message-ID: <37eac06e20d82c0fe37a5d8e5633cbbc48d4af29.camel@mediatek.com>
Subject: Re: [PATCH v14 2/5] dt-bindings: pinctrl: mt8195: change pull
 up/down description
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <zhiyong.tao@mediatek.com>, <linus.walleij@linaro.org>,
 <mark.rutland@arm.com>, <matthias.bgg@gmail.com>, <sean.wang@kernel.org>,
 <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>,
 <light.hsieh@mediatek.com>, <biao.huang@mediatek.com>,
 <hongzhou.yang@mediatek.com>, <sean.wang@mediatek.com>,
 <seiya.wang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Date: Thu, 30 Sep 2021 09:54:44 +0800
In-Reply-To: <YVTfDJNW5Pe3iAR/@robh.at.kernel.org>
References: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
 <20210924080632.28410-3-zhiyong.tao@mediatek.com>
 <YVTfDJNW5Pe3iAR/@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_185845_637654_8FEF9338 
X-CRM114-Status: GOOD (  29.60  )
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

On Wed, 2021-09-29 at 16:47 -0500, Rob Herring wrote:
> On Fri, Sep 24, 2021 at 04:06:29PM +0800, Zhiyong Tao wrote:
> > For supporting SI units in "bias-pull-down" & "bias-pull-up",
> > change pull up/down description
> > and add "mediatek,rsel_resistance_in_si_unit" description.
> > 
> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > ---
> >  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 86
> > ++++++++++++++++++-
> >  1 file changed, 84 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-
> > mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-
> > mt8195.yaml
> > index 2f12ec59eee5..5f642bef72af 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > @@ -49,6 +49,12 @@ properties:
> >      description: The interrupt outputs to sysirq.
> >      maxItems: 1
> >  
> > +  mediatek,rsel_resistance_in_si_unit:
> 
> s/_/-/

Hi Rob,

what do you mean?

> 
> > +    type: boolean
> > +    description: |
> > +      Identifying i2c pins pull up/down type which is RSEL. It can
> > support
> > +      RSEL define or si unit value(ohm) to set different
> > resistance.
> 
> Aren't the RSEL and ohms disjoint values? 0-207 for RSEL and >1000
> for 
> ohms. Why is this property even needed.
> 
No, they aren't.
As we talked in v11. "mediatek,rsel_resistance_in_si_unit" is only a
flag.



Hi ChenYu,

In the next version, we provide a solution which we discussed internal
to avoid value clashes.
 
The solution:
1. We will keep the define "MTK_PULL_SET_RSEL_000 200". It won't
change.

2. We will add a property in pio dtsi node, for example,
the property name is "rsel_resistance_in_si_unit".
We will add a flag "rsel_si_unit" in pinctrl device.
in probe function, we will identify the property name
"rsel_resistance_in_si_unit" to set the flag "rsel_si_unit" value.
So it can void value clashes.

3.We will provide the define "MTK_PULL_SET_RSEL_000 200" and si unit
two solution. users can support which solution by add property
"rsel_resistance_in_si_unit" in dts node or not.

Thanks

> > +
> >  #PIN CONFIGURATION NODES
> >  patternProperties:
> >    '-pins$':
> > @@ -85,9 +91,85 @@ patternProperties:
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
> > +          oneOf:
> 
> Because of the indentation, this is all just part of 'description'.

Can you help to give some suggestion to fix it?


> 
> > +            - enum: [100, 101, 102, 103]
> > +            - description: mt8195 pull down PUPD/R0/R1 type define
> > value.
> 
> This entry is always true.

why is it always true? we only get define value.
"100~104" are means that "#define MTK_PUPD_SET_R1R0_10 102" in
include/dt-bindings/pinctrl/mt65xx.h.

> 
> > +            - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> 
> Are these supposed to be hex?
yes, it is patch 1/5 define "#define MTK_PULL_SET_RSEL_000  200".
> 
> > +            - description: mt8195 pull down RSEL type define
> > value.
> 
> And so is this one. That makes 'oneOf' always false.

why is it always false? we only get the si unit value.

> 
> > +            - enum: [75000, 5000]
> > +            - description: mt8195 pull down RSEL type si unit
> > value(ohm).
> > +
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
> > +          oneOf:
> > +            - enum: [100, 101, 102, 103]
> > +            - description: mt8195 pull up PUPD/R0/R1 type define
> > value.
> > +            - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> > +            - description: mt8195 pull up RSEL type define value.
> > +            - enum: [1000, 1500, 2000, 3000, 4000, 5000, 10000,
> > 75000]
> > +            - description: mt8195 pull up RSEL type si unit
> > value(ohm).
> 
> Same issues here.
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
