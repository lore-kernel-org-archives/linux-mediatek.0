Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF3BC3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 19:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x++DWFWe8TS8FFmql2+e3J46YR6D57ZTFoc3LTUBZOU=; b=sQF6hL9uXgFHQ4kjp9T3mKj6Dy
	F0ea22no0cw+c+9YekUudj8YXkLU8GbGP6bmAoSU8MTfa5zrVMr/Gy5Zegy2r6O2AtNQP8yxoFZsw
	7bVAP96CohbpJW1u7qhLk7Su+awLk7IPK4k40eSSrfXNmB0GEQMDQCwLY+6mhnX3SJD9o87P0l9pS
	Kjao4GMHhnsX5gJb/Qn9CwNXFlqm8z9fYeZwNPS+ZDTnhVyek86Y5L913bUuuFEoJExGnoSmtwINH
	sii6LI7CrnVXaZ+zi5fjXEO+xGreh+7kXwJwlT2+6gQhLqT9a6vW9KMJ2aI+AHheTAiksEygDc2vN
	kyHzpFDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYsgG-0000000GIsS-35mI;
	Tue, 30 Jul 2024 19:38:44 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYsfo-0000000GInD-2LRw;
	Tue, 30 Jul 2024 19:38:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9529DCE111D;
	Tue, 30 Jul 2024 19:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81FADC4AF0A;
	Tue, 30 Jul 2024 19:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722368293;
	bh=1Q3oYDiFwiET51QQHldopTOPb7rykWbwFZNGKpQ8i2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b5SNfnZWVKNhTbqkDx8vzpcjMhB1J8B0pmubW1Ic5UpwesI+PoYUgdb6lHpjZ3ovN
	 8G4sbzmEGw6Fa9pDq3kEk5ykliyFEgJhdzoUBp3N8cbxUmwBGcL237rdlZ+iON7U7d
	 go9TrVciOn6kRgo+MNe/t1BAhpD8YI72Beyl8toTfQ0475Rea3PRxXxi4Uc+msrn9D
	 qOjJM+06Fn7BOkE3EFuQ+MBXdr963OkncsOU61vh99Np3ucn+hTmvQt35e4w4nskUt
	 fm0e560NO6rtQ+/Dr0IPH5B/Oj+YW3cNAqBFXiS83UkP2WbhD5NEg+j44S56ix13V+
	 mhidA5T1hWglA==
Date: Tue, 30 Jul 2024 13:38:12 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andy Hsieh <andy.hsieh@mediatek.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Phi-Bang Nguyen <pnguyen@baylibre.com>,
	Louis Kuo <louis.kuo@mediatek.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v6 1/5] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
Message-ID: <172236829078.2026749.11343043764808466079.robh@kernel.org>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
 <20240729-add-mtk-isp-3-0-support-v6-1-c374c9e0c672@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729-add-mtk-isp-3-0-support-v6-1-c374c9e0c672@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_123816_780584_4E1C82F6 
X-CRM114-Status: GOOD (  10.44  )
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


On Mon, 29 Jul 2024 16:48:00 +0200, Julien Stephan wrote:
> From: Louis Kuo <louis.kuo@mediatek.com>
> 
> This adds the bindings, for the mediatek ISP3.0 SENINF module embedded in
> some Mediatek SoC, such as the mt8365
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> Signed-off-by: Phi-Bang Nguyen <pnguyen@baylibre.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../bindings/media/mediatek,mt8365-seninf.yaml     | 259 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 266 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


