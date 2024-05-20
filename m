Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804CDC25B77
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 21:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5cwA65xIfPBFZHuMLcT2FnNLcdwE5ZjeTD595q1+M6k=; b=ed7APmRaG+18RZW6VDBAMdikPz
	uzgB7Om7ygt4BOzpxLZhWjZoJZa4IGUNo903kSKWzdFQrRQP9iQ1xKn3CuvG4zWthwtVYG0+egoIl
	7cfqtxYaTxbx5jK3Re9fgDeS8LNLQoPTVRbV+LiCyZXxDAorbW1HpS5X1rkW7gruFHE/KHt0Egwbo
	0UqtB0AV/aAEqnA7Kaw0j0FC9gjcPTvlNgxi5FneAQCO6rtaywazujdZzNWkIcxpQ1vg8oWrLNZuz
	U+nV752KDUegqv35DXktoavy6fCHKXeAi0ksWy3/RLeChLUxXg64b6NefbC65sTg8IBGoGfBfLlb5
	P/rzw1Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ADH-0000000FYJo-0Etk;
	Mon, 20 May 2024 21:06:31 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ADC-0000000FYHY-2Rth;
	Mon, 20 May 2024 21:06:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 69BBFCE0BD3;
	Mon, 20 May 2024 21:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E099C2BD10;
	Mon, 20 May 2024 21:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716239181;
	bh=X6Yvl2HDN1mwWgAijkjfXODat3krxuLgb+ypTVFjGv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EY+wyvYKPs8iGaPysYr7Et988UMSXiwI419njQKsmPThaJp3i+bwsK0gM1n3tBUkB
	 osmpByAYYVNe54/ioOCak1Lp7AvjpuVoNYhNZcFYn+SMDJQI1oKJkEnUsexNdOJQwc
	 qZ3AblTs96k6TCOErZT9GOfAU54MpoJcrdK18Wv9WaCz/cAjEKlvsn6mrL43d5NE09
	 PmiP5kyGdcupvO58nw69rxigTy/H6mQOesNK6zfogwSbcOxjN8X7q9dA5VabLSq/b7
	 fDIjfZIFnMwdFg8wMX2IVbuyIvkGnLgKqYEMr5vQuuKhuBDF28ZVWve74ryr1bvmNo
	 znWOeHo8UqtlA==
Date: Mon, 20 May 2024 16:06:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Nishanth Menon <nm@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-arm-kernel@lists.infradead.org,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	linux-kernel@vger.kernel.org,
	Lars Povlsen <lars.povlsen@microchip.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	UNGLinuxDriver@microchip.com, linux-mediatek@lists.infradead.org,
	Daniel Machon <daniel.machon@microchip.com>,
	Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 2/8] dt-bindings: soc: sprd: sc9863a-glbregs: Document
 SC9863A syscon
Message-ID: <171623917700.1507883.13414727469852068344.robh@kernel.org>
References: <20240519-dt-bindings-mfd-syscon-split-v1-0-aaf996e2313a@linaro.org>
 <20240519-dt-bindings-mfd-syscon-split-v1-2-aaf996e2313a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240519-dt-bindings-mfd-syscon-split-v1-2-aaf996e2313a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_140626_876927_1064EC2B 
X-CRM114-Status: UNSURE (   8.57  )
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


On Sun, 19 May 2024 20:42:17 +0200, Krzysztof Kozlowski wrote:
> Document sprd,sc9863a-glbregs compatible already used in DTS and other
> bindings example.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/soc/sprd/sprd,sc9863a-glbregs.yaml    | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


