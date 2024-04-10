Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E19CD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 17:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOn8Y7B0svAU9nH6ugnWGI3EdoXyOnTv5sgTv1vAn8o=; b=h720LxD8Vse94TXu0LA233P5kG
	E88M6MUJ/deRYIxGf9Ul+Tny98+nOMAn9I46nCYwOZ893otrgJ0xqemCqKHTvsVA12i3e6matwySb
	pHMreTjT9MvlPQPVSL7TNxdXUNSV3ZvpYZgETsY5vlqIFIbVyw7BOam4/1Pywto2mSRfc84g3a9tg
	0NYuT0PepzJhnT7dikJ2WsTz5MrfzHhQEeRzmWY3cyP4d/o+afSKvUlc0oo0W6BfJ0sy4zmZ3L914
	THmTh/Z619OQxW+Jm8UEjS9Di70lHv8CgQZ1IeX7bsre6H3Md96P0Km5DIbqbnrCVrhT1EXw12mTO
	lIR7fU3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rucAq-00000008NIk-3OTM;
	Wed, 10 Apr 2024 17:55:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rucAi-00000008NDB-1XWc;
	Wed, 10 Apr 2024 17:55:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 37D6361E0A;
	Wed, 10 Apr 2024 17:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8713FC433C7;
	Wed, 10 Apr 2024 17:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712771742;
	bh=dn3s9v+ugyPIbkJ82h/zTt6Aiku1UOONkbAxvrR7jyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YpUzsLSGnL5sS1FPnbAHM+SupDJSYxEEhgxEXj/LIJrVoazOecimqvkwlMp/t5gpz
	 o91wT8i8WD1ZZbuBSACUvKLBe6clAAnDzFYVDT6fk7nxnaGOgy/lXWLfQH+fi0lJLB
	 z8hmwmaKhAiBHMSC0vAR4C7GuRooP4Z33TKH0BUGNCxbnqltNkzFfk7y3VMzTIMXfe
	 PI/XPibfx+hhhGRQumNTUvoPYuff9ZgSlCnUjG6Kav98xRFY6exPQd4ScbYn4tdJIY
	 LHHOXgAjpI6EUH5zBHSbyoOlKWZzoKUTt5K4Tjb7Go4tL3CrnVYgvvNd1GF3z7kBQg
	 MHLNVbkrGV+oA==
Date: Wed, 10 Apr 2024 12:55:40 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Will Deacon <will@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
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
Subject: Re: [PATCH 3/3] dt-bindings: PCI: host-bridges: switch from
 deprecated pci-bus.yaml
Message-ID: <20240410175540.GA802090-robh@kernel.org>
References: <20240407102000.37213-1-krzysztof.kozlowski@linaro.org>
 <20240407102000.37213-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240407102000.37213-3-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_105544_599168_81EDF319 
X-CRM114-Status: GOOD (  14.88  )
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

On Sun, Apr 07, 2024 at 12:20:00PM +0200, Krzysztof Kozlowski wrote:
> dtschema package with core schemas deprecated pci-bus.yaml schema in
> favor of pci-host-bridge.yaml.  Update all bindings to use the latter
> one.
> 
> The difference between pci-bus.yaml and pci-host-bridge.yaml is only in
> lack of "reg" property defined by the latter, which should not have any
> effect here, because all these bindings define the "reg".
> 
> The change is therefore quite trivial, except mediatek,mt7621-pcie.yaml
> binding which have children nodes being also host bridges, apparently.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml   | 2 +-
>  Documentation/devicetree/bindings/pci/apple,pcie.yaml         | 2 +-
>  Documentation/devicetree/bindings/pci/brcm,iproc-pcie.yaml    | 2 +-
>  Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml      | 2 +-
>  Documentation/devicetree/bindings/pci/cdns-pcie-host.yaml     | 2 +-
>  Documentation/devicetree/bindings/pci/faraday,ftpci100.yaml   | 2 +-
>  Documentation/devicetree/bindings/pci/host-generic-pci.yaml   | 2 +-
>  Documentation/devicetree/bindings/pci/intel,ixp4xx-pci.yaml   | 2 +-
>  Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml | 2 +-
>  Documentation/devicetree/bindings/pci/loongson.yaml           | 2 +-
>  .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml         | 4 ++--
>  Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 2 +-
>  .../devicetree/bindings/pci/microchip,pcie-host.yaml          | 2 +-
>  Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml   | 2 +-
>  Documentation/devicetree/bindings/pci/qcom,pcie.yaml          | 2 +-
>  Documentation/devicetree/bindings/pci/rcar-pci-host.yaml      | 2 +-
>  .../devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml        | 2 +-
>  .../devicetree/bindings/pci/rockchip,rk3399-pcie.yaml         | 2 +-
>  Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml       | 2 +-
>  Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml   | 2 +-
>  Documentation/devicetree/bindings/pci/versatile.yaml          | 2 +-
>  Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml  | 2 +-
>  Documentation/devicetree/bindings/pci/xlnx,axi-pcie-host.yaml | 2 +-
>  Documentation/devicetree/bindings/pci/xlnx,nwl-pcie.yaml      | 2 +-
>  Documentation/devicetree/bindings/pci/xlnx,xdma-host.yaml     | 2 +-
>  25 files changed, 26 insertions(+), 26 deletions(-)

This implicitly bumps the minimum version for dtschema. That's fine, but 
it should be explicit since we set it explicitly.

Rob

