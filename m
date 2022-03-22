Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2728DC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 09:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1r49Kw1tjJFYQZ+svBez4ClhDSn7uFsD/DQdpTCBxM=; b=yTNrrqwwqZD12i
	S9kVwih3l9pIn3TRddDnxjx1zM/JWhbRyoCKe7qbwVweVyJtSGKmp/xjoMNKVOJ0vSwPkHj8ZDLJc
	OWz1koR9e6bQPlw+qhu/YVnPxQmedY5gQNZcxfUbvDi40QWsFSvdFhK7aUSdVxSiOUL6vnKvs/ESb
	vTkCRMn1zCpAIOyXxqITAOPbiK3MglCZFgTT8HJlrMD4E+t3lf9tQkLRuanAt8Vs9zDTBhiZQJGfo
	W6zfVZn638P2oOM+sEasREfmH47dI6inm6pII1suOp/6m9Dk3/Ae65qXB1cIKYjrrALWtQ0ZK/lXT
	DctNT4/fhRUd6va93X4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWay2-00AcRT-Qz; Tue, 22 Mar 2022 09:38:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWaxm-00AcMW-L3; Tue, 22 Mar 2022 09:38:04 +0000
X-UUID: 9436d3e6b1fb44e1b059024f88cff18b-20220322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Kg/PHBY7SCtNrfBeQQUw9qMpRjgYiBYmxp2mwvOkM/A=; 
 b=PihCs6zIoQ4Y45XJflZWA99I0aDsBxoz9bFfocrAfe5+tV4ibr6Q7vPgl2NZJHn0N8cXC1aI9WUA3aq5A2m+hUVKZ5I3e+knrea1DB4brirj7DKaF55v4hBHJpldRzIVkIJX4NNGEFLU21ak8X3WmOnWGE3hvJWFzJnn5xBQs5w=;
X-UUID: 9436d3e6b1fb44e1b059024f88cff18b-20220322
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1496096315; Tue, 22 Mar 2022 02:37:59 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Mar 2022 02:33:58 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 22 Mar 2022 17:33:56 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Mar 2022 17:33:55 +0800
Message-ID: <4e7a532814510b03b74455f5a924b50a70699ca1.camel@mediatek.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
From: Axe Yang <axe.yang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh@kernel.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala <satyat@google.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Lucas Stach <dev@lynxeye.de>, "Eric
 Biggers" <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>, "Stephen
 Boyd" <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu
 <huyue2@yulong.com>, Tian Tao <tiantao6@hisilicon.com>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Date: Tue, 22 Mar 2022 17:33:55 +0800
In-Reply-To: <5d9c7655-b05e-aa77-d405-c1ec971daa77@collabora.com>
References: <20220321115133.32121-1-axe.yang@mediatek.com>
 <20220321115133.32121-2-axe.yang@mediatek.com>
 <YjkKURNzg8JPbXcg@robh.at.kernel.org>
 <b03df175f871ee9a6561862f5bd7bceb9cafbde1.camel@mediatek.com>
 <5d9c7655-b05e-aa77-d405-c1ec971daa77@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_023802_739922_4CCD95EB 
X-CRM114-Status: GOOD (  27.80  )
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

Hello AngeloGioacchino,

On Tue, 2022-03-22 at 09:42 +0100, AngeloGioacchino Del Regno wrote:
> Il 22/03/22 02:35, Axe Yang ha scritto:
> > On Mon, 2022-03-21 at 18:29 -0500, Rob Herring wrote:
> > > On Mon, Mar 21, 2022 at 07:51:32PM +0800, Axe Yang wrote:
> > > > Extend interrupts and pinctrls for SDIO wakeup interrupt
> > > > feature.
> > > > This feature allow SDIO devices alarm asynchronous interrupt to
> > > > host
> > > > even when host stop providing clock to SDIO card. An extra
> > > > wakeup
> > > > interrupt and pinctrl states for SDIO DAT1 pin state switching
> > > > are
> > > > required in this scenario.
> > > > 
> > > > Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> > > > ---
> > > >   .../devicetree/bindings/mmc/mtk-sd.yaml       | 23
> > > > ++++++++++++++++++-
> > > >   1 file changed, 22 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > > b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > > index 297ada03e3de..f57774535a1d 100644
> > > > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > > @@ -69,12 +69,23 @@ properties:
> > > >         - const: ahb_cg
> > > >   
> > > >     interrupts:
> > > > -    maxItems: 1
> > > > +    description:
> > > > +      Should at least contain MSDC GIC interrupt. To support
> > > > SDIO
> > > > in-band wakeup, an extended
> > > > +      interrupt is required and be configured as wakeup source
> > > > irq.
> > > > +    minItems: 1
> > > > +    maxItems: 2
> > > >   
> > > >     pinctrl-names:
> > > > +    description:
> > > > +      Should at least contain default and state_uhs. To
> > > > support
> > > > SDIO in-band wakeup, dat1 pin
> > > > +      will be switched between GPIO mode and SDIO DAT1 mode,
> > > > state_eint and state_dat1 are
> > > > +      mandatory in this scenarios.
> > > > +    minItems: 2
> > > >       items:
> > > >         - const: default
> > > >         - const: state_uhs
> > > > +      - const: state_eint
> > > > +      - const: state_dat1
> > > >   
> > > >     pinctrl-0:
> > > >       description:
> > > > @@ -86,6 +97,16 @@ properties:
> > > >         should contain uhs mode pin ctrl.
> > > >       maxItems: 1
> > > >   
> > > > +  pinctrl-2:
> > > > +    description:
> > > > +      should switch dat1 pin to GPIO mode.
> > > > +    maxItems: 1
> > > > +
> > > > +  pinctrl-3:
> > > > +    description:
> > > > +      should switch SDIO dat1 pin from GPIO mode back to SDIO
> > > > mode.
> > > 
> > > How is this different than pinctrl-0?
> > 
> > pinctrl-0 contains default settings for all IO pins(CLK/CMD/DAT).
> > pinctrl-1 contains settings for all IO pins(CLK/CMD/DAT) in UHS
> > mode.
> > pinctrl-3 is lightweight pinctrl-1, only keep SDIO DAT1 pin
> > function
> > switch part.
> > 
> 
> Is there any particular reason why we cannot simply select pinctrl-1
> again
> instead of pinctrl-3, apart from the virtually not existent overhead
> of one more mmio write?

No, there is no particular reason. 
I just want to do the pin function switch quick and clean. 

The intention of pinctrl-1 is to set the most initial state of IO pins
in UHS mode. If I don't need to adjust IO settings any longer, it is
okay to select pinctrl-1 state instead of pinctrl-3. 
But think about this scenarios: after initial SDIO IO pins to UHS mode,
I want to adjust some IO related properties, such as driving strength.
And I want to keep these settings because with new driving strength,
the signal is better. I'd rather to choose pinctrl-3 but not pinctrl-1, 
because I do not want the change be restored after next runtime resume.

Regards,
Axe


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
