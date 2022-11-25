Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FED7C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 11:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZbDy364kCNDRg19R5SuiRyyDzKG0aRwclLL4m/4+to=; b=1/irEFepMSPetmUdalRiWKOdFS
	qj45CwhbAjxcxYnyhJFBL49MMsgzHMovo9b5FGleW79CI6zWDgAIZnhbkNMbuU6+K7ft791CwGXtH
	g68bsTWSTJ1kCYBCJ86BXW2kt7o4tnAEawa4SUumgx83KgQpt7XD3YS7LNcVhQYPmOwPpnSl51YCH
	XgJUXjUm/tAd67bRpjs7AIkcQVSmZfmTpwdJD58KW7gHjM5JYnbvGiLeuGF9j3dENWiwoH8+JcF6S
	npDr7ZLu3ZDYaPAtb/SqslV1HBESRSNt3G8pBhVwFnSIpV2xgII5YzpXSKeBKpaSpcBZokdTSyMKl
	zVRYpbDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWzd-00GAfv-KS; Fri, 25 Nov 2022 11:35:41 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWz7-00GAQx-GN; Fri, 25 Nov 2022 11:35:12 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1oyWyx-0004QI-7F; Fri, 25 Nov 2022 12:34:59 +0100
Date: Fri, 25 Nov 2022 11:34:55 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Message-ID: <Y4CoX1sfJd2Q8lHj@makrotopia.org>
References: <Y39PjU1BqBB8tZ98@makrotopia.org>
 <375d45fa-fdfc-37a5-9d32-b0412cad7bc0@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <375d45fa-fdfc-37a5-9d32-b0412cad7bc0@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_033509_580876_CBDBF25D 
X-CRM114-Status: GOOD (  32.74  )
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

On Fri, Nov 25, 2022 at 12:12:17PM +0100, AngeloGioacchino Del Regno wrote:
> Il 24/11/22 12:03, Daniel Golle ha scritto:
> > Add new compatible string for MT7986 PWM and list compatible units for
> > existing entries. Also make sure the number of pwm1-X clocks is listed
> > for all supported units.
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> > Changes since v1: list compatibles, fix pwm1-n clocks for all SoCs
> > 
> > Rebased on linux-next and re-run scripts/get_maintainers.pl on patch to
> > makes sure dt maintainers are included. This has been requested by
> > Krzysztof Kozlowski.
> > 
> >   .../devicetree/bindings/pwm/pwm-mediatek.txt  | 20 +++++++++++--------
> >   1 file changed, 12 insertions(+), 8 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> > index 554c96b6d0c3..952a338e06e7 100644
> > --- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> > +++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> > @@ -2,14 +2,15 @@ MediaTek PWM controller
> >   Required properties:
> >    - compatible: should be "mediatek,<name>-pwm":
> > -   - "mediatek,mt2712-pwm": found on mt2712 SoC.
> > +   - "mediatek,mt2712-pwm", "mediatek,mt6795-pwm": found on mt2712 SoC.
> >      - "mediatek,mt6795-pwm": found on mt6795 SoC.
> > -   - "mediatek,mt7622-pwm": found on mt7622 SoC.
> > -   - "mediatek,mt7623-pwm": found on mt7623 SoC.
> > +   - "mediatek,mt7622-pwm", "mediatek,mt8195-pwm", "mediatek,mt8183-pwm", "mediatek,mt7986-pwm": found on mt7622 SoC.
> > +   - "mediatek,mt7623-pwm", "mediatek,mt7628-pwm": found on mt7623 SoC.
> >      - "mediatek,mt7628-pwm": found on mt7628 SoC.
> >      - "mediatek,mt7629-pwm": found on mt7629 SoC.
> > -   - "mediatek,mt8183-pwm": found on mt8183 SoC.
> > -   - "mediatek,mt8195-pwm", "mediatek,mt8183-pwm": found on mt8195 SoC.
> > +   - "mediatek,mt7986-pwm": found on mt7986 SoC.
> > +   - "mediatek,mt8183-pwm", "mediatek,mt7986-pwm": found on mt8183 SoC.
> > +   - "mediatek,mt8195-pwm", "mediatek,mt8183-pwm", "mediatek,mt7986-pwm": found on mt8195 SoC.
> 
> I'm sorry, but all these compatibles make little sense at best.
> Each of these PWM controllers have different properties as they may *by hardware*
> be featuring more or less channels, they may be a different IP revision and/or
> sub-revision requiring even ever-so-slightly different handling (check pwm45_fixup
> and has_ck_26m_sel).

I did check the two pwm45_fixup and has_ck_26m_sel for each supported
compatible and listed them accordingly.
Ie. the ones listed as compatible in this submission really only differ
by the number of channels offered from the driver's point of view and
share the same boolean values for pwm45_fixup and has_ck_26m_sel.

> 
> If you want to add MT7986, the best thing that you can do is to simply add
> 
> +   - "mediatek,mt7986-pwm": found on mt7986 SoC.
> 
> this line ^
> 
> ...and then please don't touch the others.
> 
> >      - "mediatek,mt8365-pwm": found on mt8365 SoC.
> >      - "mediatek,mt8516-pwm": found on mt8516 SoC.
> >    - reg: physical base address and length of the controller's registers.
> > @@ -20,11 +21,14 @@ Required properties:
> >                   has no clocks
> >      - "top": the top clock generator
> >      - "main": clock used by the PWM core
> > +   - "pwm1"  : the PWM1 clock for mt7629
> > +   - "pwm1-2": the two per PWM clocks for mt7986
> 
> That's not your fault, but the binding is already wrong (yes it must be fixed!) and
> unless my brain is failing somewhere, there's only one clock per pwm (as if there's
> any children, it must be parented to .. well, its parent, in the clock driver), and
> note that the driver is actually parsing "pwmX" clocks, never "pwmX-Y" clocks.
> 
> Relevant snippet:
> 
> 		char name[8];
> 
> 		snprintf(name, sizeof(name), "pwm%d", i + 1);
> 
> 		pc->clk_pwms[i] = devm_clk_get(&pdev->dev, name);
> 
> Just... please don't keep doing the same mistake that is already inside of here...

Maybe better to write "pwm1"..."pwm2" or something like that...
But I just won't bother with it if you are planning to convert this to
YAML schema anyway.

> 
> So, coming to an end: I think that this commit should be a one-liner that documents
> your "mediatek,mt7986-pwm" compatible and that's it.
> 

This is exactly what I did in the first submission of this patch:
https://www.spinics.net/lists/devicetree/msg542568.html

Should I just re-submit this then?


> A schema conversion would be welcome: in that regard, I can make a conversion
> and send it next week, along with that clock-names fix.

Should I wait for you doing that and then re-submit or just re-submit
immediately?


Thank you!


Daniel

