Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868BBC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 08:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ClcEg3JSa2LniWf3FqjlbYs8iOwLgmddkSUb5KKZ0AQ=; b=cudh+7Yp4WbzcZ
	XNdVud5IGhOu+C1WdO6PzLoVNEcMJ1M6bIRXLGRI3rhZ57TwdFv6vWx3ouz1bv3zWoZ98xjkhoQd+
	CXXHd6OVN9udjI28i0TyA636ahS9iS7h4kcoQvTiWm0lSYZO58kUkuqzLpwgKn59n0V5H7U05zk8Y
	aLGyLmIIZSV8RKseW+v1+WouHdIdQRGcZLj68raDKVzJaQ+H9IgfrTwh6rBT5mc4PzmtHT//nrB65
	F1CuQvSFYonSlLGB9irIlV1Lywv6KGoMmrrkG6TcUYI5v+NjxvtTgIWN8A/F83e2juxa8Rwe2l2KK
	+iz7bdyW13yplIquWaug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyUfd-005pXA-7K; Tue, 07 Jun 2022 08:34:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyUfP-005pSD-L9; Tue, 07 Jun 2022 08:34:25 +0000
X-UUID: 84faf9a658d44fc8b0a978a19f53fa1c-20220607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=n6scTcFQN2z5UvtgSmWoBV1I2jxbA1n/11Wdy5uPEF4=;
	b=Cv3/0F3/6BOov4zpruV3Fea+EyJnt2Kazoj3jh5hrt7uEK5gk/aO29wrtMJCPjiIsVEe/SXSSB4WC6F6i7ztDNbQ4lYqXDCFfk+xQNqAKIVzeTj+w0aW0zZf0NAxww4sg3kvxGXrXKmDvNEK3kHxX9A3OeBWW/xOQvP73e/yYYA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:05be55d8-dabf-4fd6-97b2-c1eba242cfe4,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:765e757e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 84faf9a658d44fc8b0a978a19f53fa1c-20220607
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <axe.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1930162777; Tue, 07 Jun 2022 01:34:18 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jun 2022 01:24:16 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 7 Jun 2022 16:24:14 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 7 Jun 2022 16:24:13 +0800
Message-ID: <c46ef886f908067d10b1cb9f37b3e41e6157c71d.camel@mediatek.com>
Subject: Re: [RESEND v12 1/3] dt-bindings: mmc: mtk-sd: extend interrupts
 and pinctrls properties
From: Axe Yang <axe.yang@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Chaotian Jing
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
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 7 Jun 2022 16:24:12 +0800
In-Reply-To: <CAPDyKFr25qbAb9DdCpu6Cp9NyK35YAv745Duw_ht7BQc+pQF=A@mail.gmail.com>
References: <20220525015140.384-1-axe.yang@mediatek.com>
	 <20220525015140.384-2-axe.yang@mediatek.com>
	 <CAPDyKFr25qbAb9DdCpu6Cp9NyK35YAv745Duw_ht7BQc+pQF=A@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_013423_743298_604867E7 
X-CRM114-Status: GOOD (  24.46  )
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

On Fri, 2022-06-03 at 09:28 +0200, Ulf Hansson wrote:
> On Wed, 25 May 2022 at 03:51, Axe Yang <axe.yang@mediatek.com> wrote:
> > 
> > Extend interrupts and pinctrls for SDIO wakeup interrupt feature.
> > This feature allow SDIO devices alarm asynchronous interrupt to
> > host
> > even when host stop providing clock to SDIO card. An extra wakeup
> > interrupt and pinctrl states for SDIO DAT1 pin state switching are
> > required in this scenario.
> > 
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> > ---
> >  .../devicetree/bindings/mmc/mtk-sd.yaml       | 50
> > ++++++++++++++++++-
> >  1 file changed, 49 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > index 2a2e9fa8c188..e83bf10281d6 100644
> > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > @@ -72,12 +72,27 @@ properties:
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
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: msdc
> > +      - const: sdio_wakeup
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
> 
> Don't you need something along the lines of the below instead? I mean
> the "state_eint" isn't always needed, right?
> 
> oneOf:
>   - items:
>       - const: default
>       - const: state_uhs
>     - items:
>         - const: default
>         - const: state_uhs
>         - const: state_eint
> 
No, it is not always needed. 
As Rob said, the 'minItems: 2' makes the 3rd item optional.
Combine 'minItems' and 'description' fields, it is easy for others to
understand how to set pinctrl related properities.

Anyway, If you insist 'oneOf' is the better way, I can update that in
next version. What do you think?

And thanks to your comment, I found a mistake in 'description', I
should remove descriptions related to 'state_dat1', and I will update
that in next version.

And do you have any comment on patch 2/3 and 3/3?


Regards,
Axe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
