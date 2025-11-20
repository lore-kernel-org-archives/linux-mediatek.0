Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08EFCF8875
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Nov 2025 15:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Sw13RehSAz3FhPObc2m+bR3n+QajgVie7v6D565jrA=; b=e2cEDdEXQjgJAY2OXtD4VxUiqO
	BWqcxPSAKTJAsMc3kGMYg39O643lK/3D6HO32r89KczDrH1njSFk1DHZuu7+imZxeBeodkF/wm2UP
	bHSFvi6DSqHbHcOcR3DpQn6ljuLxc8ONcL516agpvb8em9eyg0R6QBVvRbZ6u2SPat1BYM8L6P2Bd
	D6ZkQo6/UrBueMtnuUrFGKQOSClnJGXbaEayUaw2L8npYKdTZbJK84YKeSNz9sXbfX7wXj4yeKIKd
	XToMg55yFRJt6G1CzWUoVB/IP8hUw+sJ3pUaf7JPozBRjrTZq0vw4eUfsIiFJeEunoNv8329ULNGQ
	maBu84iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM6iD-00000006vJJ-0YkG;
	Thu, 20 Nov 2025 15:36:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM6i9-00000006vIX-3w0J;
	Thu, 20 Nov 2025 15:36:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9397D41B4A;
	Thu, 20 Nov 2025 15:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC21C4CEF1;
	Thu, 20 Nov 2025 15:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763653001;
	bh=+aGNaTeVJngMwOwA64XdaB9ifWJd/aa78elcucuzIgc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SeFFEDczH7jPbHi+EYQ+sIf0oCHiwIQ5iPH115LBNjCwEIhCXk3C1JCMr/s47Cccw
	 HIjpwg1T0ze1NrOk61RfXwoGWrOtYLXvQuh2KdkpNWxtAMQ3ooIahWo71l0v0MXaBr
	 8J4H01xV557QizPm//LwiO87c8EFsFxXmuNSSgIVDfefXObbxRBiO9LUZVBIw1rakz
	 EQS72Cxfd2gCh0dDwTlTGUCjcQRPNGo73n9Zwpxk971lJALOlsqQN2uJc6HIZqwnlm
	 aL2g+etKHCmgEEgC1S/YYnxZvR6HNV5oCiPaMoE40pGkkaXIiKbpaL/RHXmUS1fEI0
	 lFeoPixvjRkSA==
Date: Thu, 20 Nov 2025 07:36:39 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: patchwork-bot+netdevbpf@kernel.org, Sjoerd Simons
 <sjoerd@collabora.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ryder.lee@mediatek.com,
 jianjun.wang@mediatek.com, bhelgaas@google.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, chunfeng.yun@mediatek.com,
 vkoul@kernel.org, kishon@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 lorenzo@kernel.org, nbd@nbd.name, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
 netdev@vger.kernel.org, daniel@makrotopia.org, bryan@bryanhinton.com,
 conor.dooley@microchip.com
Subject: Re: [PATCH v4 00/11] arm64: dts: mediatek: Add Openwrt One AP
 functionality
Message-ID: <20251120073639.3fd7cc7c@kernel.org>
In-Reply-To: <20251120152829.GH661940@google.com>
References: <20251115-openwrt-one-network-v4-0-48cbda2969ac@collabora.com>
	<176360700676.1051457.11874224265724256534.git-patchwork-notify@kernel.org>
	<20251120152829.GH661940@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_073642_001781_A7411358 
X-CRM114-Status: UNSURE (   8.13  )
X-CRM114-Notice: Please train this message.
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

On Thu, 20 Nov 2025 15:28:29 +0000 Lee Jones wrote:
> > Here is the summary with links:
> >   - [v4,01/11] dt-bindings: mfd: syscon: Add mt7981-topmisc
> >     (no matching commit)  
> 
> I thought this days of Net randomly picking up MFD patches were behind us!

Take another look at the message. We picked out just one of the changes
here.

> >   - [v4,02/11] dt-bindings: PCI: mediatek-gen3: Add MT7981 PCIe compatible
> >     (no matching commit)
> >   - [v4,03/11] dt-bindings: phy: mediatek,tphy: Add support for MT7981
> >     (no matching commit)
> >   - [v4,04/11] arm64: dts: mediatek: mt7981b: Add PCIe and USB support
> >     (no matching commit)
> >   - [v4,05/11] arm64: dts: mediatek: mt7981b-openwrt-one: Enable PCIe and USB
> >     (no matching commit)
> >   - [v4,06/11] dt-bindings: net: mediatek,net: Correct bindings for MT7981
> >     https://git.kernel.org/netdev/net-next/c/bc41fbbf6faa
> >   - [v4,07/11] arm64: dts: mediatek: mt7981b: Add Ethernet and WiFi offload support
> >     (no matching commit)
> >   - [v4,08/11] arm64: dts: mediatek: mt7981b-openwrt-one: Enable Ethernet
> >     (no matching commit)
> >   - [v4,09/11] arm64: dts: mediatek: mt7981b: Disable wifi by default
> >     (no matching commit)
> >   - [v4,10/11] arm64: dts: mediatek: mt7981b: Add wifi memory region
> >     (no matching commit)
> >   - [v4,11/11] arm64: dts: mediatek: mt7981b-openwrt-one: Enable wifi
> >     (no matching commit)

