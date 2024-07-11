Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32E2C3DA45
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jul 2024 16:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gqv3Y7p5yvjU6uOgahC8zf9OgcwBTWBkfHyfKngTXqs=; b=UiTYCRj7SMOAnc+6Cgm8eyXrmQ
	BGRLENWhdAZ/tysSZ2QQHQzGTV58C5uq8LJ5oXA4+ka2SeIaju1zNWNLzAFAvsFsmdPpi1O4PO+Ue
	WACGGWMqsKBhwy8yzqcHnE4H/7p3X4mA7fFz4miBJalWqt1vYGqTgVoDLtxF3O5h/go91xYfgqNyU
	NeVT3yW2013Em2q6QPSVHDAGjcB+8rOjBCzwGgcIJpGBm9PkRd96ZLgnZ2dmnTwlC369ot/bsSlEs
	i21fPQCa/UaNSr/AoP9js6RxA+OZQY4NWlVTZrPH7EMUv1v/NHWAn8fOgCCK3GN6ZG+6DqJJW9RU1
	/OkjWyCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRwpC-0000000Eiuy-2Axk;
	Thu, 11 Jul 2024 16:39:18 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRwot-0000000EiqR-0Cj7;
	Thu, 11 Jul 2024 16:39:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E31EFCE1929;
	Thu, 11 Jul 2024 16:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF90EC116B1;
	Thu, 11 Jul 2024 16:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720715936;
	bh=UavMyNYF30mligF0aZsTuX6+8r35QoOCy1CLNriVcCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bvhzre32EPArcVCo0Eotud0PYlBrGvFWmS7Mnyn9DEMnZSI4rRFdZaHaWG/I3EM2Q
	 GHvtDsl8jMNtwbFaw2zRkN9IltKzUMMKJmHRcnr6NylGmUa1sEbEiXQKkpP/Zcmg5K
	 aMwxW4hzbyWxC9pMJ4Fq2GdCgm1NBHQWnawmQeosZAEVjlwGIho2NSRXMjipkSZRDu
	 TDKXVsBkETA832fccWdFXleBCy8hYramdv5EJY+mIF0jin8Qg+IrbNxthc0Df83Ieg
	 cBAspqn3HecDX3XkBfQaUFPtNiusvJdcas3yZxm42DTJ3vkzB6hr7T04Tklx/mRoZO
	 RoQgDqwtrlo6Q==
Date: Thu, 11 Jul 2024 10:38:55 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: Aw: Re: [PATCH v1 0/4] add syscon requirement for mt7988
Message-ID: <20240711163855.GA2369577-robh@kernel.org>
References: <20240709101328.102969-1-linux@fw-web.de>
 <126053ef-3bfb-47c2-aa17-eb1d26d99102@collabora.com>
 <trinity-93a5ed81-b890-4d49-bfec-1bbb1219cb65-1720611282583@3c-app-gmx-bs04>
 <23369ea1-12d2-4386-a8ac-431620b75e2e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23369ea1-12d2-4386-a8ac-431620b75e2e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_093859_470711_4229A3E2 
X-CRM114-Status: GOOD (  29.99  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Frank Wunderlich <linux@fw-web.de>, Guenter Roeck <linux@roeck-us.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jul 10, 2024 at 02:50:42PM +0200, AngeloGioacchino Del Regno wrote:
> Il 10/07/24 13:34, Frank Wunderlich ha scritto:
> > Hi
> > 
> > > Gesendet: Mittwoch, 10. Juli 2024 um 12:45 Uhr
> > > Von: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
> > > Betreff: Re: [PATCH v1 0/4] add syscon requirement for mt7988
> > > 
> > > Il 09/07/24 12:13, Frank Wunderlich ha scritto:
> > > > From: Frank Wunderlich <frank-w@public-files.de>
> > > > 
> > > > Some nodes require the syscon fallback at least in u-boot when using
> > > > OF_UPSTREAM.
> > > > 
> > > > This is because uboot driver uses syscon_node_to_regmap in mtk_eth.c for
> > > > "mediatek,toprgu", "mediatek,xfi_pll" and reset pointing to watchdog-node.
> > > > 
> > > 
> > > I wonder what's the major blocker here to modify the u-boot driver to take
> > > the upstream devicetree as-is, instead of using syscon_node_to_regmap?
> > 
> > in uboot there is no driver for all syscon and to handle parallel 
> > access this is done with the syscon fallback.
> > 
> > The syscon uclass is a small driver which is generic and only 
> > handle the regmap in global context.
> > 
> > In theory it could be possible that regmap is aquired twice when 
> > used from 2+ other drivers...to prevent this without
> > adding the syscon fallback each syscon needs a dedicated driver 
> > like in linux which does only syscon stuff (code
> > duplication at its best :) ).
> > 
> > of course i can use regmap_init_mem in the uboot ethernet driver
> > 
> > https://elixir.bootlin.com/u-boot/latest/source/drivers/core/regmap.c#L242
> > 
> > like it's done once for syscon-uclass.
> > 
> > but i will cause issues when a second device tries to access this 
> > regmap. So it was be much easier (for me) to add this
> > fallback and not writing 3 device-drivers in uboot doing the 
> > exactly same as syscon.
> > 
> > if you have a better idea how to handle it, let me know :)
> > 
> 
> I see. The problem is that, from your description, it looks like u-boot
> uses that as a kind of workaround for concurrent access to MMIO...
> 
> ...looks like a good topic to discuss in the u-boot mailing lists.
> 
> Definitely, the TOPRGU and the XFI PLL are not system controllers, so the actual
> "syscon" definition would be wrong for these, that's it.

While I'd prefer "syscon" never existed in the first place, I don't care 
too much if it gets added here or not. U-boot's reasoning for wanting it 
isn't really much better or worse than Linux's. Though if u-boot has 
multiple drivers using it, seems like an abstraction is missing if Linux 
doesn't need that.

Rob


