Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FAEC2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 14:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=voxI/CIinNT4ZpYNMbOCoFxw5o5d1aV3qeCvPNtVv20=; b=hBqi0kOc59EdU2HOMK9+aV7wCp
	kSxM8o5bYef7KXUEngAqrql4E7n1kWYhEr9vY7Gu3KFr0JZIDsGgVxvWl4IHFEiiXxsHuBXMbhQIc
	4GR4ZrICnq77xY4xA7qgga2Oj/jRS61fV2C4UFf27Hg9lN10doxQrdlkoKsYHaM+oD8yNXEjiMFmh
	wvRXqrIahRlQB4YVT9COONbykYQ8xTtLu2LCZTokPuC0ITtqxQOPAxwasrb7HosfpTjb86C3mBETg
	MAh+8koFSm+DgTv48Ga4Y/Z1z8zGT7PgjmZzFW/DozxQxOxtfpeHYazWqDcyQPnDCUBzTszOUUKjn
	gNOT/3NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqQt-0000000Ai0S-3Tmc;
	Thu, 27 Jun 2024 14:49:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqQg-0000000Ahws-37Ut;
	Thu, 27 Jun 2024 14:48:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF63A61EC9;
	Thu, 27 Jun 2024 14:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595A5C32786;
	Thu, 27 Jun 2024 14:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719499730;
	bh=j9blfb7coQFPpA0hvriFzY5GKbnQ+Fgqvq7qHGHI4dY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Ha3PNmCEXoiwoiuOAE/4Ya2BeSbOw5qfoFxlRDgTTZqIxVAp880kvPVQhD4DTtbVm
	 XqRYUUalQabyVi6RGBMxAUmReaQHkAZxEvAgJSNVURFic7v3uHob1f6cE7gm2vgElE
	 Rkwn7GdBQVaq0OHA5Vs7uwM3D1+ftO/5BzCFz3idv7LiXJoUc5AWj3NjlJXVhNRM9b
	 NKWdK0T3ikIrgYdgg3pQ1q5BAhDdLg5pXCWyYEJ1LmlMt3vXhl1KliUSoYAvviW49l
	 QcoSZsGGJ84yxuNxfzYFItUFhtl8PLiljTO5qOmlbcg0pTC29K/ILhYdSLNsKzaKdS
	 RIb9Li1tjKiKw==
Date: Thu, 27 Jun 2024 08:48:49 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Leith Bade <leith@bade.nz>
In-Reply-To: <20240627075856.2314804-1-leith@bade.nz>
References: <20240627075856.2314804-1-leith@bade.nz>
Message-Id: <171949936716.3312392.7734746271986363667.robh@kernel.org>
Subject: Re: [PATCH 0/4] fix up pin definitions for BPI-R3 board
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_074854_973691_66FD7FD8 
X-CRM114-Status: GOOD (  22.09  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-mediatek@lists.infradead.org, didi.debian@cknow.org, matthias.bgg@gmail.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Thu, 27 Jun 2024 17:58:52 +1000, Leith Bade wrote:
> This is my first patch submission to Linux so I apologise in advance for
> any mistakes.
> 
> These changes were motivated by a pin conflict with the PCIe M.2 connector
> and the push buttons. As a result I decided go work through all 100 GPIO
> pins using the public board schematics. As I need to acquire a M.2 SSD to
> test the PCIe pin change that patch is not included in this series yet.
> 
> Working though the pins I noticed a bug with with the MT7531 chip's reset
> line which was on the wrong GPIO. Since it was conflicting with the boot
> mode switch input GPIO pins I looked into ways to document the use of
> those pins with the switch. I ended up choosing a gpio-hog, but please
> let me know if there is a better alternative.
> 
> I also added some missing pin groups for some of the built-in SoC devices
> to clearly document the use of those GPIO pins.
> 
> I have actually written up a gpio-line-names list give all the pins
> names to match their usage on this board. If there is interest in this
> I can submit this as an additional patch. I see only some MT8xxx devices
> in the mediatek directory have a gpio-line-names so I wasn't sure if I
> should add it.
> 
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y mediatek/mt7986a-bananapi-bpi-r3.dtb' for 20240627075856.2314804-1-leith@bade.nz:

arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: pinctrl@1001f000: 'boot-mode-hog' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7986-pinctrl.yaml#






