Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7FBC52D6F
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Aug 2024 17:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1c5e2Ex49sHdKU+4hS5QgerxvND/tgVpoGjjTlEbXdw=; b=WW/csth1S5KirbWnBFlihKHZYq
	3EFxbVzNCR9+kJ/cXlDrragswB4/x2GpWVTwgT40zsBYxdS3TtyxAyqT0rnF1zipV9yllhpVHEKDf
	vptkqMmieWTi94RYwCavcgnu7M+hXSXxjkrCOJsiG7OnTp5SkKykUokLJ6L0fLvHrzGZLPrsLvyhD
	hAY5f5fvZvFJXrIdQn9icW8tBBMoUG2Ab3ldzF9xA1WO5UzT0ZnY7jeMSPoynOs3kVr52J8p1gEV/
	1JNkIx0M3l5D/KYADzih3kjHP5OYNqGEl97WMurHW8Rec67pgsGG/4C7eXpZSbSSe40fBE7rLJpoQ
	V56PYA/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg6AD-00000002PIH-3kwE;
	Mon, 19 Aug 2024 17:27:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5ym-00000002MSv-2MtN;
	Mon, 19 Aug 2024 17:15:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D55C760C75;
	Mon, 19 Aug 2024 17:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D107C32782;
	Mon, 19 Aug 2024 17:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724087739;
	bh=61Y0JjUridhLs7Vgbb05RwyRB6WTgz2K5OLWGX6IuHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H/pWKgzmPUvBqH6DEtRkj1w1uytDvL2lfIHTUcKfoyg+iyjxrUe8pGYuqUtJT0h5Z
	 Ld3SBO/ViehEbNaPZS1I5bmn91vxQk/BHCB2KKY213plRi28BO2j1WHJ5jSp5lx2gD
	 02AZA+okholOShsiZoyy7yf1HFASsGRmrQ9BrRb1DXJqqMUxxoKqkiESrZ7u8EraZs
	 WuHM2kV4KeV5tix/aNCRdHb4xUUTuRgInFIjoH1hw9fT9Sj7QAmBzhQSOSEjZZrgfw
	 YFaq1RYHaz4wQfLPENhRi1SsoRl+wRi61jydSC3iSTyYmZGw8lsFqgDDTIA3ZeJ+Da
	 DwkLj0Smfi9/w==
Date: Mon, 19 Aug 2024 11:15:37 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sergey Shtylyov <s.shtylyov@omp.ru>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next 3/4] dt-bindings: net: renesas,etheravb: add
 top-level constraints
Message-ID: <172408773694.1700045.800574322458120654.robh@kernel.org>
References: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>
 <20240818172905.121829-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240818172905.121829-3-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_101540_702546_10B6C6FF 
X-CRM114-Status: UNSURE (   9.49  )
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


On Sun, 18 Aug 2024 19:29:04 +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for reg, clocks, clock-names, interrupts and interrupt-names.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/net/renesas,etheravb.yaml        | 29 ++++++++++++-------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


