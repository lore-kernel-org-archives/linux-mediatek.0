Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98713C25B10
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 20:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8gfdjeZ/3CFFqi2ga7DqHoX/OsfwavDSfOQgpKISoo=; b=X7KPPHlo/78Rmodb3dvPEgzBvx
	VA9aNQI6zI+pT4ngzUI8fAes+hK5kiMQF1o98C1ZxJSB2bxldaKGArDEe/PrtEI/lYwJMYciicDdY
	3S4e+ZCKAhKsxPB9FwG6PhzzgLhN6pH2Cj+FdrrL5DfCe89X6hmrsnYolLkIlxFa2tX46YWtatcOQ
	d72WmWqnxZBtVGBbgE3LvnpVJC8jkyvetGh3yDWJGRLWkER6Io9rEFnabv/ZNnBSyWhN1IdL0tLkc
	ZZ218HfsUExhffaBnmzJDw+CIX//LnkOQZb912br8xUaeTd5JEA/wClLzpHb8EDz9cj7wk1cDqpaf
	KBS1SMNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s458T-00000008hOo-0Jvt;
	Mon, 06 May 2024 20:40:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s458P-00000008hN4-1KhK;
	Mon, 06 May 2024 20:40:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E8DE26146A;
	Mon,  6 May 2024 20:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8C5C116B1;
	Mon,  6 May 2024 20:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715028027;
	bh=gp0Hiz0fY4V+2j9w+5I7W4FxOvOzlKPG4eD+czuDYLI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=oOI6ctcL+acwEojD8kAo5S6uwfr6y9MY8/6M1Yy9hP/VbjR3b6w/oo3ezOyID5h3d
	 dTOg4LZRshKJ1WlLvnD3pWknyeH8JRv0vpBzQsbIeGmdHWrT2sB/Vv/P2g2ArIyCKL
	 neVt5rxD+ApxK5lg2MYRbgn7+gGNHB52MsDcSpLJkuwYjfvHAnrR0zMjYgz63fT9hs
	 OHiVDP/Jr/yMjTLGmeAr0MNuNQkjdKXoBoS9oBlW8JHZwA1315kywLzADP80SUIWIp
	 cRHN9qQJZ7cahrpryaNeZPognEcuQN7YHlxuFjkRrTtSWkDzkV/tHHjPFZLxj8QggL
	 KXdVY87dg3Zjw==
Date: Mon, 06 May 2024 15:40:25 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
In-Reply-To: <20240505164549.65644-1-linux@fw-web.de>
References: <20240505164549.65644-1-linux@fw-web.de>
Message-Id: <171502764339.89536.5670988761224031139.robh@kernel.org>
Subject: Re: [RFC v1 0/5] Add Bananapi R3 Mini
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_134029_571118_E9E6D312 
X-CRM114-Status: GOOD (  11.83  )
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


On Sun, 05 May 2024 18:45:44 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add mt7986 based BananaPi R3 Mini SBC and fix some related binding errors.
> 
> Frank Wunderlich (5):
>   dt-bindings: leds: add led trigger netdev
>   dt-bindings: clock: mediatek: add address-cells and size-cells to
>     ethsys
>   dt-bindings: net: mediatek,net: add reset-cells
>   dt-bindings: arm64: dts: mediatek: add BananaPi R3 Mini
>   arm64: dts: mediatek: Add  mt7986 based Bananapi R3 Mini
> 
>  .../devicetree/bindings/arm/mediatek.yaml     |   1 +
>  .../bindings/clock/mediatek,ethsys.yaml       |   6 +
>  .../devicetree/bindings/leds/common.yaml      |   2 +
>  .../devicetree/bindings/net/mediatek,net.yaml |   3 +
>  arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>  .../mediatek/mt7986a-bananapi-bpi-r3-mini.dts | 486 ++++++++++++++++++
>  6 files changed, 499 insertions(+)
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


New warnings running 'make CHECK_DTBS=y mediatek/mt7986a-bananapi-bpi-r3-mini.dtb' for 20240505164549.65644-1-linux@fw-web.de:

arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#






