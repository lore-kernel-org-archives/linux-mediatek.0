Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594E0C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 03:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+0Yz8kn1TFnhvnKrT75G3LHRxaBoIubyLydwxbXWNY=; b=JojwIp3oR2c9TQ
	lh4qzamiNmpOY6hMrfaJNl7Re2SWZ0X6s8Oz/UqSJ6qq9IehxH6cFrnmkWhxZOdpgB7XCPCNKOer2
	CIDZrnHF9V3w2P/qf8pB8CISQ7oHfkt25uLw/vcGu82c2S346bXP+Qn1Vr9j00ePF6QhbpieKnjzx
	dnsfUNS0mnrxj7l/vNGceGB5lY5sR/WokeuvNB2GF5STkdvZY7cd689ZYPA2oMgx7PIRXpNNH1znt
	gQAPH6ULVqgz6FhXDq6ynC1Mg1oG5+UvWh8eEDy8tKWTrqlwzZhca/+a3H00zlJgXJV7BXSZELfdo
	tdje7jC5cbTAa1k3bePg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWrsd-00CjI3-Nd; Wed, 23 Mar 2022 03:41:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWrsR-00CjH9-FG; Wed, 23 Mar 2022 03:41:41 +0000
X-UUID: 30655517cfd1444999d97f57dc75e699-20220322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/SZphq0Mp3SRt5ZbQ4C3ehF8j6MODRkHRx7RVNwILeQ=; 
 b=A2qe+x6Fq1tHNk0MpawA6F5nrbsU1hFRAi5ma6s7QRKlg/04fj9orYlaTtVzWXXNfK8JVPpZk1xUqev/7fW/UxU+1m7yDAW8ShAqVNW5BrgLGQc3AmpBkb975T5F+aW8aCI4EhtQVTRNYR+t68FsMIeroKGmh+jI3NYw7oR21Hw=;
X-UUID: 30655517cfd1444999d97f57dc75e699-20220322
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1203010504; Tue, 22 Mar 2022 20:41:32 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Mar 2022 20:38:41 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Mar 2022 11:38:33 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Mar 2022 11:38:31 +0800
Message-ID: <9415f00e4f2012adc14592c684fa5b670e382ee8.camel@mediatek.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
From: Axe Yang <axe.yang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Ulf
 Hansson" <ulf.hansson@linaro.org>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala <satyat@google.com>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Lucas Stach <dev@lynxeye.de>, "Eric
 Biggers" <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>, "Stephen
 Boyd" <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu
 <huyue2@yulong.com>, Tian Tao <tiantao6@hisilicon.com>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Date: Wed, 23 Mar 2022 11:38:31 +0800
In-Reply-To: <Yjn8WVBdwiCrstx5@robh.at.kernel.org>
References: <20220321115133.32121-1-axe.yang@mediatek.com>
 <20220321115133.32121-2-axe.yang@mediatek.com>
 <YjkKURNzg8JPbXcg@robh.at.kernel.org>
 <b03df175f871ee9a6561862f5bd7bceb9cafbde1.camel@mediatek.com>
 <5d9c7655-b05e-aa77-d405-c1ec971daa77@collabora.com>
 <4e7a532814510b03b74455f5a924b50a70699ca1.camel@mediatek.com>
 <Yjn8WVBdwiCrstx5@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_204139_546350_A3F2B71E 
X-CRM114-Status: GOOD (  37.37  )
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

Hi Rob,

Sorry, my last mail may mislead your understanding. Let me explain more
about this.

On Tue, 2022-03-22 at 11:42 -0500, Rob Herring wrote:
> On Tue, Mar 22, 2022 at 05:33:55PM +0800, Axe Yang wrote:
> > Hello AngeloGioacchino,
> > 
> > On Tue, 2022-03-22 at 09:42 +0100, AngeloGioacchino Del Regno
> > wrote:
> > > Il 22/03/22 02:35, Axe Yang ha scritto:
> > > > On Mon, 2022-03-21 at 18:29 -0500, Rob Herring wrote:
> > > > > On Mon, Mar 21, 2022 at 07:51:32PM +0800, Axe Yang wrote:
> > > > > > Extend interrupts and pinctrls for SDIO wakeup interrupt
> > > > > > feature.
> > > > > > This feature allow SDIO devices alarm asynchronous
> > > > > > interrupt to
> > > > > > host
> > > > > > even when host stop providing clock to SDIO card. An extra
> > > > > > wakeup
> > > > > > interrupt and pinctrl states for SDIO DAT1 pin state
> > > > > > switching
> > > > > > are
> > > > > > required in this scenario.
> > > > > > 
> > > > > > Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> > > > > > ---
> > > > > >   .../devicetree/bindings/mmc/mtk-sd.yaml       | 23
> > > > > > ++++++++++++++++++-
> > > > > >   1 file changed, 22 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/Documentation/devicetree/bindings/mmc/mtk-
> > > > > > sd.yaml
> > > > > > b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > > > > index 297ada03e3de..f57774535a1d 100644
> > > > > > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > > > > @@ -69,12 +69,23 @@ properties:
> > > > > >         - const: ahb_cg
> > > > > >   
> > > > > >     interrupts:
> > > > > > -    maxItems: 1
> > > > > > +    description:
> > > > > > +      Should at least contain MSDC GIC interrupt. To
> > > > > > support
> > > > > > SDIO
> > > > > > in-band wakeup, an extended
> > > > > > +      interrupt is required and be configured as wakeup
> > > > > > source
> > > > > > irq.
> > > > > > +    minItems: 1
> > > > > > +    maxItems: 2
> > > > > >   
> > > > > >     pinctrl-names:
> > > > > > +    description:
> > > > > > +      Should at least contain default and state_uhs. To
> > > > > > support
> > > > > > SDIO in-band wakeup, dat1 pin
> > > > > > +      will be switched between GPIO mode and SDIO DAT1
> > > > > > mode,
> > > > > > state_eint and state_dat1 are
> > > > > > +      mandatory in this scenarios.
> > > > > > +    minItems: 2
> > > > > >       items:
> > > > > >         - const: default
> > > > > >         - const: state_uhs
> > > > > > +      - const: state_eint
> > > > > > +      - const: state_dat1
> > > > > >   
> > > > > >     pinctrl-0:
> > > > > >       description:
> > > > > > @@ -86,6 +97,16 @@ properties:
> > > > > >         should contain uhs mode pin ctrl.
> > > > > >       maxItems: 1
> > > > > >   
> > > > > > +  pinctrl-2:
> > > > > > +    description:
> > > > > > +      should switch dat1 pin to GPIO mode.
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  pinctrl-3:
> > > > > > +    description:
> > > > > > +      should switch SDIO dat1 pin from GPIO mode back to
> > > > > > SDIO
> > > > > > mode.
> > > > > 
> > > > > How is this different than pinctrl-0?
> > > > 
> > > > pinctrl-0 contains default settings for all IO
> > > > pins(CLK/CMD/DAT).
> > > > pinctrl-1 contains settings for all IO pins(CLK/CMD/DAT) in UHS
> > > > mode.
> > > > pinctrl-3 is lightweight pinctrl-1, only keep SDIO DAT1 pin
> > > > function
> > > > switch part.
> > > > 
> > > 
> > > Is there any particular reason why we cannot simply select
> > > pinctrl-1
> > > again
> > > instead of pinctrl-3, apart from the virtually not existent
> > > overhead
> > > of one more mmio write?
> > 
> > No, there is no particular reason. 
> > I just want to do the pin function switch quick and clean. 
> > 
> > The intention of pinctrl-1 is to set the most initial state of IO
> > pins
> > in UHS mode. If I don't need to adjust IO settings any longer, it
> > is
> > okay to select pinctrl-1 state instead of pinctrl-3. 
> > But think about this scenarios: after initial SDIO IO pins to UHS
> > mode,
> > I want to adjust some IO related properties, such as driving
> > strength.
> > And I want to keep these settings because with new driving
> > strength,
> > the signal is better. I'd rather to choose pinctrl-3 but not
> > pinctrl-1, 
> > because I do not want the change be restored after next runtime
> > resume.
> 
> The pinctrl-X properties set modes, they aren't supposed to be a
> state 
> machine

I do use the pinctl-x properties to set modes, but not judge state from
pin state.

I need to time-multiplex SDIO DAT1 pin, shift it between GPIO mode and
SDIO IO mode, for example:

mmc2_pins_default {
	...
};

mmc2_pins_uhs {
        pins_clk {
                pinmux = <PINMUX_GPIO170__FUNC_B1_MSDC2_CLK>;
                drive-strength = <MTK_DRIVE_4mA>;
                bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
        };

        pins_cmd_dat {
                pinmux = <PINMUX_GPIO169__FUNC_B1_MSDC2_CMD>,
                         <PINMUX_GPIO171__FUNC_B1_MSDC2_DAT0>,
                         <PINMUX_GPIO172__FUNC_B1_MSDC2_DAT1>,
                         <PINMUX_GPIO173__FUNC_B1_MSDC2_DAT2>,
                         <PINMUX_GPIO174__FUNC_B1_MSDC2_DAT3>;
                input-enable;
                drive-strength = <MTK_DRIVE_6mA>;
                bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
        };
};

mmc2_pins_eint {
        pins_dat1 {
                pinmux = <PINMUX_GPIO172__FUNC_B_GPIO172>;
                input-enable;
                bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
        };
};

mmc2_pins_dat1 {
        pins_dat1 {
                pinmux = <PINMUX_GPIO172__FUNC_B1_MSDC2_DAT1>;
                input-enable;
                bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
        };
};

The pinctrl-1(mmc2_pin_uhs) here contain all SDIO IO pins, for the most
early initialize. I SELECT pinctrl-1 when I change SDIO to SDR104 mode,
before calibration.
And when SDIO bus is idle, I SELECT pinctrl-2(mmc2_pins_eint), use DAT1
as a interrupt line when steping into runtime suspend.
After resume, I SELECT pinctrl-3(mmc2_pins_dat1) to set DAT1 pin back
to SDIO IO mode.

I need all the pinctrl-x properties, and take the initiative to set pin
mode according to needs.


Best Regard,
Axe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
