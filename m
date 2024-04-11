Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D54C04FF0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 16:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Z/l1n6A+3IOrNq5BU7KCsvCNQ+Bd+oud1gfsg5gaGQ4=; b=mDoLqYtip+Pi2FlbS48CNuce6S
	oyMH8QmwNuD9CGJV4RSfO/eSzO0wMGZPEC9wlE8und8zueD8jTwcQb4dYtwDGPA/IiAr1FpQcuD1w
	adATxjljPh33eWgynWZkMEAOsyouRrO/GEPa0Xuf524TSfIpJUZUCNM1x6tLIfKPjdOoNSIy6IN1b
	0eW1K3rGyp2ljC9aEwyPbn+lZjic2yA/SoGXZghHkbE1mKWKxemBBxrAA4f2nwrP+tmwVS7gkfwkY
	MbdX/6YxGb7/xsrQ6RPbLFgpuAaaydmz57eRkax5RYVZZQOOU3D/0kU5RyFi8cf21PhOxmK0bgrT0
	lKORYhcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rux19-0000000CyyG-0sYy;
	Thu, 11 Apr 2024 16:11:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rux15-0000000CyxM-0pHc;
	Thu, 11 Apr 2024 16:11:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 896A760341;
	Thu, 11 Apr 2024 16:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 001FEC072AA;
	Thu, 11 Apr 2024 16:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712851870;
	bh=Co3kGhkNsPgacB/pabyCsenR+0gNcn0apDUzg988VHA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=rvm0S2oJrwiPhJs3eMOF4f2WjbhaHXPCHhoQzlhlvGzTckM5NUJlGvZE//UJTbZuk
	 7mUvnId3dLSEO383sQdQGizvtxlqOjpE6LHUGEUzOLcvm2FFMA5/b/WtwmbW9OxU3t
	 vraPDqamiI8esjKLmEPlXpKeb3GokCNr0IyDHPJwJEbgyjnyrMewIrl/lr5uw3SXYu
	 ufts0B5MaTMqZx4inTcApZhjiikn03+zpnbGKAZYEpPL3yc3b4UbwWwc/biOcTK9tx
	 O2EDKKXK1jYU6zNUiteXtEM8WNQ9P2BCMa9UpGqUhrAINiWUMdVs8dvmVCMdMSalCs
	 JbWrghBBIpbBg==
Date: Thu, 11 Apr 2024 11:11:08 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
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
Message-ID: <20240411161108.GA2184354@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240411142107.GA3537062-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_091111_363486_152FFC04 
X-CRM114-Status: GOOD (  29.09  )
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

On Thu, Apr 11, 2024 at 09:21:07AM -0500, Rob Herring wrote:
> On Thu, Apr 11, 2024 at 07:39:17AM -0500, Bjorn Helgaas wrote:
> > On Thu, Apr 11, 2024 at 08:13:18AM +0200, Sergio Paracuellos wrote:
> > > On Thu, Apr 11, 2024 at 8:01 AM Krzysztof Kozlowski
> > > <krzysztof.kozlowski@linaro.org> wrote:
> > > > On 10/04/2024 23:26, Bjorn Helgaas wrote:
> > > > > On Wed, Apr 10, 2024 at 08:15:19PM +0200, Krzysztof Kozlowski wrote:
> > > > >> MT7621 PCI host bridge has children which apparently are also PCI host
> > > > >> bridges, at least that's what the binding suggest.
> > > > >
> > > > > What does it even mean for a PCI host bridge to have a child that is
> > > > > also a PCI host bridge?
> 
> It should say 'root port' instead as the binding description correctly 
> says.

OK, that makes a lot more sense, and we should fix the commit log.

> > > > I think the question should be towards Mediatek folks. I don't know what
> > > > this hardware is exactly, just looks like pci-pci-bridge. The driver
> > > > calls the children host bridges as "ports".
> > > 
> > > You can see the topology here in my first driver submit cover letter
> > > message [0].
> > > 
> > >  [0]: https://lore.kernel.org/all/CAMhs-H-BA+KzEwuDPzcmrDPdgJBFA2XdYTBvT4R4MEOUB=WQ1g@mail.gmail.com/t/
> > 
> > Nothing unusual here, this looks like the standard PCIe topology.
> > 
> > What *might* be unusual is describing the Root Ports in DT.  Since
> > they are standard PCI devices, they shouldn't need DT description
> > unless there's some unusual power/clock/reset control or something
> > that is not discoverable via PCI enumeration.
> 
> It's only unusual because typically there's only 1 RP per host bridge 
> and properties which really apply to the RP get stuck in the host bridge 
> node because we don't have a RP node. An example is perst-gpios. That's 
> not a property of the RP either, but the RP is the upstream side of a 
> slot and we often don't have a node for the device either.

Makes sense.

I'm still confused about one thing, maybe just because I don't really
know how to read these bindings.  The binding now looks like this:

  properties:
    compatible:
      const: mediatek,mt7621-pci

    reg:
      items:
        - description: host-pci bridge registers
        - description: pcie port 0 RC control registers       # A
        - description: pcie port 1 RC control registers       # A
        - description: pcie port 2 RC control registers       # A

  patternProperties:
    '^pcie@[0-2],0$':
      type: object
      $ref: /schemas/pci/pci-pci-bridge.yaml#

      properties:
        reg:                                                  # B
          maxItems: 1

It looks like the "A" items are separate things from the "B" items?

But I think the relevant code is here:

  mt7621_pcie_probe
    mt7621_pcie_parse_dt
      pcie->base = devm_platform_ioremap_resource(pdev, 0)             # 1
      for_each_available_child_of_node(node, child)
        mt7621_pcie_parse_port
          port->base = devm_platform_ioremap_resource(pdev, slot + 1)  # 2

where it looks like both "1" and "2" use the items in the "A" list,
i.e., resources 0, 1, 2, 3, all from the same platform device.  Is
there code that uses the "B" item that this patch adds?

Bjorn

