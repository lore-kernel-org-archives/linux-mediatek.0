Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC02FC25B10
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 May 2024 13:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPiGQ7n1DoxCrBr+higBOPts75jAA3+dE6XF1nTORGU=; b=ZJ5qorW+a/qQAD4IhgtCSBBNq6
	dMlNxeV6342r+pluyFKmCbv/+QeMWXZYYlteeXg/aFzh53eHPSJ2m1in9Awndjwb4yhbbn88Qk4+N
	GdwtUxFLs+Xsu2/aGO+XoHZAuI9qd3qkIFZpDCE14+sN+WjnXdOyl1BCSgC3AVhq4fLAq7SwuGbyW
	5VYD3oVhUMiaf786tmC9CGoSd5l8Q5ZhTaOIjDl/PlooII4Vi3uoi4AASKlm+hiotkssFfcqlS9Kl
	6Yd8xYqrpZMrFb7SONscF2+aN/wWoWRE0esK+jnsf+JFNcq/HEGfOmhfAfj6IV/QJ+z5t/LHNibs+
	HPxyTAIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5QgU-00000005SYY-3HAd;
	Fri, 10 May 2024 13:53:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5QgP-00000005SWp-1Rql;
	Fri, 10 May 2024 13:53:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 94C1C61EFF;
	Fri, 10 May 2024 13:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D53BC113CC;
	Fri, 10 May 2024 13:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715349188;
	bh=6KpXMrLeritzB8bNaBffhCqm+rUB+tqQRQjkCVrSwOg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=A64OWzCEMg4DcJItwWnY/nQEN6c08na6QOnzyyA16EkwyYPWJ0jqdPmypqBP4bPWm
	 aMs0AL9rwpbVHg1YxLozM2876hLrD+tfiPoHgmt33/rS4iubuU2khWvDeLwHFJCu0C
	 iNJIv9QfrfvN6SO6RMmb348ykhR/eLLtTsby5SoNDTiz+c0/AHSdlTBHKygkAsTUdQ
	 FGbRxxawWdHBachzf/P47ZiJ9ealbDgrhjRXW7J6EQIQzlGh+Aa8PTHNVuCak4A4eD
	 6ML1uJJeDIl7bSuY1ckxngyoXYlQWIl6VeL6FvID6dQP+HGn/8bZTOzPZgWA4QnVB0
	 FFIvO/XokF11A==
Date: Fri, 10 May 2024 08:53:06 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
In-Reply-To: <20240510095707.6895-1-linux@fw-web.de>
References: <20240510095707.6895-1-linux@fw-web.de>
Message-Id: <171534910744.4114753.13367969845540831259.robh@kernel.org>
Subject: Re: [PATCH v3 0/2] Add Bananapi R3 Mini
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_065309_898467_2D35FB29 
X-CRM114-Status: GOOD (  18.22  )
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
Cc: Pavel Machek <pavel@ucw.cz>, Michael Turquette <mturquette@baylibre.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org, Tianling Shen <cnsztl@immortalwrt.org>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Woudstra <ericwouds@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Fri, 10 May 2024 11:57:05 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add mt7986 based BananaPi R3 Mini SBC.
> 
> changes in v3:
> - fixed unicde parenthesis in commit description of dts patch
> - dropped "dts:" from title of binding patch
> - added AB to binding and RB to dts patch
> 
> changes in v2:
> - dropped patches for unrealated binding fixes which are already fixed in next.
> - add missing node for nand
> - add some information about the board in description
> 
> change dts based on review from angelo+krzysztof
> 
>  - drop fan status
>  - rename phy14 to phy0 and phy15 to phy1
>  - drop default-trigger from phys and so also the binding-patch
>  - use regulator names based on regexp regulator-[0-9]+v[0-9]+
>  - add comment for pwm
> 
> Frank Wunderlich (2):
>   dt-bindings: arm64: mediatek: add BananaPi R3 Mini
>   arm64: dts: mediatek: Add  mt7986 based Bananapi R3 Mini
> 
>  .../devicetree/bindings/arm/mediatek.yaml     |   1 +
>  arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>  .../mediatek/mt7986a-bananapi-bpi-r3-mini.dts | 493 ++++++++++++++++++
>  3 files changed, 495 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts
> 
> --
> 2.34.1
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


New warnings running 'make CHECK_DTBS=y mediatek/mt7986a-bananapi-bpi-r3-mini.dtb' for 20240510095707.6895-1-linux@fw-web.de:

arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#






