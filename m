Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6139C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 16:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WeTFciQjIIL/Tw3FwmHbZ7c+CisGZ1iSdrOCJJp764A=; b=Hd3s2ALW0dt8wF
	u3zzarAzNmqo6Uk9KukpRrBZSGF3NtitNfnu+Wq4C1zzwUdQ9farg5DGJkxClnk+MItRGps6O77ni
	/P2BG7JlRuqHnLG9v83GUTTsbvYLUtNbF6K7saY2wvZj0foYjaGpMmttsjBXgsNOspJRbbrusoGPa
	S+V96cAfFTFsHSZ0uTH3+EVZU/vMn1myz2PzrsDZBnIKMHTaVVodieIsMFqyHLwV/TTQsggwg9Seo
	giF7lK6G5X2YJP87eBAPbbh5IjJzMTpVsRv3u+dC3GlqAUH2iC2IgXFTr8wONZ3swJr+PP8ogz571
	lAU//Vy5k7QMPGF0Zhng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWhaa-00BedA-JX; Tue, 22 Mar 2022 16:42:32 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWhaL-00BeZd-3Q; Tue, 22 Mar 2022 16:42:22 +0000
Received: by mail-oi1-f181.google.com with SMTP id v75so20081673oie.1;
 Tue, 22 Mar 2022 09:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f19PtgxgIFInjc+IlAHkQp6KzpsdEzJgw42yMBWHdQg=;
 b=pqtHhc4hDwPiGRbQ0VSiziwYqo0xMtXDS7BkibaCLaPWc6P7xiQnxMZraiUo5tpViU
 uwxE+sVSEDKJJtfc/MtL+1VGGZaGTxJevvl0Z3HGhNxshD5RRcB9GzRUPX0mFm+Ki5FF
 xn5Sf0vn4jK1t27fjriEmgDxKzwbDY+WtQOHJ//BbwTGI7appK3PK19mQuvx/BGzjnRa
 jWzKBpAgkjDgS8NxX7vVjaa1PHB8YpDrvg7xZO+EDvkJJtb89YWqwqjoCZHBR00eVlDB
 lOByLUmJTBEHByhUpWubgiPZcDABTMfPzRiDg1qAnlMQlGR66dqb/ZM98sKs/of1zaej
 yMnQ==
X-Gm-Message-State: AOAM5329bLacV3+9nEg61KpHOhq6R75fufypL+QSfr4lW2KuY86UstRr
 RLdAY0q8z2s64LyWFj7n4A==
X-Google-Smtp-Source: ABdhPJy77nVIsmtyMrQZ89IidhxzPS7fqu8uM2zZDvVPEioBV9LTEyx/xmCMVJUZEAwG9u6Urw0D7Q==
X-Received: by 2002:aca:eb58:0:b0:2d9:deea:2014 with SMTP id
 j85-20020acaeb58000000b002d9deea2014mr2513406oih.83.1647967324171; 
 Tue, 22 Mar 2022 09:42:04 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 s125-20020acaa983000000b002ecdbaf98fesm8932484oie.34.2022.03.22.09.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 09:42:03 -0700 (PDT)
Received: (nullmailer pid 2149693 invoked by uid 1000);
 Tue, 22 Mar 2022 16:42:01 -0000
Date: Tue, 22 Mar 2022 11:42:01 -0500
From: Rob Herring <robh@kernel.org>
To: Axe Yang <axe.yang@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Satya Tangirala <satyat@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach <dev@lynxeye.de>,
 Eric Biggers <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>,
 Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>,
 Yue Hu <huyue2@yulong.com>, Tian Tao <tiantao6@hisilicon.com>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v8 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
Message-ID: <Yjn8WVBdwiCrstx5@robh.at.kernel.org>
References: <20220321115133.32121-1-axe.yang@mediatek.com>
 <20220321115133.32121-2-axe.yang@mediatek.com>
 <YjkKURNzg8JPbXcg@robh.at.kernel.org>
 <b03df175f871ee9a6561862f5bd7bceb9cafbde1.camel@mediatek.com>
 <5d9c7655-b05e-aa77-d405-c1ec971daa77@collabora.com>
 <4e7a532814510b03b74455f5a924b50a70699ca1.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4e7a532814510b03b74455f5a924b50a70699ca1.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_094217_163444_331F037C 
X-CRM114-Status: GOOD (  31.95  )
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

On Tue, Mar 22, 2022 at 05:33:55PM +0800, Axe Yang wrote:
> Hello AngeloGioacchino,
> 
> On Tue, 2022-03-22 at 09:42 +0100, AngeloGioacchino Del Regno wrote:
> > Il 22/03/22 02:35, Axe Yang ha scritto:
> > > On Mon, 2022-03-21 at 18:29 -0500, Rob Herring wrote:
> > > > On Mon, Mar 21, 2022 at 07:51:32PM +0800, Axe Yang wrote:
> > > > > Extend interrupts and pinctrls for SDIO wakeup interrupt
> > > > > feature.
> > > > > This feature allow SDIO devices alarm asynchronous interrupt to
> > > > > host
> > > > > even when host stop providing clock to SDIO card. An extra
> > > > > wakeup
> > > > > interrupt and pinctrl states for SDIO DAT1 pin state switching
> > > > > are
> > > > > required in this scenario.
> > > > > 
> > > > > Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> > > > > ---
> > > > >   .../devicetree/bindings/mmc/mtk-sd.yaml       | 23
> > > > > ++++++++++++++++++-
> > > > >   1 file changed, 22 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > > > b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > > > index 297ada03e3de..f57774535a1d 100644
> > > > > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > > > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > > > @@ -69,12 +69,23 @@ properties:
> > > > >         - const: ahb_cg
> > > > >   
> > > > >     interrupts:
> > > > > -    maxItems: 1
> > > > > +    description:
> > > > > +      Should at least contain MSDC GIC interrupt. To support
> > > > > SDIO
> > > > > in-band wakeup, an extended
> > > > > +      interrupt is required and be configured as wakeup source
> > > > > irq.
> > > > > +    minItems: 1
> > > > > +    maxItems: 2
> > > > >   
> > > > >     pinctrl-names:
> > > > > +    description:
> > > > > +      Should at least contain default and state_uhs. To
> > > > > support
> > > > > SDIO in-band wakeup, dat1 pin
> > > > > +      will be switched between GPIO mode and SDIO DAT1 mode,
> > > > > state_eint and state_dat1 are
> > > > > +      mandatory in this scenarios.
> > > > > +    minItems: 2
> > > > >       items:
> > > > >         - const: default
> > > > >         - const: state_uhs
> > > > > +      - const: state_eint
> > > > > +      - const: state_dat1
> > > > >   
> > > > >     pinctrl-0:
> > > > >       description:
> > > > > @@ -86,6 +97,16 @@ properties:
> > > > >         should contain uhs mode pin ctrl.
> > > > >       maxItems: 1
> > > > >   
> > > > > +  pinctrl-2:
> > > > > +    description:
> > > > > +      should switch dat1 pin to GPIO mode.
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  pinctrl-3:
> > > > > +    description:
> > > > > +      should switch SDIO dat1 pin from GPIO mode back to SDIO
> > > > > mode.
> > > > 
> > > > How is this different than pinctrl-0?
> > > 
> > > pinctrl-0 contains default settings for all IO pins(CLK/CMD/DAT).
> > > pinctrl-1 contains settings for all IO pins(CLK/CMD/DAT) in UHS
> > > mode.
> > > pinctrl-3 is lightweight pinctrl-1, only keep SDIO DAT1 pin
> > > function
> > > switch part.
> > > 
> > 
> > Is there any particular reason why we cannot simply select pinctrl-1
> > again
> > instead of pinctrl-3, apart from the virtually not existent overhead
> > of one more mmio write?
> 
> No, there is no particular reason. 
> I just want to do the pin function switch quick and clean. 
> 
> The intention of pinctrl-1 is to set the most initial state of IO pins
> in UHS mode. If I don't need to adjust IO settings any longer, it is
> okay to select pinctrl-1 state instead of pinctrl-3. 
> But think about this scenarios: after initial SDIO IO pins to UHS mode,
> I want to adjust some IO related properties, such as driving strength.
> And I want to keep these settings because with new driving strength,
> the signal is better. I'd rather to choose pinctrl-3 but not pinctrl-1, 
> because I do not want the change be restored after next runtime resume.

The pinctrl-X properties set modes, they aren't supposed to be a state 
machine.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
