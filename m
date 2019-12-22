Return-Path: <SRS0=Yz5u=2N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BD1C2D0D2
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2019 03:11:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFCF720709
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2019 03:11:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nQexsjZx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bltNlyAc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFCF720709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:To:From:Subject:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XKXPXPRw04CJSZCWKmrbFj0QLo44pgI0cVJQ4BZvzco=; b=nQexsjZxwyH4MePRwjbIr3T1eq
	bbyd+Uyd9nkPT5QNqUckJNkPjmII3gkhILYy4asPPhdHpzB+9Uav/k9pDz1wnWlih+R9uuvYvbnjR
	A+nN5wo3tzw8+uToGwT9gXM5foes/cSoXpkKNnTnqFbDpLoKickaQWxWB+LxEPNFMcMM7Obwng5X/
	nMBRoh9wv/G6JOM/kuMNqbXz8oAHBg7UH298MoHS9Akw9f7nT8Bafl1K0fI1fS5LWKTzM/AlvP3aG
	UNkmodz2gVggiFGmi6vlBXzjr7zaX2n3Jd0Z60hKxeQqOGu9RKfsZhonVlo6My2eWOhvDrVjtLBJj
	tqiIULLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijE7o-0007Z0-De; Mon, 23 Dec 2019 03:11:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijE7l-0007Y9-Ug
 for linux-mediatek@lists.infradead.org; Mon, 23 Dec 2019 03:11:15 +0000
X-UUID: d5e8874385bc461892e16c253f71dc65-20191222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Date:Content-Type:References:In-Reply-To:CC:To:From:Subject:Message-ID;
 bh=1gjqBsxQJFzTJYcXv+4xkR26006Bc8pqbfyHt8iDVik=; 
 b=bltNlyAcaQK0NROYx4CJosBHds/na0LlyG2rB2vmu2OT42YBTic+cwnHz4E7K6I+LZ1BxQkr6/CTdOiaszTFk05aif+OslcdjvtkCAkyNnHLkrY5XgbCHZcAMjsUGxouo346EPUrzkzbRYiQ/nNU1lR5sfGgsu+bDrvBeX4UFf0=;
X-UUID: d5e8874385bc461892e16c253f71dc65-20191222
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2126639822; Sun, 22 Dec 2019 19:11:04 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 22 Dec 2019 19:11:33 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 23 Dec 2019 11:10:59 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 23 Dec 2019 11:11:12 +0800
Message-ID: <1577022724.7468.20.camel@mtkswgap22>
Subject: Re: [PATCH v2 05/11] pinctrl: mediatek: avoid virtual gpio trying
 to set reg
From: Hanks Chen <hanks.chen@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <CACRpkdZa_sQgvWC3ic0NxrVi9gS1cNTsV-wa-SDpA0e5kutBRw@mail.gmail.com>
References: <1566206502-4347-1-git-send-email-mars.cheng@mediatek.com>
 <1566206502-4347-6-git-send-email-mars.cheng@mediatek.com>
 <CACRpkdZa_sQgvWC3ic0NxrVi9gS1cNTsV-wa-SDpA0e5kutBRw@mail.gmail.com>
Date: Sun, 22 Dec 2019 21:52:04 +0800
MIME-Version: 1.0
X-Mailer: Evolution 3.2.3-0ubuntu6 
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191222_191113_996006_7E40276B 
X-CRM114-Status: GOOD (  17.60  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, CC Hwang <cc.hwang@mediatek.com>,
 wsd_upstream@mediatek.com, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Loda Chou <loda.chou@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marc Zyngier <marc.zyngier@arm.com>, Mars Cheng <mars.cheng@mediatek.com>,
 mtk01761 <wendell.lin@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2019-08-23 at 10:57 +0200, Linus Walleij wrote:
> On Mon, Aug 19, 2019 at 11:22 AM Mars Cheng <mars.cheng@mediatek.com> wrote:
> 
> > for virtual gpios, they should not do reg setting and
> > should behave as expected for eint function.
> >
> > Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> 
> This does not explain what a "virtual GPIO" is in this
> context, so please elaborate. What is this? Why does
> it exist? What is it used for?
> 
> GPIO is "general purpose input/output" and it is a
> pretty rubbery category already as it is, so we need
> to define our terms pretty strictly.
> 
Virtual GPIO only used inside SOC and not being exported to outside SOC
in MTK platform. Some modules use virtual GPIO as eint (e.g. pmic or
usb).
In MTK platform, external interrupt (EINT) and GPIO is 1-1 mapping and
we can set GPIO as eint.
But some modules use specific eint which doesn't have real GPIO pin.
So we use virtual GPIO to map it.

> > +bool mtk_is_virt_gpio(struct mtk_pinctrl *hw, unsigned int gpio_n)
> > +{
> > +       const struct mtk_pin_desc *desc;
> > +       bool virt_gpio = false;
> > +
> > +       if (gpio_n >= hw->soc->npins)
> > +               return virt_gpio;
> > +
> > +       desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio_n];
> > +
> > +       if (desc->funcs &&
> > +           desc->funcs[desc->eint.eint_m].name == 0)
> 
> NULL check is done like this:
> 
> if (desc->funcs && !desc->funcs[desc->eint.eint_m].name)
> 
> > +               virt_gpio = true;
> 

got it, will fix it in v3. Thanks for reviewing.

> So why is this GPIO "virtual" because it does not have
> a name in the funcs table?
> 
yes, it doesn't have real GPIO pin and name, so we set it as virtual GPIO.

> > @@ -278,6 +295,9 @@ static int mtk_xt_set_gpio_as_eint(void *data, unsigned long eint_n)
> >         if (err)
> >                 return err;
> >
> > +       if (mtk_is_virt_gpio(hw, gpio_n))
> > +               return 0;
> 
> So does this mean we always succeed in setting a GPIO as eint
> if it is virtual? Why? Explanatory comment is needed.
> 
yes, we use virtual GPIO to map it.

> > @@ -693,6 +693,9 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
> >         const struct mtk_pin_desc *desc;
> >         int value, err;
> >
> > +       if (mtk_is_virt_gpio(hw, gpio))
> > +               return 1;
> 
> Why are "virtual GPIOs" always inputs?
> 
We set virtual GPIO as eint.
It mean virtual GPIO only used inside SOC and not being exported to
outside SOC.

> Yours,
> Linus Walleij

Sorry for the late reply.

I'm the new bsp contact of mtk phone project.
I will be taking over from Mars.

Thanks for reviewing.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
