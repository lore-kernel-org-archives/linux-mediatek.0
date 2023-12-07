Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8920AC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 17:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b08pO5iV3owD24Z3a4ks7uR3dPZmKbYxKElx68MW96I=; b=V9Wp541qKJgY9MC+sRN6sJyC7E
	cxbna9U+7n93OmBrHaZe8cG9KraIA4+hFc6M8gNDesIXsTfGAYTw43o6QKy/vfMgcK1ostKjp3X+3
	3k4v+ihptu+oIrWB1nZJMUgNv8XuGz8ngohGG6/s3v/zaRkzuoxoO3qTu84HtqsjciKaneNr9N45u
	s1uVQ2JMqpRC53hBEZOcfQOSzF7KjKypXvkGONPBNkY+f0Yqsy/PZPz1pleSxOuyCesmeiNuEMcgg
	Dfpdm7DCoFKf236LdcPY6pAB+f87ErHM+wuNj5cjyVo4wZr/1O2VkH8ZonLFgcq6MfLTuddRil8t1
	5XDRJ6mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBI0l-00DW1r-1b;
	Thu, 07 Dec 2023 17:18:07 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBI0i-00DW0f-0q;
	Thu, 07 Dec 2023 17:18:05 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rBI0L-00045r-2T;
	Thu, 07 Dec 2023 17:17:42 +0000
Date: Thu, 7 Dec 2023 17:17:38 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: mediatek: add clock
 controllers of MT7988
Message-ID: <ZXH-Mq_DlW5Oodwt@makrotopia.org>
References: <23bc89d407e7797e97b703fa939b43bfe79296ce.1701823757.git.daniel@makrotopia.org>
 <def05aac79ddff872d3e56698b736cb445f14116.1701823757.git.daniel@makrotopia.org>
 <3e72bff6-9f4d-4cd4-845e-b065f1233ec6@collabora.com>
 <ZXBs9GOOOlZrMuSW@makrotopia.org>
 <64ee48fc-4f77-48cc-b235-c9fb2b10afc4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64ee48fc-4f77-48cc-b235-c9fb2b10afc4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_091804_296202_C5C44EE8 
X-CRM114-Status: GOOD (  18.95  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-clk@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, Sabrina Dubroca <sd@queasysnail.net>, Chen-Yu Tsai <wenst@chromium.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Garmin.Chang" <Garmin.Chang@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, Sam Shih <sam.shih@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Jianhui Zhao <zhaojh329@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 07, 2023 at 06:03:44PM +0100, Krzysztof Kozlowski wrote:
> On 06/12/2023 13:45, Daniel Golle wrote:
> >>> +properties:
> >>> +  compatible:
> >>> +    items:
> >>> +      - const: mediatek,mt7988-ethwarp
> >>> +      - const: syscon
> >>> +      - const: simple-mfd
> >>
> >> No, this is not a mfd, I say.
> >>
> >> Prove me wrong! :-)
> > 
> > https://github.com/dangowrt/linux/blob/mt7988-for-next/arch/arm64/boot/dts/mediatek/mt7988a.dtsi#L564
> > 
> > The 'simple-mfd' compatible is required to have the Linux
> > kernel probe drivers for sub-nodes -- several drivers will act on
> > the different aspects of the circuit exposed at this memory range.
> > From what I understand, this is the definition of a MFD.
> 
> We know what is MFD, so no need to teach us. We expect you to look at
> this. You do not have subnodes, so MFD is pointless. Showing DTSI means
> nothing except that you did not test your bindings.

Sorry, I simply wasn't aware that this is what I'm being asked for.
Is the device a MFD? - Yes it is.

In this case the child node would be a 'ti,syscon-reset' which doesn't
have YAML bindings. Should I include it as object without $ref or do I
need to convert ti,syscon-reset.txt to yaml first, and then reference
it as child node in the MFD?

