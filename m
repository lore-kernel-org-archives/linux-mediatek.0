Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98C3C83F17
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jul 2025 11:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lh4PWq6FeRkQ8Uxc6KUAXubIeafXXv+5afrGfRF66FU=; b=TA0qNjx207f9jsWeyqqTeuco9V
	cybQVSeswU0YlJlMq6Rjw3QXjcDOoRKwptJOlUrP2xpo0widIM2+UmL+ECmaMvX9Jvo9vnN3gsr+v
	OupuJAN60qLSLTGtLMqn9/qgFJTIl4yl7nfQXAHMbnyZETlifrzNRVOiSN1TYZCueboLJ/f1TDqv8
	fiQ9MKxsuMSSzGftRA+LDrfbcNvzmWEVcuqzX0d9cUAFTXLUAW1hfIJE3VqAUpWFI0rkDtwFDRAUc
	yNXvJW2sEQMlvoStD7MYow6nKKL89OaHnD2/NhJjdCfYD/6oEXMihw4Fr6gsfSUAN5rZ+kmTzJynX
	1ohUx/0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpJ7-0000000BcbA-2uv3;
	Thu, 10 Jul 2025 11:19:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnws-0000000BOOC-0zOX;
	Thu, 10 Jul 2025 09:52:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 399F86146A;
	Thu, 10 Jul 2025 09:52:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5D7C4CEE3;
	Thu, 10 Jul 2025 09:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752141132;
	bh=pZGaq0Wu1dT/dxRh+MB2XlLidtH1F8cMudtE386pfjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lIDgM0RRhADkfkCfjrESf7N9LWIsVsPWJutieH2NNF9Z1EW8Q4D3kAeZGMJyu55+5
	 zwPw6eAQHXbJOpcZH7O02IYZ4joxKi0sMWSFyLygR9IdsbUtY6X25oPvtP3XiCpC04
	 4gCXlq4UsCF2j6U19+893abdzEUw9I76OLTy4OZrr4Nr3Lz5N+0gE4j9BZD0saSUQQ
	 Dxg9ZTSMk0b8q+Gn6oKnSrrfxG0dR9SK4NDvHJzW1Kly6RXeERNvBAsyGaWPCicZvo
	 DbnPbuKRn3HVOA3d10mSYUWWlcCzmzXQ8BdYk8R+cnGvpymuS7BoES+e0YXYJFJWxh
	 R9idoDyVAjeXA==
Date: Thu, 10 Jul 2025 11:52:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v9 03/13] dt-bindings: net: mediatek,net: allow irq names
Message-ID: <20250710-dashing-wine-hippo-d879c9@krzk-bin>
References: <20250709111147.11843-1-linux@fw-web.de>
 <20250709111147.11843-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250709111147.11843-4-linux@fw-web.de>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Rob Herring <robh@kernel.org>, linux-pm@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Johnson Wang <johnson.wang@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Kyungmin Park <kyungmin.park@samsung.com>, Georgi Djakov <djakov@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jul 09, 2025 at 01:09:39PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> In preparation for MT7988 and RSS/LRO allow the interrupt-names
> property.
> In this way driver can request the interrupts by name which is much
> more readable in the driver code and SoC's dtsi than relying on a
> specific order.
> 
> Frame-engine-IRQs (fe0..3):
> MT7621, MT7628: 1 FE-IRQ
> MT7622, MT7623: 3 FE-IRQs (only two used by the driver for now)
> MT7981, MT7986: 4 FE-IRQs (only two used by the driver for now)
> 
> RSS/LRO IRQs (pdma0..3) additional only on Filogic (MT798x) with
> count of 4. So all IRQ-names (8) for Filogic.
> 
> Set boundaries for all compatibles same as irq count.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


