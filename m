Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31758C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 10:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0+e3WuYFF8d+q20cNCOAIZgSGfMIqskes4HJ1IoFHE=; b=DPL7bVeOg061GeYw6lYRPzWH1A
	MfXndH/mEnocLu3yFfEilC5k2zx6gyrqxrBrJZzBdxFUBkK+cmD2BjWTrthC/mbn0q31b8OvO4XML
	b6FpuxwkFnJZExwszjZQz778N337X6GtIFCEri/4dS2k6SZjRiXwtJMcFC4cACnIUW488t64rZe9O
	tPwqOBVC1+Ywz3HtkVo39/t6wUdEt3pYqJNgAlp7tJ/hJq4Tb9jyd4Rdnhpoh1AyNOp/NNu+g7rzi
	R8aEnfvJWXGjk4YWeccIxaJ+xqwNsgs0VyeJItt5xcu7sYAs37I7acxBJN2frJlY2lZzz/A/6puXR
	kDJdDBQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJoo-00000007uR4-1ARu;
	Mon, 15 Apr 2024 10:44:10 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJoi-00000007uMx-02ls;
	Mon, 15 Apr 2024 10:44:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713177842;
	bh=2lgF7xR+4qhwMSfR8x9yYIAkTKgSFGBLk6Cbmg0EIkg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=DK+ytEaXTOqx2FzSSHYQPTt/xtHPpXCcERxMHTYDoMVqa7HGcIK/fBphXul7q3W40
	 ttwyhBWMgsK6rP/lkrYI+3c9cH6zoNbv28XeIMHyVQzsE2XEeIXRtl/NGeSO9LYWwp
	 MYwSu8DaBrPF/6pXWQnWO0kfJA1xrAtrvw2aF0uMG7D5YztqoLyYcEN5QhFIUfxo9I
	 6WDOwnXPq1bujONMsZ0HrRslWlHbhinnM7Iy6PStJ8N57yhciGH/oDETzmHgcN6Wms
	 JyZO4sKkUToBygSCeXdT938x4PREqBqdIUxmMRR3WMKTU47M3il9wZz3U8sgJGbqPt
	 z3vsOZAWhbjWw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5B9B23782039;
	Mon, 15 Apr 2024 10:43:59 +0000 (UTC)
Message-ID: <1f88a0b3-273a-4de8-8733-c4fc1ac407ca@collabora.com>
Date: Mon, 15 Apr 2024 12:43:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] dt-bindings: PCI: mediatek,mt7621-pcie: switch
 from deprecated pci-bus.yaml
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Will Deacon <will@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Srikanth Thokala <srikanth.thokala@intel.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Jingoo Han <jingoohan1@gmail.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
 Michal Simek <michal.simek@amd.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>, Tom Joseph <tjoseph@cadence.com>,
 Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20240413151617.35630-1-krzysztof.kozlowski@linaro.org>
 <20240413151617.35630-4-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240413151617.35630-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_034404_271072_D4547D50 
X-CRM114-Status: UNSURE (   7.38  )
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

Il 13/04/24 17:16, Krzysztof Kozlowski ha scritto:
> dtschema package with core schemas deprecated pci-bus.yaml schema in
> favor of individual schemas per host, device and pci-pci.
> 
> Switch Mediatek MT7621 PCIe host bridge binding to this new schema.
> 
> This requires dtschema package newer than v2024.02 to work fully.
> v2024.02 will partially work: with a warning.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



