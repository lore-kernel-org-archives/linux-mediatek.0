Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9EEECAAA1
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Oct 2022 15:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKHgjslC8BpjNm94J0N795D7jnNyFIy6w5eny7ti0dU=; b=xZ0AZqAbd4aCs8Sr6GfQAIC1Dz
	W8lct+xhYC9eA+iREH0zUJWA45/3xQRfYeFH6pArPXioR4Rsv3Fb2IT+x8sAQS4BLtEB7ZJ1wVOyB
	UJLS+T3Cy+LfGujQrR2JmB/TzLQHtFI2Emvh2w760CW58iu5RyL22BO7YwKrcw79KyfiQ4m6Fg8M5
	d4UvIOQyDRsOnNF7BBO5YxBtGT1EHNIN9sgelygi8DGGPYKUWQdBd4toyrovjEOCIK9WfKN4+4H/7
	kUZBQRH1nyJX/JNzxBW2gq8dceYa6oqa90KeGMwb821Cb+MoUY1MSr/jUcVam/C3G/JZhOVlsrY31
	ocaTKR5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omcU4-00FVTj-Kx; Sun, 23 Oct 2022 15:01:52 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omcU1-00FVRa-0u; Sun, 23 Oct 2022 15:01:50 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1omcTp-0008Qd-Iw; Sun, 23 Oct 2022 17:01:37 +0200
Date: Sun, 23 Oct 2022 16:01:34 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: pwm: mediatek: Add compatible string
 for MT7986
Message-ID: <Y1VXTlQ1dCSoE8N2@makrotopia.org>
References: <Y1K53n7LnjoMoIfj@makrotopia.org>
 <20221021222338.GA565200-robh@kernel.org>
 <Y1MkIdFXrBrrv958@makrotopia.org>
 <5182e3c4-9e5e-2c36-408b-9029c65c8803@linaro.org>
 <Y1UycU0JvwyAv0x2@makrotopia.org>
 <eab019f7-f801-848e-80a3-5bb526d95d53@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eab019f7-f801-848e-80a3-5bb526d95d53@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_080149_087869_D8C3CE7B 
X-CRM114-Status: GOOD (  36.22  )
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

On Sun, Oct 23, 2022 at 08:39:34AM -0400, Krzysztof Kozlowski wrote:
> On 23/10/2022 08:24, Daniel Golle wrote:
> > Hi Krzysztof,
> > 
> > On Sat, Oct 22, 2022 at 12:35:25PM -0400, Krzysztof Kozlowski wrote:
> >> On 21/10/2022 18:58, Daniel Golle wrote:
> >>> On Fri, Oct 21, 2022 at 05:23:38PM -0500, Rob Herring wrote:
> >>>> On Fri, Oct 21, 2022 at 04:25:18PM +0100, Daniel Golle wrote:
> >>>>> Add new compatible string for MT7986 PWM.
> >>>>>
> >>>>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> >>>>> ---
> >>>>>  Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 1 +
> >>>>>  1 file changed, 1 insertion(+)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> >>>>> index 554c96b6d0c3e0..6f4e60c9e18b81 100644
> >>>>> --- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> >>>>> +++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> >>>>> @@ -8,6 +8,7 @@ Required properties:
> >>>>>     - "mediatek,mt7623-pwm": found on mt7623 SoC.
> >>>>>     - "mediatek,mt7628-pwm": found on mt7628 SoC.
> >>>>>     - "mediatek,mt7629-pwm": found on mt7629 SoC.
> >>>>> +   - "mediatek,mt7986-pwm": found on mt7986 SoC.
> >>>>
> >>>> This version of the PWM h/w is not compatible with any of the existing 
> >>>> chips? If it is, it should have a fallback compatible.
> >>>
> >>> No, it is unique because it comes with just 2 PWM channels.
> >>> Otherwise the driver behaves just like for MT8183 (4 channels) or
> >>> MT8365 (3 channels) which also got distinct compatible strings.
> >>
> >> Then something would be here compatible. E.g. If you bound MT8183 with
> >> mt7986-pwm compatible, would you get working device with two channels?
> > 
> > Yes, but I'd see another 2 channels which do not work, accessing them
> > may even cause problems (I haven't tried that) as it means accessing
> > an undocumented memory range of the SoC which we in general we
> > shouldn't be messing around with.
> 
> Why on MT8183 there would be undocumented memory? Where is undocumented
> memory?

So we were talking about using the MT8183 compatible for MT7986 SoC, as
the PWM units are identical apart from the number of channels they
offer:

MT7986 got 2 PWM channels. The MMIO registers used for those two
channels start at offsets 0x10 (pwm0) and 0x50 (pwm1)

MT8183 got 4 PWM channels. The MMIO registers used for those four
channels start of offsets 0x10 (pwm0), 0x50 (pwm1), 0x90 (pwm2) and
0xd0 (pwm3).

Hence, when using the MT8183 compatible with MT7986, the driver will
access offsets 0x90 and 0xd0 in case the users enables the (bogus)
outputs pwm2 and pwm3. These offsets, however, are not mentioned in the
datasheet, so it has to be considered that writing things to these
undocumented offsets could cause unknown behavior.

I hope it's more clear now what I mean.

> 
> > 
> > Also note that this case is the same as MT8183 vs. MT8365, they got
> > distinct compatible strings and also for those two the only difference
> > is the number of channels.
> 
> So why they are not made compatible?

My guess is that it's for this very reason:
To correctly communicate the capabilities (in this case: number of
channels) to the driver and not have bogus pwmX show up in the OS
which then causes undocumented MMIO register access in case anyone
tries to actually use them.

> 
> > 
> >>
> >> If so, they are compatible.
> > 
> > By that definition you should remove the additional compatible for
> > MT8365 or rather, it should have been rejected for the same argument.
> > 
> > I'm talking about
> > commit fe00faee8060402a3d85aed95775e16838a6dad2
> > commit 394b517585da9fbb2eea2f2103ff47d37321e976
> 
> This is a pattern spreading in several Mediatek bindings and we already
> commented on new patches. I don't know why people working on Mediatek do
> not mark pieces compatible.

Others will have to answer that for you.

To me this looks a bit like a structural shortcoming of the PWM controller
bindings: if there was a way to tell the driver "hey, this is like MT8183,
but it got only two channels" that would solve it nicely.
This could either be done using child-nodes for each PWM channel or by
simply adding a 'nr-pwms' property.



Cheers


Daniel

