Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A98CD128A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 17:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8kkao6rseTDK3TqZq/T35dNwK51+zXbMUo+l07T+bM=; b=3ihYZjvdW0yGAlOgeYdV58pWWm
	J8VYOPdn4oZoCX8bcHAbXhX8xFOMshgXK6K9ZwSgPyQG96V1jz26ZHBWn+eyscqiT2fP/moLLr+o1
	S8Gcdu37H0wAN2VPIFQrr6T/L7t7RdcbZNHxM4WCIETVAbR4tre4tjdP6kO9Divmaep4cQg0S3HVK
	g1uiI3o0rgsoL2HcPG71e9CqXVtlf+o1DUvqUAFCj2rIm98SFx2YjTcgTdhcRY0r7khB4bYGBZdK2
	c2Jz3sj13P9Gb30ukEqfPhQFuT7f07okY47PgPp9p9ssIR1Dx63gegB4OUNj6XeuwhMum3+dDgM2t
	TaJ+0CXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruc3f-00000008L89-1G96;
	Wed, 10 Apr 2024 17:48:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruc3b-00000008L4X-15QF;
	Wed, 10 Apr 2024 17:48:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 44D2E61DF9;
	Wed, 10 Apr 2024 17:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB69C433F1;
	Wed, 10 Apr 2024 17:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712771300;
	bh=yraIdNTO6tiXi9E0FDT+Fjq60vBK1HqRdRv+vDkxg+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tFHVDTDPKZMb2q84GZ0sXW0RYG6KlHuL45NUV8ZtdnLdl60bN/oumeIIDWSt/mGbg
	 X16w4k7tV2pXwykGVn+4VE+FruftDxrHN9RWNiTD5vSt17nxaQZwoQ1Iwqmekb1C0U
	 KWhbio/pToZy8jpKK3TkO8MlICuFCMy6C3gpwjoQLqY7CS5lkNkMvI+zLiPu5KtsMb
	 R3l7jO48UHgkJydDoiEDiIpYVSQgaLrVrMvolcmuAUo0nYmLLcqBPHf8RIr19KFMpo
	 l9EdQP9Cj/q6NZB+bTOPxIhmHEZjemysvEJWH57UOd2hvi7krT4l+OVmC4Dt1sO4WV
	 PBb3iYh55we8g==
Date: Wed, 10 Apr 2024 12:48:18 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mark Kettenis <kettenis@openbsd.org>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Scott Branden <sbranden@broadcom.com>,
	linux-mediatek@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Sven Peter <sven@svenpeter.dev>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Ryder Lee <ryder.lee@mediatek.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Tom Joseph <tjoseph@cadence.com>, Will Deacon <will@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	linux-arm-msm@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Michal Simek <michal.simek@amd.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Hector Martin <marcan@marcan.st>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>, asahi@lists.linux.dev
Subject: Re: [PATCH 2/3] dt-bindings: PCI: mediatek,mt7621: add missing child
 node reg
Message-ID: <171277129685.801730.14400180887790805749.robh@kernel.org>
References: <20240407102000.37213-1-krzysztof.kozlowski@linaro.org>
 <20240407102000.37213-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240407102000.37213-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_104823_412078_E9B0E810 
X-CRM114-Status: GOOD (  13.25  )
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


On Sun, 07 Apr 2024 12:19:59 +0200, Krzysztof Kozlowski wrote:
> MT7621 PCI host bridge has children which apparently are also PCI host
> bridges, at least that's what the binding suggest.  The children have
> "reg" property, but do not explicitly define it.  Instead they rely on
> pci-bus.yaml schema, but that one has "reg" without any constraints.
> 
> Define the "reg" for the children, so the binding will be more specific
> and later will allow dropping reference to deprecated pci-bus.yaml
> schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


