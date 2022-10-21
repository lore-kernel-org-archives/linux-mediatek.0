Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE12EC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 22:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EYb9KgjwHNT/lpVa9stwrBTB2Yu4tJZJbPA9sZyiZzs=; b=AG2Ml/tpJD+E+aFx1CIkxmwtPg
	9FO7pepSiuWdMKEIOU9YRNKXuKjyQBwkrsWERhv/yLSsUc+nC6iiT8z+UJN/zl6ffXz9W9qaH5IaO
	grMeMgEE7BfApEiF32lc4Y9CkmU5GbNvu154afHDVb/CoPDtSF2wqNh+Img02c5kdDfKcBeewKi6A
	qaPfq4Vc3ZUMTvFdBB3uIS6Hxeyf1D88t4OuMfotEULHyDO4GjVix8Pm4/BrDO4vKsiGcM4xWhNk9
	m4Y4QYW7PsEGf5KFM7dM+vnOldYOwxBTa733OU7O51s4iEG5bvQTU3mkxzXtZVQ7BTHs2nhVQ0vuV
	B2isZxWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om0yl-00ALLj-BV; Fri, 21 Oct 2022 22:59:03 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om0yj-00ALJF-Dv; Fri, 21 Oct 2022 22:59:02 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1om0yX-0002ry-Ay; Sat, 22 Oct 2022 00:58:49 +0200
Date: Fri, 21 Oct 2022 23:58:41 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh@kernel.org>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: pwm: mediatek: Add compatible string
 for MT7986
Message-ID: <Y1MkIdFXrBrrv958@makrotopia.org>
References: <Y1K53n7LnjoMoIfj@makrotopia.org>
 <20221021222338.GA565200-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021222338.GA565200-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_155901_487458_A6E2289A 
X-CRM114-Status: GOOD (  17.81  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Oct 21, 2022 at 05:23:38PM -0500, Rob Herring wrote:
> On Fri, Oct 21, 2022 at 04:25:18PM +0100, Daniel Golle wrote:
> > Add new compatible string for MT7986 PWM.
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >  Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> > index 554c96b6d0c3e0..6f4e60c9e18b81 100644
> > --- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> > +++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> > @@ -8,6 +8,7 @@ Required properties:
> >     - "mediatek,mt7623-pwm": found on mt7623 SoC.
> >     - "mediatek,mt7628-pwm": found on mt7628 SoC.
> >     - "mediatek,mt7629-pwm": found on mt7629 SoC.
> > +   - "mediatek,mt7986-pwm": found on mt7986 SoC.
> 
> This version of the PWM h/w is not compatible with any of the existing 
> chips? If it is, it should have a fallback compatible.

No, it is unique because it comes with just 2 PWM channels.
Otherwise the driver behaves just like for MT8183 (4 channels) or
MT8365 (3 channels) which also got distinct compatible strings.

> 
> >     - "mediatek,mt8183-pwm": found on mt8183 SoC.
> >     - "mediatek,mt8195-pwm", "mediatek,mt8183-pwm": found on mt8195 SoC.
> >     - "mediatek,mt8365-pwm": found on mt8365 SoC.
> > -- 
> > 2.38.1
> > 
> > 
> 

