Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E587C433FE
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Oct 2022 12:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d22Nu7/GsB5hghfVeEKLSy6b7ZpjNBiiw4k31Rhw8Ok=; b=bBF/69pULSZRtsNHzQd1gr3HSQ
	3tr2mfxq3kCelmGK5SHuR0g6UhcBkSYVpL+WX+k0J6VOa7UwlHihjQ3TWOve/OxRwQAbfHtFDdIzw
	GsGKQ7iHb1ghqkTsnjsjfOOD5aisKhoVKXlnzxg5TYymLnfkgafL4BSqlGPskg+1Cvc6cUd0TD3/X
	Nx2yNWRalFujLu8Vf+a4crNTJYqo2rQbRk9NBNZxyPaFSocMTq17xBgp4vZ3M2E+Ny6S7JLKzsYY6
	olS69aMP7nj+fh8BCCYgBneFkR4EO9o1O7s7yixEcJFvVsI55XUwx0yVEWckBhoMPjo0wv9X+Lay/
	LXRM4ETA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oma1v-00F8BQ-UQ; Sun, 23 Oct 2022 12:24:39 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oma1t-00F89T-Jc; Sun, 23 Oct 2022 12:24:38 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1oma1d-0007v3-0x; Sun, 23 Oct 2022 14:24:21 +0200
Date: Sun, 23 Oct 2022 13:24:17 +0100
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
Message-ID: <Y1UycU0JvwyAv0x2@makrotopia.org>
References: <Y1K53n7LnjoMoIfj@makrotopia.org>
 <20221021222338.GA565200-robh@kernel.org>
 <Y1MkIdFXrBrrv958@makrotopia.org>
 <5182e3c4-9e5e-2c36-408b-9029c65c8803@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5182e3c4-9e5e-2c36-408b-9029c65c8803@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_052437_667519_58C1FE7A 
X-CRM114-Status: GOOD (  22.17  )
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

On Sat, Oct 22, 2022 at 12:35:25PM -0400, Krzysztof Kozlowski wrote:
> On 21/10/2022 18:58, Daniel Golle wrote:
> > On Fri, Oct 21, 2022 at 05:23:38PM -0500, Rob Herring wrote:
> >> On Fri, Oct 21, 2022 at 04:25:18PM +0100, Daniel Golle wrote:
> >>> Add new compatible string for MT7986 PWM.
> >>>
> >>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> >>> ---
> >>>  Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> >>> index 554c96b6d0c3e0..6f4e60c9e18b81 100644
> >>> --- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> >>> +++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> >>> @@ -8,6 +8,7 @@ Required properties:
> >>>     - "mediatek,mt7623-pwm": found on mt7623 SoC.
> >>>     - "mediatek,mt7628-pwm": found on mt7628 SoC.
> >>>     - "mediatek,mt7629-pwm": found on mt7629 SoC.
> >>> +   - "mediatek,mt7986-pwm": found on mt7986 SoC.
> >>
> >> This version of the PWM h/w is not compatible with any of the existing 
> >> chips? If it is, it should have a fallback compatible.
> > 
> > No, it is unique because it comes with just 2 PWM channels.
> > Otherwise the driver behaves just like for MT8183 (4 channels) or
> > MT8365 (3 channels) which also got distinct compatible strings.
> 
> Then something would be here compatible. E.g. If you bound MT8183 with
> mt7986-pwm compatible, would you get working device with two channels?

Yes, but I'd see another 2 channels which do not work, accessing them
may even cause problems (I haven't tried that) as it means accessing
an undocumented memory range of the SoC which we in general we
shouldn't be messing around with.

Also note that this case is the same as MT8183 vs. MT8365, they got
distinct compatible strings and also for those two the only difference
is the number of channels.

> 
> If so, they are compatible.

By that definition you should remove the additional compatible for
MT8365 or rather, it should have been rejected for the same argument.

I'm talking about
commit fe00faee8060402a3d85aed95775e16838a6dad2
commit 394b517585da9fbb2eea2f2103ff47d37321e976


Cheers


Daniel

