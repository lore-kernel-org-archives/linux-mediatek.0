Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634E4C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 08:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sbAeG3dnvZjPJuFa5HgWpYz1C0jYd8btn59gj80Of4=; b=C9gSHlLeQc/5HHMOFJ1gcUzGIr
	uU3I7FMmHXJ+aRxeW55vVIY+o7mdTVYeXC1R+ptFWBQ4SMHcNAc723ED4c75m/FNAvybP4SLmX4gT
	GM3eKZ3TGuHAgWe9wRxNYSieGafaQW0jOhMTR1dGByEX13HOXkgcX+sfMUn9epODARnpG16yq11O4
	3lhVASt/ENXGDLkpe9HdLYi3itOK3Gs4a2l2XoY6vTlwqaOMiP9XzjBz8ZjZXaKee4VrElO8C14A7
	P6P2Un3Z2uNhcjqXyZ/bfoCS/mgvI7vy8RT2UOZTDa0sJ/TW1Y/zQS4LybWYPsPEO/l1hzxT9pMlC
	N2LUGjQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHpS-00000007Yuj-1wQm;
	Mon, 15 Apr 2024 08:36:42 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHpF-00000007Yo3-2W2k;
	Mon, 15 Apr 2024 08:36:35 +0000
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rwHoa-0004hl-00; Mon, 15 Apr 2024 10:35:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id ACD72C02CD; Mon, 15 Apr 2024 10:33:03 +0200 (CEST)
Date: Mon, 15 Apr 2024 10:33:03 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 00/14] mips: dts: ralink: mt7621: improve DTS style
Message-ID: <ZhzmPxVHjbbCJDJ7@alpha.franken.de>
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_013629_993492_85A786F2 
X-CRM114-Status: GOOD (  12.71  )
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

On Sat, Mar 16, 2024 at 06:54:28AM +0200, Justin Swartz wrote:
> This set of patches was created with the intention of cleaning up
> arch/mips/boot/dts/ralink/mt7621.dtsi so that it is aligned with
> the Devicetree Sources (DTS) Coding Style [1] [2] guide.
> 
> [1] Documentation/devicetree/bindings/dts-coding-style.rst
> 
> [2] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html 
> 
> Justin Swartz (14):
>   mips: dts: ralink: mt7621: reorder cpu node attributes
>   mips: dts: ralink: mt7621: reorder cpuintc node attributes
>   mips: dts: ralink: mt7621: reorder mmc regulator attributes
>   mips: dts: ralink: mt7621: reorder sysc node attributes
>   mips: dts: ralink: mt7621: reorder gpio node attributes
>   mips: dts: ralink: mt7621: reorder i2c node attributes
>   mips: dts: ralink: mt7621: reorder spi0 node attributes
>   mips: dts: ralink: mt7621: move pinctrl and sort its children
>   mips: dts: ralink: mt7621: reorder mmc node attributes
>   mips: dts: ralink: mt7621: reorder gic node attributes
>   mips: dts: ralink: mt7621: reorder ethernet node attributes and kids
>   mips: dts: ralink: mt7621: reorder pcie node attributes and children
>   mips: dts: ralink: mt7621: reorder pci?_phy attributes
>   mips: dts: ralink: mt7621: reorder the attributes of the root node
> 
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 430 ++++++++++++++------------
>  1 file changed, 239 insertions(+), 191 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

