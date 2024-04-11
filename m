Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71214CD128A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 12:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=KU+U4BP20Cp4sAguI3Lyjh2Ur98/EvRDEHD4o7Oye0c=; b=MzvZudL+QK14SQYcsuMxeMbGzQ
	S/MFMyJ9uz1hX6J+pNDLOZcChtx41fymTNom4eRpT0U6AMUStOqh8KT7DRH8fRoOM5/TyGGjsciJC
	ePWO3zlrl7gGU1FfbZ+ynfMRtabPE9DNmwfRC+X/6YDZc8I/gQygiua370IoJGv5I9l6CDf8JEZVb
	voZSWxMbfzP8ftoW6DIEodN/L7KR/BcQqZ+G6HHReswIS/G2KNZaTELBhVdL70fK/1NBXKxPIs9hy
	7iFVorglqcfkC1C/KrDvsD7uJy+txPw1ygHibXfoWc0Yp49931opQASk1kJ8hO2ZVh4vQLLIH/R8+
	QslyhnIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rutiA-0000000ByrA-03yi;
	Thu, 11 Apr 2024 12:39:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruti5-0000000Bypv-0F1T;
	Thu, 11 Apr 2024 12:39:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC6DC61E18;
	Thu, 11 Apr 2024 12:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100DCC433C7;
	Thu, 11 Apr 2024 12:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712839159;
	bh=kzcjv8gmNpZtAiYk2xJYEcr+JLyXL9rAALV5gNvHuVM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=WfwX59yMLWiCJvrRPA5bcIh6V0ewqtK6+e8oYkw9Dpoq3tHpVf4o0lLaA6was3uLL
	 poLPAXCuUuzNI1uiV3b2Q62RyMZ3WzJ5+GToGIQMOLDEguO9loiBfEgEtpX4BFgMzf
	 FU6ZSQHaxXNHYs3JTveKjTqmhKYlljX8L9atvgPqGTmmyQDxgNq4gpiYnOONkrp7kQ
	 L4+eQ5V5ns8mjSLTCH5YE4SSeyTIQccryVcGAIDQSDXPXIZeZaCtAKVEzoZ1udf+pg
	 rdkeoBVwA/A+uPcr7jKvO+gXrpMBRtCml7FwSgLPe+562zKqgDJ0NQITP2HpMoNETh
	 jVcjb8HkraS+g==
Date: Thu, 11 Apr 2024 07:39:17 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Will Deacon <will@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Tom Joseph <tjoseph@cadence.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/4] dt-bindings: PCI: mediatek,mt7621: add missing
 child node reg
Message-ID: <20240411123917.GA2180141@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMhs-H82Ymc=isxu6AX4_s1QnNpSSNt74--ED1j7JxpzE=eCRg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_053921_227556_112FF69F 
X-CRM114-Status: GOOD (  22.91  )
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

On Thu, Apr 11, 2024 at 08:13:18AM +0200, Sergio Paracuellos wrote:
> On Thu, Apr 11, 2024 at 8:01 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> > On 10/04/2024 23:26, Bjorn Helgaas wrote:
> > > On Wed, Apr 10, 2024 at 08:15:19PM +0200, Krzysztof Kozlowski wrote:
> > >> MT7621 PCI host bridge has children which apparently are also PCI host
> > >> bridges, at least that's what the binding suggest.
> > >
> > > What does it even mean for a PCI host bridge to have a child that is
> > > also a PCI host bridge?
> > >
> > > Does this mean a driver binds to the "parent" host bridge, enumerates
> > > the PCI devices below it, and finds a "child" host bridge?
> 
> Yes, that is exactly what you can see on enumeration.
> 
> The following is a typical boot trace where all bridges has a device also below:
> 
> mt7621-pci 1e140000.pcie: host bridge /pcie@1e140000 ranges:
> mt7621-pci 1e140000.pcie:   No bus range found for /pcie@1e140000, using [bus 00-ff]
> mt7621-pci 1e140000.pcie:      MEM 0x0060000000..0x006fffffff -> 0x0060000000
> mt7621-pci 1e140000.pcie:       IO 0x001e160000..0x001e16ffff -> 0x0000000000
> mt7621-pci 1e140000.pcie: PCIE0 enabled
> mt7621-pci 1e140000.pcie: PCIE1 enabled
> mt7621-pci 1e140000.pcie: PCIE2 enabled
> mt7621-pci 1e140000.pcie: PCI host bridge to bus 0000:00

1e140000.pcie is a host bridge.  It has some CPU-specific bus on the
upstream side, standard PCI (domain 0000, buses 00-ff) on the
downstream side.

> pci 0000:00:00.0: [0e8d:0801] type 01 class 0x060400
> pci 0000:00:01.0: [0e8d:0801] type 01 class 0x060400
> pci 0000:00:02.0: [0e8d:0801] type 01 class 0x060400

> pci 0000:01:00.0: [1b21:0611] type 00 class 0x010185

> pci 0000:00:00.0: PCI bridge to [bus 01-ff]
> pci 0000:00:00.0:   bridge window [io  0x0000-0x0fff]
> pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff]
> pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff pref]

00:00.0 looks like a PCIe Root Port to bus 01.  This is not a host
bridge; it's just a standard PCI-to-PCI bridge with PCI on both the
upstream and downstream sides.

> pci 0000:02:00.0: [1b21:0611] type 00 class 0x010185

> pci 0000:00:01.0: PCI bridge to [bus 02-ff]
> pci 0000:00:01.0:   bridge window [io  0x0000-0x0fff]
> pci 0000:00:01.0:   bridge window [mem 0x00000000-0x000fffff]
> pci 0000:00:01.0:   bridge window [mem 0x00000000-0x000fffff pref]

00:01.0 is another Root Port to bus 02.

> pci 0000:03:00.0: [1b21:0611] type 00 class 0x010185

> pci 0000:00:02.0: PCI bridge to [bus 03-ff]
> pci 0000:00:02.0:   bridge window [io  0x0000-0x0fff]
> pci 0000:00:02.0:   bridge window [mem 0x00000000-0x000fffff]
> pci 0000:00:02.0:   bridge window [mem 0x00000000-0x000fffff pref]
> pci_bus 0000:03: busn_res: [bus 03-ff] end is updated to 03

And 00:02.0 is a third Root Port to bus 03.

> pci 0000:00:00.0: PCI bridge to [bus 01]
> pci 0000:00:00.0:   bridge window [io  0x0000-0x0fff]
> pci 0000:00:00.0:   bridge window [mem 0x60000000-0x600fffff]
> pci 0000:00:00.0:   bridge window [mem 0x60100000-0x601fffff pref]
> pci 0000:00:01.0: PCI bridge to [bus 02]
> pci 0000:00:01.0:   bridge window [io  0x1000-0x1fff]
> pci 0000:00:01.0:   bridge window [mem 0x60200000-0x602fffff]
> pci 0000:00:01.0:   bridge window [mem 0x60300000-0x603fffff pref]
> pci 0000:00:02.0: PCI bridge to [bus 03]
> pci 0000:00:02.0:   bridge window [io  0x2000-0x2fff]
> pci 0000:00:02.0:   bridge window [mem 0x60400000-0x604fffff]
> 
> > I think the question should be towards Mediatek folks. I don't know what
> > this hardware is exactly, just looks like pci-pci-bridge. The driver
> > calls the children host bridges as "ports".
> 
> You can see the topology here in my first driver submit cover letter
> message [0].
> 
>  [0]: https://lore.kernel.org/all/CAMhs-H-BA+KzEwuDPzcmrDPdgJBFA2XdYTBvT4R4MEOUB=WQ1g@mail.gmail.com/t/

Nothing unusual here, this looks like the standard PCIe topology.

What *might* be unusual is describing the Root Ports in DT.  Since
they are standard PCI devices, they shouldn't need DT description
unless there's some unusual power/clock/reset control or something
that is not discoverable via PCI enumeration.

Bjorn

