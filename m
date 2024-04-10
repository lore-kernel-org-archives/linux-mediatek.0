Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09613CD128A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 17:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwbsA9BBixT6imo9fz1F7MEF2KEIqibs4aK/yKe5VAo=; b=AGWRVACluFr1o0vndsYrFMvQJD
	kn9+FProRoD+JeldCMR2VY5Rp/6byV/ohDzKzPTqEi5JZbijKXPiVDY4PryTjMQWsG0cVJgG74A+T
	FWpU9FoMJCBzGXJtVj0a+uekgyszzb44YSktBOZ5xF0h60RuVF8XxlIqDHJqB4o8jt2vcedu3IBGM
	76ygxqKJPQzACJ5Nptw3KFwUbqwW0DH12dVPQUyvXTvM+HEz10e34th2eKCW2Z4zduilNX72haNPA
	zTlYvu+nfckSRxo2zfqFtly1JJONP48TXuNyHqY5brH1kxOEqwCieB0bPhH+wq67TgaD2J1VsXIdT
	6US1sH6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rubrB-00000008Hom-48lV;
	Wed, 10 Apr 2024 17:35:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rubr7-00000008Hm5-08Td;
	Wed, 10 Apr 2024 17:35:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 24C8F61DE4;
	Wed, 10 Apr 2024 17:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8678C433C7;
	Wed, 10 Apr 2024 17:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712770516;
	bh=VQcH65WHqA/FS4uddL5zUJwX+BidAKnJYJdgb3MS8lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AKuTdcBDWerDwjKr3wEagpSw7BfaYoAXlOYEPY1HHrIQnQupK0az+5WFmhYNEKTUB
	 vQhp2T8kjdsj9V1lGZzOq+Jmv8XJn72N1Ac3f058geLGA7P1GNtjvHAQk9e1gqituj
	 BrDcAFeKc4sugwHyGJ9801R0GJKa5T7qdFRIqR7UIl6a98qbGS0q9kO4CNrkAL6/uf
	 MJuMEvyla07qZ+4Hq+hTO09S8LuKbG3A2Sl5HKiYXTnsS9XI9KCSdTvL+dqjU9BTZr
	 GUdwqTTXsSFkucF0Pa5wvW/43dtwxTA6XuGHYSf09CItKdCMRLF9eSTZ6ar6cXTH5d
	 otR8iI9lpsx4g==
Date: Wed, 10 Apr 2024 12:35:13 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Tom Joseph <tjoseph@cadence.com>,
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-msm@vger.kernel.org,
	Ray Jui <rjui@broadcom.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Michal Simek <michal.simek@amd.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, asahi@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
	linux-rockchip@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Scott Branden <sbranden@broadcom.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Hector Martin <marcan@marcan.st>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: PCI: cdns,cdns-pcie-host: drop
 redundant msi-parent and pci-bus.yaml
Message-ID: <171277051181.788021.12147595660219307279.robh@kernel.org>
References: <20240407102000.37213-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240407102000.37213-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_103529_187635_1457B6FB 
X-CRM114-Status: GOOD (  10.25  )
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


On Sun, 07 Apr 2024 12:19:58 +0200, Krzysztof Kozlowski wrote:
> The binding reference common cdns-pcie-host.yaml, which already defines
> msi-parent and has a reference to pci-bus.yaml schema.  Drop redundant
> pieces here to make it a bit smaller.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml | 3 ---
>  1 file changed, 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


