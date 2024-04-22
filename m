Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C0AC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 13:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2eAHXvdkzHKwAeW5OuelFB7jXmmrSRZk+ig2l9VwQE=; b=YYgtWiOIHqM8k0iqJoydVoW/Vy
	MqOErRubfpUM2M93c4kUIDYKLqpExUuxtCT7WMV9VexrXcsV+vMmum1sLKTot1CLigBY0B5Uoc0DD
	HTAtFLYpGZ5y0PXWLW4wST0iS0jP9YTSUbVGVTkCFLeVmod4jF/4ad3rHBy8Y9E7VSSrboS9AGqeS
	zXwJjzUyLDIqeDk9vMy0zhnfOEFYrvfb3e71IXHeMEAoqTANEMF/PPkX0ZMvrDvsq03D/YSxAssDZ
	+6eQbxu8ZnA14wg3LngUIKHeu+Q1+OtwoGLy+EWmHybKtVlLVVlCmZ0H8kCXrQwfwBIY8TpCV5YK9
	dRB8VqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rytt8-0000000DmYl-2whB;
	Mon, 22 Apr 2024 13:39:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rytt3-0000000DmVo-455H;
	Mon, 22 Apr 2024 13:39:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CCFE0CE01B7;
	Mon, 22 Apr 2024 13:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBABC113CC;
	Mon, 22 Apr 2024 13:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713793149;
	bh=aT4PQ5lC5s45eaoHkuUwSZZpTi8/HgCpiBvJiq65H6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iixz3cF+UZtX6hXDhGzB1/f/S2pBWT0Kx4vtFTQirpEOhjL/QuJJa7YPp5tS4wu39
	 f8qunA41uat41G3IvI6voh6PBMZAF49UtYI1X0M5Dy+xzyHF0vRVhXAogd0pPI3rjX
	 qzp5xaxRJgFigyl6IzetX8GCLxZzD2UuiTj9hpSP6mnSetZH4TSqW0i4KkimezbfzT
	 3HG6xQNbITqhszhY1MdSB8AqMAghqh+T8mdwwIrq3WyozrjKcWmReNGQDj8BzpUbyi
	 3nMcDiq36+siQ6Dfo3jn6P36uNwoWNRq5uxE0dhKEHtbbROeZoFvT78eG5vvb6Mo+v
	 zalyiQF9eBElQ==
Date: Mon, 22 Apr 2024 08:39:07 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: David Airlie <airlied@gmail.com>, linux-pwm@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabien Parent <fparent@baylibre.com>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Stephen Boyd <sboyd@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Daniel Vetter <daniel@ffwll.ch>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 07/17] dt-bindings: display: mediatek: dpi: add
 compatible for MT8365
Message-ID: <171379313275.1132930.2620391532022388821.robh@kernel.org>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
 <20231023-display-support-v3-7-53388f3ed34b@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v3-7-53388f3ed34b@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_063914_579577_4AAA14BD 
X-CRM114-Status: UNSURE (   8.20  )
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


On Thu, 18 Apr 2024 16:16:55 +0200, Alexandre Mergnat wrote:
> Add dt-binding documentation of dpi for MediaTek MT8365 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


