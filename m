Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE322C43219
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 20:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCzf+a3tzKAYYDbCPayy8w9w6ZRz3iuyukpNvNHr9jc=; b=OMwT6o7OURpTqqxXxXR0LBUW6Y
	fOjtAoCfxYMxs/OXX0LuEnGu3uHyFrSoW5w1pyxZuaIjP2o+7kmzwF/zdl5TQThofw/Kg9ROuW9PD
	kwMDP2u9foyJMwYGPDH9w71/km0BcWD+Se1iQZ6hwFBCxDMrG1WUbYrqM1WTm0HhnxSwDb7V2h/eX
	UZkyqJnoVAIIfRVq2HBRQwX3dy/e5fUrHYkEd7Xx6xzCqD9Yp7WIGxaA13VpZvwXr72lXkRJI0743
	7TpF3e7o4GSgjLQqOY4bB8bZSvzflRZ75EwNZKFzVQbiu+vkfv5M/tU6hzaSs3IuZMO9LNR7Jb0w5
	nbDLWD9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyIOP-00BMcL-Dc; Thu, 24 Nov 2022 20:00:17 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyIOL-00BMXp-8v; Thu, 24 Nov 2022 20:00:14 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1oyIOB-00027b-Hj; Thu, 24 Nov 2022 21:00:03 +0100
Date: Thu, 24 Nov 2022 20:00:00 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pwm@vger.kernel.or,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Fabien Parent <fparent@baylibre.com>,
	Zhi Mao <zhi.mao@mediatek.com>, Sam Shih <sam.shih@mediatek.com>
Subject: Re: [PATCH RESEND v2] dt-bindings: pwm: mediatek: Add compatible for
 MT7986
Message-ID: <Y3/NQBzU/R6XubBf@makrotopia.org>
References: <Y39PjU1BqBB8tZ98@makrotopia.org>
 <e5e87795-12d7-699e-1539-2e60b8b51957@linaro.org>
 <Y39fe3oHgMTyAHBm@makrotopia.org>
 <add5675c-b7a9-7f6e-e977-ac79c5c4086a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <add5675c-b7a9-7f6e-e977-ac79c5c4086a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_120013_337281_3517B4FD 
X-CRM114-Status: GOOD (  34.33  )
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

Hi Krzysztof,

On Thu, Nov 24, 2022 at 02:33:35PM +0100, Krzysztof Kozlowski wrote:
> On 24/11/2022 13:11, Daniel Golle wrote:
> > On Thu, Nov 24, 2022 at 12:30:44PM +0100, Krzysztof Kozlowski wrote:
> >> On 24/11/2022 12:03, Daniel Golle wrote:
> >>> Add new compatible string for MT7986 PWM and list compatible units for
> >>> existing entries. Also make sure the number of pwm1-X clocks is listed
> >>> for all supported units.
> >>>
> >>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> >>> ---
> >>> Changes since v1: list compatibles, fix pwm1-n clocks for all SoCs
> >>>
> >>> Rebased on linux-next and re-run scripts/get_maintainers.pl on patch to
> >>> makes sure dt maintainers are included. This has been requested by
> >>> Krzysztof Kozlowski.
> >>>
> >>>  .../devicetree/bindings/pwm/pwm-mediatek.txt  | 20 +++++++++++--------
> >>>  1 file changed, 12 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> >>> index 554c96b6d0c3..952a338e06e7 100644
> >>> --- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> >>> +++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> >>> @@ -2,14 +2,15 @@ MediaTek PWM controller
> >>>  
> >>>  Required properties:
> >>>   - compatible: should be "mediatek,<name>-pwm":
> >>> -   - "mediatek,mt2712-pwm": found on mt2712 SoC.
> >>> +   - "mediatek,mt2712-pwm", "mediatek,mt6795-pwm": found on mt2712 SoC.
> >>>     - "mediatek,mt6795-pwm": found on mt6795 SoC.
> >>> -   - "mediatek,mt7622-pwm": found on mt7622 SoC.
> >>> -   - "mediatek,mt7623-pwm": found on mt7623 SoC.
> >>> +   - "mediatek,mt7622-pwm", "mediatek,mt8195-pwm", "mediatek,mt8183-pwm", "mediatek,mt7986-pwm": found on mt7622 SoC.
> >>
> >> This does not look right. What you are saying is mt7622 is compatible
> >> with mt8195, which is compatible with mt8183, which is compatible with
> >> mt7986. It could be true, but I feel you wanted to say something else -
> >> mt7622 is compatible with one SoC which is generic and common to all
> >> other implementations.
> > 
> > MT7622 has 6 PWM channels, it does have CK_26M_SEL register and does
> > not need pwm45_fixup. Hence, when using a driver made for MT8195, only
> > 4 out of 6 channels woukd work. MT8183 PWM is identical to MT8195,
> > hence also compatible. When using driver for MT7986, only 2 channels
> > would work, but otherwise it is also compatible.
> > 
> > So unfortunately, that one generic implementation ("common ancestor")
> > does not exist and development of the PWM unit found in MediaTek SoCs
> > did not necessarily increase features in more recent iterations, but
> > rather just reduce or increase the number of PWM channels available.
> > Ironically, the unit with least features (only 2 channels) is found in
> > the most recent SoC (MT7986).
> 
> None of these explain listing four compatibles.

So do I understand correctly that in this case only the newly
introduced "mediatek,mt7986-pwm" should be listed as more generic
compatible after the more specific "mediatek,mt7622-pwm", everything in
between should be dropped? Or only drop "mediatek,mt8195-pwm" here?

I'm asking because in your message from 23/10/2022 you were quoting
Devicetree specification:
> "The property value consists of a concatenated list of null terminated
> strings, from most specific to most general. They allow a device to
> express its compatibility with a family of similar devices, potentially
> allowing a single device driver to match against several devices."

And we have discussed in great length (as I had misunderstood it) that
this should mean that units with the lowest number of channels are to
be considered the "most general" if otherwise identical.


> 
> > 
> >>
> >>> +   - "mediatek,mt7623-pwm", "mediatek,mt7628-pwm": found on mt7623 SoC.
> >>>     - "mediatek,mt7628-pwm": found on mt7628 SoC.
> >>>     - "mediatek,mt7629-pwm": found on mt7629 SoC.
> >>> -   - "mediatek,mt8183-pwm": found on mt8183 SoC.
> >>> -   - "mediatek,mt8195-pwm", "mediatek,mt8183-pwm": found on mt8195 SoC.
> >>> +   - "mediatek,mt7986-pwm": found on mt7986 SoC.
> >>> +   - "mediatek,mt8183-pwm", "mediatek,mt7986-pwm": found on mt8183 SoC.
> >>> +   - "mediatek,mt8195-pwm", "mediatek,mt8183-pwm", "mediatek,mt7986-pwm": found on mt8195 SoC.
> >>
> >> This as well looks excessive.
> > 
> > I agree. But it's difficult to say which one should be ommitted.

So are you suggesting to drop the "mediatek,mt8183-pwm" string here?

Thank you for your patience!


Daniel

