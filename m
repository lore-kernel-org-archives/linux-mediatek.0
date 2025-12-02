Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421F3D116F6
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Dec 2025 12:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGT1VqkOtv/qjSfdmUHPyBypwKabEZXG1jp1YlC74zU=; b=2e/FQaMe7egqoH0/vnpn0Ll1pG
	f7UI+1Fq7PCrvJ3g39DToxDkKHjnLTFIkqkHA9JtpxjjFVEj2Xd7k0wljQO/cl28zu0dehpHGnwfo
	rAmkQG1sT2dU98dnXBMAgMbM9dV+SKt4CFQaPGoq+yM2Sj2z/hL4W877eKcSjwmswMWX0IilqYyKY
	gOW9ZNfm5NOjnahAq8jrMoHYJNrNGcGETvfYV8wmVPJ2zmUBVdayTGv3/K1BpZOqdWq8xy+B6PaE9
	VtshkHLEO3PTe8fDJNAEQN/jZCqQbAZIUwPQGjVmsAY28LF7KeKokTPeoO/xjgoD3kP/sFmnBAqPq
	ABAQRQZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQPNB-00000005N3y-3lEE;
	Tue, 02 Dec 2025 12:20:49 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQPN9-00000005N2X-2GOB;
	Tue, 02 Dec 2025 12:20:48 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1vQPMx-000000003vh-2FsH;
	Tue, 02 Dec 2025 12:20:35 +0000
Date: Tue, 2 Dec 2025 12:20:31 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Frank Wunderlich <frankwu@gmx.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Chen Minqiang <ptpt52@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: dsa: mt7530: Use GPIO polarity to generate
 correct reset sequence
Message-ID: <aS7Zj3AFsSp2CTNv@makrotopia.org>
References: <20251129234603.2544-1-ptpt52@gmail.com>
 <20251129234603.2544-2-ptpt52@gmail.com>
 <0675b35f-217d-4261-9e3f-2eb24753d43c@lunn.ch>
 <20251130080731.ty2dlxaypxvodxiw@skbuf>
 <3fbc4e67-b931-421c-9d83-2214aaa2f6ed@lunn.ch>
 <0d85e1e6-ea75-4f20-aef1-90d446b4bfa1@kernel.org>
 <00f308a1-a4b1-4f20-8d8e-459ddf4c39b1@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00f308a1-a4b1-4f20-8d8e-459ddf4c39b1@gmx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_042047_583278_1B3E5A3E 
X-CRM114-Status: GOOD (  31.39  )
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

On Tue, Dec 02, 2025 at 12:52:44PM +0100, Frank Wunderlich wrote:
> Hi,
> 
> Am 01.12.25 um 08:48 schrieb Krzysztof Kozlowski:
> > On 30/11/2025 21:17, Andrew Lunn wrote:
> > > On Sun, Nov 30, 2025 at 10:07:31AM +0200, Vladimir Oltean wrote:
> > > > On Sun, Nov 30, 2025 at 02:11:05AM +0100, Andrew Lunn wrote:
> > > > > > -		gpiod_set_value_cansleep(priv->reset, 0);
> > > > > > +		int is_active_low = !!gpiod_is_active_low(priv->reset);
> > > > > > +		gpiod_set_value_cansleep(priv->reset, is_active_low);
> > > > > I think you did not correctly understand what Russell said. You pass
> > > > > the logical value to gpiod_set_value(). If the GPIO has been marked as
> > > > > active LOW, the GPIO core will invert the logical values to the raw
> > > > > value. You should not be using gpiod_is_active_low().
> > > > > 
> > > > > But as i said to the previous patch, i would just leave everything as
> > > > > it is, except document the issue.
> > > > > 
> > > > > 	Andrew
> > > > > 
> > > > It was my suggestion to do it like this (but I don't understand why I'm
> > > > again not in CC).
> > > > 
> > > > We _know_ that the reset pin of the switch should be active low. So by
> > > > using gpiod_is_active_low(), we can determine whether the device tree is
> > > > wrong or not, and we can work with a wrong device tree too (just invert
> > > > the logical values).
> > > Assuming there is not a NOT gate placed between the GPIO and the reset
> > > pin, because the board designer decided to do that for some reason?
> jumping in because i prepare mt7987 / BPI-R4Lite dts for upstreaming when
> driver-changes are in.
> With current driver i need to define the reset-gpio for mt7531 again wrong
> to get it
> working. So to have future dts correct, imho this (or similar) change to
> driver is needed.
> 
> Of course we cannot simply say that current value is wrong and just invert
> it because of
> possible "external" inversion of reset signal between SoC and switch.
> I have to look on schematics for the boards i have (BPI-R64, BPI-R3,
> BPI-R2Pro) if there is such circuit.

I'm also not aware of any board which doesn't directly connect the
reset of the MT7530 to a GPIO pin of the SoC. For MediaTek's designs
there is often even a specific pin desginated for this purpose and
most vendors do follow this. If they deviate at all, then it's just
that a different pin is used for the switch reset, but I've never
seen any logic between the SoC's GPIO pin and the switch reset.

> Maybe the mt7988 (mt7530-mmio) based boards also affected?

There is no GPIO reset for switches which are integrated in the SoC,
so this only matters for external MT7530 and MT7531 ICs for which an
actual GPIO line connected to the SoC is used to reset the switch.

