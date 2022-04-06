Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22017C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 09:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ko6gdZ2PvXAf6JSd6qle82enuHqc8lXLI/T7p4Su8S8=; b=kh7RCI7Nh6+Wp4
	aJBwxZ46NX2aaGJku4Rfh4/Y9QnTQOPD8oaYFwI6vuRCbOmKzcydWGcbOcESi2sQf55Sp5jW2JuBX
	oAMe0uZ6BrX1st2S/K7bkK9sRSadyp/91jmiPfg7Xhk0wSbweQ3Bzh4yZUncKimsrlPeM7duYT9dt
	nFZu7GgpsAlJZc7dHErv1knUagcjzlxljWNidNxkbuzsO7bwsffpkyrQXIh700LKkUr/PDnKyfz19
	JJBeMpedUMp/VqjIJgITik6DowqEt0JfnWqjmNYT1X+lVUPQJ4DzhG4W8hIPqdqHrD+J4Bx/gU/Pd
	gp0bCikZRXoyC1ZHowIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc2Az-0053Zq-3L; Wed, 06 Apr 2022 09:42:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc2Ag-0053EY-7g; Wed, 06 Apr 2022 09:41:51 +0000
X-UUID: d702918262da4fdf94fcff882378b437-20220406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=dEPv5C8hUdxhy0T12aC7g6ORjHCtYRxr/4jXmnd+BIQ=; 
 b=FHTmKkFtWEVHq4bCcE88dP+c63WPasM7q4tyvj06HNrrV8m47hMUTswex1Rot6PcKo/I3gs9e/5h/0+woVOU/zRUCoPaDERw/aJezEGMwdzQBlnlAQQwxNzp/+OP1eSY3DANdeD+JSoj1EdXlkmzejRNW2B3V9fvO8aMUpZvkZM=;
X-UUID: d702918262da4fdf94fcff882378b437-20220406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 637224448; Wed, 06 Apr 2022 02:41:44 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 02:38:40 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 6 Apr 2022 17:38:38 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Apr 2022 17:38:37 +0800
Message-ID: <d7c0b9573e32d68c25444e48e6df1bba0eb64262.camel@mediatek.com>
Subject: Re: [PATCH v9 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
From: Axe Yang <axe.yang@mediatek.com>
To: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
CC: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, "Yoshihiro
 Shimoda" <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala
 <satyat@google.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach
 <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>, Andrew Jeffery
 <andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim
 <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>, Tian Tao
 <tiantao6@hisilicon.com>, <angelogioacchino.delregno@collabora.com>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Date: Wed, 6 Apr 2022 17:38:37 +0800
In-Reply-To: <Ykc53EmCaA7TadRK@robh.at.kernel.org>
References: <20220329032913.8750-1-axe.yang@mediatek.com>
 <20220329032913.8750-2-axe.yang@mediatek.com>
 <CAPDyKFqoTN1pF-L6qCHxpdMCmPtHP0aHHaDURN2QJsN3v+wZBw@mail.gmail.com>
 <Ykc53EmCaA7TadRK@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_024150_320757_2FCF05EE 
X-CRM114-Status: GOOD (  25.13  )
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

On Fri, 2022-04-01 at 12:43 -0500, Rob Herring wrote:
> On Fri, Apr 01, 2022 at 11:22:13AM +0200, Ulf Hansson wrote:
> > On Tue, 29 Mar 2022 at 05:29, Axe Yang <axe.yang@mediatek.com>
> > wrote:
> > > 
> > > Extend interrupts and pinctrls for SDIO wakeup interrupt feature.
> > > This feature allow SDIO devices alarm asynchronous interrupt to
> > > host
> > > even when host stop providing clock to SDIO card. An extra wakeup
> > > interrupt and pinctrl states for SDIO DAT1 pin state switching
> > > are
> > > required in this scenario.
> > > 
> > > Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> > > ---
> > >  .../devicetree/bindings/mmc/mtk-sd.yaml         | 17
> > > ++++++++++++++++-
> > >  1 file changed, 16 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > index 297ada03e3de..3872a6ce2867 100644
> > > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > @@ -69,12 +69,22 @@ properties:
> > >        - const: ahb_cg
> > > 
> > >    interrupts:
> > > -    maxItems: 1
> > > +    description:
> > > +      Should at least contain MSDC GIC interrupt. To support
> > > SDIO in-band wakeup, an extended
> > > +      interrupt is required and be configured as wakeup source
> > > irq.
> > 
> > If I understand correctly, the extended interrupt (a GPIO irq) may
> > not
> > necessarily share the same interrupt parent as the primary device
> > interrupt.
> > 
> > Perhaps it's then better to extend this with "interrupts-extended"
> > instead. See Documentation/devicetree/bindings/interrupt-
> > controller/interrupts.txt.
> 
> 'interrupts-extended' is interchangeable with 'interrupts'. For
> schemas, 
> use 'interrupts' and the tools take care of supporting both forms.
> 

hello Ulf, you are right, the wakeup interrupt(parent is &pio) do not
share same parent as primary interrupt(parent is &gic). And as you
said, I am using "interrupts-extended" to declare the wakeup irq, see
commit message in patch 3/3:
         &mmcX {
                 ...
                 interrupts-extended = <...>,
                                       <&pio xxx IRQ_TYPE_LEVEL_LOW>;
                 ...
                 pinctrl-names = "default", "state_uhs", "state_eint";
                 ...
                 pinctrl-2 = <&mmc2_pins_eint>;
                 ...
                 cap-sdio-irq;
                 keep-power-in-suspend;
                 wakeup-source;
                 ...
         };

But the wakup interrupt is for SDIO only, in most instances, MSDC is
been used as eMMC/SD card host, they do not need this interrupt. So as
Rob suggested, I think we'd better keep using 'interrupts'. And I will
update the description for 'interrupts', suggest to use 'interrupts-
extended' to declare SDIO wakeup interrupt.

And 'interrupt-names' is a good idea, I will add this property to
document too. Thank you for the advice.

Regards,
Axe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
