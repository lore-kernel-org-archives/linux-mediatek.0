Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03F3D17121
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 18:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xPsIHIzn837bvG4lTpcnuN3lDgK99PJfLCGIXXbmRU=; b=s46P3OIITJbtDgSU9I5F399Vqo
	/rE5BZ7OD3skDMxcjk3N4N895f0zAWDK37Vhtip213b4BXzwgNDJxh/z4xtebS/M9FhtDdPHWASPQ
	yDF+KRI5gJHOftUJp2ThjLWOcDkhIWFzLkVI0dhgKgh4IEE7oZ1W1fr+6ziTLdHEaOZBK8AcJX60o
	mV4QmqiU8B9FwVZN/6TbLyiEP3nTP9fZ8gYeYMerJWR/MBDfNhGfauFZnF/1gGte6Pr0jyFD6U5yb
	4tWGJbSH3WCZwOf6dtJYDAlRX6AskTlkaQQ4xiVR8GExVOlRxD+rBi1um5bVkuo38rUDC2/tMUMXD
	d4NmhAlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2wkK-00000008Dis-3nSr;
	Mon, 21 Oct 2024 18:03:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2wfq-00000008Cjh-2b5x;
	Mon, 21 Oct 2024 17:58:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5EDEDA43774;
	Mon, 21 Oct 2024 17:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB30EC4CEC7;
	Mon, 21 Oct 2024 17:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729533512;
	bh=UcEBlP+K6AUWwNnV6WDbqbJ07FizzoR5surBemBIhmg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=PjizZSy0tkgmPS1cTRFQR1hXg9/PXD8NY2DSjXaC0e/yg0INAN9eRw4l0IvuPL+VJ
	 YAJW1vyAEJLAcNWCGtTA7ShNOBlDcgTEoYweOC/Sc5NA1dEON21F2f7YIB8dvk6JzV
	 lyy97KW5fBmfJ+a/lOOQMyUHANbiOkNQEklHZtPXHQlDBRP8PYw2jEK7HFwDQRIldi
	 9TFEUX/njgnb0XuI72M+xJpr8n43BcZOjoSakWKBYx5A+7IQFYBhF+BN5XDEvl25w1
	 FMbLvo6OWz1OHTXEGUn74tc6MSRB9K1xsIFwzF820UDRpIi4Us6cginksJPl+VsLJd
	 n8ew2ScmTG7rQ==
Date: Mon, 21 Oct 2024 12:58:30 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 fanyi zhang <fanyi.zhang@mediatek.com>, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Jianguo Zhang <jianguo.zhang@mediatek.com>, 
 Hsuan-Yu Lin <shane.lin@canonical.com>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, Pablo Sun <pablo.sun@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241018-genio700-eth-v2-0-f3c73b85507b@collabora.com>
References: <20241018-genio700-eth-v2-0-f3c73b85507b@collabora.com>
Message-Id: <172953337183.748181.12748276548047622670.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] Enable Ethernet on the Genio 700 EVK board
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_105834_812652_E1A651D0 
X-CRM114-Status: GOOD (  15.11  )
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


On Fri, 18 Oct 2024 11:19:01 -0400, Nícolas F. R. A. Prado wrote:
> The patches in this series add the ethernet node on mt8188 and enable it
> on the Genio 700 EVK board.
> 
> The changes were picked up from the downstream branch at
> https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-mtk/+git/jammy,
> cleaned up and split into two commits.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> Changes in v2:
> - Moved mdio bus to mt8188.dtsi
> - Changed phy-mode: rgmii-rxid -> rgmii-id
> - Removed mediatek,tx-delay-ps
> - style: Reordered vendor properties alphabetically
> - style: Used fewer lines for clock-names
> - Fixed typo in commit message: 1000 Gbps -> 1000 Mbps
> - Link to v1: https://lore.kernel.org/r/20241015-genio700-eth-v1-0-16a1c9738cf4@collabora.com
> 
> ---
> Nícolas F. R. A. Prado (2):
>       arm64: dts: mediatek: mt8188: Add ethernet node
>       arm64: dts: mediatek: mt8390-genio-700-evk: Enable ethernet
> 
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi           | 97 ++++++++++++++++++++++
>  .../boot/dts/mediatek/mt8390-genio-700-evk.dts     | 20 +++++
>  2 files changed, 117 insertions(+)
> ---
> base-commit: 7f773fd61baa9b136faa5c4e6555aa64c758d07c
> change-id: 20241015-genio700-eth-252304da766c
> 
> Best regards,
> --
> Nícolas F. R. A. Prado <nfraprado@collabora.com>
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


New warnings running 'make CHECK_DTBS=y mediatek/mt8390-genio-700-evk.dtb' for 20241018-genio700-eth-v2-0-f3c73b85507b@collabora.com:

arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: jpeg-decoder@1a040000: iommus: [[118, 685], [118, 686], [118, 690], [118, 691], [118, 692], [118, 693]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#






