Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75918CD342A
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Sep 2024 15:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5GQ1l1T7KpghZKbXuX0bW89AWlkX/VbMQy0rP5A5Xo=; b=P2aPBjDZjeKwxc+O6TO0AYlYWE
	S9iGc/StoVI8HyM5xb/Tim9cpKCfGTfthYndE81Y5t21yhgro4uLaoCDpqGA+IcehKdib8X9l56wY
	c6/s2Cesdk4p6JgimTpT6mUjpJD7Usd7YUUYcM6x3kWx5nv30SykGU5SqfffYP3NmmL4dKKYXmnOb
	QphT3Gr5Ac+WxABdyM51eclWrYLR7YpEE0OeSnOS8H4IEx4NGcDO0rqDzS7JImpNkH0XQKmJEJyPB
	3V4EkbZnkWe+XSSBWMn/GpOZiEljj+j79wISNBZ2sZ1ZpIsuztWychdJsafAypuxfZovz+LlvZNRf
	GTwKu5ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slV7u-00000000jt4-1bm2;
	Tue, 03 Sep 2024 15:07:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slV68-00000000jUR-3IEB;
	Tue, 03 Sep 2024 15:05:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B5595C59E0;
	Tue,  3 Sep 2024 15:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E00C4CEC4;
	Tue,  3 Sep 2024 15:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725375935;
	bh=KL0RQRwssSJZNsqC3FsLLADFxblDIjhPUl1YLEacyms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DRIRAocqMOoyi0rW8os/xYVVD6vNIkBzoAlQ6hS2tSqR1dB70Nr3njU0wCyg3zgwu
	 LacEso3uef9loUUnpQphxgtcE7qUvZSzFxL7C3t7jDK9reXbttX+aQ7Qz35fAggN0o
	 lkn8P30kt6mxExCkPfIH18o2hQZhMeslMjkRnbqR8pQsmFuB9RGfxWBbFN/O/EzPo8
	 6hw5ms6StC7SwGIY5PlV2myw4czbRwVcF3KNidbGniUstdvQJ458e83ikt7ISlZ3uL
	 Onbf/nglN5e3FjWS9Wl8N/NCX9+JzjhDjF3IRsS9zdcTZ+i35Mg31/jZ7zmq7UHmGQ
	 cgsEf0ky6UuxQ==
Date: Tue, 3 Sep 2024 10:05:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org,
	upstream@airoha.com, Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org, benjamin.larsson@genexis.eu,
	ansuelsmth@gmail.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/5] dt-bindings: arm: airoha: Add the chip-scu node
 for EN7581 SoC
Message-ID: <172537593271.1018147.17791430767383351676.robh@kernel.org>
References: <20240831-en7581-pinctrl-v3-0-98eebfb4da66@kernel.org>
 <20240831-en7581-pinctrl-v3-1-98eebfb4da66@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240831-en7581-pinctrl-v3-1-98eebfb4da66@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_080536_964812_B03D0EF1 
X-CRM114-Status: GOOD (  11.28  )
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


On Sat, 31 Aug 2024 16:27:46 +0200, Lorenzo Bianconi wrote:
> This patch adds the chip-scu document bindings for EN7581 SoC.
> The airoha chip-scu block provides a configuration interface for clock,
> io-muxing and other functionalities used by multiple controllers (e.g.
> clock, pinctrl, ecc.) on EN7581 SoC.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../bindings/arm/airoha,en7581-chip-scu.yaml       | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


